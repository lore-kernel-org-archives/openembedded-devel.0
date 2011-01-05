Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PaW3y-00082c-7Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 17:18:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 784DC314C79C;
	Wed,  5 Jan 2011 17:17:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 3Zi0NNmUPvFj; Wed,  5 Jan 2011 17:17:47 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 55D01314C770;
	Wed,  5 Jan 2011 17:17:46 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 05 Jan 2011 16:17:46 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jan 2011 16:17:46 +0000
Message-Id: <1294244266-18700-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <C10E6CF1-BF3B-4A0F-B064-F468E0A25821@dominion.thruhere.net>
References: <C10E6CF1-BF3B-4A0F-B064-F468E0A25821@dominion.thruhere.net>
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: [PATCH v2] qt4: fix incorrect pkg-config files
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
X-List-Received-Date: Wed, 05 Jan 2011 16:18:14 -0000

* Previously, include statements were generated like this:
  -I.../mipsel-oe-linux/usr/include/qtopia/QtCore
  -I.../mipsel-oe-linux/usr/include/qtopia/QtCore/qt4-embedded/QtCoreE
  -I.../mipsel-oe-linux/usr/include/qtopia/QtCore/qtopia

* The sed rules ignored QT_LIBINFIX.
* The sed rules incorrectly used QT_BASE_NAME instead of QT_DIR_NAME.

* Now, they look like this, which is what an application expects:
  -I.../mipsel-oe-linux/usr/include/qtopia/QtCore
  -I.../mipsel-oe-linux/usr/include/qtopia

* Tested with qt4-embedded on mipsel

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Koen Kooi <k.kooi@student.utwente.nl>
---
* v2: bumped INC_PR

 recipes/qt4/qt4-embedded.inc |    2 +-
 recipes/qt4/qt4-x11-free.inc |    2 +-
 recipes/qt4/qt4.inc          |   12 +++++-------
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
index 87b19d4..223c4f3 100644
--- a/recipes/qt4/qt4-embedded.inc
+++ b/recipes/qt4/qt4-embedded.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r26"
+INC_PR = "r27"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/recipes/qt4/qt4-x11-free.inc b/recipes/qt4/qt4-x11-free.inc
index ae79d58..a98e268 100644
--- a/recipes/qt4/qt4-x11-free.inc
+++ b/recipes/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.trolltech.com"
 LICENSE = "GPL QPL"
 DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r22"
+INC_PR = "r23"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
            file://0001-cross-compile.patch \
diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index ac1fc83..52fa146 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -285,15 +285,13 @@ do_install() {
            ${D}${libdir}/pkgconfig/*.pc
     for name in ${QT_LIB_NAMES}; do
            sed -i -e /Requires/s#"${name}"#"${name}${QT_LIBINFIX}"#g ${D}${libdir}/pkgconfig/*.pc
+           if [ -f ${D}${libdir}/pkgconfig/${name}${QT_LIBINFIX}.pc ]; then
+               sed -i -e /^includedir=/s#"/${name}"## \
+                      -e /^Cflags:/s#"${QT_DIR_NAME}"#"${name}"# \
+                         ${D}${libdir}/pkgconfig/${name}${QT_LIBINFIX}.pc
+           fi
     done
 
-	# QT abuses $includedir to point to its headers, which breaks pkgconfig sysroot, so manually fix it up here:
-	for pc in ${D}${libdir}/pkgconfig/*.pc ; do
-		sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename $pc .pc):prefix}/include:" \
-		       -e "s,Cflags: ,Cflags: -IP{includedir}/${QT_BASE_NAME}/$(basename $pc .pc) ," \
-		       -e 's:IP{:I${:g' $pc
-	done
-
     install -d ${D}/${libdir}/fonts
     touch ${D}/${libdir}/fonts/fontdir
 }
-- 
1.7.2.3



