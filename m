Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 541DC78763
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2018 21:59:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g21-v6so13847705wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2018 15:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fliZqGvRhT37hkPUWE4yXSuKFu+pZegGe8TxemwEpWU=;
	b=pmQvglxCXTB4+nzWldSihH+QZ1mWvk3AE9XVIoGH9KoGKuQazUgWvjNfRLRH6//k1z
	ciDr9LgANjAzozf8K0bCXfXGNQOFCWIFgMQO0ZDi7NnwXB7MpjsgVIoAP96oDtOozd+8
	twFQfBgpVbmIEg+ay93iG+Ilq/p3zEHpoeL86q+Z2KmP0DXyFuYPXlGaWGtvxow8iCSr
	74U7fifqDwHL67Zrjg+wsPhv2iZbcVaYJiiJa/2c67jPSpcBI6XiEjGK4jEVfpyjYt3K
	VVwl4lElaEDSpVnOEWOov9gVeaDLhkJpsnuy4iK+YKdoeVJB33aW48mMTJklFdQHZAMp
	3odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fliZqGvRhT37hkPUWE4yXSuKFu+pZegGe8TxemwEpWU=;
	b=psSrtinQQUuQ24DSEFQfVCbfauOy9763GrwL1x7jgVdx99X/+X/h4F7sPs2FWXIrTF
	7FuRVjVwmGNe9X7Myl7RMp0NzTcxonu2zkDIZHFqPJAzmbzoM/kBLk5MS2gAIGcxM22Y
	3yRpVVuzLSKrSfI13hc+m9q9AN0y9920flpczMA8rK4oGOGJoZvMn+oObEDW8z0Fgfir
	KdSKAjr7VhogPwNZ5JgOYw7e3JYmrY55j3xy51RvFy2M08e/ZmQnQSsS+gZiIo1Hoo+j
	B79EP7Z2imBAaBV9/x+UyTQXDuqvUTIFktEXw6KZxms8BuJQnlBf666uHCTcy8UTIAkO
	OQgA==
X-Gm-Message-State: ALKqPwcdq9Rw94sFAVQyc9Ps97HsEZH2iB7VnprZEINMwOL7JfG2K1uu
	jZKhIlfHsmE/2mdYrhAd0TvBjg==
X-Google-Smtp-Source: AB8JxZqK8UanpcHja1+zVZSoVgtEhayz3LqIcOFD9bi3f3jYqGjnNP22U01t/aUl5FYK54YHjsTWVw==
X-Received: by 2002:adf:ac4f:: with SMTP id v73-v6mr8029167wrc.5.1526335199587;
	Mon, 14 May 2018 14:59:59 -0700 (PDT)
Received: from localhost.localdomain
	(host10-248-dynamic.0-87-r.retail.telecomitalia.it. [87.0.248.10])
	by smtp.gmail.com with ESMTPSA id
	v192-v6sm10135242wme.45.2018.05.14.14.59.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 14:59:58 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 May 2018 23:59:52 +0200
Message-Id: <1526335192-10242-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH] linux-kexecboot_4.4: remove superseded 3200-mtd.patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2018 21:59:59 -0000

The real partitioning is detected by the kernel mtd
parser sharpslpart. No confusion between 300, 3100
and 3200 mtdparts anymore.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-kexecboot-4.4/spitz/3200-mtd.patch          | 13 -------------
 recipes-kernel/linux/linux-kexecboot_4.4.bb                 |  3 ---
 2 files changed, 16 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-kexecboot-4.4/spitz/3200-mtd.patch

diff --git a/recipes-kernel/linux/linux-kexecboot-4.4/spitz/3200-mtd.patch b/recipes-kernel/linux/linux-kexecboot-4.4/spitz/3200-mtd.patch
deleted file mode 100644
index 4b2a968..0000000
--- a/recipes-kernel/linux/linux-kexecboot-4.4/spitz/3200-mtd.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
-index 953a919..14e7736 100644
---- a/arch/arm/mach-pxa/spitz.c
-+++ b/arch/arm/mach-pxa/spitz.c
-@@ -802,7 +802,7 @@ static void __init spitz_nand_init(void)
- 		spitz_nand_bbt.len = 1;
- 		spitz_nand_pdata.ecc_layout = &akita_oobinfo;
- 	} else if (machine_is_borzoi()) {
--		spitz_nand_partitions[1].size = 32 * 1024 * 1024;
-+		spitz_nand_partitions[1].size = 43 * 1024 * 1024;
- 		spitz_nand_bbt.len = 1;
- 		spitz_nand_pdata.ecc_layout = &akita_oobinfo;
- 	}
diff --git a/recipes-kernel/linux/linux-kexecboot_4.4.bb b/recipes-kernel/linux/linux-kexecboot_4.4.bb
index cb3f544..576eea0 100644
--- a/recipes-kernel/linux/linux-kexecboot_4.4.bb
+++ b/recipes-kernel/linux/linux-kexecboot_4.4.bb
@@ -7,9 +7,6 @@ COMPATIBLE_MACHINE = "|akita|c7x0|collie|poodle|spitz|tosa"
 
 LOCOMO_PATCHES += "file://locomo/0091-locomokbd.c-invert-KEY_ENTER-and-KEY_KPENTER.patch"
 
-# only for SL-C3200 (terrier)
-# SRC_URI_append_spitz += "file://3200-mtd.patch"
-
 # Zaurus machines need kernel size-check.
 KERNEL_IMAGE_MAXSIZE_akita = "1264"
 KERNEL_IMAGE_MAXSIZE_c7x0 = "1264"
-- 
2.7.4


