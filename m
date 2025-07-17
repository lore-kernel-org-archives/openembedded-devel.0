Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73E5C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 16:01:59 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.2088.1752766892351319403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 08:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=RuBK5fP2;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.167.50, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55511c3e203so1067346e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 08:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1752766890; x=1753371690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oEWMryeVCDA8SBCC3T5TUfd+OuLLwgakK+D3enfHYKc=;
        b=RuBK5fP2DalpGraS3RY+WNlhvtx0U+tezy18LBgtOtM3TeyhaZ6bbdGm1gRl+nQUJB
         Lyg89FAPYK8ofbVp1rEoPuBVC8hrZlgOtEGWldfPMDohd2jZgUWKsUJrm0QTQJ12tFY7
         Q+Do+w2GFDJGirhgNndwIY/Ls8hK2WCfnFq+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752766890; x=1753371690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oEWMryeVCDA8SBCC3T5TUfd+OuLLwgakK+D3enfHYKc=;
        b=l6ZSISUUh+ATWa2fJi74QOSbIJ+fpVdM0GQVs9X07KOHB1MZmrg8DNRwkP9i3KQGH8
         DNeptBPcSMC/TQmIeRs7XGwAoBMPASGmmZ821BS9zwUu5jzbR7aqC4y08GQ+4WmtLOCR
         JZADTEqg76wcNCzsKgtKDDam2dL86TIljiEi11V4eeR2YPEs+zodbg72eZmlC0+E5JVN
         eaiE8siMpksGPwMycFjJ1lY4p7LiW1thwLh6C6jycO+sjxPTq1y1ylJxwIn96M0LjkBe
         NG9BgLC6aJ+vBm7xnlDYWDh17zLQQQRIOWn93pVWRJBwf4+WkJPze09skknZJ1uyMlvT
         Whug==
X-Gm-Message-State: AOJu0Yzjb3fmiBsGHR//sXW8r7AVrECnRiwn22f60lx8E4v01cRZ4LwP
	I8k/WHAzCH5wE2jvQ7elSBuV6GPCYagKOMwXIf+Of8mn8uWmIQj0xZMrpIfsGioVbpAL2tEqyNi
	g9FCB
X-Gm-Gg: ASbGncuNGgQOFgHx6kUmmSDhSRcR2o+42/velRyOQcGTVz0Sz+wCaMSEFvszTRRnB8n
	lGJJKC2nQTHXvCjs+QaS+hqF5nr2n7fEIFsPvs6tsGdtUd1R1UBhJ3LDotFGZHd41huOYtLIE9h
	64KHiNoaUNDTE0iYtcDUS3rMcj190tKvnIIoYLfTpqaULJbsQo2/dBoLkAc8LcZO8aTMgaLIq5X
	dJY8ryqiBY1C7vkimlQL9gjChSfpD21ryof/2d36lzExztvfPbbDFFWvDraoxYnaz57Lykozhpz
	MBlMfLxR5M4c6J2ok7GG9xhXT3pjsDknIELKjJRwuwzdyFJoXXaE1mgqpbcWHoTSLZFnUEmsygY
	Uh4ExsfXd3hrKba3NRIGZk3Hdck3txHXhDHjFyZMTT12Uc/gD2iSU2U/ITltH/EiTxqrV/Vvnub
	FqHfTZnSydXvmInhhlqJ/3TlWNGag2IwZRyPodTDby2kccltmVZrw+1bFZ9w==
X-Google-Smtp-Source: AGHT+IE3iwvy7X/fbuMBSr2VkrRbUKIkekI1Ulfn2/c3uf5pkK34Wv6Be3mXodI7CK+WJZ9nUW3+oA==
X-Received: by 2002:a17:906:ae8a:b0:ade:cdec:7085 with SMTP id a640c23a62f3a-ae9cde3188dmr612261266b.26.1752766545607;
        Thu, 17 Jul 2025 08:35:45 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82de8easm1383926566b.153.2025.07.17.08.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:35:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [meta-filesystems][PATCH] ufs-utils: upgrade 7.14.11 -> 7.14.12
Date: Thu, 17 Jul 2025 17:35:40 +0200
Message-ID: <20250717153540.865717-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 16:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118615

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../ufs-utils/{ufs-utils_7.14.11.bb => ufs-utils_7.14.12.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-utils/ufs-utils/{ufs-utils_7.14.11.bb => ufs-utils_7.14.12.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.11.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.11.bb
rename to meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
index 50b6b5a16cfd..bcece228f5f2 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.11.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_7.14.12.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 BRANCH ?= "dev"
 
-SRCREV = "92c8e4d732c34f8d0754d0e076879ca7008bace4"
+SRCREV = "dd2e655780424eadf7610de33e5966be19168a95"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
           "
-- 
2.43.0


