Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AB8C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9110.1685521530121090666
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=q7yyqwzW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.43, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30af159b433so2510477f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521545; x=1688113545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MnSu52Rt0fg1yUbUwwEYBal7HuPl0oNcj1wz0Vfm4M=;
        b=q7yyqwzWsf+5bZATgxLogeic+mGPDK2PqwgqUnSAg8RWIRHcP/kZh42NiCl69h3ZJr
         n9kY2QVhYqhmuIIb9PipQU9c77kZc6QaFzXzStMTaSShjSUK+zEB0zf6s8etoigo4ocY
         W6zN1bdkPBqQCCJEG6sdQTzHVuKusoElbXh6W1C70K+hDeWVeM1a2pyg8va35ewJL/A2
         0NWF1TiOz0U4cjuWf3ppqryPGrxb0AD5CKZKZiFZl1QnILg5Iwf1cPb6QfeuI4xlokiF
         Fqfw0q/OOmIoelqlDoSuuWTmLcmS4OKSt6x/gogTCNhNdCMikJ5yz8ZmWZhiIJXxWDWD
         cDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521545; x=1688113545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MnSu52Rt0fg1yUbUwwEYBal7HuPl0oNcj1wz0Vfm4M=;
        b=agmmGVR0abPINCZLaWmW2viOruZa2VvXQDaVBiKBQZwTmR2t34M8yCDoB3uG8WYy7I
         arQF2bxjax86gj4wVIJqcJlc7/0vApDYCR2YS2HeTh1RxFbFlaZbz2zF+RXxC24nk+pP
         jhJPAETKKYbyno5UjRKfgFk8YLH9d8HkU+E/thfEjEuGGom6aeHNuaW0W1B/odn3HwQ0
         GIOCHzrTJwdq9yoeICECZyarMBx1t7sKIUBh8AFppi6efWGu6emYUEzUdaCOo6+iFqUF
         gCKqUMV0yNcpjfKTy06Ov8V0SQvhi0L+31B+k1iBGVS/MeEVLBcUdXXRNFqWimShJOoh
         LCEQ==
X-Gm-Message-State: AC+VfDw7hFV8fozP8RVqfw51E2bwCMLsp9nUjNImiuGxzbeQLXrSyGoW
	ztXm70qR56+6907F+ozgJW5RzbMNHrysFVKJ1lo=
X-Google-Smtp-Source: ACHHUZ4KgCvKBuWjxgTLxxKYgh5IB7s+l5U7fYj3q4RU58Uaa5on+P7+4Fuw3wm0ohPvqtiQuhKpag==
X-Received: by 2002:a5d:6803:0:b0:30a:ee36:2840 with SMTP id w3-20020a5d6803000000b0030aee362840mr3405097wru.39.1685521545351;
        Wed, 31 May 2023 01:25:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 036/149] python3-tomlkit: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:44 +0200
Message-Id: <20230531082437.10646-37-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102963

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-tomlkit_0.11.8.bb       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb
index 71a43c455..5ec7e6e9a 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.11.8.bb
@@ -11,6 +11,12 @@ SRC_URI += " \
         file://run-ptest \
 "
 
+RDEPENDS:${PN} += " \
+    python3-datetime \
+    python3-profile \
+    python3-stringold \
+"
+
 RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-poetry-core \
         ${PYTHON_PN}-pytest \
-- 
2.39.2


