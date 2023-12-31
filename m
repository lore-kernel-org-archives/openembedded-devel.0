Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA8EC4725D
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.218939.1704025418307046180
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HdqeogdJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-555e07761acso1491964a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025417; x=1704630217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhpEjbew/pPPv+0pB/5UEicoxT88z7DLGuIoetdu97I=;
        b=HdqeogdJZlsnh0rGJgcvcRpNFwxfXlJIEyF+y/OWAVq2YKtEY4eoMDlikjDsv9lNAN
         J4efNggyC/4nF2Tku3rinPP52gygDwVju0eKySaUL8xbZoqCv4SncE/su8JiAfyn13Xf
         Qu/j6PRpSo/GyHAY7Rj8k5L93dbJwJXrh+A14O9D3sOFI82rw3/lmo8ANUhQIclLvvaC
         5fZUy14E/UZUpXh+/wds3DQ//xf07upl4ZjQcafQh0dRB/ouiVVJYAt8aTY0Lwx44zwx
         t8aCcfNZEp+QC2S/nnoZIzRKeVZMCkx5nBkVARnXG999QJaav8pPM2GaWr9LkQEJ6rn3
         vMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025417; x=1704630217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhpEjbew/pPPv+0pB/5UEicoxT88z7DLGuIoetdu97I=;
        b=n5ZYH2ZOkjniUBP3XWLDnnzysO8sD6s14k5jG1Io6pWvepVCMlTfWH1Uj+jsmrHDG8
         vmjKkD1AgZxynJy5N+IdMyZl1o+Wjc5RfDhlXgDa2DSXmgjYG4TOtmo4McNO9Busl3OU
         yc7CtZy+hoi+iPzEF9g/PUbc6agGpTKE63bPjMZ6f3GYXM1PZUjHnGvk0T3xsYedfwxR
         n3hSfy/v0t4pvlCkWjaruWV83F6iTYa5eJh5ph84GMHqVGCCu31w59KIRZ85frYJgZan
         OIwhLCnXUDhX5AAgzQyjVZTCpg7xIwVZSU/aoQijSTSG47pbjqPUIS6bGdMHL9Xjz1LE
         PtOA==
X-Gm-Message-State: AOJu0YwXqFiWIT284dvG49zx7d2Jo3SFHpRHOTTFZvl4BQN8QnnuENoi
	HHKhoa7NFtcsP6vBUe0Bod6F4T7fyN8=
X-Google-Smtp-Source: AGHT+IEhN0NviBzw01m62qLocCtM/30Bj9M027SVNPVDZSVMFstCRu31UXlC07IJNgTnmvm4w/egew==
X-Received: by 2002:a50:ab54:0:b0:550:4412:e8f with SMTP id t20-20020a50ab54000000b0055044120e8fmr6280361edc.17.1704025416778;
        Sun, 31 Dec 2023 04:23:36 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/23] volume-key: disable python bindings
Date: Sun, 31 Dec 2023 13:23:08 +0100
Message-Id: <20231231122329.405225-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107953

No longer compatible with python 3.12; there hasn't been a release since 2018:
https://pagure.io/volume_key/releases

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index aff555ad5..cc03ab4fe 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -27,7 +27,7 @@ DEPENDS += " \
     swig-native \
 "
 
-PACKAGECONFIG ??= "python3"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[python3] = "--with-python3,--without-python3,python3,python3"
 
 EXTRA_OECONF = "--without-python"
-- 
2.39.2


