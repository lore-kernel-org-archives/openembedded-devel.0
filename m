Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiER4-0007Rl-Mk
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 02:15:14 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1930131eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 17:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fm/TaiCXeYTo+Cr5XQ2P93qavPIXp7P3G/bA2+cQk6E=;
	b=jFmX2fN3KhCxmvzKHdFWHZlV1v/8Wi7/+7NzXGQQIzaT19A/E2hiW7TU2oEffOJ1my
	E0V4c+2Zb9ADPxQF0tu74vV1zErXlCzResNt+iay+xDxu8A7uTaeVJzew9Kf2CN8wY9x
	PuXdMWa8ma5XjSjYaRnL8cLfQ6YjZWq9Yoncw6Tbm1Wa/xz9/TzIx+FYCzJhnpBYXXWF
	2sPQW6LxvnY0lMPckRIoRihquJTT2/ZT51OPJIBstigM2VTMgpNmN6x556sdHGYSmGtk
	ujHgb/nMCPc7EPVqIwouLyWgBrKo5mG2290Aho2BjtRxedP/Iy07V5+qgV7pC4WGZxzh
	8BMA==
Received: by 10.14.216.70 with SMTP id f46mr55357423eep.12.1355187631547;
	Mon, 10 Dec 2012 17:00:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q44sm46640346eep.5.2012.12.10.17.00.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 17:00:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 01:59:57 +0100
Message-Id: <609e4e98967955cff5004b4afc3eaa84b423394d.1355187290.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<fb4647c716848b803f2fe32036cce38855c93159.1355187290.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355187290.git.Martin.Jansa@gmail.com>
References: <cover.1355187290.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 85/90] qwt: fix unpackaged files
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
X-List-Received-Date: Tue, 11 Dec 2012 01:15:14 -0000

* fixes:
qwt-6.0.1: qwt: Files/directories were installed but not shipped
  /usr/features
  /usr/doc
  /usr/plugins
  /usr/features/qwtconfig.pri
  /usr/features/qwtmathml.prf
  /usr/features/qwt.prf
  /usr/plugins/designer
  /usr/plugins/designer/libqwt_designer_plugin.so
  /usr/plugins/designer/.debug
  /usr/plugins/designer/.debug/libqwt_designer_plugin.so

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb | 2 ++
 meta-oe/recipes-qt/qwt/qwt.inc        | 6 +++++-
 meta-oe/recipes-qt/qwt/qwt_6.0.1.bb   | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
index 7f0e43b..af9d956 100644
--- a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
+++ b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
@@ -2,6 +2,8 @@ inherit qt4e
 
 require qwt.inc
 
+PR = "r1"
+
 SRC_URI[qwt.md5sum] = "ace68558eab873e2da7e641179c4ef0c"
 SRC_URI[qwt.sha256sum] = "3fe19dd5962d705632fc2ef616b009299de6cf1e702538296924dbfdc8003cb2"
 
diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index 50f4e2a..d9d47f0 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -22,6 +22,7 @@ do_install() {
     oe_runmake -e install
     install -d ${D}${datadir}/doc/${PN}
     mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
+    rmdir ${D}${prefix}/doc
     cd ${S}/examples
     install -d ${D}/${bindir}
     cd bin${QT_LIBINFIX}/
@@ -30,5 +31,8 @@ do_install() {
     done
 }
 
-PACKAGES_prepend = "${PN}-examples "
+PACKAGES_prepend = "${PN}-examples ${PN}-features ${PN}-plugins "
 FILES_${PN}-examples = "${bindir}/*"
+FILES_${PN}-features = "${prefix}/features"
+FILES_${PN}-plugins = "${prefix}/plugins/designer/*.so"
+FILES_${PN}-dbg += "${prefix}/plugins/designer/.debug"
diff --git a/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb b/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb
index e7eb7b7..f38816a 100644
--- a/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb
+++ b/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb
@@ -2,6 +2,8 @@ inherit qt4x11
 
 require qwt.inc
 
+PR = "r1"
+
 SRC_URI[qwt.md5sum] = "ace68558eab873e2da7e641179c4ef0c"
 SRC_URI[qwt.sha256sum] = "3fe19dd5962d705632fc2ef616b009299de6cf1e702538296924dbfdc8003cb2"
 
-- 
1.8.0



