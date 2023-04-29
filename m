Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B61C77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 12:31:35 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.45194.1682771490018755557
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Apr 2023 05:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jMjWsEW7;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50847469a7fso1084478a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Apr 2023 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682771488; x=1685363488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8xJzS+AhvIfbqeZ2AjR8ByKiV+QjHg8FIdkpJEHXSw=;
        b=jMjWsEW7GmBYV24Da2sE90f8ZLEyM7M/Zl5qCcm9Ob86EK49ZEpQVwFKD4QRFJA3lK
         CbXgUwIucrvNWLsJZtEjrufU8R3weQnoFxrn/eCkntP4gQs4SNH9NB4nfmMjo2ClY/mc
         9Jp3C5qxghHlGEx9VA3xFFERvOvJsjfd863usM97AWvOFAnmnkus5Qm0Clj4iOdmk4jI
         bP4Tf21benXmtxshNFYr6RTOKTbypmo0BIx03jjQUrtqMU5r8yjl6lEoYkPajPGJDemD
         3Ab0gyORH2DDJmdBuVVg8mP4GuEBjtAx8co9cZo0Kh1EYxw9yJpEE3DNHxWvQIbEUJyA
         jjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682771488; x=1685363488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8xJzS+AhvIfbqeZ2AjR8ByKiV+QjHg8FIdkpJEHXSw=;
        b=ML3ljwNAJ+69SyF2nyUpAr9IUzDWAWi1j2Dk5BCcN4xDvF4i69nhx2dmQYnot6HUg9
         P3vgdzuBZubaIEP6PtsE1dJBkD3RT1nyjjfteuK+UVoSYOnwlGHinkZe/AQPKN8vJLRy
         SGQMQwhpZjCKh7mVooyYZxyyEodCqKlBLGlrm4m9hSxN36g9zcjWmoY/wHrK9HSvTY29
         0BFII59lxXT/D8e0vrcgluXZYlsfEkWjZulCu7WW5dgkVunIaE2KrL4hWhCHOqX4n0XR
         QWIQeBeMVT0ecFEDz+bwld44WKrdSV/7jmlBNQzmQACyHu6SVuvsFL/uLcJMdouUX58F
         olWg==
X-Gm-Message-State: AC+VfDy1ey6g2qik7zUSC394amI4T136k/CyQh1TC5OfOJ0CMBvqp0+9
	axBBFm/+F+8XImHmJj/zwXPqHjpOrbQ=
X-Google-Smtp-Source: ACHHUZ7Pis6IydJpg3sy4NZDt0OEyNKwBHG+ZGp2vZmtyz+R5SESNaw0jLefMybBt4yyLCl1Mmhbxw==
X-Received: by 2002:aa7:d9d5:0:b0:504:b228:878d with SMTP id v21-20020aa7d9d5000000b00504b228878dmr1357124eds.25.1682771488285;
        Sat, 29 Apr 2023 05:31:28 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z15-20020aa7cf8f000000b005067d6b06efsm10061379edx.17.2023.04.29.05.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 05:31:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] redis: fix do_patch fuzz warning
Date: Sat, 29 Apr 2023 14:31:17 +0200
Message-Id: <20230429123117.808456-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1757EE5FF9922071.29498@lists.openembedded.org>
References: <1757EE5FF9922071.29498@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Apr 2023 12:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102228

From: Changqing Li <changqing.li@windriver.com>

Fix:
WARNING: lib32-redis-7.0.4-r0 do_patch: Fuzz detected:
Applying patch GNU_SOURCE.patch
patching file src/zmalloc.c
Hunk #1 succeeded at 32 with fuzz 2 (offset 4 lines).

There are two version of redis, and need different GNU_SOURCE.patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch}    | 0
 meta-oe/recipes-extended/redis/redis_7.0.11.bb                | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/redis/redis-7/{GNU_SOURCE.patch => GNU_SOURCE-7.patch} (100%)

diff --git a/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE.patch b/meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE.patch
rename to meta-oe/recipes-extended/redis/redis-7/GNU_SOURCE-7.patch
diff --git a/meta-oe/recipes-extended/redis/redis_7.0.11.bb b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
index e6bfa227a0..4626044781 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.11.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ffdd6c926faaece928cf9d9640132d2"
 DEPENDS = "readline lua ncurses"
 
-FILESPATH =. "${FILE_DIRNAME}/${PN}-7:"
+FILESPATH =. "${FILE_DIRNAME}/${BPN}-7:"
 
 SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://redis.conf \
@@ -16,7 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://GNU_SOURCE.patch \
+           file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
 SRC_URI[sha256sum] = "ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3"
-- 
2.40.1


