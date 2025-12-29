Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6180E9273A
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 15:26:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45057.1767021994984640228
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 07:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PM7R3oF5;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so96932075e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 07:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767021993; x=1767626793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMCXF7aEtf0BUqfKS1N4Xj/nLRc2psi7L15c8UY/9gw=;
        b=PM7R3oF5vmJ7qLCvjnb8gKE4coYZB8jn+wBD4AUKWIISh5zym1ur6KamQvK/3yU+aH
         MayZiU7cQo48ZI3DMh3erhdYHtDgK/i98Y5e+iMVhCdgK9/dHZR+kyAkUPtBgAPAvt/2
         1+3wNS51UqeNJ4NmaV+uWhioXZrwTa/EtVU1kmiwIjdu+gGJ0tTWd5WblpyprI66tLJV
         ACbNnSbAAtB/xpgLUNZ1J4QHpvPT0YNgd84T3jgz0vCgjVkaA78wppzaZVuAScz/S3bR
         YCJEBThhSO+XZMpOcXF9Um8JAQmRxLxCozN/DjlmM2DdLqcGWgPjIlhR8nw+NLq+Mqvj
         ZO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767021993; x=1767626793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMCXF7aEtf0BUqfKS1N4Xj/nLRc2psi7L15c8UY/9gw=;
        b=q4pt8kZk0d52MKNL2dprYMe620QPIlIwZW3TFbWMrNLfYwZgKiY3WznGymK8qI4q1k
         10NyWe2rdCmb8AXEcUC4tG5FWYlC1My52yZjZQM38qAduXK32ybPd3Mju4SFFaZjvDRg
         U14tGxf39i8lZOejlu5SD+YcZjNxiPkcVBDPdtQ4p4RumIZPGyA7cETtzH7cBV7zsx0A
         Md/XpMvHBcaFuwRzaoLIVARU71C5HHopahnqHV7rD3vOz8LpPiTjdm0DusoUfcibQNQt
         NKNXM8ZURethh509v2F4KWWbGz+JSFgPmjAW0sjaOWRr1hIfG8YVhdJlWQslkNhN4iAG
         QNKw==
X-Gm-Message-State: AOJu0YyW0WT6gqSaNqU21e4b4m2sMuuR3G9S1drWS1jmBdKYvSMv3oiu
	2tVdue1dYBwn/bdxh5xdRW8CgXuYsaeBxJvsZ28TIClODe7cg5GmfDoKczFWkw==
X-Gm-Gg: AY/fxX44Fsbn9q5ynSDjTfVnWrMfkt65j411RiZvfCalCJN5qRezIl4Vi+Kh0yjyuwK
	1hxXnx4529Bi3Yr9CMA1nROP0baYA/R+Uv1nC4UG+e/JCvEd7CAShigJMylRM+o4kkvfJhqc7S6
	0lfgtoBaokWvJnp0uBt/lyYfJChXtLetnmClwELbN44I2cxaJ/Uexfi+E0pmFKehd7mPhyiR7ED
	gaVoZofxuleiZT/fN0LPyhrj2YB4mZiH++/GofzuKYLRHcFR+3fBFS6F4x0M3pYJt1hc7n1m6wj
	os/6YE0+ui3DwN5df8iCMgNAQqXUyAqezBDafwdOLbwOh9uOHxv10cZ9Z5cEepIOnx+kEnFtIk0
	hQzn6KNvMUxZdBB5BDvHajApLRaKT1JcUCOd0/yMFEmzgzga06/nIzapvwDxMTQsw9B+xBt1cSd
	dgYDX/SM/A
X-Google-Smtp-Source: AGHT+IEnt0K61wvcTTQwGwj3q9ECHmmKTF2aTKw4pPDM8nwtkXkoZzCTHdVYu7GPBnlYcYhVu9qEBQ==
X-Received: by 2002:a05:6000:2285:b0:430:f5ed:83d3 with SMTP id ffacd0b85a97d-4324e4c70damr42066005f8f.5.1767021992982;
        Mon, 29 Dec 2025 07:26:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2278dsm63786389f8f.18.2025.12.29.07.26.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:26:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] php: upgrade 8.1.33 -> 8.1.34
Date: Mon, 29 Dec 2025 16:26:31 +0100
Message-ID: <20251229152631.597803-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 15:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122995

Comes with fixes for CVE-2025-14177, CVE-2025-14178 and CVE-2025-14180

Changelog:
- Curl: Fix curl build and test failures with version 8.16.
- Opcache: Reset global pointers to prevent use-after-free in zend_jit_status().
- PDO: Fixed: PDO quoting result null deref. (CVE-2025-14180)
- Standard:
  *  Fixed: Null byte termination in dns_get_record().
  *  Fixed: Heap buffer overflow in array_merge(). (CVE-2025-14178)
  *  Fixed: Information Leak of Memory in getimagesize. (CVE-2025-14177)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.33.bb => php_8.1.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.33.bb => php_8.1.34.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.33.bb b/meta-oe/recipes-devtools/php/php_8.1.34.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.33.bb
rename to meta-oe/recipes-devtools/php/php_8.1.34.bb
index f4928bc3a1..a734c2458a 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.33.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.34.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "b6553451841c1a569865d7fdc83024621ee4434cd8fbfeb0a31588ac9c70685f"
+SRC_URI[sha256sum] = "98e0a08a0fae37d08dfcca2f5ff6664863097dde4b1d360af2acc8c3542f2a0f"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \

