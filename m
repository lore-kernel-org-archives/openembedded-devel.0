Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36845C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.9105.1685521518284839575
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=bDFJHtfV;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.208.171, mailfrom: brgl@bgdev.pl)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2af2ef0d0daso56771551fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521516; x=1688113516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bajn48PL/D98xXLip+PitA4r6NKxHOPxgQU0bVxG3ro=;
        b=bDFJHtfVpRPLnKFjHAX5q5MeZ0lbIddQkvn70ezodw4+uq93+zxfCwiE1qBrs0gWHY
         DMCns6GJj4CDAFey0jb4rwvb7q4sVBGq5Aon496EYMUl+zPaZ8upBkWySshRNoJk9dfn
         llyUKX1x8vylgsiD3e8waUS8WrbUmRn8/vw878uRCXD9Ct8rjDLeC2Rwo8+6rQW5pUit
         uhDVJYc4/3xAqyPWWWFJ1rbZkQf7g0ycCg61O6p5DvfvhydgOh1127swFdZH4yxQudkd
         g+ArDhp2ZMHhwVOs/Kv0A7KrR7YnTTZuP8wi2RPtW1wwoB9CHPYQjW/4nGvIGaAn31dH
         Cfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521516; x=1688113516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bajn48PL/D98xXLip+PitA4r6NKxHOPxgQU0bVxG3ro=;
        b=WBixkMzfj7TqN2EXGGXFEW5iCKqN284g7HDFY1oIt8TDyFpOs4n/zKoNPdBzaqVH+O
         u9HJqsVAzgJk5V/33G0k0lggmr0pvrKI5O8MWgxbPTaIOdMbY/lOyp4fVT9FSYGCjwdx
         CF/LS7FzLMZXBbOdXheeDF+0O6KstLWpa06+3z9rmhlEsodpfyBk+QNey1xiCRV31s9J
         akbKXuz4Yqv+mmE9sn1cHBlcvLp8tb8hETchDcehJ8GBty3IseqlVsYGucKx3tJ/YJ5q
         r6SXk6FTRavXLSH3GnKDIBAUnqsgGrOr0Z+JgfkBihkGoL3EK+YJinSeVBsEgWOw+FvM
         ZDlg==
X-Gm-Message-State: AC+VfDyduppq5qyu3W1uBIJ6k++RHUnHnFh4Wv8Hk4HbR0t1HrDuH5Sl
	CoI7D05kL2IntBS2LNPVn3rx8Q==
X-Google-Smtp-Source: ACHHUZ7umzavByhrAuOsp69/lXD2j5uoah7e/x0SZtsBrnETXHR5wltGNX+NGvYLHN46OJJ751YGjg==
X-Received: by 2002:a2e:a212:0:b0:2aa:40dd:7a55 with SMTP id h18-20020a2ea212000000b002aa40dd7a55mr2147992ljm.8.1685521516475;
        Wed, 31 May 2023 01:25:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 009/149] python3-cson: fix run-time dependencies
Date: Wed, 31 May 2023 10:22:17 +0200
Message-Id: <20230531082437.10646-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102936

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the missing run-time dependency on python3-json. As a result we no
longer need to pull python3 native and can drop other *DEPENDS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-extended/python-cson/python3-cson_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index f9b4b64a5..aba1d8fff 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -14,8 +14,7 @@ SRC_URI = "git://github.com/gt3389b/python-cson.git;branch=master;protocol=https
 
 S = "${WORKDIR}/git"
 
-RDEPENDS:${PN}:class-native = ""
-DEPENDS:append:class-native = " python-native "
+RDEPENDS:${PN} = "python3-json"
 
 inherit setuptools3
 
-- 
2.39.2


