Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B194CA5FAD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:43 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1464.1790722659394065652
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eBTWBrU/;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c2a97ec17so387015eec.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722659; x=1791327459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G7OPlAdo4ErmxCXfmbB4bzx87kBLxRnIIQv8IWPuNWE=;
        b=eBTWBrU/gln6rggd3yDf6KLYcVKvyQFL8wlpJ7eb/cJMif1TXupgaC/CfZOObVyfsa
         2TfbV6ngeuh8jQFR/4lSzI2i6Kx3ttJwidODAg7K+agTmEeyO7qEN/p+H0TTMPP9lN1O
         2dsWqeGwwma/2XIKXKk53RvVgdqBdkEBzrd6YQ3Dwmci/wWujwfnmZECzRUlgMrFKu03
         433h5FAWYs4oCctRTCn2yQI9p/QcKsoLse7ukRMaQdp3QSJeEZ7m7zjhkvhdWgIVuv2A
         STZkDVsWBHvL5VRQgI4R57ZUYK0I1pKTykIgn3RPFqdwI/qHM0Q1R3awNuks5Yisf/wZ
         HO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722659; x=1791327459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G7OPlAdo4ErmxCXfmbB4bzx87kBLxRnIIQv8IWPuNWE=;
        b=KCvVwYe/whOKwmJJP/lU0OuIjVyxosEDEvz711mRuI4W5z4Qv4FKuTsjXVIYSjyyQ7
         4086G+xpJcPGChqYh1bPwfixBjgX337Q0eKp2is8TzFZI+CjyT3IyorhQNqGI1XThQJB
         2Bw0thTRvJs2pNF9Sf0biRxQE4XeWmAXl2weps70NCIbvWKfgOwbAC0Q3ZE7dk5G3roZ
         c3gs2MG7nFX1rQ1zNoqG0I07jRw+CxxCPNI21ABNxuiTIE8+L9rnKdodnHqYNmtfeKO7
         1Rh7oa/8xJykK3Av/q9w7z7MwmL9V9drOZ0oHwMc5UdmWQg4t1uZ/NbitdIUiI76/HP3
         oO0A==
X-Gm-Message-State: AFq9FYKv8RGaNlKHdVACj4i9xt8DIlyu03acNQid0lgqafZLJ63SaLY/
	tWHuWF2E/r9eUBQEN2OlVrUaV548VOfabMpfLeNwTez4302QuyXH2DsZ2S3LbtBq+14=
X-Gm-Gg: AYBFou0TFyeFPMbdUXcKK8gTfrEWZWn6JE2M+I/MhiU1CgGZhR7xe9zfhBe4s0OMzru
	Vmze5RWFaeEKxNgNdebbpoWmKB4ebpd1oBIxs7fB98+siU0r+EiNqQ3h8BRh54wXObLxZLLwcCC
	9wjmpJxW46qLXKWhTtGjoo2mpdr2CO61c2gsGw5YR9DaZURJOoVjBdc6WuntCDXHsjnz7x5rkcb
	bTF+58bFWJ4EWTRDH6DDKBt3Guj5xY+oeWq1haovc1/VlsBE8kvpk+bRJkYHpiB/ivrpuAds8q3
	BUjn+8Uaxtr4IKjqf2APftPUKeUaRU89mVXgG/NNwzq59vMQ1oduFt5bIzUoP0ftUmOk2+YYgR6
	RL26Hadousa+jBrPx5xnkN/gTPwxBzHLnK+9kaNvqRc8Q3PI5suNPmQMmzsR4miO2L5W0kVri0u
	W7wexOxUoVoScQzbP6i/jeyRngA0pjXJ8DutEw+6dpZKK4i3XgiYHJkLjqgL8iT6kziqcpmwIxC
	baSk7DyS21ZpyE8vAlTf3PizqNdNIlC5LPfTqlvkuNLZ20LruUATLU4bKVZxxG/ufn5Sb+rs5Zq
	qseIn5EKa4FRKDHn0NKigYChnUEMQ8oidgQSSqumX9fnqrgic2WiZL5Autl5eQVgTBnJvondJJ1
	aPvmwHwA1lK5P/+/5I9SNGHzLJiwgqJT2tM/oQTWwvMkUfzYYtplp+LXkzD6WqTL+A+xfNwF8kI
	+X8FWRbTyselAuL25FCochK/4HpyQlhcH/B/t+NA==
X-Received: by 2002:a05:7300:8a30:b0:347:93a3:4d6b with SMTP id 5a478bee46e88-34c6672f1d1mr723152eec.23.1790722653744;
        Tue, 29 Sep 2026 15:57:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/26] bit7z: replace glibc LFS64 names with portable POSIX ones for musl
