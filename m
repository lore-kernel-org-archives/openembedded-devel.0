Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.8461.1605109764873914392
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2020 07:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hdxd+UbD;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id k7so1176437plk.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2020 07:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3Yjv1NqSyTwcVCKItZOutthBfqIPDwXWfSGBkqOkn8=;
        b=Hdxd+UbD14FKdZ09gRPq71W66bAuiyRV9MmJtogx0wm/sfuE1DD9WdW8IwALDsTu65
         xjgyAOoB6j5TITigU6XDNA67DKdO0a0Ix0jPYj7g846cNGWtsTZUtssktNa45DlABiyQ
         uBf/UAt8zLt+E8I1FW06RvPHWNp3/KIiSXYvgpPbLHRyABCCPU9zVHIvDg6/hZZi6tml
         U7OlJUGZ/xwvkjG6Z2CkXnH1taEh/eu66BSZEoSdVNpG2p9PQaZD06S9oKFYe4Ubo4+n
         7WhUwUqemPg8DAR4w3Zir3OjKHH0g2eNATzpbWgrDCYDfD7us2/YzxPewR8YBmpTSjee
         Ig7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3Yjv1NqSyTwcVCKItZOutthBfqIPDwXWfSGBkqOkn8=;
        b=cHCtnnPOsxmIMgA3BTvhbAcYkqBrCJxIP7AtuZE6x7P0gzTl7ONfB6uCA9vxzrPRZ6
         Uy0shrbHfWUDUYPQ47lTlMGJDoOIrLUb5OcRLbsymr6isGPjm6OwC/+IVJVsUDtxSKCl
         TlRpBavbWAp2KTXds8a46ukOEM0wJz6cgqhd+Am9VKPmufogrBL9TDVOFBI0LGbJo4BI
         0SkBcybe+TaRem/Ct/Y7C7TOahHLZ1VtRGaV9Wu4VYhTeXKKOzWRYgXtt5doA5npcINT
         Y9BQJJFHawNI73Faurhx/MQm/cFG8OhBh8bqQ+hzcNpZQcsisZUQRcrhHE0FI/g/RzEi
         EKqQ==
X-Gm-Message-State: AOAM5309CWXrM2P5by/YXmNaxfN5udLoWZdiaV9+tDdZpoe7+s4TyxAU
	OdG9xbs/OtTWvYm5CtmjrvZ/7ADHtD8TIA==
X-Google-Smtp-Source: ABdhPJzeBjgj2l+SDhzdnfVQ6MRl06OwMqWjoPzNlCFkEIAQNa0CwPtbeKDDKX0nr6cAYZpFRxn96A==
X-Received: by 2002:a17:902:a705:b029:d6:e486:ef6 with SMTP id w5-20020a170902a705b02900d6e4860ef6mr22916570plq.0.1605109763804;
        Wed, 11 Nov 2020 07:49:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id v196sm3164847pfc.34.2020.11.11.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 07:49:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] meta-python: Drop RDEPEND'ing on python3-typing
Date: Wed, 11 Nov 2020 07:49:19 -0800
Message-Id: <20201111154919.862517-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Its part of core python package now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add remaining recipes

 meta-python/recipes-devtools/python/python-m2crypto.inc         | 1 -
 meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb    | 1 -
 meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb    | 1 -
 .../recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb   | 1 -
 meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb      | 1 -
 .../recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb      | 1 -
 meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb | 2 --
 meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb | 1 -
 8 files changed, 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/meta-python/recipes-devtools/python/python-m2crypto.inc
index 81c81645af..797a0354bf 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc
+++ b/meta-python/recipes-devtools/python/python-m2crypto.inc
@@ -25,7 +25,6 @@ RDEPENDS_${PN} += "\
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
   ${PYTHON_PN}-smtpd \
-  ${PYTHON_PN}-typing \
   ${PYTHON_PN}-xmlrpc \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
index 178e68bd97..6cd5a4cab5 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
@@ -16,6 +16,5 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-idna-ssl \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-typing \
     ${PYTHON_PN}-yarl \
 "
diff --git a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
index a26835b607..9f152a1d60 100644
--- a/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-argexec_1.0.3.bb
@@ -9,7 +9,6 @@ SRC_URI[sha256sum] = "61f9ae9322e38ae64996848421afbdb018239a99c4e796fe064f172d6c
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS_${PN} += "\
-  python3-typing \
   python3-dynamic-dispatch \
   python3-typeguard \
 "
diff --git a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
index 2bf487584a..0ed5df1b2e 100644
--- a/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dynamic-dispatch_1.0.3.bb
@@ -12,7 +12,6 @@ PYPI_PACKAGE = "dynamic_dispatch"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS_${PN} += "\
-  python3-typing \
   python3-typeguard \
 "
 
diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
index 2bf9d07533..70527e026c 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
@@ -15,7 +15,6 @@ RDEPENDS_${PN} += "\
     python3-json \
     python3-logging \
     python3-netclient \
-    python3-typing \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
index 98db23039b..75a0926f08 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.3.bb
@@ -17,7 +17,6 @@ RDEPENDS_${PN} += "\
     python3-logging \
     python3-netclient \
     python3-pkgutil \
-    python3-typing \
 "
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
index bd92216776..cb5c372352 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
@@ -28,6 +28,4 @@ DEPENDS += "\
     python3-setuptools-scm-native \
 "
 
-RDEPENDS_${PN} += "python3-typing"
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
index b950d6f632..e567e0ba28 100644
--- a/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webcolors_1.11.1.bb
@@ -9,7 +9,6 @@ inherit pypi setuptools3 ptest
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-stringold \
-    ${PYTHON_PN}-typing \
 "
 
 SRC_URI += " \
-- 
2.29.2

