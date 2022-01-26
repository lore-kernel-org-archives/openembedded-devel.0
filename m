Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01E0C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 07:20:50 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.9616.1643181649879132522
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 23:20:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lp+lzCGn;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so5376531pjp.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 23:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2eS6mMymXyoBSZwMEd3AwhgtqGxGN8yySQi4uBKULjI=;
        b=lp+lzCGnkttljj8zPb4un1y7s0JNKAnP+j01pyj0aoI+D9/jwaWWArJRC9zhE34ygz
         TyFpU6W2unEds5Gdyp1WIHyZoS9Ljcnq+7vf9tk6zPGV/XD1/HRNpNHlUhBuLtA28cw1
         WPzgDBi8jEEyVctaxUZXunKzukXNcqNqCXtk0cOreyJi02LpIDv/XhvdW/+BinE4YVnL
         LDxDnn+WP/y9QDsAkewbGpNR6K76yuyhoauADn1/JwuH9wG/nNp00WbXYY5ypgARpACa
         V2W11tJ94r5m6m/GvEA4+sYAG7cOarRbTMzPdmUYpjaz5DOOVnZeS2kK0zFZ757PXUIJ
         7jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2eS6mMymXyoBSZwMEd3AwhgtqGxGN8yySQi4uBKULjI=;
        b=KeDoq2Tgq/STYvlvfoBm6tveeKR39I8Zs6W2yHeUAq43FxIiOlW7IONGFm0U1m8G+D
         WGnzzEyUcfhqeF81XlP2JB3XX9tlVuBRTwNrtyrnaHA2Jm7SvQbAzAbduCWQf7vGfs8s
         mdxR0nmFE8spbtMnvxKxnpzXJIP69ZyngRrWGJpWUFb98mUlHM8/clqt2HoH6Bb7TLgh
         he549FBJiEbcCW2gcOXAPKmG7tI3szhBb7XYM1buiG9XxSG8LetbEQ2Y+dU0GRB+TUSN
         ArvBxKyqY8vcLyI39kYyxG3eSiWU+TYQ3Ammvay4EoT7ODMhevE7Wa9rNOd4bwJOwbMn
         oRyg==
X-Gm-Message-State: AOAM533BHOzDvO5tZztqE+XktsjjnvET0L0kcQxheyQRuHN7mKmtsU+0
	pwavZnDTzBeBinsDgSn8s24f1dAizU/x6Q==
X-Google-Smtp-Source: 
 ABdhPJy7aFUVtg+ZQT/v450L2rH3bZp5TqQDEiRC0xGG0+q32FovpQ2XIHq9tsgSheGivRlXDGWzhg==
X-Received: by 2002:a17:902:db10:b0:14b:588d:e0ff with SMTP id
 m16-20020a170902db1000b0014b588de0ffmr10962174plx.92.1643181649150;
        Tue, 25 Jan 2022 23:20:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 u18sm1101588pfi.185.2022.01.25.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 23:20:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH v3] python3-pyruvate: Fix build with mips
Date: Tue, 25 Jan 2022 23:20:46 -0800
Message-Id: <20220126072046.3886837-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 07:20:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95102

mips/glibc systems have interesting problem where dev_t is not defined
properly for O32 ABI [1], therefore address it for libsystemd crate, it
works fine for musl

Fixes
error[E0308]: mismatched types
   --> /usr/src/debug/python3-pyruvate/1.1.2-r0/cargo_home/bitbake/libsystemd-0.4.1/src/logging.rs:296:25
    |
296 |                 device: stat.st_dev,
    |                         ^^^^^^^^^^^ expected `u64`, found `u32`

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=17786

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <tim.orling@konsulko.com>
---
v2: Fix commit msg and apply the patch to musl too as it does not hurt
v3: Use upstream submitted patch

 ...-targets-for-stat.st_dev-definitions.patch | 32 +++++++++++++++++++
 .../python/python3-pyruvate_1.1.2.bb          |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
new file mode 100644
index 0000000000..0de6d1fd64
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
@@ -0,0 +1,32 @@
+From 0662f3b3ff569325a74b907de1d88d51bb24cfc8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jan 2022 22:28:11 -0800
+Subject: [PATCH] check for mips targets for stat.st_dev definitions
+
+See
+https://sourceware.org/bugzilla/show_bug.cgi?id=17786
+
+Upstream-Status: Submitted [https://github.com/lucab/libsystemd-rs/pull/103]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/logging.rs | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/logging.rs b/src/logging.rs
+index a68c36a..8be184b 100644
+--- a/src/logging.rs
++++ b/src/logging.rs
+@@ -292,7 +292,10 @@ impl JournalStream {
+     pub fn from_fd<F: AsRawFd>(fd: F) -> std::io::Result<Self> {
+         nix::sys::stat::fstat(fd.as_raw_fd())
+             .map(|stat| JournalStream {
++                #[cfg(all(not(target_arch = "mips")))]
+                 device: stat.st_dev,
++                #[cfg(all(target_arch = "mips"))]
++                device: stat.st_dev as u64,
+                 inode: stat.st_ino,
+             })
+             .map_err(std::io::Error::from)
+-- 
+2.35.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index dad18b78c2..14142fdb67 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -22,6 +22,8 @@ RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 
+SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=../cargo_home/bitbake/libsystemd-0.4.1/"
+
 SRC_URI += " \
     crate://crates.io/aho-corasick/0.7.18 \
     crate://crates.io/atty/0.2.14 \
-- 
2.35.0


