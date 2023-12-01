Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40145C4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 08:11:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.18277.1701418281472716102
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Dec 2023 00:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nRF+MYK3;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1cfc2d03b3aso2329205ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 00:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701418280; x=1702023080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krRVFtLZh/OLcXckEw7vL0JaOhtDWDaw6GNXApobuCg=;
        b=nRF+MYK3d0MF2DJCZ8hhDfUz3AIjct+31ccX15d9WRrhnj4MfUo9wRtJbwzVROrY39
         2cJzhlA4+jFLHbMLMLNIY+FC5MHEetMs9Tp1zPRxroYRedAAlrrCarD51ckozps2Z+Kq
         tSMp+ziZRhDG5c6a31aRGCgDq+0SE6h7hye3StiroOnozl5QZEVW9wI9iGFyXh31rJ3E
         yaU6BjmjPEyWWP1iT5ZVTPCdSv/s+g2RUZ/JqinH+wMXAjbLa3BWHe+4n82wYMAe3ZPP
         y8BtebzdmIX7PhADVmfo+G2xNExHd2bEZkI7mkHvW5sPfptxICQCj4bK6GDRqCh3rWf7
         Iihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701418280; x=1702023080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krRVFtLZh/OLcXckEw7vL0JaOhtDWDaw6GNXApobuCg=;
        b=JzkfNJTayOBfWa2iZEuxcbEI3YqqJeP6024vhQexq1HecQpGLVLiDvhSDQrwigFecK
         qJGfLXG4XytCcRUFKP1AfelRpwSTy4za9eARss2VGJOBx0jLU+ND0hHOeu3txH9UtbDy
         0R3Iu9ZtnIHX1quFahPV2cah6ZS7oXeImKTlvJweq5xTWcw01Rpz0qMVZBWZUzNoNW98
         nkS4qS+bnE5lz/GRviw7BvOUPOXLF2g24/KG5yw+epQOhLCQsjlYosl46rqlJC1MNWyx
         tx+HgaJk/nHSZzDf3TqNyBYl4B0tsn8+ozD+HsoFMn910VYbtkOozOEx3lKDtuQuJR81
         GHMw==
X-Gm-Message-State: AOJu0YwrDS5zKBjTqyWvWRWVSQuuHj4eT6FEx+kLjs5JRTenvYUSo2F7
	YL8ATwKEppxPT0mCuSTEicnY7+oTrvv3xw==
X-Google-Smtp-Source: AGHT+IEa+qpqQqJcs13LBEMiYoCuSZdJHZAEQOnjiSCo8181UgzDzpcF2Q7WG1zbCk2wx27PfkPZJg==
X-Received: by 2002:a17:902:6546:b0:1d0:5a01:e138 with SMTP id d6-20020a170902654600b001d05a01e138mr400972pln.2.1701418280327;
        Fri, 01 Dec 2023 00:11:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090311cb00b001bdeedd8579sm2690409plh.252.2023.12.01.00.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 00:11:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] basu: Update to latest master
Date: Fri,  1 Dec 2023 00:11:16 -0800
Message-ID: <20231201081117.569210-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Dec 2023 08:11:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107185

There is only one commit after 0.2.1 release which is to fix build with
lld.

https://git.sr.ht/~emersion/basu/commit/a08cf5a575325435040d35710dbac3d0c32b1676

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/basu/basu_0.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/basu/basu_0.2.1.bb b/meta-oe/recipes-core/basu/basu_0.2.1.bb
index 500408e11e..56c25f5f1b 100644
--- a/meta-oe/recipes-core/basu/basu_0.2.1.bb
+++ b/meta-oe/recipes-core/basu/basu_0.2.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.sr.ht/~emersion/basu;protocol=https;branch=master"
 DEPENDS += "gperf-native"
 
 S = "${WORKDIR}/git"
-PV = "0.2.1"
+PV = "0.2.1+git"
 SRCREV = "684a41d68cfbb05e38aacb60a8548e21ddfbecdb"
 
 inherit meson pkgconfig
-- 
2.43.0


