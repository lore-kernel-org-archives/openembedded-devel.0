Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A6DC2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:59:47 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.181995.1692259184116250200
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UcO8buqW;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2b9dc1bff38so109509531fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692259182; x=1692863982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0tr189Q+heh/eHs+5osw/vzHkjPEWKhToAZxcaGeTnk=;
        b=UcO8buqW1+9P/mavMcflfs868uP1pN+2kAU2/LtDzl6TMrsi9TPILpeViyVrCy1PbF
         PhjzKoRbCSdLuwV1khpLguQLzI1lG8mlyr2AwqhMRT3z5YXyCDLj2rBtbyTQ4I7ZZSZD
         9Sh5S8o8yfkoQyy+pxJ/NH5dtDPRC31gbM3aBkt6rki2yha+ty7GQbjlkiIm80u3rhKm
         ZS6IBHWMexkNr2XBXweCoPeQ+jDh+2F7AEg+Ju2o05fR9nZ/4IEXlMXSX7dSaw9ndXAz
         JYKQT61NnorgB2VSUFEHdfpyrkXlDejpYg1SocwLiX5OeB7flNbfOsyqMnnfe+QRNVEj
         Oh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692259182; x=1692863982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tr189Q+heh/eHs+5osw/vzHkjPEWKhToAZxcaGeTnk=;
        b=aT4x8lwjuIpXhI8tK6LyF8N0U7KUFyADJNMvglzk03KmERisKA5R3OZcNtDn9LczL/
         aalW5N2RzHTYA7Mi6lZReXTJCgubC1DYn3rdxRKahMvuixSfgywgeAQWYGXwWNXxAEOv
         5joVCIfm/mAAhuTw1Ltf6WarA5Q00nwn1icrby3wb3cfa/Mlxw/5FEZ3lJDOEGf6KPHB
         YEMh420DO4NHq+REQwoIm0eHA9LxzqZYPlPXYDdEgqj1ttZVKbczV65DimGs0E92Gfuo
         OFvW0rubn0eeOes6igfkr9YFY8dn2TEZwF5+zVqJsxzA4B4i1rg/v1xKpXrXvb2sWKeD
         6IIw==
X-Gm-Message-State: AOJu0YzxrwPXJLeTsDc3udCmVI62VoV6Qdpw5TdQXBZA63ZSbJBsKY4V
	SAnBEPuK07+Vbk3jqE87FhsiEm3X+Zo=
X-Google-Smtp-Source: AGHT+IE7sRnPcR6n9qanRV5BHolN9YoFgNtUV8Q2g2zdUIYtnax3xzXTwUfH5Y95+imR+BygqMBsKg==
X-Received: by 2002:a2e:9649:0:b0:2b9:b904:74d7 with SMTP id z9-20020a2e9649000000b002b9b90474d7mr3264228ljh.18.1692259181310;
        Thu, 17 Aug 2023 00:59:41 -0700 (PDT)
Received: from Unimatrix08-Jammy.lan ([151.58.174.15])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b003fe2397c17fsm2011028wmb.17.2023.08.17.00.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 00:59:40 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] dlt-daemon: upgrade 2.18.9 -> 2.18.10 (commit: 0f2d4cfffada6f8448a2cb27995b38eb4271044f)
Date: Thu, 17 Aug 2023 09:59:36 +0200
Message-Id: <20230817075936.322907-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 07:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104449

Drop patches now part of new upstream release:
- 449.patch
- 481.patch
- 482.patch

Refresh patches due to GENIVI->COVESA renaming

What's Changed:

    Update ReleaseNotes and version to v2.18.9 by @minminlittleshrimp in #4=
68
    Update status badges on README.md by @michael-methner in #467
    logstorage: Adds option to write logs in gzip format by @LiquidityC in =
#442
    Re-Initialize internal logging in daemon mode only by @lvklevankhanh in=
 #459
    Remove use of DLT_LOG in signal handler by @michael-methner in #472
    Update gtest_dlt_daemon_multiple_files_logging.cpp by @LocutusOfBorg in=
 #481
    Update AUTOSAR standard link by @lucafrance in #480
    cmake: set version to 2.18.9 by @alexmohr in #478
    Fix macro code to use boolean value in while instruction (false) by @mi=
