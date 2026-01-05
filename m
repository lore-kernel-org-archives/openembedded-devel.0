Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA736C2A092
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61164.1767607362852507190
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ml+ENXef;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477632d9326so84332675e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607361; x=1768212161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lDrR+D4cwUDqqYWDUuEAclzTRddiKF0XAXQUnM1Eo4=;
        b=ml+ENXefS5D146Il9v4h7NgbrZizsaV6YHwIbBCW68VLEt6a5el3VhI/5Uu+42S2AR
         l8GHaVP2WtDe+cxxm5Q+TSVzggvF8H0HayJ0X2GADgcFCg2DhB34pV54hYCdUxrByqzT
         DlQWTAczez1gDkhjoCH4HwllAiIaNOxkzYBmUv9Fbz9mdAwcZ+Q5uCS83ez8g2Q4M9Is
         qRO1XLZAroqK+9ZJBc311D9aI3ICZz8DiDBzgyuIF7gutRlcCbXORd7HbGc9uXtwtS05
         buBZRc5nX1PsVd+JcHqlLyuiliLrontU5ZgZK+EMgqU39ZMquTN9+xXezP9leEa/u7e3
         0/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607361; x=1768212161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8lDrR+D4cwUDqqYWDUuEAclzTRddiKF0XAXQUnM1Eo4=;
        b=heTqICYFD4Ew59JghZ2puF+fF4+beAhh6BDawp5CoQuiGAppjlu3+zLCmXOjOsW0Nz
         m32gdNZZANbDcVCSovDGhrn9Eiwb4VKUMjpRupahxcySj+xYDaT7H0b3EMrcNaXF6mfF
         2oAzyUSbt1jUaattnsrOli52vDLlDwLjhBJz+9p8gJpoP7ZR2nW2SIN0lb1Vj1FOyUCQ
         qbU4V93ryOKg4PGpFPGh/+e/EbgAuYb6gQH40M+xdQD0NNypq9DH1s4TaDm/jR03J9ui
         7YSAxiLlCdbAM1VpcVmg201tOSfY2AOovPLWgmrKT/B8RTLut2SfT/a3gbV/+N/bxGga
         3dTQ==
X-Gm-Message-State: AOJu0YyFR8KphqmC+tec+SANV7Ey6If6N+kDHbqb6OY43baiGsYrKe9F
	S5+3f0NoZ45rXHzeuDCiNiv0jci78c8mASrdEWerFJZNVTuxsH7cKyiwy7t2vA==
X-Gm-Gg: AY/fxX7Y7rDjv+jVl/+yPpMIVJRRgbq2JHb48ET3eshXtVQI4gmBmXmPwHPVi7gXz9U
	8BoW1ZEbQtarDzJTAgYNCiFmdQ3tjY/GGb9SwLoev1ZTjScIxl7jQba69mv2z5i/b15dgbq6zOb
	1X3xePu2XR6HXmFQvwV4rQWhLtEbj9ohqrYe9ZcOTp74BuzeyW28ypjhxuW0D6veJSX7u/I8FS9
	kfuhmN8HjjYDEGwMtUetlLk6FT7zX11ZqqU6NI8A3OYxDufxv6UDs1IlZBNs8BxhcEc7xv2qRkl
	04K87qq48HJoN0ghXk0pSfWBTgmm+FOT9Z9hI3rfwx3yjq53ZWIY/lKfQroPNYUHBJ2B2v/8zV1
	RBWfdS7Xz0V1ks+RTgO4SNOyy7NOc6LWqRWIEzOZ1Mpp9ptMJOqa7X2W4JUCYn23CU4Jv1yDDtM
	uExGOcSiGg
X-Google-Smtp-Source: AGHT+IG17qyBU1laZno3xe2AkZLzP4xHiUtqKU21HjW4Vz7W8mWWB7/CmIxAis53mlaWAHTKFWUcSg==
X-Received: by 2002:a05:600c:4746:b0:47d:3690:7490 with SMTP id 5b1f17b1804b1-47d369076b3mr485231785e9.9.1767607360903;
        Mon, 05 Jan 2026 02:02:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 03/17] freerdp3: ignore CVE-2025-68118
Date: Mon,  5 Jan 2026 11:02:23 +0100
Message-ID: <20260105100237.3081345-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123134

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68118

It is a Windows only vulnerability, ignore it.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb
index 02590973f6..6dfa12780a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag
 
 
 CVE_PRODUCT = "freerdp"
+CVE_STATUS[CVE-2025-68118] = "not-applicable-config: Windows-only vulnerability"
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pam pulseaudio wayland x11', d)} \

