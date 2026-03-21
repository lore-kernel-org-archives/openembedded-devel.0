Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B961094474
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 12:01:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9608.1774094460061586094
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 05:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HXNapu/0;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso19750795e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 05:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774094458; x=1774699258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gvUOFwzBz0HUFJ+PBzR/T8hs/fqeiPyAPrVbxEkwP2U=;
        b=HXNapu/0uZWtTcl8V4Efb4AoMNH7l2fwnEx2DeQJ5x9lVJ5DOqCp/6+QRQ19kKEbyk
         DS/8HpsOgoKustzIMNVBn3s2EdF4iXF3+SDccGWv6QXhNu4Z2d6MNhOf2dm66/KJFu6c
         qALfmTguvOr2hZZaWchHLJQz7HSIYSbK0ahmA2yUyAeoxJJJxFkfjdEWGUF0UKTWAXLq
         h6iW7FVRK6tMMKvn1dqInsJiFrvuVucvr16awAZ7xwXDLbyEkYvFhh+ZJb22hvkdpK3A
         nYxfPBYCHv8xqPzjnnGqnpNZ7v9WsUjuHJo/qJ/QunicSITd04kXQAUogQYAY8jVznkc
         uwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774094458; x=1774699258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvUOFwzBz0HUFJ+PBzR/T8hs/fqeiPyAPrVbxEkwP2U=;
        b=MaoLBOnHIC/HAbNvPzQdUTBxkzAKJGS6ts4MeyRYulWUy4Kl1ykkEUdcK03hNjYZFR
         t+gTmo7DCaZy+7yLd58R9+V3Q9pQhN6PDiF7cCoEDxAFPPn9n9LNllKFd19MHtIiExuY
         FLfPQxzCO4R7/jaqGMUWSPtZI/bfGJUFH+gkV1ZSm4dAl1RSx2AeO3owrYvxGhsnclxP
         HB7huh+rJyyVVcJ9JNsTh+vmmOXPu4y/8heBMdG/RxYu8hLTCXhRKzb9RQ4lHNZSaLxS
         kBVMzFS2+REmIDPAI2tJ1tw2FyJN3DFm9FKc6r631+5SMUP//+B4BbLgbUIoeRoWf28L
         HqLg==
X-Gm-Message-State: AOJu0YypsNzutjq2R2gaLNa3l7QJPO8Ljcq8dXMDkoaduRXJH4x6tlsZ
	dltkLqS15/ZHthFxXLJU1teMLyoya+OQoWFk6JpAyKFcRpDZklg8zPPZbChzow==
X-Gm-Gg: ATEYQzxjwlmdmVR6Hp36SXCwJsJGFBxzYHitbh+MPke7XHfahmmKqjOW3blznI8OIXX
	dtFCOHuFBuW9LkaY2IZMmlgkjbBTkl2RarV65S1vmspp7CxoFrqGpCkijQYRh90y/rVhtrt9zDc
	+m1emwVX/Zb+4WqSwA+t4Zjm/AGdRbkoPksn/u8PWkL+R3HRTstL2F7E+XTJVagcxvMrj0rNvAE
	ss0WaLOv5xyUtXce2U9HATkODAbPU2Y4aOzccb6GffG+PrQc1+U8fwsGGoazxjkeh5rHWDaVvCm
	Df7Snc+FoGiP5jxiwHjLIeatDIuhLwdoAjyb29HsO0LCpj4S7YpJiY6+g/gzq0i5T+uSN0EyVYH
	UgmowdUXpT4ZZzz9QKqQAmMDx/f3K9vrlmK/82E01IpD/KpctR7rlJuZy/RNlfhcM0uvovgryYa
	1ZMjzvhOrPYyn94maxKDTH
X-Received: by 2002:a05:600c:4705:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-486fee0e2ecmr87721475e9.15.1774094458065;
        Sat, 21 Mar 2026 05:00:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64711f58sm14403781f8f.29.2026.03.21.05.00.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 05:00:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH] libde265: patch CVE-2025-61147
Date: Sat, 21 Mar 2026 13:00:56 +0100
Message-ID: <20260321120056.109536-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 12:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125462

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61147

Backport the patch referenced by the NVD advisory.

Note that this is a partial backport - only the parts that are

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libde265/libde265/CVE-2025-61147.patch    | 84 +++++++++++++++++++
 .../libde265/libde265_1.0.5.bb                |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
new file mode 100644
index 0000000000..359e5f0866
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
@@ -0,0 +1,84 @@
+From 3ca0ece7aac301be40e34c004d7182b9d701d6ae Mon Sep 17 00:00:00 2001
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
+index 9309465..dcd0183 100644
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
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
index a9d5523bb5..24190eed9b 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "https://github.com/strukturag/libde265/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://CVE-2022-1253.patch \
+           file://CVE-2025-61147.patch \
            "
 SRC_URI[sha256sum] = "e3f277d8903408615a5cc34718b391b83c97c646faea4f41da93bac5ee08a87f"
 

