Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731A7EB64DD
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 17:13:14 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.48359.1691773990110593440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 10:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KlPb/Mzo;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-686f1240a22so2113761b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691773989; x=1692378789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT1IXl8McqGru5v0J+QOpr0aMUvPCq9xgDBr3n4BkL8=;
        b=KlPb/MzoR7tq994oZ6dwngNznobaNq7fpzbdxdfJ/XAyWoZIx2LXufJDoLo9QMxI1v
         QCQlx3fqF2p1GyUxZW+kGFD44KO9Xl4tyCR/Be260UB6TvSQMfQ2lg635VdPmg8bU1I5
         NI1CFgPeseKvGnbBYbDrIJUTUDtSC/JeGmqUCAdIWuoszxit2kT1diZCKYCs11XSRaTD
         0FifLx2J/hLeuH0boXWEa5utB6zNuvkkd8K4nIInwyTdL2gVbyU55lFZqmG2HNYFgmUN
         IYT1YyaigNRQR8RytSLJexAkIlOjkDo5TFdKE4fyXYw+C72O46E94DAKF3LkQnf1eB0G
         XLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691773989; x=1692378789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LT1IXl8McqGru5v0J+QOpr0aMUvPCq9xgDBr3n4BkL8=;
        b=k5BqHIjAHFxWAReHjLEQZEcy/+mzeQgLxVBKAV/duabFsfPB9+xYMVjq7jAbnVFpRk
         ivOMFirPcuKJBAyLRWQaYJ2VdY8h+KoQBcB8sVeOPvTCdVN0Fo8/in98axkgrYJuGXz1
         jbvIFX0EOIW4CxNcVUyaIfRjmdBtzZuSw28E6xSMHgtYY58pUq0pY5r0qnRiOnJsaVex
         SyxvK3hEqgkgZUVz4GMD31N/u2HZVOd2XAhk9xplIIvY2H16eBh9AMTNnS7LkMpvpANX
         hlPygpsKW/hk/wNXpKGciwAwczSElxZUB0FTk/kb9kYdRbuD5TwWlaILTF6848o5D0H0
         CRFA==
X-Gm-Message-State: AOJu0Yy8SYLWC0ivlDnmp7ivZtOHfqOkSvc5lfS4MylsSfQI/liPyZEd
	b6/jQ4U/bSccJAN8GMiyBREp8HbkHR8T3g==
X-Google-Smtp-Source: AGHT+IG7XpDsKsjBgntnc/iD8wjm+SJABxNTmrU089VS44peMP/GJ+OxCaoYc1xj141yWo65Osh3Rw==
X-Received: by 2002:a05:6300:8002:b0:131:3598:f4e9 with SMTP id an2-20020a056300800200b001313598f4e9mr2750657pzc.32.1691773989393;
        Fri, 11 Aug 2023 10:13:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id j18-20020aa783d2000000b00662610cf7a8sm3670572pfn.172.2023.08.11.10.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 10:13:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] gosu: Define SRCREV_FORMAT
Date: Fri, 11 Aug 2023 10:13:05 -0700
Message-ID: <20230811171305.1135317-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230811171305.1135317-1-raj.khem@gmail.com>
References: <20230811171305.1135317-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 17:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104344

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/gosu/gosu_1.16.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/gosu/gosu_1.16.bb b/meta-oe/recipes-support/gosu/gosu_1.16.bb
index b209de16a4..70c7275bc4 100644
--- a/meta-oe/recipes-support/gosu/gosu_1.16.bb
+++ b/meta-oe/recipes-support/gosu/gosu_1.16.bb
@@ -11,6 +11,9 @@ SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
 SRCREV = "0e7347714352cd7f2e5edc9d2cf838d9934e6036"
 #v1.1.0
 SRCREV_runc = "067aaf8548d78269dcb2c13b856775e27c410f9c"
+
+SRCREV_FORMAT .= "_runc"
+
 inherit go
 
 CGO_ENABLED = "1"
-- 
2.41.0


