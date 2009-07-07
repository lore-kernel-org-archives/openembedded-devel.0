Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MOD57-0000LD-7e
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jul 2009 17:59:45 +0200
Received: by ewy21 with SMTP id 21so5405378ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2009 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=CxsNm43TjHLVqfCcfFgcRiFvHIirGl7RK4TPpyXBDDk=;
	b=O4p5yfbPKW6K8/FKHYxOcEXf2AGIx0sqEldikwjrJCAN4jm8B1wOP63dV7gWobHEPM
	CcRqk1ycFmDqO/c9qLHfSNMDgZxe4rZTdfL8wQXBo9zK5fqW/YVG9XQ0caY/o0uEpdU7
	MWmglZikBTgjnafRZof+fDN3onqU60bZtOSDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=NzPZzTde8WZEEqastUOZJc9+XjAHkcrqhkgyX0NKjVqXI8IF3hEJBaqCD6dhvmFeHM
	FFrTi0/sUiIgAq4ykNv/KkDHDpy6kO/fdaBP2nLl0uN0WFkt1UQB3P9uyj0/g0vcyp1Y
	hxen03H3oepM13bLrhp4Zamc0ht/9Uf/oNHaI=
Received: by 10.211.179.6 with SMTP id g6mr7375119ebp.65.1246981629047;
	Tue, 07 Jul 2009 08:47:09 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 5sm2923454eyh.20.2009.07.07.08.47.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Jul 2009 08:47:07 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jul 2009 18:47:04 +0300
Message-Id: <1246981624-30705-1-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] qt4: added postgres, mysql, and sqlite2/3 support.
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
X-List-Received-Date: Tue, 07 Jul 2009 15:59:45 -0000

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4-embedded.inc |    2 +-
 recipes/qt4/qt4-x11-free.inc |    2 +-
 recipes/qt4/qt4.inc          |    7 ++++---
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 26b4116..8d827eb 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r11"
+INC_PR = "r12"
 
 QT_BASE_NAME = "qt4-embedded"
 QT_BASE_LIB  = "libqt-embedded"
diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
index 23fa33f..d6d6f12 100644
--- a/recipes/qt4/qt4-x11-free.inc
+++ b/recipes/qt4/qt4-x11-free.inc
@@ -6,7 +6,7 @@ LICENSE = "GPL QPL"
 DEPENDS += "virtual/libx11 fontconfig xft libxext libxrender libxrandr libxcursor"
 PROVIDES = "qt4x11"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch;patch=1 \
diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index f5da652..58b8fe0 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -1,6 +1,6 @@
 inherit qmake_base
 
-DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base"
+DEPENDS += "qt4-tools-native freetype jpeg libpng zlib dbus openssl glib-2.0 gstreamer gst-plugins-base mysql postgresql sqlite sqlite3"
 
 require qt4_arch.inc
 QT_ARCH := "${@qt_arch(d)}"
@@ -9,7 +9,7 @@ QT_ENDIAN = "${@qt_endian(d)}"
 QT_CONFIG_FLAGS += "-release -no-cups -no-accessibility -reduce-relocations \
                     -shared -no-nas-sound -no-sm -no-nis \
                     -qt-gif -system-libjpeg -system-libpng -system-zlib \
-                    -no-sql-ibase -no-sql-mysql -no-sql-odbc -no-sql-psql -no-sql-sqlite -no-sql-sqlite2 \
+                    -no-sql-ibase -plugin-sql-mysql -no-sql-odbc -plugin-sql-psql -plugin-sql-sqlite -plugin-sql-sqlite2 \
                     -no-pch -qdbus -stl -glib -phonon -webkit"
 
 EXTRA_OEMAKE = "-e"
@@ -140,7 +140,8 @@ do_configure() {
             -crossarch ${QT_ARCH} \
             ${QT_CONFIG_FLAGS} -fast \
             -L${STAGING_LIBDIR} -I${STAGING_INCDIR} \
-            -I${STAGING_INCDIR}/freetype2
+            -I${STAGING_INCDIR}/freetype2 \
+            -I${STAGING_INCDIR}/mysql
 }
 
 do_compile() {
-- 
1.6.3.3



