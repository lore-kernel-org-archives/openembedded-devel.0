Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482E6C54E76
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 22:32:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.18293.1700519547470094140
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 14:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=MnwjIKFj;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40842752c6eso20738435e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 14:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700519545; x=1701124345; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fwjFoF1x63aRrQbarHjQ4zHL9SOhSuznUZYp/mcFAg=;
        b=MnwjIKFjUVo5BHbmhPv5TpsE3tRigOXne95+57CMosXGNOD2u4RLtNb33RxkZuDeli
         ltQLjYLIvaRVV+osFzc0VEa37FQ6hSu8R8SrqX9uGikmb0TBIngRlQL+Czkvsu/ny4F2
         nCUo58I2yaxGgO+fAWlxvtZcwegBgdhRdA32HBbPI1dAtkxmYHYu2u/TFim9EvgycgIz
         t9zQwddeEJOWSP+Aa76zID6PWFuqAH0sAuA7VoiSzz1xkdreFnggkkNkdh5Eq6w7zedY
         NUTKhzS7b5GPu8cgwTIYV70RWMKMZFHHJaL87z7CldRivQKoqOWIDiSG4NCCLFT5YDh3
         nefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700519545; x=1701124345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8fwjFoF1x63aRrQbarHjQ4zHL9SOhSuznUZYp/mcFAg=;
        b=D9D7lZcv1MlMrabnliRyIZtb/RnzZr7RkF/pe5N+hiC2O0SDX4lxfZPzwUR8lnKjzw
         8yiDtfMBD9ZixlZOC3muIvuUZ4oAfeb98h5d05WYOFQ5eU3dH34yIp+JWPnFRTbLysDj
         GPyNxeqLpUvDLraaDXv2VXh+MP2JRc9sb4hc2gtimJHrnFUopYGT8hnv0+DX8CZ1ElZF
         7Z8PmUW6GRv+wnM7wVl+SicrN0lqg0XHZjutsgJfUm+xrI5rVfjREWzdLM5Goy4qsN5c
         Uf/N7Xig408X0NIDQuGEbNWvr22Kz/wuqUzc8LZPinVtBRGM1qUoi5wXAlA7jjm9AGFB
         Y5mg==
X-Gm-Message-State: AOJu0YwshAqStcyJLKNy9f87xRcffV/VahrkQImlnwY0ytq4QZHvH/C1
	YpHyMb0p58V/FoDJdv9ijAceipdTBbu8Y5rPCp0=
X-Google-Smtp-Source: AGHT+IG38gPk9rsHa1GWNoW1yihpF6HHS+SeV1lo2MNN1FkX4TOYnTzGcv4mGOZXvm2l+Uf+j2frgA==
X-Received: by 2002:a05:6000:18ae:b0:32f:8c32:35b0 with SMTP id b14-20020a05600018ae00b0032f8c3235b0mr6649459wri.10.1700519545048;
        Mon, 20 Nov 2023 14:32:25 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d4745000000b0031ad5fb5a0fsm12470704wrs.58.2023.11.20.14.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 14:32:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][dunfell][PATCH 2/3]  meta-python-image,meta-python-ptest-image: Use python3 packagegroups
Date: Mon, 20 Nov 2023 23:32:17 +0100
Message-Id: <20231120223218.2397154-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120223218.2397154-1-yoann.congal@smile.fr>
References: <20231120223218.2397154-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 22:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106970

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit e43a9898fc536d1d3bc726180d5c2afd15db0b19)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-core/images/meta-python-image.bb       | 3 +--
 meta-python/recipes-core/images/meta-python-ptest-image.bb | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-core/images/meta-python-image.bb b/meta-python/recipes-core/images/meta-python-image.bb
index cc75fe6e4..6353d389b 100644
--- a/meta-python/recipes-core/images/meta-python-image.bb
+++ b/meta-python/recipes-core/images/meta-python-image.bb
@@ -2,5 +2,4 @@ require  meta-python-image-base.bb
 
 SUMMARY = "meta-python build test image"
 
-IMAGE_INSTALL += "packagegroup-meta-python \
-                  packagegroup-meta-python3"
+IMAGE_INSTALL += "packagegroup-meta-python3"
diff --git a/meta-python/recipes-core/images/meta-python-ptest-image.bb b/meta-python/recipes-core/images/meta-python-ptest-image.bb
index 7ee15354a..d497016d4 100644
--- a/meta-python/recipes-core/images/meta-python-ptest-image.bb
+++ b/meta-python/recipes-core/images/meta-python-ptest-image.bb
@@ -2,4 +2,4 @@ require  meta-python-image-base.bb
 
 SUMMARY = "meta-python ptest test image"
 
-IMAGE_INSTALL += "packagegroup-meta-python-ptest"
+IMAGE_INSTALL += "packagegroup-meta-python3-ptest"
-- 
2.30.2


