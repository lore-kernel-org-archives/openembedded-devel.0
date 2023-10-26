Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6751C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:09:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.199610.1698325747965193658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TsVr3qwx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.178, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so13028701fa.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 06:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698325746; x=1698930546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=81vggvcZ2RRc860zWwIidi6ybvkNc4kKjhcIUPCKY94=;
        b=TsVr3qwxh7cvHnYmeIbx+6WNqffLyyxV57HpBq4E1ZbwV/0hQ07+E5/h5KuucC9ezy
         lyI5wmuJy5jLzJ6ISLPyL2mxCDyKf8jvqPRpxCxkRSFY6wX1AVaSnpxprVDacuNBVTof
         cOPHYeahrYuBFrWf8CvEzEjDX8r2sGUFKrhgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698325746; x=1698930546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81vggvcZ2RRc860zWwIidi6ybvkNc4kKjhcIUPCKY94=;
        b=DNPS4oP3cds+hKj08WS1d2HC4UsSEoOYcTpnf6VMYq9w7Ztah/Sf53vb0jrcHEycOV
         GMLR9CZQSYmjnihZX3ToaKNGKwCcMiolYtALgRhddQAtAEkpMxnItALjnMV3egWgrf/V
         fQgAgfxzGmjJFy+68wwYdES1Tv0Za8tIzY9j0v44PTFmTYV29IvHVg5GyaDye2+wHFr/
         RqBPVnl0Ki2CnMm3OQiK4uAJiMUqDTXo8xQKAfgYf8twy7Gpl92y6nK8+v6jVAIyi1kM
         h38uTyRm3d+hgzDS1LCLTDg6B47DExuv3y1/PCk8Hele0vmMB5TFiEdDMUdxFWFXmyeB
         PDew==
X-Gm-Message-State: AOJu0Yx/B2KVWM6tJpox5gsPR2q7RYGdZqzBhPF111I5gEWDiGeaKGye
	CNBRgMhCBFxvxmWSf4SClv0kAiHQGetsaBauYsM=
X-Google-Smtp-Source: AGHT+IEyebk6Nw60c60R4C6Sw02Q/sotJ2HbpsbF8N6rkZZB29F6hFsKZcbSEGwxgBON2SeKFpkR2A==
X-Received: by 2002:a2e:b5b7:0:b0:2bf:fae2:f97 with SMTP id f23-20020a2eb5b7000000b002bffae20f97mr12113053ljn.12.1698325745643;
        Thu, 26 Oct 2023 06:09:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c350100b003fe1fe56202sm2541890wmq.33.2023.10.26.06.09.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 06:09:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [PATCH] python-blivet: Adapt to upstream branch name changes
Date: Thu, 26 Oct 2023 14:09:04 +0100
Message-Id: <20231026130904.1500640-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105742

Upstream now use main as their development branch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
index aba127897..42bcf4651 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.3.0.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "42512ee48494cee71febf04078d9774f0146a085"
-SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/storaged-project/blivet-gui.git;branch=main;protocol=https \
            file://0001-Use-setuptools-instead-of-distutils-in-setup.py.patch \
            file://0002-Use-symbolic-list-add-and-edit-icons.patch \
            "
-- 
2.39.2


