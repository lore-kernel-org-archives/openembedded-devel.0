Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBFBD5E360
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 13:51:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23109.1765893057399178545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 05:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mtsuny3M;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbc305882so2056469f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 05:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765893056; x=1766497856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HS+errM5koCF2/5jxUfsvCAXams9Ohw56XlIj7vK84E=;
        b=Mtsuny3MPsPZUhTargmzVxOxQRXpfnNhHUyYQ9EBOCqTS6l2d06mOCAXWQehCLMaSa
         NCH5cCWnzAAgBhsOVMfy1N8hTzsi4qCM5gObTdMSUEjmY7T9s52HFp39vdqGYtt98zCc
         vZ4AdydxKuU7uTw3o/KBL1QiiokA9D5sf97KqlU4Eetmq4MbGpyHdgzPVeFRE8IAgFxz
         VtoaK3clmAIvLUywraIrhlsALxDva/8PjqHlyxAl635yVWFJO++Ih1h2jFsTN8r5clfd
         UcCC8jdV8EX9iyPrzrWPUty2nXMAY7eI9lfxsGh6lwKvPnsXWfBI2QdDJ3B0hdCov3VK
         RSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765893056; x=1766497856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HS+errM5koCF2/5jxUfsvCAXams9Ohw56XlIj7vK84E=;
        b=wORGElToEEX46tzPi1ycYFahYghoZT6tgXOpFGZzbyFHXs7n7yfMSR/gGe20KNWu6c
         g5KLaioerUZZouSzh3oKzPbpIhGTqaOXdPVtZl2G2sKlnLMmh6XdfgyLPr+XWYwlXu7b
         lLkA8dqjROwt2d1ZBXb7JWQigNe0lvttvTh65roPeLGjcrnS1/lagL8qdTDXNPO0/b+L
         WANNWXm/XHxFsorlglf+7u98GCgWlIgtSKEHCPQkqNjNL0ts8Y4P1FQDqLYFca9PJHVo
         yEzyuGSTeOvdGlFr8ynKQlJpfwe12juYjLIqUx3Oe2+pRh9UTC00Db3o41rakKBcYaXB
         SHoQ==
X-Gm-Message-State: AOJu0Yzh1I7soAQN663/qwP3Xa/xK4Dla6S04RqnfDy82yz37Tkd/loW
	7cJ4xpG+J/nd5tf93HSElQALbL2EckEsd7Vt7wrJEAYPgbh3/+KBHWGjIL61EQ==
X-Gm-Gg: AY/fxX75RhmOAV8bG+mNjdvDQrxqU/XNaDIueOPBqf2+oYhr+h1p6AleyTnIo+18IXr
	01X44cOAK8le86LPP81tYmMv7TU1TCTFuzJqu9RzVuxROVi55r3Gmfd29bqj3018PZZOSy5M4BI
	jEfl7hdEGhbGRuAVYJepK45rCG3tb1R8Sg1G2M1usFxbzQqBJa8P1TeCAX08bHts8uN86tv1GH2
	oxZDkjMSvzqQN1SLnOZRSUSGmTnOvJF498DV2+wUnmRJATqMUzLNXCDzuAknE2erL2ITwgpJ8ZI
	pJXKrhujZ1VMPUdd/MUk0DP8yX7jdGHQ5Dlga840boC7M2TeI7ftCq8hI2Bbs/mHDCyOS0U46pT
	bFZTAnFfIYLEKqciXCzlXoSKoUkcOE5Gua3+HIicfx+K2UZPlJpAsDBeOuRuNrQYuPpd2vZHV7P
	k0UM8aTcwM
X-Google-Smtp-Source: AGHT+IHOXYYT0CQb/Ucu4UY3qx3XZvAu7u5AkVfxvs9FOe9Rn4n0y0lruquInUWr+db5o1pMFL+y0Q==
X-Received: by 2002:a05:6000:40ca:b0:430:f622:8cca with SMTP id ffacd0b85a97d-430f62292d4mr10900762f8f.56.1765893055587;
        Tue, 16 Dec 2025 05:50:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b9b750sm35145271f8f.42.2025.12.16.05.50.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:50:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dovecot: upgrade 2.4.1-4 -> 2.4.2
Date: Tue, 16 Dec 2025 14:50:54 +0100
Message-ID: <20251216135054.2467586-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 13:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122696

Contains fix for CVE-2025-30189

Changelog: https://github.com/dovecot/core/releases/tag/2.4.2

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dovecot/fix-musl-compilation.patch        | 28 -------------------
 .../{dovecot_2.4.1-4.bb => dovecot_2.4.2.bb}  |  3 +-
 2 files changed, 1 insertion(+), 30 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
 rename meta-networking/recipes-support/dovecot/{dovecot_2.4.1-4.bb => dovecot_2.4.2.bb} (96%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch b/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
deleted file mode 100644
index a09165e588..0000000000
--- a/meta-networking/recipes-support/dovecot/dovecot/fix-musl-compilation.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 951e371b6e44e2051de83c9fe73c778858fa73a1 Mon Sep 17 00:00:00 2001
-From: Fabian Groffen <grobian@gentoo.org>
-Date: Sat, 31 May 2025 10:49:28 +0200
-Subject: [PATCH] lib: cpu-count - fix compilation using musl
-
-The macros, types and symbols CPU_* and cpuset_t are not exposed in
-musl's sched.h unless _GNU_SOURCE is set.
-
-Upstream-Status: Backport [https://github.com/dovecot/core/commit/951e371b6e44e2051de83c9fe73c778858fa73a1]
-
-Signed-off-by: Fabian Groffen <grobian@gentoo.org>
----
- src/lib/cpu-count.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/lib/cpu-count.c b/src/lib/cpu-count.c
-index 3eb38fa47d8..a3e80e6c157 100644
---- a/src/lib/cpu-count.c
-+++ b/src/lib/cpu-count.c
-@@ -3,6 +3,8 @@
- 
- #ifdef HAVE_SCHED_H
- #  define __USE_GNU
-+/* _GNU_SOURCE: for musl's sched.h to expose cpuset/CPU_* */
-+#  define _GNU_SOURCE
- #  include <sched.h>
- #  ifdef HAVE_SYS_CPUSET_H
- #    include <sys/cpuset.h>
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
similarity index 96%
rename from meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
index 40cf991ae1..4632d9574f 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.1-4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.2.bb
@@ -14,9 +14,8 @@ SRC_URI = "http://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://dovecot.service \
            file://dovecot.socket \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
-           file://fix-musl-compilation.patch \
            "
-SRC_URI[sha256sum] = "fb188603f419ed7aaa07794a8692098c3ec2660bb9c67d0efe24948cbb32ae00"
+SRC_URI[sha256sum] = "2cd62e4d22b9fc1c80bd38649739950f0dbda34fbc3e62624fb6842264e93c6e"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"

