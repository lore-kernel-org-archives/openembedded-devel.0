Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 18A81719A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 20:21:35 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id b9so4031143wra.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Sep 2017 13:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VX8tFAyc4cLOl1KfOX5mzkWea3GXHMZ3Av6xxAOpLXY=;
	b=YxV09bN87fZvQOeU80WJHB4n/nIOQinV0OV6fXsmc2A0ubGI73fO0MsrzqI9I8PhWn
	pzDFOHv4F25/1ai05bIHJ+CG/AfU+ZueR9sAb/fZ2TC8KTlJo7fh+vqFdzmoXDhYK6BZ
	2Yf8v0tMNVh11P/L5bhT7eJEEpeQemB2jeNhh2cNKvsiUTwgW2QNNs8tHo9Orkd+zbNQ
	w2zVUhLKqz+ys/Dg2BVJ3V1wRzsTMVMFSQfL6QbxDzIVnpKDJiSkMW3v9KkkGwN6tETR
	a4fgkA2SlsW47dSaMa3WNSgzZ2WXCKUs9EuwJ0PSl0PL8LBCpey1K1j9gcwZY1gHJk13
	TeIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VX8tFAyc4cLOl1KfOX5mzkWea3GXHMZ3Av6xxAOpLXY=;
	b=O37kUglkf1M56O5JQ0ZRufs3UOgxSFY9Kt63x6EtSYbq2NhRAx26SAlrBYSe3lV3ms
	ciFvKvZEW6lF7I/kwHmuuqfW4zc5qiXQgahSUwhrYoXPbq1EyCIYoio2oRKWXh2E2klT
	smmpwdP0H67/3GciXdJWnK5OsgKrA6RNtodhFXLDW0SeMwvB+3/TT3BIopvkzQeiBEOP
	UAfdLNJBhRWgSMjHKL9n70ZTeifbNysPbhvnM/LBBQM1eW3avrd9E6T4ju/7d96UilbQ
	C+qqlaP5xGJIDgmSiFa6FBzu1pNKaNBcRAsmnPVKjpmEo/l8nzhq6WYJau9tfyurLC50
	6wKw==
X-Gm-Message-State: AHPjjUhSQSCz03sTBsxeqRND4UTZ5L8blU49kpM6tiy4icqYPAdWmhVu
	Lg5BRMPE1mSfscpu
X-Google-Smtp-Source: ADKCNb6kQk7Ts5sH9YX0cKAyP2KUsZXsLOMPQ+aMHFuT1yK7JpD6vwiB9nThZvYf4af7MDUxpM343g==
X-Received: by 10.223.184.251 with SMTP id c56mr23180498wrg.145.1505679696692; 
	Sun, 17 Sep 2017 13:21:36 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host224-10-dynamic.249-95-r.retail.telecomitalia.it.
	[95.249.10.224]) by smtp.gmail.com with ESMTPSA id
	q19sm5833025wrb.17.2017.09.17.13.21.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Sep 2017 13:21:35 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Sep 2017 22:21:27 +0200
Message-Id: <1505679691-3610-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH 1/5] linux-handheld-4.4: add support for f2fs
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
X-List-Received-Date: Sun, 17 Sep 2017 20:21:36 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-handheld-4.4/akita/defconfig  | 1 +
 recipes-kernel/linux/linux-handheld-4.4/c7x0/defconfig   | 1 +
 recipes-kernel/linux/linux-handheld-4.4/collie/defconfig | 1 +
 recipes-kernel/linux/linux-handheld-4.4/poodle/defconfig | 1 +
 recipes-kernel/linux/linux-handheld-4.4/spitz/defconfig  | 1 +
 recipes-kernel/linux/linux-handheld-4.4/tosa/defconfig   | 1 +
 6 files changed, 6 insertions(+)

diff --git a/recipes-kernel/linux/linux-handheld-4.4/akita/defconfig b/recipes-kernel/linux/linux-handheld-4.4/akita/defconfig
index e061aa3..1ade62d 100644
--- a/recipes-kernel/linux/linux-handheld-4.4/akita/defconfig
+++ b/recipes-kernel/linux/linux-handheld-4.4/akita/defconfig
@@ -353,6 +353,7 @@ CONFIG_DMADEVICES=y
 CONFIG_PXA_DMA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
+CONFIG_F2FS_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
diff --git a/recipes-kernel/linux/linux-handheld-4.4/c7x0/defconfig b/recipes-kernel/linux/linux-handheld-4.4/c7x0/defconfig
index 1eedf9c..43fd073 100644
--- a/recipes-kernel/linux/linux-handheld-4.4/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-handheld-4.4/c7x0/defconfig
@@ -282,6 +282,7 @@ CONFIG_DMADEVICES=y
 CONFIG_PXA_DMA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
+CONFIG_F2FS_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
diff --git a/recipes-kernel/linux/linux-handheld-4.4/collie/defconfig b/recipes-kernel/linux/linux-handheld-4.4/collie/defconfig
index 32c79dd..cfa07d2 100644
--- a/recipes-kernel/linux/linux-handheld-4.4/collie/defconfig
+++ b/recipes-kernel/linux/linux-handheld-4.4/collie/defconfig
@@ -289,6 +289,7 @@ CONFIG_DMA_SA11X0=y
 CONFIG_M62332=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
+CONFIG_F2FS_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
diff --git a/recipes-kernel/linux/linux-handheld-4.4/poodle/defconfig b/recipes-kernel/linux/linux-handheld-4.4/poodle/defconfig
index da2ef8e..5304843 100644
--- a/recipes-kernel/linux/linux-handheld-4.4/poodle/defconfig
+++ b/recipes-kernel/linux/linux-handheld-4.4/poodle/defconfig
@@ -289,6 +289,7 @@ CONFIG_PXA_DMA=y
 CONFIG_M62332=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
+CONFIG_F2FS_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
diff --git a/recipes-kernel/linux/linux-handheld-4.4/spitz/defconfig b/recipes-kernel/linux/linux-handheld-4.4/spitz/defconfig
index e061aa3..1ade62d 100644
--- a/recipes-kernel/linux/linux-handheld-4.4/spitz/defconfig
+++ b/recipes-kernel/linux/linux-handheld-4.4/spitz/defconfig
@@ -353,6 +353,7 @@ CONFIG_DMADEVICES=y
 CONFIG_PXA_DMA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
+CONFIG_F2FS_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
diff --git a/recipes-kernel/linux/linux-handheld-4.4/tosa/defconfig b/recipes-kernel/linux/linux-handheld-4.4/tosa/defconfig
index 0512ec3..04ee9d5 100644
--- a/recipes-kernel/linux/linux-handheld-4.4/tosa/defconfig
+++ b/recipes-kernel/linux/linux-handheld-4.4/tosa/defconfig
@@ -353,6 +353,7 @@ CONFIG_DMADEVICES=y
 CONFIG_PXA_DMA=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
+CONFIG_F2FS_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
-- 
2.7.4


