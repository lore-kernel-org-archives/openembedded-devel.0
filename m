Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22139CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 18:35:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.40482.1761590155671229380
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 11:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YQlB9dy1;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47112a73785so32268245e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761590153; x=1762194953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSxQa/bvokjtn8xP5j+lGyDYc7QcO3B4YfJ+BQKNYGs=;
        b=YQlB9dy1hY2UbdDin4epWyFMMKxOTeMkq47Js0QElVMl2LZvBCAxWRqaZImbbPRJP6
         SYqYfnRCkeyt5fSvKQ1xC25i5D2sqOj3oo6NyGBuaN9lvNAF39Xhc81u85AqVSh0UTq1
         RwxmFhp4wP0kl2nzG3y6Gr3mMZTu+L5x5NIDK/q7P0jWxIrTAmgmOZoe6k5f5zxQ4Ghz
         Q2Rij5zKQ7PRsWQ41o1ka7egKo8jNga1CZxOyv50ssOoPuo/jxCCqKiZQ4ABKbPfn1iQ
         UmXgXtQqZODiALvg+AkqtMLLqVzC6NmbDvqcEse+VNqMht59nFPCZYTJXDO2M2PjBK05
         /rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761590153; x=1762194953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSxQa/bvokjtn8xP5j+lGyDYc7QcO3B4YfJ+BQKNYGs=;
        b=PW64VHcudWl/p5c19ygbFb/ajUNZL6F11CnhGEMU++HLKPhNyBE9scW8hFXu6WxjkJ
         F/a6QhjwXsIQTH0CKEuhc43wHAIF3IAY+giGAd9zMxtprpvUxhCs15/cvnSl5LrO6xhA
         4IH36DSFUf+Aowg3Hhaihi+GHapbSoq5DfkgrsH/+vHS5mZCHqJNqK3+knjyI11w3Hy+
         lgD/yKvIw4Wi1FmbTJfnGpCdsb88dsGhv/RpYd3ssOwWnDIpiRirWdQLzR5hREmGdXBD
         IeslBRWvOfsDr2+DdiPVxE1sUxQ5i6Zi0rnvpmX4R59BNT4DnLJ6Y3sQp+Z+KgJouRJo
         9HXg==
X-Gm-Message-State: AOJu0YxidXbQEcB3M21UjYDJy3/nZ7fo3XeEmpDVqEVVhgD229H/hTE2
	dbsKWe6bsoQ0tkQcWa2ApUg95yW1/AGb2T8MvAcF4gA2ddAufgcOomVajaOQjA==
X-Gm-Gg: ASbGncvu4bihf4z62cNhlpG87aCFEydg5zf1eAlgejBGNSw8BhxaPflLoKN0cKIyL9T
	o1ohXE8MSjoupwENW/5vKSjeSVonCJsfzJGSrXb/Ll/CO1Rk7tk39+6oCULvY6JgSZBt7Idppwl
	3YjHGvFxfux7puclqp18nQ63G7m/PT7ohx+mU56aKuCtS7Vih6pEGm4bHCDJmSuiO6jh5fsGPkf
	znDz56JEu1RTWCZ/HYfcqZUvhK8AKqhZQQhmodMIDijaBRTrC/xcNqGwPQUHTgY5g3E6gAJcNRC
	Kcq/PZdnoNWJElS9+NK9bRqwXQTwgNX8+4PAKVmOjGxMzDHAYxPT385sdsXDYrphUvEIFilpdCm
	F7cy7LDXa7KpYmJhdO+G04yT89oQ77BludA3QWnrJV22lj8EIBvDBmP0i+VP0IgZH7F5+To3fI/
	v5YocQfV0zG5+Z1XRhSL7GtYPcnAQBgsnR1GRKurMGrgBf+bykmkXgdV09tcOc5ZCn0MFPiDs3Y
	PwrKQMLbZ+dVXy6STlBmfUO+cRIm1+sn1Cn7g==
X-Google-Smtp-Source: AGHT+IEtv7PsJqA9ouaanMaPHdbk5wIrUr2+hKBilzOylVNgFurQFM4Y4rr2tglaO6PsYtq7L1rN2Q==
X-Received: by 2002:a05:600c:3d98:b0:46e:4a60:ea2c with SMTP id 5b1f17b1804b1-47717e633cbmr5291125e9.37.1761590153348;
        Mon, 27 Oct 2025 11:35:53 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475dd02cd5dsm149250985e9.4.2025.10.27.11.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:35:52 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH 3/3] freerdp3: fix configure warning about image scaling
Date: Mon, 27 Oct 2025 14:35:35 -0400
Message-Id: <20251027183535.2058067-3-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251027183535.2058067-1-marc.ferland@sonatest.com>
References: <20251027183535.2058067-1-marc.ferland@sonatest.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 18:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121054

From: Marc Ferland <marc.ferland@sonatest.com>

Adding WITH_CAIRO=ON to fix this warning:

CMake Warning at libfreerdp/CMakeLists.txt:193 (message):
  -DWITH_SWSCALE=OFF and -DWITH_CAIRO=OFF, compiling without image scaling
  support!

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
index ae87bd0925..7a95f5399e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
@@ -34,6 +34,7 @@ EXTRA_OECMAKE = " \
     -DWITH_ALSA=OFF \
     -DWITH_CLIENT_SDL=OFF \
     -DWITH_SAMPLE=OFF \
+    -DWITH_CAIRO=ON \
  "
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
-- 
2.34.1


