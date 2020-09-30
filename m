Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.16515.1601476057407057526
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 07:27:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qWpnWwUk;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: andrey.z@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id p15so3108811ejm.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=UyQ1lFUUj1fIzOAfeDKaUnn6PTU0eHfpDYLvGzTIWOU=;
        b=qWpnWwUkxZ5N4WD2VQwHrpfh8MQ3oy4t+tIxvmqRihqre4nKh3TEQ8gwytvrtDLahV
         ncj7uuSHpYgy512ew85e6tTtRKMafCgMliw56exj+ogKR9Jy9jOeufKvKXQobuv0n9po
         bxIvT/HRwBS1qOBVnq8GrEau9+BcRGpNgiKmcO4qgqOKsCT6y8XW2Dd0uI+hEwFwsgJA
         U9fJG0J3aPM+gbW0CQCFQKCOiOA77FTDTlpMETWOkQMbRxroFQ7yKuv/y55QpYsKrdvN
         j5i+/rFz7jiQ+ID6HDkMvj0qrBrflHTa/fuDzNxsedf/TKZ7Wyq4hjqb2GW4FV3y5iNH
         XrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=UyQ1lFUUj1fIzOAfeDKaUnn6PTU0eHfpDYLvGzTIWOU=;
        b=Ome3itZ2cObIglH3TQ/rpXxm2Ds09/KRXOgRHoj01QrNhN2m+LPAlrHMKPSUIwCotl
         N1iDOxMqFTyssLmvnckUcFGVLHItDPlQyT+Rd7Sx/zeiFL/GfJi4mh+dcCekVMQFeUf/
         Bgjjw2YabMyuMGWOAr+EhPQj8ABUHPeTHHoD7ZoQM6YhxxHDnf0U1Qr5dxAkKfHaUcZW
         Dk+jEtsMC2wjXMveUT9SZWx892p0lUh8wElV3NoYN/toxPdwqmAE6np0rvSFJzrekOgN
         8/MBDpY2nveccVuS+a+RR49r0uaCSpZl0Yf7WIU2qmHHeqq8gy7g5Es1RbrLJYGByjuz
         1Ygw==
X-Gm-Message-State: AOAM533OayUTkgwsmZsWGC2zt17PT2NhG9soONeytOP6Or/J8pjOzPQq
	ipv5x7aauvbUYEAlI0JA+t2OonYhm60EEg==
X-Google-Smtp-Source: ABdhPJx4E4mdGZ+Sg5MA/6Eu0lajPJXnmUSyIWvcaFjFnLZ7/2PLYaQMuT71y57QZ9h/CVj+d55ssQ==
X-Received: by 2002:a17:906:4a8c:: with SMTP id x12mr3183759eju.271.1601476055431;
        Wed, 30 Sep 2020 07:27:35 -0700 (PDT)
Return-Path: <andrey.z@gmail.com>
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id j18sm1748858edj.62.2020.09.30.07.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 07:27:34 -0700 (PDT)
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
Subject: [oe] [meta-python][PATCH] python3-pybind11: extend to nativesdk and consolidate inc with bb
Date: Wed, 30 Sep 2020 14:27:20 +0000
Message-Id: <20200930142720.15556-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1

Extend this recipe with native and nativesdk classes to be able to
provide a package in SDK.

Consolidate inc and bb files into one single recipe.

Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
---
 .../recipes-devtools/python/python-pybind11.inc       |  7 -------
 .../recipes-devtools/python/python3-pybind11_2.4.3.bb | 11 ++++++++++-
 2 files changed, 10 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pybind11.inc

diff --git a/meta-python/recipes-devtools/python/python-pybind11.inc b/meta-python/recipes-devtools/python/python-pybind11.inc
deleted file mode 100644
index d1d53e125..000000000
--- a/meta-python/recipes-devtools/python/python-pybind11.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "Seamless operability between C++11 and Python"
-HOMEPAGE = "https://github.com/wjakob/pybind11"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
-
-SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
-SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
index 355e28460..2c456aaad 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.4.3.bb
@@ -1,2 +1,11 @@
+SUMMARY = "Seamless operability between C++11 and Python"
+HOMEPAGE = "https://github.com/wjakob/pybind11"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=beb87117af69fd10fbf9fb14c22a2e62"
+
 inherit pypi setuptools3
-require python-pybind11.inc
+
+SRC_URI[md5sum] = "23fdca8191b16ce3e7f38fb9e4252b2d"
+SRC_URI[sha256sum] = "72e6def53fb491f7f4e92692029d2e7bb5a0783314f20d80222735ff10a75758"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

