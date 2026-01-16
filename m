Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792E6C982D1
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 15:33:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8680.1768577595416654972
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 07:33:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W/3M8Ng5;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so18873005e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768577594; x=1769182394; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZQCFptOfZsAkGiCiIGM19sKOVsjY19+XfF00y3pYX4=;
        b=W/3M8Ng5I0HlqKHXInHJhFKM0bh0aM9x5d9ifpTGqjsyF4NEFbQpUqfzgW/Y4Pl0U4
         qK+twY2a1F/0WDsP57J95+N8mQ7I7ZQS0psn3z/6k2sLlvPs36xq12jUOV3eSd/9VUOs
         mm4PVf+IL4em3dv+fB2ZV7XOEdtqRGeSCeixAj8sn6zXVpDh6Bz1lQfdoVq9AAxDY8H5
         xNYRI086ke61mcivRj8LQW+ckU10KWw9USKPW1XZ9AlnZm4xdgc3Tbp8apobDVB4eSTd
         zf+bEBWJFqZhEgyhZNedvtbg6EMpnZG/E1BZu3ipFWpaeIjXhZtYA6edMUolV49GvvuP
         7JMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577594; x=1769182394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RZQCFptOfZsAkGiCiIGM19sKOVsjY19+XfF00y3pYX4=;
        b=Q3WWz8b0aFeAPjNI/M/y4uME9tcqdaYfHW/egnGWdJ1MoSKLnX/x6lHXTPGAMrtcTk
         UOchRkZRII3SUDhwm8iFMy7ml9arTsE9ya1bl68YpKcKY2OoXYYXOulg/w7dwRFx47Wv
         EbX5dC94YgObtOuLY4RwArEzyJlv7YUvY+IjzWmWI2N/gqGN+j5c2/58AZ+avANscYlr
         ADA3d62tmM1CyWuw+euz1gJN9tlLFFUzbQjrTxQqDMepAdea8zxWvzujqOzi0DeyDCWd
         d+m8qe+qL3MQISEwkuywWIsLRLr+Txm6OcxbVJPH4I9dziOQkc1E23kTPlEAM+A42mC2
         LLVQ==
X-Gm-Message-State: AOJu0YzLXnfcgS8y9+/syqTz4usYMqeUIPMiTzHG2Ec03vUokAcK3Vtk
	uzHiJuao8i4YOjvYqzKczPkopdW3UGTAqjYMw7ADrS+ukgAuwwa1a3gv8q6Q4w==
X-Gm-Gg: AY/fxX7d6dFcWcuIoaGsHfqAihOFxTd6sS8Ud8PJ56zQEHqObrpiYrrup6IQWrqOjhg
	00rLqViww5brEEbmC7sOpz9ES8FL6+Dn3FGCserYWctjIXbCnlTUYbAU8kVgpv66D+8fTamWmO8
	+ZyhURRFo5KFENURfNnCvZffDYfHGSZfz2WVBcwlbp70LGWzbK+I9uUAeLWJ12Kuylges5PBiLX
	uESSpV3XNBXpXfLHgZlfHXiBDU9usJ/L96ipYTWLlezhN5I1iseuL2DBF8EBDmOK+4RKpyhH5NC
	dsWIuvddWb44C1QcuMdAaB8/v2VoxPFVYHj7zpxFVErRDjyK7NUP4K9QaHiKCX5ZaTEzb2cJK0T
	n9CnTkHz7xL8Ovt5oVonCjHOBdXkH0G98eI/07XcUgpvTKkp85hNa4dbKLBMLMuxCyIdc4bb4Aj
	vEUvcjtA8H
X-Received: by 2002:a05:600c:c16a:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-4801e33c332mr41048105e9.25.1768577593638;
        Fri, 16 Jan 2026 07:33:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801ea19f94sm21010985e9.3.2026.01.16.07.33.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:33:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/5] python3-django: drop recipe for version 4.2
Date: Fri, 16 Jan 2026 16:33:08 +0100
Message-ID: <20260116153311.3444648-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116153311.3444648-1-skandigraun@gmail.com>
References: <20260116153311.3444648-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 15:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123533

Though the version is not EOL yet, it doesn't support the Python
that comes with oe-core. The last version is supports is 3.12[1],
however oe-core comes with Python 3.13 (soon to be 3.14).

[1]: https://docs.djangoproject.com/en/6.0/faq/install/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-django_4.2.27.bb                | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_4.2.27.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
deleted file mode 100644
index 86425ca724..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
-
-RDEPENDS:${PN} += "\
-    python3-sqlparse \
-    python3-asgiref \
-"
-
-# Set DEFAULT_PREFERENCE so that the LTS version of django is built by
-# default. To build the 4.x branch,
-# PREFERRED_VERSION_python3-django = "4.2.%" can be added to local.conf
-DEFAULT_PREFERENCE = "-1"

