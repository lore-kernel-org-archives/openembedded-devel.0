Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AA2C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 07:07:11 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.9543.1643180830527153644
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 23:07:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WmxYdQW1;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d187so596134pfa.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 23:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Uzf70ftonetYt8N6x0kYinzSV9oRQFwyTl0LAL+Huc=;
        b=WmxYdQW1cvDDvc6DV8zK9jIiRbgNNwDQBAH4JUS3FbWBuF8hLpCqbBJS7DiWEjVf20
         XFiHkvlDwVsHkkwdllet5BwjLZSZVPCtIlGHpqPgfvdQwSJubbrBoI8F+d4SchkL/rmS
         0lIAKC2ou3rvLK6/kkDG7KRiXU5yj2Hj+kifFqdzjEomTGFHv1PvqmsAiRBmb6VtoFew
         Z8DAqWPiuu/VmYmJIrKpNiY/bxm5P49p+YrUdAESdrT1pGsWt4RcIPa3Yb+GFLW+9feP
         fm4Be42LrSSq/ZDlIZ2n65kiYZzyolSZ9D8QuPGAIWoVx72LzNlahPBV2fD7PERBk6Es
         Tj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Uzf70ftonetYt8N6x0kYinzSV9oRQFwyTl0LAL+Huc=;
        b=ngJU5JR4h0vHKMqx/+13DucJFTRk5Bs5un9AspI+Xkdb3h6c0F8xCoz1MI6fDEh1dJ
         wCB/+xXil17mthOq5dAXNV2Z4R4R6RDtHXoe+F9SUR467IPplB6czNFz78eDcyRgQt6q
         nDxkyY1h+neOX3pykgfhd5jw4uWI4O8y5wkgSjylWzadb0VIfxQ8uJ84GbdrxHfwIcEn
         bdDYUJLV4oSaFrMC8DkBywkSVeV5riDDW0RU6HzTvqexOVx4EQT29NboqxoYgn0clqvW
         jHUxKWgoNHjdgbJWUT5iNDrpoWgaYCOjOXW7l298qqKYt1vG+YyRkbVv8R4GmqQOnC/y
         iSPQ==
X-Gm-Message-State: AOAM531uCOYh65aYh31tZd+ShJc6ENqlk/n8hycEii+x5pDRFrP3x+ct
	FuOXhKIqA0CxVsdQCQaJwij1h50LKA9J7A==
X-Google-Smtp-Source: 
 ABdhPJyZ8XeLiZKqH3hlXKBJxWB6GbSLshkRRRo0zOrOeIHcUanCa1+MM/JbxhMV2m96b6d0tvDCoA==
X-Received: by 2002:a05:6a00:883:b0:4bc:39c1:9644 with SMTP id
 q3-20020a056a00088300b004bc39c19644mr21466030pfj.14.1643180829762;
        Tue, 25 Jan 2022 23:07:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 j10sm1035508pfu.93.2022.01.25.23.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 23:07:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH v2] python3-pyruvate: Fix build with mips
Date: Tue, 25 Jan 2022 23:07:05 -0800
Message-Id: <20220126070705.3034779-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 07:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95100

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


