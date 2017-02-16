Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E22A57727F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 22:34:10 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id z61so2814304wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 14:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oSIulUvtIWkhJgSjnOstFtSkRBzPfKzgSWcvs+uOhv0=;
	b=SY6oST+Hfvsznkcj84idcLHrypVLHAtP4iaV0YYdiH7G8LEJnup2WsLqPSy3rRBwjt
	IvlQ749CkSNAbiBz2idZKF5awQVNFJWouPcMEYKCD0JdajBTLQVwRh2wY/NQV3SIrIKZ
	gxeGDtyDK9UMIZZ/OzPecq/N97EJmVUwIzDry3FFz/h3qMg4c4WXGJ7z27RQ41hAyz5Z
	L5K9M73bQHm4yDWbyzbFBCH1oWr0xvA7YsgecysWogOgmXVnh8uRYTttz2Uw6ZeodcGU
	rX+C5+fF3KhUbTFvtTtw1s8LhJBKZQPAzR09EYCkv/0g4rH7mDc+MWOld+9DrRla80Hf
	ouVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oSIulUvtIWkhJgSjnOstFtSkRBzPfKzgSWcvs+uOhv0=;
	b=SdPBUOz1X6JGuDDwUvroDUezdeDdJ0Y3nvED5XCK84nxvjMrb1+uZuctxdLEE+hKdX
	X4jZ2g1gn7t2u7AicyfxWP07t6fh7chJqL7LRGjkzGx4rAxF6/A7ml+ZfQJwtHsmRVpK
	CqK3DIXXv8FucjzPSxBY/An/yYA1cx39ICkdKcmYL3J//XupNpPLZqgq2YJd+ydr4Ykz
	IfAL4/OD/TxL/NbAXHzgNaPYht8LG6lSoZ9wGegbrVPig9KgLn6M5PExvHiFYlzEOAct
	54jVAqhpNMLCvfKzGOl9wvFsWZjDYjYiqSY3Uj0wjl1yy54Mp0+na570Yv1o3EyauJL/
	cPyQ==
X-Gm-Message-State: AMke39lwkB06gBQMVAWA/ipbVXhNDrAP40VarJx11GCwTa7lN3qEAMUOmiuIT95SJNrgOQ==
X-Received: by 10.223.155.221 with SMTP id e29mr4263421wrc.107.1487284450852; 
	Thu, 16 Feb 2017 14:34:10 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host8-253-dynamic.25-79-r.retail.telecomitalia.it. [79.25.253.8])
	by smtp.gmail.com with ESMTPSA id
	186sm1931696wmw.24.2017.02.16.14.34.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 14:34:10 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 23:34:07 +0100
Message-Id: <1487284447-4913-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] initramfs-kexecboot-klibc-image: remove blacklisting
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
X-List-Received-Date: Thu, 16 Feb 2017 22:34:11 -0000

Ex patch 7/9 of the 2017-02-13 serie, not landed in patchwork.
Recipe does build with the recent changes for meta-initramfs.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index 8010c91..6b845bd 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -10,5 +10,3 @@ python () {
     if d.getVar('TARGET_ARCH') == "nios2":
         raise bb.parse.SkipPackage("'nios2' not supported arch")
 }
-
-PNBLACKLIST[initramfs-kexecboot-klibc-image] ?= "Runtime depends on blacklisted kexecboot-klibc"
-- 
2.7.4


