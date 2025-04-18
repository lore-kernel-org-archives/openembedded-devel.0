Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ACDC369D3
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 11:52:07 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.9976.1744977118411089570
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Apr 2025 04:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OxJfVDAi;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so2909825a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 04:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977117; x=1745581917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ih0Li0D34bkUg50jsYalHTL/Nq7Ule1v2GmA3vDCQCY=;
        b=OxJfVDAi5bz8fZkCk4qPA/Zvby2m1Is/seUFRXfz0pDF1fN6Y+yGftP+n5Wq89DaUR
         xwTZ873nl2bxw+VVVjcPIQWGP8l0NaznKYrJr3QDw0DgcgWqkIBcFSMLbAjcdEeH4C3Q
         GREI4F8T9JObsGdWFk03Cbxe75Ot+zVLw+3nI/G5OwslgpMwVVFYtpDR+iDzaKbNIGw+
         pkx/Otm+O+4fbgTODq587HvNjwcXqamDnMen8ph7KYJRX+zNSTc58PO5N/r0BfB0n0s8
         wsxDTUdUgKPnaYMXys/sUPkHBFV/ya7lUDX0kDv4pJziUu1m6BOMRXX3zHbc/WD05SpO
         iyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977117; x=1745581917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ih0Li0D34bkUg50jsYalHTL/Nq7Ule1v2GmA3vDCQCY=;
        b=GkURKasbEQD6kMEZfMtoOveI6xfIAccWx2HmuX91Vhfr8fkOae1teEQrUkV91z7I2j
         pbNZAwZ8sT4MVGzSFkoepw1FDEx/LhaMNOiivgFVOa13gtvPUTvRTrrRr8TbRhQrEaHL
         jjsFry0NQYvX0B7XyNUE0nrOsvI1GvJFOu2h+sfoxwc6Lb+uXcTY3TnCvkU+kITrHF2E
         1tU6b7sdDYA4OdYs+gP0fXCwWpUWorlBxM72AOe50J6wORn1Pd+8p5pywqkvCIxGs/eA
         D8RQdI4Iv/NDDNIzCbhiS/BLx/eNpT5jKRxMLe/rV9ejIc2+k/2mq3dp6Yr3OJCdzvv4
         90Fg==
X-Gm-Message-State: AOJu0YxTxz5OizH/5teB02lInBMzFPz4vmppJ6oYRQeqI48gjxnOE3U2
	OASAuclwIHjppTOIAJOI4Yt6wYXqfVsDzXKyBSre33owwhiU1Mz5
X-Gm-Gg: ASbGncsg35FSD6En4BvF5c2j06HJKO64INs21CuwgHMT6zoj6SiERIlrZnBlYT8wsZ4
	ImlkcVC0J4zrxb6WLVG2Q1nxxkHtOLGOrtNR85z90htawD/l/w95OzL3RCdJDpg7nYImiYx4AhR
	ruNojr3eZ9n6K54YPt/WyaMXkg4F6WDLH+sU8ABSi7mu2/GDPN/2MLgA7DydCx/easQeuFG3lsm
	uOsT1YnaRThu43l7lUY+SBFdkJt/0T4rK0c6uURGdlUL+fmdvSXnmGROGNyhCbExRlQtIPX2ihO
	N4x5FLYrP6zAHpgSgl+uWLUqGgmTBBJe6GbyJQQ3WSBGloShtUr0mC2/d3AL1wen/X6j7KvfgP0
	bZu5bYM8GgiHg197jRN9BKCmw2gGDmkOs+Y3LUcL85O0wqaUpSMPDeP7lZx4hX4g=
X-Google-Smtp-Source: AGHT+IHObDtkaHvscF+YzoJd38Q4uw1hRr5eg6cHAc3VfH+kv7kxpE1XpFbyMlX0TOIT+hxUq65HRA==
X-Received: by 2002:a17:907:743:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-acb74d82d2fmr199482766b.37.1744977116592;
        Fri, 18 Apr 2025 04:51:56 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1.fritz.box (host-79-22-125-209.retail.telecomitalia.it. [79.22.125.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm109718166b.166.2025.04.18.04.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:51:56 -0700 (PDT)
From: alb3rt0.m3rciai@gmail.com
To: akuster808@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH v2 2/5] can-utils: Split mcp251fd* into sub-package
Date: Fri, 18 Apr 2025 13:51:38 +0200
Message-Id: <20250418115141.150272-3-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
References: <20250418115141.150272-1-alb3rt0.m3rciai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Apr 2025 11:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116959

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

The mcp251fd* tools are specific to Microchip MCP251xFD Family CAN
controllers. This commit creates the package can-utils-mcp251fd to keep
these tools separate.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index cad41944ec..932aa1de20 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -20,6 +20,7 @@ PACKAGES =+ " \
     ${PN}-isotp \
     ${PN}-j1939 \
     ${PN}-log \
+    ${PN}-mcp251xfd \
     ${PN}-slcan \
 "
 
@@ -56,6 +57,10 @@ FILES:${PN}-j1939 = " \
 
 FILES:${PN}-log = "${bindir}/*log*"
 
+FILES:${PN}-mcp251xfd = " \
+    ${bindir}/mcp251xfd* \
+"
+
 FILES:${PN}-slcan = "${bindir}/slcan*"
 
 ALTERNATIVE:${PN} = "candump cansend cansequence"
-- 
2.34.1


