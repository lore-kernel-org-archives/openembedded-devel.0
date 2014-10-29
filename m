Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB7A706D9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 00:34:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9T0YTQr017308
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Oct 2014 17:34:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 28 Oct 2014 17:34:29 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <otavio@ossystems.com.br>
Date: Wed, 29 Oct 2014 08:30:59 +0800
Message-ID: <1414542659-15721-9-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414542659-15721-1-git-send-email-kai.kang@windriver.com>
References: <1414542659-15721-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: Yue.Tao@windriver.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 8/8] libyaml: add fix for CVE-2014-2525 Security Advisory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Oct 2014 00:34:29 -0000
Content-Type: text/plain

Heap-based buffer overflow in the yaml_parser_scan_uri_escapes function
in LibYAML before 0.1.6 allows context-dependent attackers to execute
arbitrary code via a long sequence of percent-encoded characters in a
URI in a YAML file.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2525

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libyaml/files/libyaml-CVE-2014-2525.patch      | 42 ++++++++++++++++++++++
 meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb   |  4 ++-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch

diff --git a/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch b/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch
new file mode 100644
index 0000000..2fdcba3
--- /dev/null
+++ b/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch
@@ -0,0 +1,42 @@
+Heap-based buffer overflow in the yaml_parser_scan_uri_escapes function
+in LibYAML before 0.1.6 allows context-dependent attackers to execute
+arbitrary code via a long sequence of percent-encoded characters in a
+URI in a YAML file.
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/src/scanner.c.old b/src/scanner.c
+index a2e8619..c6cde3b 100644
+--- a/src/scanner.c.old
++++ b/src/scanner.c
+@@ -2619,6 +2619,9 @@ yaml_parser_scan_tag_uri(yaml_parser_t *parser, int directive,
+         /* Check if it is a URI-escape sequence. */
+ 
+         if (CHECK(parser->buffer, '%')) {
++            if (!STRING_EXTEND(parser, string))
++                goto error;
++
+             if (!yaml_parser_scan_uri_escapes(parser,
+                         directive, start_mark, &string)) goto error;
+         }
+diff --git a/src/yaml_private.h.old b/src/yaml_private.h
+index ed5ea66..d72acb4 100644
+--- a/src/yaml_private.h.old
++++ b/src/yaml_private.h
+@@ -132,9 +132,12 @@ yaml_string_join(
+      (string).start = (string).pointer = (string).end = 0)
+ 
+ #define STRING_EXTEND(context,string)                                           \
+-    (((string).pointer+5 < (string).end)                                        \
++    ((((string).pointer+5 < (string).end)                                       \
+         || yaml_string_extend(&(string).start,                                  \
+-            &(string).pointer, &(string).end))
++            &(string).pointer, &(string).end)) ?                                \
++         1 :                                                                    \
++        ((context)->error = YAML_MEMORY_ERROR,                                  \
++         0))
+ 
+ #define CLEAR(context,string)                                                   \
+     ((string).pointer = (string).start,                                         \
diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
index c44eda4..1279541 100644
--- a/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
+++ b/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
@@ -7,7 +7,9 @@ SECTION = "libs/devel"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
 
-SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+           file://libyaml-CVE-2014-2525.patch \
+          "
 
 SRC_URI[md5sum] = "24f6093c1e840ca5df2eb09291a1dbf1"
 SRC_URI[sha256sum] = "fa87ee8fb7b936ec04457bc044cd561155e1000a4d25029867752e543c2d3bef"
-- 
1.9.1


