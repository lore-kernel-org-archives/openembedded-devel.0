Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9179AC5516E
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 18:03:05 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17841.1785434582928337347
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 11:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DweIyK8j;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38f620399a0so161477a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785434582; x=1786039382; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lhPgCIA+4l10mjkhtaR2VUZuGbqOAfOw1yQhFEndYR4=;
        b=DweIyK8jyZSQSOBbc0wYKxGo2x9FLK7mh8RHwlpfTvIwbUfkiGV+On8GLSDFG5g0aN
         KVTmngZvVA1sCarj91K9fqFxcXRxskPKaakMS2v3nF3R+HJ2gfdoTxG+97o9q3yYvF61
         u0xDxoz/U1g21MCav8ALt0nrRv57VDPtZYjps95VChkmXaYWsnNEhTDUPyTl64JzFPQK
         JqYKVImQhQOXl4OeRfychnMHa+qpF8D7Dotf1h2pdi12DQVDf9AlR+O/khP78UT+UZzF
         ox6jC8gtiwLei5WJfEFqeyn7W1qADXmpRdumSn3E6TycNdr+o/QFsw9NbrySPyS174fk
         WjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434582; x=1786039382;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhPgCIA+4l10mjkhtaR2VUZuGbqOAfOw1yQhFEndYR4=;
        b=qiUZRx1VLL6++HCKJVJ36VArigIDw8XukCmjR8VXk0JhTB+FiL/Hz2CYEJIaXiFnOv
         6Dh3ogCMdVI0dZSkbU+iFWm2U6mob4XP4ncjJD4N073KEhHqPLBPYG5nVEjzCiUGIlI8
         eNAX+iECef7sR47ZyJuf3GGP5EBC3Fq3LNzY5imWUhYQwfanBvudNYxVfB0JkNR2bkxm
         q0RZxQbGk5y7uFPi4VdDETAoAlNPGl3qHRavC+bgpp9ed7xr3fgOaxnGhtK5hMnaWwXL
         EFBDMqAP2nNL08nLmUIzzhTBVVVv3a7qfHQpqbisG9OuX8fPMHn5WGjj/HSj7zhDkd6n
         zGdg==
X-Gm-Message-State: AOJu0YxbFcAnrVYilvcJG0xuNYRfcpJ5bTshPoj/iBqrH/ixe41ADtzz
	BGirA1Tq25jAbbK4eH7eYSRqyZdmjA0DT4Z8QPmvuwzdjCvv5srLd/OWB/htyeKk
X-Gm-Gg: AR+sD13vaQf1AdAbR64MqAmlbdZcS+bmAAG5oPV/tK0iYaHuRqeXcSXcb6m4W5pmyan
	p2XxBdRl0SsgK2FtD/oek55tH/kcpSE2L3JQtCoJppTVMcQYis5cKL6j9X5NxQHRTSrTMORV8TD
	ejQ2icHThK2hM2G0hehkuHVHNjNk3zDxIwclWdGz/tshOdmAokmwLEjguIrqFfkrQH8pjyPPzyZ
	hJokc1k3miEAJcCSY7N/kA5W51B8ZN5Eu+usGfdlt+kZOQ9M+4yJwWortsQhbffKPvZKKlaOZJW
	1G9E0vhY/5ctknHbVlbTSyZQaGU2avxyz0HaRTBIaB8vXA4pp542ZcX+ZS/tn+Vvp66S2SXeWXk
	g3gWKfILKcDrMC739bgIcGa7d4TQrt/mL6RefOx8r3u6oOAw3+b1xX1rZozLZt1RM3MaFfqwIre
	mBuzMCvW5S1T4XYEpVMDob3n4DGHsBX8xknGDiVujoHL99sfbVsliWVZdQGHcs4UEqAgy3LuQ74
	dyUoalUyCVKBTBuA4kMG8czQYY2AYuwPmrROCC4+E4EzCp7fEadKViRt1P5vVNMoGPd0WzqJKPy
	zv8JPDb9ldQrhSda3yptdco2O/J4POCUGDCRLs2S8DoXwXzjZ59wmH6Qzr9qdv+deYpHR7bE58B
	ztA==
X-Received: by 2002:a17:90b:1dd0:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-38fa7dcb02bmr864248a91.6.1785434581967;
        Thu, 30 Jul 2026 11:03:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7265010esm24015408c88.6.2026.07.30.11.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:03:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 2/4] netdata: upgrade 1.47.5 -> 2.10.4
