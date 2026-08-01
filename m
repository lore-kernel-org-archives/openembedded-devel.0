Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B72C55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:35 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13591.1785620732041089037
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=irhznimg;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2221991a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620731; x=1786225531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VM9RdWq4c7bII/2UGOEiR58Nc+XWlzUZFNPtxvkeaSo=;
        b=irhznimgVQRUnjuso/2khPaEhu3ZpSIR9E1WKYkicac9+BBe/wGv7rayKUBvtap6b+
         Mod7lLj/u0vqzKTRTmJprcv/T3iOSqUOuI/5l1yrOUiSXMrkWFev3AfuB30uI7naJDxH
         9nB42waxWaA+bDC4Cq9imwxXvHnmu5yWugHQ5/O+TmXGdC65U42FWsOwe8xW4nLqbPzr
         y9g9j/+KSlMxRLBoYhwPCq42qtuVtl3dN5DIsgM8SnN7+i7pJKLZ+aAFVOc1uqV9VXo5
         l18Vs6gMRqF0ja/4v9xgmtae6IOPpKlV4zKJgQVuta5XRGiu5fFXSPAbqHoiT1dk/0wi
         yUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620731; x=1786225531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VM9RdWq4c7bII/2UGOEiR58Nc+XWlzUZFNPtxvkeaSo=;
        b=VkYua6wJ710C2dzzQjzkXRvJEZZBEnu+kZybyOC3SpD8nDy+y1Zu+RLL0b/Ht5LqwZ
         bMZToWSH4ZuNxRJS6x1AFuEtP7XGxDfILS97gKRLo6Y/iE5zRP56z+vyRw77X01yisqO
         K3qkmJVVF8kNkrfvPY5V1kYL1sGq59ot5Ttg00gXlRGAxFPuNc6jkk4uKYKrmXEG45Wj
         5CcenqbHyNy3vWQn8z+DvCrvJXrZ20zpVm8ABiUC4Dn8no54saxRccVWySICOzwrUIv4
         PjHyeaLGqGeyvqGGVokLPv6NmGVCMchnphP1rNSmU9WEef1TGKUvl5CxmDj5q9u4+mHe
         fvrw==
X-Gm-Message-State: AOJu0YzzSe043fS2Y7xS0VqJrTxba+n/++zfZ4UphHBjsUv5qrsyolqc
	PLoq16Ylhp7VWpQUTEL2H7NhVH4EaZLpFoAI03qxKcgFHZQvByJwNdBS9Vreg0Ef
X-Gm-Gg: AR+sD10cH4pfZTo2b8Td3K4vFZ8MkGLBDTCrsuw4z/evpuk/xBG3FPZE/IYHv39EpI7
	qXpIOtlai8YGBGyAA5w+bnuoUGinZYdxK6N0juiF7rb6rehvsXMYugZMaWDWLHJjgGp/BoK9F6c
	BG/zwT8Tt+dl2uAQT+1mG8rJWKeQNkItKNdeZj1lfi7XqyaJJ2Zr6jW2xjNvuBGh12LztH4Q7ZR
	qRhHupTu0v5fZmt/IHHS1ve78kVEFB7mzP0moJXOuC4VgGJB1ELNWvCj4o1cUde0JU0WaE3PbWX
	CyTUhAHAFQo57ynpsm6eXnLZ37bbgzRQ5ryWKhhwxDnA8DNY/PzMw8yMdEZd/aP5WsQgo8P5RRU
	NQgSK167t/FQtVowCdpB7jDrbAjYkXyVOzXEEF72H0ercTVRZvlE4N/JGaNa/hoJ/EjToJDqI68
	hCT/PDx/1/aKY0zBFxCFHlANzJ2ACzXxuaPAay98Fzvk/lMJ0cUQdJ5oILCNol1VU233Db9Da0C
	3hvfW8FeCgXhzrypTfW8P1vKQTGkOLg9YYtUEPPJkP1iyGCbiE6/Pz8Gk/YgHTQaKM/+9z/s8zs
	Dp7C1YjP4ljHOsPRoNJqwnQU50AVBIC7nfcADuyFN/KJMEuGesxHFxr2M5bOb8ciYMnqTQ04/3A
	zdA==
X-Received: by 2002:a05:6a21:3a96:b0:3c3:935a:af2c with SMTP id adf61e73a8af0-3c92a51c2cfmr4613290637.3.1785620731307;
        Sat, 01 Aug 2026 14:45:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 03/31] svt-av1: upgrade 4.1.0 -> 4.2.0
Date: Sat,  1 Aug 2026 14:44:58 -0700
Message-ID: <20260801214526.788343-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128620

Upstream changes (CHANGELOG.md, 4.2.0):
 * VOD/RA: new TUNE-VMAF mode (~15% VMAF BD-rate gain), single-thread RA
   mode, RA preset/bitrate tuning for M3-M5, raw OBU output as an
   alternative to IVF, and initial_display_delay signalling to fix A/V
   sync on seek. New CLI options --cqp, --enable-intrabc, --hbd-mds,
   --enable-kf-tf.
 * RTC/low-delay: CBR rate control with Kalman-filter QP estimation,
   cyclic refresh and frame re-encode; on-the-fly MG size/preset/bitrate/
   frame-rate changes; reference-frame management API with LTR;
   --max-intra-bitrate-pct / --max-inter-bitrate-pct.
 * General: entropy-coding refactor, CDEF/MD/ME optimizations, optimized
   screen-content detection and TPL dispatch.

Version-only bump (git tag v4.2.0); no recipe/packaging changes needed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../svt-av1/{svt-av1_4.1.0.bb => svt-av1_4.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/svt-av1/{svt-av1_4.1.0.bb => svt-av1_4.2.0.bb} (88%)

diff --git a/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.1.0.bb b/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.2.0.bb
similarity index 88%
rename from meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.1.0.bb
rename to meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.2.0.bb
index 8321d01057..826928fe4e 100644
--- a/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.2.0.bb
@@ -8,7 +8,7 @@ inherit cmake
 DEPENDS = "nasm-native"
 
 SRC_URI = "git://gitlab.com/AOMediaCodec/SVT-AV1.git;protocol=https;nobranch=1;tag=v${PV}"
-SRCREV = "c04f951541ad600e0d9c10836f2ab7b9bc69816d"
+SRCREV = "9292ec8e32bce26f781f277ec8739b53426c4300"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 

