Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B78C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 13:16:07 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.5206.1636118166079248094
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WFsPwU+l;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so3313549pjl.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 06:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oJWmsvFcM8BEff1HAa5qK65RNq8kvk4vQ4LYt5WoDhU=;
        b=WFsPwU+l3XBgKZVEkHyGooRRFO1hoQ023hFK0F7HlghjSh0RoNLpSYSzfY3bWAhXxX
         HF5Ry3b2vPamOvuv+nHw1nXWtDGFCPew2Ip0jb3GTfCi4Ff+Pyia+mXIhjPaf1TNUvoL
         C09xDzlx9OOdQRFg4mT+F9GnVho3l5ZZr4ASx1I95CgDEIYGyqeG+Ye1D4J7fo2Mo536
         2sMS/t5WGgbiuoluQ0h4uAYR7XMYTdSP9DVCBLs4CDKjzL1WG3UIyeFF6jlI6SKFTviB
         h+1fWMs70pTnHBAxZsOEZwtIzd4s7rjltJ/+vdlRjs8NLooA4Rus9zJdlfHBNXGsLbyX
         qx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJWmsvFcM8BEff1HAa5qK65RNq8kvk4vQ4LYt5WoDhU=;
        b=XYHnlZOq7AkIX4rA62rQ6m07mgNNGV/S79wM71+onYaBQJL+LHfjGOKiCmwgSqeCXW
         42uPvacN0NS/jCDRXYtaV24lUpb2qQDt8SI5r+K4OY9oGsmxyArcmco1UsLQIK/eQZ/h
         dOYTMA4w9wVg6lT7Jc7wDPlZsF07zWQawosjrkaIr0wUYoa/7jAZAoI50hqv6BPqFWeX
         hkuYdSQStFIK7cI02/N95yvB/CNF1bs69iKLsIajBv/kquCfOkYwF7lpckF+S9H4sg8t
         Iqx/M9WOXr8PkP2IKwBEVbB1jvk6CL6UAmTxlJpN1xTPMQCRrnJg2NKEvenc0Ht2Iukb
         V7HQ==
X-Gm-Message-State: AOAM532os9kykdLOdA4rdqrkL0rsYfF1Ny5YdZqEiLRjYij6HQV4MjPA
	CQJBX8UbPyNHURzJLRbiNQc/uHh96H8=
X-Google-Smtp-Source: 
 ABdhPJwhuxXwXFZqIvmHHrsbe1yU2ze2FW8Ws7lTQIkzu0yMhpIBfKEAhmaycIaeWWWh2GWobU9p3A==
X-Received: by 2002:a17:90b:1c06:: with SMTP id
 oc6mr29594255pjb.126.1636118165401;
        Fri, 05 Nov 2021 06:16:05 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:1036:3e93:cc4e:1fe7])
        by smtp.gmail.com with ESMTPSA id
 c85sm7899124pfc.146.2021.11.05.06.16.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 06:16:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/10] gst-shark: Define SRCREV_FORMAT
Date: Fri,  5 Nov 2021 06:15:51 -0700
Message-Id: 
 <f8a2a7e41ac86371dd2b2b95c94d29c335f8676d.1636118048.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1636118048.git.akuster808@gmail.com>
References: <cover.1636118048.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 13:16:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93836

From: Khem Raj <raj.khem@gmail.com>

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-multimedia/gstreamer-1.0/gst-shark_git.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index d047caef5f..d2d845d9a3 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -14,7 +14,7 @@ PV = "0.6.1"
 
 SRCREV_base = "c41a05cc9e2310c2f73eda4b4f0b4477bf4479c5"
 SRCREV_common = "88e512ca7197a45c4114f7fa993108f23245bf50"
-
+SRCREV_FORMAT = "base_common"
 SRC_URI = " \
     git://github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
     git://gitlab.freedesktop.org/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
-- 
2.25.1


