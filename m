Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEBAD3F2BB
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.29975.1729278818377779086
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vl/8m1mO;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e35bf59cf6so34606667b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278817; x=1729883617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhZ5QEPPYkpo4RQMyZSNuokGgBO+MlMukBOsxhFqXL4=;
        b=Vl/8m1mOJfrweDrg2fhjVoaUhGn6yiOGTjQ9KGFjFQmqDgiNccqmLFxN4FGer94ecc
         rfiECHDoSCvHIZ6PjYrDCHTg97Bly8w6HlWgJufQHsSOasZZ20PG+K2AvGOt6PH6P+T7
         Hzshvkn4ifwwB4IEDqqpASRAT3Ox4EjqxASmIOb/HYAPdzKD8p0H5SgBGWhtjtJApbOe
         Odf+fhTxU0qgDaYkVm29zo+0qjEb7oT1UwRxHYyv1x+H9zRC7R8X04eNl9Q/7xZiXIXu
         LHZAYVpXmA+k5xOC4cMMJcXnHno1kmCKqZa2ESbyIwO4oWRXJrH7lacYf+fUjcfkZYkT
         Okiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278817; x=1729883617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhZ5QEPPYkpo4RQMyZSNuokGgBO+MlMukBOsxhFqXL4=;
        b=ueMDHbgsYnek7PCaSlafqjwioW3sRsVsHNkpL+/N4ElLff8mSqyvC2HvodMcfTbmuq
         1I2etXjkdfUteD4W0ZtqoZgwqfc52TpJyNasJKt+QCTKghjtDIgwOTDM0xuOeKJJ33aB
         ahV/94UHQKr5sh+zxP08OJBFRVSQ4WgYGtPag8kls9wDCymTxi8qxPuumYxU9cs7MNlo
         Y51WZoCCZF/X1CjmqxnWXC20hKr8gR5mDvBS3km9h3tMg/SuXy3XBvkWWZMnWomi8M77
         PKyT7I7du/A3ip+yaxBD7Mk3T9xeu3tS+TLZhv0Y65fWIvP1kIPTfp7a7K2IHdhLyaCr
         wCgg==
X-Gm-Message-State: AOJu0Yyl2K3gSUHTDkOX9EHW2naOk0v07hGC7RAtOgZDSGdLnfMuhWdv
	DspTf9UdkY0Izp3zVAA1TJP12bPnWdUCSs+FFpnAsw4d6RDDwnFH3vFCHA==
X-Google-Smtp-Source: AGHT+IFPQX8V6t7kSne+tmxuh0G8rTemKDe6HAz7HqJyG/hc7YMa7n3dxsDT3aRPe1Sqj/F2JCM3GQ==
X-Received: by 2002:a05:690c:dc1:b0:6db:cea9:6ed9 with SMTP id 00721157ae682-6e5c1630bc8mr28701467b3.4.1729278816813;
        Fri, 18 Oct 2024 12:13:36 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:36 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 40/68] python3-msm: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:27 -0400
Message-ID: <20241018191101.25184-41-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113027

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-msm_0.8.8.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
index 966ff86de..a3bbd5d1a 100644
--- a/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
+++ b/meta-python/recipes-devtools/python/python3-msm_0.8.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/MycroftAI/mycroft-skills-manager"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "cf1fc0d1d86af68003cae53c71ec6288"
 SRC_URI[sha256sum] = "a502aee54917cd394217b31c977a1ba3d9541a0120e0a045c49fd77b328e4a29"
 
 inherit pypi setuptools3
-- 
2.43.0


