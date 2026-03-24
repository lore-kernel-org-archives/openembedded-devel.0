Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E6AF54AD7
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 16:10:22 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1204.1774368619131082916
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 09:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cjebkCvH;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12732165d1eso2088624c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 09:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774368618; x=1774973418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxQMIMKSqTwLKlzAFQoVG90ZASHLd7A/nRboPbV3qhg=;
        b=cjebkCvHszq3oNySwQpjyOkdqr06/I1f5BL3zVMhH6vcKiX1oSr2oG2rZKsbyC89Ox
         kMlNIS1SRT56vy2iM+DMI9f2XhYGLUwrb3+njMA3mbTY+E/RAH0JQ0H67979b7IS9Tbi
         RW6MwBv1IJL7rHNnLovg5C+Fs0hAKUt1643m58gzg8FAAbMZoyHFwLXtUaDmrWiFqI2R
         IznrwCJiAmd7b3/e1HA1Owmkg2uY0eJEu85gqkXcdHopuUjHWhn0Bahf6kEy2ZNXd6Ae
         NPSW+83XE00lIQDkbqROGrFfUu7aAY7vL1u764WXPCNdwuYkhfNcJFk7M2Qg164LT4zK
         K5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368618; x=1774973418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxQMIMKSqTwLKlzAFQoVG90ZASHLd7A/nRboPbV3qhg=;
        b=naH9YzEmo/BYeRbdPwEuHwgzUn4yl02TChXoHiJMwlV7N1S/RVjekPvuqD1TFcFnmq
         2J+2XnCBfARozyPWXlq1x7x1tqq/GbFc9g1dxDqtTQ5pVe+cxzwUeitMmasbQtUCvjDt
         ivgt0nInABHvHRx1dcCYOZnF+oD1qJBBQpzMErbivSy7DbY0Yc9wsl66++ixeCBZyBAE
         vQYv/nsnq68YqAG4N0AkRa9OTO0ykwFTRbzwtD4pirB6/iw9RHESylXF4wJKCexie9As
         zQg2TpqE3AfuaiyegIm6i72RXCEQt8D70IGSge3TN6OMRQg96OgBsIgoSaZB4NsbDxop
         fAfw==
X-Gm-Message-State: AOJu0YzeIorGzghKIlXFNfnvFf/gL8B3AlN+rKe5MGzCXTxYdod0TA0X
	w9t94lCbMwe3Tg8vGGoeOv1z2jIeqNxrJRowdMEZq/tyyYsb1dvB6nz6PmLyFu94
X-Gm-Gg: ATEYQzxIJZnlTbp1u2y4iZCGTDzLbpS20Lg8XLef7SYw35E4MiZ1HTnCPZUlwehhegz
	e+GZqUxSdhBi/NvTHxUGGnyAvRACsDK7cCfnLDWhS4FFPyMmBkPvx06OBmfzqK2FlZQB5/HKMZx
	Dd4BdIUGfaFWbARRXTEYVfXhDZ2hMdcH8bAK6m2JIVxHqCGnEKdVQxja261vxUljnG0FbEHXZeT
	5xNSJgn9JrJIrPJIUTTFGLjaQeGdw7SJPpW/PHJudIXy1VO2excIELvWTivHKfoZgEGm8T9gbe0
	s243Pt3xXZJqKZmPt6S60ofFTZ2hAXz4WdNOjZzO9a83zPG9Y7yUQDgfOKywqJOiLJNvqzfTQHj
	VHZqNGLz+C7F58VkKK1jnxTjor/NqdOhqjoba292aa5wuCi1OxV5m0j9q5LFABcu9K38EeQXYsG
	WPc45AYHZ+QAkqqgcwsbi5Fva7SQFlln1ze/Dh0qHs7z8cuQJtWYCbApIL78feTqcud46Dfyo3A
	NY+QwE9g5QnueD5LelNimPcK4YTZWteAKCQ8TP7Qnu6Phx0SbdyRgEQ4/VA
X-Received: by 2002:a05:7022:fa09:b0:122:2f4:b285 with SMTP id a92af1059eb24-12a96ede776mr42318c88.25.1774368617900;
        Tue, 24 Mar 2026 09:10:17 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733fe80esm14275776c88.7.2026.03.24.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:10:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] leancrypto: Upgrade to 1.7.0
Date: Tue, 24 Mar 2026 09:10:14 -0700
Message-ID: <20260324161014.1697557-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 16:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125578

