Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D4FC27C43
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.3057.1716315042737186306
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DKChAg/T;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ec92e355bfso4550535ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315042; x=1716919842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGjxXjIdO3/i/aW1nDrInHMsu1mRrFsJths3OaRHbbM=;
        b=DKChAg/TaCS5el3GbXiW2xUxpYXTPgKJEWKwm4+7DIO3SoYCbP0uOxV5nogjO6DdJs
         DLI6QA+8sW1OnFsBchyJdaEVeD8QfGbPi1o7u1PSeIsqa/iK197gftusBCGI5TJJeIjS
         fGM9NX1kzlRCtns63PNKtYCgW02toFFxQAtMyTG/A70BQbrQz3u+7HLtRy/BZC7tUgml
         8CuOYyzkoXvVWHKV1HpS+gnUR8tUwZ3R0WWxdCY1UB5sDbKLR5PQ4iSTwbo3Q+UAcXmo
         9/+8eoVcOKNDls1ymGAu+0Smmn602q6uou8R277oxFLFVdCoKPwWdga+cqake+PSW+Hs
         8H/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315042; x=1716919842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGjxXjIdO3/i/aW1nDrInHMsu1mRrFsJths3OaRHbbM=;
        b=NdkmmoKBRTXGAH03GBc7poRO1GjYt9S/k+pGbNc2aLyIC1xECDUozL9kZDMRo8yy7r
         FH5PZiQNqBxm6a6MleKnYSRWcqdeFYAFj3LT5jTdGBDQBv0N8s3PInz1Th5D4XMq8Sug
         ttcSoO/f0aLFInUZJTdJ0q8jVY3PTX0lq17zyRZzUZjaLgLu6eBh5tZmFiYzeHWQk1wt
         WQ0UGTkAE/4OjIZ3BuE7Ug2sGiAIuk0VRCdpevlPxhwn9E9H0rbA0uqkKFdikXR5mE+g
         g/75wkkz5Ka6MtIEEyFxieBQ1ptbhuD9N9MJLlO/82hrp0/Vz5ERPDQZu9abzmdYgxmX
         q0VQ==
X-Gm-Message-State: AOJu0Yw3/2oWGL4BrAXVBaDFx3h11/CWu7WySmrEl0c3WsvGsLThIi+X
	dp1kRyXbDoqjB0rdVmfbQgzjVhCs0fbI+Lkz1kUntFRQ1XdPmwrfvOFuUhaZgjY=
X-Google-Smtp-Source: AGHT+IHrr2puydKIPn1WkXu9VCBdEDwuXArspQuOcZDFVD/ZJsSfwhMw5bTQIX8/tzCNIXaA7c9urw==
X-Received: by 2002:a17:902:7248:b0:1ee:2a58:cb7c with SMTP id d9443c01a7336-1ef43e26586mr316780905ad.35.1716315041924;
        Tue, 21 May 2024 11:10:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 16/22] nbd: Fix build with GCC14 on musl targets
Date: Tue, 21 May 2024 11:10:17 -0700
Message-ID: <20240521181024.426176-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110465

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-nbd-client-Fix-build-on-musl-gcc14.patch | 43 +++++++++++++++++++
 .../recipes-support/nbd/nbd_3.26.1.bb         |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/nbd/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch

diff --git a/meta-networking/recipes-support/nbd/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch b/meta-networking/recipes-support/nbd/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
new file mode 100644
index 0000000000..15b439e255
--- /dev/null
+++ b/meta-networking/recipes-support/nbd/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
@@ -0,0 +1,43 @@
+From 909d20a2ee4afecd5ae4cc5950c8ee599f72972d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2024 17:48:13 -0700
+Subject: [PATCH] nbd-client: Fix build on musl + gcc14
+
+GCC-14 has promoted incompatible-pointer-types warning into error which is
+now flagged especially with when building on musl
+
+Fixes following error
+
+| ../nbd-3.26.1/nbd-client.c: In function 'openunix':
+| ../nbd-3.26.1/nbd-client.c:345:27: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
+|   345 |         if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
+|       |                           ^~~~~~~~
+|       |                           |
+|       |                           struct sockaddr_un *
+| In file included from ../nbd-3.26.1/nbd-client.c:25:
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/nbd/3.26.1/recipe-sysroot/usr/include/sys/socket.h:386:19: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_un *'
+|   386 | int connect (int, const struct sockaddr *, socklen_t);
+|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://lists.debian.org/nbd/2024/05/msg00012.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nbd-client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nbd-client.c b/nbd-client.c
+index 8d1101b..7b25c67 100644
+--- a/nbd-client.c
++++ b/nbd-client.c
+@@ -342,7 +342,7 @@ int openunix(const char *path) {
+ 		return -1;
+ 	};
+ 
+-	if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
++	if (connect(sock, (struct sockaddr*)&un_addr, sizeof(un_addr)) == -1) {
+ 		err_nonfatal("CONNECT failed");
+ 		close(sock);
+ 		return -1;
+-- 
+2.45.1
+
diff --git a/meta-networking/recipes-support/nbd/nbd_3.26.1.bb b/meta-networking/recipes-support/nbd/nbd_3.26.1.bb
index 15d5f8b36b..a67b087f74 100644
--- a/meta-networking/recipes-support/nbd/nbd_3.26.1.bb
+++ b/meta-networking/recipes-support/nbd/nbd_3.26.1.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "autoconf-archive bison-native glib-2.0 libnl zlib bison-native"
 
 SRC_URI = "https://github.com/NetworkBlockDevice/${BPN}/releases/download/${BP}/${BP}.tar.xz \
-           file://f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch"
+           file://f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c.patch \
+           file://0001-nbd-client-Fix-build-on-musl-gcc14.patch \
+           "
 SRC_URI[sha256sum] = "f0cf509fa5b20b1a07f7904eb637e9b47d3e30b6ed6f00075af5d8b701c78fef"
 
 inherit autotools pkgconfig systemd
-- 
2.45.1


