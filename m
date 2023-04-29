Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24986C77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 07:28:24 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.42165.1682753294756259666
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Apr 2023 00:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=HSpVJSvD;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-2f55ffdbaedso297355f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Apr 2023 00:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682753293; x=1685345293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g1wBMllzWe7TH6YqXI7SUnw8P20w8phK9SHH/TfNwJ0=;
        b=HSpVJSvD6cCJPD4wWcgYQ0bQwYd1ogo4VEq72BrS6RyYM1rOAetAanZLkLzq7F1npz
         42n0y2XYQ6I1PuQ5MAHFKbMjlfNuS5xRBIY2SN8edtBqkt32pAu3ekwEciYsKqnPkrx0
         K9gPWIsa+Xy+M26FNcSuqmB5Hu6Yi/pwKVoSF/zjFqbOW1wdj3qIpkD7AM1Bd5pyH1jV
         ijO3oVDrygNAyRvSI6pFn6ykT27q/rPeZ5qtPgYxuEpMh+SX+3gw4JAi1w5uBaVxKvCB
         h08apaBENWDycxGuCjtqHC8sK07xg2zXgfTMU0eVp24RurXRXKQkxe2U3N6px9T6V6eH
         86KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682753293; x=1685345293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1wBMllzWe7TH6YqXI7SUnw8P20w8phK9SHH/TfNwJ0=;
        b=N9KAdn1sGt9Y1sajGIl+QP4I/ypISim8wGgeVSfPyd01E6mV1uU61Xa+0dZzVGQrSj
         ncseFOeQOoXP1Eeo6UfS9WJmLmoC7Xur9EXk8BT6xWYHrw74m8RFdUbu6l7t/UGCldIW
         72uVy0FnvOZ3aOhzdjBcNkbk/0HENbSL71ND5fq0PULVv/oA/c91y1FgKy1g134BpWNQ
         TVHDw7xtX15T/9HD1RQzfLXkPXqpQZUdHfO4vcKxpgGEZByS93JiGRkzLFOfrDqRzFRr
         gTS1hRH2/d/j6CwjUKri/bm9r8iHAg325eJgPRu8UJF6XK6BYYTZ9cr3WQK/oQX4jLzn
         5i9A==
X-Gm-Message-State: AC+VfDzombZoDEwfcPuWGMx10Tm0Osly2Xo1MImVr/PfcKfgFgiWmuM5
	QFTiE9OcXVskfO8d216szFDqP6ZDvkM=
X-Google-Smtp-Source: ACHHUZ65xZ2JchSvDL2FGyrboPb8rFSa5rXMkLcwOFLT1olImMx0dpLzZXUV5+TtKVqQbKi/x/OCUQ==
X-Received: by 2002:adf:f046:0:b0:306:147e:5553 with SMTP id t6-20020adff046000000b00306147e5553mr302675wro.23.1682753292565;
        Sat, 29 Apr 2023 00:28:12 -0700 (PDT)
Received: from localhost.localdomain (mob-31-159-146-181.net.vodafone.it. [31.159.146.181])
        by smtp.gmail.com with ESMTPSA id z18-20020adfd0d2000000b002fae7408544sm22673503wrh.108.2023.04.29.00.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 00:28:11 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] dlt-daemon: upgrade 2.18.8 -> 2.18.9 (commit: 9a2312d3512a27620d41b9a325338b6e7b3d42de)
Date: Sat, 29 Apr 2023 09:28:08 +0200
Message-Id: <20230429072808.2583612-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Apr 2023 07:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102226

Drop patches now part of new upstream release:
- 0001-Fix-memory-leak.patch
- 0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
- 0001-dlt-system-Fix-buffer-overflow-detection-on-32bit-ta.patch

Cherry-pick and propose upstream two patches to fix build failures with sec=
urity hardening flags enabled
and with some systemd configuration (underlink)
- 481.patch
- 482.patch

Add new dlt-adaptor-stdin cmake optional flag
Drop PV variable, not needed anymore
Drop latomic manual added flag, upstream code changed to avoid its need
See: https://github.com/COVESA/dlt-daemon/pull/433 and https://github.com/C=
OVESA/dlt-daemon/commit/2224cddf140c060d92455ad3ee585e3abfc38eb2
(changed from atomic_bool to atomic_int, the latter doesn't require manual =
atomic library link since
it can be optimized properly by the compiler on riscv platforms)

