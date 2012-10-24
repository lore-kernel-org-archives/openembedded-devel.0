Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRB00-0005AM-QG
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:08:36 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so930618wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=K396gmD/9YaUwXAJhwEaxvzapJXXOixe6KxHmEbHuaw=;
	b=THitXEIm/Yu5iZ7qg6Go2ll1i8gx6ostf7dBgKkYk8iySpU5w1EaiYcqtRMU1lj5Vk
	OhWdBfHw8EH/AzGxs8V3IRR6VSRB896bMpiJWW+jy2kI/t5BHh4aYLmCjyku8tQOjaSc
	oCD/nfCbgc7hGOhqQ1woWAlZZxL6hauSHgSrOiiJzPUaHdgv+xnH0KeJB859e9XMORVg
	qZCumwOZsZd9aZ2eR/5hlg65kmY3WNp1x67KNJ1wHYd+0LGOJXr66IP4HVrckwyS/42T
	TF2NeYTYAz7x+GOgCxZ2Ps2Ng708yuQd4n4kiBAzeOe0UZ5JhRUKhogk8TtTlJRyehVd
	+vjA==
Received: by 10.180.90.201 with SMTP id by9mr6007195wib.5.1351122911128;
	Wed, 24 Oct 2012 16:55:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id az2sm6963537wib.10.2012.10.24.16.55.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:55:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:29 +0200
Message-Id: <aed8dd11206928592383ac402c2e2bf7e73a2d08.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 8/8] python-pyqt: don't bypass sstate with sip files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2012 00:08:36 -0000

* discovered with http://patchwork.openembedded.org/patch/38521/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
index 5eef4c9..e248fbb 100644
--- a/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.9.5.bb
@@ -15,6 +15,7 @@ DEPENDS = "sip-native python-sip"
 RDEPENDS_${PN} = "python-core"
 
 PYQT_OE_VERSION = "Qt_4_8_3"
+PR = "r1"
 
 SRC_URI = "\
   ${SOURCEFORGE_MIRROR}/pyqt/PyQt-x11-gpl-${PV}.tar.gz \
@@ -88,22 +89,15 @@ do_configure_prepend() {
 
 do_install() {
     install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4
+    install -d ${D}${datadir}/sip/qt/
     for module in ${SIP_MODULES}
     do
+        install -m 0644 ${S}/sip/${module}/*.sip ${D}${datadir}/sip/qt/
         echo "from PyQt4.${module} import *\n" >> ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/Qt.py
         install -m 0755 ${module}/lib${module}.so ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/${module}.so
     done
     cp -pPR elementtree ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
     cp __init__.py ${D}${libdir}/${PYTHON_DIR}/site-packages/PyQt4/
-
-    install -d ${STAGING_SIPDIR}/qt/
-    install -d ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages
-    for module in ${SIP_MODULES}
-    do
-        install -m 0644 ${S}/sip/${module}/*.sip ${STAGING_SIPDIR}/qt/
-        install -m 0755 ${module}/lib${module}.so ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/${module}.so
-    done
 }
 
-FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages"
-
+FILES_${PN} = "${libdir}/${PYTHON_DIR}/site-packages ${datadir}/sip/qt/"
-- 
1.7.12.4



