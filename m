Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA73777D0C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 19:58:10 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k10so6649044wrk.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 12:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1RbNFgJja2+KVOSHfTfTdZ7Ku5befSUL7KHA+I0373c=;
	b=N1RuSyvRNTgQalBUaKJa1SQRFByw0QMFV25GUepZOvcKjUroZmkTKKB7cm/1abqFAc
	CB7S4IYo3EzSsTWmcxTbwuQgFgKdIzUJQ76lP1I2P2JtCsjFvA51ahmWlNhgx78RvemP
	0HabKmVnl5CDqSVryWderX/unNVSzq74FQCVCTCFLQoj0Ba6MlB4gzYIpgg54gaIWcKS
	BsYCWPXDtzKKNbKIFaLeIPs28AH1GXv7/CZm+vym81W02gDAViB1irqqCukkJmQLfMFZ
	uX5zPRn7oBisWJK7UXNeI63Dlio133XRNBfcaMK295qIReG7BlY1q7swyDwggoMmwphM
	lYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1RbNFgJja2+KVOSHfTfTdZ7Ku5befSUL7KHA+I0373c=;
	b=b1/mJJdED5vWJ3J45Uv6PDSjKupv2D72f5129XkpTwjMBjx207q9s8UJhccIgdy3Ib
	QQR2vZoyCnFy11yX13UmGmE5wv1DtzSxpHnJZTU85RXqElA6Fd3740nsvDdUO9xMI3bF
	2pUeOMZ7lJjIrAehaehLfUkhbbc94ZoL6ou07Pn+WGxzSye+FDgL/FyldRAEJ7Laul1L
	3a5Cu9D0+Qam84JM8saFZKOWTK9ZE/SW6dVdj3SUlwEQjG0Yl41u4UFJLXJv1qHbhE3d
	fA8aXzlUzTsX/N+l7mtxbrVp17gZQr7PewTPlKRaHsL2dot92R97rkvPQ6Pom6yB8ue2
	GFwg==
X-Gm-Message-State: AHPjjUjO0s8+r0hJlpZq7cu4G8ZTxeFTKz9g0+nXFubMy4ncRcMX2VWg
	gM701rOZtOPuBMplCoSZUimvAMdB
X-Google-Smtp-Source: AOwi7QCqXHEHNH3iZY8cybd2yZZKA0UPbpVFOzF3ZYMNKZofXthpjSl10/YgIh5DXmjjbjqVxU6w9w==
X-Received: by 10.223.197.72 with SMTP id s8mr20380674wrf.120.1507060691703;
	Tue, 03 Oct 2017 12:58:11 -0700 (PDT)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host184-216-dynamic.24-79-r.retail.telecomitalia.it.
	[79.24.216.184]) by smtp.gmail.com with ESMTPSA id
	k126sm25839452wmd.1.2017.10.03.12.58.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 12:58:11 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Oct 2017 21:58:04 +0200
Message-Id: <1507060686-10326-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH 1/2] ipaq-boot-params: replace deprecated license file
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
X-List-Received-Date: Tue, 03 Oct 2017 19:58:11 -0000

Use '${COMMON_LICENSE_DIR}/MIT' for MIT License.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb b/recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb
index 5696e9b..c8ea1d7 100644
--- a/recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb
+++ b/recipes-bsp/ipaq-boot-params/ipaq-boot-params.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Kernel boot parameters for HH.org bootldr"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 COMPATIBLE_MACHINE = "h3600"
 
-- 
2.7.4