What's Changed:

    dlt-system: fix a libc buffer overflow detection on 32bit targets by @m=
titinger in #337
    dlt-daemon: create sockets using "android way" by @sebastienraillet in =
#333
    fixes compilation issue with clang by @sebastienraillet in #339
    dlt-daemon: Only create directories if they do not exist yet by @alexmo=
hr in #340
    dlt-system : fix invalid free with ConfigurationFileName by @mtitinger =
in #342
    fix for the issue #341 by @rvalovyi in #347
    Forcibly the severity level set by @dhnatiuk1 in #346
    fix -Wformat issues reported by clang by @sebastienraillet in #349
    dlt-system: fix invalid free by removing unused TempDir by @andreirusu9=
6 in #350
    Support for Cygwin toolchain. by @DoctorNoobingstoneIPresume in #351
    filetransfer: Return error if no free space by @ssugiura in #354
    lib: Correct VARI usage in dlt_user_log_write_uint by @ssugiura in #356
    Fix DLT User/Client tests by @andreirusu96 in #357
    tests: Deplicate unused files and variables by @ssugiura in #359
    Fix the target name in documentation by @mawillers in #372
    cmake: Add option to enable each adaptor by itself by @alexmohr in #364
    cmake: Add options to enable/disable each dlt console tool by @alexmohr=
 in #363
    filetransfer: Fix getFileCreationDate2 stat check by @andreirusu96 in #=
361
    dlt_config_file_parser.c=EF=BC=9AFix a pointer release bug in the file=
=E3=80=82 by @Leslie-bcy in #376
    Update workflow by @thanhbnq in #389
    README: Update link to github actions by @ssugiura in #392
    Fix handle returned value by @thanhbnq in #384
    systemd: install adaptor-udp service for adaptor=3Don by @danielweber20=
18 in #393
    automotive-dlt.pc: add the path to find the static library by @zeerd in=
 #387
    enforce-trace-limit: ContextLogLevel is now enforced in the daemon by @=
alexmohr in #382
    dlt-daemon-connection: Start up even if not all bindings are valid by @=
alexmohr in #380
    dlt_common.c: Change default logging_mode by @wusto in #406
    logstorage: Truncate ECUid in Logstorage filter to prevent crash by @an=
dreirusu96 in #402
    Update dlt_for_developers.md by @marques-bruno in #405
    dlt-gateway: Fix crash on invalid ip by @alexmohr in #381
    dlt_client:Block in connect() by @thanhbnq in #409
    dlt_daemon_client: Fix change loglevel of application by @lti9hc in #408
    Update maintainer by @thanhbnq in #410
    systemd: add support for socket activation via systemd by @alexmohr in =
#401
    internal-logging: Fix issues with file logging by @alexmohr in #378
    dlt_common: change output of message for log initialization by @lti9hc =
in #412
    Avoid memory corruption behind buffer wp in function dlt_getloginfo_con=
v_ascii_to_id by @michael-methner in #411
    dlt_daemon_client: Fix Control Msg ECUId comparison with active Gateway=
 by @andreirusu96 in #414
    Fix for Resource and Memory Leak by @lti9hc in #418
    dlt-receive: set host interface and allow multiple udp multicast addres=
ses by @thanhbnq in #420
    dlt-system: Fix buffer overflow detection on 32bit targets by @sandy-lc=
q in #398
    cmake: network trace enable toggle by @danielweber2018 in #424
    client: Fix Get Log Info response conversion method by @andreirusu96 in=
 #422
    filetransfer: fix filesize divisible by blocksize case by @danielweber2=
018 in #383
    Updates for Coding Styles by @thanhbnq in #425
    gateway: Fix Node handling and ECUid checks by @andreirusu96 in #429
    Update contacts and removed mailing lists by @michael-methner in #431
    dlt-user: Fix crashes in dlt_free during dlt_init by @alexmohr in #362
    dlt-convert: Fix memory leak by calling dlt_file_free by @lvklevankhanh=
 in #434
    dlt-user: fix potential non closed socket in init/free by @alexmohr in =
