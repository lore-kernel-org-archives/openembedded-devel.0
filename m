Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BC0C3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 22:50:07 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.1331.1746226202042001992
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 May 2025 15:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S4mHEMnV;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf257158fso13483965e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746226200; x=1746831000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5fltk8aoXzOdnebdODeDahTvw/YUZYL1ZM8SEeK/dQ=;
        b=S4mHEMnVar6MlcZ/JtI+iotYfiz8xiyfbV335+naM++B9DBuZKj3SxtKuIAr9zNLZ1
         03v69cZ5cv3fHReVOhwMUmtNBQqQYK04O4YieVFuyHwqkuq0ZTSF91JI8DgML5RZ++wt
         Ft2Pd41tJ9bIJlfcyXxHb7L6Y4BBG8TcVGjm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746226200; x=1746831000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5fltk8aoXzOdnebdODeDahTvw/YUZYL1ZM8SEeK/dQ=;
        b=Lg9Y7hD/rKTVrTraqViMHFc8mvvru28GshPRd/c8h081QAjDWuIo8V/ry/rzYXS1o0
         1dFXsds1y1eZ161KaWsrrgXxZW9A5myRx/9m91WHKtItqq7ecySQUWdDFS7YdPBSdNRS
         iZKxTB1iyEvFkfBvfxjP6YyYtDGH3TILJOdnOWL8RZWgWLDkQT2156LthBmZJJz+Brze
         K0FESk9rvyVi/P8ECf1JFkrUGMynVEvJuNDs7u8BcKtfC8rgt99ClREukmQtI1Lgldoc
         WLxE3KLJzqbZ2AQiwB+e3ullri594PjCw3dlRto7TImicvCt7IlnzU9c/XsNrSUVW1ZX
         HMzg==
X-Gm-Message-State: AOJu0Yw9mOuqHVoEOg6lNLXMeGuc+A/Hd2Y42A/4h461/O3kpoKcEBpm
	MMOL+A6u6chXhWkzXbMdftBPXgTKu1CyvTdsOcxKVIqrPDwt18w/e6z1SAt2qNjr3gWLOZV4l6B
	G
X-Gm-Gg: ASbGnctpxkSiTKyq4jkl3ar/uBFQHAXRqA87HCnVkMjSla9m/2Q7UP9kDGb18HaEtTk
	T9SzATj7EsvdO/4KLbt0gi7BYmWszQjbJPp3YpR8ANAezoTGXDasVHsRvg6b/FdeDmJWNlY3JnE
	baH51GD5GPeOByb5EZ8v3YJi2NAFImWEtJTPixVYouUv536Yb+IuXAZaj/coz1AkvBImmREeJc5
	fnZPSKcwSu9+zq4kpC6ZkTBmFn5D19f0+4MmM7k42bQ6YzsNs40PRqYvQdIwo9+2qOFjsbDQEwa
	wXgvYYOZJHg4aXdElpN+uLQBRPPqGsyPn08cKMqUBrQ3tcbx8SWwwXKbhaHGVHwusBnWeecXRav
	NUWtOwUq7bhrTP96Ni8yKJqNiGkqvnASc4ojF7wfRhwG2TOvO
X-Google-Smtp-Source: AGHT+IFIQqr1Fhxov0nSru/tsdF+shEneZq3WTvJbwSMYcuIdHmOB2hBTNQmAEDf0Cmu84Vxy9NNxw==
X-Received: by 2002:a05:600c:3d1b:b0:43d:934:ea97 with SMTP id 5b1f17b1804b1-441bbf375ddmr35993475e9.27.1746226199936;
        Fri, 02 May 2025 15:49:59 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa008565a33a7c41f265.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8565:a33a:7c41:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc50esm58235205e9.8.2025.05.02.15.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:49:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-python][PATCH 2/3] python3-evdev: add missing uinput header
Date: Sat,  3 May 2025 00:49:44 +0200
Message-Id: <20250502224945.3081334-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502224945.3081334-1-yoann.congal@smile.fr>
References: <20250502224945.3081334-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 May 2025 22:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117281

From: Yoann Congal <yoann.congal@smile.fr>

Without uinput.h header, the evdev module can't be imported because it
lacks the UI_FF* constants.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
index 28c8ea4bc1..dc777cb987 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.9.2.bb
@@ -12,7 +12,7 @@ do_compile:prepend() {
 }
 
 PEP517_BUILD_OPTS = "--config-setting=--build-option='build_ecodes \
-    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h \
+    --evdev-headers ${STAGING_DIR_TARGET}/usr/include/linux/input.h:${STAGING_DIR_TARGET}/usr/include/linux/input-event-codes.h:${STAGING_DIR_TARGET}/usr/include/linux/uinput.h \
     --reproducible'"
 
 RDEPENDS:${PN} += "\

