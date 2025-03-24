Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1606C36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 06:33:40 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.32906.1742798015375439107
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Mar 2025 23:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FryUDefM;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso5323477a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Mar 2025 23:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742798014; x=1743402814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h2pJShU0QzIokwt6PG+/ZDFFwqBhO8BG5zIrNpr9Xtk=;
        b=FryUDefMjNqZKpONI5LSq5OihInFQ/PLGWQl8VzJC/rZ5wtbVTGIy5/f4dPllQiG7Q
         BnLtb31Ux0qv6ncmm4hyVOiFb3LkQaw9NN0AfSt8LmaNKBbuV3Kd4kg55GHT2FbToh8t
         ha87sFoOczxXoPAFgbybN1QWVQOBme0x9UbTRs9yeplDveeQo6ODyiz3qNa0RFfqIkK/
         abezi9Lka2xmJjI0l6p5sEpNA0hHAFbj1eeokeSoCCtxxWb/LPsJjaUJRek38N8jRb+C
         hJg3jcXr9W8FTzpeiMv4/D2R8O4j9M3g/SSZGWjO0cmfSmsIjToUFT0bmWTzBGcsChHK
         uGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742798014; x=1743402814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2pJShU0QzIokwt6PG+/ZDFFwqBhO8BG5zIrNpr9Xtk=;
        b=ZAoRccjKqMNidZwIBwhY9uSwPWYKM8bm4yKJazN1iTuOVhuvkFBgInzUjK+2a6ITEE
         0yzpT06RSLbAqRnhAsle8l/LNbqtSwfpMxwDe203xEN012zNuPIRbbc5hVZgBHRY0Q5Y
         Rqyx95JaKHWK7r/MK32u8Aq/T2KMJ2Q9z3bq2fH/KNei0I0CaoDE8qwAodiQwEgySNf0
         uO0qFMwVNsHG91miWL/hvbqn3zv2ngYZVInUn2yVqpEH1HE7s8xR6rGmwNBhqAdQDUFn
         /zG4JRfVoRL9MSWO5dB0pOuPVq9tHYbqj/WHpRCpeldzLGuz5qlkxCu6tD/i8L9ykhk1
         B06A==
X-Gm-Message-State: AOJu0YwGnjrRPJ8SXhJhgSaJ76FJJqo+/HOVh6ZGfcOHlmK6LPblH6nO
	S/CaufV+4kNAyBninxtIopdA+UkYddKWxuXmDw8Y9GhfgWm7wxyHp3kUw9os
X-Gm-Gg: ASbGncuySXoTdm+fSuM4sIOvQp6X/q6UAx+oN4tTJpyVifX8kHa9MqwFtabK55H1Eg7
	jDdqjCwal6RsbkXimyUA5oHFhUg96jhNNoyFi4nEnlrUQBPZPZNIdgCPu1YBzXsY4hh8S/Nym5E
	km1Ka2lKac8wzFsBG0qm/kIdr/HwNxPl8+PJ6OPhiihqcd0J8dIER8ouYEtnPhX62D5QW8+65Og
	I4J+pn9hDCK6s0buGWutQQo1T7E1xFLr72nFlR+zmwA0FIFDeLzd1PqFyEc4yxAf0W9/APEJz8i
	upfjUZmNy4OfSE7x7KXWqzvOIX37bzX1Qqga
X-Google-Smtp-Source: AGHT+IERmVHNrd6BBizlb02ypl0VJXLepzSSkY90bzXtxezyky+QFVRZALebj6B4DcUP1jG4tRtlBg==
X-Received: by 2002:a17:90a:e7c4:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-3030ff06d11mr17741218a91.31.1742798014055;
        Sun, 23 Mar 2025 23:33:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58c78esm11246975a91.19.2025.03.23.23.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 23:33:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] protobuf: Add -latomic to CXXFLAGS
Date: Sun, 23 Mar 2025 23:33:31 -0700
Message-ID: <20250324063331.3015703-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 06:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116205

Adding to LDFLAGS works with LLD linker but not with BFD ld since it
gets added before the abseil-cpp libraries on linker cmdline which does
not link it and still finds the atomic function like `__atomic_store_8'
as missing

Use mipsarcho32 for override which covers both mips and mipsel

Thanks for suggestions - RAED [1]

[1] https://github.com/openembedded/meta-openembedded/pull/952

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
index 9d49e0d3e4..30b805e6b1 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
@@ -22,8 +22,7 @@ SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=ht
            file://0001-fix-protobuf-native-build-failure-with-gcc-10.patch \
            file://0001-utf8_range-add-version-marker-to-library-19009.patch \
            "
-SRC_URI:append:mips:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
-SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
+SRC_URI:append:mipsarcho32:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.(25\.(\d+)))"
 
@@ -51,7 +50,8 @@ EXTRA_OECMAKE += "\
 TEST_SRC_DIR = "examples"
 LANG_SUPPORT = "cpp ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
 
-LDFLAGS:append:riscv32 = " -latomic"
+CXXFLAGS:append:mipsarcho32 = " -latomic"
+CXXFLAGS:append:riscv32 = " -latomic"
 
 do_compile_ptest() {
 	mkdir -p "${B}/${TEST_SRC_DIR}"

