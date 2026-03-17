Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A960CFED9F8
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 17:23:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81721.1773768229997841123
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 10:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DnalzMIY;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so37810565e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 10:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768228; x=1774373028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cu4mawSHiRmGam9fLCGhXCaBuSGe+/I0dWP8gcy/mpA=;
        b=DnalzMIYXywtMHgFkZHGxHoDhMjwKSFq7g/M5Z5Upajpt9HIpPrOogVbM1GEQk83pN
         bzYTKRkAh6VJVNI6zHfkjf8EJIVkGnBr7bFRupag4prodEoWh1qMVQyHJdt4wvva7sal
         7GuPoDDkKgF7TK9pKEV90NHhs6xQDmRZsTjpcsOQfenNioYKkDq898qCRtFtmWLWZb2l
         mZ39F9SGJoLEjG7XscvB9v1ee8krSKRn2CMHDmxfepal3GIY2VgBvgENsGueouDUV5N/
         PIVKJjPA+yD7xgrc1CUA/5LYsz7V3Wxm/xNVidAAD1hL/c0CU2KN6tM90jnHn/mztOyZ
         eYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768228; x=1774373028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cu4mawSHiRmGam9fLCGhXCaBuSGe+/I0dWP8gcy/mpA=;
        b=lWAQ9Y5hOI2oeHWZFtjhv2GLovDOnPIk1FyVMrOimOFFDEtKWcaGE+eR2RhfECUu20
         1+21dH8sryXiWZySFumtPCq5Y3b3TwTUnG42QAKKL8j1sfVgBhzLCGRpY7DiTjXrQ39C
         ZPl7lsr+EHibKPLkGqpqHSRgcS/lEsuuN01r169WhH+L2THMVlAvPjCZ6FRdwO914IEy
         zQyv7XBq28KP2+hrVk0R7gw4D/oTQvUpJs9ABnlDNnlaZs/SEzgHn8/KoNRDIpcUvLVL
         KQHVYBbEsf/W4zaoxgVjsDO7iLBCqGOir/YSaNHGmzY/Z0EyHeDZzrc1GyR4kE47uXoa
         NCgQ==
X-Gm-Message-State: AOJu0Yy3cMxSFhQ/j1fr2Ljum2cxxVhqLgtNV0DbyPmFYsn7RQV0z6VO
	KR11uCtikl5tf7frHWXgVv2D8ejy7SNSiCtEJiAWUB4CYiZXRa7e23HV8JOXHg==
X-Gm-Gg: ATEYQzzw1sD8Phky1KDn2Xf3r+PokUk6Xhp6M2rONidytSkxAlEk+8Mac168DH38+wk
	YvzLbgv7D4zzjKiSzi2hHBzvkdjMlj/DHp1RDcL4VNosUuXLwHDJr78DskS1HGOYAxhbcqDlzl9
	JJoFvsUX/wJihxKR6XcczDJ5BEvbuNdCPwBIDzOEXzI2/Szte87PLa0tNFn1H+wB7JTnonFQi92
	4ckI41vbfQvX0+x9MgsmrciR6r5GOKtiTmuZ37jx9pJy7P5wC10ic883r+wsuDoAB6ou0kOXXNz
	XSLBVe7xVxg0N3b5cvQ6fTkXzPLDYB1f3yCIkX4OQ6FleWbuOcDPtDYJll65gDd/Y9vCgSYXX06
	Cl5i2d00Xyf0CxDB7W9kh6YuWUrwKf59yni5+Mh8BY6bScSy7Y3ux9GM2Fnfyh86+lnQc8xgfeR
	IPbU5CtE8phXdib8UU9VxY
X-Received: by 2002:a05:600c:3e8d:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-486f447503emr5642705e9.19.1773768228103;
        Tue, 17 Mar 2026 10:23:48 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm61717385e9.2.2026.03.17.10.23.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:23:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/7] libde265: patch CVE-2025-61147
Date: Tue, 17 Mar 2026 18:23:41 +0100
Message-ID: <20260317172346.2862459-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317172346.2862459-1-skandigraun@gmail.com>
References: <20260317172346.2862459-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125324

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61147

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libde265/libde265/CVE-2025-61147.patch    | 103 ++++++++++++++++++
 .../libde265/libde265_1.0.16.bb               |   4 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
