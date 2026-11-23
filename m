Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48069.1795411909456189882
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Omalgvr7;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38699cf08dfso2510594eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411909; x=1796016709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2hPS4hNhJJL5ZZ99gjxRHF9M8uKjxmy3AKlWVTqjmQ=;
        b=Omalgvr7eXQFQI4P7BivZuRM7YJow5HBKfALhTvD3x9M1hc2FLdyufHk0dUPCw/Dm0
         Yj+bSVDLcPGaIWo9f0CbwQaKWu2DZyndpIRQp5heRYSGkLYTsjs73vNaZ6K+roZXHuag
         EnNOik2J6Ig3AXWuI185emPhP2G5wPO+uVbrhXzwnLQZMNcc4pV5hZ0ki6lpYF4++RpU
         YtNf0V+ExP6/c7c9H/JnTMuAIwWSFpKuyvZg5ALWnqbDYBBmjlYFyQOmGpXH05y2XWQE
         ueEKVahqh6LLAI+TgZqF0BG3Mt2nkoRfVTbgEs9v6i8jC3gLTHqZEsk7FiziuzyTe1o9
         q7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411909; x=1796016709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2hPS4hNhJJL5ZZ99gjxRHF9M8uKjxmy3AKlWVTqjmQ=;
        b=ytT60uXRfMjX4FS++/DZbhVeMoXKFW2kM3qDYYPCIfH4fcFvSIQLp/yXvOKfqw7FkD
         TSwQin2Qv0PdOkwOREtZhm+cK1yAaYIj7MDtihqCHmC4UFRrRn4m75eL4gBD9Qe2h3rE
         FLSK/nK7ZEyXoW8vZb4YRMbqf2nxrqzdCc7ieMvk0ErQNO9wtrvIDWR5cre/g5yOIM72
         7bKV8+5ullexjmmuUpjfWfis0TLQv8lPwgAq1dVIebexXkQm7/ze+ZExzzDwvUrWPsXo
         5FUWL/JR6ndU+2oPYvSeFWuqNYf4Y6lLU8gsqvU1iN/o4wapQJPWYkeBfcUBBEtBxKM9
         Chbg==
X-Gm-Message-State: APuU4Z/4hX9A+trubTCZhGCuaJEbWeFwsVF3ydpkAQl4YH1NJoJoGarE
	ri/4vU7Qw83bZIFX0qKbCnxIgSm6ytY2jyQ6CvgH9hjsZ55XflSqn2aCYPrLOeEz6nQ=
X-Gm-Gg: AZFdTZfAzuSdWhNrnx+BwoxDDxbXqvG6aAudCgJKNxOox4BErmiuu4qanelZ1ZVi0vR
	os14n09H1cu/+WFAHZGDY4co6lJ2qawD1b8hx0i3v6oxdtOnqadRDEkbSzCMwwx15aj0RIRUhXR
	Ig6+Y94ZSg30bE8UOAlngmDAxBCUlxlaGzyeRDjwObvFfWhFBrwUBnYGy57qGfut3uWyEXpM141
	R0Qaxy/Kf4csTj/mhvG0J4he5rQz/ZZrGMtV0i9MpngUxkmu7fSFTcp22yIrHZtynywJMuaX8v7
	mu54q2maG80KTi+hyW6/OnXDhoEt/x4Xkdb4DbV+fMVwnXAg8VaMz3qMM7eL/XX2IBJUdGBgpEI
	o5ZQrN8pmKZez4ZldMJbnCi6fjeHxbzFQwUFj9m3p/b04VyLvqVSIZVpVzwh0ex1b+ltM98Gk88
	mRsQaBtpImpw3nFY3r//N/RQaJUmqI/kymgiEEuUX14BmTvjLInBGQOqFh/03mz8B7ZQ5MlO9O9
	4K/HXcHgbHRfnHTSqJkSfypwoRz4ebY5SxQVZjISA5Ywcvd3/V2d87LxH29G7Qd45cVz5RT5LiF
	dV3AFOgej/QwcfljzbaE2VWyP3CAdWerZIFPaf1mEFA/2FgE6ZlSSTUF2lfRkLvbcREJsGSSY1/
	6fYgGfFpI6MpqjBF+e8J6PAtDs7XFbz+HStOW6NlScDVlsYvnhvwAPvavzlwLI8+pmwmAlH05KV
	p3Oq8GQrKVFrduOr3JW6N+wfjLas9B7YjB5+6lP2vpvsO3Gp+qP6dXZYKie4SsXmNpGcbAb19I4
	FXTBbmsDJvMAI5RFY/f3+4CuE+wY05UjP+GZqNf1e6pBpo9Ay52bnh8fGveHzo9dVnw4HRp4Rng
	ParB
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr15260253eec.23.1795411908701;
        Sun, 22 Nov 2026 21:31:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 1/3] netdata: upgrade 2.12.3 -> 2.13.0
