Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10233.1795752932502176592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=skO2d8YX;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38644aedba1so11340190eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752932; x=1796357732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyZtp8RuG0Zvax8oIttYZyxpYazm3p/Cboa07xdTeio=;
        b=skO2d8YXQlTC6YK/32RIs+R8ozuspwz5pBM4JRYY9ELxwxyWL5LEb/ahGeccp+Cfu3
         MHTesMJ2kFVN9I/lD/Imcks8ZpiuWoXkRhQ16PykzUG2t8bH3UQS9xBid0FyU7ekR2OI
         QYYYxRC2qxtxP6H7nn4ILp/Nh0OMEdriiZjgsLQWIlBlrnukRC/II2pwJQCuqZwTTsyz
         zFCEBX1HQvv9cmBtvA3JzndslHCq2CFoD4OiioqAn2cKg6kgbuHwd52YDwpQ2gZko/2l
         f+gaGgtClFr8JnpwF01hD2jl30t97cCOSzr0Eg5raRir6ykU9qH/5Y3X3WWcLAGX4Prl
         aGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752932; x=1796357732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyZtp8RuG0Zvax8oIttYZyxpYazm3p/Cboa07xdTeio=;
        b=tsKmNnsrcWWuHsr0mRa1A7PhtIjFohb2qMT2DKzIfDPo2340Fch8gAvbl5bqJ+CsNh
         xjPBPxvyK91fuXqvZjLxCSLzhlD8XttbwV1vMNf7eQFbSr82egPOtsxi1A3omaQOCkGK
         JwE4MMd9tBDo71DMeOn77Ue34POGFHY2JONjP6+BC3UMaNIo9lq4UHFqZqbynAqS2X5M
         N4wwRUdpVA2j/Kc3aq3M5AKHEs+S5Pwzb2eNtuQFR297o4Om4tu5bLtlMD83cekvagbc
         yQXzk1YoBQosScKufPtgI6vnHy/TTEjsi3SgeOgX0geKCaKYiGoqWW4HZbS3wH/TpcZN
         CV/Q==
X-Gm-Message-State: APuU4Z/L15jp2t1RhhDk7YY6LhzIcskDYRLG8xYAuq+VabD23K2mOo1m
	9hmXIy2gkhdcAkoU/NsRQctZVEB1Nov2o82r90sn8EiWYQNe27+HkSCJ7noTzXuu
X-Gm-Gg: AZFdTZccDBVhEnJNsmzjZyZDqql6YYvYSv6V0Y0Mrs1mi+uch2kvuwWYNC0fvOHQ/HZ
	oUwpnHzYj3JAK3ZwuNayRS9VG0YtgTcii0EzCJJ9fZMEwiR54pRUE06KnBF+Ve0rwx8qFj63lWe
	y1euK0icyj5n+TgquOLRe9ZpO8XY1gLbVwLZeHYYDQ9XgRlDLtHvNzW3uvztM87uE6o3r59oWak
	zThfMgTTJCjfSjJ2QqGs0norAh89+Rhs5WzuTBh6M6OVSslvDNxbxxPGyyHkVcMTTIQEE6BYgwF
	28tmroEcnrZ446Kk5fgVUBtnSsdW1aKFe+Me8/EzYZHviKQO4z5CGDgnUkNqqOMywWDZ1L5Aute
	cJpmglUkDRM468zeunGwr5Zg3AmuEde57cbMSaYB2WOQAvJx6SvnodfyNVxzsy5EOVBKZXQqcms
	g9YCazrEQB5s2q1My5GMdKU8CJp7PelCCy3jBz4oYZ/8qvVhtVTQGGBAbptAPkEak+mkUKp8T/b
	AExezUH8aSrI6ncT6Gb6LWosSW3j+Vge09Xh0YZVVZEQmtvMiKyPl/gHVRPiwiJmQAm3eGLH5Z3
	cNbARhLQS1mReuQT4nRUKKPc0aoCD0wrZecqfiPyFovLGQGlts5rUuRUhzYCkAyMooVsyiBWbo1
	f6IFZg7PZnz8EBtIEqpevk6Oyy6uCbI0/ymqIy381q09hL2WPkkfpgmXr8hOyNSJNbHOvegGlWF
	B8CnS4LiJG6K3VLcQs+Lo27MF4DtNO/LVwsMy/TJ5ESWpFe8SoTC66Ps7GgdZ0NOMQbBhE9LpCr
	pWQzyLIQhqwoFm9cCD+i2QsTvVOFIIUuA40aW+DCEYelnRCif9VC4yz7DLgIVQ82NuB6a4lqxLP
	ZkCR
