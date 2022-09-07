Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE61CC6FA8A
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.2845.1662594072496058207
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fI3sDNZ2;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id l10so2869892plb.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JVKwYw/BSeS7L1q3UCZE6IXP4/y/ozXk/Me45AEPM8Y=;
        b=fI3sDNZ2lNB5jy0X4wR32w1sNEM1bUzHIl4KE9EDVWj9j6wcNm21wZc2awxkqb23an
         wrxa+DODZdgB5zlVY/ND5QY2iujW+Hv2n9hT5hmQiVF5/qUhRpP/Svy/h/Ophym1Fw52
         YiLEfwt1a/FKww1WWd6H0rFD86JqhPaYoqbVi1rkuTbOb0RjyVZc6MfGsNEhR8lk+xIH
         SnChz1udarVcFtamRE5W90vENTE4InKgbeNBUgxG8BXIYZpuGWaPTCXDQ219A9XLTKVc
         FxTzKHCUfmiESR65G97W5rzSZZ/RLYrUDM0ELHISwaH0F0gCuDP/n6ieujXm9fa7LufH
         wYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JVKwYw/BSeS7L1q3UCZE6IXP4/y/ozXk/Me45AEPM8Y=;
        b=MOKL7oNEnO0lS0YVgRdBIu5OU8M3MTH1umEumsK4q5Qh8QOA+L6DZEA7MJDAI7tSSY
         n/NtqLNtRxgiEKHBWt/AwRig6Aq7wNy+iGoUModgvaUTyIiMv+gkxcMfD/6BquSmt2DV
         96CTj01Fmpg1bO+n8uan90B//5zXY+Lat+ATaeEuVrzt0lLIxZZCcUUybtWHohUSTCLU
         gdqOOXNJM8XMAlW2DjXGc76Hd7jfVTNu2piO16wFh+kZmHcT06YPDUE9a30E7ZAKJlT2
         LjN39nlXt82cW1zRVx4vYI+BusPwXmSXxek6KGUgjgl3NyCu32O9o0hKk9gLyfC+aQR1
         gBIg==
X-Gm-Message-State: ACgBeo2Cj1SPSvki474E3gt56tuOPUiX3OqWjlM5XjSdCfLna2qWBUfH
	UP/Qn8NXr58Zi8AnCR+f8A7Ptl3c12eSjQ==
X-Google-Smtp-Source: 
 AA6agR65uXFV3pqDRHElPs4UHUjPIB7jeyfZsHvpSC9H5cNX5AsayuZpFly8rgoQUX7lH0UgX6vQkg==
X-Received: by 2002:a17:903:120c:b0:172:728a:3b24 with SMTP id
 l12-20020a170903120c00b00172728a3b24mr5908996plh.61.1662594071693;
        Wed, 07 Sep 2022 16:41:11 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/22] minifi-cpp: Disable lto.
Date: Wed,  7 Sep 2022 16:40:49 -0700
Message-Id: <20220907234102.3312797-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98699

lto does not work always. Its enabled only in civetweb and no where
else. Fow cosnsitent builds disable it everywhere.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-civetweb-Disable-lto.patch     | 33 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  8 +++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto.patch
new file mode 100644
index 0000000000..ec4e6ffc45
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-civetweb-Disable-lto.patch
@@ -0,0 +1,33 @@
+From 120c708d51f72ade4a31d3d8f35bcfad7b12e723 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Sep 2022 20:38:03 -0700
+Subject: [PATCH] civetweb: Disable lto
+
+lto does not work everywhere, therefore disable it atleast in the cmake
+file, we can still enable it via environment
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ thirdparty/civetweb-1.10/CMakeLists.txt | 4 ----
+ 1 file changed, 4 deletions(-)
+
+--- a/thirdparty/civetweb-1.10/CMakeLists.txt
++++ b/thirdparty/civetweb-1.10/CMakeLists.txt
+@@ -298,7 +298,6 @@ add_c_compiler_flag(/WX)
+ add_c_compiler_flag(-pedantic-errors)
+ add_c_compiler_flag(-fvisibility=hidden)
+ add_c_compiler_flag(-fstack-protector-strong RELEASE)
+-add_c_compiler_flag(-flto RELEASE)
+ 
+ add_c_compiler_flag(-fstack-protector-all DEBUG)
+ if (MINGW)
+@@ -361,7 +360,6 @@ if (CIVETWEB_ENABLE_CXX)
+   add_cxx_compiler_flag(-pedantic-errors)
+   add_cxx_compiler_flag(-fvisibility=hidden)
+   add_cxx_compiler_flag(-fstack-protector-strong RELEASE)
+-  add_cxx_compiler_flag(-flto RELEASE)
+ 
+   add_cxx_compiler_flag(-fstack-protector-all DEBUG)
+   if (MINGW)
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 8fc253908f..3b57ceace6 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git;branch=master;protocol=ht
             file://0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch \
             file://0001-cxxopts-Add-limits-header.patch \
             file://0001-Fix-build-with-libc.patch \
+            file://0001-civetweb-Disable-lto.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
@@ -80,10 +81,13 @@ do_install[cleandirs] += "${WORKDIR}/minifi-install"
 PSEUDO_CONSIDER_PATHS .= ",${WORKDIR}/minifi-install"
 
 do_configure:prepend:libc-musl() {
-    sed -i -e 's/-DHAVE_GLIBC_STRERROR_R=1/-DHAVE_GLIBC_STRERROR_R=0/' ${S}/CMakeLists.txt
-    sed -i -e 's/-DHAVE_POSIX_STRERROR_R=0/-DHAVE_POSIX_STRERROR_R=1/' ${S}/CMakeLists.txt
+    sed -i -e 's/-DHAVE_GLIBC_STRERROR_R=?/-DHAVE_GLIBC_STRERROR_R=0/' ${S}/CMakeLists.txt
+    sed -i -e 's/-DHAVE_POSIX_STRERROR_R=?/-DHAVE_POSIX_STRERROR_R=1/' ${S}/CMakeLists.txt
 }
 
+CFLAGS:append:libc-glibc = " -D_GNU_SOURCE"
+CXXFLAGS:append:libc-glibc = " -D_GNU_SOURCE"
+
 do_install() {
     DESTDIR='${WORKDIR}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
     MINIFI_BIN=${bindir}
-- 
2.37.3


