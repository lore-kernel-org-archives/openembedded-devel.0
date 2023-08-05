Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387D3C001DB
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 00:39:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3567.1691195959741208059
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Aug 2023 17:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GC4fq01+;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-26837895fbbso1783963a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Aug 2023 17:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691195959; x=1691800759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0SFxH1y9zhNLZvo5Xuu9zzoU2ZPhTmueV2rSK2A/NT0=;
        b=GC4fq01+Y9oup+dXjBDhal+FaDy6hlQhIKUfArsubSLjUR+lzUDr4ASuU5WnI4AFWl
         r8rzJvrNRaronJvqTWfoc/QRi50sdmNwj+wqWUD3PXtOu1Xsq9wjEBUnXOL4mYev1siW
         KKa0QqAeWWLlUTgMyIknUF8LtLKyLot6uT/+lsRMKA1DOtDCCKf6RIyFWIZQ4kmRmfZ0
         +P1yEXa6RZak518PKa/OT0+lOUdXNb220bftnkVFWtt+GBr449Z3B42KzdChWuDwV0DZ
         pR71V2FvUGiM6Yb7mbOIn+4BJ2Q1ELb7FRQHF3kuQ/N4aMUqx2K+nuFw3ObY1Agx+Dv9
         wSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691195959; x=1691800759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SFxH1y9zhNLZvo5Xuu9zzoU2ZPhTmueV2rSK2A/NT0=;
        b=SqiRtINqs/zGj2cIkbXtXMsk3EGKUqxm/HMXidhu3Nhs/CBw7y+iORsmBnR6T357ab
         PrA7k4upNi7syiSr+At1QpKezna2055uW+QEyZ7basEXgfDYW5Bo4s2rkCoX/eYgS7qS
         hbG9pySUCuVEdL+9tkcFuGrNcesKyMxTHOy1N3LfnyYROrskvCtFXUp3jeR6QR73YHq9
         y5KpoXv7izcTJQ9svoDftTwjaNI5p3AFth2qFazOA9lOI3QiclTB4dFRdcIrBxdHFQXk
         6kKsgkfG1q3vQdLR8GexFfPfB/FuBspXHotBonLJsTA21Mif1oRKvXXKg8tV++xSVgRa
         NDvw==
X-Gm-Message-State: AOJu0YzUZ8HuDJ5buDxsCNxoLfq5WfXMyyYfIAdTrnpcIAI8sMMbtFpB
	Y7Ra1IdYzQxs32TZsx/rvSHZlaRwEfHAiQ==
X-Google-Smtp-Source: AGHT+IH8LFU9HmuS5J0uYhJNHkmmx9rEU+EoMyux+h7yGN3QZeiigPkeXHU23dt5knTTZsHQzHng9Q==
X-Received: by 2002:a17:90a:12cc:b0:267:7021:4e3c with SMTP id b12-20020a17090a12cc00b0026770214e3cmr3290575pjg.8.1691195958798;
        Fri, 04 Aug 2023 17:39:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::94c8])
        by smtp.gmail.com with ESMTPSA id x34-20020a17090a6c2500b00264044cca0fsm11070908pjj.1.2023.08.04.17.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 17:39:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pcmciautils: Pass LD=CC via Make cmdline
Date: Fri,  4 Aug 2023 17:39:16 -0700
Message-ID: <20230805003916.4122503-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 00:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104230

This ensures that LD is always consistent in Makefile and it is computed
independent of LD variable setting order in metadata e.g. when using
meta-clang with lld the LD var maybe set to ld.ldd and this will be
wrong here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 42dfcd1e5b..52e9b136c8 100644
--- a/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta-oe/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -28,11 +28,10 @@ export pcmciaconfdir = "${sysconfdir}/pcmcia"
 export udevdir = "`pkg-config --variable=udevdir udev`"
 export udevrulesdir = "`pkg-config --variable=udevdir udev`/rules.d"
 export UDEV = "1"
-LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
 CFLAGS =+ "-DPCMCIAUTILS_VERSION=\\"${PV}\\""
 
-EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
+EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex' 'LD=${CC}'"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
2.41.0


