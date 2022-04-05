Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EE9C35294
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.7161.1649169377068769576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D/RKb37B;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id t13so11149604pgn.8
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=isrPmu0v3zDV+WX30NLhuxv/3EhgvABu0Bb9bkQb2Fs=;
        b=D/RKb37B/m8gIakJ65Ybd+7E6IB2/BV10AFws9ODrBk/5PgSknVwJ7VKIFnem3HeMw
         E/bb11+RAzxTZb4d0w2gfiaxAicBILYy09o3DkJjnnXhi3uYkeRj5TGN4kGQuGcvdjt0
         ZYj/OYPSXYZy/D3ymA69QfDcUQhNNtK7ZwC4rs/ZAg2jvxrZUKTqCF052rzcb86fdyhG
         FDJOTUtI9bKGwGeIlw12jkzLo6DiATdcK26+xoDsUtMhNwIag6Hy02J4NdyH03XQm+qe
         4LwN6DpT648FDa4H6WuRlRj0KtSYFs2CR5FmPMpZPWI4WsDUYX7cdR/zj8siZ/IjceMW
         OG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=isrPmu0v3zDV+WX30NLhuxv/3EhgvABu0Bb9bkQb2Fs=;
        b=UZKEwYe2AdtBfilJR0RfgZY59ROb6AMGIiWqcS0/G9CMuP+q+KT7NH5+5jB78fGy1u
         he2moJbMRIXMNoeiOZ8taYh5KN1uTV/4jRiWYeN1Eik/E3zWze4O9IROvTwoOB0K+VxK
         v85ZvKevq9z09S/C0CbhSEnqEoewVFpcSamo1zWdFc7H5Om6p9UlDJp5xbgQlTxQVMcJ
         tf4Um9utZQSMdSbT4R9DQmHjwm58YohPoQpvyX1FVxnb/dY9/tmLujvUhS3vz3+oyDTL
         8oryirjr0m7g6ubheZJ6OqdJ8+C23qxdczbayJNqkkpY+uRSfITamea+d+qbh4KYoaZ4
         4aHg==
X-Gm-Message-State: AOAM531guUtJKvL0XXDOAYMXwpIoGHkkm9oUP5giMdotP/xI99D+wmO4
	t8an9/BTrOV9iecdyHoho66gPre8dKk=
X-Google-Smtp-Source: 
 ABdhPJw3v4ZIckxyZtRaVr0syFc77O7rzckCAryDJmc6zy2ozcTUILQl+nTxnhdKdCo3VPmX6p33xw==
X-Received: by 2002:a05:6a00:2450:b0:4f7:bf07:c063 with SMTP id
 d16-20020a056a00245000b004f7bf07c063mr4056282pfj.51.1649169376127;
        Tue, 05 Apr 2022 07:36:16 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:a53a:5209:def0:865d])
        by smtp.gmail.com with ESMTPSA id
 s10-20020a63924a000000b00399571b2f99sm2758933pgn.57.2022.04.05.07.36.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 07:36:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][dunfell][PATCH] spirv-tools: update SRC_URI for googletest
 to main
Date: Tue,  5 Apr 2022 07:36:14 -0700
Message-Id: <20220405143614.1766060-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96429

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/spir/spirv-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
index ec68edf098..a76c97ad60 100644
--- a/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta-oe/recipes-graphics/spir/spirv-tools_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;name=spirv-tools;branch
 	git://github.com/KhronosGroup/SPIRV-Headers.git;name=spirv-headers;destsuffix=${DEST_DIR}/spirv-headers;branch=master;protocol=https \
 	git://github.com/google/effcee.git;name=effcee;destsuffix=${DEST_DIR}/effcee;branch=master;protocol=https \
 	git://github.com/google/re2.git;name=re2;destsuffix=${DEST_DIR}/re2;branch=master;protocol=https \
-	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest;branch=master;protocol=https \
+	git://github.com/google/googletest.git;name=googletest;destsuffix=${DEST_DIR}/googletest;branch=main;protocol=https \
         file://0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch \
         file://0001-Avoid-pessimizing-std-move-3124.patch \
 "
-- 
2.25.1


