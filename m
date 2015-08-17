Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E241D75D4F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 05:25:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99704873"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Aug 2015 13:28:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7H5Pbnq031427
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 13:25:37 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 17 Aug 2015 13:25:38 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Aug 2015 13:25:22 +0800
Message-ID: <1439789122-1631-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-python][PATCH] python-lxml: upgrade 3.2.5 -> 3.4.4
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
X-List-Received-Date: Mon, 17 Aug 2015 05:25:47 -0000
Content-Type: text/plain

* Dropped backported python-lxml-3.2.5-fix-CVE-2014-3146.patch
* Modify DISTUTILS_INSTALL_ARGS to avoid errors in the step of do_install
  | ValueError: invalid literal for int() with base 10:
    '--should-not-have-used-/usr/bin/xml2-config'
  | ERROR: python setup.py install execution failed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../python-lxml-3.2.5-fix-CVE-2014-3146.patch      | 91 ----------------------
 .../{python-lxml_3.2.5.bb => python-lxml_3.4.4.bb} |  9 +--
 2 files changed, 4 insertions(+), 96 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-lxml/python-lxml-3.2.5-fix-CVE-2014-3146.patch
 rename meta-python/recipes-devtools/python/{python-lxml_3.2.5.bb => python-lxml_3.4.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python-lxml/python-lxml-3.2.5-fix-CVE-2014-3146.patch b/meta-python/recipes-devtools/python/python-lxml/python-lxml-3.2.5-fix-CVE-2014-3146.patch
deleted file mode 100644
index 0a8e211..0000000
--- a/meta-python/recipes-devtools/python/python-lxml/python-lxml-3.2.5-fix-CVE-2014-3146.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-Upstream-status:Backport
-
---- a/src/lxml/html/clean.py
-+++ b/src/lxml/html/clean.py
-@@ -70,9 +70,10 @@ _css_import_re = re.compile(
- 
- # All kinds of schemes besides just javascript: that can cause
- # execution:
--_javascript_scheme_re = re.compile(
--    r'\s*(?:javascript|jscript|livescript|vbscript|data|about|mocha):', re.I)
--_substitute_whitespace = re.compile(r'\s+').sub
-+_is_javascript_scheme = re.compile(
-+    r'(?:javascript|jscript|livescript|vbscript|data|about|mocha):',
-+    re.I).search
-+_substitute_whitespace = re.compile(r'[\s\x00-\x08\x0B\x0C\x0E-\x19]+').sub
- # FIXME: should data: be blocked?
- 
- # FIXME: check against: http://msdn2.microsoft.com/en-us/library/ms537512.aspx
-@@ -467,7 +468,7 @@ class Cleaner(object):
-     def _remove_javascript_link(self, link):
-         # links like "j a v a s c r i p t:" might be interpreted in IE
-         new = _substitute_whitespace('', link)
--        if _javascript_scheme_re.search(new):
-+        if _is_javascript_scheme(new):
-             # FIXME: should this be None to delete?
-             return ''
-         return link
---- a/src/lxml/html/tests/test_clean.txt
-+++ b/src/lxml/html/tests/test_clean.txt
-@@ -1,3 +1,4 @@
-+>>> import re
- >>> from lxml.html import fromstring, tostring
- >>> from lxml.html.clean import clean, clean_html, Cleaner
- >>> from lxml.html import usedoctest
-@@ -17,6 +18,7 @@
- ...   <body onload="evil_function()">
- ...     <!-- I am interpreted for EVIL! -->
- ...     <a href="javascript:evil_function()">a link</a>
-+...     <a href="j\x01a\x02v\x03a\x04s\x05c\x06r\x07i\x0Ep t:evil_function()">a control char link</a>
- ...     <a href="data:text/html;base64,PHNjcmlwdD5hbGVydCgidGVzdCIpOzwvc2NyaXB0Pg==">data</a>
- ...     <a href="#" onclick="evil_function()">another link</a>
- ...     <p onclick="evil_function()">a paragraph</p>
-@@ -33,7 +35,7 @@
- ...   </body>
- ... </html>'''
- 
-->>> print(doc)
-+>>> print(re.sub('[\x00-\x07\x0E]', '', doc))
- <html>
-   <head>
-     <script type="text/javascript" src="evil-site"></script>
-@@ -49,6 +51,7 @@
-   <body onload="evil_function()">
-     <!-- I am interpreted for EVIL! -->
-     <a href="javascript:evil_function()">a link</a>
-+    <a href="javascrip t:evil_function()">a control char link</a>
-     <a href="data:text/html;base64,PHNjcmlwdD5hbGVydCgidGVzdCIpOzwvc2NyaXB0Pg==">data</a>
-     <a href="#" onclick="evil_function()">another link</a>
-     <p onclick="evil_function()">a paragraph</p>
-@@ -81,6 +84,7 @@
-   <body onload="evil_function()">
-     <!-- I am interpreted for EVIL! -->
-     <a href="javascript:evil_function()">a link</a>
-+    <a href="javascrip%20t:evil_function()">a control char link</a>
-     <a href="data:text/html;base64,PHNjcmlwdD5hbGVydCgidGVzdCIpOzwvc2NyaXB0Pg==">data</a>
-     <a href="#" onclick="evil_function()">another link</a>
-     <p onclick="evil_function()">a paragraph</p>
-@@ -104,6 +108,7 @@
-   </head>
-   <body>
-     <a href="">a link</a>
-+    <a href="">a control char link</a>
-     <a href="">data</a>
-     <a href="#">another link</a>
-     <p>a paragraph</p>
-@@ -123,6 +128,7 @@
-   </head>
-   <body>
-     <a href="">a link</a>
-+    <a href="">a control char link</a>
-     <a href="">data</a>
-     <a href="#">another link</a>
-     <p>a paragraph</p>
-@@ -146,6 +152,7 @@
-   </head>
-   <body>
-     <a href="">a link</a>
-+    <a href="">a control char link</a> 
-     <a href="">data</a>
-     <a href="#">another link</a>
-     <p>a paragraph</p>
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb b/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
index 68e3677..2480e4d 100644
--- a/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
+++ b/meta-python/recipes-devtools/python/python-lxml_3.4.4.bb
@@ -8,11 +8,10 @@ SRCNAME = "lxml"
 
 DEPENDS = "libxml2 libxslt"
 
-SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-		file://python-lxml-3.2.5-fix-CVE-2014-3146.patch "
+SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6c4fb9b1840631cff09b8229a12a9ef7"
-SRC_URI[sha256sum] = "2bf072808a6546d0e56bf1ad3b98a43cca828724360d7419fad135141bd31f7e"
+SRC_URI[md5sum] = "a9a65972afc173ec7a39c585f4eea69c"
+SRC_URI[sha256sum] = "b3d362bac471172747cda3513238f115cbd6c5f8b8e6319bf6a97a7892724099"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -25,7 +24,7 @@ DISTUTILS_BUILD_ARGS += " \
 
 DISTUTILS_INSTALL_ARGS += " \
                      --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
-                     --with-xml2-config='${STAGING_BINDIR_CROSS}/xml2-config' \
+                     --with-xml2-config='${STAGING_BINDIR_CROSS}/pkg-config libxml2' \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.4.2


