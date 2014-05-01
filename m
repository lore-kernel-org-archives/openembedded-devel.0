Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0430C65CD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 23:13:37 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id e53so2618016eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YuREqKwc65FgLXmwI+2aeo+sbUIRhqbQLcBEWqEcheg=;
	b=JgDiYzRpWgxvxj64LTGiQfA6KZKGggIhsfjeWNU5yGxowhC+9dWXFcv7PRmoPcrhS5
	3f6cLfuz7C6z6CnXpHHkhilQfmUh3/kyuZPaY7mvR5HgR15FwQFGUgRNE5bTx0BOVJmT
	DKL3uKnA2mePN9llGEB98HFz/7Mb0sbjNV9EwgJjA/ujLgWrkw8jKlCX5LzeKAtTTtix
	AQnp6dVCXM5CuwvOzFlZuYLfAu7jGYEpMvd+YRUMt6UYXuYNUhH9QriIbeFrThDWoCBG
	L6tPlWqYbKdVwDPKYzBtR1/PHC5CD7xW9U7UzPL91Fs1Ov5sxTWWSeLodKjuiV511r9t
	nWOg==
X-Received: by 10.14.176.1 with SMTP id a1mr11957715eem.52.1398986018273;
	Thu, 01 May 2014 16:13:38 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host182-253-dynamic.10-79-r.retail.telecomitalia.it.
	[79.10.253.182])
	by mx.google.com with ESMTPSA id u46sm79804495eel.1.2014.05.01.16.13.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 May 2014 16:13:37 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 May 2014 01:13:28 +0200
Message-Id: <1398986009-20163-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-initramfs][PATCH] klcc_cross: move in target sysroot as crosscript
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
X-List-Received-Date: Thu, 01 May 2014 23:13:39 -0000

Klcc-cross is properly a crosscript so avoid to
inherit cross.bbclass and stage it in target sysroot
under usr/bin/crossscripts.
Minor adjustment is necessary for INSTALLDIR.

Finally some optional magic mangling is added to better match the perl syntax:
let it commented for future reference.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klcc-cross_2.0.3.bb     | 40 +++++++++++++---------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
index 7ff9c2e..5e767c1 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
@@ -7,28 +7,34 @@ FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 
 SRC_URI += "file://use-env-for-perl.patch"
 
-inherit cross
-
 # disable task already run in klibc recipe
 do_configure[noexec] = "1"
+
 do_compile() {
-    oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${target_libdir}/klibc' klcc
+    oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${libdir}/klibc' klcc
 }
-# The linux-libc-headers and klibc custom headers are not machine-specific
-# but are installed into machine sysroot.
-# Klcc wrapper is hardcoding some of these paths thus, to keep the recipe
-# arch-specific, we force the rebuild of klcc-cross for each machine.
-do_compile[vardeps] += "MACHINE"
+
 do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 klcc/klcc ${D}${bindir}/${TARGET_PREFIX}klcc
+    install -d ${D}${bindir_crossscripts}/
+    install -m 0755 klcc/klcc ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
+    # Insert an unencoded path as a comment to trigger the sstate renaming functions
+    sed -i '2i #${STAGING_DIR_TARGET}'  ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
+}
+
+SYSROOT_PREPROCESS_FUNCS += "klcc_sysroot_preprocess"
+
+klcc_sysroot_preprocess () {
+       sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
 }
 
+deltask do_package
+deltask do_packagedata
+deltask do_package_write_ipk
+deltask do_package_write_rpm
+deltask do_package_write_deb
+deltask do_package_write_tar
 
-# disable unneeded tasks
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_tar[noexec] = "1"
+SSTATE_SCAN_FILES = "*"
+#EXTRA_STAGING_FIXMES = "MANGLEDSTAGINGDIRTARGET MANGLEDSTAGINGDIR"
+#MANGLEDSTAGINGDIR = "${@d.getVar("STAGING_DIR", True).replace("/", "\\\\/").replace("-", "\\-")}"
+#MANGLEDSTAGINGDIRTARGET = "${@d.getVar("STAGING_DIR_TARGET", True).replace("/", "\\\\/").replace("-", "\\-")}"
-- 
1.9.1


