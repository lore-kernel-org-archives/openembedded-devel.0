Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174751094471
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 11:40:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9360.1774093201507244117
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 04:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xo1NU37r;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fb14227cso27659425e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 04:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774093200; x=1774698000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4AQdIcgRtjSN+MZOfW/xgVDAv7+8L2hjgQwL2zpxLJw=;
        b=Xo1NU37rdLn4frUpZFWOl+GiSwnn3w4tmvIZpExeS8TvMgQBo/9iiE/MxfTSOuCqTF
         cUtsFdJcLgJ8gEzSpuum5VIjQrg0JWAsH1D7YcD9RKUJnQPYg9IkhEeFgkPuzcIMIc1P
         SpLbfxbDtRnva+frt/nnk4OZHv3x8vJBxZZwJCa8R2U1GWYNBHa+x0jRxRtKERTAdW8c
         rTUkKGLs+d0yScuAl/G337Cf8zhNeK4MMcuT83215ONztcK4lyyqCZNN08qwlLL/yEad
         cIy80SKSUbIbg2OZgR49cdtADbKKLlE6PJqR9+9IOODyKVXdhktdYTp3EkwDW2a/7G2D
         3UoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774093200; x=1774698000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AQdIcgRtjSN+MZOfW/xgVDAv7+8L2hjgQwL2zpxLJw=;
        b=P1dC3i8+OgqL9JZwnRbZJgirlIctjOdFbaSGh8Beh9bcgnPlBb6KP1Y8h1yZEePXjt
         h6PesrjnSmnX+1oedaAEyfuXMT1TdA+NAkPnvpiqL9A7PsTvasCc9FLovr4e4mLxkfiu
         gPeq86f/xnyuC2eX4YOCo8T+y6pyMt1VwYgitkM//EGD0VDxIFnY5M+N2tIWUSrcY3n3
         HEFnOxQa7vGjH5nO49HAP23NngaSQ9zrM/yTXHSZKREwSUp894lHh4xxAaeeW1cu/F56
         jwC+DexoBlDyF3KD/0KUIcKnrVqca53jGSdC+HvR18rKPTmTjVNeMk/bZKXmVwClOscQ
         MPgg==
X-Gm-Message-State: AOJu0YxeWRw3URE0jiAmpsNFXEcNEFDdLiqo/HDY6oLCGKwTcQYUG2EU
	WEfHqvZ3xMn+E3x+3iA+OJzmBmFJcaxkH6LyBhEFlG3TNW95VZ37C57b6iBufQ==
X-Gm-Gg: ATEYQzzs2Vpu7bAQHsyOVVGVVjs5Wa53uh4TNB7TOmlnWW+IK7mzWleVwCWuRvFO0d7
	FqEijj/L6vKMEsWnr3+tE0dp59+3uGc72XzqDPdZqFUrfvdj6OJKdtYxdv/j93f6YBq6tkrQv1m
	dy0URK94epVQ03ngHcDRdOdHBUL9W3HdvJk1zzu8o4QCzgVz125Bvw5yPasj3uy91Aw6vGucOfh
	G5Q9eBgUS96pz9Mi0nEjBdr41sNAyHHUwKHTSgbldeu3spaLZL4Y2Wj2z4CYOgmA4B7leo4yftC
	3CY9adonznygRBTGqjrqjs9kDEyc+ABTu5w3Sr3DP3/IyFwUdu+QUghdk+PEPH2pngf+oxP9kRm
	s6LTetxCyf9koBT9/71nW7oG6ab3Wr9a4q1Wr8GLKAnVdREXLCj9ZpMhUKMxMEw0l6ItlUE2RxN
	FUMTA3R6uoVUzy88tfUE7N
X-Received: by 2002:a05:6000:144a:b0:43b:3e0b:721a with SMTP id ffacd0b85a97d-43b642708famr9426234f8f.38.1774093199514;
        Sat, 21 Mar 2026 04:39:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a27csm14735284f8f.36.2026.03.21.04.39.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 04:39:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH v2] libde265: patch CVE-2025-61147
Date: Sat, 21 Mar 2026 12:39:58 +0100
Message-ID: <20260321113958.4137776-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 11:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125460

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61147

Backport the patch referenced by the NVD advisory.

Note that this is a partial backport - only the parts that are
used by the application, and without pulling in c++17 headers.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix patch. One error message had a copy-paste error, it tried to
    dereference a non-pointer variable.

 .../libde265/libde265/CVE-2025-61147.patch    | 84 +++++++++++++++++++
 .../libde265/libde265_1.0.12.bb               |  3 +-
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
new file mode 100644
index 0000000000..db30ca2624
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
@@ -0,0 +1,84 @@
+From 83c32b9e37f206b1b22f5cc971c817147e39273b Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Tue, 9 Sep 2025 15:14:05 +0200
+Subject: [PATCH] check for valid integer command line parameters (#484)
+
+OE comment:
+This is a partial backport of the below mentioned patch, without raising
+the required c++ standard.
+
+CVE: CVE-2025-61147
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/8b17e0930f77db07f55e0b89399a8f054ddbecf7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ dec265/dec265.cc | 35 ++++++++++++++++++++++++++++++++---
+ 1 file changed, 32 insertions(+), 3 deletions(-)
+
+diff --git a/dec265/dec265.cc b/dec265/dec265.cc
+index 8ddecfc2..84ec69a5 100644
+--- a/dec265/dec265.cc
++++ b/dec265/dec265.cc
+@@ -27,6 +27,9 @@
+ #define DO_MEMORY_LOGGING 0
+ 
+ #include "de265.h"
++#include <stdexcept>
++#include <iostream>
++
+ #ifdef HAVE_CONFIG_H
+ #include "config.h"
+ #endif
+@@ -557,6 +560,32 @@ void (*volatile __malloc_initialize_hook)(void) = init_my_hooks;
+ #endif
+ #endif
+ 
++int parse_param(const char* arg, int lower_bound, const char* arg_name){
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
++  if (value < lower_bound) {
++    std::cerr << "argument to " << arg_name << " may not be smaller than " << lower_bound << "\n";
++    exit(5);
++  }
++
++  return value;
++}
+ 
+ int main(int argc, char** argv)
+ {
+@@ -573,9 +602,9 @@ int main(int argc, char** argv)
+ 
+     switch (c) {
+     case 'q': quiet++; break;
+-    case 't': nThreads=atoi(optarg); break;
++    case 't': nThreads=parse_param(optarg, 0, "-t"); break;
+     case 'c': check_hash=true; break;
+-    case 'f': max_frames=atoi(optarg); break;
++    case 'f': max_frames=parse_param(optarg, 1, "-f"); break;
+     case 'o': write_yuv=true; output_filename=optarg; break;
+     case 'h': show_help=true; break;
+     case 'd': dump_headers=true; break;
+@@ -587,7 +616,7 @@ int main(int argc, char** argv)
+     case 'm': measure_quality=true; reference_filename=optarg; break;
+     case 's': show_ssim_map=true; break;
+     case 'e': show_psnr_map=true; break;
+-    case 'T': highestTID=atoi(optarg); break;
++    case 'T': highestTID = parse_param(optarg, 0, "-T"); break;
+     case 'v': verbosity++; break;
+     }
+   }
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
index b082faa3b9..e32a2af51c 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
@@ -11,7 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https \
            file://CVE-2023-43887.patch \
            file://CVE-2023-47471.patch \
-"
+           file://CVE-2025-61147.patch \
+           "
 SRCREV = "a267c84707ab264928fa9b86de2ee749c48c318c"
 
 S = "${WORKDIR}/git"

