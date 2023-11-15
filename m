Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CDAC2BB3F
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 16:47:17 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.18251.1700066831732300494
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 08:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=iqmRjZnZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.219.46, mailfrom: brgl@bgdev.pl)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-66d76904928so40869066d6.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 08:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700066831; x=1700671631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6BETwHG5m7ntC+MWdybhuzaHDPPHXMkiUnfPP1cC5E4=;
        b=iqmRjZnZALRM9wzIzzORifEG5iCw/eBcA5lVDKk7gKTHvjLHWQLE5/riSP+Eu8EZDR
         76SMw1uTiMaenKnO/YvSJWNjdqa/iBwm/08OymolqwgAdPL5vBm1AH1K7OxGfsNI+0vg
         jlQOgPXqE9ecq4oQBUZ+yEAyRdJLH2yk7HVfpTPKoIym7Ujnd4X8dRJZ1NNWbiK14mDd
         fSW3u2Uj9GqkY7izELr8AC2HADBNC45bUs10iTdrlK1CwFa5o7uo9qTo9A4F4+sh5HJO
         Z3ynj+Jst9atIzPR6ZEa3yS9bvP/K4TeGIsCF4c10X2guxW5kgrgWbYq93NzHqzsvdd4
         2cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700066831; x=1700671631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6BETwHG5m7ntC+MWdybhuzaHDPPHXMkiUnfPP1cC5E4=;
        b=fWXmDl+GhkdSfsoTpr3xYzW1bKmfsF24bBasGbAzKCQu5GqMZK+VlQk+/81NatS96c
         9pnybhy1WQJ1vZvyJFYi06Jihm1W1JVQ/P6yD3LVgrM86y1Ul1OWKAdRZBeYywjRxikr
         vXoA6FpqWb3FQL54pwz2EJfcV/eV9y0H53LSv/82qiLDER4v906OMKLNX6PoI843880A
         KHSm55HWWU8viwRSlmVgsV1CPYDkT9e+KBTf1v7QMtmBfpgqAp3/jghHChq/rTEPPuLT
         O0j2S67806kFGrTMDwjZmN/QmZzIOwWcxbFFaYZnsK/fTdmM8JhlL/g/8a9LFucgx6gS
         qFcg==
X-Gm-Message-State: AOJu0YzfSJvAlhwEFAgOzGJHfYLgdA1GGam6j2yxFtknapEW0J+WTBId
	GkoeJWYyukcZv7ZZWy6eNW5eMQ==
X-Google-Smtp-Source: AGHT+IGDuF0Q6f1La8sr6TTY3oCbKbUjS/136+1ZdAV/Jbhw4ySj5o0mblu2zD61jF2daVa8SA/iTg==
X-Received: by 2002:a05:6214:1306:b0:66f:ba6e:73e8 with SMTP id pn6-20020a056214130600b0066fba6e73e8mr8429382qvb.41.1700066830795;
        Wed, 15 Nov 2023 08:47:10 -0800 (PST)
Received: from brgl-uxlite.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id ml21-20020a056214585500b0063f88855ef2sm652438qvb.101.2023.11.15.08.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:47:10 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Phil Howard <phil@gadgetoid.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH] python3-gpiod: setup target config in ptest compile
Date: Wed, 15 Nov 2023 17:47:04 +0100
Message-Id: <20231115164704.2932248-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 16:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106764

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The python3targetconfig class does not setup the build config for target
in do_ptest_compile_base so we need to do this manually. While at it: use
the provided nativepython3 command instead of using the full path.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
index ef2f01fd4..310694ade 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.1.3.bb
@@ -28,7 +28,8 @@ RDEPENDS:${PN}-ptest += " \
 export LINK_SYSTEM_LIBGPIOD = "1"
 
 do_compile_ptest() {
-    ${STAGING_BINDIR_NATIVE}/python3-native/python3 build_tests.py
+    setup_target_config
+    nativepython3 build_tests.py
 }
 
 do_install_ptest() {
-- 
2.40.1


