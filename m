Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20658C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9077.1685521583787879806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=HW5mOe4A;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.47, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-30ae141785bso4566417f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521595; x=1688113595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsIRzsti7pFBYZJdKa9w04UT/n97O9d7qYrDcyi41C0=;
        b=HW5mOe4APlGdqLX/GW/AoVRo8gYFTqUqWK2lBBT+nIvE7pq3dirH556hTpAp7IqKPb
         ZyPG43gER+1ScnMBrdU5SlCFclQ8t1uy3F4LNcDavGAiwGNvZLgwfBlEXrif5Sp4tvnt
         lSOlb8+Z1Wafzx8gEqfUwE3+++CKhgbj8VWkYf3LYiHb/vGiPsfqRLsi/Zwn9xR5KwKy
         kS2dnCVkBXRp0tL8EvelgMqHX0YRM90jSMmJ01BbF3Ej66exbgTIy0McSjs5A+u9H3jv
         aYS9WUMPeK1jz+N2cvQWYVMbzpnjOHSjCVb4s9YFrFalfnwPHy/M8lzF+h9kC2F5bmIC
         8qLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521595; x=1688113595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsIRzsti7pFBYZJdKa9w04UT/n97O9d7qYrDcyi41C0=;
        b=j+COyULOqfrvaQ33j13u7pSu8hvzst6B0rOMRLGXgZRlkDOhowg0iwt7gh3mnp6HNf
         XJetyputamny4Si7J0hqNn7gpgru9P/fx3kOEgIhONgz9nNuqwoxBRNrHh0ZrJQMY6cq
         otjByy1r27rZjFxX+YoLDG3grQk3eZsSkP4c6nzrwu/gsfBtNYpQB/k18hr2oJJO942i
         H7lnmbJaBh68Asvy1bMaYWi3uaP8Ei/5v6FB3scnTxvviwTw8Eyt6r5Z3mRCvnUY9Rya
         p05GmmLIlkZS9NPPGYn8CnjehdGs7Yv2HuH2Nmnqq/Sl3yQKuSMdapl56e7xp0r9O3AG
         vWkQ==
X-Gm-Message-State: AC+VfDwJNU6K1rs/P6N3FzJifpUFJ/TbJ7ovggEkpABfls4M6vaFOL3g
	qsOeIaPxs+MF9ZIMdZoE/kXSiA==
X-Google-Smtp-Source: ACHHUZ6LL9uNRthNmgPTF1bCHDQXFYfH+U9RiUedubCVlhT+TbkN+fO0jWort7JY/f3dlLUzP/oNaQ==
X-Received: by 2002:adf:db4b:0:b0:2f9:4fe9:74bb with SMTP id f11-20020adfdb4b000000b002f94fe974bbmr3404957wrj.40.1685521594912;
        Wed, 31 May 2023 01:26:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 079/149] python3-pynetlinux: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:27 +0200
Message-Id: <20230531082437.10646-80-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103006

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-pynetlinux_1.1.bb       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
index c6ab07448..b1abac17a 100644
--- a/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pynetlinux_1.1.bb
@@ -13,3 +13,9 @@ SRC_URI += " \
 "
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-fcntl \
+    python3-io \
+"
-- 
2.39.2


