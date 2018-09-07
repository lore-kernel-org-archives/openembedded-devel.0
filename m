Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B263797B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 10:46:23 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b19-v6so14304365wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2XE10w+m1LYv1pHl7eCb1+znalidcyHmFKtdc5nXWoc=;
	b=iLnKRUjv9SlvITwjDb9RJCPd7M/RfTXkKWbrieT8sY2MC/o87t3vqtXa89tGiwVTIA
	LMNMhqCeV4dOoPYUwoiya5Zj7GBjtNKpV/byVfUnV2egIoX+WotCDIL6Sd4dZrMWf0iT
	iQcbV2ZMUyGHm7fs2qxHXq90Zq5a3XborwWCSDAj2w7Q90o1iY3MD09oCy4UGN4eTbwA
	w2p0w5z6Hf+rdBHVHk/pMLyhcKRz9zdtUux2KNFc02eoLelwlwZOHn3tosoX1SMlL+IN
	h5nnCNGbxnS++CINu7h1LCuALKFYKxqfoemAM2yL08OA4VICG76PMGCz184gycZ7yqJ9
	v0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2XE10w+m1LYv1pHl7eCb1+znalidcyHmFKtdc5nXWoc=;
	b=lH1KN9PB2SzRT1BISHHKtBQBLUBcv0zIFWiwr+yLuMbc++x3nwV0nCgg2friw2oXFP
	Dwh3Tp9WxRy29ap4du3qpqFNpAnqogIh3i6GD2ovv8X4bwq8rr0by3Jrklgf+q5dC0o2
	RaPy6Ee3Pwle3drShqvA6N19yncxjlKvTIlrMfjT0s/+oVCt9I5LpCkx5ICWuWUzSXiz
	6SwR+OgBypX/B6MSt1J1nR06/hTDras/zKbEloF4OJAPXPvDPzJHABZBVEnF49zPNaRO
	uTh+3hTdnWSeSl8ORZ2T4wLxtyDc0ld/wm8p0HxVZFIySrHilZUZhKotMhYm9TkeYBZe
	0XeA==
X-Gm-Message-State: APzg51D6lzfkS4t99z1s3M1XWfcFDp9m4+PhheztA9+0Am6yhoBtClzM
	zhlD3XEZaxoBMc/D85VGRvLhto09
X-Google-Smtp-Source: ANB0VdaGcRB0iYdAmDJuufC9G1oxFANZW5HtZSXcReiq5UzhedHsowJ/QrBZzSWS11t78R2CNkhBkg==
X-Received: by 2002:a1c:b157:: with SMTP id
	a84-v6mr4622665wmf.18.1536317184009; 
	Fri, 07 Sep 2018 03:46:24 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host63-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.63])
	by smtp.gmail.com with ESMTPSA id
	o3-v6sm10318746wrn.58.2018.09.07.03.46.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 03:46:23 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 12:46:20 +0200
Message-Id: <1536317180-11032-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexecboot-cfg: add new options for DTB and CMDLINE
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
X-List-Received-Date: Fri, 07 Sep 2018 10:46:23 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
index 804ec32..f90e234 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
@@ -19,9 +19,15 @@ LABEL=${KEXECBOOT_LABEL}
 # Specify full kernel path on target.
 KERNEL=/boot/${KERNEL_IMAGETYPE}
 #
+# Specify which device tree blob to use
+# DTB=/boot/my-own-dtb
+#
 # Append this tags to the kernel cmdline.
 APPEND=${CMDLINE} ${CMDLINE_DEBUG}
 #
+# Overwrite kernel command line instead of appending to it
+# CMDLINE=console=/dev/tty0 root=/dev/sdb1
+#
 # Specify optional initrd/initramfs.
 # INITRD=/boot/initramfs.cpio.gz
 #
-- 
2.7.4


