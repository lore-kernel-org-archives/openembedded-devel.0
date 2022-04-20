Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B53C3A59E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.5681.1650447750878541053
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 02:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=suL8ZSZn;
 spf=pass (domain: linaro.org, ip: 209.85.167.47,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id bu29so1887801lfb.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Apr 2022 02:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qUnLiwIjv69/S4PXxbAWMvfEbG9J/WG3TkM0jMFlFc=;
        b=suL8ZSZnp/PxunifvTyybWJ22f7oA3qTTSGFaZBWavIjqrzJiO8tv+AxdalLgQzmCz
         DyNg/pFu1tnw7cSm65eNESQ0NlyegSQc/HGO0eF/abP/pzJhox/crCi1t87j6G/7w9tH
         3sEFfRNaYBss2T1tjawi4L2yAV73ev+eL7pFXQYRkfvqjfdDdnphdE6zkduDXvYFBf+V
         aSVg+XlSUTkBbNsPYi2k4MugCP+ZHyK0r2SCRYe6l2Gly8EusYr5HCO+aYkU823ZuSDv
         Js9qsq3qhdDXGBSizaZ0bCoSnh6XCD7fB5jN774PcT80ZO8HU6TfzkU/SzBQENnCD1RF
         cLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qUnLiwIjv69/S4PXxbAWMvfEbG9J/WG3TkM0jMFlFc=;
        b=n2Tg4rcghodcAU/eGDBjVCfbT8XCgfUuBZw+lGqO6bzai6ErYQB7SvoVe/8ZspLpiz
         4naYwJEgf6luF/ktCLP/e703QgPutmQ2G2IQanl3IWyV04sixroXgpmUUL6ftYLkXgm3
         1Xdm3KcmryPiqFgFT8zzpNAC6Vt6uX9pv3zv1rN0dX/yPG/w1+ded9iBdmDqZC5RHk0n
         hhzAL4wx5kvTq70rwGE4q3CXAyQ3YxM6AdR62C0ELp323LkP9egu5YlzLX7jHHeY/p8C
         mYxt62lzKT3Ecfry3+g1S1RNWetObZOoZkANH1ufuKhsHUv4ZmifFE9KbUOxFli4fp1Q
         DRwQ==
X-Gm-Message-State: AOAM530Fqzoy8zo+kHkinMiVM80IwXWfmuUiVRJT5aG1mJqYiVQCrOLB
	eCEph/7sUaB74ORQ3xNOu+yDxNdiNfirDw==
X-Google-Smtp-Source: 
 ABdhPJxRf37pP2PHpmXdiohygXZnoJO0Zpv8ywm1bpMJ5zFuLgAZlCqu5uXF66toAZ0fuatOnrgW1Q==
X-Received: by 2002:a2e:8617:0:b0:24d:a185:76c9 with SMTP id
 a23-20020a2e8617000000b0024da18576c9mr12853837lji.312.1650447748742;
        Wed, 20 Apr 2022 02:42:28 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 w23-20020a197b17000000b0046d1729e7d9sm1767031lfc.294.2022.04.20.02.42.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 02:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gpsd: split python utils from gps-utils
Date: Wed, 20 Apr 2022 12:42:27 +0300
Message-Id: <20220420094227.2826875-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96713

Neither gpsd nor significant part of gps-utils depend on python. However
installing gps-utils package would require installing python, which adds
about 17 MB to the image size. Split away gps-utils-python to allow
using gpsd/gps-utils in the systems with limited resources (or in the
initramfs).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../recipes-navigation/gpsd/gpsd_3.23.1.bb    | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
index c11d4c76d64e..9ed94f7487e0 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.23.1.bb
@@ -77,7 +77,7 @@ do_install:append() {
     install -m 755 ${D}${libdir}/gps/*.py ${D}${PYTHON_SITEPACKAGES_DIR}/gps
 }
 
-PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
+PACKAGES =+ "libgps python3-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils gps-utils-python"
 
 RPROVIDES:${PN}-dbg += "python-pygps-dbg"
 
@@ -106,31 +106,36 @@ SUMMARY:gps-utils = "Utils used for simulating, monitoring,... a GPS"
 # Python files are required for gps/fake, required for gpsfake.
 FILES:gps-utils = "\
     ${bindir}/cgps         \
-    ${bindir}/gegps        \
     ${bindir}/gps2udp      \
-    ${bindir}/gpscat       \
-    ${bindir}/gpscsv       \
     ${bindir}/gpsctl       \
     ${bindir}/gpsdebuginfo \
     ${bindir}/gpsdecode    \
-    ${bindir}/gpsfake      \
     ${bindir}/gpsmon       \
     ${bindir}/gpspipe      \
-    ${bindir}/gpsplot      \
-    ${bindir}/gpsprof      \
     ${bindir}/gpsrinex     \
     ${bindir}/gpssnmp      \
-    ${bindir}/gpssubframe  \
     ${bindir}/gpxlogger    \
     ${bindir}/lcdgps       \
     ${bindir}/ntpshmmon    \
     ${bindir}/ppscheck     \
     ${bindir}/ubxtool      \
+"
+RRECOMMENDS:gps-utils = "gps-utils-python"
+
+SUMMARY:gps-utils-python = "Python utils used for simulating, monitoring,... a GPS"
+FILES:gps-utils-python = "\
+    ${bindir}/gegps        \
+    ${bindir}/gpscat       \
+    ${bindir}/gpscsv       \
+    ${bindir}/gpsfake      \
+    ${bindir}/gpsplot      \
+    ${bindir}/gpsprof      \
+    ${bindir}/gpssubframe  \
     ${bindir}/xgps         \
     ${bindir}/xgpsspeed    \
     ${bindir}/zerk         \
 "
-RDEPENDS:gps-utils = "python3-pygps"
+RDEPENDS:gps-utils-python = "python3-pygps"
 
 SUMMARY:python3-pygps = "Python bindings to gpsd"
 FILES:python3-pygps = "${PYTHON_SITEPACKAGES_DIR}/* ${libdir}/gps/*.py ${libdir}/*.egg-info"
-- 
2.30.2


