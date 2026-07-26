Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F03FC53209
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 02:30:06 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4254.1785032995153286740
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2026 19:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SlyJuDlQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1161456a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2026 19:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785032994; x=1785637794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=la7yVla2UNtJYXc1Nem5/HHwQ8cyvLbgF3SbupHGhUs=;
        b=SlyJuDlQ4JBZ8OU3mUJ2zXgMMdMQtxSH9V9RKeptpiANrs34dycktDJdeKZJ4vINun
         ZYzFU1swfbQvxOEPyO5r+ZnMWYSgdjhKVMzVVgu7bU0h5YsWTjuklDcrS/SeC6Un8Mxi
         eOtO1Iew0vBmQ2vDVtsr9b8V5joey2WYJfJdGw9TLLMeh9bivowmDfWuOakW6+ttqeHf
         xUtoCrJ0F0yAMtnYeW+Is1iUtFQUKRX66lNNM+lXQT5GxwmZCicP7iaLaMy9DqTFILMW
         OpAnVZZ66xbweHbWGwtdO/+HjzIQ8oJxxMBc0enbOl2dWTKwVh3x74pSZx6OHdcT8eMN
         xtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785032994; x=1785637794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=la7yVla2UNtJYXc1Nem5/HHwQ8cyvLbgF3SbupHGhUs=;
        b=ACcLcOsVI+HlufMQ5dnbwZ7J0EQFh8+2Pul2cTF/mvtrvMbhBmhQc4PIpGoCflAvD4
         WXY/oDRofs/Bvf/CCBZEZW6nUNdnDv7KATsP5uB2Qi3qEls2zbDObwckzbfNc9j0B8Zg
         XkXNADzmssbfixpv6azp3LNDOBXQk/7p7v4AbViYwC8jK1IOaJNICWvFtKJu1HxAFZMD
         2IBX6a5vek3kc4bW+xF4w3aX+URpExhm1G9Xyab6jfKnUUOjUkpUxIm8PWata3YzceZG
         dpg7aU57TFV+UpmF1yRGAT0ztBS7AoECE+UWvmwbBpzsXjcDOJ36tmJcWKLJVl0WS1GD
         Y7VQ==
X-Gm-Message-State: AOJu0YyL6PyAfAC+0+tZzSrIu+az4OzJq69+wb0mLKAULh3+NycGL25N
	zRGW21GKr3W6gZAzKuF5d1k/2McGqpPBxXyC034PvHVVtI4BpsWukWah9BSadg==
X-Gm-Gg: AR+sD11Z25vM7J37uTWkF4252J7OsiWH2FF+lEgOlC14r8thkQr/tT1ruhkZhE/LR7m
	2At27R6VgxPw9X4KFdE/uMqdEj/qgP80xUNjXtA2SewOmZyqHzJeumx3svsc71nxrQiriWp7v/o
	Z8+VegcvILTq07/PtJzPMdJoCStiZLbYtHyyIwM3/nh+zf6ecSukDm5opXDidfB95+cEphsS07J
	+DXGJtAF8GMTmIuSOU3vHypkMRuxsLk5AftsIRPqJ1v5c4SelHlu2nqKjVfccQfQEUVvhG3+96g
	wnPSgeUa+Y5UNQMkA2PUGJoLjLTxXiXjwYAVci2EZVMcn8S3XCChPxh/v9bjc+VOYLaDdd3FOCq
	7CRA9eOHTiqWfJV0yM8aRcsGbYq/cx5i/0j4GOLGkc+THPnNCgxgNgDXWtiAWgm1CNVyflF3Hzu
	nTjzHTbBQLL3YnK4E0FqT3Wb6CTSgbvqSHDE7taKUpo6Qbwo8+sRVWj/oNvPZGe/SYnNdxB32rv
	a20UVRyCYN1FY9OKWW/R4M9hIuMSKqZwWws7AUh4f+5yoSAeoK69F7GcRZHcjfDWU4+qeTH93R0
	eigpPBDdJUuOvgIJiZk=
X-Received: by 2002:a17:90b:57e3:b0:38e:9279:468c with SMTP id 98e67ed59e1d1-38f296091e5mr3787450a91.25.1785032994466;
        Sat, 25 Jul 2026 19:29:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm26526993eec.2.2026.07.25.19.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 19:29:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>,
	"Claude Opus 4.8 (1M context)" <noreply@anthropic.com>
Subject: [meta-gnome][PATCH 1/2] gnome-terminal: replace deprecated GFDL-1.3 with GFDL-1.3-no-invariants-only
Date: Sat, 25 Jul 2026 19:29:49 -0700
Message-ID: <20260726022951.1696787-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2026 02:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128448

The recent oe-core change validating LICENSE as an SPDX expression
(classes/conf/lib: Parse LICENSE as SPDX Expression) flags GFDL-1.3 as
a deprecated license identifier. The COPYING.GFDL checksum
(a22d0be1ce2284b67950a4d1673dd1b0) matches the GFDL-1.3-no-invariants-only
text, so use that non-deprecated identifier.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
---
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
index 489e1af7ce..449ce6d1ed 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.54.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GNOME terminal"
-LICENSE = "GFDL-1.3 AND GPL-3.0-only"
+LICENSE = "GFDL-1.3-no-invariants-only AND GPL-3.0-only"
 LIC_FILES_CHKSUM = " \
     file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
     file://COPYING.GFDL;md5=a22d0be1ce2284b67950a4d1673dd1b0 \

