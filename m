Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0984C43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 13:14:12 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.112430.1783170849234533044
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2026 06:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PTnOhE0J;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-517dc520840so11195391cf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783170848; x=1783775648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i8VLfVvlYx2fkJNYbzowsXt5iPExiBClMBVEfBSr41E=;
        b=PTnOhE0JZojBODjKeKmy/s+5MNR4fisXmY4uKtfWMv8p6MIeNPWux1hyc6t6K5aQ2A
         drPBaZmkUVz9WDp9ncd+t4L7fQE6CVPG4hoPp07QoBZ/sG4gbIqxSzje5d+Qu+4iGg5X
         tlAUoECEf7O08EtENj4xdS1pFjJ7FZvtuTnqqfkMD8p/BN/NSaMM/mDr0VqB7GSkD1rt
         3Zg9yaZ4Gd7xHKJr/JhK3r0Dx+LOQXAqJLrBPAKSSYEhW3j1OzsV8vxExcyTZfksS5Rc
         L/p6KcQmYsPKZQtzmIeHK5yclzI6F5u4jo8Qeox8xF9IdT0lMJKNGaC6DTM8z0ByYlG+
         Nc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783170848; x=1783775648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i8VLfVvlYx2fkJNYbzowsXt5iPExiBClMBVEfBSr41E=;
        b=jzNgaPoztgGt8IqvWZ7wcHYt2Qu9p9JUN2WnAXxVM69/x7iXM4LEdrOrx94xtEkWR6
         O3//Mu8r7QOq8WeY1+pEjzZ1SZ8t9hj/Bqwo/yqcvGVfWv632aDXyUuHIwQWsoiRpgxs
         O8uLKAdZ1Mhn2wbScn1dPbLftQJbpUaNf/gZWEmsek5+j8AJPnYAV44Ya7uMgtHG6IiC
         lrWyHCNeOnwgzjhQ5bQXQV6jh1bb2oMtXuKlZuTO8Rz3bMjvxQTASZtdIkoBI115aBIQ
         QxnProRR/TKX7BWMe/5JMfAqtwH7sEzMBdlvM/VOl1LbobjEg9eMjGC2kFQudLLUOWPW
         04lQ==
X-Gm-Message-State: AOJu0YxexXcyensC7R/OLnF/QrRa+g/9rLrnrvP5bKZVFeC7OPgjSBhd
	zwPThdqN0bsTepmZmSA8Nlpv59q3GgVTCvI7DsDSXD79eLjskUr1V0FFOiavRg==
X-Gm-Gg: AfdE7cn0y0TbpKQpPUSJzQC7B0XNebmCZv5fhB8SU0aVaej+rZL/BbPdsRClKT7G/6s
	/eei5BKLRMqiM/gnhP8pkU6nrSdFMKUKvfAH5DEIc6z/dYbQn0AOWOWLPEuGOfJikYtjPLZBsvN
	IvzENsHGbYgQOizvkdy8C1AuWYrpLBRzOyijWqWSHxpxjgq1SUItAD/TntVZ8HnwL+GXejCCAZZ
	2Yi6/n7JZpjI/Sj9+w8lchQwD1q2eR4sa/3SMm1aXuPbM9mlCS9vh+tAFD7EU/AvwBZ/ddgbFWC
	szgRB0Sa34Y0Ts4LvrYnUSbNJ7N0t/HFyqKoDLlUeLOwnCNvZzWi1nPAmVHYHGsU6ajtKsDWSEz
	HiwNBAensTXHhh5eTxUeKOZnpJPjEpvucFB35uGvNaSKErijbHR1oAYCo5znrOmS1LDvFIcBmlB
	hkpceADQUP4VAUvlI13dm+XBe7RTYWMcg0AtA8wGuuls+sZgNN0iLPDyOusg0oK+aAsA==
X-Received: by 2002:ac8:5fd4:0:b0:51c:1027:34d4 with SMTP id d75a77b69052e-51c4c25cfa7mr51478211cf.11.1783170847756;
        Sat, 04 Jul 2026 06:14:07 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41da510dsm39840241cf.22.2026.07.04.06.14.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 06:14:07 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] gd: add missing library deps to PACKAGECONFIG entries
