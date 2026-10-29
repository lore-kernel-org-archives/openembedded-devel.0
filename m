Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4480.1793245046930494599
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2026 20:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vQdd60TY;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2080466eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 20:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793245046; x=1793849846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PDiDU4egrDiaQEPbONDO/py82SLIxnL/LNLFJR4wvM=;
        b=vQdd60TYmMmOQ/0adS93MPlminIpTVr1zRJd7YFtdEtWPxykKUrwGicGA/BaBUAVx6
         2E599nOYG9+Qy3IdIXsiAX1+fW9ipXrfD4u3oQmNXeXoXbEv38d1i4VEDH5PA1VGfHDZ
         URTSp5E2x146wu8kCyDYYaSKRMap50rdw9k2N56qkLxykL2UqMZa8w41R2AQ/lo0y0rD
         GqilEpxMxgs8tfXEDJqJ30W1d4ZoueRcMmKgJ6iHkEfQO/247mB6X4qhCUX09BSBZo0T
         ct168a9s4NIzCgQgtLpYg/zAyxqDtbmp02AkZGswuPsxxg7fc+bWaVT2RZv0y05WA1MT
         oGLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793245046; x=1793849846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4PDiDU4egrDiaQEPbONDO/py82SLIxnL/LNLFJR4wvM=;
        b=hsZiZI1Xg3hymGFPZogwSpqdrxNGfvJogrYi7dTDeq4u+6xmIGDR8s04/MPUopyPIx
         TAysx3wK7bM23UQSwwd7BSMxQhgKD04NpKwx8SA8gETzz2+pidTxu+oOM6FQF9D5Xe6Z
         qeQdIxiOFvS8Ew+Fpo48CBIdsfdjYxJxZeKECrp3TgtQ0XF5sCQPBg8jJASlObzs0nPO
         Sp9xq9vuIRG/epZVIOHXrdssDwL4vzu9PaZ5c2xfafYaGqiDxuSz2C+LNZqot7kmeL+2
         Vwyce7o7VSOa79S5PbY8CzbZ7ONukzU7Aq38Uw3FWTmBAWj7E+p55y81nl1TuPTZoS6D
         9jzg==
X-Gm-Message-State: AFq9FYIabVBkdITMRGpusfKBnwp7qDcQQvwlrr3kqyYoGAcK6C0pldjj
	Yjw/I46wOgNQ6VMRhxmtyBLFzXeQe/g6s6pH3yb51Lc9YSXWRWl311fdIqHvStln
X-Gm-Gg: AYBFou0bznLQoj0BfU0HxepsgXjRSL7bWU37hHOtCv5YAG8hrgFx6p+f2PHrV0itD88
	5u9BLZ9w4srNw0ZyZMA7Hm82/mqe5kt5L2Vavl/ITDJ/PuhGGNWizUoNdA369evfEh3XoC0big0
	wtPI8PQ1MYMfyG/uWSg5w8y/UtXXWZxWgvBl+5H+M2R40WjRTBIeN5AG+FbWRMVdl5m7i6ykV6Q
	ty+5bxIcblFSW3cexI3g9W87aD9GIjU7xbkwWC8+eySy3EQ9oJKL08ACgDpU7av28EeK9xn5/Ca
	nnmciNpFGWTdzRyMwEbTug1u3QMg4MtK+Qwi1xGEww4rNCKzcEn49a2OL5MM2yuC0qDesnmADJc
	b2xkm3miW9LdrPYwR2PRCMVAqdGbwadCUkfSI4HjBjFqFbcDtXwL8VQt2K9UG+dS3xOZ1B5hMXq
	CtnZeqx7iMHEqnxgUdd5HRWneNZK4l9CCYIbb0v8nsc8uINTbPmGhst3DZVVRMKGApXZhfuE02s
	ywqGi6k3NHlKw3vwLs6PHaQnX6OvwJSDetIl1N3N9W9e7Yw9nnXNUb+n/qLQ+nWYhL0BDuQX0QU
	DsiYIu+GVBHuprelRS8z43qArrVJtUugWySl+gCn8m4lEs2+kGf3IODtZJk5iijeRvo40CYqP15
	uErk/azkPL3g=
