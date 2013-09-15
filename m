Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8AAD66111E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 16:15:37 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so1552381ead.31
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=H+LIXwqfzQxORsm9O/1ogBTdy2oJ2fKXUDkbabQ61yE=;
	b=F5/jX6ZqDj1/IrRewgtDrkl8qSr3k8nhRCYnbugQqa96deZ3AxMNgpxjYk11B/h/8S
	CsMl88iUVwdB+guLRVZi9AN9WQBD3fsH5hsReeea1K+bbQK0GeXUAVgPOk98qrr2BHB/
	eLYhYhSfQ/dxnc5Qv27PnwH4sNhGfGBPcCgkuh0BEkHK7PUa+r/K0l3qESWV63fN1zhj
	4bdx1Ec+axCSufmn0MxVqCgmfaMPXavRlQJgXpHy8oA+rVpT7tXoUE9leeBPdpx2T3VV
	ZwY+8Qxsosz86Z0VmdLAgVOWhVhla2FlyWf38zW0ukIWDF/PVCGypGP72GE0axsF71RE
	fdRw==
X-Received: by 10.14.180.73 with SMTP id i49mr3766462eem.55.1379261738310;
	Sun, 15 Sep 2013 09:15:38 -0700 (PDT)
Received: from mizar.localdomain
	(host50-7-dynamic.20-79-r.retail.telecomitalia.it. [79.20.7.50])
	by mx.google.com with ESMTPSA id
	r48sm34004501eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Sep 2013 09:15:37 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2013 18:15:14 +0200
Message-Id: <1379261716-7617-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH 1/3] kexecboot_cfg: fix against unwanted appendings to boot.cfg
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
X-List-Received-Date: Sun, 15 Sep 2013 16:15:38 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
index 6f21e52..af3320f 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
@@ -21,8 +21,11 @@ do_configure_prepend () {
 }
 
 do_install_prepend () {
-echo '# First kernel stanza.
+echo '# /boot/boot.cfg - KEXECBOOT configuration file.
+#
+# First kernel stanza.
 # Show this label in kexecboot menu.
+#
 LABEL=${KEXECBOOT_LABEL}
 #
 # Specify full kernel path on target.
@@ -48,7 +51,7 @@ APPEND=${CMDLINE} ${CMDLINE_DEBUG}
 # LABEL=${KEXECBOOT_LABEL}-test
 # KERNEL=/boot/${KERNEL_IMAGETYPE}-test
 # APPEND=${CMDLINE}
-#' >> ${S}/boot.cfg
+#' > ${S}/boot.cfg
 }
 
 do_install () {
-- 
1.8.1.5


