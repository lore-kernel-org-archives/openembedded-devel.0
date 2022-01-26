Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE43C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 06:59:14 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.9429.1643180354316819538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XwazqRjB;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so5330259pjp.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adVTjGoR8o2S7knPxVnBU4hcBInk0UdJSG3Fg2ZnXsA=;
        b=XwazqRjB2j1P1RuaP+nb8MPGQ2wMkPXyvJU6zmyU/LE08SWocORHzd/4xXGwuHiot4
         33Dd/zsYEuGXanci/JnD4JkpkP3TNfZ1ZPq2Meu4Ls8iht/pLRZVslQIe2TbIw1cdmTc
         itZQce1MYkn2SaYAX7vW+fZrRj6Vh/HencqL6fK8tRgDAXqu+2JtqvUcM5uoDrmDYoHt
         aoaEuB2xJY5rZjgqOTBCoOtSxWsNVzYZVoMm5dZ7htU/FJSEEvwS08uu91AfO6VPVGKk
         Z1uVRelCKlfoNuUuRvfbZ8ovBaCiIx2ymwnEb0yhbbXNmwoBxW+CbTiE1SZDGCu8BEPE
         5doQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=adVTjGoR8o2S7knPxVnBU4hcBInk0UdJSG3Fg2ZnXsA=;
        b=rA1BhnTSZXHRoHyrd8CZj32fYwt7Dal98tbiEO5OPkcEi/Sdm3DjJmjNMk2iIfyRA3
         xYvl+hPcBZ8DdKJ6wrVfCxGbV6vJDfSIlyx5EDDFaPJH9gP5fMJG+YXw1cbXR7gwToMh
         aFLafc/wdq+9DEtwOebFqkUOor8BLXxSwt7j77phEqEjy4j5EjPLmshKQ1UL6SOeOePP
         OEtD0T7JnZhnsa3EaR1d/NZ1mkciIAqVfj10eT4M15EuXM+uhqbkAP4kpMIUgf/L8X0x
         gW8dJ2FSCJVbW5Avl6wAqxM9BdAydpkRdoOBpn27JFpeTKMSGkIIOvX5T78+TJjdHVww
         eG3w==
X-Gm-Message-State: AOAM530fnyDcHLv/KQFDxxZFyrs/jslDwSaOSLlHGm01ELAW8g8qVeSV
	44cVVgSsWPhxQ2SiwEKFiTH8KQxa1ux8xA==
X-Google-Smtp-Source: 
 ABdhPJx/SNmFBNU/coIx3g5XjQ73kxWa2C7cK4pFhwPKjDe0EMXuzLXORUtsqVuPkR+ZYYBXMo4Umw==
X-Received: by 2002:a17:902:8498:b0:14a:1b37:9f2b with SMTP id
 c24-20020a170902849800b0014a1b379f2bmr22922541plo.85.1643180353499;
        Tue, 25 Jan 2022 22:59:13 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 n34sm943633pfv.209.2022.01.25.22.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 22:59:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH] python3-pyruvate: Fix build with mips/glibc
Date: Tue, 25 Jan 2022 22:59:10 -0800
Message-Id: <20220126065910.3023993-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 06:59:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95099

mips/glibc systems have interesting problem where dev_t is not defined
properly for O32 ABI, therefore address it for libsystemd crate, it
works fine for musl therefore apply it for glibc alone.

network is now required to be enabled since the replacement crate for
systemd will have to be refetched after patching the manifest which
happens during do_patch and hence after do_fetch

Fixes
error[E0308]: mismatched types
   --> /usr/src/debug/python3-pyruvate/1.1.2-r0/cargo_home/bitbake/libsystemd-0.4.1/src/logging.rs:296:25
    |
296 |                 device: stat.st_dev,
    |                         ^^^^^^^^^^^ expected `u64`, found `u32`

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <tim.orling@konsulko.com>
---
 ...-targets-for-stat.st_dev-definitions.patch | 32 +++++++++++++++++++
 .../python/python3-pyruvate_1.1.2.bb          |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
new file mode 100644
index 0000000000..3bd80359f4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-check-for-mips-targets-for-stat.st_dev-definitions.patch
@@ -0,0 +1,32 @@
+From 24328cffebbc91bf15fbff51e9c50daf6eede4a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Jan 2022 22:28:11 -0800
+Subject: [PATCH] check for mips targets for stat.st_dev definitions
+
+See
+https://sourceware.org/bugzilla/show_bug.cgi?id=17786
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/logging.rs | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/logging.rs b/src/logging.rs
+index ed12ce9..535a48f 100644
+--- a/src/logging.rs
++++ b/src/logging.rs
+@@ -293,7 +293,10 @@ impl JournalStream {
+     pub fn from_fd<F: AsRawFd>(fd: F) -> std::io::Result<Self> {
+         nix::sys::stat::fstat(fd.as_raw_fd())
+             .map(|stat| JournalStream {
++        #[cfg(all(not(target_arch = "mips")))]
+                 device: stat.st_dev,
++        #[cfg(all(target_arch = "mips"))]
++                device: stat.st_dev as u64,
+                 inode: stat.st_ino,
+             })
+             .map_err(std::io::Error::from)
+-- 
+2.35.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index dad18b78c2..03bb45e767 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -22,6 +22,8 @@ RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 
+SRC_URI:append:mips:libc-glibc = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=../cargo_home/bitbake/libsystemd-0.4.1/"
+
 SRC_URI += " \
     crate://crates.io/aho-corasick/0.7.18 \
     crate://crates.io/atty/0.2.14 \
-- 
2.35.0


