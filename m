Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E81EC54F5E
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:28 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3027.1785293067438984930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aYfAxe3V;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38deea72eebso498081a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293067; x=1785897867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xv2afpCMOXf28za33wnoFfiBd7jQ7a3HHQjBFQ8XUNs=;
        b=aYfAxe3V8RMOrEdeiZUXcjAtaNL3+4o9oGDSM+glqaetRrkoUAyN+k9q1YF3vnRoQY
         ARHrwMqMzqcHAowNzUd/03/q0VMpKgRopMejx5na1UxY+l4KS1EaW/2lpWFow+sZEu2j
         iMSujxFOowegEla3awuUFg6fpz5DK4kweO8CXz33MTcstXDBqbHStJtA4uO3B/IagQXc
         qpLOkk25quMttgWwxCZZHLTTBxCifqTh/IFRFFQft1wZJ8S3Us/bTDMUbdjM3ZjS11i2
         +oP30rarVSgdepqeIPEgEll59xe3xBHCiEx4saGN/0Zj9hRhFyeJwUkxTxzilC4RY5xg
         EVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293067; x=1785897867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xv2afpCMOXf28za33wnoFfiBd7jQ7a3HHQjBFQ8XUNs=;
        b=cfzp3hq0b1Mi3KOKpWiY81rqkSHXb6Ud7+UIckI11TxsFzO2hfPWqbLvRkGZxfG6Gs
         0MSsoHqqonTwBg1qgt1ElXx6V10U7bv1M9rq9xvoue4ML8EuGM3e7ceN3LhcEH6wQV3b
         NGbfr6zrYPGIZO9qsjWzeb5qkc9y97MBOaCCDkcu26otaI9RBTXi2TDUFFdFzl2J4NBM
         Km5zH8LiVu0CmaV4oqzmDBVVyz+HeD1+zFZGCJWbhAV6m8YF3NHs1ThgS9RYIsNYYWGf
         /9baHkdx5C+5aSi++Z/45Vot3o+XrLjfyUiTlz1M4YqQRHbN6++bKUn6/Vg3dAaUmdnr
         vzqA==
X-Gm-Message-State: AOJu0Yw1rBQS5/wJSuT2ZG0M2S7TrTQ7nq7BJHDQfjscVjMz6MTj6/3l
	CEQjY7/T3WvZSqG2ngL+inYueNSMB9AsKy/dKzpEXXWtg+ziPrjiPCrjhxKHi20Q
X-Gm-Gg: AR+sD12NYgJz3cXep6O8xHLE4OxuKN8B7NoM9wdLyA8bj7rl/Y2sF+a2AQPFt5jxRur
	Z6zrl3T5McqrHKJ8mXAHOjzBLR/X1opWySYdVdLTLUJJF2jdvl9L6HG5aQwAtYLhbXagIAJp1JM
	2exUZY/r4dCVkNQuNFldI+iHUcZ4WFwfb/SHSkOXpwhlyUuVeS7YU2XlgspzQP4+OXs4Lznx3Zy
	9VQ1VfgfyLkrI5lrF4kKZth/n5loS4jZdRUoJK6gEYFJAeirtTCT43/z0DcG4xX/M6sxUOv52Ua
	Kma/MOQ4RzLkO/SGmq2jJSvr4nIjkqpzSa918Puinx2tmzRFnarLKUR2NhMdZIcKWtwRhMZ6haF
	R0vDWLYXIPB2i3vzm3VvmQZP9vetoYqPASxBiejq0tfSLXNP1qOc9qM6NGmDZ6ipLsQIqWQ9DDM
	EGovBnz18UlNmDW39pSaQ2vQDxTSI3Kfstj+Z/fYNcb3axMi/5uT7+yugA4DFqygQlRQsenpucH
	+qHJUBndhS1sj/8k2NGygr99uiLZy3E04OLzFaSq5FtRRm0raVkAsaYILPA4x90E39Bl4/eV4C/
	0iZYsq1AuvTtj5upeICuMC7Ba0g40Uhm1wIQ6SO4Y8CqHqtGTUycXFPmVDjGhalzEyVPwAs1gJR
	8LA==
X-Received: by 2002:a05:6a20:2324:b0:3c3:7df6:536e with SMTP id adf61e73a8af0-3c8ba63ad1fmr5916657637.67.1785293066823;
        Tue, 28 Jul 2026 19:44:26 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/18] pcsc-lite: upgrade 2.5.0 -> 2.5.1
Date: Tue, 28 Jul 2026 19:44:06 -0700
Message-ID: <20260729024420.2328180-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128520

Changes:
- Fix a bug (introduced in 2.5.0) with multi-slots readers.
- Add support for the Haiku operating system.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../pcsc-lite/{pcsc-lite_2.5.0.bb => pcsc-lite_2.5.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-lite/{pcsc-lite_2.5.0.bb => pcsc-lite_2.5.1.bb} (96%)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
similarity index 96%
rename from meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
rename to meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
index d6427d2eba..ae20447050 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9637dc508442c2f458df6444fca97e09"
 DEPENDS = "autoconf-archive-native flex-native"
 
 SRC_URI = "https://pcsclite.apdu.fr/files/${BP}.tar.xz"
-SRC_URI[sha256sum] = "59b3c4b5be4ab228698edeb5b3ef46ad54ea217e7dd0891372770bb92b55db92"
+SRC_URI[sha256sum] = "bfcfe38a20afc49849c6bf55325e38f449fc4b26d3923fdc32b969ae41a8741b"
 
 inherit meson systemd pkgconfig perlnative
 

