Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS5w-0005cR-EV
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:49:28 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6973088eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=1Umj6SbG+8kUtsau9/eVMxHOKWF2akPH6RMfsYk500I=;
	b=ftOqrG7P+OkR8bo4tQSLUQqcx17WtPxTJiWrpRnJLOcBpXqwbKqDDb0yi98WH0slrC
	d8JIW8rhiB0e8UAHEWTxZ+1MpCzaiXDwdAIKhy6xKr4VHSHHwZHsB88t3kB9OzmaYo2i
	EuhGihOv9UAlGFvJGeZwXkNIzfIIhwDS7yRSBDzntK0ZKxK8qr+8B0W3IUBP1oa9uTM2
	J24jslVyoOrMTR7Ril6VrtlwH314GW7xQmRuBcw/o78diEh0knUidxwXKDGMwyL7XD1/
	4QUu2OlnLWJzN1hqwWAysxxccQZd2ljBtRFjHCwnaHGHNSJAigKNihtA4zmjnNNzkr+Q
	IncQ==
Received: by 10.14.199.134 with SMTP id x6mr62059163een.31.1354048517336;
	Tue, 27 Nov 2012 12:35:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm42849908eeg.4.2012.11.27.12.35.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:35:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:48 +0100
Message-Id: <cdd3562bf06dd27549739d3ec193a702d0a8ccc7.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 11/21] e-wm: update path to icon_icon_theme.png, add some unpackaged files and xcb to DEPENDS
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
X-List-Received-Date: Tue, 27 Nov 2012 20:49:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index a6f56bd..615e0f2 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "The Enlightenment Window Manager Version 17"
-DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio elementary"
+DEPENDS = "eet evas eina ecore edje efreet edbus eeze eio elementary libxcb xcb-util-keysyms"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r6"
+PR = "r7"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -40,7 +40,7 @@ do_install_append() {
     echo "Categories=Application;" >> ${D}/${datadir}/applications/efm.desktop
     echo "StartupNotify=true" >> ${D}/${datadir}/applications/efm.desktop
     install -d ${D}/${datadir}/icons/
-    install -m 644 ${S}/data/themes/images/icon_icon_theme.png ${D}/${datadir}/icons/e-module-fileman.png
+    install -m 644 ${S}/data/themes/img/O/icon_icon_theme.png ${D}/${datadir}/icons/e-module-fileman.png
 
     install -d ${D}/${sysconfdir}/xdg/menus
     install -m 644 ${WORKDIR}/applications.menu ${D}/${sysconfdir}/xdg/menus/
@@ -111,6 +111,7 @@ FILES_${PN} = "\
   ${libdir}/enlightenment/modules/*/*.* \
   ${libdir}/enlightenment/modules/*/*/* \
   ${libdir}/enlightenment/modules/*/*/.order \
+  ${libdir}/enlightenment/modules/keyboards/ignore_built_in_keyboards \
   ${libdir}/enlightenment/*plugins/*/*/* \
   ${libdir}/enlightenment/preload/e_precache.so \
   ${datadir}/enlightenment/data/icons \
@@ -182,6 +183,7 @@ RRECOMMENDS_${PN}-config-standard = "${PN}-theme-default"
 
 FILES_${PN}-dbg += "\
   ${libdir}/enlightenment/modules/*/*/.debug/ \
+  ${libdir}/enlightenment/modules/policies/.debug/ \
   ${libdir}/enlightenment/preload/.debug/ \
   ${libdir}/enlightenment/utils/.debug/ \
   ${libdir}/enlightenment/*plugins/*/*/.debug \
-- 
1.8.0



