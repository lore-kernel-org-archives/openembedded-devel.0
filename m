Return-Path: <alexandre.tuleu@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id BF0DB6CA17
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 18:17:38 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id t60so935352wes.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 10:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=u0ozw/yy6JPGFCZhE6clyixbfwBtcEwz2EGEG2bPlN0=;
	b=v/9vi13zuf8JJ1/+BJexwUGdqF9p3VHsovaYgA2EOZC5slmrw5nieQg/iiGKcnrqnG
	N0T769OW+XIhgdY/1SIETW4IA89ELiTwvr7XH/Eii+el7g11O1mSSG4fnFbCDkODMri2
	ZvxcKg9lzFEd+kwQcRxyUZYSr56yffJZbUnCnt2wGTB+DeqI5WLAcRBGyZRvqffv++9k
	KrcIWoop+WpZlZXK+4LWR3Spjy37NQVUoSCIho/cjNAuJTHeKNNd7xpyBu1qQAvF3SGu
	n6Bt7q2yCeQK3BREkB9W1N6alp7wyqeNQL2c3V3coOZ5VX6z5P4Hwe4dRH8O1H1x1Dqk
	kcnA==
X-Received: by 10.180.19.133 with SMTP id f5mr3877401wie.60.1383848259235;
	Thu, 07 Nov 2013 10:17:39 -0800 (PST)
Received: from localhost.localdomain (gtisr.isr.ist.utl.pt. [193.136.138.62])
	by mx.google.com with ESMTPSA id
	ey4sm9242685wic.11.2013.11.07.10.17.38 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 10:17:38 -0800 (PST)
Sender: alexandre tuleu <alexandre.tuleu@gmail.com>
From: Alexandre Tuleu <alexandre.tuleu.2005@polytechnique.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2013 18:17:19 +0000
Message-Id: <1383848240-8328-1-git-send-email-alexandre.tuleu.2005@polytechnique.org>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] emacs: Allows non-x11 build on distribution supporting x11
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
X-List-Received-Date: Thu, 07 Nov 2013 18:17:39 -0000

By default emacs will build with x11 if the distribution has x11
support. However in a .bbappend file a user could strip away x11
support, even if x11 is supported on the platform. There was another
check in do_compile_prepend() that checked if the distro has x11
feature and not if PACAKAGECONFIG enables x11 support.

Since in this receipe dbus dependence is only marked if x11 is
enabled, desactiving x11 support should also desactivate dbus support.

Signed-off-by: Alexandre Tuleu <alexandre.tuleu.2005@polytechnique.org>
---
 meta-oe/recipes-support/emacs/emacs.inc |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index fa554ed..7e468c1 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -9,7 +9,7 @@ DEPENDS += "qemu-native"
 DEPENDS +=" liblockfile"
 
 X11DEPENDS = " \
-    libice libsm atk cairo dbus expat libffi fontconfig freetype gconf giflib \
+    libice libsm atk cairo expat libffi fontconfig freetype gconf giflib \
     jpeg xz pixman libpng librsvg tiff libcroco \
     libx11 libxau libxcomposite libxcursor libxdamage libxdmcp libxext libxfixes \
     libxft libxpm libxrandr libxrender \
@@ -19,7 +19,8 @@ X11DEPENDS = " \
 EXTRA_OECONF =  "--without-sound --with-crt-dir=${STAGING_LIBDIR} "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x,${X11DEPENDS}"
+PACKAGECONFIG[x11] = "--with-x-toolkit=gtk,--without-x --without-dbus,${X11DEPENDS}"
+
 
 inherit autotools
 
@@ -87,7 +88,7 @@ do_compile_prepend() {
     ${STAGING_DIR_TARGET}/${base_libdir}/libgcc_s.so.* \
     ${STAGING_DIR_TARGET}/${base_libdir}/libpthread* $treedir/${base_libdir}/
 
-    if [ ! -z "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" ] ; then
+    if [ ! -z "${@base_contains('PACKAGECONFIG', 'x11', 'x11', '', d)}" ] ; then
         echo "X11 build enabled"
         # copy only as much stuff as we need
         # before: 5.5G   ../../qemu-treedir/
-- 
1.7.9.5