chael-methner in #469
    dlt_user_shared: Add timeout to writev by @alexmohr in #385
    build: add static lib only if necessary by @alexmohr in #479
    Update CMakeLists.txt by @LocutusOfBorg in #482
    watchdog: improve dlt watchdog by @alexmohr in #470
    log-level-config: add option to configure log levels by @alexmohr in #4=
74
    gtest_dlt_daemon_gateway: dlt-daemon run without dlt_passive.conf file =
by @lti9hc in #487
    dlt_unit_test: Fix and improve quality of unit tests by @minminlittlesh=
rimp in #494
    dlt-qnx-system improvement by @lvklevankhanh in #495
    gtest: Init submodule and update version by @minminlittleshrimp in #497
    dlt-qnx-system: prevent message loss in high load situations by @alexmo=
hr in #490
    Fix compile error stringop-truncation with GCC 9.4 by @michael-methner =
in #499
    Update README.md by @lvklevankhanh in #503
    dlt-coverage: Add coverage report generator for dlt by @minminlittleshr=
imp in #501
    dlt-system: move journal reading to its own thread by @alexmohr in #471
    Switch from GENIVI to COVESA by @minminlittleshrimp in #511
    Update CMakeLists.txt: set required std version to gnu++14 by @LocutusO=
fBorg in #504
    cmake: Policy CMP0115 set to OLD behavior for dlt-daemon with cmake >=
=3D 3.20 by @minminlittleshrimp in #510
    fix usage of pthread_cond_timedwait by @alexmohr in #491
    DLT Upstream for minor release by @minminlittleshrimp in #515
    cmake: disable network trace by @alexmohr in #477
    doc: add COVESA logo image by @minminlittleshrimp in #516
    Prepare for 2.18.10 release by @michael-methner in #517

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...execute-processes-as-a-specific-user.patch | 10 ++--
 .../dlt-daemon/dlt-daemon/481.patch           | 49 -------------------
 .../dlt-daemon/dlt-daemon/482.patch           | 40 ---------------
 .../dlt-daemon/dlt-daemon/504.patch           | 34 -------------
 ...daemon_2.18.9.bb =3D> dlt-daemon_2.18.10.bb} |  7 +--
 5 files changed, 7 insertions(+), 133 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/504.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.9.bb =3D> dlt-=
