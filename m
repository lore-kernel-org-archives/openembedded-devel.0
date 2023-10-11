Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C89CDB47C
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 19:07:13 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web11.25347.1697051225614835015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Oct 2023 12:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=myyUqArS;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-79fd60f40ebso3449039f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 12:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697051224; x=1697656024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0UGzUCyvaw5zrsNHWrN7CsLJurwNsIQGKm1L13OltSc=;
        b=myyUqArSW8rGFv6HxFLFngjJMR0eU8doCC0f5KOZnJ2d5goPQb3dzbQmynGeHTZuae
         y3bmC9ux0/gtxehreCzBSVACIpPmnw2sPFkE1Bte+UOulk4qWRejr/ass0nDFor3qiyo
         lokYQwrV4FGsyk51x42MqY/jKfclvqqRokULya1qiWCIuHAvScZ74rL1ny7lWyfTqeiO
         66hRbh4SDVXiTVx4FH8sinPkZNXF0AuKONd+fusL6zLLgH0kLfCry2naIZ2x13bxqugh
         WewK5bDAxxN1q/RwJTAIIQi1HRkis5T52EmTq7s6mjb5p1jREwmrdrw2x68ci7SKnTKO
         dGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697051224; x=1697656024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UGzUCyvaw5zrsNHWrN7CsLJurwNsIQGKm1L13OltSc=;
        b=dZaC3daJ7zMpJMXti+zJzXTJ7fmlu2jvehnkg/wbpb2cf0hpGEZfy1qmav9p7hcXxh
         5XKhEzEAhSS1CkBIDTkrWuZ/GOk6+g6u+fXfFEeiXAUVF0izWG8vqLHZvjR5dQB54+51
         xa2TOMH6qpS4CqIWBtWwH4HZ4Zlx5kZj0ZPJWQ39dsn2/h6o+Ac0tXN03bkBGMoT9vnY
         lMxeijZlGcm4+9LM8bwW5mailMH8YIswZb5fjXRQoELx+tz42xtsdN0WYF41SrpNQPZ4
         cTu7BkOaSUXxHgAgtb6jOSiEazPjaBDPrj6YNQCLys5c8NqicClGFGN6Z1uAv1MJqzDk
         1ohA==
X-Gm-Message-State: AOJu0Yy/SjdnT5ECfUY7cpNLCzGqVLjZr2Xt9ainbsd9ARv5jBzDEU7x
	gqgRKE1YtjB3gWCnbIFuAcSCcdVt4XwfOw==
X-Google-Smtp-Source: AGHT+IFAUtyURt6+j+GtbWRPso0AshqWT2DjbKKCwQU4b4VItkNfEqC0S6vACe/mOxyzEFEP8BzrCw==
X-Received: by 2002:a05:6602:4a07:b0:7a2:50ef:66e1 with SMTP id eh7-20020a0566024a0700b007a250ef66e1mr13885981iob.8.1697051224538;
        Wed, 11 Oct 2023 12:07:04 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8-20020a5d9c48000000b007836c7e8dccsm3658465iof.17.2023.10.11.12.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 12:07:04 -0700 (PDT)
From: Daniel McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Daniel McGregor <daniel.mcgregor@vecima.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [meta-python][PATCH] python3-pylint: allow native build
Date: Wed, 11 Oct 2023 13:06:50 -0600
Message-ID: <20231011190650.622937-1-daniel.mcgregor@vecima.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Oct 2023 19:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105436

We use pylint for some native recipes in our build. Allow pylint
to be a native recipe, and likewise allow its runtime dependencies
to be native recipes.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-dill_0.3.7.bb     | 2 ++
 meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb   | 2 ++
 meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb   | 2 ++
 meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb b/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
index 2f80187b2b2..cdf6fc74edf 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.0.0.bb
@@ -34,3 +34,5 @@ RDEPENDS:${PN}-tests:class-target += "\
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-xml \
 "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb b/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
index b6b788110d9..673964f3b70 100644
--- a/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-dill_0.3.7.bb
@@ -15,3 +15,5 @@ RDEPENDS:${PN} += "\
     ${PYTHON_PN}-profile \
     ${PYTHON_PN}-core \
 "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
index a2c72fcc997..265b28a7715 100644
--- a/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mccabe_0.7.0.bb
@@ -9,3 +9,5 @@ SRC_URI[sha256sum] = "348e0240c33b60bbdf4e523192ef919f28cb2c3d7d5c7794f74009290f
 inherit pypi setuptools3
 
 DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
index 413e6599db1..bd2faa5b5af 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.0.bb
@@ -48,3 +48,5 @@ do_install_ptest() {
     install -Dm 0644 ${S}/tests/.pylint_primer_tests/.gitkeep ${D}${PTEST_PATH}/tests/.pylint_primer_tests/.gitkeep
     sed -i 's#/usr/bin/python$#/usr/bin/python3#g' ${D}${PTEST_PATH}/tests/data/ascript
 }
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
index e86a3c78981..59e83e00db7 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.12.1.bb
@@ -27,3 +27,5 @@ do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests
         cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