new file mode 100644
index 0000000000..56d48f2a7d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
@@ -0,0 +1,103 @@
+From d73508b7578964f2115ddf051b8fe9b4445978d4 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Tue, 9 Sep 2025 15:14:05 +0200
+Subject: [PATCH] check for valid integer command line parameters (#484)
+
+CVE: CVE-2025-61147
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/8b17e0930f77db07f55e0b89399a8f054ddbecf7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ CMakeLists.txt   |  2 +-
+ dec265/dec265.cc | 44 +++++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 42 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4da99216..997945a9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -5,7 +5,7 @@ project (libde265
+     VERSION 1.0.16
+ )
+ 
+-set(CMAKE_CXX_STANDARD 11)
++set(CMAKE_CXX_STANDARD 17)
+ set(CMAKE_CXX_STANDARD_REQUIRED ON)
+ set(CMAKE_CXX_EXTENSIONS OFF)
+ set(CMAKE_POSITION_INDEPENDENT_CODE ON)
+diff --git a/dec265/dec265.cc b/dec265/dec265.cc
+index 79f67cd3..ecf5d131 100644
+--- a/dec265/dec265.cc
++++ b/dec265/dec265.cc
+@@ -27,6 +27,10 @@
+ #define DO_MEMORY_LOGGING 0
+ 
+ #include "de265.h"
++#include <stdexcept>
++#include <iostream>
++#include <optional>
++
+ #ifdef HAVE_CONFIG_H
+ #include "config.h"
+ #endif
+@@ -563,6 +567,40 @@ void (*volatile __malloc_initialize_hook)(void) = init_my_hooks;
+ #endif
+ 
+ 
++int parse_param(const char* arg, std::optional<int> lower_bound, std::optional<int> upper_bound, const char* arg_name)
++{
++  int value;
++
++  try {
++    size_t len;
++    value = std::stoi(optarg, &len);
++    if (arg[len] != 0) {
++      std::cerr << "invalid argument to " << arg_name << "\n";
++      exit(5);
++    }
++  } catch (std::invalid_argument const& ex) {
++    std::cerr << "invalid argument to " << arg_name << "\n";
++    exit(5);
++  }
++  catch (std::out_of_range const& ex) {
++    std::cerr << "argument to -T is out of range\n";
++    exit(5);
++  }
++
++  if (lower_bound && value < *lower_bound) {
++    std::cerr << "argument to " << arg_name << " may not be smaller than " << *lower_bound << "\n";
++    exit(5);
++  }
++
++  if (upper_bound && value > *upper_bound) {
++    std::cerr << "argument to " << arg_name << " may not be larger than " << *upper_bound << "\n";
++    exit(5);
++  }
++
++  return value;
++}
++
++
+ int main(int argc, char** argv)
+ {
+   while (1) {
+@@ -578,9 +616,9 @@ int main(int argc, char** argv)
+ 
+     switch (c) {
+     case 'q': quiet++; break;
+-    case 't': nThreads=atoi(optarg); break;
++    case 't': nThreads=parse_param(optarg, 0, std::nullopt, "-t"); break;
+     case 'c': check_hash=true; break;
+-    case 'f': max_frames=atoi(optarg); break;
++    case 'f': max_frames=parse_param(optarg, 1, std::nullopt, "-f"); break;
+     case 'o': write_yuv=true; output_filename=optarg; break;
+     case 'h': show_help=true; break;
+     case 'd': dump_headers=true; break;
+@@ -592,7 +630,7 @@ int main(int argc, char** argv)
+     case 'm': measure_quality=true; reference_filename=optarg; break;
+     case 's': show_ssim_map=true; break;
+     case 'e': show_psnr_map=true; break;
+-    case 'T': highestTID=atoi(optarg); break;
++    case 'T': highestTID = parse_param(optarg, 0, std::nullopt, "-T"); break;
+     case 'v': verbosity++; break;
+     }
+   }
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
index 40910633e8..701f0e5f69 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-3.0-only & MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2025-61147.patch \
+           "
 SRCREV = "7ba65889d3d6d8a0d99b5360b028243ba843be3a"
 
 

