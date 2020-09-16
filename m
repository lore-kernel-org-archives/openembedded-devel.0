Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.15626.1600232292513855887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 21:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f3KRFKa3;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id gf14so903489pjb.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+xTEtgbLpL2HnQoRsOLYqwwpQ7SIJSh+J+1fyCrOos8=;
        b=f3KRFKa3XIJ6cN5DtVhXZ5g0pzZ31efp8exRdqPcDiO3hVkf40k1PkH4vF7dC6J2iB
         jLO9ufLktr8Q3UYdnrUQTvHITBTneAuWwalvfxsLwL2F9j4omvjllZNykVZOrUvqseO3
         +p6LQSNWVGm7BQIFZlvbm5hbh0OlRyrQaUIJ5E98isfMPuaUHiQ4FR6w40fm3Esi8U6h
         NYeHPuQUB1g38lcK74MDuKG8DCpX1nTAWWyMQuctZAJrenjQBK30u1egVpR21bbkeiS4
         pKIolhqtiHRHH28PZ9xb2RqLUiZqaFmL8p/e1aPVDzheEa1ASCePm/f8Augk2ZUX6kHT
         ODaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+xTEtgbLpL2HnQoRsOLYqwwpQ7SIJSh+J+1fyCrOos8=;
        b=EYZeudHfVN8gLBjBcaWCANS79HfB1siOCaWhgX50LWcs+s6NGw/EUnT7ZVu0LsV4/x
         SsBfhOyf0S2yQi/TBUwyfVYBeJcSJVCubhvTQXstGa4jAEg/pgJOVgPTDjJTPRCUhDpP
         dfZoQqIgp0kC4PRBIG5MEvbHQqk7+lnc5YQPR8gDA2hdFFSqD2P0E7jpkyWtZPVL9pER
         Vpg3ZPFRot5dXb+Xsk1ZxR+Y8RNfWMB6ewmXU++agLdsaSx1MtSrYRPdO39ecYTZb6yc
         TWnSf6v6vENDrZWCh6thytOpeiOCZasIzoKvay8BU3CdIkhR/obYVp8MfDX1YYzBPE7M
         8b8A==
X-Gm-Message-State: AOAM530fviGsun3FDrWownF2zGIvINbzu36II4ZI+pGx+7CqLczf1fep
	wp7x8Emhhd/sF5MX2Zp0qH8YPUJQ/13VgQ==
X-Google-Smtp-Source: ABdhPJx7lJuyrk/bn8M2cR5i3OYGC4igaF9ticieHUT1QOdGDRINU0vpzqtMyiIo+WA/Z9DPur4qow==
X-Received: by 2002:a17:902:d888:b029:d0:cb2d:f274 with SMTP id b8-20020a170902d888b02900d0cb2df274mr22391937plz.13.1600232291686;
        Tue, 15 Sep 2020 21:58:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1759])
        by smtp.gmail.com with ESMTPSA id 1sm8311606pfx.126.2020.09.15.21.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 21:58:11 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-test-generator: Enable ptest
Date: Tue, 15 Sep 2020 21:58:09 -0700
Message-Id: <20200916045809.2153795-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-test-generator/run-ptest      |  3 +++
 .../python/python3-test-generator_0.1.2.bb       | 16 +++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-test-generator/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-test-generator/run-ptest b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
new file mode 100644
index 0000000000..5cec711696
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-test-generator/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest
diff --git a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
index 14943a4bd5..a83ee5efc2 100644
--- a/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-test-generator_0.1.2.bb
@@ -5,10 +5,24 @@ parsers that prevent any potentially malicious operation."
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=041a2bff595d40ccb4b36356f89dab00"
 
+SRC_URI += " \
+	file://run-ptest \
+"
+
 SRC_URI[md5sum] = "6c69e73ba5b4b3ed62f7bcda071c64f1"
 SRC_URI[sha256sum] = "ad5925c814bfe79497b43df096e3bb52c166d1577f7aff160137301676232f4a"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
+
+RDEPENDS_${PN}-ptest += " \
+	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-mock \
+"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/tests
+	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}
 
 DEPENDS += "python3-nose-native"
 
-- 
2.28.0

