Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0E5D116F7
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 20:35:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4998.1764534921081395683
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 12:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSxJR/6n;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso20657675e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 12:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764534919; x=1765139719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sa9Zv4Xo8lYu96ItcYBuKhf00dCaVTf/R1kvAt3XHbU=;
        b=nSxJR/6nMTo+nRO28OxHjLDdW7Qad+2aiHD6prcL1c55n4T8KfAma7jDGL+SBVaKQy
         dz+KFHdfsl4/bVBt9cZc7EdpQQa0afGPzzo4I/UoA/vgFUUvuWaLCfhopvokoE+AbNBb
         T2h/+1StDNk860SOJdqc8937tI5ps3XKNxOYWgcijbp0oERpWpBpl9Iv4itOFkxMTbD4
         VqcPi1WypO3ZJYsf1kTWz8cAdYaN6H8tfJm0kOhBPgX1qCI6prWvHoWZH5aWUXeiwbWI
         2BatejPkHoFwyxiGGLQhGkSChKi2IC5eDsAbtZbN5MUnV/XSW9VdiJXgBf42syhvDJgq
         ib5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764534919; x=1765139719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sa9Zv4Xo8lYu96ItcYBuKhf00dCaVTf/R1kvAt3XHbU=;
        b=ty91xa0AtrEXypd/JeJgnViWwoxCuH2xDUSXbRedH2LBg8dKtM+MRKffvUfyczCmj3
         D8h5SPHy7Dg9FrqCeNNLKGRKhWJnsnZejbYpYm+KRrMKlrJVDMn5JYiMsWknGpB2aUMD
         ExQUvm0JJ3MP9K1neLMPV03cRGmaLJ3iPMT/zNPZ1CIcPpB4kh4zVKhleymdmd74Nl1I
         sIhPKJd4zp1KRxjomfnYF2V8PkwOEBPbTkuko98K4LAXOoY/58YdbL5/bKbf7jlNLnW/
         BQozv7tGEVDge4DRfyeEtmy2lhfhJz0L0tjr2Y+soVfI0X9oao1ht4V3xHQ/pQ9tF83R
         Dn3Q==
X-Gm-Message-State: AOJu0YxskQe8Ns6GJ7gfQ155YgFj5hn7oPWj37r1rVcEj+kw4IWEUrgC
	EZr95/KbxRAO89kAwW5bAH1Pi3qKaNQRkGEE/i4Xk0PIXZJn5oMpiH5uED3sGA==
X-Gm-Gg: ASbGncuMtWdMQ1yCWxMoHhs82lbuh4n1NRCf0XpRXi0rO9UZuk1alWLQmSvUAASWtV2
	0xzAUoo+DwlP5Ex8b924Aps5d9D5LPun2lND8eA4g7yvG/NB1RetzBNjRIatUdE347neX0wp48y
	39YRbnufJYhE0qlleCePmmYrD4HhRS4XCBMshx6W9oEJUKTlGr0LpvSN6WPygXZElVjk5SwuRoH
	+fA6fDVi1PyMGvhIfoQJDFxBm/8nBNemDUAkCwAYkf3a9nFDTygRLIIdfv6inARlyJsLIavDG+e
	rKnBxXP5Ooq0g0AZOowCggpxzZ6/uDPNQqbQ00aT20c8W88NKL+qDHXbJ+eadz3ArLGvEZsTsFV
	IvK6HfBQJ15SwTey0OXYkPPSN6MwxgPon4V1K+ZvYgBYasBD9+L4zi6Icy3b3CY0ejAAj7hHoZq
	mnj+InEi/qd0Uarosvwrk=
X-Google-Smtp-Source: AGHT+IHgo7wPltnmzFr3buolESbC3PmY1HBP1i5PRhTxqNrrIE0uQMwo7uww2yRNMGz/+u2SxkUEyg==
X-Received: by 2002:a05:600c:3593:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-477c0162f1fmr390604485e9.7.1764534919419;
        Sun, 30 Nov 2025 12:35:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca8bae9sm21338810f8f.33.2025.11.30.12.35.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 12:35:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 6/8] redis: handle CVE-2025-27151
Date: Sun, 30 Nov 2025 21:35:09 +0100
Message-ID: <20251130203511.462501-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130203511.462501-1-skandigraun@gmail.com>
References: <20251130203511.462501-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 20:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122186

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-27151

In redis 7 this is already patched[1], and the recipe contains the
fix.
For redis 6 backport the relevant patch (which is referenced in the
nvd report)

[1]: https://github.com/redis/redis/commit/d0eeee6e31f0fefb510007a8cfdf5dce729a8be9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../redis/redis/CVE-2025-27151.patch          | 32 +++++++++++++++++++
 .../recipes-extended/redis/redis_6.2.21.bb    |  3 +-
 .../recipes-extended/redis/redis_7.2.12.bb    |  1 +
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch

diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch b/meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch
new file mode 100644
index 0000000000..ccd56ea8a8
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch
@@ -0,0 +1,32 @@
+From 845233cecd6327a20957a97b78e61bccaaa652f7 Mon Sep 17 00:00:00 2001
+From: YaacovHazan <yaacov.hazan@redis.com>
+Date: Tue, 27 May 2025 10:23:27 +0300
+Subject: [PATCH] Check length of AOF file name in redis-check-aof
+ (CVE-2025-27151)
+
+Ensure that the length of the input file name does not exceed PATH_MAX
+
+CVE: CVE-2025-27151
+Upstream-Status: Backport [https://github.com/redis/redis/commit/d0eeee6e31f0fefb510007a8cfdf5dce729a8be9]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/redis-check-aof.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/redis-check-aof.c b/src/redis-check-aof.c
+index 1507e0a..3961ac5 100644
+--- a/src/redis-check-aof.c
++++ b/src/redis-check-aof.c
+@@ -164,6 +164,12 @@ int redis_check_aof_main(int argc, char **argv) {
+         exit(1);
+     }
+ 
++    /* Check if filepath is longer than PATH_MAX */
++    if (strlen(filename) > PATH_MAX) {
++        printf("Error: filename is too long (exceeds PATH_MAX)\n");
++        exit(1);
++    }
++
+     FILE *fp = fopen(filename,"r+");
+     if (fp == NULL) {
+         printf("Cannot open file: %s\n", filename);
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
index efa8677e76..d23d3c07c6 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.21.bb
@@ -16,7 +16,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-          "
+           file://CVE-2025-27151.patch \
+           "
 
 SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e9b6d5f"
 
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index cd2be6f27e..efbe86b358 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -71,3 +71,4 @@ SYSTEMD_SERVICE:${PN} = "redis.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
 CVE_STATUS[CVE-2022-0543] = "not-applicable-config: the vulnerability is not present in upstream, only in Debian-packaged versions"
+CVE_STATUS[CVE-2025-27151] = "fixed-version: the used version(7.2.12) contains the fix"

