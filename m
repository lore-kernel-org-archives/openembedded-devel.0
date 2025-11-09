Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7471CCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27187.1762704024135544696
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeCHfuFt;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b32900c8bso358338f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704022; x=1763308822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tk1GPN8SdNccX2PD1TLt8AcXhAMj/rqrHcXaXv8LUE4=;
        b=NeCHfuFtKC2erwnPPIv0Y1ukpk5yxjS8WB5NrMSFB7fW94JeD6+K1pBVuFo9A+IMz4
         xDAJVn08IKfbzB90yUCna3Qm3rao3ghk7bjN9f9xbM1s8oyWVT4X6tRj7k8P0ieO9cn5
         qosFeexZtM/PWewf/6H1RuYS67atp1TUDgm++B9RtAHQiQZGYjJfWavGEAWDntO7Fdt/
         asKoI+oI+WNqIgTQzQd97lsq7WQUhRBZ9Y/VsveWZHRvGiVpg2GHOKPhQqSKFlfZDGVH
         JPgRrrEr88HMEutB7SL/Zp3Z/lKJlSKApWLEfrVsGfUTWUmw5l0ZNsgowkL3vRoDYGmv
         IeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704022; x=1763308822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tk1GPN8SdNccX2PD1TLt8AcXhAMj/rqrHcXaXv8LUE4=;
        b=wjFAQNlcufZC1EIn0PeSvBEyS3Ur6J/p/a97gMp7Uz+55GBJXgPlbxZe884FatxUFp
         p9ypiM6pGg9qx02fXz6JnxTcAQL9PFS6bFayaH/bB6M+uqpCXRjS6oF5fJKvIKDBUfzh
         rNm051brECocS9a327jlqWlxFj/EEzfbaMwF4E05e7tVDtY7qjbmq5C3+28MvMVDcJKO
         a7tgFaqx+6vfkKCdSUxkWneMfRqJ5OpGW9Px2PTKjdGO++jSYVM2NC/IP/teMx4+U3S3
         0ZK+Yt+hFT7o+mkjLRbUilPIVO4izGT+5+dCwQFtNwevM1qMMvi4AJsRTdY/vQZkGhty
         1ABQ==
X-Gm-Message-State: AOJu0YzBxp9BYuSFfMRzKF4j8Cuo/HpCaD+ZXu8G7rF3U3kvxFAI++dh
	TaecL+0Rp2C91c5FuVVDt8P57JoIHeDMV8o0BAapGIiLcEUEsg/vWuTJLSeIna7+
X-Gm-Gg: ASbGncuRCW10p/dgW4Sn16aXhJ/joJbUPhak1PO6gleZj2s77izJ5wTn0yFzyhIPJCg
	rxEaypkFW3zZTWUhkAztSo/cOX8/77g7tHcfNgM+N0N2yPaztdFmIkPq2Zp7WxuDPaDPPes6GZY
	ON/nSSB3hb0p6IXmlftqXZFpO/GDeez9C1H7N/YiC6tmV93g2xdtE9/X2zzfnBvtsrie6WJDJ5H
	u/OC40t+fdgXO3c1k4jE3/cuVZhcxWTjLCKwePIVirND//WQNbY/NIoIoQ9iDsZBhyu5BEmhZt2
	17BgOFarMABQ1OGmEI6zWBuz6GYFT0P5s5NJlLyX+VVJS/NZZ58nxbFk88OtFkDyGa2eyYRtGmH
	cAlx3ecv+06bugA7NdxdDJxNnVCgOygBqk9UjsG0SaZiF8kSzh4kFlyALoE6g1Q2lFOC2CpN30Q
	==
X-Google-Smtp-Source: AGHT+IGZhyITNlJwqgzz7uwjuCHkvrFUTRYtA3cHcZdcfTitYzFOHqKOCeDrN5AZSMGbp17zC6+dcQ==
X-Received: by 2002:a05:6000:178b:b0:429:bc68:6c95 with SMTP id ffacd0b85a97d-42b2dca46c5mr4310842f8f.47.1762704022415;
        Sun, 09 Nov 2025 08:00:22 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:22 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 03/27] pcp: update SRC_URI
Date: Sun,  9 Nov 2025 16:59:55 +0100
Message-ID: <20251109160020.2522353-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121419

The original download location, jfrog's artifactory stopped
providing any kind of free service, and the source code is not
downloadable anymore.

The project however has an official github repository also -
change the SRC_URI to this to make it work again.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 4cafa7234b..d2472e87e1 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -7,12 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/${BP}.src.tar.gz \
+SRC_URI = "git://github.com/performancecopilot/pcp;branch=main;protocol=https \
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
            file://0001-htop-Change-dependency-order-of-header-and-sourcefil.patch \
            file://config.linux \
 	   "
-SRC_URI[sha256sum] = "dacf92ba195f1f2ea8f40bf0c455d2cd2456273a1e30dcc3ee5b5bfd099a99ee"
+SRCREV = "c13558fd0df54438cbb87cf303dc279cb58816c2"
+
+S = "${WORKDIR}/git"
 
 inherit setuptools3-base pkgconfig autotools-brokensep
 