Date: Thu, 30 Jul 2026 11:02:54 -0700
Message-ID: <20260730180257.3733387-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730180257.3733387-1-khem.raj@oss.qualcomm.com>
References: <20260730180257.3733387-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 18:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128574

Major version jump (1.x → 2.x series). Key upstream changes:
 * 2.x dropped the legacy Netdata Cloud Agent-Cloud-Link (ACLK) and
   merged cloud-connectivity into the main binary; ENABLE_ACLK and
   ENABLE_CLOUD cmake options removed. OpenSSL and libcurl are now
   mandatory build dependencies (no longer optional via PACKAGECONFIG).
 * Improved database engine, new collectors (systemd-units, OTel,
   scripts plugin), and expanded Go plugin with SNMP overhaul.
 * 2.10.x stabilization: fix ZFS-related crashes, eBPF shared-memory
   pool leak, SNMP counter wrapping, database engine memory safety.
 * 2.10.4: larger patch for stability, memory safety, and crash
   resilience across database engine, streaming, and collectors;
   backports new macOS hardware sensor collectors.

Recipe changes:
 * Add curl and openssl to mandatory DEPENDS (both now REQUIRED by
   cmake); remove PACKAGECONFIG[openssl] and PACKAGECONFIG[cloud].
 * Remove webui_v0/v1/v2 PACKAGECONFIG entries and associated
   do_install block (the webui architecture changed in 2.x).
 * Remove -DENABLE_ACLK=OFF from EXTRA_OECMAKE (option no longer
   exists); keep -DENABLE_EXPORTER_PROMETHEUS_REMOTE_WRITE=OFF.
 * Refresh 0002-Do-not-hardcode-systemd-unit-directories.patch for
   2.10.4 (the BUILD_FOR_PACKAGING/systemd service install blocks
   shifted ~1119 lines; same substitution preserved).
 * 2.x vendors its own libsensors copy which needs flex/bison to
   generate its config lexer/parser at build time; add flex-native
   and bison-native to DEPENDS.
 * Protobuf detection now runs unconditionally (used by several 2.x
   exporters/collectors even with the remote-write exporter disabled);
   add protobuf and protobuf-native to DEPENDS and point cmake at the
   native protoc via Protobuf_PROTOC_EXECUTABLE.
 * Disable several 2.x features that reach out to the network at
   configure time and cannot work in an offline build:
    - ENABLE_PLUGIN_OTEL / ENABLE_PLUGIN_OTEL_SIGNAL_VIEWER (pull in
      Rust/Corrosion via CMake FetchContent)
    - ENABLE_PLUGIN_SCRIPTS (requires Go, same as ENABLE_PLUGIN_GO)
    - ENABLE_ML (FetchContent-downloads dlib)
    - ENABLE_LIBBACKTRACE (ExternalProject-downloads libbacktrace)
    - ENABLE_DASHBOARD, now exposed as PACKAGECONFIG[dashboard] and
      off by default (the local agent dashboard isn't shipped in the
      release tarball; enabling it makes cmake fetch it from
      app.netdata.cloud at configure time)
 * BUILD_FOR_PACKAGING=ON now also installs sysusers.d/tmpfiles.d
   snippets under ${nonarch_libdir}; remove them in do_install since
   user creation is handled by useradd.bbclass and tmpfiles by our own
   netdata-volatiles.conf, avoiding an "installed but not shipped" QA
   failure from duplicate/unmanaged files.
 * Fix three new-in-2.x reproducibility leaks that embed host build
   paths into the packages (buildpaths QA, an error in oe-core's default
   ERROR_QA):
    - Add 0003-Do-not-record-the-configure-command-line-in-the-binar.patch:
      2.x bakes the full cmake invocation into config.h for
      "netdata -W buildinfo"; the collected flags include --sysroot= and
      -ffile-prefix-map= and so leak ${WORKDIR} into the binary.
    - Add 0004-libsensors-do-not-emit-line-directives-in-generated-s.patch:
      pass bison -l / flex -L so the generated conf-parse.[ch] and
      conf-lex.c do not carry absolute #line paths (these live in file
      contents, so -ffile-prefix-map cannot rewrite them).
    - Remove the shipped build-info-cmake-cache.gz in do_install: it is a
      gzipped CMakeCache.txt kept only for buildinfo reporting and is full
      of host paths.
   Verified with buildpaths promoted back to ERROR_QA: netdata builds and
   packages with no buildpaths diagnostics and no /home path remains
   anywhere under the package tree.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ot-hardcode-systemd-unit-directories.patch | 20 +++---
 ...-configure-command-line-in-the-binar.patch | 31 ++++++++
 ...-emit-line-directives-in-generated-s.patch | 40 +++++++++++
 .../{netdata_1.47.5.bb => netdata_2.10.4.bb}  | 71 +++++++++++--------
 4 files changed, 124 insertions(+), 38 deletions(-)
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0003-Do-not-record-the-configure-command-line-in-the-binar.patch
 create mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0004-libsensors-do-not-emit-line-directives-in-generated-s.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.47.5.bb => netdata_2.10.4.bb} (68%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
index 143caf89cb..15668c121b 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
@@ -3,26 +3,28 @@ From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
 Date: Tue, 1 Oct 2024 17:01:33 +0200
 Subject: [PATCH] Do not hardcode systemd unit directories
 
+Refreshed for netdata v2.10.4 (context shifted; same intent preserved).
+
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
 ---
  CMakeLists.txt | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: netdata-v1.47.3/CMakeLists.txt
-===================================================================
---- netdata-v1.47.3.orig/CMakeLists.txt
-+++ netdata-v1.47.3/CMakeLists.txt
-@@ -2531,7 +2531,7 @@ if(BUILD_FOR_PACKAGING)
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index d6dafd9..530298e 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3642,7 +3642,7 @@ if(BUILD_FOR_PACKAGING)
          install(FILES
                  ${CMAKE_BINARY_DIR}/system/systemd/netdata.service
                  COMPONENT netdata
 -                DESTINATION lib/systemd/system)
 +                DESTINATION $ENV{systemd_system_unitdir})