#435
    Check for negative index in dlt_file_message by @michael-methner in #437
    Fix memory leak by @lvklevankhanh in #441
    dlt-connection: add socket timeout by @alexmohr in #439
    Installs dlt.conf on android by @sebastienraillet in #446
    This changes a mispatch from fcb676a to install udp binary correctly by=
 @smooge in #449
    logfile: exhance internal dlt logging by introducing size limits by @da=
nielweber2018 in #369
    dlt-logd-converter: fixes android 12 compilation by @sebastienraillet i=
n #445
    dlt-logd-converter: Fix getting log level from log msg by @RobinChenJP =
in #456
    house-keeper: remove infinite wait by @alexmohr in #438
    cmake: remove duplicated option message by @minminlittleshrimp in #454
    Android: Add new feature in Android bp by @minminlittleshrimp in #461
    dlt_multiple_files: remove superfluous mode bits and add header file to=
 header list by @minminlittleshrimp in #462
    dlt-user: fix crash with certain strings by @alexmohr in #463
---
 .../dlt-daemon/0001-Fix-memory-leak.patch     | 34 --------------
 ...ake-Link-with-libatomic-on-rv32-rv64.patch | 45 ------------------
 ...uffer-overflow-detection-on-32bit-ta.patch | 40 ----------------
 .../dlt-daemon/dlt-daemon/481.patch           | 47 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon/482.patch           | 38 +++++++++++++++
 ...-daemon_2.18.8.bb =3D> dlt-daemon_2.18.9.bb} | 14 ++----
 6 files changed, 90 insertions(+), 128 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix=
