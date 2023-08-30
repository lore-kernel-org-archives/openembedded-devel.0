Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F21FC83F01
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 00:00:02 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.5639.1693439999486435988
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 16:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Xw6KPNhn;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50078e52537so657046e87.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 16:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693439998; x=1694044798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=obApY0uNkh68jBwoJvlXqHFRXZrRvEZ3w09Ufa5Lsls=;
        b=Xw6KPNhnhDbS/n28ljXFTL1ctO/9wEYVaBRhUiWUA41mKLlE0d+sZ9THuMiJNr0WI2
         w4mAPMjRoelHvK2mJxq1WudbRbXUZLTLUXavb32cI6KCkN+W6PFBMyYvRTumpqVKsxbt
         xq3kffyWPpXAxpY362tNsPCkBTAOwf4EVxGOfQc72A5Sbf63jQBbyXXSHW73i8MR2/Ux
         +dFM/a+4SkAUmjcb3rlR2eQzQTTkhqwPko1R2bFB+4tLZvXVCFUvU4ZnhzgsfhiYSFmM
         +IbHsBcAYJjTGI1DVn/WYFiFvxjLmuxQ/3yAq+l+NkLwUoZxY/x0AHKJTMMAR15DCtKx
         IKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693439998; x=1694044798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obApY0uNkh68jBwoJvlXqHFRXZrRvEZ3w09Ufa5Lsls=;
        b=Hw+O1UFUlN0dXsfJUrGDMbx6TI3/OKMXNNmnlMN/CCuId3lH7EdtglSkl/49DondOx
         88nSvEDLD7KcmuOPoZR8oeeb7QujRuODhV5NHWhJmgeLg+n45IXfKLVQtjaAEVs+IVz9
         2JDvdkm5aEUGf1mQfBVN48AYWO4XKQ/8Wfyjbi4ekpn2Me6JR35zroSx77wZopNdRa/W
         SLm7TfyYa6YCpEDLDSkVwXuZgg/WiCGSj3QBlnAvQh/gFromMh0mCmJ7Ju0DsQY5DFtz
         IUZWt1irv3hRms8Aa7D1a+WwIh5igv+pJe1MAAr76xT7720gy8rejptOLOTg7O6nm15E
         6zwQ==
X-Gm-Message-State: AOJu0Yy0W2W6WSn+FZk20qXot7LecQwaIauN9Gnt/xKjZM7HVeRSHBcs
	ozZ9u5CrBNyOMO9EQgQDPpuDVik/+RU=
X-Google-Smtp-Source: AGHT+IF/wUepZDOtM1+Pn5vllfVnAOAf9i19vkxk/NRbJrNTW10+NuleRdOfQ0uai6vzaHVhPOGS6A==
X-Received: by 2002:ac2:5b4d:0:b0:500:8c19:d8c6 with SMTP id i13-20020ac25b4d000000b005008c19d8c6mr2515334lfp.58.1693439997427;
        Wed, 30 Aug 2023 16:59:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jo26-20020a170906f6da00b00982d0563b11sm103181ejb.197.2023.08.30.16.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 16:59:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] sysbench: avoid -L/usr/lib32 and configure-unsafe QA issue
Date: Thu, 31 Aug 2023 01:59:41 +0200
Message-ID: <20230830235941.2965403-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 00:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104679

* when libdir isn't /usr/lib (e.g. /usr/lib32 with multilib), then
  m4/lib-prefix.m4 can add additional_libdir=\"$libdir\":

    dnl Potentially add $additional_libdir to $LDFLAGS.
    dnl But don't add it
    dnl   1. if it's the standard /usr/lib,
    dnl   2. if it's already present in $LDFLAGS,
    dnl   3. if it's /usr/local/lib and we are using GCC on Linux,
    dnl   4. if it doesn't exist as a directory.
    if test "X$additional_libdir" != "X/usr/$acl_libdirstem"; then

  this doesn't happen in regular builds because of condion 1. above

* fixes:
  ERROR: QA Issue: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
  Rerun configure task after fixing this. [configure-unsafe]

* drop libaio from DEPENDS as it's added by PACKAGECONFIG when enabled

* I've also tried to drop brokensep as it was added in:
  https://git.openembedded.org/meta-openembedded/commit/?id=bb31da87599853b2e5d4d4adc641a93edb22cd16
  https://github.com/openembedded/meta-openembedded/pull/632/commits/d2265dbacdb9e7bd7d6e4a9f1a2b3cc1633fb328

  without any explation why brokensep was needed for 1.0.20 (while it wasn't used in 0.4.12 version)

  and it looks like luajit detection fails without broken sep and build with internal luajit then fails with:
  ./lua/internal/sysbench.lua.h:1:17: error: expected '=', ',', ';', 'asm' or '__attribute__' before '/' token
    1 | unsigned char __/__/__/__/git/src/lua/internal/sysbench_lua[] =
      |                 ^

  but I'll leave this to someone actually using sysbench

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
index 945e2c3274..11e33fec55 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
@@ -4,7 +4,7 @@ SECTION = "console/tests"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libtool libaio luajit concurrencykit"
+DEPENDS = "libtool luajit concurrencykit"
 
 inherit autotools-brokensep pkgconfig
 
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64).*-linux*"
 
-EXTRA_OECONF += "--enable-largefile --with-system-luajit --with-system-ck --without-gcc-arch"
+EXTRA_OECONF += "--enable-largefile --with-system-luajit --with-system-ck --without-gcc-arch --with-lib-prefix=no"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[aio] = "--enable-aio,--disable-aio,libaio,"
 PACKAGECONFIG[mysql] = "--with-mysql \
-- 
2.42.0


