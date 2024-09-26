Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AD9CDE02B
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 18:17:38 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.51082.1727374656380284625
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 11:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I09rr/m2;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5e1baf317c7so592692eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727374655; x=1727979455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XzI8IUdzhVHg6fcnTpoudHaTFqFygE6WIKaZXoWbdk=;
        b=I09rr/m238GvAYCnVi8pU393VKNJkTeR9OLNoUQkxB8KXNVZtAV4It+bbUjErMgJP8
         b8X9Z01Qu34xCbl1rxK/LXj/iuiGu8H9jopnvFU2voeC82gtU2IFrIocM7viDoawJv4z
         LD+/70VH54hTPjyQ2m8nJGI4/NcoES10IlLtvnunPM22bVK2fJYw883JCLci+obygwYf
         m5A26xG0ayzqMoBwS9VbRBUWIn6QhUZ+CAqGOw2PG3DDC9SXhNBpHBRbL9iIaLCfqp0t
         8nY7ASqx0G6/7QOBG3Nd6O3JAcrojkkEbJNk2OHOT0bNWa4Z5jj7z+uW+NUFuq0JgoZB
         8OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727374655; x=1727979455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XzI8IUdzhVHg6fcnTpoudHaTFqFygE6WIKaZXoWbdk=;
        b=GyLPSiRXNo+gKM3mVda2fUsw1y/tj43vinmJ3rP24uxiD2iNkevB0ewmciUyT3oWpa
         9tUeN+btx/PfnpOu46BkmJQfcGjU9ZZ6DAXqL+uY2m3ZpCu8oA+DOHS7fvQEiKD+IhGc
         bN4sBM8CpTucDVBwSwp84cn3bTiEwcwxOk12y7HZXMi25QsyX0k/uYlXFdhEWu8qqTyb
         seroZdtf3nKIcGrwXPVwOKaKu55Z5okdAmvk40TOFlrY4Sk4j0Dzzs//gxT76E8JouCy
         v2Xbtm8vO+9iAqk9vrVcfjS0Nr00THJE/JWWqyLhJX2OjLg7HlPaBCGJMyeB3gdky6Ue
         BxQQ==
X-Gm-Message-State: AOJu0YwzWnx7kUAPbmH5xBDKP5aHkRMZD3Fh9QdeNLsIfCTGCb+27yrw
	PBEPY1HdamHvhg+xEDshsA7uvs/OrtUZWFNDMXKoHehAPZ0ng2Q8/xA6rPHs
X-Google-Smtp-Source: AGHT+IFoKOVB0hv0mH2Nl53CUAbHMlmvSDQaaPFMwqYZ32w9+mbUbrHzU8rZgA/hyUAZLULJ0GJ7Jw==
X-Received: by 2002:a05:6358:887:b0:1bc:57cf:4156 with SMTP id e5c5f4694b2df-1becbc520e8mr99569755d.19.1727374655269;
        Thu, 26 Sep 2024 11:17:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ae14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db5ecd1fsm172049a12.58.2024.09.26.11.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 11:17:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-pint: Upgrade to 0.24.3
Date: Thu, 26 Sep 2024 11:17:31 -0700
Message-ID: <20240926181733.932610-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 18:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112520

- Switch to fetching from pypi
- Use automake format for pytests
- Fix ptests, by adding missing runtime deps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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

