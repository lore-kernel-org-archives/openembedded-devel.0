Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E19FE7717B
	for <webhook@archiver.kernel.org>; Sat,  7 Dec 2024 14:06:58 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.60637.1733580411766223112
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Dec 2024 06:06:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZlgBfWxD;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa628d7046eso444679266b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Dec 2024 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733580410; x=1734185210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GH6EGyflZ17GemOwn4pkMBQ/Np6rM8lFF3on9cu7ac8=;
        b=ZlgBfWxDEoH3ZT+ZywxoiBcyva0mauvZR/ZFBPgeYH2EzHTEVoRlbDIpq0GTHHSXdv
         v/rSN93IA6gsrHpAoVirpEpUU4xtPk8JN4XWg+e/FHE7LHn9gwbUKhH060EgbKUnhTrP
         WuF5RfqLhIbZVRPKJBFFi6itsVWJ1f0BYzyfFjvE6aGbN12jRTV+utK4MyDN9LEb3klI
         O9Hc1ZcNOhh6hPxcZDA11pFKAkBmQ0wrP3qw7kp2cVMJG8YF5OoKh8g93X57IH4+Sbaj
         7yX/VlCLXz4DquYApwWJ/uB+1mvIp25vZ+9iQf5i5O7n44affJWu6fL+U+wYePXjECCJ
         MRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733580410; x=1734185210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GH6EGyflZ17GemOwn4pkMBQ/Np6rM8lFF3on9cu7ac8=;
        b=VLlY4Ian9EgkzVFbjMvCsh7GYEO/mpLGWDzlubaIYmKXli+qZoo64f4z8lg9x0xCWi
         UQJB83HtsCVsuREkIkMrHZFHsxU2qnAd/MnFPL8Pl5qHBBTWdmAyQ+ctxFGHemla89dI
         R2nCP305FuXrSIPENX62ev6fUmHNTfzWoAHtkHTpLwQOfyZ47+5NgaUrPObfI1Ga7ntc
         alaC6YN2RJzMBjshX8cx93fqgCqI3xgCtK+nAEmRJG+3I1HZjpYFA7Qan07iQfNVmmu4
         dfPaQg0UwHIGltqOY989oMyuwWH1rcvSpeakc+Ka850/je+bNYgXDtbU+bBRkS1Jf4RJ
         VfvA==
X-Gm-Message-State: AOJu0YxgCrSt2ZYqgvLnWPDeP1zZ8SGafoOMDdwbpURiXMzOZZS2WhmF
	aFVHYLaBoV4aWbgGfaW8mg8MFsidT8XOJvNcbL9/4uD6/YgzuMesZlWW2w==
X-Gm-Gg: ASbGncuXqaix0zWZjq3dvaD1EGCrQrbjTTBagufeIf/OPFB5YCmwpkV/2tBHQo9lHnb
	4ZTN+nrjpp3h4KA6tK+LhZ8zMip55tH3zRSNwBqbKYrY5gELs4sHtub3EJCY5vP1WEl3Vj8tDK1
	55VgIyCtHPNFBK3gVtRBP2zkWQKLOrtGVQQHbd1CTPj49nc3eUmkH36YyzjaHmoxvxKDUrLBTQk
	yq8REHCioqXy0TjC2Wu+xvrWeknUNFaamZ4rbKqHGcS278bfR7tQzfW642hw65OcVdrd0ixXJ/F
	EYtIQ68=
X-Google-Smtp-Source: AGHT+IEaCUBEDPXUBvoIEtk17vu9OauIaQrNfNrTpnPrbtslRuh+jVG7wtHLdcFlDesbTGpsy8FWWA==
X-Received: by 2002:a17:906:3115:b0:aa5:3c28:e0ae with SMTP id a640c23a62f3a-aa63a02551amr570575366b.15.1733580409761;
        Sat, 07 Dec 2024 06:06:49 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58da5sm395876466b.28.2024.12.07.06.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 06:06:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [WIP][meta-oe][PATCH] nodejs: fix 0001-deps-disable-io_uring-support-in-libuv.patch
Date: Sat,  7 Dec 2024 15:06:42 +0100
Message-ID: <20241207140642.181134-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Dec 2024 14:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114222

22.12.0 upgrade from:
https://git.openembedded.org/meta-openembedded/commit/?id=d6fe4dc9aec5d2c7a471a572c352132c31149df0
reintroduced io_uring support in embedded libuv from:
https://github.com/nodejs/node/pull/55114/files
https://github.com/nodejs/node/pull/55114/files#diff-f8507e4b4f0efe29edd191af090c7d1f57744511237a1972736536e9a594f5ff

which leads to the same issues as previous nodejs upgrade in:
https://lists.openembedded.org/g/openembedded-devel/message/105583
https://git.openembedded.org/meta-openembedded/commit/?id=d08453978c31ee41d28206c6ff198d7d9d701d88
https://git.openembedded.org/meta-openembedded/commit/?id=0d9351e9290f6750e44ab52536bbe9268d5afac3
https://git.openembedded.org/meta-openembedded/commit/?id=7bb28628991ec9be9610540401f7c6cc4c19997f

pseudo still doesn't support io_uring:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15244

calling chown in hundreds recipes to work around pseudo limitation doesn't seem good work around.

The UV_USE_IO_URING variable still exists in code (even after its
documentation was removed in:
https://github.com/louwers/node/commit/2b298e132d2f681270e9f3d5eb3134914653d2e1
) but it doesn't seem to work.

