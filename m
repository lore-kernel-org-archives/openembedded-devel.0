Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22F2CA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 07:13:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.3565.1755760424000515234
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 00:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPODQaAY;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24457fe9704so6021435ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 00:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755760423; x=1756365223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGwjMzkgSpdyo6r++bgFR8PjMeJuAWRb4iSWMXm7UiQ=;
        b=nPODQaAYr7S9ukfSI+N87/VpYJ2xKASht0DCnNJGjmRCfPVsEypGoHQTniI8ZJmT0s
         BueenJaWx5GJCBh+1bX1w55GWBF+PcphYTiSqwlclLrHrfNHcUC6dtMhyw7tRgPvd5Uu
         iKo9ZpmH708CDOK2y2yhnpq9WQ3p0pyGrREEDx+0R7z1/KTzuJhWllwn6XWbCNfPIyvJ
         c4p3NG/vcA9bc/eRp2/II0I9bcgj3LOwHJH39/aGvFmpPFPyVAV6F/6Zw4HEs+CLMIQl
         AjptbE+9gm1Nf5IuUj8GelJ6FUCu6V3y+t31icn7L0nGxPkQ/k92IBvmMDw6bcq0w7ia
         mdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755760423; x=1756365223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGwjMzkgSpdyo6r++bgFR8PjMeJuAWRb4iSWMXm7UiQ=;
        b=XiliuXdA0trchEvKA2ViIgfxpKAzRKHSiYH6KaG+vh2LTmJVQz+SqSk0Z4slY6Qli6
         v5ObmIeN8s6l8XfUPLvx2Oda4/NEvcJGDOZqboO0k2MQs6uhkVqw7XbVuwfVLiFZqsym
         e7qeHEGdPXBX1XxvacvyL4K8mTcjwRc8hQD5aV/585H8c6y4HuKa/CNbUY8UYfw1Y8Kh
         x6Jw5NWdUrIZZ2P8lmuIQXmgol6+AO6Yp32J4ZzFk7Qh1OFoyoELEoUj3dtwQMciqgYG
         AiLCFkhK1lAV0/QllXxzMoab2a6h+uiZKpLxk2WEaiXZhwIlPDSbrs+fd3TGdux8QJto
         +DNQ==
X-Gm-Message-State: AOJu0YwhdeS/i5SeSIXmSJJJkYwLoY3x+OzzYf7WuKJBaWfPH56V7dvZ
	kgqeqLo4vjZ2EBG/l8bEksk7//mGALj3SDQ0UdIorawiADzsYHT/joGsXyqjSH6w
X-Gm-Gg: ASbGnctjYuzZkUypB3H5VBL3Xdp+h3c3DgUwvqLf6h9nDpGEI4NUE4QbQMsO2b38xhf
	5+HUpaBeeL1yVLhbcQZkMtbISC+P85PX5fKbtvpBz28A+6jVLwqH6B2GvC85hGCk3qlCxxllUBs
	pI8pOWlLoiOn4CbJtmL2mknUtUZAJMMaV9xQbQgye2EgenJIEcsvlK2n2p3mp/4bmP/fpOHiLAL
	OxZ9beBWMNQaU3Su7XlwLpd5/yPGRUumO4h0VkVK5DnRiJHaNMd40H7GDbdVFhyG0mXj/rA8Ne7
	YuFpsVfBiZKTy5P54iqlqmf4Ei0mOQ65OIMceZ6t01Ne3j0NkJh4g5m+/KGFurzsOBeVIvXERoE
	aVwzYB4jYKX2rWqnLqrCMAw==
X-Google-Smtp-Source: AGHT+IEoOIn/vTOEFyLpb7+uc0pdhpqpGaPKBD7AOC6jRvKNXHdp18ui6Xm+Cx6xWOSA3pcVXkQ2lA==
X-Received: by 2002:a17:902:e887:b0:234:8eeb:d834 with SMTP id d9443c01a7336-245fec05df4mr20820015ad.16.1755760423001;
        Thu, 21 Aug 2025 00:13:43 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33c5d7sm46464735ad.10.2025.08.21.00.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 00:13:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] re2: Link with libatomic on riscv32
Date: Thu, 21 Aug 2025 00:13:35 -0700
Message-ID: <20250821071335.814796-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821071335.814796-1-raj.khem@gmail.com>
References: <20250821071335.814796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 07:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119048

64-bit builtins for atomics are not provided by compiler

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/re2/re2_2024.03.01.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
index 55a834fa42..5b7b241a25 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
@@ -20,6 +20,9 @@ EXTRA_OECMAKE += " \
 	-DBUILD_SHARED_LIBS=ON \
 	${@bb.utils.contains('PTEST_ENABLED', '1', '-DRE2_BUILD_TESTING=ON', '-DRE2_BUILD_TESTING=OFF', d)} \
 "
+# | riscv32-yoe-linux-ld.lld: error: undefined reference: __atomic_load_8
+# | >>> referenced by libtesting.so (disallowed by --no-allow-shlib-undefined)
+LDFLAGS:append:riscv32 = " -latomic"
 
 do_install_ptest () {
     cp -r ${B}/*_test ${D}${PTEST_PATH}

