Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA0972BEC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 21:07:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0JL78rD014292
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Jan 2015 13:07:09 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 19 Jan 2015 13:07:08 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Jan 2015 13:07:08 -0800
Message-ID: <1421701628-14864-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/1] python-lxml: move to version 3.2.5
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
X-List-Received-Date: Mon, 19 Jan 2015 21:07:09 -0000
Content-Type: text/plain

Remove version 3.0.2.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../python-lxml-3.2.5-fix-CVE-2014-3146.patch      |   91 ++++++++++++++++++++
 .../{python-lxml_3.0.2.bb => python-lxml_3.2.5.bb} |    8 +-
 2 files changed, 96 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-lxml/python-lxml-3.2.5-fix-CVE-2014-3146.patch
 rename meta-python/recipes-devtools/python/{python-lxml_3.0.2.bb => python-lxml_3.2.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python-lxml/python-lxml-3.2.5-fix-CVE-2014-3146.patch b/meta-python/recipes-devtools/python/python-lxml/python-lxml-3.2.5-fix-CVE-2014-3146.patch
new file mode 100644
index 0000000..0a8e211
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-lxml/python-lxml-3.2.5-fix-CVE-2014-3146.patch
@@ -0,0 +1,91 @@
+Upstream-status:Backport
+
+--- a/src/lxml/html/clean.py
++++ b/src/lxml/html/clean.py
+@@ -70,9 +70,10 @@ _css_import_re = re.compile(
+ 
+ # All kinds of schemes besides just javascript: that can cause
+ # execution:
+-_javascript_scheme_re = re.compile(
+-    r'\s*(?:javascript|jscript|livescript|vbscript|data|about|mocha):', re.I)
+-_substitute_whitespace = re.compile(r'\s+').sub
++_is_javascript_scheme = re.compile(
++    r'(?:javascript|jscript|livescript|vbscript|data|about|mocha):',
++    re.I).search
++_substitute_whitespace = re.compile(r'[\s\x00-\x08\x0B\x0C\x0E-\x19]+').sub
+ # FIXME: should data: be blocked?
+ 
+ # FIXME: check against: http://msdn2.microsoft.com/en-us/library/ms537512.aspx
+@@ -467,7 +468,7 @@ class Cleaner(object):
+     def _remove_javascript_link(self, link):
+         # links like "j a v a s c r i p t:" might be interpreted in IE
+         new = _substitute_whitespace('', link)
+-        if _javascript_scheme_re.search(new):
++        if _is_javascript_scheme(new):
+             # FIXME: should this be None to delete?
+             return ''
+         return link
+--- a/src/lxml/html/tests/test_clean.txt
++++ b/src/lxml/html/tests/test_clean.txt
+@@ -1,3 +1,4 @@
++>>> import re
+ >>> from lxml.html import fromstring, tostring
+ >>> from lxml.html.clean import clean, clean_html, Cleaner
+ >>> from lxml.html import usedoctest
+@@ -17,6 +18,7 @@
+ ...   <body onload="evil_function()">
+ ...     <!-- I am interpreted for EVIL! -->
+ ...     <a href="javascript:evil_function()">a link</a>
++...     <a href="j\x01a\x02v\x03a\x04s\x05c\x06r\x07i\x0Ep t:evil_function()">a control char link</a>
+ ...     <a href="data:text/html;base64,PHNjcmlwdD5hbGVydCgidGVzdCIpOzwvc2NyaXB0Pg==">data</a>
+ ...     <a href="#" onclick="evil_function()">another link</a>
+ ...     <p onclick="evil_function()">a paragraph</p>
+@@ -33,7 +35,7 @@
+ ...   </body>
+ ... </html>'''
+ 
+->>> print(doc)
++>>> print(re.sub('[\x00-\x07\x0E]', '', doc))
+ <html>
+   <head>
+     <script type="text/javascript" src="evil-site"></script>
+@@ -49,6 +51,7 @@
+   <body onload="evil_function()">
+     <!-- I am interpreted for EVIL! -->
+     <a href="javascript:evil_function()">a link</a>
++    <a href="javascrip t:evil_function()">a control char link</a>
+     <a href="data:text/html;base64,PHNjcmlwdD5hbGVydCgidGVzdCIpOzwvc2NyaXB0Pg==">data</a>
+     <a href="#" onclick="evil_function()">another link</a>
+     <p onclick="evil_function()">a paragraph</p>
+@@ -81,6 +84,7 @@
+   <body onload="evil_function()">
+     <!-- I am interpreted for EVIL! -->
+     <a href="javascript:evil_function()">a link</a>
++    <a href="javascrip%20t:evil_function()">a control char link</a>
+     <a href="data:text/html;base64,PHNjcmlwdD5hbGVydCgidGVzdCIpOzwvc2NyaXB0Pg==">data</a>
+     <a href="#" onclick="evil_function()">another link</a>
+     <p onclick="evil_function()">a paragraph</p>
+@@ -104,6 +108,7 @@
+   </head>
+   <body>
+     <a href="">a link</a>
++    <a href="">a control char link</a>
+     <a href="">data</a>
+     <a href="#">another link</a>
+     <p>a paragraph</p>
+@@ -123,6 +128,7 @@
+   </head>
+   <body>
+     <a href="">a link</a>
++    <a href="">a control char link</a>
+     <a href="">data</a>
+     <a href="#">another link</a>
+     <p>a paragraph</p>
+@@ -146,6 +152,7 @@
+   </head>
+   <body>
+     <a href="">a link</a>
++    <a href="">a control char link</a> 
+     <a href="">data</a>
+     <a href="#">another link</a>
+     <p>a paragraph</p>
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.0.2.bb b/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
index 5ab7b4a..1fa2889 100644
--- a/meta-python/recipes-devtools/python/python-lxml_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python-lxml_3.2.5.bb
@@ -8,9 +8,11 @@ SRCNAME = "lxml"
 
 DEPENDS = "libxml2 libxslt"
 
-SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=lxml"
-SRC_URI[lxml.md5sum] = "38b15b0dd5e9292cf98be800e84a3ce4"
-SRC_URI[lxml.sha256sum] = "cadba4cf0e235127795f76a6f7092cb035da23a6e9ec4c93f8af43a6784cd101"
+SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+		file://python-lxml-3.2.5-fix-CVE-2014-3146.patch "
+
+SRC_URI[md5sum] = "6c4fb9b1840631cff09b8229a12a9ef7"
+SRC_URI[sha256sum] = "2bf072808a6546d0e56bf1ad3b98a43cca828724360d7419fad135141bd31f7e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
1.7.9.5


