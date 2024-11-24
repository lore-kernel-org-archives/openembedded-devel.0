Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CF9D1BDC2
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 16:54:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.397.1732467272077723965
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Nov 2024 08:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d2kmdKdo;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21288d3b387so26824775ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732467271; x=1733072071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1A0jiAEWuyiPrALAHxxh87Cp/Wrp2I+NJvsxF57McS8=;
        b=d2kmdKdoafObkRDcBrbEXwCYN/EqAjcajL69avB4xybzjhluUHwHdcCn33RQSYv18I
         oBnCFjZrgGas6NyT+dGMJKnlLhFU35ZZ+uvDOestxFVPMcTIOgML+J0SS60cGRuhY27Q
         7lw89ndnHVHfa/KwkRIrbBxcPGRWxH0YXKynQm0Gs0n8M7tojocbck1W4I4SmaivJjM1
         KzJP5sfjxhBgKBgGH0GQSlSvlx9TrsfC/DgULxlDS75/aW5pZZkpTUwUv7ukJkhqtKbC
         REzEuUnP9QutVgMZPNyzPSsfruCUrBL7nXh2cecJwW6UWPs8fqJTnCBknUOq/dmau/8p
         0EUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732467271; x=1733072071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1A0jiAEWuyiPrALAHxxh87Cp/Wrp2I+NJvsxF57McS8=;
        b=V+wlFUMlo3BFS+FhR9TzDXYu9r3kHHIPI6F/exPIIaPzsoc9NqcZBVOCIWNcF4M8rD
         aKHKSnJK20Qt9v+GoGO1m7b1B3ed30o4KhvZbolthYCP9cbIkWUKM83LPC4Cr+CtV5cb
         Eyug2fk7PiBxgWX+LL8ERg7UfLRKhlPQ1UehwTULebLnzqLm0cbU8sQfsufgRKf2fOAI
         tY0nx6YOC5XwLk6CmYt+SxByfHAfn9JfK/9UVBHdB2MTNZju7QcTV/svC6Ar9nmlnkGK
         +WGc3JeOVlJQXqlaRRx0mXCh/tL8lf/lCLiGtYxeKsXSyHW01V0lFf75ramaClcfzoGV
         grxA==
X-Gm-Message-State: AOJu0YwLH+CPWGo0Jds2AMlic475MCrZojjuwjOEpTUYK5PHB9CgCAM5
	BuyhGmlftvh3IvQzjYO3Q5Ly/uxZt7xJQ9ihtMar/Jo8oRHOtzwseXkkNA==
X-Gm-Gg: ASbGncsM4jsGiflTU9nnJnO1lmnsEawvji8cAtjTOqR8SRTEtTS28EDSRWk+9Qz2JA2
	MslLRJ9XZQPjVgtTK3x905wKb15uVZrp5Op8OGHjdHtXLdF7vhNeR6YKw5UdYGjmz9yhOCNmXvv
	WVX07pZOxQYXkOIjKR3JgyGtgP8vjh6LDW3/CFo8WnUjNQekOjQKA1Yk0FA8To1xg0ydr6MDV3C
	/nAp2K7bXPAypsAIEUk+xdds/E8hneR8K+1p68OkGD4X3BuO+30
X-Google-Smtp-Source: AGHT+IF/T1rkqtawAjZJom7W2Hjnnkl2DTW7CSq1gAEIo7GaWIexgt6DtTaMZl2f0ItCggbY95G0+Q==
X-Received: by 2002:a17:903:2cb:b0:212:7075:976d with SMTP id d9443c01a7336-2129f614e66mr142721025ad.34.1732467271089;
        Sun, 24 Nov 2024 08:54:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::4338])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db87dbesm48752655ad.19.2024.11.24.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 08:54:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] taisei: Use libucontext with musl
Date: Sun, 24 Nov 2024 08:54:28 -0800
Message-ID: <20241124165428.3673816-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Nov 2024 16:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114030

Fixes errors like
| koishi| Checking for function "getcontext" : NO (cached)
| koishi| Checking for function "setcontext" : NO
| koishi| Checking for function "makecontext" : NO (cached)
| koishi| Checking for function "swapcontext" : NO (cached)
| koishi| Message: ** Backend `ucontext_sjlj` is not supported
|
| ../git/subprojects/koishi/src/meson.build:43:4: ERROR: Problem encountered: Unsupported platform

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
index db38bb1547..5d368498dc 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
@@ -17,6 +17,8 @@ DEPENDS = "\
     opusfile \
     zstd \
 "
+DEPENDS:append:libc-musl = " libucontext"
+LDFLAGS:append:libc-musl = " -lucontext"
 
 RDEPENDS_${PN} = "\
     cglm (>= 0.7.8) \
@@ -48,6 +50,4 @@ PACKAGECONFIG[a_null] = "-Da_null=true,-Da_null=false"
 PACKAGECONFIG[developer] = "-Ddeveloper=true,-Ddeveloper=false"
 PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,python3-docutils-native"
 
-
-
 FILES:${PN} += "${datadir}"