Date: Sun, 22 Nov 2026 21:29:48 -0800
Message-ID: <20261123052953.3658549-92-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132879
Content-Type: text/plain; charset="utf-8"

- New Digital Experience Monitoring plugin (preview): real user page
  views, Core Web Vitals and JS errors, synthetic browser tests
- OpenTelemetry traces turned into per-service charts and a service
  map; OTLP over HTTP; listener config moved to
  receivers.otlp.protocols
- IPMI collected by a new Go plugin by default instead of FreeIPMI
- New NVIDIA Jetson and Cisco Meraki collectors
- Prometheus collector series limits replaced by max_input_series and
  max_output_series_per_context (old options removed)
- Parent performance work and dbengine/streaming crash and leak fixes

Upstream replaced BUILD_FOR_PACKAGING with NETDATA_PACKAGE_KIND, so
pass deb on systemd builds and bundle otherwise. The new Go based
ipmi.plugin and dem.plugin are enabled by default and fetch modules at
build time; tie them to the go PACKAGECONFIG. Rework the systemd unit
and configure command patches for the install layout that moved into
packaging/cmake/Modules, and drop the SQLite backport, which is part of
2.13.0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ot-hardcode-systemd-unit-directories.patch | 30 +++----
 ...-configure-command-line-in-the-binar.patch | 16 ++--
 ...low-using-a-local-SQLite-source-tree.patch | 85 -------------------
 .../{netdata_2.12.3.bb => netdata_2.13.0.bb}  |  9 +-
 4 files changed, 26 insertions(+), 114 deletions(-)
 delete mode 100644 meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch
 rename meta-webserver/recipes-webadmin/netdata/{netdata_2.12.3.bb => netdata_2.13.0.bb} (94%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
index 43024ccd49..e7baf6bbb0 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0002-Do-not-hardcode-systemd-unit-directories.patch
@@ -3,30 +3,28 @@ From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
 Date: Tue, 1 Oct 2024 17:01:33 +0200
 Subject: [PATCH] Do not hardcode systemd unit directories
 
-Refreshed for netdata v2.12.3: upstream now routes all systemd unit
-installs through NETDATA_SYSTEMD_UNIT_DEST, so override that variable
+Refreshed for netdata v2.13.0: upstream now routes all systemd unit
+installs through HOST_SYSTEMD_UNIT_DEST, so override that variable
 instead of each DESTINATION.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
 ---
- CMakeLists.txt | 6 +-----
+ packaging/cmake/Modules/NetdataInstallLayout.cmake | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1cd0e75..510dacf 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -4352,11 +4352,7 @@ install(FILES
+--- a/packaging/cmake/Modules/NetdataInstallLayout.cmake
++++ b/packaging/cmake/Modules/NetdataInstallLayout.cmake
+@@ -88,11 +88,7 @@
  
- # RPM distros ship systemd units in %{_unitdir} (/usr/lib/systemd/system);
- # the DEB layout (and the historical default) uses /lib/systemd/system.
--if(NETDATA_PACKAGING_FORMAT STREQUAL "rpm")
--        set(NETDATA_SYSTEMD_UNIT_DEST "usr/lib/systemd/system")
+ # RPM distros ship systemd units in %{_unitdir} (/usr/lib/systemd/system); the
+ # DEB layout (and the historical default) uses /lib/systemd/system.
+-if(NETDATA_PACKAGE_KIND STREQUAL "rpm")
+-        set(HOST_SYSTEMD_UNIT_DEST "usr/lib/systemd/system")
 -else()
--        set(NETDATA_SYSTEMD_UNIT_DEST "lib/systemd/system")
+-        set(HOST_SYSTEMD_UNIT_DEST "lib/systemd/system")
 -endif()
-+set(NETDATA_SYSTEMD_UNIT_DEST "$ENV{systemd_system_unitdir}")
++set(HOST_SYSTEMD_UNIT_DEST "$ENV{systemd_system_unitdir}")
  
- # The spec packages the systemd-235-compatible unit variant on EL 7 and
- # Amazon Linux 2.
+ # Guards every rule that writes a HOST_* destination bar the one named below:
+ # this platform owns those directories, and this artifact is a native package
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0003-Do-not-record-the-configure-command-line-in-the-binar.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0003-Do-not-record-the-configure-command-line-in-the-binar.patch
index 4d0b81a0f3..0900163e7f 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0003-Do-not-record-the-configure-command-line-in-the-binar.patch
+++ b/meta-webserver/recipes-webadmin/netdata/netdata/0003-Do-not-record-the-configure-command-line-in-the-binar.patch
@@ -15,17 +15,17 @@ than leaking the build environment into the shipped binary.
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- CMakeLists.txt | 2 +-
+ packaging/cmake/Modules/NetdataSystemFiles.cmake | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3397,7 +3397,7 @@
+--- a/packaging/cmake/Modules/NetdataSystemFiles.cmake
++++ b/packaging/cmake/Modules/NetdataSystemFiles.cmake
+@@ -43,7 +43,7 @@
          "-DCMAKE_SHARED_LINKER_FLAGS='${CMAKE_SHARED_LINKER_FLAGS}'"
  )
-
+ 
 -string(JOIN " " CONFIGURE_COMMAND "cmake" ${CONFIGURE_OPTIONS})
 +set(CONFIGURE_COMMAND "unavailable (stripped for reproducible builds)")
-
- if (NOT NETDATA_USER)
-         set(NETDATA_USER "netdata")
+ 
+ set(BUILD_INFO_CMAKE_CACHE_ARCHIVE_NAME "build-info-cmake-cache.gz")
+ set(BUILD_INFO_CMAKE_CACHE_ARCHIVE_PATH "usr/share/netdata")
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch b/meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch
deleted file mode 100644
index 0199b2d3d6..0000000000
--- a/meta-webserver/recipes-webadmin/netdata/netdata/0005-build-allow-using-a-local-SQLite-source-tree.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 09e668b36a7e79a09c331857f994874d2714cfbc Mon Sep 17 00:00:00 2001
-From: vkalintiris <vasilis@netdata.cloud>
-Date: Thu, 8 Oct 2026 19:47:44 +0300
-Subject: [PATCH] cmake: allow SQLite offline builds
-
-The bundled SQLite build uses ExternalProject_Add() to download its
-source tarball at build time from a URL hardcoded to
-https://www.sqlite.org in the CMake file.
-
-This breaks the netdata recipe in meta-openembedded/meta-webserver,
-because Yocto and OpenEmbedded builds require all sources to be
-fetched before the build starts and do not allow network access
-during it.
-
-Add NETDATA_SQLITE_SOURCE_DIR, pointing to an already-unpacked
-SQLite source tree, which replaces the download step.
-
-This is the SQLite part of upstream commit 09e668b build:
-restructure the CMake build system (#23589). The full commit does
-not apply to 2.12.x, so the cache variable that upstream declares
-in the new NetdataOptions.cmake module is declared in
-NetdataSQLite.cmake here.
-
-Fixes:
-
---- LOG END ---
-error: downloading 'https://www.sqlite.org/2026/sqlite-src-3530400.zip' failed
-status_code: 6
-status_string: "Could not resolve hostname"
-log:
---- LOG BEGIN ---
-getaddrinfo(3) failed for www.sqlite.org:443
-
-Upstream-Status: Backport [https://github.com/netdata/netdata/commit/09e668b36a7e79a09c331857f994874d2714cfbc]
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- packaging/cmake/Modules/NetdataSQLite.cmake | 22 +++++++++++++++++-----
- 1 file changed, 17 insertions(+), 5 deletions(-)
-
-diff --git a/packaging/cmake/Modules/NetdataSQLite.cmake b/packaging/cmake/Modules/NetdataSQLite.cmake
---- a/packaging/cmake/Modules/NetdataSQLite.cmake
-+++ b/packaging/cmake/Modules/NetdataSQLite.cmake
-@@ -3,10 +3,10 @@
- #
- # Handle bundling of SQLite.
- #
--# This fetches the SQLite source tree (via tarball or git clone),
--# generates the amalgamation at build time (with --enable-update-limit
--# so the parser supports UPDATE/DELETE ... LIMIT), then compiles it as
--# a separate static library that links into libnetdata.
-+# This fetches the SQLite source tree (via tarball, git clone, or a local
-+# source directory), generates the amalgamation at build time (with
-+# --enable-update-limit so the parser supports UPDATE/DELETE ... LIMIT), then
-+# compiles it as a separate static library that links into libnetdata.
- 
- include(ExternalProject)
- 
-@@ -19,6 +19,12 @@ set(SQLITE_GIT_SHA "b09c88c14082339b66c7b7158d609a771e64ca69") # tag is: version
- 
- option(SQLITE_USE_GIT "Fetch SQLite sources via git clone instead of tarball" OFF)
- 
-+# STRING rather than PATH on purpose: CACHE PATH resolves a relative value
-+# against the invocation directory. Takes precedence over SQLITE_USE_GIT.
-+set(NETDATA_SQLITE_SOURCE_DIR "" CACHE STRING
-+    "Path to an unpacked SQLite source tree to use instead of downloading one")
-+mark_as_advanced(NETDATA_SQLITE_SOURCE_DIR SQLITE_USE_GIT)
-+
- function(netdata_bundle_sqlite3)
-         message(STATUS "Preparing SQLite ${SQLITE_VERSION}")
- 
-@@ -28,7 +34,13 @@ function(netdata_bundle_sqlite3)
- 
-         file(MAKE_DIRECTORY "${sqlite_OUTPUT_DIR}")
- 
--        if(SQLITE_USE_GIT)
-+        if(NETDATA_SQLITE_SOURCE_DIR)
-+                # Offline builds: an already-unpacked SQLite source tree replaces
-+                # the download step entirely (#23510).
-+                message(STATUS "Using local SQLite sources: ${NETDATA_SQLITE_SOURCE_DIR}")
-+                set(sqlite_SOURCE_DIR "${NETDATA_SQLITE_SOURCE_DIR}")
-+                set(SQLITE_FETCH_ARGS "")
-+        elseif(SQLITE_USE_GIT)
-                 message(STATUS "Fetching SQLite via git clone")
-                 set(SQLITE_FETCH_ARGS
-                         GIT_REPOSITORY https://github.com/sqlite/sqlite.git
diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_2.12.3.bb b/meta-webserver/recipes-webadmin/netdata/netdata_2.13.0.bb
similarity index 94%
rename from meta-webserver/recipes-webadmin/netdata/netdata_2.12.3.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_2.13.0.bb
index 5083673a68..3e5f4df6e9 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_2.12.3.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_2.13.0.bb
@@ -25,13 +25,12 @@ SRC_URI = "\
     file://0002-Do-not-hardcode-systemd-unit-directories.patch \
     file://0003-Do-not-record-the-configure-command-line-in-the-binar.patch \
     file://0004-libsensors-do-not-emit-line-directives-in-generated-s.patch \
-    file://0005-build-allow-using-a-local-SQLite-source-tree.patch \
     file://netdata.conf \
     file://netdata-volatiles.conf \
     ${@bb.utils.contains('PACKAGECONFIG', 'go', 'file://go.d.conf', '', d)} \
     https://www.sqlite.org/${SQLITE_YEAR}/sqlite-src-${SQLITE_VERSION_NUMBER}.zip;name=sqlite \
     "
-SRC_URI[sha256sum] = "6eb14deed1d7611c8f8969b2954432e91e631b2e45f762421873044561d80dd9"
+SRC_URI[sha256sum] = "510db7699c76c44f3d4bcebec854d5a29ecdc3cf3bfadfe78e27ee7ea87f8491"
 
 # netdata bundles its own SQLite and CMake's ExternalProject would
 # download it during do_compile. Fetch and unpack it with bitbake
@@ -90,7 +89,7 @@ PACKAGECONFIG[xenstat] = "-DENABLE_PLUGIN_XENSTAT=ON,-DENABLE_PLUGIN_XENSTAT=OFF
 PACKAGECONFIG[cups] = "-DENABLE_PLUGIN_CUPS=ON,-DENABLE_PLUGIN_CUPS=OFF,cups"
 PACKAGECONFIG[systemd] = "-DENABLE_PLUGIN_SYSTEMD_JOURNAL=ON,-DENABLE_PLUGIN_SYSTEMD_JOURNAL=OFF,systemd"
 PACKAGECONFIG[docker] = ",,virtual/docker, virtual/docker"
-PACKAGECONFIG[go] = "-DENABLE_PLUGIN_GO=ON, -DENABLE_PLUGIN_GO=OFF"
+PACKAGECONFIG[go] = "-DENABLE_PLUGIN_GO=ON -DENABLE_PLUGIN_IPMI=ON -DENABLE_PLUGIN_DEM=ON,-DENABLE_PLUGIN_GO=OFF -DENABLE_PLUGIN_IPMI=OFF -DENABLE_PLUGIN_DEM=OFF"
 # The local agent dashboard is not shipped in the release tarball; enabling it
 # makes CMake download https://app.netdata.cloud/agent.tar.gz at configure
 # time, which cannot work in an offline build. Off by default.
@@ -112,7 +111,7 @@ EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF \
                   -DENABLE_LIBBACKTRACE=OFF \
                   -DNETDATA_SQLITE_SOURCE_DIR=${UNPACKDIR}/sqlite-src-${SQLITE_VERSION_NUMBER} \
                   -DProtobuf_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
-                  -DBUILD_FOR_PACKAGING=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
+                  -DNETDATA_PACKAGE_KIND=${@bb.utils.contains('DISTRO_FEATURES','systemd','deb','bundle',d)} \
                   -DENABLE_PLUGIN_SYSTEMD_UNITS=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
                   -DENABLE_EXPORTER_PROMETHEUS_REMOTE_WRITE=OFF -DCMAKE_INSTALL_PREFIX='${base_prefix}'"
 
@@ -159,7 +158,7 @@ do_install:append() {
     install --group netdata --owner netdata --directory ${D}${localstatedir}/cache/netdata
     install --group netdata --owner netdata --directory ${D}${localstatedir}/lib/netdata
 
-    # BUILD_FOR_PACKAGING installs its own sysusers.d/tmpfiles.d snippets, but
+    # Native package builds install their own sysusers.d/tmpfiles.d snippets, but
     # user creation is handled by useradd.bbclass and tmpfiles by our own
     # netdata-volatiles.conf above, so drop the upstream ones to avoid
     # shipping duplicate/unmanaged files.
