Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A91F5A8A9
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 17:39:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25352.1776706747690066715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 10:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rGZ6j1pK;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so43324145e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776706746; x=1777311546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScAOtfAzyVhtwA1/1rN3GVYaCrjjk3LbyaaMAvH8Nv8=;
        b=rGZ6j1pKFGo+npETeeiSa8ClzI5PBAaX0wGiP56rgh0T970WozWHLJJAYrdtRYxiY9
         E2tUmg6sZNBTzJ/e35TNtCUXFAWspjMUa2JzHBA5E7gwurQB/scARuS+nVD0bjjCKxLK
         VAVLCWW7QNt42thzXz1v5dZ/57NVkxb0HpOXGQVM0ietEZvG1SZzDIOCe/FHuE8hgUll
         Rm96L66XF0/mNBPn6K3EKkOrbr6VDEyWjJVOFLzwp72sgGH3sGD9oD3VkOsLQWy4Ys+H
         QV4e5Xg+MB0G2+7zcQMdAAwoYKat2jscK58GUkUbzWwpNnSr/SAtgQSPnSCavo0e4AQM
         rWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706746; x=1777311546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ScAOtfAzyVhtwA1/1rN3GVYaCrjjk3LbyaaMAvH8Nv8=;
        b=tMQeiksgoO+CSUJ4YL7miTcvhciEtfZehOx05qSnxdy6CBvS7ndoo6fcnGadNT/FXx
         gGeUKWnQAPGKBiYNzZHq/d3BJwIv1CU8rEIP2ubohkob2EMvoPVIYPL4kRfFMVY++B2g
         gQwrsbbuSqcUcni7qhGWvkUjAR/bz5AUatujcbdhlKtb6vXNPYDzhInLnamsRV7Rowlx
         FIuP7wkxvbeVcxoR5//IvkIqZ9ooLj5rfXBf1ai5JEEdFtN9ski+KaiTdb83qdYtxDRk
         M+jyRF9EMvHG2sNrHsdAIGsc4cwmNT+B6uMFrq7G9p23nhxe/XDoIFK22d4IuNzGzZi1
         Cnng==
X-Gm-Message-State: AOJu0YxZmqfxLoSD3bWUttGXxtxHXAGT1bO+rgkgIzBrejJJyJJ4PoiN
	URWDGKAe+b85lMUMh/ku3e93xjt+nc++bcllaC3aZEmuW24AyoXHVDPnQhMlvw==
X-Gm-Gg: AeBDietuZwW/iVKGqaOnUwh/q4nQZcz5vXSzsuuzydBReunoFg+sxxnFCeCfJiG4CSu
	2S5bdmF6+ChVQmBt+EUhUb0GX4GlLmYYJITP89OOXrV+F1/r8MfZr6XBbjIOIV8v36X63Qd4X/u
	DmjXt5VL8yY4vh5vQGRgILMdqf7nk4nYoyPZTYgv505eJ6fVFivwLGfHNUZjdAiO2dnh+9QzKO1
	Q4Rxq7ZR2Q4ZjaI+aA78s7ewYOtoXy/zcLsShrsPmgAW0tY5eNDvI4RBgb3TqbARU4U7aDblaUB
	Zixc9ls4VX+pqOUMKxoOjo9+MlOt8EK5skjZT8vrhkaWjlVC85fzCbXJ5eGPxo9JbgdneDtp2v1
	QrfQB1UuPfhOZdx3tG6MnS4jIcK/VPqNdqgDV19nmDAYh+Zt3X4AupCFbTK0Ht+FBWd3CGLBIwX
	Il/yyH8x711TzV5vPgwOQQdHPBb7Xr2JA=
X-Received: by 2002:a05:600c:6297:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-488fb77155dmr200882955e9.17.1776706745936;
        Mon, 20 Apr 2026 10:39:05 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm30198059f8f.35.2026.04.20.10.39.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:39:05 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 3/3] imagemagick: upgrade 7.1.2-18 -> 7.1.2-19
Date: Mon, 20 Apr 2026 19:39:03 +0200
Message-ID: <20260420173903.1007089-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420173903.1007089-1-skandigraun@gmail.com>
References: <20260420173903.1007089-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 17:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126519

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 946243ec055e9bb810b833a79512341b54039901)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-18.bb => imagemagick_7.1.2-19.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-18.bb => imagemagick_7.1.2-19.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
index 5ff22332b5..41573a4640 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-19.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "d4e4b2b35a573fb7d96bc64ff1a417415bbe0f4c"
+SRCREV = "9fbd2b79450e930edb95e8158d412e57a7b27e83"
 
 
 inherit autotools pkgconfig update-alternatives ptest

