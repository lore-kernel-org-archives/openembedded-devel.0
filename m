Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SiXqs-0004JG-0V
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 23:26:42 +0200
Received: by wibhm11 with SMTP id hm11so1568672wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2012 14:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tvPTag61mBSTfqtjOQeeE4nWcW0VkJ3bQgvtnDyaCVU=;
	b=XJ28sy/epaqim8JazAEm0yjhcuTWR2ukoKB8rdBM32ZhyZ6Dcg8fFIM1cNRzLkRtT9
	2sUQGAWMC2DyKpIdDPHPQJ3/+V1VwbILwBeTQc1tE4HxvKF2TIL5U/C6FXLvqlxEE5FU
	EfJBbjGfWv3oOAe4EUUQ1R/+X2Pj7/EDF/6VB3ixIppgq+UonT0BpasQyLaKK8mFtR80
	7CxopL2utbAHQYeeTMHzAua2Bt7qyDL4f84Hog111u3BAe1N2C9yOhqvBvjv1JReEegB
	VDwywm/Fo1eiV4YTq39B/hdO/EDMyoRzBjTTh4zH4PKcDmoz6b1ECVo2ZdEBnf1g8gzR
	lyCg==
Received: by 10.216.213.28 with SMTP id z28mr3597706weo.50.1340486150899;
	Sat, 23 Jun 2012 14:15:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei4sm14079104wid.5.2012.06.23.14.15.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 23 Jun 2012 14:15:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jun 2012 23:15:32 +0200
Message-Id: <8345f986d1da664c71b0ea21597f1487c04f4301.1340486086.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/5] navit: package whole ${datadir}/icons dir
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
X-List-Received-Date: Sat, 23 Jun 2012 21:26:42 -0000

* no need to install icon and .desktop file manually, now it's done by autotools

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/navit/navit.inc |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index 1baa145..b2b89e5 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -13,7 +13,7 @@ RRECOMMENDS_${PN} = "gpsd ${PN}-dbus ${PN}-speech-cmdline ${PN}-gui-internal ${P
 RSUGGESTS_${PN} = "flite-alsa espeak ${PN}-speech-dbus ${PN}-gui-gtk ${PN}-gui-qml ${PN}-graphics-sdl ${PN}-graphics-qt ${PN}-maptool"
 
 PE = "1"
-INC_PR = "r8"
+INC_PR = "r9"
 
 inherit autotools gettext
 
@@ -52,7 +52,7 @@ SRC_URI += "file://navit.xml \
             file://plugins.xml \
            "
 
-FILES_${PN} += "${libdir}/${PN}/*/*.so"
+FILES_${PN} += "${libdir}/${PN}/*/*.so ${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug"
 FILES_${PN}-maptool = " ${bindir}/maptool "
 FILES_${PN}-config = " ${datadir}/navit/*.xml "
@@ -73,10 +73,6 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-        install -d ${D}${datadir}/applications/
-        install -m 0644 ${S}/navit/xpm/desktop_icons/navit.desktop ${D}${datadir}/applications/
-        install -d ${D}${datadir}/pixmaps/
-        install -m 0644 ${S}/navit/xpm/desktop_icons/128x128/navit.png ${D}${datadir}/pixmaps/
 	# fix QA issue
 	sed -i 's#Categories=GTK;Utility;Geography;#Categories=Graphics;#g' ${D}${datadir}/applications/navit.desktop
 
-- 
1.7.8.6



