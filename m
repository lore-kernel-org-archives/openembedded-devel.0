Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4AECCA470
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.52855.1759151082585142443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jlm1txpX;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso8287921a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151081; x=1759755881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRlfgFVlHe6tn4vn/imKZf2idnusLeze8LYffEvwN1s=;
        b=jlm1txpXrgrIQW8vZNodw6x7fdowRuxbg8UKytgcVXmCEGoJPm0JuGpvgw2UXXpCc9
         /fJp2ZHQL8cZl9TkmYSzfGM61kZWoEnF7J0uKuCP/RKySk5s1JqWH6ICL+MHxvcu8crU
         fM3+V2tTiLdtP1SagfDYc4Hp8RvMHDDUNRVPzwdhqbYff8VVDy+9h8M7Iq/I3uF+Dh97
         SB4XtggLCxLYGR4BvnMPgXBFGJIJAcWrp4KJLU8cDJFGeAnv5w2BJBHnwBucEHt3cG5w
         bRMEdCBIwN7UNYJz+rjabiudAh4G9NqHviuczHVuF99mI5DxZ0JkImObw0Dhe+j1RNrh
         1OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151081; x=1759755881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRlfgFVlHe6tn4vn/imKZf2idnusLeze8LYffEvwN1s=;
        b=fiEzSoKTMJ5D3+/bay/H/2vyrpXPD2NLDRMrs8DiOhOp9aLK907d7yRx0UURYNnCYW
         yLVzKGWKv8DhEcnZb6SG5rtpk4hfAs3Bz8+pNC6Yh53WDrjZnhvsZoEJqZdcyzXsBkdi
         M/obgVgjeYeUFRA1yqM9rJz7Ehec95x3t1+Ivk4rtqt/N7bjkJ1mOylpL7/dZQRhgrb2
         WKjYTZ00uoj2DVo0ZjJmCI6DUEHxPFlMe0+Bchjo0rl1lOrpi7t539kUvndbVw5g8d3t
         IvpQKPXMRZrjhngY4Xx7aGTBhM3jLcqxSd9DMHXh2Fv2fT7Cf78FbnUNmsYUmHWDBlcM
         d5Qw==
X-Gm-Message-State: AOJu0YzsM7HMGrHj1+Kpf/DhDS7U8lACaG7T2w30M1daAHnSksw7BrnM
	VGkUtDs9sw955rqgCZG5rXQXDXnw6liGGuEX3i7aylVWDw1gFgAOXpliF0xhIw==
X-Gm-Gg: ASbGncvjG4PPZ84bNlTk9zxQw+xzE3w+EvL8GjfcTfvK87Uro3+LVfHpDkXarD77GZW
	uTyicDeMVnMKLNY9jSgrmVIpGG1fZF4ZbYkGXDcbLOYgUxRRtFPic8ztdDKxBf/Qkm2S4zZbsSb
	u+vHWAiyQeth49th5scvsxxqMrCbP+p+HXYINFdMpLaorU/BUKo01nk/Qp0jhoTSq9UiCg5wyHa
	l71y36q4EC7PhbqEh0u7JvGxgPnQGufQeGFDhPbhqN3Xl7DiZyTHLvJfGXIbO8r7FcP15hjpHlQ
	WZm0eb9xfEqFf2nHhWGGCt/+5OEUaupW35WmtjLpgDCynN/rRtEtR/hiiP1N5665Npcu1b7L63T
	cl7FFDGY3obqpOK2Hvy6Q
X-Google-Smtp-Source: AGHT+IH5MwtTvYMsXqV4LPiuqnq6ijJwLoXC7crGibElabh3sdDlgALqGdswFAsRJ62omMCU0vs6kA==
X-Received: by 2002:a17:907:3c96:b0:b04:563f:e120 with SMTP id a640c23a62f3a-b34bc96e73cmr1957871666b.53.1759151080708;
        Mon, 29 Sep 2025 06:04:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 15/22] flashrom: upgrade 1.2 -> 1.2.1
Date: Mon, 29 Sep 2025 15:04:18 +0200
Message-ID: <20250929130425.2912077-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120028

From: Wang Mingyu <wangmy@fujitsu.com>

0001-typecast-enum-conversions-explicitly.patc
removed since it's included in 1.2.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d8e50a9507da7441b1694b025df17b0c8484d44d)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...typecast-enum-conversions-explicitly.patch | 45 -------------------
 .../{flashrom_1.2.bb => flashrom_1.2.1.bb}    |  4 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.2.bb => flashrom_1.2.1.bb} (79%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
deleted file mode 100644
index f2302dbcc3..0000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 3a0c1966e4c66f91e6e8551e906b6db38002acb4 Mon Sep 17 00:00:00 2001
-From: Angel Pons <th3fanbus@gmail.com>
-Date: Wed, 27 May 2020 12:15:51 +0200
-Subject: [PATCH] libflashrom.c: Use casts on enum conversions
-
-This allows flashrom to build with GCC 10.
-
-Change-Id: I2166cdf3681452631ef8e980face2924e9a6c81a
-Signed-off-by: Angel Pons <th3fanbus@gmail.com>
-Reviewed-on: https://review.coreboot.org/c/flashrom/+/41775
-Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
-Reviewed-by: HAOUAS Elyes <ehaouas@noos.fr>
----
- libflashrom.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/libflashrom.c b/libflashrom.c
-index ab7e364..c20d9c7 100644
---- a/libflashrom.c
-+++ b/libflashrom.c
-@@ -188,7 +188,8 @@ struct flashrom_board_info *flashrom_supported_boards(void)
- 		for (; i < boards_known_size; ++i) {
- 			supported_boards[i].vendor = binfo[i].vendor;
- 			supported_boards[i].name = binfo[i].name;
--			supported_boards[i].working = binfo[i].working;
-+			supported_boards[i].working =
-+				(enum flashrom_test_state) binfo[i].working;
- 		}
- 	} else {
- 		msg_gerr("Memory allocation error!\n");
-@@ -226,7 +227,8 @@ struct flashrom_chipset_info *flashrom_supported_chipsets(void)
- 			supported_chipsets[i].chipset = chipset[i].device_name;
- 			supported_chipsets[i].vendor_id = chipset[i].vendor_id;
- 			supported_chipsets[i].chipset_id = chipset[i].device_id;
--			supported_chipsets[i].status = chipset[i].status;
-+			supported_chipsets[i].status =
-+				(enum flashrom_test_state) chipset[i].status;
- 	  }
- 	} else {
- 		msg_gerr("Memory allocation error!\n");
--- 
-2.25.1
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb
similarity index 79%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb
index bdc3ca084c..b2592d294b 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.1.bb
@@ -4,13 +4,11 @@ HOMEPAGE = "http://flashrom.org"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
-           file://0001-typecast-enum-conversions-explicitly.patch \
            file://meson-fixes.patch \
            file://0001-flashrom-Mark-RISCV-as-non-memory-mapped-I-O-archite.patch \
            file://0001-hwaccess-use-__asm__-as-is-done-elsewhere.patch \
            "
-SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
-SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
+SRC_URI[sha256sum] = "89a7ff5beb08c89b8795bbd253a51b9453547a864c31793302296b56bbc56d65"
 
 S = "${WORKDIR}/flashrom-v${PV}"
 

