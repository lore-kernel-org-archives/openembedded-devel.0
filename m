Return-Path: <danismostlikely@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5A44F72E1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:02:37 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hl2so3235337igb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Feb 2015 07:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2FSxcL3KPppoe/Wp00Easx7dwaSRvDdLLBJm0wyd+rU=;
	b=HIZXPa1LXKaCY2kZRJ6wPkBchpyLdJoFUW18X3euotjwFaqPFkCZHzAOSfXvzmeoJ7
	LdJOjvd2y5w7CoiZVkaMjGJDiWc5Mckgi42qB7dzmyxOGtf5btgAx3yJ+8s7dVdZ6qrj
	/8Zo1um+UNDWlheZwXT2/FoDh95NiWdoZRXhVj96fUlU4rc4sCVfgyztTBIsIt+FwN3k
	SkfzrLV4TPM3ddse/1D1EWm0WeG0B/w6fXDcCwuGCnOdSf0HD2lS3Xa//y7L7tjc2Vgr
	FjqlLnWETX/AuHdZCSFzSzCtImKB/pd8o1+GCumy5MwGTdHo5pjAVGHrlW2LMzDocBct
	FnSQ==
X-Received: by 10.50.67.100 with SMTP id m4mr2197234igt.22.1423234958552;
	Fri, 06 Feb 2015 07:02:38 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id g11sm1310916iod.28.2015.02.06.07.02.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Feb 2015 07:02:38 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Feb 2015 09:02:35 -0600
Message-Id: <1423234955-14624-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <mavrvk$83v$1@ger.gmane.org>
References: <mavrvk$83v$1@ger.gmane.org>
Subject: [meta-initramfs][PATCH v3 5/5] dracut: recipe cleanup
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
X-List-Received-Date: Fri, 06 Feb 2015 15:02:39 -0000

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
+RDEPENDS_${PN} = "systemd findutils cpio util-linux-blkid util-linux-getopt bash ldd"
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


