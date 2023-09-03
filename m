Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B85CA0FE3
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 13:32:46 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.27430.1693747958632871671
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Sep 2023 06:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=S21C/L0Q;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so130343066b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 06:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693747957; x=1694352757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYQpHIdY7B3UxWn3XqaFQetfR2oCs38WX5nTOqKcLAs=;
        b=S21C/L0Qgbx3hfA9/n6/a2E4GNexF77ATtEBD6OiRDAFmBWWfCNVQNUY494FGY+4En
         sjUZwZkPBOcmn/Xk72tCjdkwbN7I97ks3PK8OoL389A3sutFDG6HE8WRCOgcj7H+LhC6
         hekN7ewSe13wSggLopHWqpVBddBslOHhoHCM4egUxQA7KtSJU3kuxkvFZLsSJgYcmHNA
         8FMf7l8rM+p31lrooiLppeV3Oz1czpfLQyGKonkEVuA22Mxen0wRxmyDevXkqwuItCWD
         WqfvixH9WQIlxjHwpQubFC3WxWOZ7BWfTYwkUOUxUKIzBkIVtSDl55yB0eA8eCV+sWv3
         hlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693747957; x=1694352757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYQpHIdY7B3UxWn3XqaFQetfR2oCs38WX5nTOqKcLAs=;
        b=bDzMFF+FcElYT1cmb2BnxTC0jn+SbWmxiVTfDiA4jazvUcrzzSPBnuqPl1svfkYy4F
         2KuhTwtkZ4qdmTd7N5oapucguepXMtfamHToxuAMPeweDwCk6Qhosp0uLvWcXI5dMx3O
         UEYxn/KSRTh/zAlqjf3Hl4Z9tL9okgtYqKQK8vshtad8pMuNilUhKWtOPUrvQ0sZfc0H
         tqlpNO9iTT2NLtIn6XAbWX880ZEMrX6ylcX6JN0VEK4aAYVjsB2MYPUhU7Lc9CEpszXK
         fyPeDP5MqFk3aPmg+Q/UbKzhJDW05zahhkSQIwZc5+lNrcGbEEX4B/jG1XI9Skqgs8AK
         Yifg==
X-Gm-Message-State: AOJu0Yz2WFmpPo3y05iV77P1YSsZ1tvHtklhDY55lLx47ne+HyGu+CNX
	udtjaJ7wNqQbXizQoKlhraYI94ypktE=
X-Google-Smtp-Source: AGHT+IH75nS3WzBwfShuMXTA+VLr0m6AUgvuQkGpxdazr4m2TPMWaLe5t//otuDB2/cqNyx5S2TsOA==
X-Received: by 2002:a17:906:c148:b0:96f:9cea:a34d with SMTP id dp8-20020a170906c14800b0096f9ceaa34dmr12069608ejc.21.1693747956970;
        Sun, 03 Sep 2023 06:32:36 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j8-20020a170906830800b009a19701e7b5sm4788975ejx.96.2023.09.03.06.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 06:32:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] tcpreplay: fix pcap detection with /usr/lib32 multilib
Date: Sun,  3 Sep 2023 15:32:12 +0200
Message-ID: <20230903133212.455899-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230903133212.455899-1-Martin.Jansa@gmail.com>
References: <20230903133212.455899-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 13:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104700

* use BPN, BP where useful
* use prefix instead of hardcoding /usr
* add patch to search also in lib32 subdir of --with-libpcap value
  to fix:
  checking for libpcap... configure: error: "Unable to find matching library for header file in TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-tcpreplay/4.4.4-r0/lib32-recipe-sysroot/usr"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...fy-search-dirs-for-pcap-and-add-lib3.patch | 82 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  9 +-
 2 files changed, 87 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch
new file mode 100644
index 0000000000..709d2cccbc
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch
@@ -0,0 +1,82 @@
+From 5f8c78362b3b1e06f5adff2d4b140509c4799894 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 3 Sep 2023 12:31:59 +0200
+Subject: [PATCH] configure.ac: unify search dirs for pcap and add lib32
+
+* add lib32 because when building lib32-tcpreplay it's
+  impossible to set --with-libpcap so that it would find
+  both include files as well as the library in lib32 directory
+
+* maybe it would be beneficial to split --with-libpcap
+  into --with-libpcap-includedir --with-libpcap-libdir as this
+  already searches in the --with-libpcap value with and
+  without any "lib" prefix, but include files always expect
+  "include" dir there
+
+* most of this code was added in:
+  https://github.com/appneta/tcpreplay/commit/202b8e82f9fd3c84ce5804577caeb36a33baabe7#diff-49473dca262eeab3b4a43002adb08b4db31020d190caaad1594b47f1d5daa810R570
+
+* then search for
+  ${host_cpu} lib/${host_cpu} (without -${host_os} suffix)
+  and ${build_arch}-${host_os} lib/${build_arch}-${host_os}
+  was added, but only for search of dynamic library in:
+  https://github.com/appneta/tcpreplay/commit/c3d5236563985a99f8bb02c3f1bd6950e3929047
+
+* ${build_arch}-${host_os} lib/${build_arch}-${host_os}
+  was later replaced with:
+  lib/${MULTIARCH} ${MULTIARCH}
+  and it was added to static library search as well
+
+  but for dynamic library it was searching in reversed order:
+  ${MULTIARCH} lib/${MULTIARCH}
+  https://github.com/appneta/tcpreplay/commit/ed9e3a818bde04813144014561e62f018c9eb85f
+
+  I don't think this reversed order was intentional, just unify all 4 cases
+  to use the same directories in the same order
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/819]
+---
+ configure.ac | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 387219de..26ba31a5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -671,7 +671,7 @@ AC_ARG_WITH(libpcap,
+         LPCAPINCDIR=${testdir}
+         if test $dynamic_link = yes; then
+             for ext in .dylib .so .tbd ; do
+-                for dir in . lib lib64 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
++                for dir in . lib lib64 lib32 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
+                     sharefile=$(ls ${testdir}/$dir/libpcap${ext}* 2> /dev/null | sort | head -n1)
+                     if test -n "${sharefile}"; then
+                         LPCAP_LD_LIBRARY_PATH="$(dirname ${sharefile})"
+@@ -690,7 +690,7 @@ AC_ARG_WITH(libpcap,
+             dnl If dynamic library not found, try static
+             dnl
+             for ext in ${libext} .a .A.tbd ; do
+-                for dir in . lib lib64 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
++                for dir in . lib lib64 lib32 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
+                     staticfile=$(ls ${testdir}/$dir/libpcap${ext} 2> /dev/null | sort | head -n1)
+                     if test -n "${staticfile}"; then
+                         LPCAPLIB="${staticfile}"
+@@ -771,7 +771,7 @@ AC_ARG_WITH(libpcap,
+                 LPCAPINCDIR="${testdir}/include"
+                 if test $dynamic_link = yes; then
+                     for ext in .dylib .so .tbd; do
+-                        for dir in . lib lib64 ${host_cpu} lib/${host_cpu} ${host_cpu}-${host_os} lib/${host_cpu}-${host_os} ${MULTIARCH} lib/${MULTIARCH}; do
++                        for dir in . lib lib64 lib32 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
+                             sharefile=$(ls "${testdir}/$dir/libpcap${ext}" 2> /dev/null | sort | head -n1)
+                             if test -n "${sharefile}"; then
+                                 LPCAPLIB="-L$(dirname ${sharefile}) -lpcap"
+@@ -790,7 +790,7 @@ AC_ARG_WITH(libpcap,
+                     dnl If dynamic library not found, try static
+                     dnl
+                     for ext in ${libext} .a .A.tbd ; do
+-                        for dir in . lib lib64 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
++                        for dir in . lib lib64 lib32 lib/${host_cpu}-${host_os} ${host_cpu}-${host_os} lib/${MULTIARCH} ${MULTIARCH}; do
+                             staticfile=$(ls "${testdir}/$dir/libpcap${ext}" 2> /dev/null | sort | head -n1)
+                             if test -n "${staticfile}"; then
+                                 LPCAPLIB="${staticfile}"
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index c7d14e2ab6..53f17c9619 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -7,9 +7,10 @@ SECTION = "net"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
-SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
-           file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
-          "
+SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+    file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
+    file://0001-configure.ac-unify-search-dirs-for-pcap-and-add-lib3.patch \
+"
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
 
@@ -17,7 +18,7 @@ UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
 DEPENDS = "libpcap"
 
-EXTRA_OECONF += "--with-libpcap=${STAGING_DIR_HOST}/usr"
+EXTRA_OECONF += "--with-libpcap=${STAGING_DIR_HOST}${prefix}"
 
 inherit siteinfo autotools-brokensep
 
-- 
2.42.0


