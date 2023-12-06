Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3215C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:03:27 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.30715.1701867798709978824
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KButBKa0;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a1db99cd1b2so67103766b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 05:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701867797; x=1702472597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aWnJW28HR/ZuDpX2BUazG/hNiBuS3ydnlS971/5NTyQ=;
        b=KButBKa0F72O2EipRk2CQsAGHM0NubT7bKq09ib3CHyI8Hz9O9F3F04FsFgx1BPsoc
         W9HAlEhSgGogPfB9KuVqNeLi+x3UsoFWJFGBqLAdRQtkdhtQXDIkQoIojYrtDkqzMItn
         T/jf3ccWKwcVULeIlskwH3QbQrGhxDYWgY+oMarUO38o549utDuxPG26KiucBXGefass
         wLrdH++UVr+McHl+Qk/eAmEpwB6Ttf/NkkELRk71Wdwyid/yVpZ/0W9HG0Tdwt5k+l8y
         B38pmXHv7byeDyO0zWxiujeOhEHdYp0s0e7pHq20cZ7IM/wtYbgkkVg3wx+RAM1cbEps
         cEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701867797; x=1702472597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aWnJW28HR/ZuDpX2BUazG/hNiBuS3ydnlS971/5NTyQ=;
        b=JpnhwzESZ/GA9p2yxwCKLJwsgn2uED3MxA0TU3zEL1mMmcog4fHChyb/8c/P84/o1L
         V19708d3rOAcnHu3rTI6+ohzLWDI47k8h/9h9W+n1q2HU06EQrfsPQQ8BtZUOr0qjFDn
         PIftObZtH+U97w9aCms2o0jwObpAsZdB+bZqy3rh3f947FaISTnH66dGhiic1MtQyLvZ
         PGns6oeYrwT8sB8gyLnO1m2YWy3keRQVH1Pnnb0bmxWQeTJ3WzOfjd9RuGgkz3ZEJIRi
         M75nwQOOkMYFMwWcvLjzW6wy7kWwvdGq/d5VSReI8/0d63hhzQgmfbAcv908R1xWrxYG
         Eqqg==
X-Gm-Message-State: AOJu0YzfcVZlwFrW86yb6wqLVJ2KfzZH5HltSA/Nbk/iP2Kz1M8Mw12N
	GeKzhkrdB1uQjoQJ5gt3Lcd/1CJFb4kBeQ==
X-Google-Smtp-Source: AGHT+IFOtdss/Ku3rPLDQOUMw5KQOQiTgX0nvkHs7i9mIp5akwBnhiIuaJkQ39HSmfd6dQKAVC/52g==
X-Received: by 2002:a17:906:c448:b0:a1a:7568:1d56 with SMTP id ck8-20020a170906c44800b00a1a75681d56mr426073ejb.105.1701867796571;
        Wed, 06 Dec 2023 05:03:16 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id oz36-20020a1709077da400b00a1db7b77675sm796511ejc.90.2023.12.06.05.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:03:16 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] xcursorgen: upgrade 1.0.7 -> 1.0.8
Date: Wed,  6 Dec 2023 16:03:09 +0300
Message-Id: <20231206130309.299460-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 13:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107247

Changelog:

* Resolve -Wsign-conversion warnings from clang
* Handle -Wimplicit-int-conversion warnings from clang
* premultiply_data(): Mark png argument unused
* gitlab CI: stop requiring Signed-off-by in commits
* Build xz tarballs instead of bzip2
* gitlab CI: add a basic build test

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 I accidentally used gz instead of xz, I sent v2 to fix it.

 .../xcursorgen/{xcursorgen_1.0.7.bb => xcursorgen_1.0.8.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xcursorgen/{xcursorgen_1.0.7.bb => xcursorgen_1.0.8.bb} (64%)

diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb
similarity index 64%
rename from meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
rename to meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb
index 936d71b10..3770babe8 100644
--- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb
@@ -3,9 +3,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bd1fb9ee90eead85f7b171807b3ab4f2"
 
 DEPENDS = "libpng libxcursor"
 
-SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "25cc7ca1ce5dcbb61c2b471c55e686b5"
-SRC_URI[sha256sum] = "35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d"
+SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "32b33ce27b4e285e64ff375731806bb7988cc626ff10915c65f1dc4da640cc9b"
 
 inherit features_check autotools pkgconfig
 
-- 
2.25.1


