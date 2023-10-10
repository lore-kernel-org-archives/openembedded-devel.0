Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C95E95A9F
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 10:18:57 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.87625.1696933135219708660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 03:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=as4JsesI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53d82bea507so632104a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 03:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696933133; x=1697537933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zVgzk+ness+bNKJN3E7HSWrZXT62Abl3Co+KAbR5N1A=;
        b=as4JsesIlP3EyeRoNQrGgrQahMhkgSjtWOTLGyqco11oGiOQm8Hx3ENPptee+bRq+n
         Ssy/H9bZz/j7zh432ntB6RhMHeBTheH+D3xQHMjudM0NFknQftqHYnWf4RmJICNUkpTp
         umxRg3zjHhn0ne211K4Np8zFDuIN7uFwsbkV6M7VoX39GorKFp0yDqdMIbNnD/ovDEuc
         ZOqbsB6yoYmid7gIComTDKg0Xnw0XnYSVM0RRm6cgZRe8XLErOgAj9wwcvQwZ76mWH2l
         41LuiSky8kHjiYjHCUAzAmiO9rHGcuOvRWTsgnAiRfrzyF3AUB1o0tOuBBhkLzu6P655
         Q5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696933133; x=1697537933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVgzk+ness+bNKJN3E7HSWrZXT62Abl3Co+KAbR5N1A=;
        b=BhhxICldUGR2vBuo2jKKVdnSAfkIH7eWQ/XP1Mhg4q3gFBTF0bAmqKJn190wJP8vlL
         D2rcmCZa75V8emI8NWBa3cyAp0GQw8syex2/5WNvVF8vaZrMoYTPSy/Bj90r/rF7l0on
         CCTl1gpms7y27JnKRNjJ9KWZOAEbR2r7ZZ4gz+HRipFWm6TGSt4Nwrqey4mzF1sB3RM0
         6Q7Wj93kScytY9SR5Y2cXuY0WGboCKuGSkNtOtjz7jYfbOiVB4QkjwIghm/iqCepml9x
         FO4pO3wTXBFKOJ5kjmAdp1CdW/reRe9OcYd+B/HpAHQRHSTUsfUNi8TmeOuJkpcxMCOP
         9zWQ==
X-Gm-Message-State: AOJu0YzoErZfGeqPOdC89EAy8Anwk2Gv+pEF58+iUuwabTyE5x8K7RWs
	h+51o4R+R//6G+Vv8n4QDkxTGRIEfeEkEg==
X-Google-Smtp-Source: AGHT+IFzy5nBfc8sGPV++ylAapXg8wiiqHv21h1CGvhMhVuRA9hVqr0CIBvhq5QRjtJhY43FvgFJpg==
X-Received: by 2002:a50:cc0c:0:b0:53d:a90e:be90 with SMTP id m12-20020a50cc0c000000b0053da90ebe90mr238135edi.15.1696933132882;
        Tue, 10 Oct 2023 03:18:52 -0700 (PDT)
Received: from Unimatrix08-Jammy.Abinsula ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id ba10-20020a0564021aca00b005346bebc2a5sm7395649edb.86.2023.10.10.03.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 03:18:51 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] cpprestsdk: fix typo in comment, tag is actually 2.0.18
Date: Tue, 10 Oct 2023 12:18:48 +0200
Message-Id: <20231010101848.2377814-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 10:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105404

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb
index 1633412cf..36545503e 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.18.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-float-tests.patch \
            file://disable-outside-tests.patch "
 
-# tag 2.10.17
+# tag 2.10.18
 SRCREV= "122d09549201da5383321d870bed45ecb9e168c5"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


