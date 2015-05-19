Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10D4073222
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 03:28:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4J3SicQ029428
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 20:28:44 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 18 May 2015 20:28:44 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 May 2015 11:26:33 +0800
Message-ID: <1432005994-32642-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-oe] libyaml: update from 0.1.5 to 0.1.6
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
X-List-Received-Date: Tue, 19 May 2015 03:28:45 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

removed patch:
- libyaml-CVE-2014-2525.patch (included by 0.1.6)

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../libyaml/files/libyaml-CVE-2014-2525.patch      | 42 ----------------------
 meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb   | 21 -----------
 meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb   | 20 +++++++++++
 3 files changed, 20 insertions(+), 63 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch
 delete mode 100644 meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
 create mode 100644 meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb

diff --git a/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch b/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch
deleted file mode 100644
index 2fdcba3..0000000
--- a/meta-oe/recipes-support/libyaml/files/libyaml-CVE-2014-2525.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Heap-based buffer overflow in the yaml_parser_scan_uri_escapes function
-in LibYAML before 0.1.6 allows context-dependent attackers to execute
-arbitrary code via a long sequence of percent-encoded characters in a
-URI in a YAML file.
-
-Upstream-Status: Backport
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/src/scanner.c.old b/src/scanner.c
-index a2e8619..c6cde3b 100644
---- a/src/scanner.c.old
-+++ b/src/scanner.c
-@@ -2619,6 +2619,9 @@ yaml_parser_scan_tag_uri(yaml_parser_t *parser, int directive,
-         /* Check if it is a URI-escape sequence. */
- 
-         if (CHECK(parser->buffer, '%')) {
-+            if (!STRING_EXTEND(parser, string))
-+                goto error;
-+
-             if (!yaml_parser_scan_uri_escapes(parser,
-                         directive, start_mark, &string)) goto error;
-         }
-diff --git a/src/yaml_private.h.old b/src/yaml_private.h
-index ed5ea66..d72acb4 100644
---- a/src/yaml_private.h.old
-+++ b/src/yaml_private.h
-@@ -132,9 +132,12 @@ yaml_string_join(
-      (string).start = (string).pointer = (string).end = 0)
- 
- #define STRING_EXTEND(context,string)                                           \
--    (((string).pointer+5 < (string).end)                                        \
-+    ((((string).pointer+5 < (string).end)                                       \
-         || yaml_string_extend(&(string).start,                                  \
--            &(string).pointer, &(string).end))
-+            &(string).pointer, &(string).end)) ?                                \
-+         1 :                                                                    \
-+        ((context)->error = YAML_MEMORY_ERROR,                                  \
-+         0))
- 
- #define CLEAR(context,string)                                                   \
-     ((string).pointer = (string).start,                                         \
diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
deleted file mode 100644
index 1279541..0000000
--- a/meta-oe/recipes-support/libyaml/libyaml_0.1.5.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
-DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
-a human-readable data serialization format. "
-HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
-SECTION = "libs/devel"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
-
-SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
-           file://libyaml-CVE-2014-2525.patch \
-          "
-
-SRC_URI[md5sum] = "24f6093c1e840ca5df2eb09291a1dbf1"
-SRC_URI[sha256sum] = "fa87ee8fb7b936ec04457bc044cd561155e1000a4d25029867752e543c2d3bef"
-
-S = "${WORKDIR}/yaml-${PV}"
-
-inherit autotools
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb b/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb
new file mode 100644
index 0000000..8a624f7
--- /dev/null
+++ b/meta-oe/recipes-support/libyaml/libyaml_0.1.6.bb
@@ -0,0 +1,20 @@
+SUMMARY = "LibYAML is a YAML 1.1 parser and emitter written in C."
+DESCRIPTION = "LibYAML is a C library for parsing and emitting data in YAML 1.1, \
+a human-readable data serialization format. "
+HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
+SECTION = "libs/devel"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+
+SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
+          "
+
+SRC_URI[md5sum] = "5fe00cda18ca5daeb43762b80c38e06e"
+SRC_URI[sha256sum] = "7da6971b4bd08a986dd2a61353bc422362bd0edcc67d7ebaac68c95f74182749"
+
+S = "${WORKDIR}/yaml-${PV}"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


