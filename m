Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1F7C56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:22 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24820.1785872472970606841
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Cxg0CeMf;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so212605a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872472; x=1786477272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r7xFgi3KX+SrPIJzV7AvAmvcadFnvHZQ9EQbZ+jqnPc=;
        b=Cxg0CeMfZbTOYkdVFO8TZPtdtlBhQ5xgSKclKrGnmaQFO0RvJGWIXhpM8rXD7oWsB4
         wzQ5Q6Ff7Xiy7y2DlbBWtNgmIkQDCWgyfpvDbzMg+hnNQLfcgjhJqfAYVNJBKvHRvBwf
         m8W0sfr530S4us1pLfQyzfg03TMc3wbvhOLt+YV020B0sDIAy9aSO1m9VTI8TIz8ujZE
         T+b1+ikbHE1bXGqJxxWOTLQSV4ZpEPvNGkqVI2OrQVuiAb46betfqVWXTsHYtzmvmO1m
         mixp9dkdhSIRWBW4w2G3e+g062t/nRQLmSVP6EbToTZ/mfAkjSZmlhNLyhnMLVTB9+LP
         D7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872472; x=1786477272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r7xFgi3KX+SrPIJzV7AvAmvcadFnvHZQ9EQbZ+jqnPc=;
        b=Sv/gQPRbGb1lSuh5rMp/VjgHNzpxkrUOdxoWusgFesyAglKoCLTr2AvM71aBTC6zjH
         U4YPFXNzPNhe0VyxRL8Gjcd8GtdG/23uQrpGKxSwdtGAfLlwg+tO3cHQtefVKXPK6MYt
         Ug2caERHp9XDtFUyYHz3FxijxzTNNSi8FY0utONuX62oOh6wHi1K18HjYlJCAG+h+UuD
         hXIro5ltg3pvO+Ylng1WMpEn3pThL0+C+KC7IcJ8QC3LcTbhvQbsl6kcUQ82uETXixd+
         4168SxCZCMIT97ns7VHNQ3ezIEfAXdBY1eAI03uNCwphLd01P0uLiZ6UW0KDsZJxn97y
         zmqg==
X-Gm-Message-State: AOJu0YzCZiIOGdnyvO6a7CDnzbvoy53Cmw/JNT7XsTkIgwmOvzbGUXK4
	oLQaOBZVzxbRwCtp7lKLxpmmE60a4vThg/wSdey6OB74wuUm+leKk2E1koEWbhbH
X-Gm-Gg: AR+sD11+vX+gHnYRil+jHa9a6Z8TX5v3IQKGmVtgVPovjHHohNOPZEJ+u5C9Uy5dTy4
	g4pLZ3vn+c0sTL5bSO2zWNXP/z2CkYe0LI2AjKXdO2WR1M7wXMpXoTMGG+oqw0xo8PQnnKb4xnQ
	pgmxChuH+GVulc/5/PDjAgYUElXGERwglxWpYyEbbgPydobY7SGtA60qRVcdeUGEtclFFTVudyo
	D0oI5U35u5qoaS/3hYJm6C7BRhs2s7UYI2lgNBORD10kdCdWyyotm1EQKXhp3qdrRvNiGyUTkhC
	42lIqpZR9vRHpKkQ3Kd5+NlbRE5LN8bWD+l/jg0KnBOYdF5+I9SDXJrV297GOpUEp9M3rYd93Ez
	UpYJpGmIN7uzYEBEsxDHd6QPp9SptW6iWgXb/sshwVrZXkPpAYwE3GbNSY8ocCR0yJrCakQXB0V
	Rdw/n25aHH0wcaB0pqYXm/HLvq8vj7Ns4NBuXP1ZZ1MKgJ38wmWPVje850OLnW2hKi2EEFenNUx
	w==
X-Received: by 2002:a17:90b:540e:b0:38e:6a30:4bbc with SMTP id 98e67ed59e1d1-3903c681346mr1277915a91.21.1785872472305;
        Tue, 04 Aug 2026 12:41:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 25/36] fluidsynth: upgrade 2.5.3 -> 2.5.7
Date: Wed,  5 Aug 2026 07:39:52 +1200
Message-ID: <20260804194003.3158916-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128772

From: Khem Raj <khem.raj@oss.qualcomm.com>

Upstream changes (git log v2.5.3..v2.5.7):
 * Security fixes: heap buffer overflow in the MIDI player
   (GHSA-976m-35rw-h3m6), heap overrun in the pitch_bend_range command,
   DLS ptbl/articulation integer overflows (GHSA-r4mc-v3p8-pv47,
   GHSA-hp72-35pr-6h6r), SF2 DMOD unsigned underflow (GHSA-rmc4-c8hw-455w),
   and a heap overrun for DLS samples (GHSA-59ph-rx8r-8p4j).
 * Remove systemd lock-file gating and add automatic shell port
   selection; fix big-endian cpp11 path; fix partially-uninitialized
   fluid_sample and assorted DLS 'pgal'/sample-validation fixes.

Version-only bump of SRCREV_fluidsynth; sub-source SRCREVs unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 7205920b8c45cb24781d2d1a59160fe3635418ff)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../fluidsynth/{fluidsynth_2.5.3.bb => fluidsynth_2.5.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.5.3.bb => fluidsynth_2.5.7.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
index f579d1ddd2..8bf40cbb51 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.3.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
 "
 SRCREV_FORMAT = "fluidsynth"
-SRCREV_fluidsynth = "6b8fabbd60f0df3b6e2f5b5df8478a1b43315acd"
+SRCREV_fluidsynth = "3ede3f7c8ffc5d16e5d28f416cbfd71f3ad2b814"
 SRCREV_gcem = "012ae73c6d0a2cb09ffe86475f5c6fba3926e200"
 SRCREV_signalsmith-audio-basics = "012d2be17b0eb6839628f8c73687c4ccccc1bb01"
 