-memory-leak.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-cma=
ke-Link-with-libatomic-on-rv32-rv64.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt=
-system-Fix-buffer-overflow-detection-on-32bit-ta.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.8.bb =3D> dlt-=
daemon_2.18.9.bb} (90%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory=
-leak.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memor=
y-leak.patch
deleted file mode 100644
index 72e3b9802..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-memory-leak.p=
atch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b6149e203f919c899fefc702a17fbb78bdec3700 Mon Sep 17 00:00:00 2001
-From: Le Van Khanh <Khanh.LeVan@vn.bosch.com>
-Date: Thu, 9 Feb 2023 03:17:13 -0500
-Subject: [PATCH] Fix memory leak
-
-Free the ecuid_conf in case of memory alllocated
-
-CVE: CVE-2023-26257
-
-Upstream-Status: Backport
-[https://github.com/COVESA/dlt-daemon/pull/441/commits/b6149e203f919c899fe=
fc702a17fbb78bdec3700]
-
-Signed-off-by: Le Van Khanh <Khanh.LeVan@vn.bosch.com>
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- src/console/dlt-control-common.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-co=
mmon.c
-index abcaf92..64951c1 100644
---- a/src/console/dlt-control-common.c
-+++ b/src/console/dlt-control-common.c
-@@ -124,6 +124,8 @@ void set_ecuid(char *ecuid)
-             if (dlt_parse_config_param("ECUId", &ecuid_conf) =3D=3D 0) {
-                 memset(local_ecuid, 0, DLT_CTRL_ECUID_LEN);
-                 strncpy(local_ecuid, ecuid_conf, DLT_CTRL_ECUID_LEN);
-+                if (ecuid_conf !=3DNULL)
-+                    free(ecuid_conf);
-                 local_ecuid[DLT_CTRL_ECUID_LEN - 1] =3D '\0';
-             }
-             else {
---
-2.34.1
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-cmake-Link=
-with-libatomic-on-rv32-rv64.patch b/meta-oe/recipes-extended/dlt-daemon/dl=
t-daemon/0001-cmake-Link-with-libatomic-on-rv32-rv64.patch
deleted file mode 100644
index 7b40b7a67..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-cmake-Link-with-l=
ibatomic-on-rv32-rv64.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From dd2d42a7f877d292f86e421dd9651f4b7c2abf18 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 19 Apr 2022 14:57:58 -0700
-Subject: [PATCH] cmake: Link with libatomic on rv32/rv64
-
-Use of <atomic> needs to link in libatomic on riscv
-Fixes
-
-undefined reference to `__atomic_exchange_1'
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib/CMakeLists.txt | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/src/lib/CMakeLists.txt b/src/lib/CMakeLists.txt
-index 3293376..65018be 100644
---- a/src/lib/CMakeLists.txt
-+++ b/src/lib/CMakeLists.txt
-@@ -37,6 +37,12 @@ else()
-     set(SOCKET_LIBRARY socket)
- endif()
-=20
-+if(CMAKE_SYSTEM_PROCESSOR STREQUAL "riscv64" OR CMAKE_SYSTEM_PROCESSOR ST=
REQUAL "riscv32")
-+    set(ATOMIC_LIBRARY atomic)
-+else()
-+    set(ATOMIC_LIBRARY "")
-+endif()
-+
- if(HAVE_FUNC_PTHREAD_SETNAME_NP)
-     add_definitions(-DDLT_USE_PTHREAD_SETNAME_NP)
-     message(STATUS "Using pthread_setname_np API to set thread name")
-@@ -44,7 +50,7 @@ else()
-     message(STATUS "pthread_setname_np API not available on this platform=
")
- endif()
-=20
--target_link_libraries(dlt ${RT_LIBRARY} ${SOCKET_LIBRARY} Threads::Thread=
s)
-+target_link_libraries(dlt ${RT_LIBRARY} ${SOCKET_LIBRARY} ${ATOMIC_LIBRAR=
Y} Threads::Threads)
-=20
- target_include_directories(dlt
-     PUBLIC
---=20
-2.36.0
-
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-system=
-Fix-buffer-overflow-detection-on-32bit-ta.patch b/meta-oe/recipes-extended=
/dlt-daemon/dlt-daemon/0001-dlt-system-Fix-buffer-overflow-detection-on-32b=
it-ta.patch
deleted file mode 100644
index e7e6cb3b1..000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-dlt-system-Fix-bu=
ffer-overflow-detection-on-32bit-ta.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 94378458d653b1edca86435026909592cbe5e793 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 19 Aug 2022 11:12:17 +0800
-Subject: [PATCH] dlt-system: Fix buffer overflow detection on 32bit targets
-
-On 32bit target, dlt-system will termiated with error:
-dlt-system: *** buffer overflow detected ***: terminated
-
-Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/398]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/system/dlt-system-watchdog.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/system/dlt-system-watchdog.c b/src/system/dlt-system-watc=
hdog.c
-index a2b01de..c0eaa12 100644
---- a/src/system/dlt-system-watchdog.c
-+++ b/src/system/dlt-system-watchdog.c
-@@ -109,8 +109,8 @@ int register_watchdog_fd(struct pollfd *pollfd, int fd=
cnt)
-=20
- void watchdog_fd_handler(int fd)
- {
--    long int timersElapsed =3D 0;
--    int r =3D read(fd, &timersElapsed, 8);    // only needed to reset fd =
event
-+    uint64_t timersElapsed =3D 0ULL;
-+    int r =3D read(fd, &timersElapsed, 8U);    // only needed to reset fd=
 event
-     if(r < 0)
-         DLT_LOG(watchdogContext, DLT_LOG_ERROR, DLT_STRING("Could not res=
et systemd watchdog. Exit with: "),=20
-             DLT_STRING(strerror(r)));
-@@ -120,4 +120,4 @@ void watchdog_fd_handler(int fd)
-=20
-     DLT_LOG(watchdogContext, DLT_LOG_DEBUG, DLT_STRING("systemd watchdog =
waited periodic\n"));
- }
--#endif
-\ No newline at end of file
-+#endif
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
new file mode 100644
index 000000000..a3f2b2f9e
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/481.patch
@@ -0,0 +1,47 @@
+From 95476de802585629c6d89707a9247bbb0c70f6c9 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Fri, 28 Apr 2023 22:39:57 +0200
+Subject: [PATCH] Update gtest_dlt_daemon_multiple_files_logging.cpp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix build error due to dlt_vlog not having the correct format string with =
security build flags enabled
+
+[ 88%] Building CXX object tests/CMakeFiles/gtest_dlt_daemon_multiple_file=
s_logging.dir/gtest_dlt_daemon_multiple_files_logging.cpp.o
+cd dlt-daemon-2.18.9/obj-x86_64-linux-gnu/tests && /usr/bin/c++ -DCONFIGUR=
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
+dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_files_logging.cpp: In me=
mber function =E2=80=98virtual void t_dlt_logging_multiple_files_append_rei=
nit_normal_Test::TestBody()=E2=80=99:
+dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_files_logging.cpp:106:13=
: error: format not a string literal and no format arguments [-Werror=3Dfor=
mat-security]
+  106 |     dlt_vlog(LOG_INFO, log1);
+      |     ~~~~~~~~^~~~~~~~~~~~~~~~
+dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_files_logging.cpp:110:13=
: error: format not a string literal and no format arguments [-Werror=3Dfor=
mat-security]
+  110 |     dlt_vlog(LOG_INFO, log2);
+      |     ~~~~~~~~^~~~~~~~~~~~~~~~
+In file included from /usr/include/string.h:535,
+                 from /usr/include/gtest/internal/gtest-port.h:264,
+                 from /usr/include/gtest/internal/gtest-internal.h:40,
+                 from /usr/include/gtest/gtest.h:62,
+                 from dlt-daemon-2.18.9/tests/gtest_dlt_daemon_multiple_fi=
les_logging.cpp:27:
+In function =E2=80=98strncpy=E2=80=99,
+---
+ tests/gtest_dlt_daemon_multiple_files_logging.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/gtest_dlt_daemon_multiple_files_logging.cpp b/tests/gte=
st_dlt_daemon_multiple_files_logging.cpp
+index 2da512e1..05b58f2c 100644
+--- a/tests/gtest_dlt_daemon_multiple_files_logging.cpp
++++ b/tests/gtest_dlt_daemon_multiple_files_logging.cpp
+@@ -103,11 +103,11 @@ TEST(t_dlt_logging_multiple_files_append_reinit, nor=
mal)
+     const char* log2 =3D "TWO\n";
+=20
+     configure(path, file_name, true, file_size, max_file_size);
+-    dlt_vlog(LOG_INFO, log1);
++    dlt_vlog(LOG_INFO, "%s", log1);
+     EXPECT_NO_THROW(dlt_log_free());
+=20
+     configure(path, file_name, true, file_size, max_file_size);
+-    dlt_vlog(LOG_INFO, log2);
++    dlt_vlog(LOG_INFO, "%s", log2);
+     EXPECT_NO_THROW(dlt_log_free());
+     verify_in_one_file(path, file_name, log1, log2);
+ }
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
new file mode 100644
index 000000000..a4c18779c
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/482.patch
@@ -0,0 +1,38 @@
+From b38761831670e980a58acb33d611f65255d678ac Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Fri, 28 Apr 2023 22:46:36 +0200
+Subject: [PATCH] Update CMakeLists.txt
+
+Link systemd libraries, to avoid underlinking of tests with
+-DWITH_SYSTEMD_SOCKET_ACTIVATION=3DON
+
+[ 82%] Linking CXX executable gtest_dlt_daemon_gateway
+cd dlt-daemon-2.18.9/obj-x86_64-linux-gnu/tests && /usr/bin/cmake -E cmake=
_link_script CMakeFiles/gtest_dlt_daemon_gateway.dir/link.txt --verbose=3D1
+/usr/bin/c++ -g -O2 -ffile-prefix-map=3Ddlt-daemon-2.18.9=3D. -flto=3Dauto=
 -ffat-lto-objects -flto=3Dauto -ffat-lto-objects -fstack-protector-strong =
-Wformat -Werror=3Dformat-security -Wdate-time -D_FORTIFY_SOURCE=3D2 -isyst=
em /include -std=3Dgnu++0x -Wl,-Bsymbolic-functions -flto=3Dauto -ffat-lto-=
objects -flto=3Dauto -Wl,-z,relro -rdynamic CMakeFiles/gtest_dlt_daemon_gat=
eway.dir/gtest_dlt_daemon_gateway.cpp.o CMakeFiles/gtest_dlt_daemon_gateway=
.dir/__/systemd/3rdparty/sd-daemon.c.o -o gtest_dlt_daemon_gateway  -Wl,-rp=
ath,dlt-daemon-2.18.9/obj-x86_64-linux-gnu/src/daemon ../src/daemon/libdlt_=
daemon.so /usr/lib/x86_64-linux-gnu/libgtest.a /usr/lib/x86_64-linux-gnu/li=
bgtest_main.a -lrt /usr/lib/x86_64-linux-gnu/libgtest.a
+/usr/bin/ld: ../src/daemon/libdlt_daemon.so: undefined reference to `sd_li=
sten_fds_with_names'
+---
+ tests/CMakeLists.txt | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 579d7308..3155ca9a 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -21,8 +21,16 @@ else()
+     set(LIBRARIES socket)
+ endif()
+=20
++if(WITH_SYSTEMD_JOURNAL)
++ if(SYSTEMD_VERSION LESS 209)
++  set(SYSTEMD_LIBS systemd-journal systemd-id128)
++ else(SYSTEMD_VERSION LESS 209)
++  set(SYSTEMD_LIBS systemd)
++ endif(SYSTEMD_VERSION LESS 209)
++endif(WITH_SYSTEMD_JOURNAL)
++
+ set(DLT_LIBRARIES dlt ${GTEST_LIBS} ${LIBRARIES})
+-set(DLT_DAEMON_LIBRARIES dlt_daemon ${GTEST_LIBS} ${LIBRARIES})
++set(DLT_DAEMON_LIBRARIES dlt_daemon ${GTEST_LIBS} ${LIBRARIES} ${SYSTEMD_=
LIBS})
+ set(DLT_CONTROL_LIBRARIES dlt dlt_control_common_lib ${GTEST_LIBS})
+=20
+ #Receiver used for QTs. add_test() is not required
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb b/met=
a-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb
similarity index 90%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb
index cfbe0ff60..6b049df6c 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.8.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.9.bb
@@ -17,19 +17,14 @@ DEPENDS =3D "zlib gzip-native json-c"
 SRC_URI =3D "git://github.com/GENIVI/${BPN}.git;protocol=3Dhttps;branch=3D=
master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch \
            file://0004-Modify-systemd-config-directory.patch \
-           file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
-           file://0001-dlt-system-Fix-buffer-overflow-detection-on-32bit-t=
a.patch \
-           file://0001-Fix-memory-leak.patch \
+           file://481.patch \
+           file://482.patch \
            "
-SRCREV =3D "6a3bd901d825c7206797e36ea98e10a218f5aad2"
-
-PV .=3D "+2.18.9git${SRCPV}"
+SRCREV =3D "9a2312d3512a27620d41b9a325338b6e7b3d42de"
=20
 S =3D "${WORKDIR}/git"
=20
-LDFLAGS:append:riscv64 =3D " -latomic"
-
-PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' s=
ystemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-adapto=
r-udp dlt-console ', '', d)} \
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', ' s=
ystemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-adapto=
r-stdin dlt-adaptor-udp dlt-console ', '', d)} \
  udp-connection dlt-system dlt-filetransfer "
 # dlt-dbus
=20
@@ -46,6 +41,7 @@ PACKAGECONFIG[udp-connection] =3D "-DWITH_UDP_CONNECTION=
=3DON,-DWITH_UDP_CONNECTION=3D
 # Command line options
 PACKAGECONFIG[dlt-system] =3D "-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_SYSTEM=3D=
OFF"
 PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPTOR=
=3DOFF,,dlt-daemon-systemd"
+PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWITH=
_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon-systemd"
 PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_DLT=
_ADAPTOR_UDP=3DOFF,,dlt-daemon-systemd"
 PACKAGECONFIG[dlt-filetransfer] =3D "-DWITH_DLT_FILETRANSFER=3DON,-DWITH_D=
LT_FILETRANSFER=3DOFF"
 PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSOLE=
=3DOFF,,dlt-daemon-systemd"
--=20
2.34.1


