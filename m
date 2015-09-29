Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id D253076FED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 23:22:03 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8TNM4Eg026749 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2015 18:22:04 -0500
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092918220403-752698 ;
	Tue, 29 Sep 2015 18:22:04 -0500 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2015 18:22:02 -0500
Message-Id: <1443568922-16315-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/29/2015 06:22:04 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/29/2015 06:22:04 PM,
	Serialize complete at 09/29/2015 06:22:04 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-29_14:, , signatures=0
Subject: [meta-oe][PATCH 1/1] tornado: upgrade to 4.2.1
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
X-List-Received-Date: Tue, 29 Sep 2015 23:22:08 -0000

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 .../python/python-tornado_4.0.2.bb                 | 34 ----------------------
 .../python/python-tornado_4.2.1.bb                 | 34 ++++++++++++++++++++++
 2 files changed, 34 insertions(+), 34 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-tornado_4.0.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python-tornado_4.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-tornado_4.0.2.bb b/meta-python/recipes-devtools/python/python-tornado_4.0.2.bb
deleted file mode 100644
index f1b8141..0000000
--- a/meta-python/recipes-devtools/python/python-tornado_4.0.2.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
-DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
-By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
-polling, WebSockets, and other applications that require a long-lived connection to each user."
-HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=5208df23820f490f691712a654be256d"
-
-SRCNAME = "tornado"
-
-SRC_URI = " \
-    https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-"
-SRC_URI[md5sum] = "985c0e704b765c33a6193d49d1935588"
-SRC_URI[sha256sum] = "900c5124ebdb6598ca8e8a0c5888f41a5f14117952d5515258e3d20222b21bfa"
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-compression python-numbers python-email python-subprocess \
-                   python-pkgutil python-html python-json python-backports-ssl python-certifi"
-
-RDEPENDS_${PN}-test += "${PN} python-unittest"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-PACKAGES =+ "\
-    ${PN}-test \
-"
-
-FILES_${PN}-test = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/test \
-    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/testing.py* \
-"
diff --git a/meta-python/recipes-devtools/python/python-tornado_4.2.1.bb b/meta-python/recipes-devtools/python/python-tornado_4.2.1.bb
new file mode 100644
index 0000000..4580b34
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tornado_4.2.1.bb
@@ -0,0 +1,34 @@
+SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
+DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
+By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
+polling, WebSockets, and other applications that require a long-lived connection to each user."
+HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=c7dc99d243c4004087229f84f6b46828"
+
+SRCNAME = "tornado"
+
+SRC_URI = " \
+    https://pypi.python.org/packages/source/t/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "d523204389cfb70121bb69709f551b20"
+SRC_URI[sha256sum] = "a16fcdc4f76b184cb82f4f9eaeeacef6113b524b26a2cb331222e4a7fa6f2969"
+
+inherit setuptools
+
+RDEPENDS_${PN} += "python-compression python-numbers python-email python-subprocess \
+                   python-pkgutil python-html python-json python-backports-ssl python-certifi"
+
+RDEPENDS_${PN}-test += "${PN} python-unittest"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+PACKAGES =+ "\
+    ${PN}-test \
+"
+
+FILES_${PN}-test = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/test \
+    ${libdir}/${PYTHON_DIR}/site-packages/${SRCNAME}/testing.py* \
+"
-- 
1.9.1


