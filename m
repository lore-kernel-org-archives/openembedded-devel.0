Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA39AD2C12B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:11 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.19623.1730817423247408279
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLtgoQNA;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e35bf59cf6so60230887b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817422; x=1731422222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdyYU6PvzZa+8Czjr1B8ytMDUU1S8AzeiYGtOhVCLm8=;
        b=LLtgoQNA/9vvyqvJbhlslqpO2FkC5chcB9ED9gqZr42+NPa8iPLXKjs/4Y+Y4UHVT3
         l5qjxRpQ6fdCSSnlxuELDaZp43b2pHQ8Ffc7N6nyv2yOfxXQ2UFmAoi94HOZOqsHOISW
         uMuCCiEvra6KLI/Uiqyi5F8f6xlmTv3YbSyqnrwcQzY2JK8qOOUh+Gq/sdgLDXd8SEG1
         77jgABmBuyiPoHcXiPh3LKTP8bQi1obKngw35jYEZU3LMg/exv60ejW8G8l4q3eTy1z9
         h/clzSRIfd4/Ixl4oZzyYbY2cUqfzljTPHz98+aK+BzH+QqjlaKDgyBFGtdVbHP8/OaC
         ZC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817422; x=1731422222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdyYU6PvzZa+8Czjr1B8ytMDUU1S8AzeiYGtOhVCLm8=;
        b=b/InWe8wdJX6R8/o0YtcVdh6o7rDcpdpu2fmaLvm4KSmHrBHQMJjBe0YvRIRw88AR7
         gwrM1mTr7pq2FWWYatL2lxlKFOAw4qfeDrA3kSaT6FyjjGaJDuOldw36OcjvdpElNP1t
         xbbaUmXlETqu1FVWShKaNS8YeZJn2aIZfBKSfuqFn2+4OZG2pjuc5hL+E9WfzuNJlC/J
         pQgr/Xn1Z4EiDByUUxvISqQsUFc2+EWaZt6Pc2wjAUs+LqkAweFnQ014i8kSnzEXlMZ6
         Ejxi+atjw9LQBViNHHcDL8/LEzHD9+GdsGK/MoffnFczM/DNqXO/hEJp1T+D7FCsH5i6
         O0UQ==
X-Gm-Message-State: AOJu0YwwrV+SwSX6PktgBtKNK+KFWoEij+0gFGA2NUtVYMfyJHd4JkjJ
	JNmiT4vNDeF28SpB19TJHYwNXnFr0QtlviCDWOCTy58vn8xvOhxH4Wtaaw==
X-Google-Smtp-Source: AGHT+IFU3RUO5VHg09ujNFMBKiGzolDfbYRr1jbXt8jkTNL8h8nqOmBcb2P8fFwZ9Z40rbADlM6gig==
X-Received: by 2002:a05:690c:6e82:b0:6bf:1ca2:f6ce with SMTP id 00721157ae682-6ea55896dccmr159829817b3.11.1730817422292;
        Tue, 05 Nov 2024 06:37:02 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 51/90] python3-pint: Upgrade to 0.24.3
Date: Tue,  5 Nov 2024 09:35:16 -0500
Message-ID: <20241105143638.2301245-52-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113469

From: Khem Raj <raj.khem@gmail.com>

- Switch to fetching from pypi
- Use automake format for pytests
- Fix ptests, by adding missing runtime deps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/python3-pint/run-ptest               |  2 +-
 ...n3-pint_0.24.1.bb => python3-pint_0.24.3.bb} | 17 ++++++++++-------
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.24.1.bb => python3-pint_0.24.3.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pint/run-ptest b/meta-python/recipes-devtools/python/python3-pint/run-ptest
index 5cec711696..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-pint/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pint/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pint_0.24.1.bb b/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pint_0.24.1.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
index 8959a72ff7..23e9fdb0e2 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.24.3.bb
@@ -6,14 +6,11 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
-PYPI_PACKAGE := "Pint"
+PYPI_PACKAGE = "pint"
 
-inherit ptest python_setuptools_build_meta
+inherit pypi ptest python_setuptools_build_meta
 
-SRCREV = "4c2caccfc6cdac1f80a9bfa15ebea1ca49836881"
-SRC_URI = "git://github.com/hgrecco/pint;protocol=https;branch=master"
-S = "${WORKDIR}/git"
-#SRC_URI[sha256sum] = "e1509b91606dbc52527c600a4ef74ffac12fff70688aff20e9072409346ec9b4"
+SRC_URI[sha256sum] = "d54771093e8b94c4e0a35ac638c2444ddf3ef685652bab7675ffecfa0c5c5cdf"
 
 DEPENDS += "python3-setuptools-scm-native"
 
@@ -27,12 +24,18 @@ RDEPENDS:${PN} += " \
     python3-setuptools \
     python3-packaging \
 "
-
+# python3-misc for timeit.py 
 RDEPENDS:${PN}-ptest += " \
 	python3-appdirs \
+	python3-attrs \
 	python3-flexcache \
 	python3-flexparser \
+	python3-misc \
 	python3-pytest \
+	python3-pytest-benchmark \
+	python3-pytest-subtests \
+	python3-statistics \
+	python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.43.0


