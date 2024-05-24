Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7497C25B79
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 21:31:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.6451.1716586303961890037
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 14:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eSXnvdOc;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f32864bcc7so24537935ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 14:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716586303; x=1717191103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPuru5WmsuzK/jlwMFnhjChOUkdO2zn40lLfPFgEg28=;
        b=eSXnvdOcb1yQS7lXZ9JfEBl7VWNMEy+xdZfenJwM/6w++YbV7RZYD3qUqUENweAMMF
         1fZehd/BnfLomH41d9isi9vDC7+msA0NS4QQ5kRRw+P0snTGhoNv8MXmH7R571wkUBFd
         OPHYtpkWH9ryfk8m8v9rlJ6uGL9+RKy1jksKD24mirpaDAOGw1uHsqtHFmWgP/zQ8DDN
         sh0Iw1Yrv3DqLVPvaa0fQIMOFbiqN4//qnW1EalOXBeuQSwoTirC9wnyN9gU3gD3KB2f
         TRwnYOFyeAh7MzYMw38QjhZpTaiq+Gu+JmlLjTU1+bI4rmLNM60nXk6m/MH1lHFUgkZ0
         +jcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716586303; x=1717191103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPuru5WmsuzK/jlwMFnhjChOUkdO2zn40lLfPFgEg28=;
        b=HGFdccwkYseCi/dZii2hnTeHtx8A5SGQJhZYwgdn5zxDjPK+Jx3K4NBMKVifiVCtz+
         Lxl+bDYTEhSWdIjoMnofrdkdKY28/P0ezynP4urVYHH8UdfqUnq30jXGQuM0lPe/IQcw
         kHOjbvS+NcAbyAKDb86/F+jag3sdRImxPYIQIB/j9+NyzUr6W7vSAlq4AiKq4cRBMBPu
         l8J31SmgVjvyTkBfJh/DwyRca9XTZqXPJmz8TVGus0ChwYRf1177lS+Gol4GnGp4+3hV
         I/5YhOOx+QDwEMB1EUUUBQmgvv8EW2hBcbzLxHaSw0Y/PBpg3p1foWOjZbNVwOUclqvc
         DMpA==
X-Gm-Message-State: AOJu0YzhQI5Eu9g9fldx7ZK+3dAtlWH70b1jMiBhm238bCf0IbIE+daP
	DwECheQS1pqaRCk5Tx/ZRZiXaw/NW7jEfZUMxbDz1xNFRSIuIpUbzytHwWqNV4Q=
X-Google-Smtp-Source: AGHT+IF6Cu0wDPvXNHo6BUzlMBuBnc/I24cLtuntyf9TI0/u0LGaSYbL/BRHyS/xMsCih8pNXelahw==
X-Received: by 2002:a17:902:fa07:b0:1f3:ea4:7ed6 with SMTP id d9443c01a7336-1f4497e5102mr27920235ad.61.1716586303045;
        Fri, 24 May 2024 14:31:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b2a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c7c3fa2sm18374295ad.104.2024.05.24.14.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 14:31:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] liburing: Use libc on rv64/clang18
Date: Fri, 24 May 2024 14:31:40 -0700
Message-ID: <20240524213140.1856788-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 21:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110525

clang18 generates memset call which demands linking with libc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/liburing/liburing_2.6.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/liburing/liburing_2.6.bb b/meta-oe/recipes-support/liburing/liburing_2.6.bb
index b892ce4ac2..fc3fe1cac1 100644
--- a/meta-oe/recipes-support/liburing/liburing_2.6.bb
+++ b/meta-oe/recipes-support/liburing/liburing_2.6.bb
@@ -18,9 +18,14 @@ DEPENDS:append:libc-musl = " libucontext"
 XCFLAGS = "-pthread"
 XCFLAGS:append:libc-musl = " -lucontext"
 
+USELIBC = ""
+# clang-18 on RV64 emits memset for arch/riscv64/syscall.h provided __do_syscall4 macro
+# this does not happen for gcc or older clang, so link with libc since we need memset API
+# -fno-builtin-memset does not help
+USELIBC:riscv64:toolchain-clang = "--use-libc"
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'LDFLAGS=${LDFLAGS}' 'XCFLAGS=${XCFLAGS}' 'BUILDDIR=${S}'"
 do_configure() {
-    ${S}/configure --prefix=${prefix} --libdir=${libdir} --libdevdir=${libdir} --mandir=${mandir} --datadir=${datadir} --includedir=${includedir}
+    ${S}/configure --prefix=${prefix} --libdir=${libdir} --libdevdir=${libdir} --mandir=${mandir} --datadir=${datadir} --includedir=${includedir} ${USELIBC}
 }
 do_install () {
     oe_runmake install DESTDIR=${D}
-- 
2.45.1


