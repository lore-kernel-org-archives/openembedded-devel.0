Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234DBC54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 21:04:01 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.17691.1711227838874691570
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 14:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cKXvXi73;
 spf=pass (domain: konsulko.com, ip: 209.85.216.65, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-29fbe140c24so2266194a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 14:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711227837; x=1711832637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0NZH+qtT69EoMA0NDWawV4XkG+nJD6j7k0GpeJptaE=;
        b=cKXvXi73fdQhEEjMmEJjZ59H0QWWdX1GewQbOjEYIworCCq0jK7bAxarMGHyhDk6ib
         Od6TIC6RrhhQuGRAR6Er8fhJf1nkjd1V1cDDj0unLzDW5gHIPTH5gpOQypstravZZYBX
         Ez505xpUpT9Op5JOzIink1G7qbxU0SluKkgl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711227837; x=1711832637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0NZH+qtT69EoMA0NDWawV4XkG+nJD6j7k0GpeJptaE=;
        b=W/QdvW4IMAa2iTUz0t0vXv85C/iN1nPSy1pPogi+iTLmKUSYyq9qaAkTMRt4J0SqfI
         uJAQkFS++F4aAf8c7CBbkRvUxEYQ9ahvaPD5057UBT2qYg7frteqoNAyYARZaBDPSvpE
         Bi7+IGJWB+FMKWnASkP72t2O5BIl6R9cM922CAXtlmDZNVBIj0zwN+83Pk+BgaqfAt9W
         8CTAjF+aLTCSuF0/qz1GBx5PqzHtBQZOXeQnVlqwqb/2ScIatmTwSCipkvrRCmbW8n0O
         qo0A0Pnm5e0m6BUoJumi4ayjsWGs9RAGU1U+dE/OKMvaERCAsFiyZlb+Et6WkZyn8fcK
         2C/A==
X-Gm-Message-State: AOJu0Yw25X354YjG24bKVQDRU38qCzxtts0CM/dJO5w7Y4LfjHlb1cMA
	bIftlM/NtNQ5mmsKq+LPYLQiXiKABPTdxH6jJ8lLsXjbbP093acDHOAlcj30poeVZwWguxdCcvm
	EbVMR6Dqj
X-Google-Smtp-Source: AGHT+IHgK/2d/GsbsL7DUr6YSRtxcqwKDAxhKpBWSk7VbU+0XyO42OXDKJ8ClY7/LfQjNsuBMDiQ5A==
X-Received: by 2002:a17:90b:1282:b0:2a0:5181:682b with SMTP id fw2-20020a17090b128200b002a05181682bmr1403024pjb.33.1711227837550;
        Sat, 23 Mar 2024 14:03:57 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:7342:474:f6f9:78a6])
        by smtp.gmail.com with ESMTPSA id so10-20020a17090b1f8a00b0029c5ed2c9b3sm4039344pjb.21.2024.03.23.14.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 14:03:57 -0700 (PDT)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org,
	yocto@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-java][PATCH] ca-certificates-java: fix virtual/ warning; add branch
Date: Sat, 23 Mar 2024 14:03:47 -0700
Message-Id: <20240323210347.2967400-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 21:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109554

* add branch
* add https protocol

* Fix:
  QA Issue: RDEPENDS is set to virtual/java-native but the substring
  'virtual/' holds no meaning in this context. It only works for build
  time dependencies, not runtime ones. It is suggested to use
  'VIRTUAL-RUNTIME_' variables instead. [virtual-slash]

* Fix:
  WARNING: recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb:
  URL: git://salsa.debian.org/java-team/ca-certificates-java.git does
  not set any branch parameter. The future default branch used by tools
  and repositories is uncertain and we will therefore soon require this is
  set in all git urls.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../ca-certificates-java/ca-certificates-java_20180516.bb      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
index 460d39a..2405b30 100644
--- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
+++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
@@ -17,7 +17,7 @@ DEPENDS = "virtual/javac-native fastjar-native"
 PACKAGE_WRITE_DEPS += "openjdk-8-native"
 
 SRC_URI = "\
-	git://salsa.debian.org/java-team/ca-certificates-java.git \
+	git://salsa.debian.org/java-team/ca-certificates-java.git;branch=master;protocol=https \
 	file://0001-UpdateCertificates-handle-SYSROOT-environment-variab.patch \
 	file://${BPN}.hook.in \
 "
@@ -100,7 +100,6 @@ pkg_postinst:${PN} () {
 
 RDEPENDS:${PN} = "ca-certificates"
 RDEPENDS:${PN}:append:class-target = " java2-runtime"
-RDEPENDS:${PN}:append:class-native = " virtual/java-native"
 
 FILES:${PN} += "${datadir_java}"
 
-- 
2.34.1


