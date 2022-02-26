Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AAEC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 03:40:52 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.3047.1645846851083969566
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 19:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fbFTetGf;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d187so6340743pfa.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 19:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+tEr3Z0f0NUh2TljoOZ/C9+hmb6dN/Ft3aVj0IRr7KI=;
        b=fbFTetGfYKVFJhF8DuwcfM+FiJThO4h0dyCWZkxamIyI0fFZO2h+4rzxMgG0IDuGlo
         y7nJwAlSt1R6Gj8n6j16UR/3mZ698u02beU3ynkEaWTv/Y7wrPbbDwS9G6mqpqw4zLMB
         Q/ds+utsUhNCpZWGpFGpKhh5MFN9yQDcmWBhMpSnNSJ97vXe3jK0Td7hlCbfhsCmUR9K
         +m7l0rSyf3MpFPVO5uVHcrDkTTMdbVMMoh+JNzaphpA9q16B5KUoyytlRN7nvKeYJ6In
         vlf2i2qclwhSJ25FnuO8nDL2kSv8cG+/O8WBugrd0e+Lc1vlvO5eSZQmbojCpx9RUv/c
         GK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+tEr3Z0f0NUh2TljoOZ/C9+hmb6dN/Ft3aVj0IRr7KI=;
        b=n5JW0xhbq5h0E3cRCE4InS3QVKizYLCPs8SddefkAJISp10dYln9CREP8OVXfX9aRl
         8pLSW1Ldt5GPiiVU9ZJxOobdqsJ/19GVoDTqc53tIGEiCtUMtaN1DVZs5nNcYiYUpz1j
         WDQCjZsirqLr+96Q6p4gl+cX/hCz6/iErBJ8sc4wNSuh8o9F1xzIsIISMFqRc3idzBft
         X8CEjhWB/u9MJ7tFbftxza3U/feBZKWZfiXt+NiSYzZ6Q1ydpFt8BXiJDTUh/2wBzAYm
         jVDrU4LEtKJT/QVFxA7cNtA3Eny8rPG88X61D33psh5yDeJJpz75/av8MNKhmhdnyFQ4
         b0hQ==
X-Gm-Message-State: AOAM533GXj/ewIuY4Th778HtA0ESkR99r79JBIUnAvEa7fPLTOTgLHyc
	CutWsVVwNj1IkkK6lRBCje/wrE9Z9r0=
X-Google-Smtp-Source: 
 ABdhPJz3m7E9HtRUoSAMiqOxd2OssU1P7yb14g7bRl0eCDoLX4W4Mq3LenijcRK2DMdchNQBYzMiGw==
X-Received: by 2002:a63:6883:0:b0:378:3582:c94f with SMTP id
 d125-20020a636883000000b003783582c94fmr3942528pgc.60.1645846849992;
        Fri, 25 Feb 2022 19:40:49 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d615:a2e3:253b:5be5])
        by smtp.gmail.com with ESMTPSA id
 lk9-20020a17090b33c900b001bc7c2dfcdbsm3870441pjb.37.2022.02.25.19.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 19:40:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-pillow: fix wheel build
Date: Fri, 25 Feb 2022 19:40:44 -0800
Message-Id: <20220226034044.1381510-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Feb 2022 03:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95534

Recipe does not inherit pypi nor would PN resolve to the name of the
wheel so we must set PIP_INSTALL_PACKAGE appropriately.

The recipe also builds its wheel in ${S}/dist so we must set
PIP_INSTALL_DIST_PATH appropriately.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
index de3c92c3d3..487e4b54c4 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.0.0.bb
@@ -13,6 +13,9 @@ SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
 
 inherit setuptools3
 
+PIP_INSTALL_PACKAGE = "Pillow"
+PIP_INSTALL_DIST_PATH = "${S}/dist"
+
 DEPENDS += " \
     zlib \
     jpeg \
-- 
2.30.2


