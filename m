Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD09CC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:12 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web12.2820.1639595755706920569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 11:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=vV3qUgmf;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id d38so679397lfv.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 11:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E8KLWrVt+PZfCQPSMZJ0ywlX0wAmcYdOf+QjqFlJOMI=;
        b=vV3qUgmfRDXhGDt5BfD1laRDkbzV+K3dfSGxGnPQjgk7EozJYKt6o3ZxqGJ7beRKta
         iTBMFia5iJl5uPg9m8xQV/On3Imiw2C5y38Wujt+CniX8bF31f+My3WD428gDTo0h2bV
         fuUkE4OAqpRtzTgQN/qSS2Q3PYL+vI7vSMtSUoHEcvPF1ZHvs8CwAJdFfLhCqhrx+1Fj
         2c+eqmHghXDKXwUemXDO15KV3g8SYZE5RJRuFlW4uTtBd3rdUtf3iumYEXwsKA1WR/QB
         ZBbQVsCeo4vbjmziTV0FbPWIWAH9Eik5i8UOll4SPRUI4jTo5x8NFX6FZ10WYgn3RBv3
         QpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E8KLWrVt+PZfCQPSMZJ0ywlX0wAmcYdOf+QjqFlJOMI=;
        b=dEmzyeO39nu6r/Kw+s0UD1Mli5BIrs7phLyPStCpTlOg71f4QH7DNzQD03xAo+0Lf7
         /MkU9Thj1ulrmJe2pi+iWBndiZW21NQfyr2WLDtNWlukkv9eZITUuqTltQuffSzwuWzJ
         dNHSWfumSPIsgkOKWzKmUx5zFOZ8wPbsXPx164G+nRZht8R9mRSxjA8z8oIuh0VRzRPI
         jeOXpjMYoxCH6tXlKUuUon6aYaqu8TiuMkxCFspW5RGp24CM6IEaOS7Q/TnwMq9R8Ef4
         KeERwxgN/OlQyyWFqHsUvDkHd/42L1B0C2+zgREopvwX3kz0bKF05B1sVnJpXMchN7Zo
         EsAw==
X-Gm-Message-State: AOAM533Dp99lni6ee9wib/TDDeK8HW4WO6b7fDH6gINLed/ghqGzGufV
	fg4Du+qmtL5jczHQI/jCYJcvNFktJW4GlFEU
X-Google-Smtp-Source: 
 ABdhPJzv0vvyAN9oBBKl+dlIIldrkduIad+7emt+ES4BWEYTsnsd4jkNwAAXv+wqq3lsepecdiQytA==
X-Received: by 2002:a05:6512:2306:: with SMTP id
 o6mr11208951lfu.640.1639595753064;
        Wed, 15 Dec 2021 11:15:53 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id a1sm455090lfc.92.2021.12.15.11.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:15:52 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libkcapi: update to 1.3.1
Date: Wed, 15 Dec 2021 20:15:50 +0100
Message-Id: <20211215191550.1964457-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94373

Dropped upstreamed patch.

License-Update: copyright years updated.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...f-__NR_io_getevents-when-not-defined.patch | 36 -------------------
 .../{libkcapi_1.2.1.bb => libkcapi_1.3.1.bb}  |  8 ++---
 2 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
 rename meta-oe/recipes-crypto/libkcapi/{libkcapi_1.2.1.bb => libkcapi_1.3.1.bb} (81%)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch b/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
deleted file mode 100644
index 9d9f63e34..000000000
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi/0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 771dd6aa45dd0bbbb7d7c7a7b116e1b5666fbd7a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 18:05:48 -0800
-Subject: [PATCH] Disable use of __NR_io_getevents when not defined
-
-Architectures like riscv32 do not define this syscall, therefore return
-ENOSYS on such architectures
-
-Upstream-Status: Submitted [https://github.com/smuellerDD/libkcapi/pull/100]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/internal.h | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
---- a/lib/internal.h
-+++ b/lib/internal.h
-@@ -325,10 +325,17 @@ static inline int io_submit(aio_context_
-     return syscall(__NR_io_submit, ctx, n, iocb);
- }
- 
--static inline int io_getevents(aio_context_t ctx, long min, long max,
--            struct io_event *events, struct timespec *timeout)
-+static inline int io_getevents(__attribute__((unused)) aio_context_t ctx,
-+            __attribute__((unused)) long min,
-+            __attribute__((unused)) long max,
-+            __attribute__((unused)) struct io_event *events,
-+            __attribute__((unused)) struct timespec *timeout)
- {
-+#ifdef __NR_io_getevents
-     return syscall(__NR_io_getevents, ctx, min, max, events, timeout);
-+#else
-+    return -ENOSYS;
-+#endif
- }
- 
- /************************************************************
diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
similarity index 81%
rename from meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
rename to meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
index cc71903a8..f10d68470 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.3.1.bb
@@ -1,13 +1,11 @@
 SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
 HOMEPAGE = "http://www.chronox.de/libkcapi.html"
 LICENSE = "BSD-3-Clause | GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c78be93ed8d1637f2a3f4a83ff9d5f54"
+LIC_FILES_CHKSUM = "file://COPYING;md5=80c467906eb826339c7f09e61808ed23"
 
 S = "${WORKDIR}/git"
-SRCREV = "d41284525ec8960e9a828979cfe269012b7df8db"
-SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https \
-           file://0001-Disable-use-of-__NR_io_getevents-when-not-defined.patch \
-           "
+SRCREV = "2936ecd060c299157ac880650ba2c9fd94d27bb1"
+SRC_URI = "git://github.com/smuellerDD/libkcapi.git;branch=master;protocol=https"
 
 inherit autotools
 
-- 
2.25.1


