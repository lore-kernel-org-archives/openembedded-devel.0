Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD35CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:09:16 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14458.1781075352531404708
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=abnZgKmC;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: nmjain23@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37474afe908so1329958a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 00:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781075352; x=1781680152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=m3FysmM2mqvLvzJIg46qWVyjSxkpDZtPbknHwE3EybU=;
        b=abnZgKmCkm60GlnOAQ9Ml0UftOkAiFENazfdYlE3WmL0qr5Gzu5eJ0Fhf404clCSKN
         EK7H24aXfRF+tAPiCpMfuZav92X5YKpGpT2tXXCK85VTawkWP4ZPurmTtP+OMW2LRhsh
         UBm0TIDts1nmYyv4UzPyJi8OFUhGXlq70Y2C1/AySP7LR+daM15uQyJ4Y/XAWlmhrgmo
         ckfuQ5kvgre2qq3cQ3eXiOcBofCrXTBIFpI4V1ZjDwatjv1X8oHfLHlA1PEqGZk7ruY5
         Ia+FayDtpivCgzOFQpBcswrNR3D3+aadztq3t3vBbP8FeZU06YQ6GcCBQfqlmVDkVjVC
         IhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781075352; x=1781680152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3FysmM2mqvLvzJIg46qWVyjSxkpDZtPbknHwE3EybU=;
        b=hDIEsRCghf6R/fRuTIzVyonwWc3cqyV4GyDeAzgRnAdZbSYeEp8/qNQXF+w+IRP7qs
         vRXbmILs4jv0Bm7W0JHWQNHgHZWE0cq9Q2Vf9VTS+NxNBE0UD1fBtx0W64EUCnXpAZov
         P0jBJ3Y8SbpIiU2Y3wdjQ4b/FMsVOSvhPZejBOLkS//+CEu+Z+DKr2ruazoT5ukJMJ/h
         AyQ7qnnVm+y2jln1qn+jARrEdvZJNFRYUcXmyCZa9FFdNDF9san5p8ojAEFakK2Ah6zb
         j4EzP7Od8Jk92RBU/ZMtuY21gPxcqTwTIOUV1TalMx8rV9LU/SkiDgtu7g4l0IBcd5/Z
         RInA==
X-Gm-Message-State: AOJu0YxZLsAKkqWMvBAR4mYLcZ3WxMsUJ4SmHr0tiFuLFFAN8scU2Hv8
	3kildRUdOy9m5E9EGKDjfNfMONWZ9jZ0brYdcTK68cKru6fjV8iOfQwU2EfFCw==
X-Gm-Gg: Acq92OGJ5BrUpJqw9KK58a6VOVUwggfqToalFv/G3Z34rH+JMFhQBNrZLpPJKDroFLI
	5EIhrQI41tPG4LOgpvkaKAWOtEcWxD1q+b2k/QN20ud9c///XXZzJmXhiYL72DO6ETOK9plqx8z
	Gyvf/8jj2ZxhfYbWXlR4XCbxxLIwSlwUp+hp2F62CwMRzkv2CYvlyBRa95iUsDbYwJeGlR6H89D
	XTF+6ttDPmphWyr6pro3LeegS3fXWeZq9uHdg0iKBVceAHxlX1G5hKl+L0n+9LEfRHTD45N2N7s
	cI5JCvJvksCZ6YVOR5ul5MySfa9wvkWuGiob+mDW5LTZ9+L2HmVeaon6FkdNatIOMGYeiQGV2Oa
	6FgjupKnL6vhr7636fboxilzo8B81ly/kEgF0efDzuHANS7/LS9gOtue4i2PI03dZmhUsM7XstV
	1afRF0oWA0lRGj0+4C/GCuc82WzCfEJv06IvMmxb1jEWU92XeJ1poucUNZtO0PNSLeMNnF0z4oy
	Q3FX33hgMY=
X-Received: by 2002:a17:90b:38c2:b0:372:b4a1:21d8 with SMTP id 98e67ed59e1d1-372b4a1234fmr15913614a91.13.1781075351779;
        Wed, 10 Jun 2026 00:09:11 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37625ecfe47sm1137015a91.0.2026.06.10.00.09.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:09:11 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][master][PATCH] nftables: Conditionally add ${PN}-python as RDEPENDS for ptest
Date: Wed, 10 Jun 2026 12:39:00 +0530
Message-Id: <20260610070900.791253-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2026 07:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127507

From: Naman Jain <namanj1@kpit.com>

This commit updates the RDEPENDS for the ptest package to include
${PN}-python only when the 'python' PACKAGECONFIG option is enabled.

This change will ensure that we dont get below failure when ptest is enabled in the distro features,
and packageconfig is not set.
It causes this error-
ERROR: Nothing RPROVIDES 'nftables-python' (meta-openembedded/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nftables-python' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nftables-python']
ERROR: Required build target 'nftables' has no buildable providers.
Missing or unbuildable dependency chain was: ['nftables', 'nftables-python']

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.1.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
index 04066c5fa9..ea42b74615 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
@@ -72,7 +72,10 @@ do_install() {
     fi
 }
 
-RDEPENDS:${PN}-ptest += " ${PN}-python bash coreutils make iproute2 iputils-ping procps python3-core python3-ctypes python3-json python3-misc sed util-linux"
+RDEPENDS:${PN}-ptest += " \
+	bash coreutils make iproute2 iputils-ping procps python3-core python3-ctypes python3-json python3-misc sed util-linux \
+	${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)} \
+"
 
 
 # For ptests compile the kernel with CONFIG_NFT_TPROXY
-- 
2.34.1