-         install(DIRECTORY
-                 COMPONENT netdata
-                 DESTINATION usr/lib/systemd/journald@netdata.conf.d)
-@@ -2620,11 +2620,11 @@ if(NOT OS_WINDOWS)
+         install(FILES
+                 ${CMAKE_BINARY_DIR}/system/systemd/sysusers/netdata.conf
+                 COMPONENT user
+@@ -3739,11 +3739,11 @@ if(NOT OS_WINDOWS)
      install(FILES
              ${CMAKE_BINARY_DIR}/system/systemd/netdata-updater.service
              COMPONENT netdata
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0003-Do-not-record-the-configure-command-line-in-the-binar.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0003-Do-not-record-the-configure-command-line-in-the-binar.patch
new file mode 100644
index 0000000000..4d0b81a0f3
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0003-Do-not-record-the-configure-command-line-in-the-binar.patch
@@ -0,0 +1,31 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 29 Jul 2026 20:00:00 +0000
+Subject: [PATCH] Do not record the configure command line in the binary
+
+The CONFIGURE_COMMAND string is baked into config.h and reported by
+"netdata -W buildinfo". In a cross build the collected flags contain
+--sysroot=, -ffile-prefix-map= and similar arguments that carry absolute
+host build paths, so the resulting binary embeds the build directory.
+That makes the build unreproducible and trips OE's buildpaths QA check.
+
+The string is purely informational, so report it as unavailable rather
+than leaking the build environment into the shipped binary.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3397,7 +3397,7 @@
+         "-DCMAKE_SHARED_LINKER_FLAGS='${CMAKE_SHARED_LINKER_FLAGS}'"
+ )
+
+-string(JOIN " " CONFIGURE_COMMAND "cmake" ${CONFIGURE_OPTIONS})
++set(CONFIGURE_COMMAND "unavailable (stripped for reproducible builds)")
+
+ if (NOT NETDATA_USER)
+         set(NETDATA_USER "netdata")
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0004-libsensors-do-not-emit-line-directives-in-generated-s.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0004-libsensors-do-not-emit-line-directives-in-generated-s.patch
new file mode 100644
index 0000000000..9d3cee4c37
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0004-libsensors-do-not-emit-line-directives-in-generated-s.patch
@@ -0,0 +1,40 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 29 Jul 2026 20:10:00 +0000
+Subject: [PATCH] libsensors: do not emit #line directives in generated sources
+
+bison and flex embed the absolute path of both the input grammar and the
+generated output into #line directives. Those paths live in the file
+contents rather than in debug info, so -ffile-prefix-map cannot rewrite
+them, and the generated conf-parse.[ch]/conf-lex.c shipped in the debug
+source package end up referencing the host build directory. That makes
+the build unreproducible and trips OE's buildpaths QA check.
+
+Pass -l (bison) and -L (flex) to suppress the #line directives. The only
+effect is that compiler diagnostics for the generated parser point at the
+generated file instead of the grammar, which is an acceptable trade for a
+vendored parser that is not being developed here.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/collectors/debugfs.plugin/libsensors/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/src/collectors/debugfs.plugin/libsensors/CMakeLists.txt
++++ b/src/collectors/debugfs.plugin/libsensors/CMakeLists.txt
+@@ -16,12 +16,12 @@
+
+ # Generate Bison parser
+ bison_target(LibsensorsParser vendored/lib/conf-parse.y ${CMAKE_CURRENT_BINARY_DIR}/conf-parse.c
+-        COMPILE_FLAGS "-p sensors_yy --defines=${CMAKE_CURRENT_BINARY_DIR}/conf-parse.h"
++        COMPILE_FLAGS "-p sensors_yy -l --defines=${CMAKE_CURRENT_BINARY_DIR}/conf-parse.h"
+ )
+
+ # Generate Flex scanner
+ flex_target(LibsensorsLexer vendored/lib/conf-lex.l ${CMAKE_CURRENT_BINARY_DIR}/conf-lex.c
+-        COMPILE_FLAGS "-Psensors_yy -Cfe -8"
++        COMPILE_FLAGS "-Psensors_yy -Cfe -8 -L"
+ )
+
+ # Add dependency to ensure correct build order
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
similarity index 68%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
index f18c979685..709538b1d4 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.47.5.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
@@ -6,10 +6,16 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
 DEPENDS += "\
+    bison-native \
+    curl \
+    flex-native \
     json-c \
     libuv \
     libyaml \
     lz4 \
+    openssl \
+    protobuf \
+    protobuf-native \
     util-linux \
     zlib \
     "
@@ -17,11 +23,13 @@ DEPENDS += "\
 SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
     file://0002-Do-not-hardcode-systemd-unit-directories.patch \
+    file://0003-Do-not-record-the-configure-command-line-in-the-binar.patch \
+    file://0004-libsensors-do-not-emit-line-directives-in-generated-s.patch \
     file://netdata.conf \
     file://netdata-volatiles.conf \
     ${@bb.utils.contains('PACKAGECONFIG', 'go', 'file://go.d.conf', '', d)} \
     "
-SRC_URI[sha256sum] = "8073eee2392f92daa1f8bb5cf13fb988b8c3b52ff9574b50706ff69bdbdb51ce"
+SRC_URI[sha256sum] = "d1ae949863925d626b1d42a53000bcca2c239718e0b0ddc6a3f3f5029b21cdfe"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>(?!1\.99)\d+(?:\.\d+)*)"
@@ -63,10 +71,8 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata \
     ${@bb.utils.contains('PACKAGECONFIG','docker','--groups docker','',d)} --user-group netdata"
 
