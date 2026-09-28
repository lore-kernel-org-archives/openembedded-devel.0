Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A774CA5FA6
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:57:18 +0000 (UTC)
Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64918.1790618231110934011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sZGZy9r0;
 spf=pass (domain: gmail.com, ip: 74.125.227.168, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d2c37b0bso1106718a91.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 10:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790618230; x=1791223030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pANnCnKur9YjFM3RoClUa1csxlxuFFoTFRW6X2/zITE=;
        b=sZGZy9r0wy9vV5eZIoG7DJyxBKvWI1LlUuRkCWCTjjadMSbsrDpuDo+8pxnaJ/SXLT
         tORSnpHUw3jLr3dnjAYhpN17E5Y4uXK6sIEmPh1Ysf0ul16SNALRVivhBEZSgafjCqzD
         g+6p8pK2QmG8GSGhHFiLIhdnY1RkSYlsn9PUaYTiS1G7dgR8k+sazZg8/Gd5ShyP0a0A
         KtcldaMAjEZNg6vpvfn4M42IhTMNp62EuZ6bPQFIdZN2vyz5kf5yD0pm+yzwRw3E6Tpy
         gi8RZK0Dae4IT6np+lxZf/cF1gG8sKVdUWxiWxYypVIBIKB2GEJXUJd4biOratLlx8Vc
         QXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618230; x=1791223030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pANnCnKur9YjFM3RoClUa1csxlxuFFoTFRW6X2/zITE=;
        b=aiLxplAfaXUFOMmRSXBl4mFN3H+oREv/zZUuqUjy7vsCKNFBAe4eXMnB248D+lg61N
         kTkKxHU6yJ1vbK5bhlPaKabZU9hEl5x/8rfcLvcQMf4ai25da51KlfItc4LLxuHVDT1j
         14oPTPnob2ivaRYaVJi4iH2sdRpxG91rK3k/FuPmUzyn8r175oZC6Dyye+pKJpuin8lm
         P6oMu6gVN9KvCCX+HGLeU5wDRw6zA780dRyQhZG6OZZUHqlPW6Uj0tl9SZpNuuRSf2wE
         qGKF+rANslxJq4PslGZOFJwu0s9dkOHHG3OP7lROlYdws87iIRu1eAPzQ7mSJv6n/aXC
         trmg==
X-Gm-Message-State: AFq9FYK/pWUJVsz0Vs1h5xUu/Yfw285szTzvVXFa8AUid149VBo1RB2V
	RA4gltA7g+GZD3s2ow3s0hrvTBEZFkyc1nsP1JCp5kjY+K3Q6K4SIzc5ik314w==
X-Gm-Gg: AYBFou31UNd4gLyNkjRAzfp1qxUyuY7RlkyKeSujfopKElBaTgZDUR+k+EhEoa2rBn2
	3PM+s/fUiwhfbW1XEMZ7cHkh8wGa6s/bzK5yrxu4NQTZQB9HGX6meGDFx+b9xnAVX1bNbW7wpXJ
	WneaHc8F1mcQx3IWnJBI60ub1Mmq9+W+t8Wsv3LvpLQ9KcRjRFiAPQY8v/TEEkSNqjYLp9NOCxm
	DmJriduUbI1eh0vvr+Nn0L8Yo1kmSDN//Z9JZtO+gWn3UcfoldvOCyc/Nthx3+E1DUmCEn9aKiD
	cwL9zRE4KcL4PaPCeRrXizikHLbbBXZ203VSmby8rh8QX9PQ9pIN/vkKzgVdO1fzkBHtnjGRyFF
	BWg/f8d6M7JAEyaKVmLtFdupa6DsbhIZMDPMx7vwbwFayxiupUceKya9oh8kXp9iv5s+FRAEvn1
	mBIyudhkenwafT0MiZzDo55JDBZuoOoTIh86D5KjwKY/E3bFfjVdhM0tbgLMeH23WMSjw9Yh6tk
	uYJSm1aftABCspD6709Uw0=
X-Received: by 2002:a17:90b:2807:b0:3a0:c621:74a with SMTP id 98e67ed59e1d1-3a0c62112dfmr7432568a91.35.1790618230454;
        Mon, 28 Sep 2026 10:57:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4986a1905sm577182a91.13.2026.09.28.10.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:57:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/8] libp11: upgrade 0.4.20 -> 0.4.21
Date: Tue, 29 Sep 2026 06:56:52 +1300
Message-ID: <20260928175656.3501512-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
References: <20260928175656.3501512-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 17:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130464

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.21

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libp11/{libp11_0.4.20.bb => libp11_0.4.21.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.20.bb => libp11_0.4.21.bb} (95%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.20.bb b/meta-oe/recipes-support/libp11/libp11_0.4.21.bb
similarity index 95%
rename from meta-oe/recipes-support/libp11/libp11_0.4.20.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.21.bb
index 259ecb04b8..73e1637572 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.20.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.21.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https;tag=${BPN}-${PV}"
 
-SRCREV = "61dc3acf95b859c88844e000001a99948c0abb48"
+SRCREV = "ad19678991c5882d252b06ed02c4d4fb990913d0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 

