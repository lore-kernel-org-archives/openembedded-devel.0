Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E5ECCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 14:51:54 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.20791.1759848708257787797
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 07:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cX6tiK9C;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso13859375a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 07:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759848706; x=1760453506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O5+Cvt8pdTMK/2xApO66yBlBee8vF2Njpw68JcU1Dyo=;
        b=cX6tiK9CA0lqzmvHdOgwIXm/zvGiGzZLFN/A5lEhjQSqdLVK/vUHgTuKeMK/0ew6eQ
         1gMhPnjfV5IkKJYq7Sxd7lzn/KmE2jWdyn/MfFr8+LqHdZu5I8ctGTJa1XJGFy6PQ9Id
         jepuQPWJc2KrA0jNT5yiF23zSuI6gYSdtO4eqByF+ixEebxxigllomGepN69oMpM/yyQ
         Fzbe7+U0f6/vZsu5Ko1ZxUJuEvAlJfohIwae2511CO+cwvBByXYpJnrS45/p5HL60OS/
         tjRdrIO5tmKF5pAmjivUAH1ieFs7zRBY+8BCNVodIR2c/2NQCIrLEfBUJcnqFBBLRRVx
         wxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759848706; x=1760453506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5+Cvt8pdTMK/2xApO66yBlBee8vF2Njpw68JcU1Dyo=;
        b=htiwSM0PnKxetV0AW/QUqrgmeP+T+4ghZzFe3OrB5OF7aTb5zaQsNEKAFTnuEl8q7X
         /qA0j9drz0YMYrf4g2ZEYH4tHRlbEP2b0UYmuXjbl8DDrp5TzgRpJXN4S0fTx1PBlfnH
         zbAhE09LNXUV8ZCDddq0Pxu5beQ6G7leJA8Md5K1zErp/zhyjS87SrkfDT/03Ov5Hh1D
         qwhMTC9AzdWN0PsQuI0MEcK4lcoMakAmUmhieJvJ7J/7Tyc6FDZYfrELiUZnvLIPZTMq
         w513lQGtCgpISdUUIMpPwRxSr0RUdPV4EEfZGRNY4eP7JBIvQ7m+aJzjr72/NaGPHm+P
         15lQ==
X-Gm-Message-State: AOJu0YzPCOV3lisPYrceCXLZQxAd5b9wh9EvdiEjHlTBKOmkFIaKGFWM
	8+c/V9C3QuUBJS7Uv9HYrdPcn54u7d750NcpKEhHP/zCGqOhO/CBje8snKgNnA==
X-Gm-Gg: ASbGncviuO6+x3v0K4aIBl9MX1VXH48CNNmhP4GpdeJUmU0Cf1QGbFtbe1jp5YDzJ2N
	C8YTx570rtIwCZ6G8TMAHBpMo+ze9j6MHiAv7Kp/NzwgyB7hbgcfRMUjximicMhc+RbU31GByVC
	2VRudNUY0HHU8xq9ktwYWAWb/4AiEhOkLfcDNDvf2+ZJbjz3KqFY1G2HgRbxC1OryuRUA6C7Fg0
	Lj8P+H4ZpJTwWauAGWR+Fw0wOkiexeSAeQ0vyyAy462MTfeukIdUIbo9ww8z3PEWNv4vGYGGAvV
	Ml5U8D6xbLPpxUIBCLkECD5+VlsipM7iRlNxdMrO8pAZz5pnwPVoMk+avAYeR2RmTemu4x0h5Tj
	Js0VqUibyOIo7CyZaCltBWqWMQIbjZ0gdIc3FF9MhguQs
X-Google-Smtp-Source: AGHT+IHpUFYkbWs/pCX1cMp2ZMRqoRijZknuOy1td+USZEJCRZ9q8Y+Ezb5L6IbLn6onHYL8Sy2+Mg==
X-Received: by 2002:a17:906:6a1f:b0:b30:2f6b:448f with SMTP id a640c23a62f3a-b49c1f5c878mr2391833866b.25.1759848706405;
        Tue, 07 Oct 2025 07:51:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b2ffsm1437148566b.47.2025.10.07.07.51.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:51:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] luajit: ignore CVE-2024-2517{6,7,8}
Date: Tue,  7 Oct 2025 16:51:45 +0200
Message-ID: <20251007145145.4100132-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120338

All 3 CVEs are fixed in the currently used revision.

Fixes:
CVE-2024-25176: https://github.com/LuaJIT/LuaJIT/commit/343ce0edaf3906a62022936175b2f5410024cbfc
CVE-2024-25177: https://github.com/LuaJIT/LuaJIT/commit/85b4fed0b0353dd78c8c875c2f562d522a2b310f
CVE-2024-25178: https://github.com/LuaJIT/LuaJIT/commit/defe61a56751a0db5f00ff3ab7b8f45436ba74c8

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index f4a1345ab2..9df5fca0e6 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -95,3 +95,7 @@ COMPATIBLE_HOST:powerpc64 = "null"
 COMPATIBLE_HOST:powerpc64le = "null"
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
+
+CVE_STATUS[CVE-2024-25176] = "fixed-version: The used revision contains the fix already."
+CVE_STATUS[CVE-2024-25177] = "fixed-version: The used revision contains the fix already."
+CVE_STATUS[CVE-2024-25178] = "fixed-version: The used revision contains the fix already."

