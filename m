Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 375226CE93
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 22:05:22 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so1478031eae.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=enzLTAlMNBErceJvcLYVQJvVoV8ARgUiifyOJveE1ws=;
	b=Hs9ahncfDacxAKnj6Z1kbItdNfngo+VZeCTfE/CMerV52sfTgMvnpgIqmF4HhyObjL
	mpX+Iwv2gmuixvHc21n++G23XQv3IzdpzS1E9oB5gkLgzkh3KqOhUCfyhafsk6Al9Lpp
	DuscsnXS7X78+2xZkPdMw5h80JnxyKKz9j/xRPLw5g+tuywopmL8qmBaXEsuOXs5y11U
	fdQYnlTuaXzV8c8pn6AbIhR8lOnoTiLeUk4XQ3okrM4cSy01yr1QH4UyEVu0ZTuW/4WX
	6M1PU3IFJ+na/bYJQOQ6nQnqg79QRNHWQbn9Y2PVKcUGhIPdIlIIdWvL9fVrIRGtyo7K
	by4g==
X-Received: by 10.15.98.9 with SMTP id bi9mr23347eeb.67.1381442723396;
	Thu, 10 Oct 2013 15:05:23 -0700 (PDT)
Received: from mizar.localdomain
	(host138-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.138])
	by mx.google.com with ESMTPSA id
	bn13sm106490184eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 15:05:22 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2013 00:05:12 +0200
Message-Id: <1381442712-26865-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] kexecboot: update to v0.6 and restylize
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
X-List-Received-Date: Thu, 10 Oct 2013 22:05:24 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-bsp/kexecboot/{kexecboot_git.bb => kexecboot_0.6.bb}  | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-initramfs/recipes-bsp/kexecboot/{kexecboot_git.bb => kexecboot_0.6.bb} (92%)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
similarity index 92%
rename from meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
rename to meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index 7347ea5..7b8d088 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -36,12 +36,10 @@ DESCRIPTION = "kexecboot is a graphical linux-as-bootloader implementation based
 HOMEPAGE = "http://kexecboot.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-SRCREV = "0bcc14671aa2d84ec20f260582aca36bb901ccf1"
-PV = "0.5.9.1"
 
-SRC_URI = "git://github.com/kexecboot/kexecboot.git"
-
-S = "${WORKDIR}/git"
+SRC_URI = "https://github.com/kexecboot/kexecboot/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "46b7c1a6f20531be56445ebb8669a2b8"
+SRC_URI[sha256sum] = "6b360b8aa59bc5d68a96705349a0dd416f8ed704e931fa0ac7849298258f0f15"
 
 inherit autotools
 
-- 
1.8.1.5