- Fix absolute paths in debug info for reproducible builds ( Thanks Gyorgy for suggestion)
- Drop upstreamed patch
- Changelog - https://github.com/smuellerDD/leancrypto/releases/tag/v1.7.0

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...te-build-paths-from-DWARF-debug-info.patch | 40 -------------------
 ...eancrypto_1.6.0.bb => leancrypto_1.7.0.bb} | 10 ++---
 2 files changed, 5 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-crypto/leancrypto/files/0001-fix-strip-absolute-build-paths-from-DWARF-debug-info.patch
 rename meta-oe/recipes-crypto/leancrypto/{leancrypto_1.6.0.bb => leancrypto_1.7.0.bb} (90%)

diff --git a/meta-oe/recipes-crypto/leancrypto/files/0001-fix-strip-absolute-build-paths-from-DWARF-debug-info.patch b/meta-oe/recipes-crypto/leancrypto/files/0001-fix-strip-absolute-build-paths-from-DWARF-debug-info.patch
deleted file mode 100644
index f05497bd1a..0000000000
--- a/meta-oe/recipes-crypto/leancrypto/files/0001-fix-strip-absolute-build-paths-from-DWARF-debug-info.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5a3c770b24a40a4e32154f25fdba3b685b0221d2 Mon Sep 17 00:00:00 2001
-From: Ayoub Zaki <ayoub.zaki@embetrix.com>
-Date: Thu, 19 Mar 2026 09:29:10 +0100
-Subject: [PATCH] fix: strip absolute build paths from DWARF debug info for
- reproducible builds
-
-Upstream-Status: Backport [https://github.com/smuellerDD/leancrypto/commit/6561beeadf7376cc0815d937ee8d231a3bbbcba8]
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
----
- meson.build | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 03616319..ba9bbcbd 100644
---- a/meson.build
-+++ b/meson.build
-@@ -121,6 +121,19 @@ endif
- if get_option('dilithium_debug').enabled()
- 	add_global_arguments([ '-DLC_DILITHIUM_DEBUG' ], language: 'c')
- endif
-+
-+# Strip build directory paths from debug info to avoid buildpaths warnings
-+# in debug packages
-+if cc.has_argument('-ffile-prefix-map=/dev/null=/dev/null')
-+	add_global_arguments([
-+		'-ffile-prefix-map=' + meson.project_source_root() + '/=',
-+		'-ffile-prefix-map=' + meson.project_build_root() + '/=',
-+	], language: 'c')
-+	add_project_link_arguments([
-+		'-ffile-prefix-map=' + meson.project_source_root() + '/=',
-+		'-ffile-prefix-map=' + meson.project_build_root() + '/=',
-+	], language : 'c')
-+endif
- if get_option('kyber_debug').enabled()
- 	add_global_arguments([ '-DLC_KYBER_DEBUG' ], language: 'c')
- endif
---
-2.43.0
-
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.6.0.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.0.bb
similarity index 90%
rename from meta-oe/recipes-crypto/leancrypto/leancrypto_1.6.0.bb
rename to meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.0.bb
index b46e6c26f5..7c9187ab94 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.6.0.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.7.0.bb
@@ -6,21 +6,21 @@ ML-KEM (Kyber), ML-DSA (Dilithium), SLH-DSA (Sphincs+) and many more"
 HOMEPAGE = "https://leancrypto.org"
 LICENSE = "BSD-3-Clause | GPL-2.0-only"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=7e96f38306550c165071e7cab7b6b824 \
+    file://LICENSE;md5=4cc9ea7ae2518fb4fb0bbd9d1a60cbf4 \
     file://LICENSE.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
     file://LICENSE.gplv2;md5=eb723b61539feef013de476e68b5c50a \
     "
 SECTION = "libs"
-SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https \
-           file://0001-fix-strip-absolute-build-paths-from-DWARF-debug-info.patch \
+SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV} \
            file://leancrypto-tests.sh \
            "
-# SRCREV tagged v1.6.0
-SRCREV = "38215249fbe3951d1992b12447fca3c0c5e7e245"
+# SRCREV tagged v1.7.0
+SRCREV = "e60fba94e8cabf1661a1da488b78b84a4fba56e9"

 inherit pkgconfig meson

 EXTRA_OEMESON = "-Dstrip=false"
+TARGET_LDFLAGS:append = " ${DEBUG_PREFIX_MAP}"

 PACKAGECONFIG ??= "secure-exec apps tests"
 PACKAGECONFIG[apps] = "-Dapps=enabled,-Dapps=disabled"

