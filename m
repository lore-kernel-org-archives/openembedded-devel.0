Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EF1CAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 06:33:16 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.6893.1758954787065298616
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 23:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTS8u+n0;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-4257f2b59ffso18829995ab.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 23:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758954786; x=1759559586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kwy/eD9rTK+3khV1zW+tHuILRlUab/aO4Ctkq066NqY=;
        b=OTS8u+n0r58dKHxyfVD6+jZaa95MhQDQzz56MSa3jnq/3Gf7UnHD+1msia5EAq0KJx
         YIxVuszkKK8pKCM/L5Sz40EaeDxqGOumcLfT9rTkpdaVfkdzdDzHQnZO4l4jF17btuOp
         B1n0EZw2x2ZxPJicDj+OmBzXeXOVc/1kY16GNb7uvGJUVr62v23L53Tnu/GVzrovIPbn
         iUWxgIDhrQ71BIRQM+trgyVceCP92b2wj+2MTsLtQfibv2ouUy80s48ECwG90TskRv/I
         FOJ7hYhd4RJ2OV6bH961e7ujQEbry73PAEjwwvZTIKYyInolEo6Z9lTN0ea6dIAxSxR1
         w/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758954786; x=1759559586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kwy/eD9rTK+3khV1zW+tHuILRlUab/aO4Ctkq066NqY=;
        b=ZbqbB+RZCfZv2ipx0gT28rnUGb/Ogb4NbiNla8xCgJuCmaRf+YEeUszCCdvmRDqBcG
         hHwa9SUoXROs3IhfiG4TcpeJSnmEaYVQrVGOT3bIMbrHGLrhL1zgGa4FRgj/zEJmvlja
         qYbCDVPgrfbnfgwcrY07KB9owLxq18Oo1+nNSARH7yIHCEaaF4T3D/QNM1kR1EdZ6ZKb
         9R1qgqoG55KQqL/G1q/955M9bDRXwqZFMrmb+66Fb1RysZLg8SvDPB7y82rFsm2GmkxY
         YJWELak1vc0hozCZgJIFt0WcW5U69rejunwWWo1BfgBAXtuRUIOGRUGDy5r2c+ouiMoe
         ua6Q==
X-Gm-Message-State: AOJu0YxUt6fotBldKN41dHdiZghxzOUO8E9/nAkZ52K3c6uKc+6lXUHV
	LUwZeLAhGJhew9D5dZGFQVejMIsjM06646Q85CPUWtNfdEVk9pJecp52gz7PtA==
X-Gm-Gg: ASbGncumpz0uqM5wiD17M2tJ8HZ9VRA+i0gekkxXWfASfyDKi0/ckXlty88uhy/OEJK
	tsdl6ZOP53Ux7aQmpD1xKkoAQ3PJwzU78zRhZVDnhc1/T7LjlrO6/RkWQjrbvdzH1BEUBrdqcbF
	lnp9MhnlrmiYCZrLLW0mk3fE1502PPppk7dtIoCMeuP0TFj9eee6e9Z9NU4l5uTeMEgPl9bjukx
	FHIEm7IF4oDZkhSjmez5VAyPsQ4oK+2eeLmcSUkMbfLQYQCHVeX5yozhqrYIge7kse6kKCEoEpg
	SF19AXYt1lgMI9tfMDt8828yyA8DHUAKpWoxIo+yS/nPQjM9z3FOWLUKPnHPb5uBKnemNIuGNbH
	wJW0IwTA3qiK2QBuWtQmh7QvvcDRPPpTyDUTJmRU10C5j5yARUDY=
X-Google-Smtp-Source: AGHT+IG6VdcgplYaVCIKR1b4GZoyUZf5hQegrjReFvR2L+b2aRwG9MfrL2udhIH/QA5Lh5UD2RfbKA==
X-Received: by 2002:a05:6e02:1c04:b0:424:7128:a06a with SMTP id e9e14a558f8ab-425c1e90700mr148873725ab.7.1758954786123;
        Fri, 26 Sep 2025 23:33:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bfab12c4sm30225685ab.22.2025.09.26.23.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 23:33:05 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 16/21] iptraf-ng: upgrade 1.2.1 -> 1.2.2
Date: Sat, 27 Sep 2025 18:32:11 +1200
Message-ID: <20250927063216.1865627-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
References: <20250927063216.1865627-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 06:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119970

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- small cleanups: remove unused code/variable, correct format specifiers
- serv.c: fix and validate port/ranges entering/loading/saving
- SECURITY FIX: CVE-2024-52949: interface names: limit length to IFNAMSIZ

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8c34d52003956c682b99a463fa83ff86d65def40)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../iptraf/{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/iptraf/{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} (89%)

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.2.bb
similarity index 89%
rename from meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
rename to meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.2.bb
index f9e2c7873c..3bfe100138 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.2.bb
@@ -24,12 +24,12 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e2b3850593b899b1a17594ed4cc4c731"
 DEPENDS = "ncurses"
 
-SRC_URI = "https://src.fedoraproject.org/repo/pkgs/iptraf-ng/v${PV}.tar.gz/sha512/44d36fc92cdbf379f62cb63638663c3ee610225b9c28d60ee55e62e358f398a6b0db281129327b3472e45fb553ee3dd605af09c129f2233f8839ae3dbd799384/v${PV}.tar.gz \
+SRC_URI = "https://src.fedoraproject.org/repo/pkgs/iptraf-ng/v${PV}.tar.gz/sha512/275a345ffd3ab9578c4d159c3a8667326224b4a58b2e7787c4db518b81973d87c04b4b6c5275a721858d01a9b44a0200f8defc06c6f88655aa38d4fa6146ea1d/v${PV}.tar.gz \
            file://iptraf-ng-tmpfiles.conf \
            file://ncurses-config.patch \
            file://0001-make-Make-CC-weak-assignment.patch \
            "
-SRC_URI[sha256sum] = "9f5cef584065420dea1ba32c86126aede1fa9bd25b0f8362b0f9fd9754f00870"
+SRC_URI[sha256sum] = "75fd653745ea0705995c25e6c07b34252ecc2563c6a91b007a3a8c26f29cc252"
 
 inherit pkgconfig
 

