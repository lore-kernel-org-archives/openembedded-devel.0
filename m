Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FC3C44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:49 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69156.1782634364409713579
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cwGKPEb/;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30ca1b4b278so4370290eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634364; x=1783239164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfaG7hNtigqHGFoGIIPmSfRnXVU89UFdHV8yI4Gt9UA=;
        b=cwGKPEb/Jv4MusxFU4HpHwBM/neDf4WoD0jdn9sVWk8peP4IHrdaL/CJxmnmyFKZzx
         +NrmLXpbhjtH5cK4yB2VXPoMDxrCuSqxF9upmYhdktIydwUmLAxu9UNZfMEick8fJXNF
         FINVwfs2+LCDJTipicqhnjTtoyA+3uG8UXy5HkF5c5pvflEjaeVvTvrmggYOexyB1nig
         e7Vou7NePnwkxvgu5k9yGPTtDqaMDYH/0lzsSCGMl+s9A6m5+/N308r3scFQNK1p5bk+
         q1r5FdmGo5DFZ0pyp5E6DYqCSl0fX/KAmjCwAXSvNegscP5S8QsF2TXE1Vlm41KY56Mn
         /ubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634364; x=1783239164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfaG7hNtigqHGFoGIIPmSfRnXVU89UFdHV8yI4Gt9UA=;
        b=aan4ClD3sjFfXvvMsrstUpSRneiXGEBXq6WtBgw08nbPoVEhYE7Q+TyM+5bTSHn+D0
         /ZFuFmtHW+3C70tNBRYFhxVoVzRflvHUOlntQHvDENjn11tiZMStUQTOqa3vYAkR/5pI
         tr4swwuVTZsN/3b/P3YfFQS46GP+ftgxsP3eyqjccUNljHjpKu/J8Bp93LQhufH01UCe
         WRtCIDfEyEkJ2AXVlFbo5SY2BJX4mYlGG0ZSPWCsu4Q2qSq0NgvvdE2KZAg09TXVGK6j
         0mgZQTZtMSvwGlAZR3uFX8OW2xGcT7J1JrJ0SUQEqB1hcBX+w2aBjcVs6ISAr9HOoaXn
         WHMA==
X-Gm-Message-State: AOJu0YxakcTxbhWjQDxQsOEODHoOPul7fEmWfBdhSGpwoSwAVT6MITwj
	HChnoS/sPPEuG4ZXO4hQ/oBBnxXqViSEiUUJSuD1W8UP2TYTGJp+sMKPgDx3k3/HS1DFqA==
X-Gm-Gg: AfdE7cmwsLXP04SnAa29LOjj/Eq7y3+fibcMH6NGraFhk80Z2F2X+OMtgm5A99lmN6e
	qYRAPajy8OxLjUR+FkqlqFjH/jWkoe88MO7BHEjL3a0xlulcKUGSP6OS6XzzejmJogBgSuDtQvM
	fvMI7zbplNSrVjibsd48QOD58xksS4vNCocMhBPJQj5Wy7HxW+GlAWkb9+elhodJjezPzWRqw66
	YoE3hYhEA/wUda5ayMg3OOMv0AZ+CASKT0KP4iB+FgIeYslnQRTcEJc8azR0EJPQ4jMsSKMFi3w
	QR2HRuA1jiW/w+qJz+0qD4iLpwJq3ZwacQ4/wZBs1zPk3LudkLG9ifXnQsXZco8L85DvO7eYRJs
	yGpCuLhOWC7iH4BBdFsYpTmzby+FPTbA89wf9GeiJUr+XudAwwqer4+Yd6XpPoLDvU6tFf447a8
	G4BiozC8VfDyYeWJ/80mwL131TscUeuYLoLg2yHGgkGAB7BEhk6Kb3Jqs1De8IfA9b5Vr9TWTmQ
	CIQ1NcyRInBAl/wAxUUW7BBkXXdiI8bCZ461CfgPNCM7HoTXfBzGdBA2KgfDkxeGyUuiInIFzvl
	zh58bCntIFsV3I6vCp2w5IyAaPiaGQ==
X-Received: by 2002:a05:7300:5415:b0:30c:ab4d:3831 with SMTP id 5a478bee46e88-30cab4d3bccmr5867569eec.40.1782634363796;
        Sun, 28 Jun 2026 01:12:43 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 085/128] libpaper: upgrade 2.2.6 -> 2.2.8
Date: Sun, 28 Jun 2026 01:10:36 -0700
Message-ID: <20260628081122.178348-85-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127895

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libpaper/{libpaper_2.2.6.bb => libpaper_2.2.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libpaper/{libpaper_2.2.6.bb => libpaper_2.2.8.bb} (80%)

diff --git a/meta-oe/recipes-support/libpaper/libpaper_2.2.6.bb b/meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb
similarity index 80%
rename from meta-oe/recipes-support/libpaper/libpaper_2.2.6.bb
rename to meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb
index 4acf7fd473..c8680eb128 100644
--- a/meta-oe/recipes-support/libpaper/libpaper_2.2.6.bb
+++ b/meta-oe/recipes-support/libpaper/libpaper_2.2.8.bb
@@ -2,7 +2,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://github.com/rrthomas/libpaper/releases/download/v${PV}/libpaper-${PV}.tar.gz"
-SRC_URI[sha256sum] = "500d39dc58768ee09688738c8b5bfe07640ba2fd6c25a6dc78810eb69c719e93"
+SRC_URI[sha256sum] = "1e330571690191874eca415ec76889dd11bab9887a2302d6a3665cd081c4d77b"
 
 UPSTREAM_CHECK_URI = "https://github.com/rrthomas/libpaper/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"