Date: Sat,  4 Jul 2026 09:13:54 -0400
Message-ID: <20260704131354.463612-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260704131354.463612-1-twoerner@gmail.com>
References: <20260704131354.463612-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 13:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128023

The PACKAGECONFIG entries introduced by the conversion were all missing
their build-dependency in the third field (the only exception was raqm,
which already had libraqm there).  As a result the hard-coded DEPENDS
line was compensating by always pulling in every library regardless of
which features were actually selected.

Evidence from the configure logs confirms which libraries were found or
missed across the three configurations:

  pre-conversion:
    checking for zlib... yes
    checking for libpng... yes
    checking for freetype2 >= 9.8.3... yes
    checking for libjpeg... yes
    checking for libtiff-4... yes

  post-conversion, unfixed (zlib, png, and tiff checks absent entirely):
    checking for freetype2 >= 9.8.3... yes
    checking for libjpeg... yes

  post-conversion, fixed:
    checking for zlib... yes
    checking for libpng... yes
    checking for freetype2 >= 9.8.3... yes
    checking for libjpeg... yes
    checking for libtiff-4... yes

Add the correct Yocto package name to the third field of every entry:
  avif       -> libavif
  fontconfig -> fontconfig
  freetype   -> freetype
  heif       -> libheif
  jpeg       -> jpeg
  liq        -> libimagequant
  png        -> libpng
  tiff       -> tiff
  webp       -> libwebp
  x          -> virtual/libx11
  xpm        -> libxpm
  zlib       -> zlib

With the dependencies now managed by PACKAGECONFIG, the unconditional
DEPENDS assignment is redundant and can be removed.

Fixes: be9f029b6c10 ("gd: Support PACKAGECONFIG")
AI-Generated: codex/claude-sonnet 4.6 (high)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/gd/gd_2.3.3.bb | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-support/gd/gd_2.3.3.bb
index d3d13ee1e737..f7bd12bb9bc2 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -11,8 +11,6 @@ SECTION = "libs"
 LICENSE = "GD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ace63adfdac78400fc30fa22ee9c1bb1"
 
-DEPENDS = "freetype libpng jpeg zlib tiff"
-
 SRC_URI = "git://github.com/libgd/libgd.git;nobranch=1;protocol=https \
            file://0001-Fix-deprecared-function-prototypes.patch \
            file://Fix-ftype-missing-const.patch \
@@ -25,19 +23,19 @@ inherit autotools binconfig gettext pkgconfig
 
 PACKAGECONFIG ?= "jpeg png zlib tiff freetype"
 
-PACKAGECONFIG[avif] = "--with-avif,--without-avif"
-PACKAGECONFIG[fontconfig] = "--with-fontconfig,--without-fontconfig"
-PACKAGECONFIG[freetype] = "--with-freetype,--without-freetype"
-PACKAGECONFIG[heif] = "--with-heif,--without-heif"
-PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg"
-PACKAGECONFIG[liq] = "--with-liq,--without-liq"
-PACKAGECONFIG[png] = "--with-png,--without-png"
+PACKAGECONFIG[avif] = "--with-avif,--without-avif,libavif"
+PACKAGECONFIG[fontconfig] = "--with-fontconfig,--without-fontconfig,fontconfig"
+PACKAGECONFIG[freetype] = "--with-freetype,--without-freetype,freetype"
+PACKAGECONFIG[heif] = "--with-heif,--without-heif,libheif"
+PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
+PACKAGECONFIG[liq] = "--with-liq,--without-liq,libimagequant"
+PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
 PACKAGECONFIG[raqm] = "--with-raqm,--without-raqm,libraqm"
-PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff"
-PACKAGECONFIG[webp] = "--with-webp,--without-webp"
-PACKAGECONFIG[x] = "--with-x,--without-x"
-PACKAGECONFIG[xpm] = "--with-xpm,--without-xpm"
-PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib"
+PACKAGECONFIG[tiff] = "--with-tiff,--without-tiff,tiff"
+PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
+PACKAGECONFIG[x] = "--with-x,--without-x,virtual/libx11"
+PACKAGECONFIG[xpm] = "--with-xpm,--without-xpm,libxpm"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 
 EXTRA_OECONF += "--disable-rpath"
 
-- 
2.50.0.173.g8b6f19ccfc3a


