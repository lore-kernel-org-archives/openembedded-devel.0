Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F34CC79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 18:58:49 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20512.1788980328515780395
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 11:58:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ViEY/pg3;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b81a2d33f7so42849e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 11:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980326; x=1789585126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8pJzlR4BdanBfnI5YjQ5nY+zQEJz6tZjKIwxKT4RIw=;
        b=ViEY/pg3X9aRGZjvPtlmMg/DA7sgJPzi6698EuCTggLRDfM/sFMjXm0/MbmpHfYXwu
         nKWvSXSbrrc7Kh5voukGPuoYjTGKsMs47p6i4KUOifnPdPJtbDioC8KUrVeVWRAjnCB1
         Pi5azHFf+rq/vjmY5GozGR1DozmPuNSPQcSeczaO6/0UnGKSULG5+GeqkEM2W3jVZeFY
         R/DpVIY0FhrSY5l4qs+twK5GM5qjkBA3mxBC+DlutD5VzOYnm1KppkxCqrlOP1SnuJD+
         TvkXdOK23cmcKzTTK/oWS9Q7M4Anm3Cdh+EacX93iyI8V7zGYDJynje6EoYMqIgmVQwH
         WTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980326; x=1789585126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8pJzlR4BdanBfnI5YjQ5nY+zQEJz6tZjKIwxKT4RIw=;
        b=KUcRuj5oQgSC0RzENFXxaUCZhMkmX/IbMGl3fKnGXegQdnImKeXJyTCqQI8vNQVs3m
         OqMQApphkyOHshzQWLMpvNbeNUHqQKmIEMwKACua351FcrFL3JUgkc7YjZ2xEUjmccNL
         yKfYTQUrZdqBcuGVWcHQ8CRwrbufcQbVgsLuW2XOi8ldSqRDBbyCEypk1wxDdrK+grmW
         KBjONvmvWy+JN0KyJ9rZpOuNLVbmr/pPqEYp7PNa31AMhUXRBV8EKAJpckNPXyewstpF
         xHdsqah5dMs2NiO3I/ca+mbpTnv6CVwwGzgXnIwyXMjEXVMOAW9twDSOtvDlwGD2ivfg
         weQg==
X-Gm-Message-State: AFuF++kEI+FwvDAaU3FAbt9SCaikT9dAyU7/AisK/BtbNzV92rJEwLQh
	W0tyvAMaYh+7bgEGrYtEihzGMTTITtATPXQXJl0EmcWXWj9rbMjXeSLRMAbR2A==
X-Gm-Gg: AYBFou2qsyjE90bJbN4qrkiaSCk6JELfCqoqpTInA79zTeLybTmY2NeHT4KpGzqo5Vd
	9j4UxMDYhFgnU5dwIK397mVGOo4mb2uUxrnoPuJtT08pPIMidgLP08o50VJeXuKwGsEld+MFUez
	yxFpd+t3qnDLcgvylF9VPCANv8Dr5LkQ+frNWve1JVfrRUI9iXgSqVMY/3oYRwYtxP0fvVRyAfJ
	bhRKLZsOJtd00aQp8cP3ac4Siy6BqycpKdwTGKuI8ajLfFX2qYlp0mnxHyilhfsLcns0SD0tKEw
	smwzPzwrp359CHdOati8Eyq41Yi7SQwC47NTgj3ARhcDzlbpjUIq06VWQxznO+W5cM9Jw17zenc
	mOOYyPez2v5sD13NrO5gdG3FygNfDtHLLR78MuQKNJ30cMwXyNCw/Sm0ocAJP3ewcP41PNgAhS9
	VnoWcUU0n3/62qZmspUwyGyPD2dhNFKiKdlNQzSt4/1dwv8uAgZXUqHX5aXJUudUipvGKtjFoFo
	w9375+yFxggtoCwogFh3qyQUdxp12uH2WkjZJT/deajQtoh5q5OPz+te/qkTkFMv/EKtrmmTMjd
	KFRPYUeWRXE=
X-Received: by 2002:a05:6512:b8d:b0:5b6:1a7c:59d2 with SMTP id 2adb3069b0e04-5b61a7c5a26mr6097512e87.44.1788980326219;
        Wed, 09 Sep 2026 11:58:46 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b899e5612bsm93111e87.40.2026.09.09.11.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:58:45 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] xwd: append to DEPENDS instead of overwriting it
Date: Wed,  9 Sep 2026 21:58:35 +0300
Message-ID: <20260909185835.127339-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 18:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129895

do_configure fails with:

  configure.ac:35: error: must install xorg-macros 1.8 or later before
  running autoconf/autogen

xorg-app-common.inc sets DEPENDS to "util-macros-native virtual/libx11",
but the recipe overwrites it, so util-macros-native never gets into the
sysroot. Append, like the other xorg-app recipes do.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-graphics/xorg-app/xwd_1.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.10.bb b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.10.bb
index 41d3b12be3..430b4ed698 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.10.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xwd/"
 SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c0cdb783e9a0198237371fdaa26a18bf"
-DEPENDS = "libxmu libxkbfile"
+DEPENDS += "libxmu libxkbfile"
 
 SRC_URI_EXT = "xz"
 SRC_URI[sha256sum] = "4909eacc26c4cd5a9afcd1468aec26e7c646544639031bdad4f71173aa82f3c3"
-- 
2.43.0


