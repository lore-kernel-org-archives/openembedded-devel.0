Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id E9DB660655
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:35:01 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id m6so2744662wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BhgHXjYEcdNdTgFOUC1mJ3yvQnxl2xvk3H5yMjrX02U=;
	b=twwdjl14KD8lWCZPwgKHUCPsy4r3Kbrmvbl2Ipd+6GGzvePTcKIQ1QhS8HvRjF7p0f
	iY3R+hJT1O0PymqS098HOVTG0PfLGlGtOftEN3kQuK4Epr688xMCRhAt07fKqYElXUk3
	hJtBDrC5Y1T9PjnYOUNmmHJdEkzCruqLrDb4U94Qf4KpT1c7wAXW5tUY+t4JOIiciMKM
	TWiqjhOOFNartW349d8cfXIN4UxM3zFqpT2KROG1KRaZ3efvPI6fdJCucMRX8fdDIz/U
	OLhgdb0utiEJnFQnFob5V3twNCSJBHNfyFgTFHnbH/7ZudvupplapxKdI22HppeY2Njt
	PikQ==
X-Received: by 10.194.243.129 with SMTP id wy1mr8882471wjc.47.1371501301834;
	Mon, 17 Jun 2013 13:35:01 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.35.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:35:01 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:46 +0200
Message-Id: <8aac82e80f1812b8085ec0d0fc2a2aff9103d19a.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 3/9] kexecboot(-klibc): add SUMMARY, DESCRIPTION, HOMEPAGE
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
X-List-Received-Date: Mon, 17 Jun 2013 20:35:02 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb | 1 +
 meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc          | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
index a158eb4..5e33182 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_git.bb
@@ -9,3 +9,4 @@ S = "${WORKDIR}/git"
 inherit klibc
 
 require kexecboot.inc
+SUMMARY = "kexecboot linux-as-bootloader, statically compiled against klibc"
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
index b06293c..3854b9f 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot.inc
@@ -31,6 +31,9 @@
 #  --with-kexec-binary     look for kexec binary at path
 #                            [default="/usr/sbin/kexec"]
 ##########################
+SUMMARY = "kexecboot linux-as-bootloader"
+DESCRIPTION = "kexecboot is a graphical linux-as-bootloader implementation based on kexec."
+HOMEPAGE = "http://kexecboot.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 inherit autotools
-- 
1.8.1.5