X-Received: by 2002:a05:701b:4212:20b0:156:6676:d0e2 with SMTP id a92af1059eb24-1a6ced913fbmr5941058c88.10.1793245046098;
        Wed, 28 Oct 2026 20:37:26 -0700 (PDT)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f7fb28csm14021283c88.18.2026.10.28.20.37.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 20:37:25 -0700 (PDT)
From: "prasanth" <ragaprasanth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] crash: upgrade 9.0.2 -> 9.0.3
Date: Thu, 29 Oct 2026 12:37:17 +0900
Message-Id: <20261029033717.3229789-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 06:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131640
Content-Type: text/plain; charset="utf-8"

Fixes several commands on Linux 7.1 and 7.2, which OE-Core master
now ships as linux-yocto 7.2.
Update crash-memory-driver to the same revision.

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---

Notes:
    Built crash, crash-memory-driver and crash-cross-canadian-x86-64
    for qemux86-64 on master.

 ...-cross-canadian_9.0.2.bb => crash-cross-canadian_9.0.3.bb} | 0
 ...sh-memory-driver_9.0.2.bb => crash-memory-driver_9.0.3.bb} | 4 ++--
 meta-oe/recipes-kernel/crash/crash.inc                        | 4 ++--
 .../recipes-kernel/crash/{crash_9.0.2.bb => crash_9.0.3.bb}   | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-kernel/crash/{crash-cross-canadian_9.0.2.bb => crash-cross-canadian_9.0.3.bb} (100%)
 rename meta-oe/recipes-kernel/crash/{crash-memory-driver_9.0.2.bb => crash-memory-driver_9.0.3.bb} (93%)
 rename meta-oe/recipes-kernel/crash/{crash_9.0.2.bb => crash_9.0.3.bb} (100%)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.3.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
rename to meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.3.bb
diff --git a/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.3.bb
similarity index 93%
rename from meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb
rename to meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.3.bb
index 46de814e9b..80f84548ed 100644
--- a/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb
+++ b/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.3.bb
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://crash.c;beginline=1;endline=25;md5=c278eae78e2bf99783
 
 inherit module
 
-SRCREV = "61fe107ff96a22e7df0029877529b7ce6da36850"
+SRCREV = "a507c2f2036e43c62053a9f5ece0289dcb6f05fb"
 SRC_URI = "git://github.com/crash-utility/crash;protocol=https;branch=master;subpath=memory_driver;destsuffix=${BP} \
            file://0001-hacked-Makefile-for-module.bbclass.patch;striplevel=2 \
            "
-PV = "9.0.2+git"
+PV = "9.0.3+git"
 
 # The inherit of module.bbclass will automatically name module packages with
 # "kernel-module-" prefix as required by the oe-core build environment.
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index d6447ebe49..f24d40b42b 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -24,8 +24,8 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
 # 0001-Use-CC-env-var-to-get-compiler-version.patch:
 # to get the right compiler info into ./crash --buildinfo
 
-SRCREV = "61fe107ff96a22e7df0029877529b7ce6da36850"
-#PV = "9.0.2"
+SRCREV = "a507c2f2036e43c62053a9f5ece0289dcb6f05fb"
+#PV = "9.0.3"
 SRC_URI[gdb.sha256sum] = "bdc1da4a033280ac752e7d34b0418efaa45bed093235cb88e62ea961752a37f8"
 
 
diff --git a/meta-oe/recipes-kernel/crash/crash_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash_9.0.3.bb
similarity index 100%
rename from meta-oe/recipes-kernel/crash/crash_9.0.2.bb
rename to meta-oe/recipes-kernel/crash/crash_9.0.3.bb
-- 
2.34.1

