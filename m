Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D39DC7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:31 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9110.1685521530121090666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=kuxyt6En;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30af159b433so2510252f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521528; x=1688113528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JVpJuyZ29xiRoEO316V/p+jx08BtwXctcS32Sy+vW4=;
        b=kuxyt6En2SBQHfeNwMW7Tkn8AI5Rhb8cZ0IVBrs1hkq/2inXzQRqstpxqw7xnBaVVV
         +yZhZMEIUfmlLi/ZJBpA2cO8ha64X+ihJSdM9BqInQxMx9yT7kcKDUJF4KYDyiZTLFHH
         w4HRmHS62TWZbd3+PA41lbIMDAWbNegAvK+dMt4QBW5Gb0YVFceDwXaTXYp+wyDgAgwP
         UKVSdU3TjXUxYzf2wiNvBkzKUWUaQywTnnKWrxprBI0eg4yORRKdU03OM0WfMvfYur8z
         GKsUelzZua37XwrEMTlk+3DRvtvr0svvV1zW2cc+340JqTSvx31dyAjALbRrE/11iXMs
         qNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521528; x=1688113528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7JVpJuyZ29xiRoEO316V/p+jx08BtwXctcS32Sy+vW4=;
        b=gNVGU/drmGh8RN2LnlPlKAiU2zYeFM3189wEqNpHbW8IBU0u74/Oi1uQZ+6rwKM/4c
         FeRvo9CKTUrcblI/ygKMAwBo6TmmcAUtwB33Su7npBdBa7ytzYWNugM0gCl7TvscDTr+
         /uB1JOPZoqXnyPpXeEjRb8PE99nwNwhzMO/jrBXKPz4wHz5FTnnaGw7e2mfytd+1kdjF
         KIBWP8d/tSlIr2XQw/tI5QaFaYxyTnJDV2JX3Pw/eLzszFwYASI7qxJqc4TGifSAJt/W
         eWNcnAk5oCydOIA5du5L/kt7v5VfVLZQHxaYvHWnR5NsGlHi5ytdZjaRAAfHk8WTDKOy
         FKhg==
X-Gm-Message-State: AC+VfDxY9m+JwsOriXxtMpBfcZ05LC4RomuOz2SMKBpwyJGAzQRqY/E/
	AFFw7SiY81WwIMG6Okk8yT04ag==
X-Google-Smtp-Source: ACHHUZ6mHimZnV0jnbUOWOPk0GcWbBv96HKCaB0+ajAEZzuz2+m+26b3gHO6cIt0XKjvk7DKjUCMxQ==
X-Received: by 2002:a5d:5903:0:b0:307:8cf6:c2f1 with SMTP id v3-20020a5d5903000000b003078cf6c2f1mr3279104wrd.34.1685521528682;
        Wed, 31 May 2023 01:25:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 020/149] python3-xmlrunner: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:28 +0200
Message-Id: <20230531082437.10646-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102947

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb b/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
index e81e4dabe..7259c3fad 100644
--- a/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlrunner_1.7.7.bb
@@ -7,3 +7,5 @@ SRC_URI[md5sum] = "7b0b152ed2d278516aedbc0cac22dfb3"
 SRC_URI[sha256sum] = "5a6113d049eca7646111ee657266966e5bbfb0b5ceb2e83ee0772e16d7110f39"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += "python3-unittest"
-- 
2.39.2


