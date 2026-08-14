Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7ABC5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24353.1786747561853980572
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OGl1Za7b;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39266382df6so1322359a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747561; x=1787352361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iswhgfl6u5UdqZJY/zGyYLh0YZBl+zy+YeF5AocOT0Y=;
        b=OGl1Za7bOc8eDCeyAYEzhhJ9CrjMaaos/cFo5kuBy+artx6Wz05NQ1Q8rdgq816X5f
         AWJcjgL5/Jw4+MEkRJzkblTsrVXe0RVBPyjMhwMZSkgUOgmpTNgwycNS6uwPZIM9+V5n
         pgHpLuyhVXafKWQOI6lVBLOLkEdZ+a90eHv5OL8ndzAiQBhaweaZhoRrv8nymZ2ygnAk
         vvBveuDmW+gElK36rQJpSbA1Rhhug9I8KZMuo3HWXlpPIco7YeSo/XuKDCNFSBBUXpQt
         jk9g0kWZF3kyvq4h361MsqiNFS9LWwjoOeODU80zzDGhDmaFg5aFbCI1ItReBpHIHMq+
         vXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747561; x=1787352361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iswhgfl6u5UdqZJY/zGyYLh0YZBl+zy+YeF5AocOT0Y=;
        b=kbT2izVyGM0ylB2DnRrM5ElJju4Fku2JCnPdoeeB1x6KuMVA6eH65vohPIGCS2Nh/V
         Q6Vof/LJDEtbtH6yHd6mhjlVijBCADA76RFHPrCKBWZw/9g/7mvfNpIWVFi0ud5o3w1K
         r0wYQgf7RailRFypCCSCWBLDwjvmxPWjVavAx/eNAkCUyTcKH214+hPX9tk/ZeNBVyba
         1Fcs+R7Ut7Y3Sm+1XPpIKiq+5W5+loFJ02RtMtCAZPgg5oOfRSaB7enFkFFzOhm8slSO
         Xa2U3sAMMiqpdiZWK4bW/Hslw/lKftu1gpF0Kzqzn3NEvf345+zkQJVZQ9JtGoTNU3ku
         OKig==
X-Gm-Message-State: AOJu0YzgzYrRM1QoQahBBSu/ulumleSFNlsbAqJcJcwa5TccjoAMsknb
	LMd3OD/gb9dNK50Q+kpbYdNb1PSXrx0688n+EtBfX9bS6x/5npsaZZw7e/w0Ahtt
X-Gm-Gg: AR+sD121ICUUsSqvLRH3ov0japX9Hk2dzCYZ7zVaQVAImL8UdMsq8VJjWzV6s/qU+Ry
	uMgXUcOQJ2dWjcBs8bef++fHj4sjMzuEJ0ZV2PV5DF0nHDqZVxFWpJ6+bc4hcl7S0+0gqsHP157
	M1zB58Y7fjNbmiGPl0EjxoSu8aohHxpo+MuXdMK1Frj0Te8BdUE1oiNb3UThQb9E2dnPzNnUvsR
	3negn6al3BzpJcGPFxnB3HcOMdQNb5ehdrJYX0RASlYL3xUWDu1MwTVuEDigRxo7YaxrlLkRbLE
	sUTa+MFjhrH64VFI46GlExwt0mQxmkGD3dpvj0zFTr/4+1VhirEaP09hkAwhC+Pkl2qWmO5QtIf
	uLieUO/gZwD4TCh8PH2wqZ4qcyNwAmn0WAC+mj+iFn+wqOZcnIxfxqc+Ou4ZzahGBatOUYbGDYu
	2FxL7D6aknOW3S4wKFHZXBsR1FLYtyJqeVzwd4o0LPnxBJUY1vQzA9R2k9TyKoYzgGTeMys+lqE
	1jfBm5jdp1bctA0rmo/PkME/yM5mw3QmsyLGXo8p3k+3jEky8MmUCMLj2T+o1k4np15bQigpWXE
	G0m62DgiyhUqRHYXv+gQjs3ESitPabswmWAqUbDfJp4uZjfFE+XNXDKcfsZaQ4QfIf4yZDMSCzD
	NMXh2Mj5dL9On0ky/vpXigOJBHQwaKF8HzKMkRKw5oRj+7sNnbvFUPaCc
X-Received: by 2002:a17:90b:4a8c:b0:381:bc4c:da56 with SMTP id 98e67ed59e1d1-3933b95158dmr8990249a91.19.1786747561038;
        Fri, 14 Aug 2026 15:46:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 016/109] valijson: upgrade 1.0.6 -> 1.1.3
Date: Fri, 14 Aug 2026 15:44:02 -0700
Message-ID: <20260814224539.1523174-16-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129080

Picks up the 1.1.x line: the 1.1.0 release plus three subsequent bugfix
releases. valijson remains a header-only JSON Schema validation library
built with the same CMake options, so the recipe needs no changes beyond
PV/SRCREV; the BSD-2-Clause LICENSE is unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../valijson/{valijson_1.0.6.bb => valijson_1.1.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.6.bb => valijson_1.1.3.bb} (93%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb b/meta-oe/recipes-devtools/valijson/valijson_1.1.3.bb
similarity index 93%
rename from meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.1.3.bb
index 4e5f02746c..c2184da92c 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.1.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
 SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "4edda758546436462da479bb8c8514f8a95c35ad"
+SRCREV = "5eac4b66f20b2c189ae40281c29e71cf39a958ec"
 
 
 inherit cmake

