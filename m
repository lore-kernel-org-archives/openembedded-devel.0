Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC65CD1BDF7
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 21:35:24 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.2433.1730756122803107202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 13:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JyGOhaDs;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c693b68f5so50375375ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 13:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730756122; x=1731360922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YOG/BLZUvqxfMLQ/MGRz2EKkjjGG33rmPV9KJrMFTHs=;
        b=JyGOhaDsYfX9gTtnTpiOmXQz01QPzWpLxbpvin0ssAQTEYQIpOMeFN9odpv9EPetu/
         iM2rEUWJCfJKH2hOOvEh/LgsmM18KHBoyNq+EadSk0W5cnB1akwgYyV9Ab/oMkRdVkWX
         7vaKQvwGhyD+de8uve5u5/nKjZ0p3+XqH8V4opXu6O51x5ZPVlhYZRXdQ7VVyPwlQakN
         X5iicywHB8T/1jv2hWhMiTvpdjlwrhj4Fwog1umvVAaq5+Voqk5UxMEf2e3J+BHI6yOt
         oCZ/lkJvIUTplQ2tOaLV9Y3J+KXoZ1W29KvnIWt/jaSs+sEhqIxGYOAIiL3bb8eK2COQ
         n6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730756122; x=1731360922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOG/BLZUvqxfMLQ/MGRz2EKkjjGG33rmPV9KJrMFTHs=;
        b=o3L0jxQPhwFzcxop7Qty/WSApXAzdrBH2p5or2cV+UdSzdn9oNKUF5nSnGp2+/m7ow
         tZ4qAr6Rz89p2ZSJfVYftiMAfJlfF7AHR0jpKJgJjRdsVoYJjhk1l+8ThGE2RRCAummy
         bihCHsEivep5OfhWcpGUSrxhA4dcx2pcBexddDdQrqDwKrUu5j5Qy72KDZYRdYx1Ugb7
         rXAOmH2GKT9U6HH63XBBWv8Fbf/Uigk/6SC5iULsT8xH+8pnoSrlaXDwkjD47yo2J592
         qhCx4rF0GHG+Q1tK8g5Ozeg8Rtsh6x3uUqvcx3eBX6pq9QHkR0pbspTwdngRmnlGN3HH
         S2Iw==
X-Gm-Message-State: AOJu0YzI9oNu6s10adSL5eadWURnmmjtndZV0Q6JE//A0I8YiSLyw+Eu
	kMj6D1i0mdLvBOx+Gn2cw9Z/krIw51vwiubrFCjjDW+wmtrkVQny75RLDQ==
X-Google-Smtp-Source: AGHT+IGGD1mHhsyBUZd2FWrcZvdjQ5knOYtm2JpBOEwpm3Rec7/IP343kNpfeF3/pvb08gW/OmrlRg==
X-Received: by 2002:a17:902:db11:b0:20e:986a:6e72 with SMTP id d9443c01a7336-21103b1bb5dmr259284075ad.30.1730756121799;
        Mon, 04 Nov 2024 13:35:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::a151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d3c31sm66354985ad.252.2024.11.04.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:35:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fluentbit: Add IPO option as a packageconfig knob
Date: Mon,  4 Nov 2024 13:35:19 -0800
Message-ID: <20241104213519.3656688-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 21:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113410

LTO seems to fail on clang+arm, therefore disable it for now.

| arm-yoe-linux-musleabi-ld.lld: error: undefined hidden symbol: co_swap_function.llvm.232435740610378447
| >>> referenced by arm.c:76 (lib/monkey/deps/flb_libco/arm.c:76)
| >>>               library/fluent-bit.lto.libfluent-bit.a(flb_input_thread.c.o at 1278594).o:(input_thread)
| >>> referenced by flb_input_thread.c:0 (src/flb_input_thread.c:0)
| >>>               library/fluent-bit.lto.libfluent-bit.a(flb_input_thread.c.o at 1278594).o:(input_thread)
| >>> referenced by arm.c:76 (lib/monkey/deps/flb_libco/arm.c:76)
| >>>               library/fluent-bit.lto.libfluent-bit.a(flb_output.c.o at 1447274).o:(.Lflb_output_task_flush$local)
| >>> referenced 88 more times

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
index a70534e91c..ea67ac5882 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
@@ -39,6 +39,7 @@ PACKAGECONFIG ??= "\
     custom-calyptia \
     http-server \
     inotify \
+    ipo \
     metrics \
     parser \
     proxy-go \
@@ -51,6 +52,8 @@ PACKAGECONFIG ??= "\
     tls \
     utf8-encoder \
 "
+# See https://github.com/fluent/fluent-bit/issues/7248#issuecomment-1631280496
+PACKAGECONFIG:remove:toolchain-clang:arm = "ipo"
 
 PACKAGECONFIG[all] = "-DFLB_ALL=Yes,-DFLB_ALL=No"
 PACKAGECONFIG[arrow] = "-DFLB_ARROW=Yes,-DFLB_ARROW=No"
@@ -69,6 +72,7 @@ PACKAGECONFIG[examples] = "-DFLB_EXAMPLES=Yes,-DFLB_EXAMPLES=No"
 PACKAGECONFIG[http-client-debug] = "-DFLB_HTTP_CLIENT_DEBUG=Yes,-DFLB_HTTP_CLIENT_DEBUG=No"
 PACKAGECONFIG[http-server] = "-DFLB_HTTP_SERVER=Yes,-DFLB_HTTP_SERVER=No"
 PACKAGECONFIG[inotify] = "-DFLB_INOTIFY=Yes,-DFLB_INOTIFY=No"
+PACKAGECONFIG[ipo] = "-DFLB_IPO=Yes,-DFLB_IPO=no"
 PACKAGECONFIG[jemalloc] = "-DFLB_JEMALLOC=Yes,-DFLB_JEMALLOC=No,jemalloc"
 PACKAGECONFIG[luajit] = "-DFLB_LUAJIT=Yes,-DFLB_LUAJIT=No"
 PACKAGECONFIG[metrics] = "-DFLB_METRICS=Yes,-DFLB_METRICS=No"

