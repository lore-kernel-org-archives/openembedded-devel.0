Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDB9109446C
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 10:57:25 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8842.1774090636263241675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 03:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K67aTQWt;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439fe4985efso1130817f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774090634; x=1774695434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zpytB0MAeQRMQZQXTGiGL1NvbingnlW6qFrw49so6tM=;
        b=K67aTQWtyaryGu727oPJ1QEqFVBr6YjZLL0cI2qyBGvwyKcuns/h9pCk6MmTRtp1d0
         c+8GXvmqSA5Q6eIdyYBRgdVOmcXRt1NdDZ3njEAUuy0lzEt07s9tbtqgEvnX0Ik20Ktm
         85GllDEPQnKUc1q5rLOkzElN6O30RV7hlDNBLG7bF8G9JhJnWXzhrxY77i+JEgmPdNV2
         3YhcM8UUHj6RSnj2+FGMITwvmbHh5XFWD1P1yEUVIDLZfWXdrjzLgqbm5BZNpl4/UPRK
         oNEPKvlglGJa8vDWFT+h0jms10iNRjcboxN+xGcr4Qgv9Bvd4c4HAkxPqdUyzkCX3mjY
         C4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774090634; x=1774695434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpytB0MAeQRMQZQXTGiGL1NvbingnlW6qFrw49so6tM=;
        b=OJcaNQU1sfUEJTELgkvwM7pYORTrfel+KU61+ROdDrMJML10Kdz1wou65gprEgau0o
         s6PFdJ3xBxBkAuhhJh0qHyK6HsM2UVVQyuW6TvTPEs9dugVUb4iA2kUybt5D/Dp5fC14
         e5NTsqqdSkRkDZCmpGjLOI3JRbZSZUSGu+mYtn/UlXpzigMLGRxlmPnPtlua9LlQ6/yR
         oTgwb8oYQhMGoG3TzLhfNx63l6JL5W8zfFkm1W7SRZtAuijpm24sOOTsM9V7jFmoRUp4
         px2IC/R9nzXoGrf8AMS6YfZOUscixF8XRcWmGGE+ka96qqRohWqZvFzrPrESJDUjNaXB
         nZ7w==
X-Gm-Message-State: AOJu0YxGgj76TWElrQMnzCLANK5tyOpnRXjNreZgwFPsLDNMe19eiQ92
	8khRUBtKnJXtYxV4g2BZsA0DMOBSAhanC/LG2btFMlGyrozofGaamFedSAnh9Q==
X-Gm-Gg: ATEYQzx7eCrLbkAAWOHvf37ZKczLi0ZKQJndkbH8aW6r+pT+Ai6wTgvrHR6ChF2IMqg
	3ZgbCAwYeQdSwiljOjVSVVJIxWRLYM66qmeoDB2IhzU4tJGAqP7OMud5Qljx3o/I/UiLBAThDhy
	d2bn8SRZ5KlJvGAS6TGp1zzbH3j4GbwQRaFRzG2/1RqN7k1Zubk7qrmqzFnNbs/tE1G6JRPyyeH
	xLwikhjJb4vADA/eX4zYaV0+UucwD+PZLKVxCWj0Dhyovn32T7VimZ+6007MZW3gAYrZPmmw8IZ
	xaEHMGayMIA6n7dlzYSDDFAbb9n/d/UbXe3uLX3OllkGsqSectXYGr3/uL9SrTl3GBFPAc0hWy/
	UE6dB58QLRw7tQVCYpkv7QxkpNzf4ho5ItwkgWr9edD7EepV1KjwMtSk3YslOKrTWQ5x5PNA3J0
	qnBBUb9ncWN2Wklzwqqh7c
X-Received: by 2002:a05:6000:178b:b0:439:abcd:b305 with SMTP id ffacd0b85a97d-43b6423b72emr10107021f8f.13.1774090634158;
        Sat, 21 Mar 2026 03:57:14 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae132sm13170822f8f.6.2026.03.21.03.57.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 03:57:13 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH] libde265: patch CVE-2025-61147
Date: Sat, 21 Mar 2026 11:57:13 +0100
Message-ID: <20260321105713.4114565-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 10:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125458

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61147

Backport the patch referenced by the NVD advisory.

Note that this is a partial backport - only the parts that are
used by the application, and without pulling in c++17 headers.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libde265/libde265/CVE-2025-61147.patch    | 84 +++++++++++++++++++
 .../libde265/libde265_1.0.12.bb               |  3 +-
 2 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
new file mode 100644
index 0000000000..f412de1a53
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
++    std::cerr << "argument to " << arg_name << " may not be smaller than " << *lower_bound << "\n";
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

