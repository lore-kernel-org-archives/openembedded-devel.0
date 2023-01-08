Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A33DC53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 05:49:59 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.39490.1673156990803802975
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jan 2023 21:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q7vZi01O;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so9527095pjq.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 21:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypfyp1TeUvBkBikdAocfI96lBdZJ+R5wK9VJMnwhsMU=;
        b=Q7vZi01O/8My3Trzn5DLUgpCPQHsMPWPnacvCMoGuQvsLH0NzgZ1aYkAesMRGQEfVq
         Pl/hvqO0JWKt1znlb89uAsj3HZ2mjKRiFsDb6YcoFzMgSZu4ru4nUewpg+/mMG/aXDcD
         4v8Lw/luUNyALLlThJeFtMQGqtRqDGHi2erlddZYJ7WgZkD+UYwhjZg4kpQaVn+S351A
         tR9Jocp2XHogJeMa9OFs1hAS0LFgtbDuK73pHTGOOuQV4Ow7uU+WHO1z9a6tlz/Bu5Xs
         1sejVKBGtlbO6EiZ/J+9UgRiScwGj7fgaiGKwIKqX2SELQThbzxIu3DCDSCHBBmjt6Fu
         QMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypfyp1TeUvBkBikdAocfI96lBdZJ+R5wK9VJMnwhsMU=;
        b=2yjjGWf8oUYLlicfeJLg8685s2A9TLnHALiswZFxEBTDp3bQ5tHliY33R8tQ/+zyqr
         PqSM3QYOWvdTXv9RMoiaiG09BAZ6pmfCHY8nUot2B0VRMG5zIRELnpCdKWOkDlWuIB3y
         luuZOLhal3B3kOQbRBo956WiF//oE7v0Cfjkz/9pVdxupxqL6KTd2+BIqGBE/HgBxtKz
         zylqbJmdEFSqu3RYh00tclNyQFcAuFGJWkEKJpePNm3EgsA1gpGamuRMRv/tqML+GTL4
         evm2h32zWy52JN81PQz/EoaqeZZlkRGbnucNUJ+ENJKyD/PnR09l0ko1qP3QrkToFfiK
         v3Xw==
X-Gm-Message-State: AFqh2kqJMdpi/8j67WdzZ6gPlHt47oqmwN7jmj5djcn0X7s1RmfQudDC
	5hoVWs6q0iIlL5mVN8R7xwcjtYg9w8GX2w==
X-Google-Smtp-Source: AMrXdXu7s9dnHiDzKw4D/LEYanpADgp+4j1Od5ON4gne+jLYBwskvewNWMIUl2S/gAs5mjcNzEtoEQ==
X-Received: by 2002:a17:902:6b02:b0:191:1c99:57ef with SMTP id o2-20020a1709026b0200b001911c9957efmr67533107plk.67.1673156989984;
        Sat, 07 Jan 2023 21:49:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id b9-20020a170902d50900b0017a032d7ae4sm3615569plg.104.2023.01.07.21.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 21:49:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] hwloc: Update to 2.9.0
Date: Sat,  7 Jan 2023 21:49:47 -0800
Message-Id: <20230108054947.1887553-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 05:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100439

License-Update: Added more copyright holders
- Copyright © 2013-2014 University of Wisconsin-La Crosse. All rights reserved.

- Drop enable/disable numa knob, its gone in new version
- inherit bash-completion

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../hwloc/{hwloc_1.11.13.bb => hwloc_2.9.0.bb}      | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/hwloc/{hwloc_1.11.13.bb => hwloc_2.9.0.bb} (66%)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb b/meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb
similarity index 66%
rename from meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
rename to meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb
index e6fed584f9..51ceb4c262 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.13.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_2.9.0.bb
@@ -5,22 +5,19 @@ DESCRIPTION = "The Portable Hardware Locality (hwloc) software package \
 HOMEPAGE = "https://www.open-mpi.org/software/hwloc/"
 SECTION = "base"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f990b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=79179bb373cd55cbd834463a514fb714"
 
-SRC_URI = "https://www.open-mpi.org/software/${BPN}/v1.11/downloads/${BP}.tar.bz2"
-SRC_URI[md5sum] = "3c792e23c209e9e1bafe9bdbc613d401"
-SRC_URI[sha256sum] = "a4494b7765f517c0990d1c7f09d98cb87755bb6b841e4e2cbfebca1b14bac9c8"
+SRC_URI = "https://www.open-mpi.org/software/${BPN}/v2.9/downloads/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "2070e963596a2421b9af8eca43bdec113ee1107aaf7ccb475d4d3767a8856887"
+UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v2.9/"
 
-UPSTREAM_CHECK_URI = "https://www.open-mpi.org/software/hwloc/v1.11/"
-
-inherit autotools pkgconfig
+inherit autotools bash-completion pkgconfig
 
 DEPENDS += "ncurses udev zlib"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
 
 PACKAGECONFIG ?= "pci libxml2 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
-PACKAGECONFIG[numactl] = "--enable-libnuma,--disable-libnuma,numactl,numactl"
 PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2,libxml2"
 PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 cairo,cairo"
 PACKAGECONFIG[pci] = "--enable-pci,--disable-pci,libpciaccess,libpciaccess"
-- 
2.39.0


