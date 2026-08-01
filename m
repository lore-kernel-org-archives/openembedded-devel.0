Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F4AC55182
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13740.1785620747698635498
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kOHVOKDP;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d02b4c3601so24773115ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620747; x=1786225547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTxiVKHJB/jCZBd9xHuqEMJCwbBFMAjxE42qR8HMgRs=;
        b=kOHVOKDPQCXYxk97uKa9ZAgIfr2+1fOknzw73SqiiffUk1Z/LRUISxO6lS4G5OrXp+
         f2d2NhXUQAx/MqbQKgvONYx8w0Sdy2Vo/n/qzKr70nK/hw4yrgrV3SdIlCDr0db+I8JJ
         dDmN4Ot49REER6oKTJ/Xa4cdUqWlGe0NrP+8O6TP8hif9XT4LB77r7zISmRZ47D/yMeA
         559+xWzYyJwG8i+g9GXYcSgBfXfdKkX9acMxZNuBj1d3NSHb/lGjTRdAzpUJtyX+mzcC
         vvVn2IKY7QEVJM35N6g/t4CPUC1L97062de7AEvDNkh0O/p+Lymhy8avFPIkshdq9A2L
         0pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620747; x=1786225547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTxiVKHJB/jCZBd9xHuqEMJCwbBFMAjxE42qR8HMgRs=;
        b=X77D8+9P5SfPF/waZqzmWXDqVwcXXwOLL3c/FWaBcQxOAk129QFl0aulFyleb5eg8B
         3hwWktd27faawwGkvzcTqD9PjcM2e6SxiFnjuwlWLub4xQm7j/QonSl/fj81/oNxSwpQ
         xIwRF4+wzMCI8BWVhz5liKaC0Gf3m3a9uVL6g7+rsPCWE3VvahyrwTaJIZMXvJCMawys
         lFH57u7IewoW9+T3ctu7EPeXwNbswuJ3FiodltawGgdFb1iLkTI7jifkeZ6x+FQi1aK/
         /a3nI9xvAvByKWfekRgcpgE06hZTyS0p9Q4figYAoEzTU1mhlxvFI3jKOJWrxa58F0we
         MM3A==
X-Gm-Message-State: AOJu0YzaT9A9r7Ok1VBcVgpuSTE6NSyoFSliptcXjRL63LNUO4sdsfR4
	r3k/eGEIKIpE3Y0/ghbI9moJcy/DWlixfwOs91FNOVG2/A9Rivvw2QratOK0Lqls
X-Gm-Gg: AR+sD104yFEQjEaMOk9vVlGkfVPuqU9U7/k87LRnpf7L4Nk/SwPxLl13j7rRu8L/jRw
	SEmxnKE22ee/KisTUifPek40+9B2Jw9spJARXjUY5LpUpIgcyTGqc6ROyfJOO0dPIbReUJFaM4x
	rOpJ8llHNsNV339jHjX/1iR9f3HVeDx6iNa7uZhqMHm/w8c0okqmGVpQ5KBDePo6r7+GM70yEiO
	PdDMbjhMhwq02CtVUHWI6wBeD9MsBxiC5Z0kw9vSKgZjsEgPHTLH1HjDSo3jUf+uGyVSxR4VvU3
	lAoSKiqiEiLNtYBQG4U/X1hpJw8sLU0KUPSWh3gJ7eL29dRbbXuOWAxmuvaq8a20P75I55WhDbG
	QP/B8eD0ReCwimNGsAcjIYqSfun3EbbUxQY8QuqtYURqgLFXuW7zekSgiruZLE/G58uoxFvKfEb
	iyNzyJs5CC8YeYipreV8YAx7OWRz+oHyOTbCm3qP+PWDlQCNFKRwWQJf5ZpX6AGKa1ZJbNXUkFp
	iHdROrVYxTyv4w9IfwYjURaZzhTc4PliTJJ2DKAJd5nT7VoLOBrkLkBmFadEtz7Aakr2jWDOc1i
	ZPZiPMBXp3o3N12sw1ZOPp9PNkemB1yHMfEhh8Jn4HvO5666yr9X+X3oeVaKKWOOW1Jn+vK5IbV
	g0w==
X-Received: by 2002:a17:903:2a8e:b0:2c9:9a2e:dab0 with SMTP id d9443c01a7336-2d0521e91ffmr46712055ad.3.1785620746929;
        Sat, 01 Aug 2026 14:45:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 19/31] fluidsynth: upgrade 2.5.3 -> 2.5.7
Date: Sat,  1 Aug 2026 14:45:14 -0700
Message-ID: <20260801214526.788343-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128636

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
 

