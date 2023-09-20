Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E81CE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 08:41:24 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.32763.1695199275785244116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 01:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=erY0hpOY;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52c4d3ff424so8204455a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695199274; x=1695804074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvIi+p1RQwTDwDby+UnrPKpPo5FBiQ/Cfdgt/n0IJy8=;
        b=erY0hpOYlAfml5yOB8uDdEbPaRi9IA410dYHkxtbl6NhzwinYSUrpTB7HBfOVaFXKf
         55mMNLtJ+WRvzBnhwfnLMi2NuL2sZPAAdz91aEJv2w4XUtPKUCiPWr3ZEz/nUJJzLfge
         hMnv6mWb+48InPYKy7BWtESl62IcXspDNFOj1+e947k6j1O/wLuO6IyPdbtafP2K4C1G
         Mzgdtx2gBIsgB4P3pu5O2wvw6SFp5sNzBmLsdLIcJt7p8g3m+nZS5aKkTfhuF1T9+rrc
         hCLfnciRrz+2amHzmiBDteK84/aw3SckjlYQ28AqD9hc72UvcRJ0Sa0idtutDsUQ+Z8k
         Lkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695199274; x=1695804074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvIi+p1RQwTDwDby+UnrPKpPo5FBiQ/Cfdgt/n0IJy8=;
        b=Mtoz53UUK6B5qpvDWCjmHmJ6V0hEOR3ftoZ4mCdoxhT/i/Eno6Y2x70FWjR5t/FxLm
         Sk7vhHTdmShM9+xYYkKXUGP1TW2XCFZuuydpLtMtkLHqcU8ypjsN1/5gPJvykeAnmyi+
         e1Uf0fFPT8SNErwRvECZn1dRPDu/b6g3xr9Kf9KAT8GumOR6xgqLklwiuX/KiQ/G7qFy
         YEinDFivqdfv5g61j1OtNTHYs8kT95DJ6vDerYCwowk2eFhIxeSrIMzmpOgmL2/bhRh5
         02gNIWOVaGWHsI8HSRX6wuv8gQda98gikj/RlyTMCoOSJI3a6aXsfuqtYIc82JJEaCuW
         kn6Q==
X-Gm-Message-State: AOJu0YyFR+UpDP0WDKmuGXQ7xWVcFNWzk+hMKdwuBxKLNn72+pBrwFT+
	HjFZbcRH/JiosCKpaEJkB0Vy4ylMpds=
X-Google-Smtp-Source: AGHT+IGL3u0lBsyZHCQ8DKlqvANhHA5C9WeTAgjMnf0V4vMy+m8GDMV4XDmSKLdGTccygBzJmOh3MA==
X-Received: by 2002:aa7:c98e:0:b0:51e:4439:f474 with SMTP id c14-20020aa7c98e000000b0051e4439f474mr1482003edt.35.1695199273952;
        Wed, 20 Sep 2023 01:41:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v7-20020a056402174700b00532d8cccb1csm1571589edx.93.2023.09.20.01.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 01:41:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] freeglut: return x11 to REQUIRED_DISTRO_FEATURES
Date: Wed, 20 Sep 2023 10:41:08 +0200
Message-ID: <20230920084109.2448802-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 08:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105006

* depends on libxi causing:
ERROR: Nothing PROVIDES 'libxi' (but /OE/build/luneos-nanbield/meta-openembedded/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb DEPENDS on or otherwise requires it)
libxi was skipped: missing required distro feature 'x11' (not in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'freeglut', 'libxi']

for distros with opengl but without x11 in DISTRO_FEATURES

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
index b433900bb0..2cd00b0349 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
@@ -8,8 +8,8 @@ SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6
 
 inherit cmake features_check pkgconfig
 
-# depends on virtual/libgl
-REQUIRED_DISTRO_FEATURES = "opengl"
+# depends on virtual/libgl and libxi
+REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)}"
 PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,"
-- 
2.42.0


