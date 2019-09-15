Return-Path: <scottellis.developer@gmail.com>
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
	[209.85.219.180])
	by mail.openembedded.org (Postfix) with ESMTP id B9A5A7319F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 09:29:13 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id z7so2349943ybg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wUNxODL1oTqQHB3mA+pbbw0ILJm8mlNFfJCIeZ+/uKU=;
	b=bOvvoGOf7FUjEPrUZ3VjGCIDzShXJdUj/TBmw3vRGAjXFU8ntgM3rgz5S16RNrWK1Y
	pU8ji590DiUvbNHXWE+WuMiAk2dS32HmpsaKtS3gNHYXUqyBN5lCty7F9HIhmrTIfljb
	Gn/1oiFuCxLQmyCNT7nw4bvlig/I1xxx7umg/psx/RihBzQLLObSqPVnqdi9/ECNBXNd
	7IdHQO1+SEGx61N0LzrN2sbmSP/iBm9ZW9wPdyeuFgG7NrH8QBZPhYkpCWyA+toObVQC
	g0nLjYmWGaEccS72bL4V2G1bJN/k5r05HnsL7DDtSSM9APPEHoQT+PKWrNa04STjQu3E
	XC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wUNxODL1oTqQHB3mA+pbbw0ILJm8mlNFfJCIeZ+/uKU=;
	b=uIc8OOD4xjIC/6ZCCzhsLHjgW5354H7H26ruttT9ofDy//iTUH/P4dV6W9DUq0zYWi
	IUYvDI7Zk7MDCf1YrMA7sheSkgG4Ax+TGXIYljW6VkILZB2xrT7hMh7QsHyHygpcYAAO
	ejvIIlkENlZOfGWoO8d0qdZIezTHXONpAMsw106DmEpQdPwT/5neo5g5Yqx2iZvkOD6o
	fBxm1wVkQ2ZVXg/qIfWoY0n5OssyJrYRfLpDAQBsxMO3tl4uIRMtyt9W+3QUxNbtPjwD
	tUvkknC1l7ZZnJZ4lgOa8Hih4KSQYwLYx8LwGu3Xgr1RTBKfjgcrswiV59PIx7NCOg/f
	OxhQ==
X-Gm-Message-State: APjAAAXCBaHwjyTp3BDySYwbsirIoVO5IMi8VYR/gp3bCS/UiieMg/8T
	6NEqqGbKAc7MI9Jbb+TSBgDzsaDH
X-Google-Smtp-Source: APXvYqy9reVrlC6Qir8II1abybRQY/Q4wNVRcghFyqxqPWZbnVEvFVCfVv+4LMT60FsN2JSaQfWFnA==
X-Received: by 2002:a25:d08c:: with SMTP id h134mr5919756ybg.4.1568539754549; 
	Sun, 15 Sep 2019 02:29:14 -0700 (PDT)
Received: from fractal.jumpnow (c-73-234-253-132.hsd1.me.comcast.net.
	[73.234.253.132]) by smtp.gmail.com with ESMTPSA id
	q124sm3977727ywq.8.2019.09.15.02.29.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 15 Sep 2019 02:29:14 -0700 (PDT)
From: Scott Ellis <scottellis.developer@gmail.com>
X-Google-Original-From: Scott Ellis <scott@jumpnowtek.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2019 05:29:10 -0400
Message-Id: <1568539750-13527-1-git-send-email-scott@jumpnowtek.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireguard: Upgrade 20190905 to 20190913
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
X-List-Received-Date: Sun, 15 Sep 2019 09:29:13 -0000

---
 ...eguard-module_0.0.20190905.bb => wireguard-module_0.0.20190913.bb} | 0
 ...ireguard-tools_0.0.20190905.bb => wireguard-tools_0.0.20190913.bb} | 0
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190905.bb => wireguard-module_0.0.20190913.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190905.bb => wireguard-tools_0.0.20190913.bb} (100%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190905.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190913.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190905.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190913.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190905.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190913.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190905.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190913.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 4848740..b0b48d0 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
-SRC_URI[md5sum] = "97a8f781cb683f3a23ffa2f0cdb008cc"
-SRC_URI[sha256sum] = "78767ceeb5286beaa851145f072d920a340a9f1b771a2943b8efd638cee1a8f6"
+SRC_URI[md5sum] = "ec2345dfc8ffc61ccd7529d5d19b2602"
+SRC_URI[sha256sum] = "997327185d2d1b597dc118f737c0c165e2a2c21453387ea02659f1159d148518"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.7.4


