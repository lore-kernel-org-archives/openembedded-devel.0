Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE45C52D6F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:30:44 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.95401.1722612641661309577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:30:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HbCfopb6;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7bcd0so12412078a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722612640; x=1723217440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzhKCt/kcB5iYpHaSflTo4HJw1XH/YS/zVWjCXoWSJA=;
        b=HbCfopb6IsBfhEGg4T6zkheT9BHwtRXhHnDgPSpkY21BykSZX/UzkNdPRr4UAs/IpN
         1WG7G0UkU939bJ5ddJa17h/9wGjRlSDbKnZ6b76FakrP9bDU7ZjYSw2qK4X23q2mZJ+C
         wS7U4FqkJXdqOSFWx5hLlthc22FJFPikhu9MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722612640; x=1723217440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzhKCt/kcB5iYpHaSflTo4HJw1XH/YS/zVWjCXoWSJA=;
        b=jLkM+PPGVUxRLzERBbHaVMgAcsyeRgE3rW/8fm+4Cuc4CIMLqURoE4PJ089RMgYigu
         LlwYwHf0e/UpKXyQxEpxoxpkpOuCW+L+b8dL1C/kIvo4f5sBhKLVKef3RpZr31zDq1Hz
         0QfEB5vcafnS+n3V7CaCocoKA/cCxiMQ41LFwTScDBqrbDC+GXI4/fxBcTtJrDJF11OW
         CMc6SFcxawdPp5W+icS/z2hZJaBOClg5aLBR5Xp9Ff+UmgrDRNWwK/OarKq5F8jPzxY3
         zZ9f2DqGJTlyCEGkslNc3xpQDPoUOeEAr4h/JQ5s8bbE5ekYl+k/ir3GODmd1xnhfTRW
         fo7Q==
X-Gm-Message-State: AOJu0YyPTpmKoYSgSoY3Iq9J+FS5VeHj5BsPFWHwWaaHCpPyiR3gVniR
	A+Ke90wjRA/T847zdB+sfRpNqo7yecYJApjbXnLnTTinzyuoUAIya+CtPgPQolbc9KXPxSpTAZN
	V
X-Google-Smtp-Source: AGHT+IGQsqtY91UE22qP5VLHrh8YERhtBw1dTwCbSBuJgFayueldFuRngTfloTs9UVo+huoJJThqCQ==
X-Received: by 2002:aa7:cf09:0:b0:5a2:5bd2:ca50 with SMTP id 4fb4d7f45d1cf-5b7f5413badmr2854662a12.25.1722612639585;
        Fri, 02 Aug 2024 08:30:39 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839719fdesm1246863a12.8.2024.08.02.08.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:30:39 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-aiohttp: Upgrade 3.9.5 -> 3.10.0
Date: Fri,  2 Aug 2024 18:30:32 +0300
Message-Id: <20240802153036.2649396-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 15:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111497

Upgrade to version 3.10.0:

- Fixed server response headers for Content-Type and Content-Encoding
  for static compressed files
- Fixed duplicate cookie expiration calls in the CookieJar
  implementation
- Adjusted FileResponse to check file existence and access when
  preparing the response
- Fixed AsyncResolver to match ThreadedResolver behavior
- Fixed ws_connect not respecting receive_timeout` on WS(S)
  connection
- Removed blocking I/O in the event loop for static resources and
  refactored exception handling
- Added a Request.wait_for_disconnection() method, as means of
  allowing request handlers to be notified of premature client
  disconnections
- Added a feature to retry closed connections automatically for
  idempotent methods
- Added server capability to check for static files with Brotli
  compression via a .br extension

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.9.5.bb => python3-aiohttp_3.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.5.bb => python3-aiohttp_3.10.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.10.0.bb
index 57adb1eeb..68494a05d 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d693551"
+SRC_URI[sha256sum] = "e8dd7da2609303e3574c95b0ec9f1fd49647ef29b94701a2862cceae76382e1d"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.39.2


