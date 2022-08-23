Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF294C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 16:51:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.295.1661273487436930493
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hJnA3Sv1;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id y4so13333501plb.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=sxkV3Sg/BsEsmo9tpTAkWGHQ7P5RZ7sixcR+cyOjSQQ=;
        b=hJnA3Sv1+M9DJQKO5hg5UqlcyP3XZpj05OwqpndcrKECJ0k4MDyWI7qfe/xvp2ceLG
         5ObkG/Ox8YP9dehvsEN/DllklcIdIuRaBmJxvtgXgBEPDrF2MsxghthJhM+Rg3BDmWoK
         jSR/4ZNqwU+9TbLuF4tdTKn42mhbBxuxdiB/uHn7acxIogWIczHVTPKKRRSNmBCuxUFN
         eZ3rTYDj6jFu0IfDGh84CIWVSMeajWqvYRgFpJ6+i6isnp26pmE3sH0KAb2KVB83o26K
         3a36X2uFEJlhELam2DforAvVZ7gLOB6NhOGzavDOMdhK8q6ojDsEoz1vi3+hORe/euA7
         sLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=sxkV3Sg/BsEsmo9tpTAkWGHQ7P5RZ7sixcR+cyOjSQQ=;
        b=NrBmgAM1j1Ur9mWFRGCKtNtm+ker9rE1/gN2CLM6+JpiziOGcUe4cG4GkR+9Qn5TKS
         GjzkW8UZLrs1FrYcVYL4kDar8NfULLvU29Rjyk/SVsYuJZ8uZ6DbN72VCrWTC1wiqzEA
         AQj7IV3jmfy57NzehYprlILz9p729a/N057wetHvBpw4iGWvbON5G86eN6ag7AAwhUsC
         ZA9XPlxsgd/hVgpzCFz0GKlMLfvDCYufcK563D7MjKxhz6a8P+vEh12lUnZXQJw+NZ22
         izYDKEqZowxYWfMFZzSlOK9xC75N8xc4ela/nfe7Kq8F8x4ISnGivGrcp0DwenHTBoUA
         qBKQ==
X-Gm-Message-State: ACgBeo0Y5I6Qhyv/HUDcHfeOmQfqRYMPFvAmfHToHixHY1r3AgmVwPMB
	Y6a0xHR7yDrUONtjwxuGh1yYm9EWgh6IkQ==
X-Google-Smtp-Source: 
 AA6agR57mtm5YF6OvH3KYZ5o/J9W5OU4XTTDpxHXxx/RCwTck6qPN7aPWqBuaI9iOC9dJJxOdGZ2aA==
X-Received: by 2002:a17:902:b60e:b0:173:104b:45f7 with SMTP id
 b14-20020a170902b60e00b00173104b45f7mr798525pls.67.1661273486598;
        Tue, 23 Aug 2022 09:51:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q18-20020a170902f35200b0016be834d54asm10596856ple.306.2022.08.23.09.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 09:51:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/4] cpulimit: Define -D_GNU_SOURCE
Date: Tue, 23 Aug 2022 09:51:21 -0700
Message-Id: <20220823165122.3248107-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220823165122.3248107-1-raj.khem@gmail.com>
References: <20220823165122.3248107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 16:51:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98395

This define is needed for getting memrchr() declaration

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
index 3ee2b5c239..86a58beda4 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -18,5 +18,5 @@ do_install() {
     install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
 }
 
-CFLAGS += "${LDFLAGS}"
+CFLAGS += "-D_GNU_SOURCE ${LDFLAGS}"
 
-- 
2.37.2


