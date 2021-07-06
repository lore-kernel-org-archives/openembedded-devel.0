Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.12787.1625606676176080433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 14:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uvmlKzmL;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id l11so233714pji.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 14:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NedBQVsC9wKLuaAkBJvRJXlhQmnZS1GXMTW2fLyrdco=;
        b=uvmlKzmLdHwsZEtvE5JBsT1raaNmMXRQI24AWgftwfVWKrz/BXRG6GiwjWya5MsleU
         0+8qeyVjDEzDr2L50+tLYrDHHWWO5AIqrxeBoEbX+08Uk5ik8d9Zs6Nau/lyBF3H6AOa
         qrhgAc8jlfKexMo5JKduvv112F+uS7/+QEVDgQJZbK08yrBCYUIyrkQTXJjRdq3SXRMF
         1vqfi+GqWRDiMoioBiTi0ZRIMltwhNIohrfBNvzy8v9wI645Tl5rWKtnqhjBFxIe9jeM
         lKfVWKg0woeGGBY7PDLzQ6tbyfOQbEpn/E4eNn3U+63rDMGaWFMRIhtHS9HWMyZMjzz7
         nDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NedBQVsC9wKLuaAkBJvRJXlhQmnZS1GXMTW2fLyrdco=;
        b=EFTt7Hg1/qtITVm/HDlQiPIHU/lrw5YuQySGh8HRsofY1qf+WT/aKON4jwEOTF4bFJ
         t2zfxPwF0DCgez5hW5FByKsOyXFXZoHPv5EYohm3cnqCN614QVwnNIjV98EDDR0SCjQ1
         jfbnaCYGu9t/Mw72AM/YaOBxgd21BmjTRSvwpmnGXfTSS/ouoDQOKyY7TLVlHQzFzMlc
         YVjUMifXJQNac4IRmQCk92p8gUfjyVsRu2kIuRIst/BYZz25ufn8OcIyO68ORhQPzCH1
         YDj6OmiVonFFJtmW5quGoChB1DARWPIz562UDfomhkSmWT5uscIJB5L7LxY2my9YRqhh
         O53A==
X-Gm-Message-State: AOAM533AlGvZ/QfjPgAzyYJpV0H+GyIiDB7uNy+9TY2945SZbc4pzWvV
	fI/Smr8wFTJV7Hlg9EL7h6cEL1/I6fQZmQ==
X-Google-Smtp-Source: ABdhPJz7CvmkURwRsYqq3V/P0QK6onUjqJaQyGLu/8wSfPYZor5cD0cYJpD8gX8VVIsGXzlGqupmnA==
X-Received: by 2002:a17:902:a513:b029:11a:9be6:f1b9 with SMTP id s19-20020a170902a513b029011a9be6f1b9mr18175991plq.55.1625606675412;
        Tue, 06 Jul 2021 14:24:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id u7sm19929689pgl.30.2021.07.06.14.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 14:24:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] keepalived: Upgrade to 2.2.2
Date: Tue,  6 Jul 2021 14:24:32 -0700
Message-Id: <20210706212432.3107296-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with upcoming glibc 2.34 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...layer4-Change-order-of-include-files.patch | 58 +++++++++++++++++++
 ...eepalived_2.2.1.bb => keepalived_2.2.2.bb} |  6 +-
 2 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
 rename meta-networking/recipes-daemons/keepalived/{keepalived_2.2.1.bb => keepalived_2.2.2.bb} (87%)

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch b/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
new file mode 100644
index 0000000000..f9cadbc26d
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/0001-layer4-Change-order-of-include-files.patch
@@ -0,0 +1,58 @@
+From a85ca79143a87286f793957e803ee3daf03c2b57 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Jul 2021 14:06:44 -0700
+Subject: [PATCH] layer4: Change order of include files
+
+curent order to include standard headers first is causing an isue with
+glibc 2.34 + kernel-headers 5.13+ where order of including netinet/in.h
+and linux/in.h matters and it does not define __UAPI_DEF_IN_IPPROTO
+before including linux/in.h and then later includes netinet/in.h which
+then means lot of definitions will be defined twice and compile would
+fail. Re-ordering the local headers to appear first solves the issue
+amicably, and I think this is right order too
+
+Upsteam-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ keepalived/core/layer4.c | 21 ++++++++++-----------
+ 1 file changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/keepalived/core/layer4.c b/keepalived/core/layer4.c
+index 90cdc84..c122c29 100644
+--- a/keepalived/core/layer4.c
++++ b/keepalived/core/layer4.c
+@@ -23,6 +23,16 @@
+
+ #include "config.h"
+
++#include "layer4.h"
++#include "logger.h"
++#include "scheduler.h"
++#ifdef _WITH_LVS_
++#include "check_api.h"
++#endif
++#include "bitops.h"
++#include "utils.h"
++#include "align.h"
++
+ #include <stdio.h>
+ #include <errno.h>
+ #include <unistd.h>
+@@ -33,17 +43,6 @@
+ #include <sys/time.h>
+ #endif
+ #include <linux/errqueue.h>
+-#include <netinet/in.h>
+-
+-#include "layer4.h"
+-#include "logger.h"
+-#include "scheduler.h"
+-#ifdef _WITH_LVS_
+-#include "check_api.h"
+-#endif
+-#include "bitops.h"
+-#include "utils.h"
+-#include "align.h"
+
+ // #define ICMP_DEBUG	1
+
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.1.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
similarity index 87%
rename from meta-networking/recipes-daemons/keepalived/keepalived_2.2.1.bb
rename to meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
index a778d26097..f0cbca1bec 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.2.1.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.2.2.bb
@@ -10,8 +10,10 @@ HOMEPAGE = "http://www.keepalived.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"

-SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz"
-SRC_URI[sha256sum] = "91186f20c83ffc48d7a15a9a6e2329ed4feeb2dcb51f4aa9672c8840190ea741"
+SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
+           file://0001-layer4-Change-order-of-include-files.patch \
+           "
+SRC_URI[sha256sum] = "103692bd5345a4ed9f4581632ea636214fdf53e45682e200aab122c4fa674ece"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"

 DEPENDS = "libnfnetlink openssl"
--
2.32.0
