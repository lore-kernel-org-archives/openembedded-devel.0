Return-Path: <danismostlikely@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD6372E23
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:29:05 +0000 (UTC)
Received: by mail-yk0-f173.google.com with SMTP id 142so3627459ykq.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=g0OnjjJZrUZ439dxsSLM05Zub9Ir5eL7Ah+MzozvVNM=;
	b=CFNAAo4JEfFLInCDLNd1/MLN2Ko0dK+ZQLNhbWd+/Av2yMJXmg6Cj+01mjAKe7P63A
	5HvSjhSog+cHtnLnF1V5/psmbu4bgIuo3r8q+q8NLSikWWOY7MQvci9GfWEDSFf9xPiw
	+23kKoRGXfPye/2grnu+8iyO0AEXVzvND8kIEhXifH5ir4lJbHLFN95woSkczifrq3hx
	J+yo3x5rj2ftefd8JW5jFo4KpyaWc1eXLUNLAutUZjt91O6Ax41Pk6d2kfFKPoFq/uxj
	nD06VbLuSKbK7B0sJwfN92rXcZ5gFlXThQuPHRrm+A30LoqKzdo+Nth0oFxrkqBm64TB
	rLhQ==
X-Received: by 10.107.7.18 with SMTP id 18mr5533796ioh.42.1423153746203;
	Thu, 05 Feb 2015 08:29:06 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by mx.google.com with ESMTPSA id
	hi15sm11370453igb.19.2015.02.05.08.29.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Feb 2015 08:29:05 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Feb 2015 10:29:02 -0600
Message-Id: <1423153742-11829-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <mavrvk$83v$1@ger.gmane.org>
References: <mavrvk$83v$1@ger.gmane.org>
Subject: [meta-initramfs][PATCH v2 5/5] dracut: recipe cleanup
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
X-List-Received-Date: Thu, 05 Feb 2015 16:29:06 -0000

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
index ea55a4d..e425845 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -13,8 +13,10 @@ SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git"
 
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
@@ -23,20 +25,31 @@ do_configure() {
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
+PACKAGES =+ "${PN}-bash-completion"
+
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