X-Received: by 2002:a05:7301:d816:10b0:386:aa60:d560 with SMTP id 5a478bee46e88-386aa60de28mr15781029eec.8.1795752931784;
        Thu, 26 Nov 2026 20:15:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm60340062eec.8.2026.11.26.20.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 8/8] sysdig: upgrade 0.39.0 -> 0.41.4
Date: Thu, 26 Nov 2026 20:15:17 -0800
Message-ID: <20261127041517.1773986-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
References: <20261127041517.1773986-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133218
Content-Type: text/plain; charset="utf-8"

0.40 and 0.41 move to falcosecurity/libs 0.21 (driver 8.1.0+driver),
which no longer needs the gRPC, curl and OpenSSL based Kubernetes/Mesos
client dependencies. sysdig now fetches the falco container plugin at
configure time to provide container metadata.

Bump falcosecurity-libs to 0.21.0 and the driver to 8.1.0+driver
together, as sysdig pins them as a pair. Fetch all three by tag. The
driver sources are now taken from the driver/ subdirectory of the libs
checkout, which makes the driver_config.h generation workaround and the
include path hack unnecessary. Use the bundled libs build explicitly
(it defaulted on with USE_BUNDLED_DEPS) and drop MINIMAL_BUILD, which
no longer exists.

Drop libb64, c-ares, grpc, curl, openssl, protobuf and jq from DEPENDS
as nothing uses them any more, and add re2. Drop the PROBE_NAME patch
since the definition is not referenced by the sources any more. Add a
patch that makes the prebuilt container plugin download optional and
disable it, as it cannot be fetched in an offline build, so sysdig shows no
container metadata.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-container-plugin-download-optional.patch | 33 +++++++++++++++
 ...001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch | 32 ---------------
 .../{sysdig_0.39.0.bb => sysdig_0.41.4.bb}    | 41 +++++++------------
 3 files changed, 47 insertions(+), 59 deletions(-)
 create mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Make-the-container-plugin-download-optional.patch
 delete mode 100644 meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
 rename meta-oe/recipes-extended/sysdig/{sysdig_0.39.0.bb => sysdig_0.41.4.bb} (72%)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Make-the-container-plugin-download-optional.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Make-the-container-plugin-download-optional.patch
new file mode 100644
index 0000000000..19756909e1
--- /dev/null
+++ b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Make-the-container-plugin-download-optional.patch
@@ -0,0 +1,33 @@
+From 6bfcd5ea1c21bc521cc51070ab0cbff7938373d9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 25 Nov 2026 22:27:25 -0800
+Subject: [PATCH] cmake: Make the container plugin download optional
+
+The container plugin is a prebuilt binary which container_plugin.cmake
+fetches from download.falco.org at configure time. That is not possible
+in an offline build and the binary is not built for the target. Add an
+option to skip it; sysdig only loads the plugin if it is installed.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 68344a3..ea6de77 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -163,7 +163,10 @@ endif()
+ include(falcosecurity-libs)
+ include(yaml-cpp)
+ include(nlohmann-json)
+-include(container_plugin)
++option(ENABLE_CONTAINER_PLUGIN "Download and install the prebuilt container plugin" ON)
++if(ENABLE_CONTAINER_PLUGIN)
++	include(container_plugin)
++endif()
+ 
+ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
+ 	if(NOT DEFINED DRIVER_VERSION)
diff --git a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch b/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
deleted file mode 100644
index bcf5da4f2c..0000000000
--- a/meta-oe/recipes-extended/sysdig/sysdig/0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6ff4114dcbb87f34751064249967aa96c7b8b030 Mon Sep 17 00:00:00 2001
-From: Liu Yiding <liuyd.fnst@fujitsu.com>
-Date: Wed, 4 Mar 2026 10:02:10 +0000
-Subject: [PATCH] cmake: Pass PROBE_NAME via CFLAGS
-
-This helps compliation of driver code where its calling modprobe on the
-given kernel module via system() API
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Update for 0.39.0
-Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
----
- CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8e8850dbe..c6d725c05 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -174,6 +174,7 @@ if(CMAKE_SYSTEM_NAME MATCHES "Linux")
- 	if(NOT DEFINED DRIVER_NAME)
- 		set(DRIVER_NAME "scap")
- 	endif()
-+       add_definitions(-DPROBE_NAME="${PROBE_NAME}")
- 
- 	set(DRIVERS_REPO "https://download.sysdig.com/scap-drivers")
- 	
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.41.4.bb
similarity index 72%
rename from meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
rename to meta-oe/recipes-extended/sysdig/sysdig_0.41.4.bb
index 7741bdf86a..0c19ee9f93 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.39.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.41.4.bb
@@ -18,44 +18,35 @@ JIT:powerpc = ""
 JIT:powerpc64le = ""
 JIT:powerpc64 = ""
 
-DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp \
-            tbb jq openssl elfutils protobuf protobuf-native jq-native valijson \
+DEPENDS += "lua${JIT} zlib ncurses jsoncpp tbb elfutils re2 valijson \
             uthash libbpf clang-native bpftool-native yaml-cpp nlohmann-json"
 RDEPENDS:${PN} = "bash"
 
-SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sysdig \
-           git://github.com/falcosecurity/libs;protocol=https;branch=release/0.18.x;name=falco;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs \
-           git://github.com/falcosecurity/libs;protocol=https;branch=release/0.18.x;name=driver;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/driver \
-           file://0001-cmake-Pass-PROBE_NAME-via-CFLAGS.patch \
+SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;tag=${PV};name=sysdig \
+           git://github.com/falcosecurity/libs;protocol=https;branch=release/0.21.x;tag=0.21.0;name=falco;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/falcosecurity-libs \
+           git://github.com/falcosecurity/libs;protocol=https;branch=release/0.21.x;tag=8.1.0+driver;name=driver;subdir=${BB_GIT_DEFAULT_DESTSUFFIX}/driver \
+           file://0001-cmake-Make-the-container-plugin-download-optional.patch \
            file://0001-Avoid-duplicate-operations-of-add_library.patch;patchdir=./falcosecurity-libs \
           "
-SRCREV_sysdig = "6ef29110cf1add746e10ab5b38957e22730b7349"
-SRCREV_falco = "e1999d079880d10800c57e004fca794a03cd060a"
-SRCREV_driver = "d4efc80ece48174a71c1a420cb52d233fa94f946"
+SRCREV_sysdig = "7f09646f010f257f3854bc7a6cfbf432c85897d3"
+SRCREV_falco = "1dcb369c20625db51f6cdca3e62435f61449eacb"
+SRCREV_driver = "bd2b9aa2d7ddd9f65158fd8c95ea4bbc10eae9a0"
 
 SRCREV_FORMAT = "sysdig_falco"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
-#Add this function to generate driver_config.h
-do_configure:prepend() {
-    mkdir -p ${WORKDIR}/driver_Make
-    cd ${WORKDIR}/driver_Make
-    cmake ${S}/driver -DMINIMAL_BUILD=ON -DCREATE_TEST_TARGETS=OFF
-    cd -
-}
-do_configure[cleandirs] = "${WORKDIR}/driver_Make"
-
 EXTRA_OECMAKE = "\
                 -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
                 -DBUILD_DRIVER=OFF \
-                -DMINIMAL_BUILD=ON \
+                -DUSE_BUNDLED_FALCOSECURITY_LIBS=ON \
+                -DENABLE_CONTAINER_PLUGIN=OFF \
                 -DUSE_BUNDLED_DEPS=OFF \
                 -DCREATE_TEST_TARGETS=OFF \
                 -DDIR_ETC=${sysconfdir} \
                 -DLUA_INCLUDE_DIR=${STAGING_INCDIR}/luajit-2.1 \
                 -DFALCOSECURITY_LIBS_SOURCE_DIR=${S}/falcosecurity-libs \
-                -DDRIVER_SOURCE_DIR=${S}/driver \
+                -DDRIVER_SOURCE_DIR=${S}/driver/driver \
                 -DVALIJSON_INCLUDE=${STAGING_INCDIR}/valijson \
                 -DUSE_BUNDLED_RE2=OFF \
                 -DUSE_BUNDLED_TBB=OFF \
@@ -80,18 +71,14 @@ EXTRA_OECMAKE = "\
 # include_directories(${CURSES_INCLUDE_DIR}), placing it ahead of the LuaJIT
 # include dir. Pin Curses to the target sysroot so the native dir (and its stray
 # lua.h) never reaches the target build; lua.h then resolves via LUAJIT_INCLUDE.
-#Add include dir to find driver_config.h
-CXXFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1 -I${WORKDIR}/driver_Make/driver/src"
-CFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1 -I${WORKDIR}/driver_Make/driver/src"
+CXXFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1"
+CFLAGS:append = " -I${STAGING_INCDIR}/luajit-2.1"
 
 #To fix do_package QA Issue
 do_compile:append() {
     sed -i -e "s,${WORKDIR},,g" ${B}/libsinsp/libsinsp.pc
-    sed -i -e "s,${WORKDIR},,g" ${B}/driver/libscap/libscap.pc
-    mkdir -p ${B}/driver/libsinsp
-    cp ${B}/libsinsp/libsinsp.pc ${B}/driver/libsinsp/
+    sed -i -e "s,${WORKDIR},,g" ${B}/libscap/libscap.pc
 }
-do_compile[cleandirs] = "${B}/driver/libsinsp"
 
 #CMAKE_VERBOSE = "VERBOSE=1"
 
