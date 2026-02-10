Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A84EB2703
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 19:19:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1398.1770751170538876422
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Feb 2026 11:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bWDYxfjt;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so57349175e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 11:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770751169; x=1771355969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WD7LZSa0c31+PCqmenqVJOqrdPEopuV7rQcd3g3s3ho=;
        b=bWDYxfjt21wavN5Tx15lVAEkOFHefZrQE2ohDRHpNNokQY06l1VDKYKIjuQmo5XhfG
         n7nx4An18GO847dW815JdIzxcpRRGYheQYGmfsepLA2PdbaY2YAmFHJbkBE5svWE09x7
         jWg4VB5STtN8sHLBtYnVnboiymQ6imN/vdAOZ4rMUWxwvnYTBNy/DeXHd9UUnoHARBZ7
         EDwINzrFq+sFXuhh0bM5jL5JmOfxs2/QNy+gxzLfTSJY6ZZAgnWbLH88GbHhWE1T8BKH
         eLyWEXJhgC4U7TmTcrzz4x5ZNTxKzAA+WVn7p/fywlStb7HzF/supOJ+4KKmQR/OMjjE
         hd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770751169; x=1771355969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WD7LZSa0c31+PCqmenqVJOqrdPEopuV7rQcd3g3s3ho=;
        b=wtopCF9uQgYlBEZ5J/96CrSSnWLF1186uM1L6DC7gT3c+NBKmvwVIYa/99l/nO5Gu/
         eTpOujmb9p9JqYyS/m4w5wssCubpZh37YxRhkBzC+AWtABkvdhDJ0WLnMf0YIrP13Wdl
         7DZ+zffmrC0aICoyFxVtHt0C4m+HBzXrC16muVk0fDKh054Cuz4AblfoSbVZ6CmCBtqh
         GoDbMEUWh+Y2c3xC7qraDdrBFoloyOmnKv/v1N0h//pq+uq+xMVcO2uHDF8aBjZmABZ1
         jbhelRei9UAX/ynMZwSELZY3P1XlztpgKbS3bVy3y6nVz5zVsJSpuqC+VqSPsanQSDX4
         Ikqw==
X-Gm-Message-State: AOJu0Yy3crMgc5P+HHqRZovhNJAsMjJNafWba0d6cPFcqAoxvzo32y2Q
	p+F/VfWuI4e7KfJrMZr2nmHTE0AfCP0N9gHrZqwSDzaQdqY/8/n66dfl3ks26w==
X-Gm-Gg: AZuq6aLZ5KAgdQKu4emuIzoSSRkdJRuip7zBhdrj+woUioWJfyoxE1TmGgrAJSPWxM8
	OOxzK6jsu7dOqUJkdxYRauhBJOGj/eA+jGip6z9dxwUfFH+b/66wSrYi20ha31WpdOcaEHsIkMI
	cUE/MlmozwCypew1ohkgH1VGRHzzoyB5Cl9gsGqqaNXpb0z5//W0clPbWGaLtfdS2ANx0Jr/FVq
	WYmkfe3ZjDxHUr05L/pJjGo8xQfyCww/jBtCQkP1H8kgKWBkRziSQ5s6RWwrC9xE6z9aMkYNJg+
	sySUk+oNfDxDM4INo407DmLmuteiczuqw6oWL6ZW5fRLMeZdyJyBjJu1s24Ql+tpxsl1klonQYx
	zzMRIMBcNeMZA/tOhI8wxHgbkc4c1EuniPPPHoC+ZZ1pZR1Vk08GECWABXZqrpjmqXVp7pOsahY
	zOT9nVMwc1QXQlcik3OYs+FG5VFig5Of4=
X-Received: by 2002:a05:600c:8b17:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-4835b92f03fmr462795e9.16.1770751165370;
        Tue, 10 Feb 2026 11:19:25 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd34sm83430455e9.7.2026.02.10.11.19.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 11:19:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-django: upgrade 6.0.1 -> 6.0.2
Date: Tue, 10 Feb 2026 20:19:23 +0100
Message-ID: <20260210191923.4896-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210191923.4896-1-skandigraun@gmail.com>
References: <20260210191923.4896-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Feb 2026 19:19:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124322

Some new tests expect the PWD to be writable, however this is not the case
when running the tests in $PTEST_PATH with a non-root user. This patch
makes it writable.

Ptests passed, however there is a flaky test. Upstream has a bug[1]
about it:

Ran 18651 tests in 144.573s

OK (skipped=1396, expected failures=5)

Changes:
Contains fixes for CVE-2025-13473, CVE-2025-14550, CVE-2026-1207,
CVE-2026-1285, CVE-2026-2187 and CVE-2026-1312

[1]: https://code.djangoproject.com/ticket/36770

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-django.inc        | 4 ++++
 .../{python3-django_6.0.1.bb => python3-django_6.0.2.bb}      | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.1.bb => python3-django_6.0.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-django.inc b/meta-python/recipes-devtools/python/python3-django.inc
index 589f6a5b85..4191d4384f 100644
--- a/meta-python/recipes-devtools/python/python3-django.inc
+++ b/meta-python/recipes-devtools/python/python3-django.inc
@@ -43,6 +43,10 @@ do_install_ptest(){
     cp -r ${S}/tests ${D}${PTEST_PATH}
     sed -i 's,/usr/bin/env python,/usr/bin/env python3,' ${D}${PTEST_PATH}/tests/runtests.py
     ln -sr ${D}${libdir}/python3.*/site-packages/django ${D}${PTEST_PATH}/django
+
+    # make the top folder writable for all - django 6 creates a test db file in there
+    # with a test user
+    chmod 777 ${D}${PTEST_PATH}/tests
 }
 
 RDEPENDS:${PN}-ptest += " \
diff --git a/meta-python/recipes-devtools/python/python3-django_6.0.1.bb b/meta-python/recipes-devtools/python/python3-django_6.0.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-django_6.0.1.bb
rename to meta-python/recipes-devtools/python/python3-django_6.0.2.bb
index 9642a3c581..001abf48e8 100644
--- a/meta-python/recipes-devtools/python/python3-django_6.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_6.0.2.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "ed76a7af4da21551573b3d9dfc1f53e20dd2e6c7d70a3adc93eedb6338130a5f"
+SRC_URI[sha256sum] = "3046a53b0e40d4b676c3b774c73411d7184ae2745fe8ce5e45c0f33d3ddb71a7"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 6.x branch,

