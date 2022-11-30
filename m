Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0979CC47090
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:01:26 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.22653.1669838480220284607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cknde3mF;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso2646939pjb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 12:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCAzcv18vCJj+sub/6YsKodER3aZj6PEMXDG0vhENOQ=;
        b=cknde3mFUsDrshD1Ig6yqEAtfLYZ0AWaScertLVP/mCRyN9eq6iybWSTZVQojENPbb
         0jCfPVuoHxQGEC8tgvv9sw8usDG/lR+sI6hBhrfZaQxFv9SQq/0s2lcCfNXTEQQ+hMlJ
         vJ97iJUTkc27BCanpjqij+ixjSuvRorHkOZ0dY8cyOXbGYJB7rEmr46AIgXqyLlFBFNG
         tX03DvBHWrm66GADRNK7tK4m3kACrveU4ZbwL/rXm1TKRnhzTczKJuawoSh6TAJiodxw
         UXIxypCJIkZUYJyrgK9xTyKWv/Hdw3M4szzd0JQVxP6lAHsA5uoTbJWYmi6siQsunlfI
         rr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCAzcv18vCJj+sub/6YsKodER3aZj6PEMXDG0vhENOQ=;
        b=iEqxcAXyfDewoxbnq71iYd7YQn3wHmyW5CtttT//Fry3UIRLMW0OOwmWeaNQsaSt9e
         pQnaGFO7xakni/4/KM22395xykJ9iPdJp1qd1Yhg39S8GTfMMLZ2jnWjHD/PSI5AA4cG
         Jrp17FlOhqTJ1fwqm7ddkmCrvzoDbXOYNAHYSvis7A2MWfaZ+lfOqaK/d8CO5baIANiH
         gh/obJfJRwgBms3s7H8Z2deYhT1Kfsd8h8lo9jco8DWQ7+oYwjMGT6GU7N0TLr0u5YAg
         xcL4CXDSx9LCdRqfcz6lhP0ntu4ZytWvZWL3rEmfnk20cugjLoat3gxAsNYf15hQ3yK4
         5l8g==
X-Gm-Message-State: ANoB5pl+XgsykQPqdFlQruqcF2rTwl8NupRpVaKfrmncjzcyb4oJ7gM+
	yZaW2wVSUG/nV7gl4fUjPT013IFLxA4=
X-Google-Smtp-Source: AA0mqf4O2fzFW3F8IIkR8G3GmsnDyMfnByCBOLELFP+LjioI9Tem/evjjAOJTREGwN4fJcF282QBxQ==
X-Received: by 2002:a17:902:c085:b0:186:ff42:704d with SMTP id j5-20020a170902c08500b00186ff42704dmr46787481pld.153.1669838479275;
        Wed, 30 Nov 2022 12:01:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id ij22-20020a170902ab5600b001893a002107sm1916026plb.0.2022.11.30.12.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:01:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] uw-imap: Disable parallelism
Date: Wed, 30 Nov 2022 12:01:11 -0800
Message-Id: <20221130200115.1954308-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130200115.1954308-1-raj.khem@gmail.com>
References: <20221130200115.1954308-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 20:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99873

It fails on highcore machines

e.g.
| make[1]: *** [Makefile:697: rebuild] Error 1
| make[1]: *** Waiting for unfinished jobs....
| make[2]: *** No rule to make target '../c-client/osdep.h', needed by 'ipop2d.o'.  Stop.
| make[2]: *** Waiting for unfinished jobs....

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
index 9fb12b26e4..29c4b20878 100644
--- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
+++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
@@ -50,3 +50,5 @@ RCONFLICTS:${PN} = "libc-client"
 
 ALLOW_EMPTY:${PN} = "1"
 
+PARALLEL_MAKE = ""
+
-- 
2.38.1


