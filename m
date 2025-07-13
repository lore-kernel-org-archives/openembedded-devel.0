Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51143C83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 06:31:01 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.52281.1752388233455025434
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 23:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GBEYEAHX;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso3166503a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 23:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752388232; x=1752993032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0k4ak46rTLt0LEY/6i/XxaaQPce3y1jj3UcvzSOypZs=;
        b=GBEYEAHX/D4JiTdmBPLF2g8B08o1I1gErELcrHXGeaF4NqWNZXWBGIEPiDsOSMOvFe
         kDP8yFil1GbKygC7vaqjDenHOkexK71BuRRgKRANc3TIA1h0Er6LfYWvSqw5XnaL1z4f
         5X47OCwXplXvaY8DsxvcPgB9VSgT3RP8ZfXTQ6tEUsSOkk8gDQMyCf8nRKJnNV1zCSqp
         Zv0codQuJa9shQh3qRuZ5ohx7AAyYFs+0itvVyBm/UHP98ervFjGmL0BXI/ybEYSQvVO
         ojYsvuDDnWczbhkQpzK/DeLc6XsTEi6Ow8NJjQRzKM3NrUFT2nz2i3ZbcXzazATt5Sw7
         89wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752388232; x=1752993032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0k4ak46rTLt0LEY/6i/XxaaQPce3y1jj3UcvzSOypZs=;
        b=MwZKRoZfbkqp1M0OJQkDFTVLsOLhYDShD2rR0H01OEqbUlarEA8W+m57+JzlvvqRwJ
         0dQHu7kFIAQQPz1Osu+WDiTICY/OGXtQ+HzkRhdQF1E2Mk41VGbhpzj+ugsBip1NQbTk
         rLZ1jVvQEQNJwv3SWLf2cSI1nvikGBiTbsjI9SLpuNARpe32a9eXK3gOUZTHMonTqtts
         m5ywbksKgVkRcJ16DR/7XTO4p6j5jy8xDbDBibkBFzq33lOh39HH++sPNSz7jhpGWQ+f
         CCutv4SqHZzR3VhCT3ifpAQu7vbTug89sKsZ2v5YOIwKnt4sdYnclNYrgUIPPmGqtedx
         6ffA==
X-Gm-Message-State: AOJu0YzKDBMYJj8jHfV1s+7NwdzJluLH2Qiwf32Es5oQ+I2/TRXmP1wj
	oFFE9QS1ZT6uGslq3g0BSfyzdjpQ0ntODjZSZXTs1teJSav9taXLY9GXxR8iflIK
X-Gm-Gg: ASbGncsFF8Xu1XMxq+T6P2pgJaETAveDzDnm/nckQWmp5yvlEZqzGkWddYjpvKQNQle
	lYYAK+luorafz4tz2/VNUxgEDFrpJHckp++UHPrtTkHTIKsWOrNKxTp5fBWE9wG6GkfHgAous7L
	WQaMYGpmE+rdZwb+WfBy8KTwWAnMU29xDAlEjmOVYtt2s1sBor/pBYNp6Zeo/Z2iP2BIXHsF+zg
	jHfRK3ThOKd1RvP4HAb1vpALFBuqSSpdX8iCZufRMtZmEx08HAWefeaV3EPzVTh8Kh9o6o3AdQW
	VRKLqji2FyfkHq/fb7m4xbBLfidygariiLwHJDBc+Gd8dzQjgk8L/COQYUa/wOvT8qqfJgGbBQE
	8rmUwoc3JkxAgQQ==
X-Google-Smtp-Source: AGHT+IFZXW0Gu8LTzWDBlSzpSQ8W12uJFscSczwuEh4YFG115bcgw9t6j3Te7l6vSbUZ4KWFmetvpA==
X-Received: by 2002:a05:6a20:6f08:b0:220:9d84:1cf6 with SMTP id adf61e73a8af0-2311fd02e60mr15294466637.22.1752388232429;
        Sat, 12 Jul 2025 23:30:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bce529689sm4928927a12.52.2025.07.12.23.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 23:30:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/7] ot-daemon: Update to latest of trunk
Date: Sat, 12 Jul 2025 23:30:20 -0700
Message-ID: <20250713063023.3538218-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713063023.3538218-1-raj.khem@gmail.com>
References: <20250713063023.3538218-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 06:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118497

Fixes build with trunk
Disable prepending uptime to logs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/openthread/ot-daemon_git.bb          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
index 009a6ef88c..fdbc8d7a32 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=543b6fe90ec5901a683320a36390c65f \
                     file://third_party/mbedtls/repo/LICENSE;md5=379d5819937a6c2f1ef1630d341e026d \
                     "
 DEPENDS = "readline"
-SRCREV = "90adc86d34e21a9e8f86d093c2190030042c4a59"
+SRCREV = "9f88ca02886595b5aad2b60007865812fd78aa98"
 PV = "0.1+git"
 
 SRC_URI = "git://github.com/openthread/openthread.git;protocol=https;branch=main \
@@ -26,3 +26,5 @@ EXTRA_OECMAKE = "-DOT_DAEMON=ON \
                  "
 
 EXTRA_OECMAKE:append:libc-musl = " -DOT_TARGET_OPENWRT=ON"
+
+CXXFLAGS += "-DOPENTHREAD_CONFIG_LOG_PREPEND_UPTIME=0"

