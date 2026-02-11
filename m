Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC470EB594C
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 01:51:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9500.1770774709619043626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 17:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNnnvw5B;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so4203495e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 17:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770774708; x=1771379508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMQBVNzF6c64Boy5qLfwAsRj7mkOGvSVH0Y7mtuN5kw=;
        b=nNnnvw5BTgqCxOj2YNqL/zKzAyl65VrmE9sgxIaoLV7Hc1VrB5XfnJhrcnW2XUL/Az
         sOMGMLG95OSh39oqPEBThmLftLyOqoAxIsAqaARSdocnXSIybOO3Yh1R4v8iQXzQJOLP
         OgqpSgt4eSm2gAqiJCnsNG5DcSbTON9qXDNRfxhVFIkWbjhn5j4YCLZt2ljPwNRf2rrs
         ffZ0XsEF3VAnEQXkpscYyFdZ7SNpccaJK/WTii4xsrj2PsLmGgbkBQYZ810papKUcQWy
         ylz9uHASv3/FZcXMBdRofkkdQB8+rbUgfqduEoTknTyRVpcDOxnPK3qm6a+2NpXeSTpM
         BH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770774708; x=1771379508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMQBVNzF6c64Boy5qLfwAsRj7mkOGvSVH0Y7mtuN5kw=;
        b=rMGADpTSKdy3IA8B4m8Kpv/j/MCqWlXLxQbUWlIhTvdqat1BiZ69VAGKzJwUh/L+uR
         OmEqnCbgxjdnQVExQu+zSZtMP4eRCeIbBIUpA/ITAYthGYxWfAMUCtMATBOHM1mIaYyT
         YqZ9XO44awzr8mLlWa8TvsX1vs8FnUzQnHvf759LA8t7xAorsrb+lwTtAZH5cPXklRi8
         LseTCRHpNV2vhvSmG5bXAPmq4AnSBhE3SDVpWHT4Qx+BN5driNZmMqa3CtyBCsmEXh7s
         BRTo4i+XwmNwsKZB11R14F0KSgC87wuYErYd6htCabxrlNc1Mevh2/mAKun/o3CYUUCs
         FHRQ==
X-Gm-Message-State: AOJu0YwD1PqNpd2HEnIHiR7txUW6q9YsEFpThH99NTdDldxIFiIRb/bK
	Q0LCODACLr9PUXAoV8LB7QKXzK13WlT0xzc6pfvLUPcdgBf1OJCcYn6zw74o3w==
X-Gm-Gg: AZuq6aIIjy6xxgBnIdiaT2S3AcKQrKP0b7lbTDQnj4REDcBBkCYaGgzZllqr9Ttz6ZV
	lJJcD91L43HUQ0N5YODH66/LtyOXVdkptXWPWojvjLkBB8+P+IcEOW0YQocrAD/qmFIW5y+as0u
	ze7+VZlYzWunJri1+33+kqgRi66VI/LWkS67iz5H8JAsVumiG4fHwwjhgrF3uFys5n39ZgjXS/Q
	lOxHV5sP8qLFn1S+ljBUevE/bfL7anEIXjWYERaNNUoUPGyp8HTIvcVm0pcOuMzJNKsYPa6DxOK
	uYCkvzX8FVxMt0VHGXuAQV8HqRXVZDJ9Fn9jno+6XxYrAVxvmK9g55/+gPzZ7pihoFzERhgjbLa
	93JF68q2qSK4iyWPTNiiqEPvxchDkXkvtWLxrXYvv50kffJdDJZ72WqFPgy6SmrTfkwpad0P6We
	qPZMQsRsRGg4C45hb/7RBiZUQu86HpPb4=
X-Received: by 2002:a05:600c:35d2:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-48350547564mr57759375e9.14.1770774707676;
        Tue, 10 Feb 2026 17:51:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835bc8736esm6130145e9.19.2026.02.10.17.51.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 17:51:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH] python3-django: upgrade 4.2.27 -> 4.2.28
Date: Wed, 11 Feb 2026 02:51:44 +0100
Message-ID: <20260211015144.395946-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 01:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124327

Contains fixes for CVE-2025-13473, CVE-2025-14550, CVE-2026-1207,
CVE-2026-1285, CVE-2026-1287 and CVE-2026-1312

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-lower-setuptools-requirements.patch                    | 0
 .../{python3-django_4.2.27.bb => python3-django_4.2.28.bb}      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django-4.2.27 => python3-django-4.2.28}/0001-lower-setuptools-requirements.patch (100%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.27.bb => python3-django_4.2.28.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.27/0001-lower-setuptools-requirements.patch b/meta-python/recipes-devtools/python/python3-django-4.2.28/0001-lower-setuptools-requirements.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django-4.2.27/0001-lower-setuptools-requirements.patch
rename to meta-python/recipes-devtools/python/python3-django-4.2.28/0001-lower-setuptools-requirements.patch
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb b/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-django_4.2.27.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.28.bb
index 038b0220fa..694a0144a7 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
@@ -2,7 +2,7 @@ require python-django.inc
 inherit python_setuptools_build_meta
 
 SRC_URI += "file://0001-lower-setuptools-requirements.patch"
-SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
+SRC_URI[sha256sum] = "a4b9cd881991add394cafa8bb3b11ad1742d1e1470ba99c3ef53dc540316ccfe"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

