Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17633D3C549
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:08:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15247.1765372103558117056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AhnjSt2c;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3437af8444cso6251657a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765372103; x=1765976903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwC3UlOGfKJ5aLEJpl8oi8jcsf0HMbxMrNc9k+3sh2o=;
        b=AhnjSt2cOUGOZ1yKbnl+Ada4UrvPeiSqBZFmHefNfS8b2b8No7GqzxsqpDMjZBCZZB
         MITxkjzIyj04FM2gc8tvSOwARvFMCJAa3TwlgIzHQ5WbXnTVQr5OPcRPsTiXJan3xNqe
         EhZTfu/iKi1bS5ahnTRy4ZfvT2RkeG+49rVC1lsrTGqr50BT/3kEeZUCuJj2i0nzgaE6
         8fMGDf3wVi65J4tuxDxUSULAI3NdQh02YkMSa/EFdafvrUQiV7H2ED04ViwzBqRXo8HW
         9xHlO8BCP86Kmck8Tk4/iA8H8k48pjJF8D4nFGQpUnAgl8n1g9U8N7h9sRa0zidqw1Iy
         vMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765372103; x=1765976903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwC3UlOGfKJ5aLEJpl8oi8jcsf0HMbxMrNc9k+3sh2o=;
        b=ZCeb1Y9d8FRiMWERi5Gs8RDhtkwkkJjYT9D1Gt6MhXxK/befFdwTc8WInQPruxv2re
         uwGmRiJnoWvGZ7+U157hJXLSDXxbGuzd7bfgKbJ9F2w/HUPxhaA6cFYo2siW3/5jwZyU
         EcBakRViyAs/0PhqcotAWfZHkALqqiSYi4U+OA3g+K7K/skSuOU8yBe8UvpM9erWZixg
         kcyku7erncE/Z7NCfO/SNxVLVZ/Px6dQmAqUg1mqkb4P9gcqmWLBXTFhairiC1LHR9mp
         lWxUFO2tFseNDpU1x3Q4uPM364Yk72o9P8mN8muUMtuEcz48r+TS+Wp4zDUo5vpkKhsh
         k+OA==
X-Gm-Message-State: AOJu0YyzGAtaxBLzQ7D1wXB40B0MZ4nlfRuQYaKhn/ToKsMT7E1bcNAX
	rSWpncQ9MCJXl1r+s2C183yVPjF5+6Ahclvz+gow7bdis8dsObuIbeTdBequNQ==
X-Gm-Gg: AY/fxX5Zf7CaIBr8SpDOOBgzIERN/8/QL5U6Y5zpwZTh1i7BorX2ifubCb0hncOuk/7
	yFGZIXWU0eJUxtk1m+S9XoKhxaAw/W+BTDPc1C/b0Ko593bQuklfrdQK6+s01cT6/ivdairVFL5
	vOivt84obx4zl9S/3vLvREt34oyI43eFNdFN7Q4jb6mSTqdFUCN5QCzaoDxq1NpA1slaIYfEH7a
	btP2onWeQfkREkG5WVsWosJ2fFTzuWocJLdE9eg2RYVrD94EpObShhg2vTrl2v8ZAJfadK7uHkj
	n/U/bjs7l8AWu5W3YX+TxN/Lv0e02Zne47xFC44Mp/REk3874VKKcQlLTGRoN+XqmFwoLKDjcag
	oRtOnDJCzuL7/TgFBJ1q69xzRnT7IxxmPBrGXZq+pwj9HIzIQl4hJ3Q3cAO3I47+2HBiXwdm76B
	0WW3M/KQ4j9zPO9Z44hOhf9dw=
X-Google-Smtp-Source: AGHT+IEcMTbd4CFTLjiwELP0g97lZsmEwBN2n4kAZ7ALecURN2GKsXSiGMpd5Lu/rNaqWBkKJ1HAmg==
X-Received: by 2002:a17:90b:1c12:b0:340:ec6f:5ac5 with SMTP id 98e67ed59e1d1-34a72809b45mr1922706a91.2.1765372102718;
        Wed, 10 Dec 2025 05:08:22 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6875cc8eesm17803086a12.16.2025.12.10.05.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:08:22 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 14/43] wxwidgets: Upgrade to 3.2.8.1 bugfix release
Date: Wed, 10 Dec 2025 18:37:10 +0530
Message-ID: <20251210130747.18149-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122518

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e4003aed557365f89368a102190f67a6414271bf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wxwidgets/{wxwidgets_3.2.8.bb => wxwidgets_3.2.8.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.8.bb => wxwidgets_3.2.8.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
index fcb30b41b0..815a0b2d0a 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
@@ -18,7 +18,7 @@ DEPENDS += " \
     tiff \
 "
 
-SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;tag=v${PV} \
+SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2.8-hotfix;protocol=https;tag=v${PV} \
            file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
            file://0002-fix-libdir-for-multilib.patch \
            file://0003-create-links-with-relative-path.patch \
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
-SRCREV = "8aef5f40b93958719771331ca03866b7b6fff6bf"
+SRCREV = "896e4f587615b832ce27b8325357cb504997e1d3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

