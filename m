Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEF7C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:11:39 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.64318.1699042294810098364
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RYGTJgSs;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: festevam@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5afb6dda6a3so4870597b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 13:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699042293; x=1699647093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3MjIE/mtrE7jMz8sBm7aSGEFmQTEOOI9Tc5dUQCEOI=;
        b=RYGTJgSsVV0dpeKcTEszG70g3s4Z1hzWgunhHc33+rB5agYNnA1RUxn8rt9yPfLn6c
         NNwqOTbJTnTftydAayz7Qwq0RHIR7pdqfFJ7HkESCOZfv7fhshqzO19rOqnCd4Fd1cKP
         MZOnnXAI8UGA2J+sA8bUnG7VNnvxLUULurfTtTa0vVTRqjkeptjPr28N4FSknDl+FB/T
         KacGH0dBuk/JBjuIkrFPxED1ZH2uNQC4KUNU/emMIsW47rzTdibZ9YbGXcNIwdBAVD4s
         LUXuKPiuZRrwEXATfekjlhoS2Oh/ipDsngdkL7O1PD35petmsCwRpyEIGa4qaDPlypMa
         ob7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699042293; x=1699647093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3MjIE/mtrE7jMz8sBm7aSGEFmQTEOOI9Tc5dUQCEOI=;
        b=T2Amik6sHEVXP0Hz3nghJ49IgGun5lHyPb7YaV3sfTrohYz3IDALZ7cVNYxPsp+07a
         MAf4zvZQFtrHvArndtHx2ssba+IlFk/WOmQIquZutKR9G9rt0dZ+V4WaRNKfTCT4UFWn
         77ftymT9w5ON5PvOG+DOnl8N3Fw1roaKfhRE/GOupwAJ7bILCmNnJNKo++5yVxbuY43v
         VSTfPwyXvosNnP861on5biM5K3plMqliLwn933LRsOCYqSjHuR5gYlYlgFQAsMK3ue1S
         oUSIzSq+yCo6l7wiNRWU8x6AdWjV0MHLOVJtVfI/qvjPCYsfI+06xecW11PbuLEgfzrq
         Jyfg==
X-Gm-Message-State: AOJu0YyQvMxvKHtXJHgfy1oG8Q0hVEfm+KycH5RpW3gGM0pFrSEw15A7
	9RPnnNWpBtPVtAWj7YK2sdJiUAp8y/4=
X-Google-Smtp-Source: AGHT+IHhbamxAgVhXSYctyWTcqQyr53irhorZLDtAt2Nx6p1U2FT/9nr6JGZVb4zpYHv6Qwr24rXjA==
X-Received: by 2002:a05:690c:23c4:b0:5af:a690:e47f with SMTP id do4-20020a05690c23c400b005afa690e47fmr19516716ywb.5.1699042293518;
        Fri, 03 Nov 2023 13:11:33 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fe70:4f05:3ab8:f73c])
        by smtp.gmail.com with ESMTPSA id c124-20020a814e82000000b0059b50f126fbsm1339848ywb.114.2023.11.03.13.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:11:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3]  python3-piccata: Use https for github
Date: Fri,  3 Nov 2023 17:11:24 -0300
Message-Id: <20231103201124.14216-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231103201124.14216-1-festevam@gmail.com>
References: <20231103201124.14216-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106092

From: Fabio Estevam <festevam@denx.de>

Per convert-srcuri.py script, github repos should be accessed
via https.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
index b72589368..fadcc32c2 100644
--- a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
+++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e664eb75e2791c2e505e6e1c274e6d4f"
 
 SRCREV = "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
-SRC_URI = "git://github.com/NordicSemiconductor/piccata.git;protocol=http;branch=master"
+SRC_URI = "git://github.com/NordicSemiconductor/piccata.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


