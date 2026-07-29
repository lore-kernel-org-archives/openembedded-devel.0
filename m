Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8F7C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 13:25:21 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11273.1785331513162867088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 06:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LOHXSSWI;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f633e6058so920933f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785331511; x=1785936311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxRPflN3iFPRaN7MvhOojK+/ED2JjR9/A2fDyiD+Y/8=;
        b=LOHXSSWIGGY9wUzN76O8sAqcF/qZ6Yg9a9qVM5+jpsSIDUiAcCe57nox1OIWydG0nz
         m2rOOEdRoSzdt47grG1YbI0GlU8nk2UVi0TKJdaSjPVD8uFt3CRN3smc9s9bDZU8v74z
         Fj9J47YJbGQCwJuEwU1qhQgabfC1dRrPYnOXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331511; x=1785936311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxRPflN3iFPRaN7MvhOojK+/ED2JjR9/A2fDyiD+Y/8=;
        b=gS29XaONdYbyiEmWhk+eNTUEo3ifFtnL3HFGWd+hNbuh7Etm5LQIMn860nBZcFhbYt
         m4Q5PAsYVNl8XvK8Xzt83PHMUQ0rl/Kt/GJ/UPSL5fsQ3deZ7vNvd+L6vidyTJ4VW1te
         8n3cLMpOf/DRrx2Ny/z6f907p+FMOYX/jnva/m6qkZN1RnnfUHpCKqBfRMVOaZCZt2JN
         dnBHjwNJSJ1ChY/I9A4l9VZPsWUnOaxcVCpOdpWk7W6Fv7Bgnj1CwJOS1IHzxpYvSHJ3
         ULvtVVHYeupOyg1AgSNIv5n3fCer067MbRnZU2fO2RlAyfDyBsltyBXG82R0a+NH/1yb
         jeMg==
X-Gm-Message-State: AOJu0YxoTf6AmxpsBTLFzqRW76YmaRCoiPJtaBsll8/OBvd5xVlRMJwf
	Re6W9ohx7s+vOp/O3qLrbXsmb7AIwbwrepLzbretqK2pfr87TvbjTBnZtMCjWbZ/0KAaITvrSb1
	vekM+
X-Gm-Gg: AR+sD13oIim1z+Z0SXN4Oth1Y6cJr/7PWgaP2HB7vKCJyhYYtlWq4Wv+Aubl7DNy+X0
	821QULGwrhbp6cpDdCeUWziu4N1zIxuP+KLzchAXVcgQkPHHpk4ok2q8/7lRlG1/JNy1begiAME
	rjhyVTY9M7UqsUeOB1eqjkXe003Ahfloez5W4cuP0ZSdjeU1FCqT7Y8IOSo5IEnI5fggwO00Qq4
	hJuiV9fS7tBx8mA7abqmArGK+2Y4gn7P9snqS48KQ97VdrB0967fytb7de/J6UHOO9dzRZNprgt
	q6OQktbgVOeFC323BHamCBeLhbu7e3pg4CwZxWTZmFliatTs6MdK1MfxXVvuXHoOlbDSEpzHoUB
	jnQ8FTAwAyp471tBVUlhLvFFW/TLuejw8GEUgrDtYsKgnflobjGVMPlGWN84fXyDy63bV4dznv2
	r6cAwlfzKKPLUhO9SFqOM5nMLu3/Qkue3R7vGV69jfF/vv7CQdiciXQWcBO1YnSHlR5LGTHtmp8
	OTUtPAkITtdL/YSBa5FXaXAAtIjOabHv/hH0D1c/N7rkSvCnCkAGV5DY+BGWRqLoXaJwcD85CZC
	nZ2gYKF7YihoOw==
X-Received: by 2002:a05:6000:22c4:b0:472:fe1a:1ee9 with SMTP id ffacd0b85a97d-47fb1ed8039mr7973990f8f.20.1785331511288;
        Wed, 29 Jul 2026 06:25:11 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b191a0sm7976457f8f.28.2026.07.29.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:25:10 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-py7zr: Enable tests
Date: Wed, 29 Jul 2026 16:25:07 +0300
Message-ID: <20260729132507.3183917-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729132507.3183917-1-leon.anavi@konsulko.com>
References: <20260729132507.3183917-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 13:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128562

- Inherit ptest-python-pytest and include tests for py7zr.

- Switch from PyPI to using the source code from GitHub to
  download the tests.

- Remove liblzma pre-stripped binaries because they are not
  neeed and to avoid the already-stripped QA errors.

- Add python3-pytest-httpserver and other runtime dependencies
  for the tests.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-py7zr_1.1.3.bb             | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb b/meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb
index 865e314f0a..1cbbe12fe4 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_1.1.3.bb
@@ -4,13 +4,14 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "8d51894abb38355bf14881088bb97f01fe4cb5b14ebe22f66d6297668c7e1a74"
+SRC_URI = "git://github.com/miurahr/py7zr.git;branch=master;protocol=https"
+SRCREV = "e278bc05cc937ecd1ee62bc6a058db3a21e66614"
 
 CVE_PRODUCT = "py7zr"
 
-inherit pypi python_setuptools_build_meta
+inherit python_setuptools_build_meta ptest-python-pytest
 
-DEPENDS += " \
+DEPENDS += "\
     python3-setuptools-scm-native \
     python3-toml-native \
     python3-wheel-native \
@@ -29,3 +30,16 @@ RDEPENDS:${PN} += "\
     python3-core \
     python3-threading \
 "
+
+RDEPENDS:${PN}-ptest += "\
+    python3-texttable \
+    python3-requests \
+    python3-pytest-httpserver \
+    python3-psutil \
+"
+
+do_install_ptest:append() {
+    # Remove liblzma pre-stripped binaries because they are not
+    # neeed and to avoid the already-stripped QA errors
+    rm -rf ${D}${PTEST_PATH}/tests/data/lib
+}
-- 
2.47.3


