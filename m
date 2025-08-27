Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C531CA0FF0
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 02:49:09 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.6266.1756262945679118433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Aug 2025 19:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DBqDEVpc;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2487a60d649so13463065ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 19:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756262945; x=1756867745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOwdnwSyaAv2L7y9Wp9kELoLmG4tIxvo2xvkpNC/kkU=;
        b=DBqDEVpc/2d+1eoQxZX6HcPne9V/svhEXlMaBFwmwrPQK/4SQ+6jQFPV/nIn7PJ8AI
         E/5bCgqA7DftqOwePw9j4kzA+bR4Ypu5Kx9DX2MA+cS6Bx0WfuvZ5wIAOTrU4rptieQA
         kCMF05FWvrtfEput4KUUFO7hqbszoAFI/22E2ZDtogo57BL9VY2GjMWHkhnFXIj65o0X
         2OuN+HRtgLS+I7ggeJUd485TIrVWsJWNsu6YFk98FT/6vot/ZUD3komxdeHky3LZ7prf
         ChMm9rGFdxglPCa3bzJavMZdaNATXQrLV4HNovHASI/YTHEkQxasQ0YXeG2CZMmzD9It
         8J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756262945; x=1756867745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOwdnwSyaAv2L7y9Wp9kELoLmG4tIxvo2xvkpNC/kkU=;
        b=HkCsfjldxC653+MuAGRo7jfZI+pGGaiFIdv1a8GDVa4miSwQ9wyEa0CIDuu6u2yM9m
         dvhvCPi276tFHm8gHQR4TVIzrcQDB6GudfGhHOzSMaYEgRjkJl8Jdup9vJVDQlCBkzfU
         5UNIgE3nYbtaMCMmDzm3kGK3iXaoS9fjGiS+z5oMbo2udwuoWytSHxu1FFycGDvHs24b
         nEzPqi26cuBVFWrr8quQZagjKX6nhGaWgndW/0ZuTcuuvFW+eUOQv8JaazlcHkTKMVFR
         dKYLsb/Z7qzPxra76mVkwckg1zdd/1bGVEVfiPvl0lu71Od1mKYr4wYNTcK62/zt0ja/
         ryng==
X-Gm-Message-State: AOJu0YxTfndVi9xXiXGSG9Z4xzJiwdAmA2e3+Fr9hTcqP0bXq9sXoVuB
	c8sHg4xZB0Oo5cVSjf9lItcWMqM2FYyemSqve3JsijaUeoeEHkO5fv8xTdAaKTFD
X-Gm-Gg: ASbGncvSoKRabL2CmSO7jlaPiQw8ojwl1mJcOz77Jgsb60G2LPJO9EMNSNsVuOajkan
	seq196pZN34mTfnFAK1rWCrHWTrw8uyUulEVhdOgG9h4RDuAYGmbSXgqu3lAqX9bqz1exLJAf11
	wcaumyz6N7p7K2LbUKuoIi4zXVmtIi7xZrjQm245cmwBuO9e32vsrv7IdctZdmS9NL/qKIP+tON
	OeL8nCknpDGL8wN5+ThbryWI/dGYHH+cUsNKdlBdtkBPw/z+WrRHU2byNkAagX9k/TbA08zMD8f
	nfoiJo4zYX7sy3rgioEdx9EqS3XHnelX4kgI4LggzCfaoUKihCVsszz0z7ZerJmCDcqgs+flXoy
	5ZZV/0GfNMd+opu5pOVxBLyKeoOn/BrpvCT6ewiMaeA2LNE/uf9ZCpoTtvtMIW1MocAPgwHulBT
	1/DaGNKJNFb2u5QmkF3uniZC23UdLw5B7RgAu54GnrfMnH9aBx31k=
X-Google-Smtp-Source: AGHT+IHS8IUCzRV1bjXi59f9HnZv8VAzbVchOrL+zoqm7vJuziAA+2yvutXSKzHc+NJtJNaGL5W+aw==
X-Received: by 2002:a17:902:d4c8:b0:246:d00f:291b with SMTP id d9443c01a7336-246d00f2ae0mr124318965ad.33.1756262944650;
        Tue, 26 Aug 2025 19:49:04 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8b4b98sm10357544a12.19.2025.08.26.19.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 19:49:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] hiredis: Build vendored hdr_histogram fpconv
Date: Tue, 26 Aug 2025 19:49:00 -0700
Message-ID: <20250827024900.1318469-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250827024900.1318469-1-raj.khem@gmail.com>
References: <20250827024900.1318469-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 02:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119122

This fixes a build race which is seen with high parallel builds ( -j 80)

Fixes
aarch64-yoe-linux-clang: error: no such file or directory: '../deps/hdr_histogram/libhdrhistogram.a'
aarch64-yoe-linux-clang: error: no such file or directory: '../deps/hdr_histogram/libhdrhistogram.a'
aarch64-yoe-linux-clang: error: no such file or directory: '../deps/fpconv/libfpconv.a'
make[1]: *** [Makefile:431: redis-benchmark] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile:407: redis-server] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.10.bb b/meta-oe/recipes-extended/redis/redis_7.2.10.bb
index ecdb39c6f3..f15e07191d 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.10.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.10.bb
@@ -41,7 +41,7 @@ PACKAGECONFIG[systemd] = "USE_SYSTEMD=yes,USE_SYSTEMD=no,systemd"
 EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS}"
 
 do_compile:prepend() {
-    oe_runmake -C deps hiredis lua linenoise
+    oe_runmake -C deps hdr_histogram fpconv hiredis lua linenoise
 }
 
 do_install() {

