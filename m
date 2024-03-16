Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6F8C54E60
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 10:01:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3721.1710583261783215062
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 03:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=atGo8ku9;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: chris.chapuis@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41409125108so1008495e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710583259; x=1711188059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czfVRMswedzpfmuzNZn3r7UO0yDVzoLKbjLmLHrrm7M=;
        b=atGo8ku9ar+O7xwgr0JKKvXxQQ30TQTVnp0UgbTqpDFfzAg7P9W57sRmZKzPFDyHAK
         biVgf1zpKG9ly9XWDZQ8KWCDviHZ27/aKrfA3OCp4wnaOFaKLw0IJuE6LnGSqgb5EETQ
         qx/MmRZk/BTsd7pHJEKomqRCvj/jpPSXSG9OPlr0qbpt6iMMAqDh3yBrDoYcv1CAg9Y2
         8+3r7QMFymj6Nha4YWCMfCJUJNXbQdl/5kTdDTbZd+MTI9OC8nzTwdYXBu5KtnpQ2BCq
         /xMCv5wX/XCkMhjz5u85NEbH7wvoqj0wtHi5Z5Z3Lw0c7gJLiDxU2kAafbdaCJKLjuuk
         kHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710583259; x=1711188059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czfVRMswedzpfmuzNZn3r7UO0yDVzoLKbjLmLHrrm7M=;
        b=jtMW/ZlcjSlozFmtp3KboPYF4utNC02ejEDkE03LuROA9sDAjoPtrf9mmWVr9lI9O0
         vkFPhlAo7MKSaRcOlFGFc82SzfnZYVEErv4kkdtCEZeaNyUrdzoPSEijzIOMftnfbpsU
         lF07VmBH8XeXR1YUKVckkyp9q+pKIjWSDIpJVXktE3I4oID2UJYBp6AorA/YrvUM+xkk
         xpRjxV1Svcxz2fdY4Go3yMm5bD5mcjR9GPqiUm8epZdCtiz3IkKIlt/wf1TPB4jDI24s
         jQKfdoCeEv1HKPXPEsfi2fvq1M2jcwfCi60u2S6ef/4/aZGNtckDAHvedYlVAJc1BxNO
         v79Q==
X-Gm-Message-State: AOJu0YzKvMorC9Em8wv6aGHh+J2PT0qBW834PWsFvUSl7d6S+dYP2/Yo
	5KHhU0sCHmbBAYhE8fRyK2GL4EvbvKauM5AH71IjY4Rbmc3rg6gA6pmV/yBO9aM=
X-Google-Smtp-Source: AGHT+IHuq0BxBdi2hVAT59Aasw5OFS51LNeD9J/4JULAaBgcRrtXE/VzYtjz4U4i9eFr6zunV9IWGw==
X-Received: by 2002:a05:600c:4ec6:b0:414:85f:1f72 with SMTP id g6-20020a05600c4ec600b00414085f1f72mr593112wmq.6.1710583259436;
        Sat, 16 Mar 2024 03:00:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:5d9:6330:4d5:74f6:de66:f26e])
        by smtp.gmail.com with ESMTPSA id je2-20020a05600c1f8200b004133072017csm11679806wmb.42.2024.03.16.03.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 03:00:59 -0700 (PDT)
From: Christophe Chapuis <chris.chapuis@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@denx.de>,
	Christophe Chapuis <chris.chapuis@gmail.com>
Subject: [meta-oe][PATCH v4 3/7] lvgl: remove useless FILES include
Date: Sat, 16 Mar 2024 11:00:52 +0100
Message-ID: <20240316100056.409758-3-chris.chapuis@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240316100056.409758-1-chris.chapuis@gmail.com>
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 10:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109358

As ${includedir}${PN} is already listed in FILES, there is no
need to add one of its subdirectories.

Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
index 58053d830..8bd718efd 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -33,7 +33,6 @@ do_install:append() {
 
 FILES:${PN}-dev += "\
     ${includedir}/${PN}/ \
-    ${includedir}/${PN}/lvgl/ \
     "
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-- 
2.44.0


