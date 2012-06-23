Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SiXr2-0004Is-M2
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jun 2012 23:26:52 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2569993wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2012 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=JM6kpI5dPusWlT5RsFGbYiYa7Z/fzyi4Dk441HNxNo0=;
	b=yn9JFbUnWZ790BBmmi+BWydPGmG6UxKmuq3XhZpWk1LchAoo7AaWCK/LcuklNGvmbR
	v27y/P6AvBiDf/xYLinxfEyfhESAldwwZmkeNmc4eLDsrVGhaFhRGN57XgarJqEAJSs1
	V23a1KSVTftQ1u6m8C2rr6G7A/fYxcOgorM/Wbsuy/uzpD1G3HTSGAwRiSG2XBEFQp0/
	vaOcuqbCkmTVuFwy7aWthXbSPwPUv1JDj9wxPIYNQp3gN9/fCXCTq+ch5q650lDeYrco
	6zf8TILv/SfxLq5hMdsprDO0wCVlKkwT3PsNVIIMjXxT6lV1czcIAIq0Nm/ZPLsIBixR
	Jzvg==
Received: by 10.180.100.37 with SMTP id ev5mr10272727wib.5.1340486165180;
	Sat, 23 Jun 2012 14:16:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f7sm14101209wiv.2.2012.06.23.14.16.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 23 Jun 2012 14:16:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jun 2012 23:15:34 +0200
Message-Id: <547b8720bf9277bf8e7dd292e98d05759cbcf7d4.1340486086.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1340486086.git.Martin.Jansa@gmail.com>
References: <cover.1340486086.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/5] abiword: fix packaging after PACKAGES reorder
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
X-List-Received-Date: Sat, 23 Jun 2012 21:26:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword-2.5.inc  |    1 +
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb |    6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
index 67a5ef4..9b5adcc 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
+++ b/meta-gnome/recipes-gnome/abiword/abiword-2.5.inc
@@ -55,6 +55,7 @@ do_configure() {
 do_install_append() {
         install -d ${D}${datadir}/pixmaps/
         mv ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/
+        rmdir ${D}${datadir}/icons
 }
 
 PACKAGES += " abiword-clipart abiword-icons abiword-strings abiword-systemprofiles abiword-templates "
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 53a980e..ba0b979 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -2,7 +2,7 @@ require abiword-2.5.inc
 DEPENDS += " librsvg loudmouth libwmf-native gtkmathview asio"
 RCONFLICTS_${PN} = "abiword-embedded"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.abisource.com/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz;name=abiword \
            file://autogen-common.sh \
@@ -58,6 +58,8 @@ python populate_packages_prepend () {
 	bb.data.setVar('PACKAGES', ' '.join(packages), d)
 }
 
-FILES_${PN}-dev += "${libdir}/abiword-${SHRT_VER}/plugins/*.la"
+# don't steal /usr/lib/libabiword-2.8.so from ${PN}
+# in this case it's needed in ${PN}
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/abiword*.la ${libdir}/abiword-${SHRT_VER}/plugins/*.la ${libdir}/libabiword*.la"
 FILES_${PN}-dbg += "${libdir}/abiword-${SHRT_VER}/plugins/.debug"
 FILES_${PN}-doc += "${datadir}/abiword-*/readme*"
-- 
1.7.8.6



