Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C4FCCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 15:59:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.549.1760457585797476341
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 08:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dxam6LIK;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b303f7469so36883565e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760457584; x=1761062384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xv2K5jadtL+TySYng7zfzZXTgFlvJsiFRkNLqgB6nTA=;
        b=Dxam6LIKlo7ImNrI7B4LS57gPAp4rHyyxeBcTJTDd1Itazse3RZCVjUOS6VhVk32X8
         tkrQmf96VqK6QTHdZSu3WGyjLEgLZwxxQYHKmoFCkdYo44zuJSk9/pvS8KUma4Vc4ASM
         CC6idVkmbdgxGpVWYII4/ixrzp5dDd5zY2RF81HPY7sSVsyfyoYzTQHg9FjRaSXSh705
         cyEDaydD0hdiOcEWGpp/HsXRul3ywVYx5u5JmZMQ4ZzLu2PqnKbYymO//M4rwd+n/6k0
         HqC5tA91dGhZqx9nAgZbRBFAh8TfqlUhGkYXzur4CpMiQVPoWZTYa27I4VwAW2/8F+t8
         wjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760457584; x=1761062384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xv2K5jadtL+TySYng7zfzZXTgFlvJsiFRkNLqgB6nTA=;
        b=YQRYZYln3rv/FvpB5es+MUobOm4NqlFyc84y0zkBI6X8bM2Lv9DeY99ruOUNrqS2FQ
         WnOOOhlIHwMQnZNUfe1Oj2uP5/X+A010ZVCiSDti79mEWIs6p1JI4uGX+9hRhrUJ5wr9
         2kfjK+nj+FdeVj+Kuw8DTVIKqKmzCOpPoWLaN+4l0g2rX33ICOlgLApKkSqNg7PBUDva
         nyv2zdnsi5y5dHeax/bw0QNm5AJ/tAw08vrATibzO0+nI+B7COzN/G2VlRUCmtGVL+yQ
         GW0iK1jkNBMUG2FhhlfaXK132lPPHRcUfBcq998vq+VuBm5PxSPMuLYwoUcZXA7ftNpr
         fHdg==
X-Gm-Message-State: AOJu0YzYdbblrM/vEIoJqZgvLR+kfzArMkZQQOakfddUGQcKqDOEU2qd
	SOzZHcnhbj/ta4LDP3XDt70MQqR3OD1Uu7XGVpZSrq3t7alxBZsroNG5+4Hcdw==
X-Gm-Gg: ASbGnct7mQx5ymH4xJ9Iy+W6td7k8MYgsOme1X9EqAmctlslAfQomWSjnpqtc72NE8i
	RuZjjBOzd/Uc4UTOKqSR4BHpIPfZEN2nto8AzyYTsk3kwb6l6qlT2dVBAmP953sg0CYW3L9yvQY
	idigz+Heu6KdAssNPRL6J43rN92seR5FgvKPtI52J3Q7OekhtLBbVAT+r52Hg9Oom/KdO+fJhMI
	6atXogD1LO3unxO/F8+vNvXKxDWc841tQj8EVuLM50dDtE9mDQZN51YgML/Bp3xsV10LFLf8Jm4
	HvEkQ0h1m/Uy2Tw+BSaVzWeQA1MiZVyuoEmwoljZj+ALYXh7QkwSOjvPLTTuxuBAsJjvkMSgtMW
	0CY1JxTBMqidqPeHOIVvQqzPLjQ/pTZshhS1r4CkKhntr+B1AJpZwAQUUwSVRx8pCmRg07hPm/0
	E6ZJbL/6okClOS80HMyHH7Drfl2SxWqmKIQNMLFLn/UyYjfxntsFHhTNSkYCzCRicW8HEGk6RvW
	qs=
X-Google-Smtp-Source: AGHT+IFqWWz9vWUC8Zr33Y+8zEYx9H7Ai7uwJNHt55uTFpwBL/i1BuyAc8E1YrqXj5NvqKd98JGK0A==
X-Received: by 2002:a05:600c:4713:b0:46d:9d28:fb5e with SMTP id 5b1f17b1804b1-46fa9a86d84mr168056845e9.5.1760457583549;
        Tue, 14 Oct 2025 08:59:43 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fab524f92sm152722015e9.7.2025.10.14.08.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:59:42 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [meta-oe][PATCH] upower: upgrade 1.90.6 -> 1.90.10
Date: Tue, 14 Oct 2025 11:59:09 -0400
Message-Id: <20251014155909.575819-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 15:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120618

From: Marc Ferland <marc.ferland@sonatest.com>

Update to latest release.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 .../upower/{upower_1.90.6.bb => upower_1.90.10.bb}            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.90.6.bb => upower_1.90.10.bb} (92%)

diff --git a/meta-oe/recipes-support/upower/upower_1.90.6.bb b/meta-oe/recipes-support/upower/upower_1.90.10.bb
similarity index 92%
rename from meta-oe/recipes-support/upower/upower_1.90.6.bb
rename to meta-oe/recipes-support/upower/upower_1.90.10.bb
index d2f58d5b22..e3ddc88126 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.6.bb
+++ b/meta-oe/recipes-support/upower/upower_1.90.10.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "aed4e42a21307512ad236ad58d7ee4e0196670c8524a168a0edccdc32964ea0c"
+SRC_URI[sha256sum] = "c1baf418b685ffe4150c8a75c04da0cec70323fe094b5b257b287eea564d3f56"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
@@ -50,4 +50,6 @@ do_install:append() {
     # remove integration tests scripts
     rm -rf ${D}${datadir}/installed-tests
     rm -rf ${D}${libexecdir}/upower
+    # remove zsh site-functions
+    rm -rf ${D}${datadir}/zsh
 }
-- 
2.34.1


