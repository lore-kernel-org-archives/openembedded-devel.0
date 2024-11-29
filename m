Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A26D6EC18
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 14:46:35 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.117148.1732891587384154414
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 06:46:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qPIF5I3T;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cfd2978f95so3283802a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 06:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1732891585; x=1733496385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IfdT7FVhc/cVPogCsrbYpD3M+iVI5QTuS7K3TMDpdYs=;
        b=qPIF5I3TSq5v9U/8qED3O3B655owzTrGiEi/akDd+6db19E9c1+Kv1qeYpcW/Iax4a
         FBQ/ibFxivKTxUfhWd8E9JmbF9YxfVDHsrRaRb07zTwaBnKv2qBsWtdPR9f1tosZ5O/O
         0CC5t1Al/8IvYnfF6txVRH+7xMO3dCmxQVu+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891585; x=1733496385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IfdT7FVhc/cVPogCsrbYpD3M+iVI5QTuS7K3TMDpdYs=;
        b=LBOFicJJ/d9S901+V6VjYiZyjJ/WdrsEFsbhO4mC9C9OxsyeD7C2LkqX7TtBzyv8m5
         WSpJsE222i7ORWU3qCBbp+u8OKonuLLyZXpihnssT7oLzTEf02y0W7+IbpArj3TpXuVe
         PGOoWQ1xXg70tm1JhIEr1FoGP6bJWkrUbNd7d/ivfTUq0owqp41Wkx6jW1wsep7JPFwM
         lOyTgH80hs0Ibb0CDwDAiUZiF3wVdqKgW71VE9DMTtUQzep6T8kXeejvY0+Ujhpb6yWA
         lmXKpq8dLzNI9MV9+arKcnCS6itLZ4+lHsZqTaPfWtpuvR9TLq7aoPmsU3tS77JzfTVo
         X0nw==
X-Gm-Message-State: AOJu0YxxdzwwwfQ/yUpam5bLypUD3jFCWApeT+xoSMXsOfDfE0os7Ijt
	ddj6u/nN7SiKTYNaie87Gq2yWmAhBRfuWxANow742c04+hkg93uVDhjcRHE8182HAW3lGAmx2Qx
	x
X-Gm-Gg: ASbGncu+hrQ7Mjnv1WZCiOzS+pgmtwX6YVvxSUoU4q4bqW4kdouzm982O0Q2J4lQxHN
	8bf+BovMgAlUyxhSJ8zdhYal2FZM3Wfmb5QVpf0BYZl/SUV1UydxZuviHivdUQtu+7BnIo0v8Jr
	4uvGEPW/hBodteQ34nTmLNk3OEoJGVJsOaVTV/JEwvRQjhHKjDUFf2o15i3krnqZKRg759uB22z
	KPmXEitH+DrjGs8lqyI6pqjrKM9t6I7n9B6bUJMX5LEImQyxY48NfmTb7CxlkOg
X-Google-Smtp-Source: AGHT+IEFT3VBzDFOrHAsU9vGTmoV2SdQWhnqOUDIyauMClQvV1h7IDQE2qoEMjVXl/yRE7yW1QR43w==
X-Received: by 2002:a05:6402:278e:b0:5cf:c18b:b0c0 with SMTP id 4fb4d7f45d1cf-5d080bd9f5amr14185689a12.19.1732891585458;
        Fri, 29 Nov 2024 06:46:25 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0b87cb290sm622832a12.12.2024.11.29.06.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:46:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-service-identity: Upgrade 21.1.0 -> 24.2.0
Date: Fri, 29 Nov 2024 16:46:19 +0200
Message-Id: <20241129144619.780319-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241129144619.780319-1-leon.anavi@konsulko.com>
References: <20241129144619.780319-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 14:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114118

Upgrade to version 24.2.0:

- Python 3.13 is now officially supported.
- pyOpenSSL's identity extraction has been reimplemented using
  cryptography's primitives instead of deprecated pyOpenSSL APIs.
  As a result, the oldest supported pyOpenSSL version is now 17.1.0

License-Update: Fix a typo contributors vs contibutors

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...y_21.1.0.bb => python3-service-identity_24.2.0.bb} | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-service-identity_21.1.0.bb => python3-service-identity_24.2.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
rename to meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
index babe05e1d3..2cae3b08c8 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_24.2.0.bb
@@ -2,16 +2,20 @@ DESCRIPTION = "The tools for verifying whether a certificate is valid for the in
 HOMEPAGE = "https://pypi.org/project/service-identity"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8a0f079f4e6a215d6bd6f9d97cab4d5f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76edce6a3fa1b82b0bf2b6ce174c19e2"
 
-SRC_URI[sha256sum] = "6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34"
+SRC_URI[sha256sum] = "b8683ba13f0d39c6cd5d625d2c5f65421d6d707b013b375c355751557cbe8e09"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_hatchling ptest
+
+PYPI_PACKAGE = "service_identity"
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
+DEPENDS += "python3-hatch-vcs-native python3-hatch-fancy-pypi-readme-native"
+
 RDEPENDS:${PN} += " \
     python3-attr \
     python3-cryptography \
@@ -29,5 +33,4 @@ RDEPENDS:${PN}-ptest += " \
 do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/setup.py ${D}${PTEST_PATH}
 }
-- 
2.39.5


