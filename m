Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 726A773200
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:32:58 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id o16so25945396wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9KDtat1Hdy/wMTfu8hXNOUwEvoXAIWgqqnzn3Fee628=;
	b=cQB8yvDmShB00TMRCKtYojEkPu4JxR0AtxoeqK7TA1JL1tbY6Amet48ZEFIJya7Glr
	af1n74luMiSyDg4vYmMCYH+C8Xb5UppbQVZ6NxV0AXwhUz2Mg3xJG5Jz08puEClI/Lsj
	+YCpj/QWxIghe7ZX/Xv9kJH95R/7AzG3MEW/sVjebWv7jDewsgrT7JExAkyXZTmcu51j
	s83lHDeGcI2hYFBkJD4S8ncb6dWETMi/HZMOdsjcdlC2D8gZd/JKWTNh+6fpVXop7Jah
	cQDimZY6h3Oqe4CS9nZm1+hp6Oj4SlHm6fmOOs1w81rboP6IUqVhaiQE7kM8a3MTsLY9
	HNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9KDtat1Hdy/wMTfu8hXNOUwEvoXAIWgqqnzn3Fee628=;
	b=C/8jr2bGbYK/C2GvgLyyTJtFGrP8dRwr87f1zyoBMp90ZLhWutYvFfPM70X/jEMO51
	rkIIQGDnoRvuXxQTeeln+WxpcWMj12QnI3m3DA7Z2QBivfJ5YGglRPiW4xgxquK2ou90
	LbXOTdjnS1IbZxPXFuclGbPUvsWZi+AUgwAR5erQsZVIsailS06mz8czXnDkr7ZTlP3X
	p6fRzYBN+x8g372whGVFk4b9MMoG4Sc/4qwdTTmzcclS4tZi7SW0IFpvAXrQXXwP8VNk
	ensZKQPComBpmeNbPBH62p5tL8YwbQYJNltBGfNdxgywcuPkuHyUa5KzdJpLlJPWdv9Q
	JNGQ==
X-Gm-Message-State: AMke39l1VkLNACPXlQx67vuwFoTFrV6KyU56LIZw/FxiZzd0py0vm81TEX7wS8MQgGz9ug==
X-Received: by 10.223.160.132 with SMTP id m4mr24362136wrm.116.1487025178280; 
	Mon, 13 Feb 2017 14:32:58 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.32.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:32:57 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:37 +0100
Message-Id: <1487025163-21628-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 3/9] klcc-cross: restrict scope of SSTATE_SCAN_FILES
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
X-List-Received-Date: Mon, 13 Feb 2017 22:32:58 -0000

As done in libtool-cross from oe-core we prefer to be specific even when
there is just one file.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
index 9126975..1a68ab4 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
@@ -36,4 +36,4 @@ klcc_sysroot_preprocess () {
        sysroot_stage_dir ${D}${bindir_crossscripts} ${SYSROOT_DESTDIR}${bindir_crossscripts}
 }
 
-SSTATE_SCAN_FILES = "*"
+SSTATE_SCAN_FILES += "*-klcc"
-- 
2.7.4


