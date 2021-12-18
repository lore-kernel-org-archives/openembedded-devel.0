Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171B8C433F5
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 19:00:14 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.8371.1639854013728530823
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZHW0Z6xg;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id z6so4712999plk.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Nok5EUlmRVLJ1FDtEPmx/hCcKKpbqKjJR4Us1qsC/UE=;
        b=ZHW0Z6xgbZdAnFzvqdi/QoJonWmFAc5OTvzHAJo2NZNH+GKepwORFaRMuIReysL7TY
         gwsp0VRUeXND3yKzKTCARE/XS8PCjTnMuW+43V6xtdGYllmCS2o1MQP9TVyDLRH3PidK
         FIJxMwk1Gm7W07Qhy3RDRARD/+Y/p8MYYjLsShdnhAcD6IRjgW2aGJkKrpY4fVdBLRkR
         EaeLCqYWyrws3pzaBEf3DUow+rpYv9AipcVWEmr2nYDaGdDLf0E9xzyPhGTgKZETDNam
         7iuIE4viK1zaL4FsadQsN9RlLvwHX9FT3bU/EJiZhDgWWkDvGeqCvZu1vhC/IXeNDDrC
         4CsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nok5EUlmRVLJ1FDtEPmx/hCcKKpbqKjJR4Us1qsC/UE=;
        b=2KEImDiA7C7nT/qrPrL0QJOiL+1ZYRH80NGzAu/piSULAAQ+XaiolvpGlKN+PrhBkX
         ej77lRsXeU75isqRzRg18r9ovqFOPQZMZEaraD8BOIyCrhSv9lni7nlQZO+lUJ1mmEUz
         DMTjgKJctal3WFW4JYQZCk3Q2SN6a9ifWTFxclbMD/IRD3VjNBnWgWUoSuJ7qnh8tKzO
         eQHdOEjWqKxCDaGOn/GOZwBYoPD729NTx5Tf4m4TWAzHeLXcyTQgzHVyzTU3R+p7SZ6O
         B1NiWQuO4UuP7c3dxoVeUmCe+SNS1UQ3mgrcjLF390nKyfoa1ixhTZQP5E7QQ8hiWrNP
         RwsQ==
X-Gm-Message-State: AOAM533aXJYTj6GtHOzGGOoMIT/tI6Lh8T07upqUbO7/cPv3P6bIkyes
	cJtOHuDoIT1fVMICzrpFUGmR2Jm40Zk=
X-Google-Smtp-Source: 
 ABdhPJzJ1T2yWH4PIX7ouMZ8wiSJ29rSdu+8V1xuYOUiGdAUp7RVkudF0FshEkG3gRlvBf3VPoS2LQ==
X-Received: by 2002:a17:902:ced2:b0:148:a3e6:b48d with SMTP id
 d18-20020a170902ced200b00148a3e6b48dmr9222960plg.103.1639854013042;
        Sat, 18 Dec 2021 11:00:13 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:8259:344d:2281:ae46])
        by smtp.gmail.com with ESMTPSA id
 j6sm10371127pjv.35.2021.12.18.11.00.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 11:00:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 9/9] redis: add back missing patch
Date: Sat, 18 Dec 2021 11:00:02 -0800
Message-Id: 
 <1cf3147f66746cd2573a88bfca93cc94ba1c0cbd.1639853918.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639853918.git.akuster808@gmail.com>
References: <cover.1639853918.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Dec 2021 19:00:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94437

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.6.bb b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
index c129e61988..202fce16bb 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
@@ -13,7 +13,11 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://hiredis-use-default-CC-if-it-is-set.patch \
            file://lua-update-Makefile-to-use-environment-build-setting.patch \
            file://oe-use-libc-malloc.patch \
+           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
+           file://GNU_SOURCE.patch \
+           file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
+
 SRC_URI[sha256sum] = "5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055daa8b5c2317ae131ab"
 
 inherit autotools-brokensep update-rc.d systemd useradd
-- 
2.25.1