-PACKAGECONFIG ??= "openssl freeipmi ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "freeipmi ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[brotli] = ",,brotli"
-PACKAGECONFIG[cloud] = "-DENABLE_CLOUD=ON,-DENABLE_CLOUD=OFF,"
-PACKAGECONFIG[openssl] = "-DENABLE_OPENSSL=ON,-DENABLE_OPENSSL=OFF,openssl"
 PACKAGECONFIG[freeipmi] = "-DENABLE_PLUGIN_FREEIPMI=ON,-DENABLE_PLUGIN_FREEIPMI=OFF,freeipmi"
 PACKAGECONFIG[nfacct] = "-DENABLE_PLUGIN_NFACCT=ON,-DENABLE_PLUGIN_NFACCT=OFF,libmnl"
 # needs meta-virtualization
@@ -75,14 +81,28 @@ PACKAGECONFIG[cups] = "-DENABLE_PLUGIN_CUPS=ON,-DENABLE_PLUGIN_CUPS=OFF,cups"
 PACKAGECONFIG[systemd] = "-DENABLE_PLUGIN_SYSTEMD_JOURNAL=ON,-DENABLE_PLUGIN_SYSTEMD_JOURNAL=OFF,systemd"
 PACKAGECONFIG[docker] = ",,virtual/docker, virtual/docker"
 PACKAGECONFIG[go] = "-DENABLE_PLUGIN_GO=ON, -DENABLE_PLUGIN_GO=OFF"
