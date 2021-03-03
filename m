Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.2643.1614745014657365542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 20:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f8PjsQXw;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id o6so3511257pjf.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 20:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2TyhHAVHNaGri9H0RA2X0IfTh8+JoHXMW/IoTTjArQ8=;
        b=f8PjsQXwlPLMnd+5AsGmDqPF7D82ujkp1blATqwfh6jOJWgWOF4nSs53/VD68YUC1L
         1Gd3HapOdrgpTNmnrcUrdW+UJ2t/1MuNrKXPUdP0JNvI4yqsetaGdUXGeNAAMCiCFsSJ
         CKBP4i9/3h78Xt4Eb7A76gLMEgUK1ghxfZZXrrUqngYrEq8T/8UrcAlfbGtFSlpDEY9S
         3h+/nt6rJ/90k+cmbnVRgtFCgt0PbIdwPLBIC+j97iHb5rR/wAQOWG54LpDAyYLczP32
         SZcrweOjGGqCpocoZl3UmkZQ//LMk04QhvWra9fhqEn2mPfw44QNgQ3Y4+asKs2EbNE4
         irBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2TyhHAVHNaGri9H0RA2X0IfTh8+JoHXMW/IoTTjArQ8=;
        b=TvfHxiWOmcatRnLzrGsZhHrH5VzhnKdKI4xS40yXmYmXsj59EVrrM5DC7ASN34L0Yn
         CURRzBahbGTeJuw73up5TnkH9LURNn6Jz/rcyznd8sm1rYVT63GGf+LeuitXOorcXByx
         0KBTnLpWYGriH1XBFCrVVz6EedV8If2VyO2FijjNSo+0nbCLbSPamQsmYvOX0f6gKVFh
         GZ2aWzkmXcBm7TLOiHRalRplOWhOWkq/bd+aHc69V0LUwvf4SiuFioZsy/yBgL+dfcm8
         j6uCs9Xa9OHUoF8NVb3DW78evIPy+ews8/fWQR6l6Id3WFdoijE/dcbmNPH9qR9Q5Euj
         mFoQ==
X-Gm-Message-State: AOAM531XDnFtwilR4U9bhY4Hzhe7Zz/60vQ0AuKOzj7MXHfy028c5DRu
	YhYYPxGnMtwiEA5CfESV3zwGn+gwE1ETtw==
X-Google-Smtp-Source: ABdhPJx1Yy1/53WWR+T7sUZWq+uwRje+DAyZb+NFgicBTmMtkeN7EAeHLA0lv0AA0He9onuiOLd3ag==
X-Received: by 2002:a17:90a:d3cc:: with SMTP id d12mr7894688pjw.202.1614745013944;
        Tue, 02 Mar 2021 20:16:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id m9sm4824631pjl.4.2021.03.02.20.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 20:16:53 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/4] minifi-cpp: include limits header for numeric_limits definition
Date: Tue,  2 Mar 2021 20:16:48 -0800
Message-Id: <20210303041650.2457462-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210303041650.2457462-1-raj.khem@gmail.com>
References: <20210303041650.2457462-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cxxopts-Add-limits-header.patch      | 34 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-header.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-header.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-header.patch
new file mode 100644
index 0000000000..ef26c475d8
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-cxxopts-Add-limits-header.patch
@@ -0,0 +1,34 @@
+From fda0713ce3e07786757a057abe7ebf2146d33780 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 2 Mar 2021 18:31:45 -0800
+Subject: [PATCH] cxxopts: Add limits header
+
+needed for numeric_limits
+
+Upstream-Status: Submitted [https://github.com/apache/nifi-minifi-cpp/pull/1021]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ thirdparty/cxxopts/include/cxxopts.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/thirdparty/cxxopts/include/cxxopts.hpp
++++ b/thirdparty/cxxopts/include/cxxopts.hpp
+@@ -29,6 +29,7 @@ THE SOFTWARE.
+ #include <cctype>
+ #include <exception>
+ #include <iostream>
++#include <limits>
+ #include <map>
+ #include <memory>
+ #include <regex>
+--- a/libminifi/src/utils/StringUtils.cpp
++++ b/libminifi/src/utils/StringUtils.cpp
+@@ -21,6 +21,8 @@
+ #include <Windows.h>
+ #endif
+ 
++#include <limits>
++
+ namespace org {
+ namespace apache {
+ namespace nifi {
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 34090cf28c..322b58477d 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
             file://0002-cmake-LibreSSL.cmake-use-libressl-local-source-tarba.patch \
             file://0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch \
             file://0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch \
+            file://0001-cxxopts-Add-limits-header.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
-- 
2.30.1

