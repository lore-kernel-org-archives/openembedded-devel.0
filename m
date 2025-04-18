Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3082C369C2
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 01:41:33 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.3857.1744940486551403692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 18:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hPo34mJ7;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-af50f56b862so1057699a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 18:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744940486; x=1745545286; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z2UjiE6RraqA7U11KJcwwsxRm66anHpfrvEFws+8RGY=;
        b=hPo34mJ7UgXo0qSEiGEAvtk67/lBt2q7XpXOb4FDpjNFF3KotrK7XAFnV7we//okc0
         bxQuURLRn95lXZ1Mf+K7lz/5n+85oHSSe6ROFbUI7g0mJpHzH/Q68Fy0lKiY/LkcZsWB
         1MZSFnU7kxX3Df+yhMqr/QlZtkBeWArDvu+S8HSvHOdTdvMnOEgyNcLyG1+xpzfZKlI/
         Bh6spY+h3f9JLsHwmEjqtJAryk0Pggl4qUaoqhkg3/u9C3n6LBe4MGrX/RlAbsSACWS/
         UeFeuR1FrHLjIxVJgSezIc2dTZKJZSloDCzVAKoro81dZJFDhDp2nrLYpil38r4iXm1J
         mu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940486; x=1745545286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2UjiE6RraqA7U11KJcwwsxRm66anHpfrvEFws+8RGY=;
        b=rgppS+A0NUg3r3z1f8UZQ7bUNlKG9LbguCxsNA4shN7J1h6JNYU3H5X51Hvx23Fr4j
         Ep4RhctH9WDDC8tnlDW8QwGibDhUVMBeMu790LIxnLrx2wxmSTZeMG3rrm1Bq5kEkJip
         2y+ZD5L+gRayKh4/3I4c1u3SLZOTM5h8IrxKFEwK6xV1rQERsTq9ANCrYK9hgGnsbgpH
         DMmaWr0fmt6/m3TCo0kpFBzARnMXp1Nc+WPeZXWrrf9WC0GsILl5BE15lD6eKwWvB33A
         Pel3I0rVecJC2hqtkYWst0bY09qcCzm0bIhVWoegIttWOrj3i1PvG7X2oaiUGmGudHw5
         OfTw==
X-Gm-Message-State: AOJu0YwjEUFJ0WDLigG1IaSf3u/XHVQAGSotDB8gcSs4q98bUn39XU2W
	S7NBveUi1m8ozXBu41CE9c0un15YuW5yUKy4cACGE7H2MqYvduOk2iNl3X18
X-Gm-Gg: ASbGncuBnW+uVRPG3INFyUemrVK+xArpXlPcBCgkeMcg5A82JvJNl6ej/1uGnIGLQ1j
	pNXGCKm/PIuOxFNcR6ZaSg3cmH7Wg1DBTCpWpGhC5fzW4AUSdYLZKy0WWYpoGyd+Ps+fvvPx0V8
	DIhC/nzAfs0W/i7m5woeUfw5eKFGx30vRSwKDXcjhQF9wYtaSNrvApo7HlwgtFXG1AtszD1ZDal
	vhYopUOC3/MWDZcrDmDn/nZlZddWM4XEs8EOO9uWv/wPslgT0Le6krou6FarVWTxYa2pIWY8I3x
	EO0oD8ynk20X3X2mO5RkwNdJFGNGOwM4mw1YHE95K54=
X-Google-Smtp-Source: AGHT+IHl/6Pi230OrSwMZQiNxwmI9ay6l0s+4v7m9ZgAA6zDHlU9lp2dIq3UMRY2GYd0RMH1D5TAaQ==
X-Received: by 2002:a17:90b:4ed0:b0:2ff:5714:6a with SMTP id 98e67ed59e1d1-3087bb698e6mr1591095a91.19.1744940485480;
        Thu, 17 Apr 2025 18:41:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087dee872dsm137587a91.10.2025.04.17.18.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:41:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] klibc.bbclass: Add spaces around assignment
Date: Thu, 17 Apr 2025 18:41:23 -0700
Message-ID: <20250418014123.3684623-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 01:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116943

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index ca50a3d431..935ee10c40 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -9,8 +9,13 @@ CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE
 CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 
 # klcc uses own optimizations by default. See klcc(1) man file.
-export CFLAGS="${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
-export CPPFLAGS="${TUNE_CCARGS}"
-export LDFLAGS="${TUNE_CCARGS}"
+CFLAGS = "${TUNE_CCARGS} ${DEBUG_PREFIX_MAP}"
+CFLAGS[export] = "1"
+
+CPPFLAGS = "${TUNE_CCARGS}"
+CPPFLAGS[export] = "1"
+
+LDFLAGS=" ${TUNE_CCARGS}"
+LDFLAGS[export] = "1"
 
 OVERRIDES =. "libc-klibc:"