daemon_2.18.10.bb} (93%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0002-Don-t-exec=
ute-processes-as-a-specific-user.patch b/meta-oe/recipes-extended/dlt-daemo=
n/dlt-daemon/0002-Don-t-execute-processes-as-a-specific-user.patch
index 181be25c7..cfb820cec 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0002-Don-t-execute-pro=
cesses-as-a-specific-user.patch
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0002-Don-t-execute-pro=
cesses-as-a-specific-user.patch
@@ -18,7 +18,7 @@ diff --git a/systemd/dlt-adaptor-udp.service.cmake b/syst=
emd/dlt-adaptor-udp.ser
 index 8dac1f2..ecf9f9e 100644
 --- a/systemd/dlt-adaptor-udp.service.cmake
 +++ b/systemd/dlt-adaptor-udp.service.cmake
-@@ -21,9 +21,8 @@ Wants=3Ddlt.service
+@@ -19,9 +19,8 @@ Wants=3Ddlt.service
=20=20
  [Service]
  Type=3Dsimple
@@ -51,7 +51,7 @@ index b665742..35009b0 100644
  [Service]
  Type=3Dsimple
 -User=3D@DLT_USER@
- ExecStart=3D@CMAKE_INSTALL_PREFIX@/bin/dlt-example-user "Hallo from GENIV=
I DLT example user application"
+ ExecStart=3D@CMAKE_INSTALL_PREFIX@/bin/dlt-example-user "Hallo from COVES=
A DLT example user application"
 -LimitCORE=3Dinfinity
 \ No newline at end of file
 +LimitCORE=3Dinfinity
@@ -59,7 +59,7 @@ diff --git a/systemd/dlt-receive.service.cmake b/systemd/=
dlt-receive.service.cma
 index c07d447..8f88f00 100644
 --- a/systemd/dlt-receive.service.cmake
 +++ b/systemd/dlt-receive.service.cmake
-@@ -22,6 +22,5 @@ Wants=3Ddlt.service
+@@ -20,6 +20,5 @@ Wants=3Ddlt.service
=20=20
  [Service]
  Type=3Dsimple
@@ -72,7 +72,7 @@ diff --git a/systemd/dlt-system.service.cmake b/systemd/d=
lt-system.service.cmake
 index 0e91f42..1a5b913 100755
 --- a/systemd/dlt-system.service.cmake
 +++ b/systemd/dlt-system.service.cmake
-@@ -22,7 +22,6 @@ Wants=3Ddlt.service
+@@ -20,7 +20,6 @@ Wants=3Ddlt.service
=20=20
  [Service]
  Type=3Dsimple
@@ -84,7 +84,7 @@ diff --git a/systemd/dlt.service.cmake b/systemd/dlt.serv=
ice.cmake
 index 0b3ee2c..e4753a2 100755
 --- a/systemd/dlt.service.cmake
 +++ b/systemd/dlt.service.cmake
-@@ -21,7 +21,6 @@ Documentation=3Dman:dlt-daemon(1) man:dlt.conf(5)
+@@ -19,7 +19,6 @@ Documentation=3Dman:dlt-daemon(1) man:dlt.conf(5)
=20=20
  [Service]
  Type=3Dsimple
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
deleted file mode 100644
index 52d9de2fd..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 95476de802585629c6d89707a9247bbb0c70f6c9 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Fri, 28 Apr 2023 22:39:57 +0200
-Subject: [PATCH] Update gtest_dlt_daemon_multiple_files_logging.cpp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix build error due to dlt_vlog not having the correct format string with =
security build flags enabled
-
-[ 88%] Building CXX object tests/CMakeFiles/gtest_dlt_daemon_multiple_file=
s_logging.dir/gtest_dlt_daemon_multiple_files_logging.cpp.o
-cd dlt-daemon-2.18.9/obj-x86_64-linux-gnu/tests && /usr/bin/c++ -DCONFIGUR=
ATION_FILES_DIR=3D\"/etc\" -DDLT_DAEMON_USE_FIFO_IPC -DDLT_LIB_USE_FIFO_IPC=
 -DDLT_NETWORK_TRACE_ENABLE -DDLT_SYSTEMD_ENABLE -DDLT_SYSTEMD_JOURNAL_ENAB=
LE -DDLT_UNIT_TESTS -DDLT_USER_IPC_PATH=3D\"/tmp\" -DDLT_USE_IPv6 -DEXTENDE=
D_FILTERING -D_GNU_SOURCE -Idlt-daemon-2.18.9 -Idlt-daemon-2.18.9/obj-x86_6=
4-linux-gnu/include/dlt -Idlt-daemon-2.18.9/include/dlt -Idlt-daemon-2.18.9=
/src/shared -Idlt-daemon-2.18.9/src/core_dump_handler -Idlt-daemon-2.18.9/s=
rc/offlinelogstorage -Idlt-daemon-2.18.9/src/lib -Idlt-daemon-2.18.9/src/da=
emon -Idlt-daemon-2.18.9/src/console -Idlt-daemon-2.18.9/src/gateway -Idlt-=
daemon-2.18.9/systemd/3rdparty -g -O2 -ffile-prefix-map=3Ddlt-daemon-2.18.9=
=3D. -flto=3Dauto -ffat-lto-objects -flto=3Dauto -ffat-lto-objects -fstack-=
protector-strong -Wformat -Werror=3Dformat-security -Wdate-time -D_FORTIFY_=
SOURCE=3D2 -isystem /include -std=3Dgnu++0x -std=3Dgnu++11 -Wall -Wextra -W=
no-variadic-macros -Wno-strict-aliasing -DGTEST_HAS_PTHREAD=3D1 -MD -MT tes=
ts/CMakeFiles/gtest_dlt_daemon_multiple_files_logging.dir/gtest_dlt_daemon_=
multiple_files_logging.cpp.o -MF CMakeFiles/gtest_dlt_daemon_multiple_files=
_logging.dir/gtest_dlt_daemon_multiple_files_logging.cpp.o.d -o CMakeFiles/=
gtest_dlt_daemon_multiple_files_logging.dir/gtest_dlt_daemon_multiple_files=
_logging.cpp.o -c dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_files_l=
ogging.cpp
-dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_files_logging.cpp: In me=
mber function =E2=80=98virtual void t_dlt_logging_multiple_files_append_rei=
nit_normal_Test::TestBody()=E2=80=99:
-dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_files_logging.cpp:106:13=
: error: format not a string literal and no format arguments [-Werror=3Dfor=
mat-security]
-  106 |     dlt_vlog(LOG_INFO, log1);
-      |     ~~~~~~~~^~~~~~~~~~~~~~~~
-dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_files_logging.cpp:110:13=
: error: format not a string literal and no format arguments [-Werror=3Dfor=
mat-security]
-  110 |     dlt_vlog(LOG_INFO, log2);
-      |     ~~~~~~~~^~~~~~~~~~~~~~~~
-In file included from /usr/include/string.h:535,
-                 from /usr/include/gtest/internal/gtest-port.h:264,
-                 from /usr/include/gtest/internal/gtest-internal.h:40,
-                 from /usr/include/gtest/gtest.h:62,
-                 from dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_fi=
les_logging.cpp:27:
-In function =E2=80=98strncpy=E2=80=99,
----
-Upstream-Status: Pending
-
- tests/gtest_dlt_daemon_multiple_files_logging.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/gtest_dlt_daemon_multiple_files_logging.cpp b/tests/gte=
st_dlt_daemon_multiple_files_logging.cpp
-index 2da512e1..05b58f2c 100644
---- a/tests/gtest_dlt_daemon_multiple_files_logging.cpp
-+++ b/tests/gtest_dlt_daemon_multiple_files_logging.cpp
-@@ -103,11 +103,11 @@ TEST(t_dlt_logging_multiple_files_append_reinit, nor=
mal)
-     const char* log2 =3D "TWO\n";
-=20
-     configure(path, file_name, true, file_size, max_file_size);
--    dlt_vlog(LOG_INFO, log1);
-+    dlt_vlog(LOG_INFO, "%s", log1);
-     EXPECT_NO_THROW(dlt_log_free());
-=20
-     configure(path, file_name, true, file_size, max_file_size);
--    dlt_vlog(LOG_INFO, log2);
-+    dlt_vlog(LOG_INFO, "%s", log2);
-     EXPECT_NO_THROW(dlt_log_free());
-     verify_in_one_file(path, file_name, log1, log2);
- }
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
deleted file mode 100644
index 7c9e222b3..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From b38761831670e980a58acb33d611f65255d678ac Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Fri, 28 Apr 2023 22:46:36 +0200
-Subject: [PATCH] Update CMakeLists.txt
-
-Link systemd libraries, to avoid underlinking of tests with
--DWITH_SYSTEMD_SOCKET_ACTIVATION=3DON
-
-[ 82%] Linking CXX executable gtest_dlt_daemon_gateway
-cd dlt-daemon-2.18.9/obj-x86_64-linux-gnu/tests && /usr/bin/cmake -E cmake=
_link_script CMakeFiles/gtest_dlt_daemon_gateway.dir/link.txt --verbose=3D1
-/usr/bin/c++ -g -O2 -ffile-prefix-map=3Ddlt-daemon-2.18.9=3D. -flto=3Dauto=
 -ffat-lto-objects -flto=3Dauto -ffat-lto-objects -fstack-protector-strong =
