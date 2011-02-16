Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ppeie-0000xn-0B
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:34:48 +0100
Received: (qmail 19765 invoked by uid 503); 16 Feb 2011 11:16:17 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 16 Feb 2011 11:16:16 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Feb 2011 12:33:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Feb 2011 12:33:34 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:33:48 +0100
Message-Id: <1297852433-31160-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297852433-31160-1-git-send-email-eric@eukrea.com>
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12105112849527516492
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 04/10] gnokii: remove old recipes
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
X-List-Received-Date: Wed, 16 Feb 2011 10:34:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gnokii/gnokii/configure.patch |   21 ---------------------
 recipes/gnokii/gnokii_0.6.14.bb       |   29 -----------------------------
 recipes/gnokii/gnokii_0.6.4.bb        |   31 -------------------------------
 3 files changed, 0 insertions(+), 81 deletions(-)
 delete mode 100644 recipes/gnokii/gnokii/configure.patch
 delete mode 100644 recipes/gnokii/gnokii_0.6.14.bb
 delete mode 100644 recipes/gnokii/gnokii_0.6.4.bb

diff --git a/recipes/gnokii/gnokii/configure.patch b/recipes/gnokii/gnokii/configure.patch
deleted file mode 100644
index 0cc3cb4..0000000
--- a/recipes/gnokii/gnokii/configure.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- gnokii-0.6.4/configure.in.old	2005-01-09 20:15:53.000000000 +0000
-+++ gnokii-0.6.4/configure.in	2005-01-09 20:15:55.000000000 +0000
-@@ -379,11 +379,16 @@
-       AC_MSG_WARN(Cannot find library libX11.)
-       AC_MSG_WARN(Disabling xgnokii.)
-    else
-+      if test "x$x_libraries" != "x"; then
-+          l_x_libraries="-L$x_libraries"
-+      else
-+          l_x_libraries=""
-+      fi
-       AC_CHECK_LIB(Xpm, XpmWriteFileFromXpmImage,
--            [ XPM_CFLAGS="$XINCL" XPM_LIBS="-L$x_libraries -lXpm -lX11"
-+            [ XPM_CFLAGS="$XINCL" XPM_LIBS="$l_x_libraries -lXpm -lX11"
-               AC_DEFINE(XPM) ],
-             AC_MSG_WARN(Cannot found library libXpm - disabling XPM support.),
--            [ -L$x_libraries -lX11 ]
-+            [ $l_x_libraries -lX11 ]
-       )
- 
-       if test "x$PTHREAD_LIBS" = xerror; then
diff --git a/recipes/gnokii/gnokii_0.6.14.bb b/recipes/gnokii/gnokii_0.6.14.bb
deleted file mode 100644
index f3e968a..0000000
--- a/recipes/gnokii/gnokii_0.6.14.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-LICENSE = "GPL"
-DESCRIPTION = "Cellphone tools and driver software"
-SRC_URI = "http://www.gnokii.org/download/gnokii/0.6.x/gnokii-${PV}.tar.bz2 \
-	file://configure.patch"
-
-DEPENDS = "libxpm gtk+"
-
-inherit autotools pkgconfig
-
-PARALLEL_MAKE = ""
-
-PACKAGES += "libgnokii libgnokii-dev"
-
-FILES_${PN} = "${bindir} ${sbindir}"
-FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
-	        /lib/*.a /lib/*.o ${datadir}/aclocal"
-FILES_${PN}-dev = ""
-FILES_libgnokii = "${libdir}/libgnokii.so.*"
-
-do_stage() {
-	autotools_stage_includes
-
-	oe_libinstall -C common -so libgnokii ${STAGING_LIBDIR}
-}
-
-
-SRC_URI[md5sum] = "89449d613c7a7e765a0d8da57ef1bb88"
-SRC_URI[sha256sum] = "cea63cddf79864d306198c7a84091af0b4685816b352ae253a3e2bfac5e67cb7"
diff --git a/recipes/gnokii/gnokii_0.6.4.bb b/recipes/gnokii/gnokii_0.6.4.bb
deleted file mode 100644
index 2389980..0000000
--- a/recipes/gnokii/gnokii_0.6.4.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-LICENSE = "GPL"
-DESCRIPTION = "Cellphone tools and driver software"
-SRC_URI = "http://www.gnokii.org/download/gnokii/0.6.x/gnokii-${PV}.tar.bz2 \
-	file://configure.patch"
-
-DEPENDS = "libxpm"
-
-inherit autotools pkgconfig
-
-PACKAGES += "libgnokii libgnokii-dev"
-
-FILES_${PN} = "${bindir} ${sbindir}"
-FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
-	        /lib/*.a /lib/*.o ${datadir}/aclocal"
-FILES_${PN}-dev = ""
-FILES_libgnokii = "${libdir}/libgnokii.so.*"
-
-do_compile_prepend() {
-	sed -i s:foo::g Makefile.global
-}
-
-do_stage() {
-	autotools_stage_includes
-
-	oe_libinstall -C common -so libgnokii ${STAGING_LIBDIR}
-}
-
-
-SRC_URI[md5sum] = "7f2a8cee97e62ebfa284363dc93b3178"
-SRC_URI[sha256sum] = "9605f7aee1b8d58cac10dd514c2bdfa340089d85b149db828816d18ac3ebaff8"
-- 
1.7.0.4