Date: Tue, 29 Sep 2026 15:57:03 -0700
Message-ID: <20260929225723.1046705-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130493

bit7z's internal code uses off64_t/stat64/lstat64, which musl doesn't
provide since its off_t is already 64-bit. Use the plain POSIX names.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-glibc-LFS64-names-with-portable-PO.patch | 59 +++++++++++++++++++
 meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb  |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0003-internal-replace-glibc-LFS64-names-with-portable-PO.patch

diff --git a/meta-oe/recipes-extended/7zip/bit7z/0003-internal-replace-glibc-LFS64-names-with-portable-PO.patch b/meta-oe/recipes-extended/7zip/bit7z/0003-internal-replace-glibc-LFS64-names-with-portable-PO.patch
new file mode 100644
index 0000000000..eb2e9ae29b
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0003-internal-replace-glibc-LFS64-names-with-portable-PO.patch
@@ -0,0 +1,59 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:57:13 +0000
+Subject: [PATCH] internal: replace glibc LFS64 names with portable POSIX
+ equivalents
+
+musl does not provide the glibc LFS64 off64_t/stat64/lstat64/lseek64/
+ftruncate64 names at all; off_t/struct stat are already 64-bit on
+musl, so there is no separate 64-suffixed API. This broke the build
+on musl targets:
+
+| src/internal/fsutil.hpp:33:24: error: use of undeclared identifier 'lstat64'; did you mean 'lstat'?
+| src/internal/fsutil.hpp:34:23: error: 'stat64' does not refer to a value
+| src/internal/fsutil.hpp:185:6: error: incomplete result type 'FileMetadata' (aka 'struct stat64') in function definition
+
+Extend the existing BSD/Apple compatibility branches in fsutil.hpp
+(FileMetadata/os_stat/os_lstat) and filehandle.cpp (NO_LSEEK64) to
+also apply when building against a non-glibc libc (detected via
+!defined(__GLIBC__)), so musl uses the same plain POSIX stat/lstat/
+lseek/ftruncate/off_t names that the BSDs already use.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/internal/filehandle.cpp | 5 ++++-
+ src/internal/fsutil.hpp     | 5 ++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/internal/filehandle.cpp b/src/internal/filehandle.cpp
+index 4cff411..22aeeef 100644
+--- a/src/internal/filehandle.cpp
++++ b/src/internal/filehandle.cpp
+@@ -24,7 +24,10 @@
+ #include <unistd.h>
+
+ #if defined( __APPLE__ ) || defined( BSD ) || \
+-    defined( __FreeBSD__ ) || defined( __NetBSD__ ) || defined( __OpenBSD__ ) || defined( __DragonFly__ )
++    defined( __FreeBSD__ ) || defined( __NetBSD__ ) || defined( __OpenBSD__ ) || defined( __DragonFly__ ) || \
++    !defined( __GLIBC__ )
++/* musl (and the BSDs) do not provide the glibc LFS64 lseek64/ftruncate64/off64_t names;
++ * off_t is already 64-bit there, so lseek/ftruncate with off_t suffice. */
+ #define NO_LSEEK64
+ #endif
+ #endif
+diff --git a/src/internal/fsutil.hpp b/src/internal/fsutil.hpp
+index eaf9ae9..2b173c1 100644
+--- a/src/internal/fsutil.hpp
++++ b/src/internal/fsutil.hpp
+@@ -24,7 +24,10 @@
+ #include <sys/stat.h>
+
+ #   if defined( __APPLE__ ) || defined( BSD ) || \
+-        defined( __FreeBSD__ ) || defined( __NetBSD__ ) || defined( __OpenBSD__ ) || defined( __DragonFly__ )
++        defined( __FreeBSD__ ) || defined( __NetBSD__ ) || defined( __OpenBSD__ ) || defined( __DragonFly__ ) || \
++        !defined( __GLIBC__ )
++/* musl (and the BSDs) do not provide the glibc LFS64 stat64/lstat64 names;
++ * their off_t/struct stat are already 64-bit, so the plain POSIX names suffice. */
+ using FileMetadata = struct stat;
+ const auto os_lstat = &lstat;
+ const auto os_stat = &stat;
diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
index 5f0b65b3cc..d0693cc5f1 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48a3fe23ed1353e0995dadfda05ffdb6"
 
 SRC_URI = " \
     git://github.com/rikyoz/bit7z.git;protocol=https;branch=master;tag=v${PV} \
+    file://0003-internal-replace-glibc-LFS64-names-with-portable-PO.patch \
     ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST'), 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
 "
 

