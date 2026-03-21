Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C9F1094472
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 11:56:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9533.1774094159273103953
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 04:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mpEFS+IC;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so21234235e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 04:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774094157; x=1774698957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cle9KoJ7a5uKBi4IE2xunZeL8We9HbUvvv3dGYqd2dI=;
        b=mpEFS+IC8KBtmBkKBcTbj751ysnLGU2IClDc511G8YyEjhAC+m7S5cj72nlHUwHJKw
         jKyFUew+S4iK5oqCDgMru9Smqw29KnFtgKjz9Vqt4kEoj9Iufut5OzdqQQh2j4AWGlqh
         10qhKA/WN+W8rIIImQrgRtvZsMZsBkbY6deOxz3hslCp14gST503HZY/GHRsCggtkGAv
         kslhe0OgZoDJIlyR9b9whIWs4YS1jhjvLMlGUwaVwgEiRdOV1B4e58QMlfeJwyjjY394
         LwK+V4WAYWWL1uDwB+mNCP1mQLUK7/ReElhSHUOlif2ZQhFob7D92GOgbzxWjyFdYnDx
         9ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774094157; x=1774698957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cle9KoJ7a5uKBi4IE2xunZeL8We9HbUvvv3dGYqd2dI=;
        b=U9VR04GxS/xXfzElG3q5CXTai+gykfM60ALLOwUikAnCTzpZIt1eMwOgV0M3utV+Mj
         8SMKH+Dl5RTZBuJHwYVDSzyK7NVpOB5vQdof/vFto5UKiQdDsQDX6hKOYczdbGUgW1/c
         hUwwCB3b18nFz/6aYu3xq1jfxN3pvFcmP4ijyvoIdnG7m+H0chuBmh7fuPTvitqu7ry9
         vPgg3tj15o/bNQx/fWnpT/dVLNQEdgUnT9un2RcP8njY/app5Nw3Tuv8AtmT36NvsLd4
         YxA/B8r+BnbuwO7EcUD4iMHcKpEdN0ESCo9qfBH5KEi/qb+busAHRj7f/F8eJDh3bPYi
         lNhg==
X-Gm-Message-State: AOJu0YxHioK+U+DVhWEBhbtyNpyZIg0QsgvrpJ0fkMragHMkIcuv5jTP
	ErI9toQho/Hdzmb7xPbjrvQMzWk5oy1vmCcCWgIDmV5uexGpd/bSEnI116KIAw==
X-Gm-Gg: ATEYQzxLqAPp+FMGrfsaWciGw5VZsfS0jCiHQ8YQrdSKZYPGbbJMoKnV67HQFNBdQKY
	7IcTpMj3nqdoTAp6TCLZ+2g54fLKZkfE0jDnf2r1OUGcE2l3r2khoI+13FW56oVG20gqfDiXP0X
	oS4pcj2/uYDj3ObZo1yUyEMnBS1C6ipHzqi/6Ckc6WY+tfbzdR0I7nJNOY7SqmAfvFv7OofB37o
	NQFbCoheRszEKZeICImlCTcBG098AI+Bate2/bb0VKNY/UPIlCxYmz3XhXbLaShAnO7fgWGztWJ
	VLKF0/X7cBNRUG52i1DpaBpswfOd2AQkLBOCLywknFm0IcY0t1U9V+NOJi2A8+HhqHON26KSCqp
	/ug+gU0Y9sc9YddWYskD0fOoZB58owLz3vx/hd/1Lfy8sNYEpPoryoSayIcPaCqhQZ2ddlhK3m+
	ZOsoZyx3hdH9bkZzyyzc27
X-Received: by 2002:a05:600c:8b84:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-486fe8e3facmr92083625e9.9.1774094157266;
        Sat, 21 Mar 2026 04:55:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7d6c54sm311322205e9.4.2026.03.21.04.55.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 04:55:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][whinlatter][PATCH] libde265: patch CVE-2025-61147
Date: Sat, 21 Mar 2026 12:55:56 +0100
Message-ID: <20260321115556.92686-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 11:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125461

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61147

Backport the patch referenced by the NVD advisory.

Note that this is a partial backport - only the parts that are
used by the application, and without pulling in c++17 headers.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libde265/libde265/CVE-2025-61147.patch    | 84 +++++++++++++++++++
 .../libde265/libde265_1.0.16.bb               |  4 +-
 2 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
new file mode 100644
index 0000000000..e3c2ce40e7
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
@@ -0,0 +1,84 @@
+From 4f267b389e33e30f9eccfedd5768fb172a64d9c2 Mon Sep 17 00:00:00 2001
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
+index 79f67cd3..c38b0715 100644
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
+@@ -562,6 +565,32 @@ void (*volatile __malloc_initialize_hook)(void) = init_my_hooks;
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
+@@ -578,9 +607,9 @@ int main(int argc, char** argv)
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
+@@ -592,7 +621,7 @@ int main(int argc, char** argv)
+     case 'm': measure_quality=true; reference_filename=optarg; break;
+     case 's': show_ssim_map=true; break;
+     case 'e': show_psnr_map=true; break;
+-    case 'T': highestTID=atoi(optarg); break;
++    case 'T': highestTID = parse_param(optarg, 0, "-T"); break;
+     case 'v': verbosity++; break;
+     }
+   }
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.16.bb
index 3e3381b646..2676de5c2e 100644
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
 
 

