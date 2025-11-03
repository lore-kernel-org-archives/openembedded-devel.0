Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8546ECCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 15:37:02 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24672.1762184215042985643
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 07:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVvf3Iwm;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4770c2cd96fso29584205e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 07:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762184213; x=1762789013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sod9kdc8xwTVs7Pb0GRkKKbHt21Gv62n6gqnQecjju4=;
        b=FVvf3IwmhMe0KPCoICNhuVXb2RNCAo5WymxbRCgdZbrxI3f90vF8gA2itDWpGq3b4m
         64htDCQHZCbI8AANof++6ag2iMqG5hBYAgL/+mSoeQ/S3WMWXqe4ktHf+WHgXALGGCBa
         f8DS4WFMUuquQFq6+LDtaL4Ivnbdi2HzTHjVlR+6BDVAFOm3iXaQQBZ+1/63AnFghfRM
         oWNlNw/+JcSbbUUKCIr6BIl6DrbWyWKgyqaiHYKF+cEXwnOPMsSiayYx8h2B+Vapb9B+
         WKwt/DHkveyiCArBPHLFOkjadvH86K/S7AGL1yfEWinPHr8ILG4odmTWdIbhxCloraSs
         TccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762184213; x=1762789013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sod9kdc8xwTVs7Pb0GRkKKbHt21Gv62n6gqnQecjju4=;
        b=CcyrlZz5eQbsRzyxN9GqeoDTV9/LrsllyPLMI2KKhl3uDyVOIabt9GUcGd8etQ5Zab
         0UNC99Uh6/1cl7EvQIEDn0NMYATEfgM43O7A94EhkeHXKYjgaSPseM76aFfSw2L7BRUj
         n4QhZY/nr6zA/Q5sb4DYFs7gd5k2aa93XJQrjm/xgFNTsuMjok0zp80ncu5+rFLkCziq
         Q4FN5SYdUMA+WmnI6Rot0QoZWGaItEi0PT7qQ8D24VjLpUWuT6ArbooB04Tjimv3NQoN
         UqmTmPputO5ATp5fd3TenRWTs9o++8pb6veMaQ6sVPeJuTZQxiSSR77G+KWJx8MF/Oud
         bX6w==
X-Gm-Message-State: AOJu0YzDMC/kLYgqChy4Yc1prGYmPCJQFzgeymN7s694CxEjiO8eMx8y
	U5Iov1ysLivfivro5BPANEy7YcVB6V9U7JZlvTiSTALZ4XxI09JXr1EZgxuZQvN6
X-Gm-Gg: ASbGnctgoMd7LKoqHure2+9mo3f+sMNsGiF5dXJu2CnpWNEXLNl9yP0pTBpAnAW1gdG
	wxnKuq4SP1/K3vnqw7LutLrj2y7mAYBd/dg3AxSG6mN3nhliBU3oW66mT+URS8zHFKX9BnfUyMm
	eCloljpMVIyUDCY4fVwxEvBmDXvBbwpAe4kdpTWQZYDhmW1Evjf+Giro9017wBFWw32xPKMUtQF
	iz0kTdm3AAVDiu0Uy77B0s/1eFtP//fsgs0+3wQwYD8s1+AcqdSVBleXTvaGfHz+1irSdIT9qkK
	dnWwD1oSHf3a2ompZ9O8XoOTqVFHOjRh+2OlFoQ3NMP3UDrVIJfsKyTNaeY1KsQpwtY/iCxzM0m
	SVz0hOntFhsIrO/2mz790RSan2NV+ug1V01ZWL77Gomd6aGEQZ/aME9H5qJfnAwIDpbRkFnzUOs
	wWMfZaDAEN
X-Google-Smtp-Source: AGHT+IEaInsmoxlf9h6ijYnwIvO1UgICnEBqlTAIFhsqgj5zKYX2zEPYG7BN/jyLpW1NmfR1ahx8AA==
X-Received: by 2002:a05:600c:8b67:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4773089c98cmr130073315e9.28.1762184212826;
        Mon, 03 Nov 2025 07:36:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c5647e1sm163254055e9.15.2025.11.03.07.36.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 07:36:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] frr: add CVE_PRODUCT
Date: Mon,  3 Nov 2025 16:36:51 +0100
Message-ID: <20251103153651.1209934-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 15:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121275

From: Chen Qi <Qi.Chen@windriver.com>

The CVE_PRODUCT is frrouting in NVD database.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 10c7793832ec492da50c89889c5cdd114962b7a5)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index 857973df16..f8a3404e9b 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -40,6 +40,8 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.2 \
 
 SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
 
+CVE_PRODUCT = "frrouting"
+
 S = "${WORKDIR}/git"
 
 # Due to libyang not supported on these arches:

