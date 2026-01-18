Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0741CA5FE4
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 16:27:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17249.1768753663642969258
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 08:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fd6V09ly;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so1913785f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 08:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768753662; x=1769358462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e80O+Kljk546OSkaE5Dqdo0U2XskGWvbvhGc64C6UAg=;
        b=fd6V09lyJrcPCTGP1WJ5oUtlafyxlCLiQYjJ6eLLBOLDCDiJhLkyfo5sfJSZbIWY1B
         b2AcJnBD2DGHxxdmN8efs3CDI0e88gl67FYlTBh58O0zJGm4cB5GlalhbiMkw/lXMGo/
         bckwZvm+t3pRfHQQMFXEFz18j25BEsSHMIH17g4kkoYbvQFfjFD9c/2TjSSzDy3dDQPD
         YFsrpLoi5D9UoDhVC+WV1eForvo/OfGqwqoqs8yGU8fVCbK1ufqFWy9GAY1/2lKfoy+w
         MldNZ6e/EgrpoFw6ijTZYjWfLGr9qJWnohqLomVRS/zCGNdTP7+FWmGYTPaDqwZseXhF
         jv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768753662; x=1769358462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e80O+Kljk546OSkaE5Dqdo0U2XskGWvbvhGc64C6UAg=;
        b=GDf249W1BRKKQNSmwW4RN1fmI6+9NZGHN+PUDUcDqyiTR8mF+X3e7pXDvEd1nfHxrk
         EMQ8bEanibHxGGssgatbVxWsiYMsHDJ41kksbocd5U9zTLIrDH/0PuAmXq/newsn6gwu
         bUsnkIkBZR4w3xnnF5RpkMtbOyFpeOW46gdDLAQH9cqy1p6JrrJoRcFSxsEBx+RYeiiX
         x/tqILTQ5GPEzC2uCT7UqlGeZN87f4U+lG7SMVJRpf2cT+5+gtlK62iKgB3QGhsczU+h
         b9OCmeKNvGXN/gnhsmPxjXEuNVzs3XcCFz4fJMSOLMf/dK5v275XId185iDyZhRRBjcz
         FjHw==
X-Gm-Message-State: AOJu0Yy5zJ13xa2FDj0qDcFcLZoPHc0rV3JcHVZ+0iEgcZaFGaczw4vC
	uaE6Qu3DQ+9Ix7JhSTrvPkqT6/SCEFG/L8yZ//yxZmMqA2tHrPoZl6OGWayg5w==
X-Gm-Gg: AY/fxX6eWrUKBXJBqV9dsGEHQgdxi8YqJm7vGlFxAOV1BOjyyvvjvMKs1RZxIHGoCne
	LgIgS1VxlrgpxOftMNyRunf1gYQH4dfDI6Majqf7JuEsgiuGYoXFg6KfIYNj1uE/jHeh/nEbUJG
	aPjIzvDjCSp/cTXJD7RdTcv34OcksOcYXCvyGgqToeeEChUFOm0nGcls+n9VYhmeWHe0H0gxfL7
	QByXpxUTBBdOW6UCnLt97BfYfufalsXULLF59k+cUBIM3LzvTkyaSvpT2OLuGBu/TMUatpJog5M
	DObuLUKKdDwGT3Zc9r34a9ITPRXIpVGcony7yU3eePNYisM30IhsamhfPPPR4sS7QfBNrLaHe3o
	aJ6FhjjRoiNkLfFo60vImdORuGRGplJrSe9n9rTQBemLzYh5oxFoVzLfUwAU+TXZI5zA8n1RJF5
	/sg42toHTI0R3ZRG0kEvg=
X-Received: by 2002:a05:600c:8109:b0:480:2548:6f9c with SMTP id 5b1f17b1804b1-4802548706dmr74285885e9.6.1768753662016;
        Sun, 18 Jan 2026 08:27:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe47dddsm61402165e9.13.2026.01.18.08.27.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 08:27:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v2 2/5] python3-django: drop recipe for version 4.2
Date: Sun, 18 Jan 2026 17:27:36 +0100
Message-ID: <20260118162739.3764017-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118162739.3764017-1-skandigraun@gmail.com>
References: <20260118162739.3764017-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 16:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123573

Though the version is not EOL yet, it doesn't support the Python
that comes with oe-core. The last version is supports is 3.12[1],
however oe-core comes with Python 3.13.

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

