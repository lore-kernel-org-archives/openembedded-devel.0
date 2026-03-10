Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631CEF4180B
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 10:16:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36921.1773137751308663212
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 03:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UkIm41ZI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48534b59cf3so19688625e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773137749; x=1773742549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TayCTv42rnOGoX3ATf0bA49Do40jdmeksg7pM57QmLA=;
        b=UkIm41ZI0elxisogTItUTe1NGDQi3oqIqOHE8i9YYOX+ZGTGbWe/PjLxd98Y8Xhkws
         wKoh27qSnQqWn5QTaexOodqdp/tv8WoKgSfBm28d+s+N3yTxWU5U57piGDh4zbp4p3PX
         AWaL5ZhEcc1DqqSgd3ZmzNdnfkVMQqbhXWCcbk45zVS8GBjkyz+nCbh5fULvKk73JWrF
         g8Uplb/FcWeAo5lPg2KU/pqP2q6Ct1GJHfXbfQo0KwG2toF+fkd2CfRSKk38rRdp0AWU
         UM6MePgpSAcdiVFAVzCkQkB+vVKWNijdW4OVbPNZG1/gUw2MtBiiRORm0ym2We2fIH6C
         o9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137749; x=1773742549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TayCTv42rnOGoX3ATf0bA49Do40jdmeksg7pM57QmLA=;
        b=dXj/qvRZvm6O5VZcAZ24yxawK3LKRF1eYfdyD5QUgHtLP/vp6H8/jE1qKF1elRzahp
         lZSfKBuO2D8UQrdDmiOxjO97xYKRlX/r/jpyNa42izF4E+2ASNWrsMcdjp5jcjRSGNx+
         cdfp3hJUiOrQ0HPBk8cpJQe8tDB1YVjD/14s+F8bBDF1hhjIo5B3vZ/H845LR6enb3KJ
         wxg3THu0gQiHEQfxOUx53OrCaJGgENqJ0r/u/9jwokoyMC+e1Or0pZ3lMiKAtEQwDj7q
         dOP0h+q8xAoMPWIAQjV6xnuG1OcBUbIStJtksGKGfWX0g4pAlb0N/t+RUHdeTjzgA2bv
         3MNQ==
X-Gm-Message-State: AOJu0YxqngD5yFl5Wk+UOHcVNwyb7STEzEkfqCqazWli7DOQgtIOi4ol
	CjkAYl+pg76ENe4/7SWEthofNVKt2PxVTsGKdeUkEciw2vpmxksSfxWnPUuIS2qk
X-Gm-Gg: ATEYQzzmaOSZY5Mb3e3a7/HvyHji63RpyHIBlROVPxLLzv+huKUsI5+O6aSgax4ktu+
	Ws2h32gjOPuokGSRS49Smd+0z6giBn332DbCPYmZi2UTwX4pYdgDzFTIjovK9LGc+9SadnbTxyz
	IMGrtFdL8N+dyK0O+WD8+7aYIDj9SUBGZkPECeALHMddW31t2bOglJRn2h1xSWP4pJsLkNfcDsu
	iuBcWg8GZqi3hKAHuLwMX7pZIjSGdtJi98qBwfOTludzXgRaz85DF/Z+VM50L6HMwd58kLPLPYi
	MMf8/OAHU7DJUEbEXzR9GNQROTeO4aH5r+IR7ctsYIcOrt5R6isNxO54SlH3zhGvTXmOOCb9Tvh
	b0LxElJWt6qVkVfygUNuFglAYfJ5204sCORkCCAlG0UsJE0HMNMUz2+eNBrxdylCZxhfG7+bK89
	Be/9VUAHAS2pC6KUS28LP+yqAJ1OZ6/ksP3Q9d
X-Received: by 2002:a05:600c:4446:b0:485:34b3:8589 with SMTP id 5b1f17b1804b1-48534b3882emr150214915e9.31.1773137749319;
        Tue, 10 Mar 2026 03:15:49 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3f267sm32977779f8f.31.2026.03.10.03.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 03:15:48 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [kirkstone][meta-oe][PATCH] freeglut: return x11 to REQUIRED_DISTRO_FEATURES
Date: Tue, 10 Mar 2026 11:15:44 +0100
Message-ID: <20260310101544.2671073-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 10:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125023

From: Martin Jansa <martin.jansa@gmail.com>

* depends on libxi causing:
ERROR: Nothing PROVIDES 'libxi' (but /OE/build/luneos-nanbield/meta-openembedded/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb DEPENDS on or otherwise requires it)
libxi was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'freeglut', 'libxi']

for distros with opengl but without x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
index 2f4f16589d..e8eccd2c9d 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
@@ -9,8 +9,8 @@ SRC_URI[sha256sum] = "d4000e02102acaf259998c870e25214739d1f16f67f99cb35e4f468413
 
 inherit cmake features_check pkgconfig
 
-# depends on virtual/libgl
-REQUIRED_DISTRO_FEATURES = "opengl"
+# depends on virtual/libgl and libxi
+REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,"

