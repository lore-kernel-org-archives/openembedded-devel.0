Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AEFC7EE26
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.122289.1683008400998615192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gMFVcs3C;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b64a32fd2so3903010b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008400; x=1685600400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkJP5Aod5vsY8CmLnMOe2LgLP+TArvHW7eAg0IhC7NA=;
        b=gMFVcs3CWx0TdWhRqWlAee2DSesOlZH0l5lXcZzzGXzDpaRlHzILMsG+z5jDytyuv3
         VNVM/O8QFRq6EDPaBtOeKd7jOwgDueHA9ed/txc8yXiFoaOh2BE8E8nZFrhpHPKWiMib
         zZ/XpTSbywX4116Z09AJsL7cdf/jIDTvbJLC8djtMyyo0anKUxRVL9JUUHejKs71XiT4
         0/iZ7m5RxmPZaJYdpkIGnCmxXLhLxFiVVwEKGgCwk7UnGU1E1ShPUiZlnqMp456w8+kl
         Mwtd4gEFhh0EvVWOjEgs7gbOgtkL5SD1IIlmq5dtTu9kH3J8iWFKaY7ZrXSy0NXC/dc3
         /NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008400; x=1685600400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkJP5Aod5vsY8CmLnMOe2LgLP+TArvHW7eAg0IhC7NA=;
        b=eNqib4R04xocH9EQHHVdGFurwAS/7Is6ua/ihn+5HnfGqbPbxMKDYZsQhVk73m0FuZ
         Cn8nDmpSONcTTooEPXIosb7D5t7EUc0UC35dxcrJSUvEi5Jm2rDLYm87NvpGdHc9tyns
         Ci8sp/pAp6nQIi4oLy9wRZPLtJmX01NBvlwmfcO749uEqc2bXcc6vkY3lx5at2qVPBtQ
         5IBkfAXRRFUOjVdF08PEbgdmBfG/DCl4h5M5b3e0sVHQBxfeh3aWGNSyauVVcS04deeN
         wrgBHx5F9MwDTWJ+rGTgqe2m39WKMnlZ2kT4GCGEI85O3CkRLD/vqr2mnRCLIv597xfe
         JWcA==
X-Gm-Message-State: AC+VfDyc0ov/avso3tAD77jk/ynkTn1W3oJ0tSa1YbfoElGCHzaXUa4E
	ToA7/j42c+/fhcZLmm9P3gHkO3DiYx2QNw==
X-Google-Smtp-Source: ACHHUZ4UeePPottk3oaLkhM3Q4xVPjYFBk1XeAh9zXS5SJw2YTGZC8PnYk2rWvaDNJJ/jnqta5OO6w==
X-Received: by 2002:a05:6a20:729e:b0:f2:ae03:4020 with SMTP id o30-20020a056a20729e00b000f2ae034020mr20547001pzk.54.1683008400039;
        Mon, 01 May 2023 23:20:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:19:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 06/11] xdotool: Upgrade to 3.20211022.1 release
Date: Mon,  1 May 2023 23:19:49 -0700
Message-Id: <20230502061954.3782607-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102252

Switch to github releases
Add missing dep on libxinerama and libxkbcommon

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._1.20100416.2809.bb => xdotool_3.20211022.1.bb} | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-graphics/xdotool/{xdotool_1.20100416.2809.bb => xdotool_3.20211022.1.bb} (51%)

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb b/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
similarity index 51%
rename from meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
rename to meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
index 259c640523..cef82bd348 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
@@ -1,23 +1,19 @@
 SUMMARY = "xdotool - command-line X11 automation tool - utilising X11 XTEST interface"
-HOMEPAGE = "http://www.semicomplete.com/projects/xdotool"
+HOMEPAGE = "https://github.com/jordansissel/xdotool"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2f9cbf7e9401cec8a38666a08851ce6b"
 SECTION = "x11"
-DEPENDS = "virtual/libx11 libxtst"
-
-PR = "r1"
+DEPENDS = "virtual/libx11 libxtst libxinerama libxkbcommon"
 
 inherit features_check pkgconfig perlnative
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://semicomplete.googlecode.com/files/xdotool-${PV}.tar.gz"
-SRC_URI[md5sum] = "1d5be641e512c343abfe5f78b39e6f19"
-SRC_URI[sha256sum] = "42d7271fbc796e53db71bb221f311b9ff3c51d90a71c9487a9bd3101ca39894f"
+SRC_URI = "https://github.com/jordansissel/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI[sha256sum] = "96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd345f9ada"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir}"
 
 do_install() {
-    oe_runmake -e install DESTDIR=${D} PREFIX=${prefix}
+    oe_runmake install DESTDIR=${D} PREFIX=${prefix}
 }
-
-- 
2.40.1


