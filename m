Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887E6C433EF
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 21:46:02 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.19635.1643233561338774073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 13:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V7hu8Q4F;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d1so754799plh.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 13:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mnOOHMVpNyv715qnAg97rck/yHuOXdaUH4p8O9aibKE=;
        b=V7hu8Q4FD/6g/G6wvz4R8ykmFyBJRJ7AvbXAdT09ODdkwgAGg2Wwl7ckV/M65D32xU
         ZUMs2TNiybYwq55jGcB1Ad6qVWCyVEy3c6iMlt7+h3Y0DmZ1iewZpnAxGVzIjfDj8O/M
         6HI3wcSzQLFvHA6sHpR56oxw/cz7FDxUIFajGW7Z78Cns/v+1ioS+COWktroIosJjwVt
         RUJyLXtTyvS9O3e/mFJiOjrbLWRXjxJpUVkCbVLSO2SPlB7q4narmmVk0f+6UrM70D4y
         qFlkbW/CEtQU9GgqVCyW/RUcKUOAg99fG4JPCIkDcM0DkTK2UNG29ei+ZDHIZKjRDUuo
         HmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mnOOHMVpNyv715qnAg97rck/yHuOXdaUH4p8O9aibKE=;
        b=3kUs6W/P3RXnaE8CXZcUXb0H8udSV9GHQjs88u2LGbQswBZe4Lymxl0DVETQ0KLYr4
         NTEMBOszBlpBzOgTX4eEsB5zjJeGkDD04rb8Y1ZYBv7W6MEx+tWXz5JlNvBmvCZjcHa9
         /H4U/QJJHq7rsV4LSDWzdbdD/ISoGx3pLBPOND4kfHR8ylCn0SZqzosxhlam1p2d80nX
         TwYf1Z6bO9TafhnZeNyg8F7ByFDFNJ6q7n3saeQdYFLW6+rIGuYL9MFub044OWPbxss5
         4kvSjowUVqWd4mIr0bFDSeYvo6A1KhdDdVBoAlIZXBwLIKTn1ENZgQfrS7kHmC91BqYy
         UgMw==
X-Gm-Message-State: AOAM532Pp2YeyCZNeu33OMRU2r2QKkArX5G96DEil7NZckEfpjbRdXf6
	dy3F2FZEzTfiNfakT+h85tVv+5MdPp/Kmw==
X-Google-Smtp-Source: 
 ABdhPJwyUlNbg42dGnoSBOQDcQO8J4UJ/nLOkYeJg2Guyhu2ldaXogcbUWFVubr9XT6y+u+gCIx8lw==
X-Received: by 2002:a17:902:b7c1:: with SMTP id
 v1mr1022468plz.44.1643233560467;
        Wed, 26 Jan 2022 13:46:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 p8sm3193114pfo.41.2022.01.26.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 13:46:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH v4] python3-pyruvate: Fix build with mips
Date: Wed, 26 Jan 2022 13:45:57 -0800
Message-Id: <20220126214557.1180426-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 21:46:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95109

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
v4: Address upstream comments

 ...-targets-for-stat.st_dev-definitions.patch | 45 +++++++++++++++++++
 .../python/python3-pyruvate_1.1.2.bb          |  2 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
new file mode 100644
index 0000000000..f41e6cf116
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
@@ -0,0 +1,45 @@
+From 56984b19469ff5b69b8b8e180dc75cf825bb1123 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jan 2022 22:28:11 -0800
+Subject: [PATCH] check for mips targets for stat.st_dev definitions
+
+st_dev has wrong type in glibc when using mips/O32 ABI
+its type should be dev_t but it is set to unsigned long int
+this is specific issue on mips/o32 ABI in glibc for details
+
+See
+https://sourceware.org/bugzilla/show_bug.cgi?id=17786
+
+currently the build fails on mips archirecture with type mismatches
+
+      Fixes
+      error[E0308]: mismatched types
+*        --> /usr/src/debug/python3-pyruvate/1.1.2-r0/cargo_home/bitbake/libsystemd-0.4.1/src/logging.rs:296:25
+          |
+      296 |                 device: stat.st_dev,
+          |                         ^^^^^^^^^^^ expected `u64`, found `u32`
+
+Upstream-Status: Submitted [https://github.com/lucab/libsystemd-rs/pull/103]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/logging.rs | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/logging.rs b/src/logging.rs
+index a68c36a..6e374ae 100644
+--- a/src/logging.rs
++++ b/src/logging.rs
+@@ -292,7 +292,10 @@ impl JournalStream {
+     pub fn from_fd<F: AsRawFd>(fd: F) -> std::io::Result<Self> {
+         nix::sys::stat::fstat(fd.as_raw_fd())
+             .map(|stat| JournalStream {
++                #[cfg(not(target_arch = "mips"))]
+                 device: stat.st_dev,
++                #[cfg(target_arch = "mips")]
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


