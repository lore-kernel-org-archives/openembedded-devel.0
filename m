Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5166C433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:40 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.25679.1651346313783431476
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DjqZZhJt;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id n18so9699595plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UBLL50NctMqbYNTdqnVB3LcrHXNTKTf6RJCVojTJo6E=;
        b=DjqZZhJtz20xKPeUUO4yt6XRyBLy/yHQRPoE1wC/5bkOzCCKLJioYNsdyb60mW6dtY
         19O2TrauLxsztAL49rlwIvud5ifDhyAkTkolhM+Fv0ZNWAbe4RYB/6sbmkxaQUyI6HnT
         z3d0k51WrFmr7Q0V1REcAIVEYlMbUZAgqBL0jwDRtY4IaKAVYbEKsju3CUlNkRRKbbdk
         JrcDaARHUzNe/FERK5Blsh0Z0hgoKaN9kZHDprNx9xN/ugSOPhrCjdLzsgUX1rqKUl3f
         Kct8PrFzoZgQu6qetZ1f7q2/kui5MV4DxWmmj5tgRq+3KwBc3JiAcEY4wnKkQNdkwIZ0
         kFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UBLL50NctMqbYNTdqnVB3LcrHXNTKTf6RJCVojTJo6E=;
        b=weFW/MVPFqRTsSzXPchC/594Kv/t7iAYJmMw+iowrHmtPlhxzpeFY6NDK4pBmJdQWR
         ZgUZf3tJN3q/i7Ke9rqlQ9+KC3QmMELqo27eh+49AXr0DCXiob1PYlizx+qxgELZWv7K
         gSowYJWcfNK7tAu8uz5LoQgjvK3YiEUxztDBwZFDxdqnTjO+zxxD7D3kWO0vwyfTa9zv
         6Cj0xrZ6spPlL95qE1ZqBrbVNRxMfkrcDuA+pU8+hDMKQnIOgRKZAA5iPfSdIhXq3fwN
         HUs2etmxlRQRuw/Hw1Y8Qjob3oY0snYoOEsuqTyJD8KfLlc51Dv45q43je+yDbyT6pdT
         nCdg==
X-Gm-Message-State: AOAM533DNxjuuS0nNl2TTALpUhF3LWLx79viCcSINZcxZU7vxv1iWnHc
	DdUjD/oM8P0dnoxS94c44BUzA7Kf4ZO6hA==
X-Google-Smtp-Source: 
 ABdhPJxBS1Ss/pmsL43V6Mf/NryBtyRlvw8FjsI+w/Ha/SjSqCYZ+EXyCmCOEOb+fT5EjLksBgDdgw==
X-Received: by 2002:a17:902:b682:b0:15d:29:9820 with SMTP id
 c2-20020a170902b68200b0015d00299820mr4710907pls.134.1651346312880;
        Sat, 30 Apr 2022 12:18:32 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 05/39] fluentbit: Fix build with usrmerge distro feature
Date: Sat, 30 Apr 2022 12:17:45 -0700
Message-Id: 
 <19c20340f313a10b825c413c6459aa77017c88fa.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96872

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ae8e0ae77f74d966d687fef38bc1bccc76268f8f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...nit-install-location-with-SYSTEM_DIR.patch | 28 +++++++++++++++++++
 .../fluentbit/fluentbit_1.3.5.bb              |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
new file mode 100644
index 0000000000..b90a62ef19
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
@@ -0,0 +1,28 @@
+From 5571f949fa2048b79c197b5b10a11ecb1891cbe9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Apr 2022 08:24:34 -0700
+Subject: [PATCH] Control sytemd unit install location with SYSTEM_DIR
+
+This helps building when usrmerge is on
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -323,7 +323,11 @@ if(FLB_BINARY)
+       "${PROJECT_SOURCE_DIR}/init/systemd.in"
+       ${FLB_SYSTEMD_SCRIPT}
+       )
+-    install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
++    if(SYSTEMD_DIR)
++        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION ${SYSTEMD_DIR})
++    else()
++        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
++    endif()
+     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
+   elseif(IS_DIRECTORY /usr/share/upstart OR FLB_UPSTART)
+     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index 670d596cad..e586262a60 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
            file://0001-ppc-Fix-signature-for-co_create-API.patch \
            file://0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch \
            file://0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch \
+           file://0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch \
            "
 SRC_URI[md5sum] = "6eae6dfd0a874e5dd270c36e9c68f747"
 SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781a9c789"
@@ -47,7 +48,7 @@ EXTRA_OECMAKE += "-DFLB_LUAJIT=Off -DFLB_FILTER_LUA=Off "
 # Disable Library and examples
 EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off -DFLB_EXAMPLES=Off "
 
-EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On','',d)}"
+EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On -DSYSTEMD_DIR=${systemd_system_unitdir}','',d)}"
 
 EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
 EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
-- 
2.25.1


