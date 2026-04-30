Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1FBCD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:13 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18173.1777549625012814876
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fCJ3+9aQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so859321a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549624; x=1778154424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hmyuziv4Ad/cgRnrNFV9ufGFGHXw55xV9lVNjH+vSCc=;
        b=fCJ3+9aQUoz2rW0xp2E53akYVW2LnRXUttywn8wPtsjrW2e5wRsiMkVPSHb7FwLtWH
         RLz88WFSr4YTwCmh0xrDOUd8XBUqJA9IDprqPeyOBhJox3COQDQl7NUuoWl8sjp3jJZq
         MzmIERYwWRnc6BHzv3gkLxnOAPFejDBPA7gepvCuKo4M69sUrexmn4gB0oCEgFClVKVw
         LsgnSFwzEDM2ELCwL3QjYAnU0WWOFxSch03ovadohPrHx/nz5q9eecD+gkRy154p+a2A
         MhJkBGzSqB0lexVwLfHLazPid4CUJ6zmaFQIqSm6hJbP5J3Eh1Fs8U3oiDbfPtuYuzEH
         WAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549624; x=1778154424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hmyuziv4Ad/cgRnrNFV9ufGFGHXw55xV9lVNjH+vSCc=;
        b=c+mWGD8M3M4/09Lo4kDZyJyLJNwctddu14+JrqiA1Ll+VIK/dEKixTZCJtIrP6UU/s
         VpJBR+YPhfUWguYz61v4UGkZYWb5Fi+Q5VI1P0gXHjqi1MwUAGY4GhYToiuIOPqWA0PU
         u3o4RuOxuBwFVrdOaWf+b2C6qInrrgWghzfC34CupWvR/Hhjlv0E3RgPkbBWqKaK8WqU
         3zkCMOSzRSVJ8JGEYNyA6BPYPkdfbsixD/I1zzn5tTvCAKpXnn/ZWOIhtRwgODMSjzVl
         fGmgeUGWw3bkdVZARYfc8y03IPhlFD1LtN9jKL6zguQLvniFzVvKDJ6XBTMbnuzWEncO
         RROA==
X-Gm-Message-State: AOJu0YyfAd/HB0M6MtFSzUHZCv5LF9aDZkI3u1oIKnNSUpgekuqP3idn
	KhpU1s0KyPyosXaU3dsW/fmU+DUHO2HeIsLpJpQ1IjwPnu9b02uWbDaxnuNDP13V
X-Gm-Gg: AeBDiesQsqBrb8Ax7CgIodYIBtDaHydHzoiAzaUwIyFUSBDV7iaEOOlNtGyIPyB92H0
	11+tiJ8Rr+b8lqnZlzh8waCrn3mjHydmwG2p5EGFRU3lp8Tk5i9+mpLc2PP0e+xfEh2GQ5aW6jD
	hZ4rwdI6WmOlCqKQHz94nLO8ptZ/LKaCOHEI5cQ2i0rbZE4m+MjH1gOAcBqKJ/Bpnl/tSHAw58a
	8IYvYRfbparwSyAWpVdMZ+ysdAi93RkdkZrqtv7Qhj/jHOkOq0bChvKGwKiPgMtpkrLSyh/2zKi
	F2i+Kmmy7E4jgTlHUWWM6nyuwh+w6U8JiRG9nGbc/9trFtDPm48q3/++4iNEjroXmyEFr27CNPO
	/4Xg/Ihfc+q6j3SXNTU/9Sp+DuGfk7k1m03P67YaZUJi0cpCcom1IWNsbMPyxAqvCyyIhkZIwNT
	KSt3NpFmp8+c7rhIkDA94Xr22vJ/hgA+cgD2LmwRQnKs1aSHq8lqitD+r4GQ==
X-Received: by 2002:a17:90b:51cb:b0:35d:93ff:284f with SMTP id 98e67ed59e1d1-364c312dcd4mr2568069a91.15.1777549624170;
        Thu, 30 Apr 2026 04:47:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 2/24] libgpiod: update to v2.2.4
Date: Thu, 30 Apr 2026 23:46:25 +1200
Message-ID: <20260430114649.4184890-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126736

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bug-fix release addressing several issues discovered during an
AI-augmented security audit. The most severe bug was found in the C
extension code of the python bindings - which also get an update - but
there were some memory leaks and integer overflow bugs in the core C
library as well as in tools and DBus daemon.

Full changelog:

Bug fixes:
- fix buffer over-read bugs when translating uAPI structs to library types
- fix variable and argument types where necessary
- sanitize values returned by the kernel to avoid potential buffer overflows
- fix memory leaks in gpio-tools
- add missing return value checks in gpio-tools
- fix period parsing in gpio-tools
- use correct loop counter in error path in gpio-manager

Improvements:
- make tests work with newer coreutils by removing cases checking tools'
  behavior on SIGINT which stopped working due to changes in behavior of the
  timeout tool

Also: drop the patch that's now upstream from the recipe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libgpiod/{libgpiod_2.2.3.bb => libgpiod_2.2.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.3.bb => libgpiod_2.2.4.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
index a23d65bcaa..4617f5643b 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.4.bb
@@ -13,7 +13,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}-2.x:"
 
 SRC_URI += "file://gpio-manager.init"
 
-SRC_URI[sha256sum] = "70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a"
+SRC_URI[sha256sum] = "13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592"
 
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \

