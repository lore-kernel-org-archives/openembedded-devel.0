Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 403C6C46CD2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.58182.1702626770143627475
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lh+W1s8s;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1f8f470903so44969466b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626768; x=1703231568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCPeWEN+/1kf3TTs0ddHJelzawtf5oPPO90Av9INCiY=;
        b=Lh+W1s8sxhwRiGoellXgLJBej3ZvCmYhLsR3fufd1Q1oRmKVADPLjHXX75dKeEzK6q
         CVYK0b51YBeFX4rEbOEF4cZbPIqwqd+jMfUuASS5Y7TeVuBnPz+DnAa/mg4hiE7LmGyz
         zJ3AJNh/tW6+3DoAO43QibYh6HzHzOY5p4Zo25eZlZTI53KMZEOVt/dYh2WeAgwXCCC3
         Ov7MdGDmbF5kH2DB9SFq6LsUKqlw5ogNt6hhB6oq6yf1buErzwy4f3b4AwhmBC+Mw2JT
         bgf76XTDyaKIGdbci2fXG/h6TKHvuIKyy6CxB81m8r8yp5XoQvVIXxqLSljBpLjRVM+N
         /NqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626768; x=1703231568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCPeWEN+/1kf3TTs0ddHJelzawtf5oPPO90Av9INCiY=;
        b=R1V/T4kXAIz/BdriVb0BbnH3KSSW7cGpOdYl/fK5uz4O3TDz5BejyB3K9Izi3kyqHO
         8FHVmjNrkKXZiRvKu0ckrPnIOH4HnqOn7nfb3gX+jK+76CTZDOHVrAjayxea5mx2Donb
         c5Bpl12T8sgU39EpWR6JJycsXfzmCyzfWzQrtsYWS+IPFTKskaid6xITeaiI0S6rWiQg
         IEnt/s5c0cWcTCn+Ds0bKrS6CDT2ECQqqhCvLG28lMTkqfrYPHqgeOA9ENCg7lBP+Cga
         warpoZtakHlqyNEuDcMA2ZNp/t5jWUgh5n+dbniE2vEQNwWQ77I81UvarjFZ4YXckBpB
         GWmA==
X-Gm-Message-State: AOJu0Yxf0lq1u3WvAjgiJ6zlLFwh/RUZ1B2tHRfwndZTP0xtgupPLbmx
	QXtYiwFVuAr2sHJYcGKU6qOK3T3vwEs=
X-Google-Smtp-Source: AGHT+IGmpI3t9KrOcJgwkZ530fZ9mKqheTaB9bPEkT9iRv2T+sSWz94U4y77cf2cjFDBHRyKTAbndQ==
X-Received: by 2002:a17:906:57d2:b0:a1d:7070:cceb with SMTP id u18-20020a17090657d200b00a1d7070ccebmr5172918ejr.55.1702626768651;
        Thu, 14 Dec 2023 23:52:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/20] python3-mcrypto: rely on setuptools for distutils copy
Date: Fri, 15 Dec 2023 08:52:25 +0100
Message-Id: <20231215075239.3049865-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107499

It's still used in source tree:

src/M2Crypto/__init__.py:    from distutils.version import StrictVersion as Version

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
index c946edb2b..062a63a39 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
@@ -19,7 +19,7 @@ inherit pypi siteinfo setuptools3
 DEPENDS += "openssl swig-native"
 RDEPENDS:${PN} += "\
   ${PYTHON_PN}-datetime \
-  ${PYTHON_PN}-distutils \
+  ${PYTHON_PN}-setuptools \
   ${PYTHON_PN}-logging \
   ${PYTHON_PN}-netclient \
   ${PYTHON_PN}-netserver \
-- 
2.39.2


