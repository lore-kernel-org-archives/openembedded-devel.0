Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 26B1572D74
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Apr 2015 21:59:51 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so63265204wgy.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Apr 2015 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=HJA3meOqR6eZtXrY24DpJbje3dqzCfFrHG2dS1MZgKQ=;
	b=BrRQm/wo/ACsKZMZ3r2xFCD5HZ1UNMNPt6vwx2DocrrDHaeM0ViFV7O9iHkhmB1RK4
	LE2kQv+Hbm1qib7mFkEP+FjEfMKAIYplx5LMFwRsoshSpyt1hEEdf8QuWY6s9bAu8ULS
	FC3jfrjZbsBGyX/gWHkKdI4B/VlpliqFX20cGvKD9+hJMug2Enhl/FUQq+O70g0mxD0n
	ZwEsL9DdG2jp1oUltz8ILIzweON2YttJl0d/P9sE7qut8GtqnERS305H3mXh4mNJKzfu
	+HQO0/zTw3SwQ6P1S72lzKRXh+2X+Roi0qRWHZ93Gzr6URZnpFhkaFBApUcoNtVpCnsq
	6wUg==
X-Received: by 10.194.184.10 with SMTP id eq10mr22330542wjc.147.1428875992586; 
	Sun, 12 Apr 2015 14:59:52 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host185-253-dynamic.48-82-r.retail.telecomitalia.it.
	[82.48.253.185])
	by mx.google.com with ESMTPSA id u6sm8654409wjy.13.2015.04.12.14.59.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Apr 2015 14:59:50 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Apr 2015 23:59:26 +0200
Message-Id: <1428875966-26178-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] kexecboot-cfg: maintenance update to v. 0.2
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
X-List-Received-Date: Sun, 12 Apr 2015 21:59:52 -0000

This configuration file is only suitable for kexecboot > 0.5.9.
With the upcoming release of linux_4.0 based kexecboot kernels it is preferable
to clearly distinguish old and new versions.

Fix WARNING: ... kexecboot-cfg-0.1 ('S') doesn't exist, please set 'S' to a proper value
Remove PR
Increase PV

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexecboot/{kexecboot-cfg_0.1.bb => kexecboot-cfg_0.2.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-initramfs/recipes-bsp/kexecboot/{kexecboot-cfg_0.1.bb => kexecboot-cfg_0.2.bb} (98%)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
similarity index 98%
rename from meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
rename to meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
index ec476f8..bd861f3 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.1.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
@@ -3,10 +3,11 @@ DESCRIPTION = "Default icon and boot.cfg for kexecboot linux-as-bootloader."
 SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
-PR = "r14"
 
 SRC_URI = "file://icon.xpm"
 
+S = "${WORKDIR}/${BP}"
+
 do_configure_prepend () {
     install -m 0644 ${WORKDIR}/icon.xpm ${S}
 }
-- 
1.9.1


