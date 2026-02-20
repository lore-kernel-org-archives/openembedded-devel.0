Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E45C54FCC
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 07:25:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33727.1771572331518367132
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 23:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F9qZ+Sbr;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-481188b7760so14116265e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 23:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771572330; x=1772177130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DgmQ0yNXhrG+CUbTmqRsaHaqHA0TnTZMmoiot+hX5W0=;
        b=F9qZ+Sbr9DTAI5zxbS54aWwxEPIUihky/YRB99l5Ne6R5zu/5X+biFLVE/OgCnfjbY
         sAW13ZPnUFkatWHGxNqox3E5g0wmAa6parxfoIzfMo81W4lUEWY4tjh8erjWVDjWTqJp
         nb29bwTSOzZqejfPr79i3c5xCX3iydqDT4YP1c6QSdM4IfAJh4fL5318t9jH1y/zxZ/p
         9+W6z20L7xA7RRnlFCPUaB+ddZAKfrNXRGET+xsLfhPHz5qEHznsax7O469dHKkyUMKu
         IhvsSVnGlbCalyMW69XM9DDJDHx4d1uizSA6TYRwdEaJJEKENQSalrDD9wmLbUM0PAGd
         YB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771572330; x=1772177130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgmQ0yNXhrG+CUbTmqRsaHaqHA0TnTZMmoiot+hX5W0=;
        b=Ld+IpMDr1RS2Jc7vL8HbD0ruOo1VMH6ocwYJG97qwL6bNPnVA2E2+kmOGyj0aeNb4e
         udVb5q3x9djtYdCUjhANfxAU60EVY5Y/b/p1wS66WIOxrE29TnlMwSzuXbF/0SC0aVMy
         8+zgjfm/CiP1NMLPh24xwxloGD5f59tGYFJoszD0dUKgXWkG+fnJhfaFyFbyBPTjcYHP
         +Za3SwADuvXxFExNi5+2ndWzVaURnzgXEHiU0a4M9z0YRi2DilxxotKb+SAuL0tkHcqi
         t2uLz2qOP+mMpD+EQuiXYqXWmOHsag6Hz/dcD2kW+llLheu68jxiHb+g6KVfwS+/MWdg
         0Ssw==
X-Gm-Message-State: AOJu0Yzi4x+VRhl6Z852DmwQAFKvbw0AjUDJt8z3by/53tXOplKULD+e
	eX9S3bNKQ1IHc/eyLWcjNBs3lXeah+ndbx2Vusy5BAdK+FV92ENbVBo4X6ymWA==
X-Gm-Gg: AZuq6aJHgdRKgxhe7mGe3qxsNkqY55pXHLzzYKtKj1jO2f1mGVYAHYi9ErnsW17+yWw
	cu7GppH61dAI7sZ70jSbTOz0QMX2Ej9Gr3nRG+23gA4NanPJ25Ldsl5Sw7dmavgxK5+wgBX/dHK
	iiTteoa5RLkSB15q1/7fmXGRJ364RwvciVwhLS2wDPbuzJnTw8hgZmgz9pjbKxBPk9AbJuAQgVi
	1UMT5/7XAWFa8L1uRudRgzI51lT2WlaUo80T/DCVfPHe368dAXRhBFoQ+LGUhodZREl+iqo952j
	KrTA3mTEmt85YQH+yS3G0byg2ULwAt8z7ZVqsRr0iyAIg4GsapMLPlRJ2rF6Z93cF1RjSjQuSw9
	khU6tABbvUpS43Mu0x8c5c5W+bQZ55xJrXrOT75h1NfU/CSoR5rj178AhprNoehE/rf9Mr/CQYN
	j3Rd3qThrSGq5xFCew5AiC
X-Received: by 2002:a05:600c:4e54:b0:483:75f1:54f with SMTP id 5b1f17b1804b1-4839e668ac0mr88444565e9.31.1771572329537;
        Thu, 19 Feb 2026 23:25:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a430927dsm12945765e9.31.2026.02.19.23.25.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 23:25:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] can-isotp: drop recipe
Date: Fri, 20 Feb 2026 08:25:28 +0100
Message-ID: <20260220072528.320890-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 07:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124522

This out-of-tree kernel module was mainlined in Linux 5.10.
The previous LTS kernel, 5.4 is EOL, and oe-core ships with newer
kernels - there is no need to keep this recipe around.

It also has an explicit SKIP_RECIPE tag, it wasn't tested since
a long time.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../socketcan/can-isotp_git.bb                | 20 -------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/socketcan/can-isotp_git.bb

diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
deleted file mode 100644
index 530e38ce21..0000000000
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=72d977d697c3c05830fdff00a7448931"
-SRCREV = "7626d0a0707391970080d493ce69638719938da7"
-PV = "1.0+git"
-
-SRC_URI = "git://github.com/hartkopp/can-isotp.git;protocol=https;branch=master"
-
-# Upstream repo does not tag
-UPSTREAM_CHECK_COMMITS = "1"
-
-
-inherit module
-
-EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
-
-do_install:append() {
-    install -Dm 644 ${S}/include/uapi/linux/can/isotp.h ${D}${includedir}/linux/can/isotp.h
-}
-
-SKIP_RECIPE[can-isotp] ?= "Not needed with kernel 5.10+"

