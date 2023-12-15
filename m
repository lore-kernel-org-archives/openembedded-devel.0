Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96CFC4167D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:56 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.57801.1702626767961580271
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CD7zok7a;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a1e83adfe72so29879166b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626766; x=1703231566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXFO7yNzKWWDHP3MEoPuSPeKkv9b/9/VguxeZI/z22w=;
        b=CD7zok7ajv6ZhvPo2kJPmNLgMuxN5j1orPSc7oIvV3U8fXRv3TUOJ0aNTl/9mwnS67
         2AyJPepn8DbsqMfP2OJZv89lEWiS476xrrizSoNfBfR+Hj4uP05ABeiV3ysV5VhMOnJN
         B4J4aGp1xw5u+6cKY6OHDRkYD+UYP2+zoPvaKu83Ye2PfOr6f4gBSeI3ybskzodI1n9u
         iGdfu8Feo3p6+jllyPqEhQ/F3xOM4z3oPqlz59p+Br9E/h0T7Hd47LK7AhOvESfbaTq5
         /BDa1lFTpdw+qJhufLBUoRvk3q9kK19PaqEpfUz2b0liO70zAqNd6Hxz4m5tETK0sRv5
         Yisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626766; x=1703231566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXFO7yNzKWWDHP3MEoPuSPeKkv9b/9/VguxeZI/z22w=;
        b=Ub8ZSSUm4JdMRRmq41g+jsd8rpq3AdGD+kmzGPUH4ljm0/gfkw1kWepMHeRwlaMF8q
         BK8sIW4yuqcBpj7UTbHZihNd+R7szqhahLLeGwtIDOh1hYakRtck2Mba0DTcoYPVBt1J
         SY5DH/557P+szYBOovo41ABPTZTcXAgp7CRWAL5Zn1UU9Stk3EOuiY/mGQuYTiS7p3VK
         D+fJBHtSuYoCGBH6wQmkreDhSgnt+330ukKHE2tfhUo6+h5ulRGIuAytkY7emgvYZDqT
         gRus2MNNL3Be2XZ9A209ldYQVX0L9t2wAkYNrvFdCg5HGmvN8v//iHtFiJDSLHRyv4Ye
         ALBw==
X-Gm-Message-State: AOJu0YymNGkJQh8h4Gcz+roWByW1azunWfZQFBHI+O0L0VBciTM8QXlv
	HAOuz+uavIN4hYXsT1ylSF7mhuFQZdU=
X-Google-Smtp-Source: AGHT+IEFpxIx9oTQ7Bi+pWgEwE9NsnJptw5xFtaGlNOJ+vsvtbEMowjSCYTDG9Q+EXKgdNUupi6y/g==
X-Received: by 2002:a17:906:1044:b0:a23:b67:d044 with SMTP id j4-20020a170906104400b00a230b67d044mr1501316ejj.8.1702626766348;
        Thu, 14 Dec 2023 23:52:46 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/20] python3-supervisor: do not rely on smtpd module
Date: Fri, 15 Dec 2023 08:52:21 +0100
Message-Id: <20231215075239.3049865-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107495

It's not mentioned anywhere in source code, and python 3.12
has removed it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
index 53f8011b0..06b08e78a 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
@@ -17,7 +17,6 @@ RDEPENDS:${PN} = "\
     python3-xmlrpc \
     python3-resource \
     python3-setuptools \
-    python3-smtpd \
 "
 
 SRC_URI += "file://supervisord.conf \
-- 
2.39.2


