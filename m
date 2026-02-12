Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D70EE36AE
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 17:39:06 +0000 (UTC)
Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50949.1770917941731145858
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Feb 2026 09:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XFXpMwli;
 spf=pass (domain: gmail.com, ip: 209.85.160.68, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-4086661715cso41456fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 09:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770917941; x=1771522741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ptw+WygcpRADyEO+oWro+3kU4V3rB+XOy9VpVxZQBTM=;
        b=XFXpMwliIoQ7bPmUX+igTEZBsjQGvFpMPj+bljsju2LeG9PyoL3mOpuQB+KhvijwRE
         K+nVVk4C2nFwI7oHmm2SX21eiaMwh2ZcROMV1Z9U7Nr00ReGOcNV1nzFtOwGgGWnbyP1
         wBUDnw7fCN3dWu+sMg3V+QX5v5G05vFxjN9psqoT2grailM0nE7OuFyT5QdvbgeTjOn4
         YeHzAd8Ru0yBFxRQQ/pp1nDGgwWvRKudR/iQakh8refr0fZ+Svn+qEKuDwSB6XwaeUGn
         udOOJoy8aoBEGlA7vw8STDLd4uWh959o2EnXdbrpQ/gvc60bf2xxGURBru1IajF7ZMgk
         L9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770917941; x=1771522741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ptw+WygcpRADyEO+oWro+3kU4V3rB+XOy9VpVxZQBTM=;
        b=UzrcaRt4PG0As0VQrna4tOGYdLrXGt9qS0eYaAcGi5YwBpzVSwd/muzoxkiNZTUgUT
         +mGQPl1tVog9Pnirt5fjdkYfpJsCTw/mGqKt/uzQapqtxDjX6pxPeDwdPwTVBRRCs+lp
         q0eQT2EgD+m7hzKLtFb6DLNia0brmSnym1ejz7QG9/iepqTkrR+jVi3ahawAO0IxilpV
         C+yI3ewVAUMY4EZ3F+CtCpNyyOdfh6YfC/dl/wWKxIAmrnuSZoMZOCFSGsl0JGUYMGd5
         fvNcRtX1/wtVp/26AEOa3ngMJo7B6dD2kdtaxz2dTSuA3wzBxCc/fWzN2Yo3d6Mnigmo
         XXGg==
X-Gm-Message-State: AOJu0Yw2FbyIoNFRlgifkWYkQg0B9ihriBKDcN1103efnq3cEfZ7Yxqv
	X4GZ1TZrMkHyfUfDsOIyxtRjkqqF/CbYQfAICIhXTqIp8C6v0gOZglI+P6gpVaHJ
X-Gm-Gg: AZuq6aIhlJV7UNb7/X859iZlfYjieMIn7B7uGnw9IYqXIqDQ5mo8OVIcEuh8oYkGB0a
	9tuL8jiblF5Kdf8QZ3gF6i4ksxAW10hYVfiUyUVLxIY7F+SFB+BVBmOLrkuzb0CaA9VTowiA81/
	6KIVqDY5ZwSoQSE/DX6NaFN45PhlqXt3JG4JlvsKR4N8x0hJIbLebsBnAhowoxa9MIBU/rSCZqj
	QN1TwTX9sie6WJ6q95tV9g+J/xEHAQX/KHr4assTSlOdHLBzQPEI/ZBDrwQRNA25shAo4wCqHl4
	REkpLYH2RGAPzmA0okG9hr1IO6yjK9mCDRnoozWkg4rthCrI49mU3XsG/7otSPGCSjJuqlGCFlD
	etxJXvwGVyWcT9mIOMcY0A1IXQrzn5GYK0upuVMEP8VA1xhajKV8Ap8omps2GNsYwodQveovuaF
	A+0nRR4fuIqjEWiP4tRMd6amg/1SkwaDNNEY/z5BipCHPegYFV3hQU6qKt9oXjKXugESilPum7y
	+Tqom/F3ABcPrfzV61D0QtMnRB/EDOOuQ==
X-Received: by 2002:a05:6871:3863:b0:409:784b:cb6c with SMTP id 586e51a60fabf-40ec6f42373mr2075895fac.17.1770917940690;
        Thu, 12 Feb 2026 09:39:00 -0800 (PST)
Received: from ACT-L-SWD024.yourbase.domain.local (c-73-168-239-54.hsd1.il.comcast.net. [73.168.239.54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf173f5asm4307182fac.15.2026.02.12.09.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 09:39:00 -0800 (PST)
From: Eric Meyers <eric.meyers15310@gmail.com>
X-Google-Original-From: Eric Meyers <eric.meyers@arthrex.com>
To: openembedded-devel@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
Subject: [meta-oe][PATCH] redis: Remove debug paths to avoid TMPDIR [buildpaths] errors
Date: Thu, 12 Feb 2026 11:39:01 -0600
Message-Id: <20260212173901.29309-1-eric.meyers@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Feb 2026 17:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124358

Takes similar approach to valkey recipe seen here:

https://github.com/openembedded/meta-openembedded/commit/1b820b98afd55c881822beb9057162dc67ecb386

Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.12.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 8abf758930..34f426457b 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -52,6 +52,11 @@ do_compile:prepend() {
 }
 
 do_install() {
+    # Remove debug paths to avoid TMPDIR [buildpaths] errors
+    sed -i -e 's#${TMPDIR}##g' ${S}/${PN}-${PV}/src/redis-benchmark
+    sed -i -e 's#${TMPDIR}##g' ${S}/${PN}-${PV}/src/redis-server
+    sed -i -e 's#${TMPDIR}##g' ${S}/${PN}-${PV}/src/redis-cli
+
     export PREFIX=${D}/${prefix}
     oe_runmake install
     install -d ${D}/${sysconfdir}/redis
@@ -69,8 +74,12 @@ do_install() {
         sed -i 's!daemonize yes!# daemonize yes!' ${D}/${sysconfdir}/redis/redis.conf
         sed -i 's!supervised no!supervised systemd!' ${D}/${sysconfdir}/redis/redis.conf
     fi
+
+
 }
 
+INSANE_SKIP:${PN} += "already-stripped"
+
 CONFFILES:${PN} = "${sysconfdir}/redis/redis.conf"
 
 INITSCRIPT_NAME = "redis-server"