It's failing because the 0001-deps-disable-io_uring-support-in-libuv.patch patch restored in:
https://git.openembedded.org/meta-openembedded/diff/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch?id=6652b031d7d4d9cabf16d481f3b82115f7d8e15a
is wrong (it adds meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
file inside nodejs source instead of patching deps/uv/src/unix/linux.c).

Also return 0 directly without unnecessary checking uv__kernel_version
which seems to read kernel version from host anyway.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
WIP: because even with this restored the do_package fails, something else
     has to call io_uring now even when disabled here.

 ...ps-disable-io_uring-support-in-libuv.patch | 106 ++++++++++--------
 1 file changed, 57 insertions(+), 49 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
index 04398ac687..01ae50cdc4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
@@ -1,52 +1,60 @@
-From 2bb296f169f86dbb04ee47e9a0dc1e3ee13d4f73 Mon Sep 17 00:00:00 2001
-From: Jason Schonberg <schonm@gmail.com>
-Date: Thu, 7 Mar 2024 12:55:56 -0500
-Subject: [PATCH] Update to nodejs 20.11.1
+From 79af9bd6ac1040f1fe3c6cab26b2d040ad907870 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 1 Mar 2024 15:46:11 +0800
+Subject: [PATCH] deps: disable io_uring support in libuv
 
-Upstream-Status: Inappropriate [embedded specific]
+Refer [1], Pseudo fails to intercept some of the syscalls when io_uring
+enabled. Refer [2], always disable io_uring support in libuv to fix
+issue in [1].
+
+[1] https://git.openembedded.org/meta-openembedded/commit/?id=d08453978c31ee41d28206c6ff198d7d9d701d88
+[2] https://github.com/nodejs/node/commit/686da19abb
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 ---
- ...ps-disable-io_uring-support-in-libuv.patch | 35 +++++++++++++++++++
- 1 file changed, 35 insertions(+)
- create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+ deps/uv/src/unix/linux.c | 29 +----------------------------
+ 1 file changed, 1 insertion(+), 28 deletions(-)
 
-diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
-new file mode 100644
-index 00000000..5ac711fb
---- /dev/null
-+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
-@@ -0,0 +1,35 @@
-+From 9838be9c710ab4249df86726fa390232a3b6a6e7 Mon Sep 17 00:00:00 2001
-+From: Changqing Li <changqing.li@windriver.com>
-+Date: Fri, 1 Mar 2024 15:46:11 +0800
-+Subject: [PATCH] deps: disable io_uring support in libuv
-+
-+Refer [1], Pseudo fails to intercept some of the syscalls when io_uring
-+enabled. Refer [2], always disable io_uring support in libuv to fix
-+issue in [1].
-+
-+[1] https://git.openembedded.org/meta-openembedded/commit/?id=d08453978c31ee41d28206c6ff198d7d9d701d88
-+[2] https://github.com/nodejs/node/commit/686da19abb
-+
-+Upstream-Status: Inappropriate [oe-specific]
-+
-+Signed-off-by: Changqing Li <changqing.li@windriver.com>
-+---
-+ deps/uv/src/unix/linux.c | 2 +-
-+ 1 file changed, 1 insertion(+), 1 deletion(-)
-+
-+diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
-+index 0c997185..7508409d 100644
-+--- a/deps/uv/src/unix/linux.c
-++++ b/deps/uv/src/unix/linux.c
-+@@ -433,7 +433,7 @@ static int uv__use_io_uring(void) {
-+   if (use == 0) {
-+     /* Disable io_uring by default due to CVE-2024-22017. */
-+     val = getenv("UV_USE_IO_URING");
-+-    use = val != NULL && atoi(val) ? 1 : -1;
-++    use = 0;
-+     atomic_store_explicit(&use_io_uring, use, memory_order_relaxed);
-+   }
-+ 
-+-- 
-+2.25.1
-+
+diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
+index 803a9a9d3f0..a4735f56cf0 100644
+--- a/deps/uv/src/unix/linux.c
++++ b/deps/uv/src/unix/linux.c
+@@ -465,34 +465,7 @@ static int uv__use_io_uring(void) {
+   /* See https://github.com/libuv/libuv/issues/4283. */
+   return 0; /* Random SIGSEGV in signal handler. */
+ #else
+-  /* Ternary: unknown=0, yes=1, no=-1 */
+-  static _Atomic int use_io_uring;
+-  char* val;
+-  int use;
+-
+-  use = atomic_load_explicit(&use_io_uring, memory_order_relaxed);
+-
+-  if (use == 0) {
+-    use = uv__kernel_version() >=
+-#if defined(__hppa__)
+-    /* io_uring first supported on parisc in 6.1, functional in .51 */
+-    /* https://lore.kernel.org/all/cb912694-b1fe-dbb0-4d8c-d608f3526905@gmx.de/ */
+-    /* 6.1.51 */ 0x060133
+-#else
+-    /* Older kernels have a bug where the sqpoll thread uses 100% CPU. */
+-    /* 5.10.186 */ 0x050ABA
+-#endif
+-    ? 1 : -1;
+-
+-    /* But users can still enable it if they so desire. */
+-    val = getenv("UV_USE_IO_URING");
+-    if (val != NULL)
+-      use = atoi(val) ? 1 : -1;
+-
+-    atomic_store_explicit(&use_io_uring, use, memory_order_relaxed);
+-  }
+-
+-  return use > 0;
++  return 0; /* pseudo doesn't support io_uring https://bugzilla.yoctoproject.org/show_bug.cgi?id=15244 */
+ #endif
+ }
+ 

