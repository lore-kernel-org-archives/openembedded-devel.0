Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E9FC83F33
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 13:02:52 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.20569.1693918964953546740
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 06:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RpSfmdPJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9a5dff9d2d9so369285066b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693918963; x=1694523763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sd9O+LuFQwFmJOobLL08/nrC94yrwWWb2/uJnW3oHd4=;
        b=RpSfmdPJiFNkKeiG7aM932Sre8EikX0epY00lqti8PvC+vopQv3OWd3bBuNgJ54kph
         ll+IOzzY8kL8DIGizBPckyx2pmG11NqpcOFa4Py4S3SBlrdvOADX8eFRfq1gL3Kfcujn
         hTyXKiQU2sneB18uuSsIwvK2z6ImrY1OS8S4/2zvbbN8QHoQz6WOXRPK5CGqZcR/YpuC
         PIrZCMBXKALjngkU+lbituJYLqVWegClhe+ZkO1DWwr1j9aiKP5luYSlRNjrzp7dSn1c
         miYn0vboS5qhUBTVHgv6B57Hk9riYyv8xiKgkTRcFdbp16pTKvUaUrrLushGUH4MGY3h
         I7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693918963; x=1694523763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sd9O+LuFQwFmJOobLL08/nrC94yrwWWb2/uJnW3oHd4=;
        b=Vw7vEWoSYTzv4FziDNG7HIbuLLPIbqvm+3/MxSOUaoAEIENz6KofVsz7j+YEswB66n
         IGtzy+6RDXZJM6EqL4CNm5hUWCh9cUe4VXdCPHzvTpDGZ83dT1t6lfuICx8xnRK7tLdm
         uW4L0e1QIUD9VRpHpTeYgJ5LLKOZkwt+IFddX+Rql/DISWQtT/fjmOrcWVwUWw0QL4MZ
         yU3u4KxSIDgaGTbBOvy2rcaNpNqdzE12SYEdHPRDIwWzbq0aYUGxI3tR8se8ZXQZ1zJe
         iu/7bkt7s+zZQXHV+Hko+4aC4qfbE3EnQVIIIpZJZ5PJMOyPerpIebJQFQuw3M8jGuCL
         KYhQ==
X-Gm-Message-State: AOJu0YxJaHAKTFk+29Y4S9xZQYKQWHCkdkFS/tJQVnX0hh4njkiSLybG
	vKVDBhz+hSBGDL0JX9iHWM+6/Z4byx0=
X-Google-Smtp-Source: AGHT+IHc9q5/h/R3zKRCc0nmGfFJhnXNGNYJqmEmz2sZKojQNs+UWRvAOlDkyy6PEWtAvn3EWRb5Kw==
X-Received: by 2002:a17:906:3149:b0:9a5:cade:8044 with SMTP id e9-20020a170906314900b009a5cade8044mr9104735eje.21.1693918963162;
        Tue, 05 Sep 2023 06:02:43 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906078d00b009a5f1d15642sm7505339ejc.158.2023.09.05.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 06:02:42 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 4/4] tcpreplay: fix pcap detection with /usr/lib32 multilib
Date: Tue,  5 Sep 2023 15:02:22 +0200
Message-ID: <20230905130222.1448129-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905130222.1448129-1-Martin.Jansa@gmail.com>
References: <20230905130222.1448129-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 13:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104725

From: Martin Jansa <martin.jansa@gmail.com>

* use BPN, BP where useful
* use prefix instead of hardcoding /usr
* add patch to search also in lib32 subdir of --with-libpcap value
  to fix:
  checking for libpcap... configure: error: "Unable to find matching library for header file in TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-tcpreplay/4.4.4-r0/lib32-recipe-sysroot/usr"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


