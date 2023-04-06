Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C17CC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 03:13:12 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.149981.1680750783930481013
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 20:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uw2buj/Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id nh20-20020a17090b365400b0024496d637e1so278225pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 20:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680750783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVMP0bfuet9nK4vmTSGDP2cuNlEdXyw1wVtOiKOksCs=;
        b=Uw2buj/YgiAf17Z3/8GqrYZfyfphdbikGwgtSovtwnPXoP6SnFC218AqvSFYgP7Bfe
         mHm3KnSrYXMjM531nulvgZ5oRDD79E43xhs3Ye4yyaoVInQpV+Wi2IZ//Afdd4b9PwQQ
         YNbR3gAPglCKOOZfWgJg/jkyjkb31DaAkUysfgjNY/KXNyneCFfbqUhFaSfunhr9P4VT
         9t/heJ1VRuo7doM87wZ2NT1M+IG/z6szXbsXMe565ZgxQhd+vk4FOc5G75wtXNxQV0SY
         y+zUAsxRHQzeSOtXPAGlHUjfgkTzr6AiVKYWVHcSK5AQllDslwmazK/VKEQnKnuVthcE
         +31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680750783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVMP0bfuet9nK4vmTSGDP2cuNlEdXyw1wVtOiKOksCs=;
        b=eckfdhSbDB/QwQXBA2ApgK+3rW6GVrXzp0NyJAwiPh/AyAYWHNbXl/g/FN4J7dpxAB
         ZwwtY+2y4TZTE1iKI+iOnMD44AEZCrfx/YP4sJLGOJ0kBS0ZHzQKG74/OklzpvZ596Vy
         NH0qFAIq2TGEAYilRyn2qNP259tflZC/LocoHSnTHfaLob5ubNzBdZ0v03XuAX1whXNJ
         HywmbUEsZGQhRsf63uDQwWBAhobYZhWY4ICvrn2PiPg/rrQlBVmDBo83Gt8rz5HT705O
         4rDMWO1RcXFDl/2kQTYURu9EDbfM4SQUgV6QIn61Qanxuh0vWZaRUv5eZ/5OJ41hrf6O
         uV5g==
X-Gm-Message-State: AAQBX9eyyvuPv2WqEIziMTgEUox2mOufGClyopXLavkCuE+ttmRIZ81f
	CTJujvkJTwJs072KXbElGwrek1USpbWLsw==
X-Google-Smtp-Source: AKy350YflZiqsl1IzZLINmW4ZrtfhSo9tk7leIVHnpdFmqBC+fFQXZl1Sr+wI31vfk65EBK7u/Sx5Q==
X-Received: by 2002:a05:6a20:b113:b0:e6:b780:2a60 with SMTP id ed19-20020a056a20b11300b000e6b7802a60mr1559269pzb.19.1680750782976;
        Wed, 05 Apr 2023 20:13:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id h3-20020a654683000000b00502fd141ffbsm95141pgr.49.2023.04.05.20.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 20:13:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] libnet-ssleay-perl: Fix patch upstream status
Date: Wed,  5 Apr 2023 20:13:00 -0700
Message-Id: <20230406031300.3284655-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 03:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101962

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libnet/libnet-ssleay-perl/no-exec-on-configure.patch      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
index 6efa7d8f95..9620df5ece 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
@@ -1,3 +1,7 @@
+Avoid running target binaries during in cross build
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2018-08-27 14:56:24.788544991 +0200
 +++ b/inc/Module/Install/PRIVATE/Net/SSLeay.pm	2018-08-27 15:00:12.847266331 +0200
 @@ -24,20 +24,7 @@
-- 
2.40.0


