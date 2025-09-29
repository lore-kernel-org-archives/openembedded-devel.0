Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72FDCCA470
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:35 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.52846.1759151072834783952
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mP9eEydZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3e25a4bfd5so226096966b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151071; x=1759755871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KorhpK9ySupFPmvT+bRqCnWFRZbgyU7N9vLMLfjXOio=;
        b=mP9eEydZhR6GEBCL7rhOUe6OEnOsOpykYYBbL6oG0zNBSGXRiK+Cj/XO7KVGmVe3DO
         +yKMaGrsdX4NhDHYNZR3baJoSDKomW8NFbyKYIKeJnIhpJavB/XK/vDq1ghubhCDlkjb
         Clrv0EomKLJdCOOMwwcBbNrS3dSa8wfSHki8vRF/NaDjMjlxfaYr9kdCBDCRc216iVCc
         NRU3yGMMTbaysJsRvnPV1ul+i+tqbp1kJkj5dmDJcyNPR/kA3iaYTaK7+ViI60YHP1uO
         x1A5ruamV2oikguPyWy75Ieoe8aSDQa09nvVUgWJQGbMYkGqIdQt+g/Io8AJIvUibEmi
         b+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151071; x=1759755871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KorhpK9ySupFPmvT+bRqCnWFRZbgyU7N9vLMLfjXOio=;
        b=LVCf9IFLxX1DIquZszXIQtUv6IjqD6PBTUlft9/DM8yY6xl43RsJ2SAarW6nsAblSK
         X+CMNTqz78MZLpXc9TM2Cd3gxISIbuJhKchiXpnp86HukptALIuX6Ua96neKxKXzx8uw
         NHyyWGyrof/m5fo1cFu3M7egryknWozFuE3wsSICsaaixK6jJ6KoFjzsQpa/fI6ppGnu
         KUcC43ZaG6gxRSBXqF3CinXqljLMT7Ry2dTMjQ5LZyJTODw8Ylz0t4VImL/zNxziZQKk
         W8fmk4RwYiJUHTn6DDufQg5uIUbDwXc3OMpo+wyjUSQafQh4Y2cHHs+2Bktp/j4vaeRc
         2Y0A==
X-Gm-Message-State: AOJu0YxHhGRnOdBvu3PZnPK8BtOlmjL7R++mWVbnqoG+a1q2GnQe09mg
	L99EaTjQrJnZ1CIZiNTnc2aAgyTlhEMDrXtLl1BSS9cCyiO/n67WXIBSQMBh+Q==
X-Gm-Gg: ASbGncv0cIWlC2tWeCNE1OFbBlvcnbtbaumMzW9eADZgyqA9GYhgjlqunr3ZNG0HN2m
	9R7G447l+8z3bwCFGgQwcys3BH1WZZocvyAg1J9DUV80Hd5pAm1eEadRZIxfjZiqAFpsMUcBfWU
	8WfeknHp422ZsZS0GJ6Wt2KZc/Y+lphKJCieJBGYyVxEZlW2fgshXt0+wKHMY9XKCiVUtr/WBoJ
	u7vzpU7wlU/YkO0xDidyq3wZ04nhUgjA7AaMQ/d1g1bCz5WdgcGkZG61i8JRDEWdUth401fgRlT
	LG7tCrmZ4woQUGWQl96AJFP+GujDr2yzdy5WCG24BlWMbQyXK0T5A9GtfUQ2p3/fKN/HIF9IKgI
	rc/kMgFZMJh0HNfIkFScUNNRoOikV1zg=
X-Google-Smtp-Source: AGHT+IFhH5OebRGPRzvDcCFpDlF2lASgJKROllQrISmv1MgZ3dxx5yVWHVh0GB2o/lsrXwwd7qol3Q==
X-Received: by 2002:a17:907:6d15:b0:b0f:4ae:c83 with SMTP id a640c23a62f3a-b34bf383344mr1813777166b.63.1759151071031;
        Mon, 29 Sep 2025 06:04:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 04/22] ndisc6: upgrade 1.0.6 -> 1.0.7
Date: Mon, 29 Sep 2025 15:04:07 +0200
Message-ID: <20250929130425.2912077-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
# Do not ignore multicast advertisements when discovery was sent as unicast
  (fix regression from 1.0.5).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a014528ede30caf2e1ac340bc09222428c4f5870)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/ndisc6/{ndisc6_1.0.6.bb => ndisc6_1.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/ndisc6/{ndisc6_1.0.6.bb => ndisc6_1.0.7.bb} (98%)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
similarity index 98%
rename from meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
rename to meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
index 6861314a0a..a5b9bd08b2 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.6.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.7.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.remlab.net/ndisc6/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "7e314b23329f9c24c4c097b8513673fed7e7158a"
+SRCREV = "c308ba5370d66acc44d411f12d59af61d522b91a"
 SRC_URI = "git://git.remlab.net/git/ndisc6.git;protocol=http;branch=master \
            file://0001-autogen-Do-not-symlink-gettext.h-from-build-host.patch \
            "

