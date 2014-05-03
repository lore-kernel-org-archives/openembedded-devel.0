Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 288EF6017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 May 2014 16:09:53 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so2832766eek.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 May 2014 09:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aNYYuSA/ixtv19XiwYuogVyBCf5BRm273rAZltTJgNU=;
	b=OqlpE+hbuFi7LlUDLOVo0vo6ZZrMweTVIeW9qryjN7WEsta5tIU8nuBOxHPd4SPFj4
	tYeufcH0uB0ENP0fNuu3TAKNryGyqY7xJOyt4UlJ6YrJRgd+NhpSXuuIuR/mkQqlpFEy
	3Ct/YQONC12Y9mpkeIiNu7Z+C42g2DhQZWc1xPWdR76xlGO0pvmxFE9aH8oK5pXJRyGT
	eWA3WMHLi48SEd+M5p8epujai5JDeS4qcc5I9164Ze7JnxLIMkbvqSoTJRgMYM4653t2
	0NR6t7KWXE+gSd21XUpcqu726Kfa/2WO13oIzl9WzE9Y6JuYMTX1SdX3QNwVIz0n78FK
	WUAA==
X-Received: by 10.14.69.201 with SMTP id n49mr21110049eed.106.1399133394029;
	Sat, 03 May 2014 09:09:54 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host56-254-dynamic.11-79-r.retail.telecomitalia.it. [79.11.254.56])
	by mx.google.com with ESMTPSA id
	w12sm13821644eez.36.2014.05.03.09.09.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 03 May 2014 09:09:53 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 May 2014 18:09:49 +0200
Message-Id: <1399133389-10106-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-initramfs][PATCH v2] klcc_cross: move in target sysroot as crossscript
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
X-List-Received-Date: Sat, 03 May 2014 16:09:58 -0000

Klcc-cross is properly a crosscript so avoid to inherit cross.bbclass and stage
it in target sysroot under usr/bin/crossscripts.
Minor adjustment is necessary for INSTALLDIR.

Finally some magic mangling is applied fixing the paths of sstate so that it is
invalidated in case of subsequent builds targeting machines with the same
arch and in case of builds sharing the sstate cache.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klcc-cross_2.0.3.bb     | 40 +++++++++++++---------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
index 7ff9c2e..2f4afce 100644
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
+    sed -i '2i #${STAGING_DIR_TARGET}' ${D}${bindir_crossscripts}/${TARGET_PREFIX}klcc
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
+EXTRA_STAGING_FIXMES = "MANGLEDSTAGINGDIRTARGET MANGLEDSTAGINGDIR"
+MANGLEDSTAGINGDIR = "${@d.getVar("STAGING_DIR", True).replace("/", "\\\\/").replace("-", "\\\\-")}"
+MANGLEDSTAGINGDIRTARGET = "${@d.getVar("STAGING_DIR_TARGET", True).replace("/", "\\\\/").replace("-", "\\\\-")}"
-- 
1.9.1


