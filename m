Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.6748.1586035572326721187
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 14:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id v2so11288368oto.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 14:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=unNLDjFJtWlLIvrrNClFvO6xtwuZkGBm78d7o1Tcp/8=;
        b=HmFAxXRAE3qc5r/nS/WySWgHGoi2GjLeEnZyjPZNWOLU7TBreIwyAn8gaamwEK/1Ew
         UrFIBVIeh2f8T/eBWKcVGJprIgzkFBODDoDJ8rovC6lODgyPnQS2U1lg35+As2vcKx7G
         qSXey/cqB7TN0X9r9uIEWsVBBzMW373HxUSMi+8wga5czzbwGmpMEXO4euZ7CQSIpjDw
         f9GeoEk55dKGnnyIzmeVb7pwyfn58i/eSO/9kUOhW4YJHynd5ozeRF0dZ4kAeTt2v51u
         /0Y0CIpSqu74u4+runYMetBTDETZ5lQYGlkKXs1craKnIrNDPHK6nJ14M+ifngXObVy4
         a6mA==
X-Gm-Message-State: AGi0PuYILAtY6dAFFaS2kX/2BS4Qx9BaxpTVMm8LynT8ykyBqp5g4Acd
	9abVBMpcB7m1vuuw2dDiiBXwBYljoIE=
X-Google-Smtp-Source: APiQypK3rsbKcCJ0klU0/YRhg+PuDEnqG50hjruNcQ99qD6L4Dl6rw8g9OR3OnOt6N1RJ1nUpEWuTQ==
X-Received: by 2002:a4a:8241:: with SMTP id t1mr11809740oog.57.1586035571153;
        Sat, 04 Apr 2020 14:26:11 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id g72sm3183470otg.79.2020.04.04.14.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 14:26:10 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 5/5] python-pysocks: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 17:26:00 -0400
Message-Id: <20200404212600.25018-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404212600.25018-1-derek@asterius.io>
References: <20200404212600.25018-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pysocks.inc | 18 ------------------
 .../python/python3-pysocks_1.7.1.bb            | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pysocks.inc

diff --git a/meta-python/recipes-devtools/python/python-pysocks.inc b/meta-python/recipes-devtools/python/python-pysocks.inc
deleted file mode 100644
index 1836e52d00..0000000000
--- a/meta-python/recipes-devtools/python/python-pysocks.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "A Python SOCKS client module"
-HOMEPAGE = "http://python-requests.org"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
-
-SRC_URI[md5sum] = "89b1a6865c61bae67a32417517612ee6"
-SRC_URI[sha256sum] = "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
-
-PYPI_PACKAGE = "PySocks"
-
-RDEPENDS_${PN}_class-target += "\
-    ${PYTHON_PN}-email \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-netclient \
-    ${PYTHON_PN}-shell \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
index bbda05a518..e311904fcf 100644
--- a/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -1,6 +1,19 @@
+DESCRIPTION = "A Python SOCKS client module"
+HOMEPAGE = "http://python-requests.org"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
+
+SRC_URI[md5sum] = "89b1a6865c61bae67a32417517612ee6"
+SRC_URI[sha256sum] = "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
+
+PYPI_PACKAGE = "PySocks"
 inherit pypi setuptools3
-require python-pysocks.inc
 
 RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-io \
     ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