-# WebUI (packageconfig not set: v0, v1 & v2)
-PACKAGECONFIG[webui_v0] = ",,,,,webui_v1 webui_v2"
-PACKAGECONFIG[webui_v1] = ",,,,,webui_v0 webui_v2"
-PACKAGECONFIG[webui_v2] = ",,,,,webui_v0 webui_v1"
-
-# ebpf doesn't compile (or detect) the cross compilation well
-EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF -DBUILD_FOR_PACKAGING=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
-                  -DENABLE_ACLK=OFF -DENABLE_EXPORTER_PROMETHEUS_REMOTE_WRITE=OFF -DCMAKE_INSTALL_PREFIX='${base_prefix}'"
+# The local agent dashboard is not shipped in the release tarball; enabling it
+# makes CMake download https://app.netdata.cloud/agent.tar.gz at configure
+# time, which cannot work in an offline build. Off by default.
+PACKAGECONFIG[dashboard] = "-DENABLE_DASHBOARD=ON,-DENABLE_DASHBOARD=OFF"
+
+# ebpf doesn't compile (or detect) the cross compilation well.
+# Several 2.x features fetch sources at configure time, which cannot work in
+# an offline build, so they are disabled here:
+#  - ENABLE_PLUGIN_OTEL / ENABLE_PLUGIN_OTEL_SIGNAL_VIEWER pull Rust/Corrosion
+#    via CMake FetchContent.
+#  - ENABLE_PLUGIN_SCRIPTS requires Go (as does ENABLE_PLUGIN_GO).
+#  - ENABLE_ML FetchContent-downloads dlib.
+#  - ENABLE_LIBBACKTRACE ExternalProject-downloads libbacktrace.
+# Protobuf is detected unconditionally and needs the native protoc.
+EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF \
+                  -DENABLE_PLUGIN_OTEL=OFF -DENABLE_PLUGIN_OTEL_SIGNAL_VIEWER=OFF \
+                  -DENABLE_PLUGIN_SCRIPTS=OFF \
+                  -DENABLE_ML=OFF \
+                  -DENABLE_LIBBACKTRACE=OFF \
+                  -DProtobuf_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
+                  -DBUILD_FOR_PACKAGING=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
+                  -DENABLE_EXPORTER_PROMETHEUS_REMOTE_WRITE=OFF -DCMAKE_INSTALL_PREFIX='${base_prefix}'"
 
 do_compile:append() {
     # Go dependencies are protected with read-only permissions, but would prevent cleaning
@@ -127,23 +147,16 @@ do_install:append() {
     install --group netdata --owner netdata --directory ${D}${localstatedir}/cache/netdata
     install --group netdata --owner netdata --directory ${D}${localstatedir}/lib/netdata
 
-    # webUI
-    if  "${@bb.utils.contains('PACKAGECONFIG', 'webui_v0', 'true', 'false', d)}"; then
-        rm -rf ${D}${datadir}/netdata/web/v1
-        rm -rf ${D}${datadir}/netdata/web/v2
-        install -m 0644 ${D}${datadir}/netdata/web/v0/index.html ${D}${datadir}/netdata/web/
-    fi
-    if "${@bb.utils.contains('PACKAGECONFIG', 'webui_v1', 'true', 'false', d)}"; then
-        rm -rf ${D}${datadir}/netdata/web/v0
-        rm -rf ${D}${datadir}/netdata/web/v2
-        install -m 0644 ${D}${datadir}/netdata/web/v1/index.html ${D}${datadir}/netdata/web/
-    fi
-    if "${@bb.utils.contains('PACKAGECONFIG', 'webui_v2', 'true', 'false', d)}"; then
-        rm -rf ${D}${datadir}/netdata/web/v0
-        rm -rf ${D}${datadir}/netdata/web/v1
-        install -m 0644 ${D}${datadir}/netdata/web/v2/index.html ${D}${datadir}/netdata/web/
-    fi
-    chown -R netdata:netdata ${D}${datadir}/netdata/web
+    # BUILD_FOR_PACKAGING installs its own sysusers.d/tmpfiles.d snippets, but
+    # user creation is handled by useradd.bbclass and tmpfiles by our own
+    # netdata-volatiles.conf above, so drop the upstream ones to avoid
+    # shipping duplicate/unmanaged files.
+    rm -rf ${D}${nonarch_libdir}/sysusers.d ${D}${nonarch_libdir}/tmpfiles.d
+
+    # 2.x ships a gzipped copy of CMakeCache.txt purely so that
+    # "netdata -W buildinfo" can report it; it is full of host build paths.
+    # It carries no runtime value in a cross build, so drop it.
+    rm -f ${D}${datadir}/netdata/build-info-cmake-cache.gz
 }
 
 FILES:${PN} += "\

