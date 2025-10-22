Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101FBCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 06:18:33 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2510.1761113897682591669
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 23:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+zRSgRi;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-290ac2ef203so64377555ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 23:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761113897; x=1761718697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdO42SslM9g0kLFrj28C3Rj40IWCy/JfvwZG5jRoJao=;
        b=m+zRSgRiC/+gEBZpMsEILjCo18VZAaAqpPFYqH0l0bYW9C2jBwjoZoqOoxirR2DjH4
         liGq2Pg3NGPVDg0/+e+iefB/Ab/qaRyIKUQx5MVCDNisLAl/lQT+XpaS0RnhFpj+73vM
         TSIMjbuBFoUM4FwABkmX71EpRSz5EilvrAE1l2CBCzxeBCCwsCpAEpONeKPogRqjHbBe
         wtIgzldO2syv1+xzHDYGPoHf199bdc0wAmqL/CIlITQHwcnXajFF0EuXLVfbGqJldKvx
         j0MJBbgl1F3ACY0/r5uSTNIArC1m7/cYmPg/5nVu9L1IM5lRdYSA9QrbwephwjU7kB75
         3i1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113897; x=1761718697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdO42SslM9g0kLFrj28C3Rj40IWCy/JfvwZG5jRoJao=;
        b=GVhXdqrHkIAgdj7+yxh8g59tw7WC6N+ldZF7EHsc0gJ+61CbA2EHY4ygiCxoIvJ/6S
         TbKK92cshh7kahsjs6joRGVU8KcdMkBxjzkNQIJyyCZ2Ogbvl/5HiVhT0O4gPQXEzQb5
         MFNVj8OxuWU1zhJwUCDZyY+wfNrdAeC5xocjgyvHZ/GvwNkXD6Ry3/As+7BPzUUgkiVx
         d2iiG2an+hvXg1eUxIqxRJXwMgkDTM0asF/b8xwPHpNWyMjCrvUlG1mY5eicaQGqHfcN
         VlsxwxDWrFMQWmRbs6mhnH/sbFh7PauHEsTnJInn2FnESLx6bZJasEEojRon5M6Pbs6H
         494A==
X-Gm-Message-State: AOJu0YzY6pW7eqtKkZp+t6oCz+XDuvl8oaQpOdgZM3CX5hxqFBUJ7Wr3
	gfM+u6ZpeySKU8DJCpErVQZJUA/YjJo7IxYdfDiR4X+UCIe1ofL02WoG1ri6rQ==
X-Gm-Gg: ASbGnctJ8XPPmZAikeb9kgVrn3Kx5XgHsnr6feYQeZ1suOYnKTVs5cQR4o8pu269rFM
	E70UMjFZFvFmJXGn5mdhyktm9zNlMWnEEBf0+otuwhwa7I7ecXWzy9JO/PDF+fglImh9I0tgth6
	i+UULIA8T1lEZooX5cG6VETF/fInBP2lLBcCgwmDuQ98um3Yv5wEYqsMKdxTeV9Ut9EigQpiJRK
	XU3b0cbJSiY2jhE5kgiTKDCLdBNi+gsbi74jLTiQonu5hTd8LWKE2FoHA2292hk/wg7DL6zj8ok
	V1I6G6g712awwhmYQGlV0d55lbcnXB8ve265SdR6rYImEd+scoqLJOAYCGULi5858GjFW2EG16c
	RnYUbK2hprI63eCmuV6SHLIICESPYTfeuDpJct7qqSE0KPDEUXten+sENAVVqinaZ0WBNWjOlH2
	AGtK/7kXLw3YP0G+A0oQHszHpt
X-Google-Smtp-Source: AGHT+IEHS2cNaRgy28bh6eiXQL2P6iOVIwvn5Hs2mc+zL4hA070VOruRXPLo5nR/X3vWnvt3BJWMPw==
X-Received: by 2002:a17:903:4b0d:b0:250:643e:c947 with SMTP id d9443c01a7336-290ca30e401mr249306455ad.28.1761113896747;
        Tue, 21 Oct 2025 23:18:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fde09sm127857485ad.93.2025.10.21.23.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:18:16 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Soumya Sambu <soumya.sambu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 1/8] python3-django: upgrade 4.2.18 -> 4.2.20
Date: Wed, 22 Oct 2025 19:17:52 +1300
Message-ID: <20251022061803.887676-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 06:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120884

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2025-26699

Release Notes:
https://docs.djangoproject.com/en/dev/releases/4.2.19/
https://docs.djangoproject.com/en/dev/releases/4.2.20/

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 54f5df8907cbf1212d0733ffddc049c7b8b8aaf0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-django_4.2.18.bb => python3-django_4.2.20.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.18.bb => python3-django_4.2.20.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.18.bb b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-django_4.2.18.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.20.bb
index c9be3c0462..3fb8b03224 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.18.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.20.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "52ae8eacf635617c0f13b44f749e5ea13dc34262819b2cc8c8636abb08d82c4b"
+SRC_URI[sha256sum] = "92bac5b4432a64532abb73b2ac27203f485e40225d2640a7fbef2b62b876e789"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \
@@ -10,5 +10,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.18" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.20" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"

