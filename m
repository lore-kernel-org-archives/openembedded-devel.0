Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDE5C2BA15
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 08:45:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.16073.1718786694995576600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jun 2024 01:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JbMu79+K;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4218314a6c7so53852295e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 01:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718786693; x=1719391493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ybMY2mgsdJEFBMfbxORhiax/EmhvMgLL2Q/TW1hrZs=;
        b=JbMu79+K6I/M04GHrtdnF8+zdRUvq9FcvQFun2drBR+0NHFE+qRI/5OcZZKevUIvwy
         QrYBUcOx5rrvsVBjDvlb1NEAil4M0yLc+0nX8Zz+oVZUXZRRX+jmuG+0molHrMbuPwKP
         6qUajkYUBkmHLB4byu2dkL1ytGKfIngJaouqW27zvQn0S6db0Xf0UKm80jXzFXD3FIoQ
         zfnmtqhY4XNhffkWvcb+ae/JdMmO4MIrjjrfhxaZSEGWZzLvSRGL8BlHmXFg4NJk4Fje
         9DqnT+nUZob/gTJif3i/3jLsjxlChGWTreJ5k9MhC/gIa3OUT6x2ho79ClBEFA4nY3h2
         aF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718786693; x=1719391493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ybMY2mgsdJEFBMfbxORhiax/EmhvMgLL2Q/TW1hrZs=;
        b=DdLgtZYkmeBa5RW7iIPfIdaYKgbWdDdla/xfs1Lj8dIoSPMIHqjHLSRa/w1C6PcbeS
         ALqDCwt7/Jtum2pDaO5rf6Y2JkrOyluGeMxTvCQOcsCN5QqvlZMVw4owWA/SrI5Muffx
         WCaZJ27IcMHz9qfYB1MoymqVS2dKcwVj73xAe6AqPYFzsnvjvIW3GlxB8eDVZ7qNwA9D
         IIk9CtAxaYzz7PV8V1wIvITTO95bhYJZ2DXWMH7ziWkFKPEIemX2LJAyg9JuWWn57Ii1
         4GeAR/cR7M3fKRitJg+n3XAnVgOZKQYynoiWc3XilThZzowVlT93WnCIWMBVifqQHiby
         4KeQ==
X-Gm-Message-State: AOJu0Yy8Qk7AIp90+IglHVIEuNUnLeSPvY+dFuX+eWhGMvpgcePbNrUK
	eLcbbdDCgS/QGdjVEThbCjM0KXT8QCoRfGgWiOLO9C6XYGyeGb5+bw5wrw==
X-Google-Smtp-Source: AGHT+IE4pKf1DqyHst38t1/6Xp4reEseUP4aoX0mm17DEbyvo36Bs8f2dcamEdBYYtZoy5aLH/P7lA==
X-Received: by 2002:a05:600c:22c9:b0:421:a575:99c9 with SMTP id 5b1f17b1804b1-42475180a22mr12205155e9.20.1718786693035;
        Wed, 19 Jun 2024 01:44:53 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4246bddc59bsm82765335e9.5.2024.06.19.01.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:44:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] lvgl: install lv_conf.h in ${includedir}/${BPN}
Date: Wed, 19 Jun 2024 10:44:42 +0200
Message-ID: <20240619084442.68331-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jun 2024 08:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110961

* with multilib lib32-lvgl installs all headers except lv_conf.h into:
  ${includedir}/lvgl only lv_conf.h ends in ${includedir}/lib32-lvgl/
  which is wrong and not included in any includepaths:

  $ cat lib32-lvgl/9.1.0/image/usr/lib32/pkgconfig/lvgl.pc
  prefix="/usr"
  includedir="${prefix}/include/lvgl"
  libdir=${prefix}/lib

  Name: lvgl
  Description: Light and Versatile Graphics Library
  URL: https://lvgl.io/
  Version: 9.1.0
  Cflags: -I${includedir}
  Libs: -L${libdir} -llvgl

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
index 4435c40777..63c810d74d 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.1.0.bb
@@ -24,10 +24,5 @@ S = "${WORKDIR}/git"
 require lv-conf.inc
 
 do_install:append() {
-    install -d "${D}${includedir}/${PN}"
-    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${PN}/lv_conf.h"
+    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${BPN}/lv_conf.h"
 }
-
-FILES:${PN}-dev += "\
-    ${includedir}/${PN}/ \
-    "
-- 
2.45.2


