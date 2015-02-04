Return-Path: <danismostlikely@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9707261A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 20:29:29 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id x19so5035256ier.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Feb 2015 12:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nXBH3DyfZA0ouTzZ0E8as/SfTfPa4y6HnBzLL0D7nbw=;
	b=BlmrsepxGocqpx8Gv99cu3Oj7fhRx7x3LAI3aLXi53qqp+yMFJceI6D+dn3XCpTbT5
	6Cwj1lFlaOaMA8PzLXWtJRlbgegjUQBnSeBL5US05c47OhnWqDAb+LP75+bXBTB6HxV2
	4GeF4VF1y8czIO8ZgyMLiDt19keVc01X2F4WnMHRoD613A2H6sYB909z5a6jVBNMroDY
	xEMOwes32iryTSFy94wX8ul9BXd7ZZh1KxWXh7uW43wqdA2B8dw8tV1GtPJS05wgcspG
	Z/wt1fMCdp+pR6zraxOibnjf+uuw93kCA3PnOOcIoMb0QGqvET52eXXfiFmbyW2O59Dr
	KanQ==
X-Received: by 10.42.95.12 with SMTP id d12mr3750527icn.12.1423081770297;
	Wed, 04 Feb 2015 12:29:30 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id 16sm1382580ion.23.2015.02.04.12.29.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 12:29:29 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 14:29:23 -0600
Message-Id: <1423081763-2905-6-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
Subject: [meta-initramfs][PATCH 5/5] dracut: recipe cleanup
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
X-List-Received-Date: Wed, 04 Feb 2015 20:29:30 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Split out bash-completion data
Update RDEPENDS: getopt is util-linux-getopt now
Use distro_features_check to require systemd
Recommend busybox

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 .../recipes-devtools/dracut/dracut_git.bb          | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index ea55a4d..8ef0749 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -4,6 +4,8 @@ DESCRIPTION = "Dracut is an event driven initramfs infrastructure. dracut (the t
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
+PACKAGES =+ "${PN}-bash-completion"
+
 PE = "1"
 PV = "038"
 
@@ -13,8 +15,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
 S = "${WORKDIR}/git"
 
-do_configure() {
-    ./configure --prefix=${prefix} \
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+EXTRA_OECONF = "--prefix=${prefix} \
                 --libdir=${libdir} \
                 --datadir=${datadir} \
                 --sysconfdir=${sysconfdir} \
@@ -23,20 +27,29 @@ do_configure() {
                 --bindir=${bindir} \
                 --includedir=${includedir} \
                 --localstatedir=${localstatedir} \
+                --systemdsystemunitdir=${systemd_unitdir}/system"
+
+do_configure() {
+    ./configure ${EXTRA_OECONF}
 }
 
 do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} += "${datadir}/bash-completion \ 
-                ${libdir}/kernel \
+FILES_${PN}-bash-completion = "${datadir}/bash-completion"
+
+FILES_${PN} += " ${libdir}/kernel \
+                ${systemd_unitdir} \
                "
+CONFFILES_${PN} += "${sysconfdir}/dracut.conf"
+
+RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux-getopt util-linux bash ldd"
+RDEPENDS_${PN}-bash-completion = "bash-completion"
 
-# 'getopt' is in the util-linux main package
-RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux bash ldd"
 # This could be optimized a bit, but let's avoid non-booting systems :)
 RRECOMMENDS_${PN} = " \
                      kernel-modules \
+                     busybox \
                      coreutils \ 
                     "
-- 
2.1.0