-Wformat -Werror=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=3D2 -isyst=
em /include -std=3Dgnu++0x -Wl,-Bsymbolic-functions -flto=3Dauto -ffat-lto-=
objects -flto=3Dauto -Wl,-z,relro -rdynamic CMakeFiles/gtest_dlt_daemon_gat=
eway.dir/gtest_dlt_daemon_gateway.cpp.o CMakeFiles/gtest_dlt_daemon_gateway=
.dir/__/systemd/3rdparty/sd-daemon.c.o -o gtest_dlt_daemon_gateway  -Wl,-rp=
ath,dlt-daemon-2.18.9/obj-x86_64-linux-gnu/src/daemon ../src/daemon/libdlt_=
daemon.so /usr/lib/x86_64-linux-gnu/libgtest.a /usr/lib/x86_64-linux-gnu/li=
bgtest_main.a -lrt /usr/lib/x86_64-linux-gnu/libgtest.a
-/usr/bin/ld: ../src/daemon/libdlt_daemon.so: undefined reference to `sd_li=
sten_fds_with_names'
----
-Upstream-Status: Pending
-
- tests/CMakeLists.txt | 10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 579d7308..3155ca9a 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -21,8 +21,16 @@ else()
-     set(LIBRARIES socket)
- endif()
-=20
-+if(WITH_SYSTEMD_JOURNAL)
-+ if(SYSTEMD_VERSION LESS 209)
-+  set(SYSTEMD_LIBS systemd-journal systemd-id128)
-+ else(SYSTEMD_VERSION LESS 209)
-+  set(SYSTEMD_LIBS systemd)
-+ endif(SYSTEMD_VERSION LESS 209)
-+endif(WITH_SYSTEMD_JOURNAL)
-+
- set(DLT_LIBRARIES dlt ${GTEST_LIBS} ${LIBRARIES})
--set(DLT_DAEMON_LIBRARIES dlt_daemon ${GTEST_LIBS} ${LIBRARIES})
-+set(DLT_DAEMON_LIBRARIES dlt_daemon ${GTEST_LIBS} ${LIBRARIES} ${SYSTEMD_=
LIBS})
- set(DLT_CONTROL_LIBRARIES dlt dlt_control_common_lib ${GTEST_LIBS})
-=20
- #Receiver used for QTs. add_test() is not required
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/504.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/504.patch
deleted file mode 100644
index 3290d1108..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/504.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Bug: https://bugs.debian.org/1041124
-From 3f8bc3343983697531d52918fb6cdba19593f3a8 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Sat, 15 Jul 2023 11:31:55 +0200
-Subject: [PATCH] Update CMakeLists.txt: set required std version to gnu++14
-
-New googletest 1.13.0 defaults to gnu++14, so makes this package FTBFS whe=
n building testsuite with this error:
-
-In file included from /usr/include/gtest/gtest-message.h:57,
-                 from /usr/include/gtest/gtest-assertion-result.h:46,
-                 from /usr/include/gtest/gtest.h:64,
-                 from /build/1st/dlt-daemon-2.18.9/tests/gtest_dlt_user.cp=
p:27:
-/usr/include/gtest/internal/gtest-port.h:270:2: error: #error C++ versions=
 less than C++14 are not supported.
-  270 | #error C++ versions less than C++14 are not supported.
-      |  ^~~~~
-
-Thanks Adrian Bunk <bunk@debian.org> for the report and the fix!
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 014fc3bb..b2e056db 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -213,7 +213,7 @@ endif()
-=20
- add_compile_options(
-     $<$<COMPILE_LANGUAGE:C>:-std=3Dgnu99>
--    $<$<COMPILE_LANGUAGE:CXX>:-std=3Dgnu++11>
-+    $<$<COMPILE_LANGUAGE:CXX>:-std=3Dgnu++14>
-     -Wall
-     -Wextra
-     # -pedantic
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
similarity index 93%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 2d6d1879a..33fae0619 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -17,11 +17,8 @@ DEPENDS =3D "zlib gzip-native json-c"
 SRC_URI =3D "git://github.com/COVESA/${BPN}.git;protocol=3Dhttps;branch=3D=
master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch \
            file://0004-Modify-systemd-config-directory.patch \
-           file://481.patch \
-           file://482.patch \
-           file://504.patch \
            "
-SRCREV =3D "9a2312d3512a27620d41b9a325338b6e7b3d42de"
+SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -49,7 +46,7 @@ PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-=
DWITH_DLT_CONSOLE=3DOFF,,dlt-
=20
 inherit autotools gettext cmake pkgconfig systemd
=20
-EXTRA_OECMAKE +=3D "-DWITH_EXTENDED_FILTERING=3DON -DSYSTEMD_UNITDIR=3D${s=
ystemd_system_unitdir}"
+EXTRA_OECMAKE +=3D "-DWITH_DLT_LOGSTORAGE_GZIP=3DON -DWITH_EXTENDED_FILTER=
ING=3DON -DSYSTEMD_UNITDIR=3D${systemd_system_unitdir}"
=20
 PACKAGES +=3D "${PN}-systemd"
 SYSTEMD_PACKAGES =3D "${PN} ${PN}-systemd"
--=20
2.34.1


