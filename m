Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E612CCFA18
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:08:45 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17609.1763014123769499794
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lDeKiW+9;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-340e525487eso267451a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014123; x=1763618923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MnPFuIu6ly0OaRtayjBwkSZTud6+VEqsKXm9BFJjZ5k=;
        b=lDeKiW+9s+OP1g2VnaIf7FsAT3qxXn2r12Ptzn1I63Ikt28RuZNHk1ukuJV3RGeqiK
         Ena2ov4bJMBSnApERW/oUWv0AyU5D0nG1I21rYZJcYu3drCyNZ13zdU49fju0ZTQcCii
         D3PaLHDbZ1Es0QO2P8vz7STacDkS4l2AGIHQmRzmAkkL6PowJCXukPnEIJh871+pT/Mj
         wk2PD/mupfUFkC51pJ/cmDkkHje27B2sB3bEjmhTbwLS0olNYUibQ4/VTBIyG3chBKXq
         aGTZ0mByBusgUfJlpWoZJivTEvK7ZCFJdsW5ONeJZMuGYWH9T3f7WXmIWlBOfFkJZkxb
         3u9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014123; x=1763618923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnPFuIu6ly0OaRtayjBwkSZTud6+VEqsKXm9BFJjZ5k=;
        b=RGR9xHEKDUH9UY5vWD+g4TM0xHQVHwUY/47AVqLuZ8JwDveSMSC+ldULGW0fjU+58u
         Zoy/Sz2f+5BRpusRR6yysx8b6tdASsbnm60k801UmMwBIW62dP/UWDVOsBuzIJjD8UD7
         SyLA51js9VhpbZ6oyveGTJKw7MZKzeYncRiGoFXoPSkoIBRY1dQycIUeOeDDajlfP9Ke
         Jd9AnjKjSgMly+fNF9FplfyMHjhG50iUWSlAXeSfTLgSB5PvY/oKZ994weU25hzUfCA4
         1wi1Sjtf0cH5SdZArrUgkUfJ6kJBPIusUUuYzJSNmN3FXxoU62vWfKH8vulPCNF9IS7m
         5Taw==
X-Gm-Message-State: AOJu0YyCeThPuSOznEvsz+pCnwUUsMKbO1lHNH8vMIVAHxiot+jbBB9N
	vGMdfs5bE6xZTCG9jqFkfKyObK0Ax7etFYwYZ+SgtIZuDrEtciZuJRajBoQAug==
X-Gm-Gg: ASbGncvuYW3/LcW60IRtM5Himujv5mBUMyM6LPfCkhHWjmF+/fnPHD0M0tMy5jpfcHY
	gstFLkQCX6gDbSHob4+1GdsaGeyGTanf6qXw95cZZVH2RmXAO1XcTstWL5vXGwUZFCEyhPerzwU
	u26u99tYkcBVgMjfdAe36r/oqS90TjPytV5GouOPn6MDHeasxLOT2Zak+bek2uZC7ODBeKlShei
	jkk/zY21D9fvdMqS1gMxAdvGqS9uCoN3QeDkDPsiyqUXRdtTfSR7d0eHomMBiT3VZkxV46dX/2E
	WIQ/ni7mFMcUVOrkmJMqlwzXhri5PwAkcAS4z45Q7I0tq14QO/MbHUnBt1OT53cR2ihT2kJHJ+5
	MohjMR4hIRgl2nvaRpWRaur6OyPEAqZrzbwdS5YvuUi8x96wABLG9cR4JC//mPCO0I7TihGyZ1C
	TKqz21qA8rtTez4g==
X-Google-Smtp-Source: AGHT+IFftlSOEHJ/+bBV1P9mSDLAdg8uGrY9bDCq3BJyHCkxMVBDmMsfHw5EloK7m9y20hdcjiOP8Q==
X-Received: by 2002:a17:90b:2dc6:b0:341:8ca8:ae64 with SMTP id 98e67ed59e1d1-343dded54b6mr6831775a91.35.1763014121853;
        Wed, 12 Nov 2025 22:08:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e06fe4fesm4676711a91.3.2025.11.12.22.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:08:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH] redis: upgrade 6.2.20 -> 6.2.21
Date: Thu, 13 Nov 2025 19:08:29 +1300
Message-ID: <20251113060829.3747988-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121598

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/redis/redis/releases/tag/6.2.21

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.20.bb => redis_6.2.21.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.20.bb => redis_6.2.21.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.20.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.20.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.21.bb
index cc98781fed..6166769ffa 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.20.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
 
-SRC_URI[sha256sum] = "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2dba6ef4"
+SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e9b6d5f"
 
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
 CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged version"

