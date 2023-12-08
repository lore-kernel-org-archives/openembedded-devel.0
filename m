Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2F6C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 12:56:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.34497.1702040202925604593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 04:56:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fdMMuGx/;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c2d50bfbfso7635885e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 04:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702040200; x=1702645000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqElpNW26sSUCj2JBfiXOIMeFMgqTuCURcOlkNEWvN4=;
        b=fdMMuGx/raUDH+x0UCspnchEeysJsjbjj09uuSowvAZ96xR3bGkfHbyglIkejSZTgi
         Ql+Xalsx/0IwI8BO6T5mt/CFTSm+QhRxjceTR99muSJMtMrhpnbwe0tqVQi1nOKxuR4t
         li4ZVmXL24hvdKEJUgeG8nz06Pu85pMDCWZP1/LCUP/al3E4VHAS1gyJgdOciSkJo0Sm
         Uqu5gstO1ppgiqF5rasICd16vQNEWv/sr46EMe2d//KBJ+agjX81Q2CGrROPc4cif/YG
         SDZa9nyrYJKyLv4RepWzUjGuN38rg2OrkrLcLcKmU5/w99pecofCQ+3Rko7b5VLe03RC
         LqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702040200; x=1702645000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqElpNW26sSUCj2JBfiXOIMeFMgqTuCURcOlkNEWvN4=;
        b=OzVzw553RL4n22CCLNC0rp668Yx2zkgw4F1HXVMHGy0j+3mVIcIHv/fmNEFFqmh5kx
         MSazw3EgT++GX9kujjEGzXS8pU6iVXdXpkIgx7ayKAKuMLb4H6yUirEqPzMEqB6Vapa7
         K4YbEjlB1W2Ht3T011ee676VMA4qhSdeBAn8w4WS15ooGSY3V3IksXdQuTsRZtm86KMW
         4o42FXIqG+HwxqB4BCESRsW/K9iHGoMLzwVZSHtMaK78hDHMLZt4OG17A0Ji4r0wN32G
         XMA9z6ObUpVarFuraLxLWwp8Wq6mGm8PVCvIbO5Ex9A8TwTwWsR59P/5UPEy/OLlD0Rs
         bROg==
X-Gm-Message-State: AOJu0Yyjhg6Hywk0WuSxjD4FDJX2Bj/Cy7GbW5bX1dZ/fQU/HkrHc3B+
	E5WZSC31jmFiC1G8OgcDHeCzTTcsnAKH3A==
X-Google-Smtp-Source: AGHT+IFmHcx36oA6zdXpkP7WqoOPAdQsRLpIEnE/LbkkmyeOe/Gml4jBCXssFQhiH6UXXD3m9JFMfQ==
X-Received: by 2002:a05:600c:3056:b0:40b:5e1f:c37f with SMTP id n22-20020a05600c305600b0040b5e1fc37fmr41629wmh.21.1702040200039;
        Fri, 08 Dec 2023 04:56:40 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id he15-20020a05600c540f00b0040b5517ae31sm5133664wmb.6.2023.12.08.04.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 04:56:39 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv4] xsetroot: upgrade 1.1.2 -> 1.1.3
Date: Fri,  8 Dec 2023 15:56:33 +0300
Message-Id: <20231208125633.336439-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 12:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107308

By default, xsetroot depends on libxmu and xbitmaps

xsetroot dependencies -> https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/configure.ac?ref_type=heads#L41

xbitmaps has no dependency on libxmu but it was added as a dependency in version 1.1.2. When upgrading xbitmaps to version 1.1.3, libxmu removed from the dependencies
Since xsetroot depends on xbitmaps, and libxmu was removed from xbitmaps dependencies, encountered missing libxmu dependencies error.

xbitmaps dependencies -> https://gitlab.freedesktop.org/xorg/data/bitmaps/-/blob/master/configure.ac?ref_type=heads
xbitmaps upgrade 1.1.2 to 1.1.3 -> https://github.com/openembedded/meta-openembedded/commit/5430b16813c87dc5d69a2ae21bc6d5f2b73cd8d5

So, added libxmu as a dependency to xsetroot for fixing build issue.

Changelog:

* gitlab CI: stop requiring Signed-off-by in commits
* Handle -Wsign-compare warnings
* Variable scope reductions as recommended by cppcheck
* Build xz tarballs instead of bzip2
* CI: add a basic build test
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../xorg-app/{xsetroot_1.1.2.bb => xsetroot_1.1.3.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xsetroot_1.1.2.bb => xsetroot_1.1.3.bb} (66%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
similarity index 66%
rename from meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
rename to meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
index a9a8acf05..7e909f90c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
@@ -7,7 +7,7 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ea29dbee22324787c061f039e0529de"
 
-DEPENDS += "xbitmaps libxcursor"
+DEPENDS += "xbitmaps libxcursor libxmu"
 
-SRC_URI[md5sum] = "5fe769c8777a6e873ed1305e4ce2c353"
-SRC_URI[sha256sum] = "10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "6081b45a9eb4426e045d259d1e144b32417fb635e5b96aa90647365ac96638d1"
-- 
2.25.1


