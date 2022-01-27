Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FE3C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 01:28:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.22302.1643246850654499827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 17:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PuXsvUcS;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so5992733pju.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 17:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wKsTvqBmpq8BL4GPvN7fW7LVEGeXJyjL/GwGklxA7Gs=;
        b=PuXsvUcSJHA4lbs3Yb+tjfB0Bg52E4mBW/2JHfIf6qGaHhStPn1OyfAJOwzUjxELMx
         FdUGXw3FvYLX+CJm2Gg64KxmQx3af4X0RKVqLUp7eNHT8hospdy3UDnQ76D0aAles/+9
         s+TUxkOlm9hXs7KICZQ3Ux3YHHNhaFVHCg3/+odMdgk29cwjoWyG/PkchRZt3gcoQAdV
         Z+eVj3i2rz2Bm8CeywcEckpYHYV4UEhQXITUnnYBYPgzUGzAPu8OGgg/peT1QtyzO6/B
         x1rOJzEeZntVRyNfbHc5pDWX7TsQoRcKnkr2KC0YRs6bXSK/kqN5ULNO42xezGmllxzb
         tuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wKsTvqBmpq8BL4GPvN7fW7LVEGeXJyjL/GwGklxA7Gs=;
        b=dhWk0PUazoz4NKd7cOeBImtmLkBNTcoDh3A3W4cZXnNPfAWq+ayr4dMk0FYyNjS/eM
         ZHLgKB54Hqv5O6UEHPm3pvlFkrMr2cXeawfw/i29PQpJfbtb/YFuIlmNDBKuY38W++My
         WZfM59MsJp5LF6PvIEnNVo/Dqm+d1pZMCRdSSzMF9wNvU4gTiB0ktzfCzkJ7Pr0DzwwG
         +ktKWYEHONhiq/KzdE5Fa236u0V2DXgDQH/VHFpkm6aepFadJ3ITevP0NQ+su91iPMFP
         l7CSBxBPwXVOJyxwHJsATD46PwtaZARrJGR2riGLIgj6O1EiXGHMJM4dqIdJmDw9KCN2
         sIQw==
X-Gm-Message-State: AOAM531sYt/rVP4Xl9R+TO0jflzmdZz7qWecRMks1c2SOQH58vxPM4Ep
	gnX/4KKcicBw8ryhdRA7FvXpARE6i6lHXw==
X-Google-Smtp-Source: 
 ABdhPJy1f2okNWaLREQfgEbCXQOe5mAsch5w3C1BhwEc5o/V/W/vRpQ5hHvkBgApw+t3jbec99uqNw==
X-Received: by 2002:a17:902:ecd0:: with SMTP id
 a16mr1168103plh.64.1643246849722;
        Wed, 26 Jan 2022 17:27:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 o23sm430015pjg.14.2022.01.26.17.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 17:27:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-pyruvate: Fix build with riscv64/musl
Date: Wed, 26 Jan 2022 17:27:26 -0800
Message-Id: <20220127012726.1210416-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 01:28:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95111

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...scv64-mod.rs-Add-missing-error-codes.patch | 32 +++++++++++++++++++
 .../python/python3-pyruvate_1.1.2.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv64-mod.rs-Add-missing-error-codes.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv64-mod.rs-Add-missing-error-codes.patch b/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv64-mod.rs-Add-missing-error-codes.patch
new file mode 100644
index 0000000000..67108472ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyruvate/0001-riscv64-mod.rs-Add-missing-error-codes.patch
@@ -0,0 +1,32 @@
+From c711fb215de54f960a35cdc48cd506b6b5db4918 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Jan 2022 11:50:58 -0800
+Subject: [PATCH] riscv64/mod.rs: Add missing error codes
+
+These are flagged by apps e.g. python3-pyruvate
+
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2656]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/linux_like/linux/musl/b64/riscv64/mod.rs | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs b/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+index b075b4a05..6b17621c7 100644
+--- a/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
++++ b/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
+@@ -548,6 +548,11 @@ pub const EHOSTUNREACH: ::c_int = 113;
+ pub const EALREADY: ::c_int = 114;
+ pub const EINPROGRESS: ::c_int = 115;
+ pub const ESTALE: ::c_int = 116;
++pub const EUCLEAN: ::c_int = 117;
++pub const ENOTNAM: ::c_int = 118;
++pub const ENAVAIL: ::c_int = 119;
++pub const EISNAM: ::c_int = 120;
++pub const EREMOTEIO: ::c_int = 121;
+ pub const EDQUOT: ::c_int = 122;
+ pub const ENOMEDIUM: ::c_int = 123;
+ pub const EMEDIUMTYPE: ::c_int = 124;
+-- 
+2.35.0
+
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index 14142fdb67..b83302d44c 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -23,6 +23,7 @@ RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 
 SRC_URI:append:mips = " file://0001-check-for-mips-targets-for-stat.st_dev-definitions.patch;patchdir=../cargo_home/bitbake/libsystemd-0.4.1/"
+SRC_URI:append = " file://0001-riscv64-mod.rs-Add-missing-error-codes.patch;patchdir=../cargo_home/bitbake/libc-0.2.112/"
 
 SRC_URI += " \
     crate://crates.io/aho-corasick/0.7.18 \
-- 
2.35.0


