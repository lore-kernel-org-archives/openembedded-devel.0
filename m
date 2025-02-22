Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7ABC021B2
	for <webhook@archiver.kernel.org>; Sat, 22 Feb 2025 17:00:44 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.50333.1740243637880664499
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Feb 2025 09:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YVv8NyOE;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-219f8263ae0so65933745ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 09:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740243637; x=1740848437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GnEAXHOZ2PDVomgrKnJ24m3yh9aHo5VjafVaaxlRTM=;
        b=YVv8NyOE+ZCwmiNhnAzsvxxwCO8X1E3MUD+DBsLf6QbBCGfwEnlJH1XOmN9wgqSRJ+
         DY5Hfv30jlIX5342QI+/zrOybAFI0TmrxPOGjwDMcK5rDvq7wNuVIP+uLz1RossiHSuo
         AHp49PWH5pXwUYz5aZPC2ssN5zskgZ9uP9JclmiH5ygNv/Rcq2rJbHbNf51V+1X4+lSh
         ArVfUrQao9u9vs5SAQJPDjvOXpCC0IgYHOEeGjL5lo+LBUT+1yCM/pAt3V/IQrAbnsxM
         ZIDpteen23vLnaIO7jCQuG51ttJ8ZF0rwUnTTdKMlNowRsajFO5JzpEO1UNuJjgVrfJK
         qiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740243637; x=1740848437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GnEAXHOZ2PDVomgrKnJ24m3yh9aHo5VjafVaaxlRTM=;
        b=MYsCiHA2dzU0Lcof2lX55K8GOFLYb34D3TldySvWl8DsVn1ktb4/oRBHEfOAWaazRx
         6Svb1HJSeW9lbIWDpkUH4ma/RlhkNGJzt/qFYOwisP+BWmXclOCgYLoS2X/G6GpanBKN
         MEPAnOjP5Fk8TI26ypl7ZO+6Aj82jCTZKu/+fjHndpsFAvRJu7CYuq3O+yvlhG2sks5W
         kOy+aWZbnPAvpKGou1BrTiN22hDGxxPW6R5pII4XawTwlqJe8xqe+m+TTrPLBHgghXt3
         hxFe65o7R3tpAfxbXMfc47yhoiZrcriHzFLIJVRab9Ehl06ZsyYt+kVvTBYEWfd4PSn+
         pthg==
X-Gm-Message-State: AOJu0YwubKweeODhM3OQgH8m2Stlewh2csvlnqyUWxNzx0TdeXav4iD6
	/uQ+8LXXuiYg8EQNU4XPwti+XOkSYUapNCFzVfjdf8izsEmxsaTcsCWO6X2Z
X-Gm-Gg: ASbGncuXMWFWNfhT6BBlOQNFdLI9WwJCUAmjDYJUTMcqFwq5DEA2xNKWOB1ef6/L/pR
	hXRyc+O5EAmFQvT3861Oz/YMgK0LRxRCAtiifcYC/Co/CxPQsTAHf8nPEXFkstzW/HEwvLQwepg
	rbdSklIzlWmBhChzNkN3BsH1toZk9QSp30clpQBCeionMvVtdHTHQoc3OYCYBEyirlDkEeRcanT
	k5YXr+G53O/K3G90itpgEkOTlVr1qR7rl0Gr22UY225/TR35IBXX16eFxy4pswMtgDxrXSsdUyr
	mB0JsS4mNuOhn63sRg==
X-Google-Smtp-Source: AGHT+IFYsjG98KuO84+PmXlnQ0+jLvePsWih1VhD3IwEIewW2PGdQaC2h0u/cnTv1u9BkPdTmP1dnA==
X-Received: by 2002:a17:902:ce8c:b0:21f:522b:690f with SMTP id d9443c01a7336-221a11b9bfdmr116813445ad.46.1740243636846;
        Sat, 22 Feb 2025 09:00:36 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::b976])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d643sm152366465ad.126.2025.02.22.09.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 09:00:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gphoto: Fix the sed expression to remove --sysroot from config.h
Date: Sat, 22 Feb 2025 09:00:33 -0800
Message-ID: <20250222170033.1061080-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Feb 2025 17:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115541

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index c53504378a..6a2f7164b5 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -20,5 +20,5 @@ EXTRA_OECONF += "--with-jpeg-prefix=${STAGING_INCDIR} \
 "
 
 do_configure:append() {
-	sed -i -E 's/--sysroot=[^ "]*([" ])/\1/g' ${B}/config.h
+	sed -i 's/--sysroot[^ "]*//g' ${B}/config.h
 }

