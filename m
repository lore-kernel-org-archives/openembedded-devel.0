Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id BD505722FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:41 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fb1so10029802pad.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=u2dpUmilpklNdgZ3BDSd0YVNRratP2zqcC0shFKe3r0=;
	b=iLfNLGJlo9P4DfckECFDvVPOWkNv9uid0WuKp5Ub1LvUmokvU8ZSDY792yXDuzes/+
	4ZKfAb31nbRTMO64T7RgJIts0/wx6mA8jbKZlLv7BNLrjZufvbljfXL7vftMxajuThmv
	qgvQowoXeIPi1kS5oxqJBvhyEfFekNBcxmxOfddJDxWnw7BhplhBlGV26uMBWnV++fqO
	otNQoGY1yf41YVusLvMyzfrw8ptxS52E+aSSXQ7afs+EzsR/N0g9vXh2ox2WgVoXqg56
	2qdK3tgOdOJwa7M+X1uyzENCEOMXHM5/Ccm5sgrNQe0tyG3j/wTk8LuZ369Up898RvXc
	Vzyw==
X-Received: by 10.68.65.16 with SMTP id t16mr94359071pbs.70.1417395882517;
	Sun, 30 Nov 2014 17:04:42 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:12 -0800
Message-Id: <d3c6b61d85f231f389abe43f5b44a058073d0159.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [PATCH 10/15] libyaml: add fix for CVE-2014-2525 Security Advisory
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
X-List-Received-Date: Mon, 01 Dec 2014 01:04:41 -0000

From: Kang Kai <kai.kang@windriver.com>

Heap-based buffer overflow in the yaml_parser_scan_uri_escapes function
in LibYAML before 0.1.6 allows context-dependent attackers to execute
arbitrary code via a long sequence of percent-encoded characters in a
URI in a YAML file.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2525

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


