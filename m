Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDA8C83035
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.35166.1751274796574827302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=J8GqrNVJ;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so8907716a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1751274795; x=1751879595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FLWIzInHhcHL1C30fL8IncnZRZ7KmtYWVG2Ayge/0Q=;
        b=J8GqrNVJ6i2ilu5UIZSbtyWyeCrz766LoJvbLBUvJayFepFeWYOA/OTO1OkMwSPTQR
         upIOFTAMR1fOnWVWRww6bezgmeRgVfO9YHbXdYTM2PpWbnRQESit788UG39+QH4Pw+jh
         Y0Hacz+FEPuFSBgjAYsfI0ugdBJiixh4C+ssE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751274795; x=1751879595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FLWIzInHhcHL1C30fL8IncnZRZ7KmtYWVG2Ayge/0Q=;
        b=xGdLitA9KDp58/zfRUzSjJ2wjOYBsKR6QaPo+OyebVv0eqdOUqA1Al64tZJFm/ZM8n
         KtFdotSc9CObWEPXHyTCbOXEGeGbSLHgnZqvXyTZyPwj8SawcW8DsQ64fNvniPSrC5qb
         OSr2FuMVF2UVvE0VMGhXBpewgeHybZaemJyu5JHNYLg9PM5ynGqfIOy/9AxdX1T2N/TI
         iZNnGJpfMI1tYqNyMuBZ6p3LnftPUqmylkWHEp6gs2dIA/8BQEPF7mv7UHdppoieEF74
         eU0Ffv4sW88ueGTDDFukNx3YNVm8AbcsEfIJyxieM0368MfCP38esAUql6msxmpQNt/k
         Q6Lw==
X-Gm-Message-State: AOJu0YydgvGEQsvYY76t1lV+hHLOXz6d/o61zqA90K0F9VC2FgMG3NnG
	jc36EEhgyTywdbpGpibTFYIZ2whnx5HyCuramk50HbshYP6c70U1ObDGndrn+4RuvTgJjVY6G/f
	tX4gM
X-Gm-Gg: ASbGncvPmHf2AddzKwclOUEDl+cIWwuh5VF1V7mJR3aPb57cbNyUwsTOY/ge9zRONuN
	oI7hGsdOgW5CvMb6q75Pjc1DAJN8vIqBqJZLu7g0xannbNTaeJGLZvY8XcJ0raP5Va82KkoqO+Y
	T4GSwAnfCFBVvmoqyBiuvq9OtgxecEGupKKTnMyi+kgEuwEoWiBN1CCvBgTb0CmInHxg60+A6Xh
	dllRs9TX0QYW7tU4ShB3zY4G4JEXOjQerBcjv9v8GEo4K8vZsLO2URzTJlXOieIvHt2OVYFCuDG
	1SMCk8imgYTNhB9MeTC3lIjQc1fhFZT+mUdi7ryjXUX4E0qYkIp9sfoBi5/UdfbSV1W2mp4xAAI
	w
X-Google-Smtp-Source: AGHT+IGfSsmK/B6GA2tYReno2vKpLlbVmXA685F37rds8Ox32BnS/S3gQxmHjpzvjAolhIfipCfpfg==
X-Received: by 2002:a05:6402:520a:b0:600:129:444e with SMTP id 4fb4d7f45d1cf-60c88e83fa5mr9853037a12.4.1751274794598;
        Mon, 30 Jun 2025 02:13:14 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290eaefsm5478268a12.34.2025.06.30.02.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:13:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-icecream: Upgrade 2.1.4 -> 2.1.5
Date: Mon, 30 Jun 2025 12:13:10 +0300
Message-Id: <20250630091310.3785059-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630091310.3785059-1-leon.anavi@konsulko.com>
References: <20250630091310.3785059-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118170

Upgrade to release 2.1.5:

- Changed: Improved printing for variables of type str.
- Fixed issues that affected the output of multiline strings and
  strings containing special characters such as escaped newlines
  and tabs.
- Strings are now printed exactly as they are, faithfully
  representing their actual value.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-icecream_2.1.4.bb => python3-icecream_2.1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icecream_2.1.4.bb => python3-icecream_2.1.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-icecream_2.1.4.bb b/meta-python/recipes-devtools/python/python3-icecream_2.1.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-icecream_2.1.4.bb
rename to meta-python/recipes-devtools/python/python3-icecream_2.1.5.bb
index e417564fa9..7e9383457b 100644
--- a/meta-python/recipes-devtools/python/python3-icecream_2.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-icecream_2.1.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/gruns/icecream"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eca5ce1610d64ed40920efdce85ff8d1"
 
-SRC_URI[sha256sum] = "58755e58397d5350a76f25976dee7b607f5febb3c6e1cddfe6b1951896e91573"
+SRC_URI[sha256sum] = "14d21e3383326a69a8c1a3bcf11f83283459f0d269ece5af83fce2c0d663efec"
 
 inherit pypi setuptools3
 
-- 
2.39.5


