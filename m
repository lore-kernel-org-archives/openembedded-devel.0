Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837FAC4706E
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 15:11:36 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.25179.1703257890347049576
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Dec 2023 07:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mqNu7Y0J;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55361b7f38eso2400298a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703257889; x=1703862689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zkrMY69GOfT2058EwqnqZeExYaHdjA1Cf8zbMOyexc=;
        b=mqNu7Y0JKdRRH0X1M5UzC6ro5lVsSmJB5utD+WmHSfuAN6wRruOgp/lefHFo5XMDOJ
         7k3PdlY2Nnv+PP793mVnbfu4EM0IzFK3TGcrEpaBiJImcSG4+lmpFfPPcbZeXDHZ5Lzj
         PJVwTGeb/8h/YSpq50DnpD3sWcqOh3mf46sjniPXwMYAEChjje+lwGWfTrqcyD5Z3n0s
         Z/GBA9+sJOqT7DcbE5T3rOdHbZdPIkuaTymXRmwgl0oOUEh6vd0LKzqRm3eYkPd6+Ci4
         jKpb1JZJtS5dAeafbymDSEgN7AlFcL+FEvs7CynmKg3eDBTXFnQZyx7xXELAgjHH+lOr
         02wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257889; x=1703862689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zkrMY69GOfT2058EwqnqZeExYaHdjA1Cf8zbMOyexc=;
        b=tibnt2lMLKzLIjeXmZY1ez+KVpkAQaA10hpzOPeQv8IWLrzhAi2pdq4E9TnTtmSp1l
         9LQiFtfcg/Drcn5X2RzZv0jdVQjs/roV/MAIyJZRX7L1GIgGWZ3vTGV6MRfFZ16tWzeA
         te08ETzgSMKD/xLbuduqlLjYCYTKnaHI5joMphxUHqC8Ed6MqCdAagg4SYYmFDXrjxw8
         s3aOJBHm2Dl6KT+XhHkxZE+1N9aO35laZ+MHhF71fyuP8XzlI7eQNQOO5z4vMsdHS2vY
         GBTJBjs1R05LoljQAdSb5mLFJWUpkCjamR7WdE7wR10l46kfGzPDbn5Q5KFgAOB8KfAP
         +9ew==
X-Gm-Message-State: AOJu0YxJL+xdBjf/6ocSOIYf7lNqDWMfvjjH8A4sCChefHXm66cmcZbF
	mu/zwVwUkvFNCC0sB6g4gYRmVK/ge/DQNg==
X-Google-Smtp-Source: AGHT+IG+rBvV92WqWMLQBioBG0iEHUgGgtSYMq/irSmz+1Y3Db67IZyLpNH64//F9eP5HO3SH7xfXw==
X-Received: by 2002:a50:ed11:0:b0:553:b473:6d70 with SMTP id j17-20020a50ed11000000b00553b4736d70mr477547eds.120.1703257888828;
        Fri, 22 Dec 2023 07:11:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7c2c9000000b00552666f4745sm2650247edp.22.2023.12.22.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:11:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 7/9] gthumb: update 3.12.2 -> 3.12.4
Date: Fri, 22 Dec 2023 16:11:06 +0100
Message-Id: <20231222151108.645675-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222151108.645675-1-alex@linutronix.de>
References: <20231222151108.645675-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Dec 2023 15:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107757

Drop erroneous autotools assignment as well; not sure how this wasn't noticed until now.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gthumb/{gthumb_3.12.2.bb => gthumb_3.12.4.bb}              | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gthumb/{gthumb_3.12.2.bb => gthumb_3.12.4.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
rename to meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
index ecf8f6ab5..79db8b7d7 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.4.bb
@@ -23,9 +23,8 @@ DEPENDS = " \
     libsecret \
 "
 
-GNOMEBASEBUILDCLASS = "autotools"
 inherit features_check gnomebase gnome-help gsettings itstool mime-xdg
 
-SRC_URI[archive.sha256sum] = "97f8afe522535216541ebbf1e3b546d12a6beb38a8f0eb85f26e676934aad425"
+SRC_URI[archive.sha256sum] = "add693ac0aeb9a30d829ba03a06208289d3f6868dc3b02573549e88190c794e8"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.39.2


