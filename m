Return-Path: <alexandre.tuleu@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B719D6CA17
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 18:21:27 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id b13so919662wgh.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 10:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=8qe5iVfN0CVG44R8TWbbo0AhU94/ZXQGTsdvozipsj8=;
	b=HDWf1n8SctMFh4+dYVG3U8GweuB1GaT3HRx5RsRPd7b6aCdUlnPZvordrcR8NrsiEG
	gv5HIDPJN+GhlB3NDj/EGdhbYfRmgLxDMZ/ezUd7QWqbCB73EYLUEGPy8buCE9OJ0FwD
	0iBT6dZsZseYoXATXbz+iqJ37XnwwHcPlqwH47glQ8SGbt0wHx5/YLrrdRng9OejeeRU
	4ygwvmkDWQBxzbhAODZAxvCKXy9Z1Twom8Z1Tn7nUQ8QN44wonD/pgh6JMvuk3KCxPQu
	MbMXyhanA28tsmJEa4n/vZcasbc3pLB5zqe4EqYQ3+KR3OgNLEe8Kw+/v3K+E+ZsYYHI
	k5PA==
X-Received: by 10.194.240.41 with SMTP id vx9mr2717136wjc.70.1383848488895;
	Thu, 07 Nov 2013 10:21:28 -0800 (PST)
Received: from localhost.localdomain (gtisr.isr.ist.utl.pt. [193.136.138.62])
	by mx.google.com with ESMTPSA id
	e1sm37648468wij.6.2013.11.07.10.21.27 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Nov 2013 10:21:28 -0800 (PST)
Sender: alexandre tuleu <alexandre.tuleu@gmail.com>
From: Alexandre Tuleu <alexandre.tuleu.2005@polytechnique.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Nov 2013 18:21:17 +0000
Message-Id: <1383848477-9236-1-git-send-email-alexandre.tuleu.2005@polytechnique.org>
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
X-List-Received-Date: Thu, 07 Nov 2013 18:21:30 -0000

By default emacs will build with x11 if the distribution has x11
support. However in a .bbappend file a user could strip away x11
support, even if x11 is supported on the platform. There was another
check in do_compile_prepend() that checked if the distro has x11
feature and not if PACAKAGECONFIG enables x11 support.

Since in this receipe dbus dependence is only marked if x11 is
enabled, desactiving x11 support should also desactivate dbus support.

Signed-off-by: Alexandre Tuleu <alexandre.tuleu.2005@polytechnique.org>
---
 meta-oe/recipes-support/emacs/emacs.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index fa554ed..d7d281f 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
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


