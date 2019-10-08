Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id C30AB7F2B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2019 07:54:33 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id q7so9785663pgi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2019 00:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YkM6VdLPFfvpNzVOnvOKZQ5ouM8TIns6Wkr2rJpeJ1o=;
	b=FZnLE399ZYtAGQ01ZEt1rRwlMe7/fdd/vuHtv4KiAaMjOO+ZNqWM38hkHZ62HbRtnM
	VyuMD86CIw+ADrU+eToX/29xkoHd54x5e/11SGAXW4VciuYksBkXZZ4+XTVMu/qdJhMq
	FEC3TH36gHwMAeBw45ll6e1olF//abxbM5WHQvNylg6CJktY2GUEPqHKzRW1hE/mjHOo
	TCSr1gkehyA4l9elSbjhjc4YvqMIksIdgSO2zgBHrT9RvHIDozmO7TTTaWyXm64sCPBi
	v4Fcgbzz9zh66lFCfuhdmXblAznGp/joNROxdm6Or0bhSJ9VXRLs11wkbAs6am6Bvf8c
	CIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YkM6VdLPFfvpNzVOnvOKZQ5ouM8TIns6Wkr2rJpeJ1o=;
	b=Mve4mJu5b7g1JmRXIdEr6G48YMAwIdQ5Z5IO+b/X48Ln3slm8NceUv/Mn5SAf0bZ6/
	JAExgPis6ohN+U6AmFEMzs+Th81ei9FYSYDKZIp/wHxCj0NA3q0N9GGbfKGJZTL8WXlD
	+CG0mhSmfDkwuvNHYGdslHPIGhQ1W8ismDFe+rSzvf1gOf8u6AO0cTJHbVbleUpW1ILz
	WwVLOViUzQKWPqzocIYvlL5JIDMBSfUgKXdmVnPMKQXne8uwewmaq4PIIFWNwa+vBn77
	nLXJWbeeQPcKQAYi+J5bQqwvAc6KQ2i95ASw4LFOC7SaljCSqHZLpuzwIm+reQ7kIYTj
	w4Dw==
X-Gm-Message-State: APjAAAWlW+Qw9t1RY8WykaQDAs1ojjQuFjryvkE3ZpcrQJkyZFQQmPmY
	MkFtHCEStpkgYZSBdCOJ40+jPzC5d94=
X-Google-Smtp-Source: APXvYqyyoS1gjwq9dlnWa3iD3FEsozgq0AbA51AcMgga2sOf2rvay7kQx8B/BpQP/LRB92lwJqkSBQ==
X-Received: by 2002:a62:cf43:: with SMTP id b64mr37227223pfg.220.1570521274120;
	Tue, 08 Oct 2019 00:54:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	x18sm16924814pge.76.2019.10.08.00.54.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 00:54:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2019 00:54:16 -0700
Message-Id: <20191008075416.2560258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2] grpc: Update to 1.24.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Oct 2019 07:54:33 -0000
Content-Transfer-Encoding: 8bit

upb dependency needs to fed as source, since it lacks the CMake based
external module builds like some other deps

Forward port the cross lib installation patch

Drop gettid patch as it was a backport which is in this revision

Link with libatomic on mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Link libatomic on mips

 ...Fix-libraries-installation-for-Linux.patch |  44 +++----
 ...01-Define-gettid-only-for-glibc-2.30.patch | 115 ------------------
 .../grpc/{grpc_1.22.0.bb => grpc_1.24.1.bb}   |  15 ++-
 3 files changed, 32 insertions(+), 142 deletions(-)
 delete mode 100644 meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
 rename meta-networking/recipes-devtools/grpc/{grpc_1.22.0.bb => grpc_1.24.1.bb} (73%)

diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
index 3282b5413e..e517355d34 100644
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
+++ b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
@@ -29,7 +29,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  set(gRPC_INSTALL_BINDIR "bin" CACHE STRING "Installation directory for executables")
  set(gRPC_INSTALL_LIBDIR "lib" CACHE STRING "Installation directory for libraries")
  set(gRPC_INSTALL_INCLUDEDIR "include" CACHE STRING "Installation directory for headers")
-@@ -769,6 +778,10 @@ if(WIN32 AND MSVC)
+@@ -777,6 +786,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -51,7 +51,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  
  target_include_directories(gpr
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1333,6 +1350,10 @@ if(WIN32 AND MSVC)
+@@ -1367,6 +1384,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -62,7 +62,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  
  target_include_directories(grpc
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -1731,6 +1752,10 @@ if(WIN32 AND MSVC)
+@@ -1782,6 +1803,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -73,7 +73,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  
  target_include_directories(grpc_cronet
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -2744,6 +2769,10 @@ if(WIN32 AND MSVC)
+@@ -2869,6 +2894,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -84,7 +84,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  
  target_include_directories(grpc_unsecure
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3083,6 +3112,10 @@ if(WIN32 AND MSVC)
+@@ -3206,6 +3235,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -95,18 +95,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  
  target_include_directories(grpc++
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -3703,6 +3736,10 @@ if(WIN32 AND MSVC)
-   endif()
- endif()
- 
-+if(_gRPC_PLATFORM_LINUX)
-+  set_property(TARGET grpc++_cronet PROPERTY VERSION ${CPP_VERSION})
-+  set_property(TARGET grpc++_cronet PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
-+endif()
- 
- target_include_directories(grpc++_cronet
-   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -4013,6 +4050,11 @@ protobuf_generate_grpc_cpp(
+@@ -3589,6 +3622,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/status/status.proto
  )
  
@@ -118,7 +107,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  target_include_directories(grpc++_error_details
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -4147,6 +4189,11 @@ protobuf_generate_grpc_cpp(
+@@ -3727,6 +3765,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/reflection/v1alpha/reflection.proto
  )
  
@@ -130,7 +119,18 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  target_include_directories(grpc++_reflection
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -4704,6 +4751,10 @@ if(WIN32 AND MSVC)
+@@ -3816,6 +3859,10 @@ target_link_libraries(grpc++_test_config
+   ${_gRPC_GFLAGS_LIBRARIES}
+ )
+ 
++if(_gRPC_PLATFORM_LINUX)
++  set_property(TARGET grpc++_cronet PROPERTY VERSION ${CPP_VERSION})
++  set_property(TARGET grpc++_cronet PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
++endif()
+ 
+ endif (gRPC_BUILD_TESTS)
+ if (gRPC_BUILD_TESTS)
+@@ -4307,6 +4354,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -141,7 +141,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  
  target_include_directories(grpc++_unsecure
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -5124,6 +5175,10 @@ if(WIN32 AND MSVC)
+@@ -4745,6 +4796,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
@@ -152,7 +152,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  
  target_include_directories(grpc_plugin_support
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
-@@ -5190,6 +5245,11 @@ protobuf_generate_grpc_cpp(
+@@ -4813,6 +4868,11 @@ protobuf_generate_grpc_cpp(
    src/proto/grpc/channelz/channelz.proto
  )
  
@@ -164,7 +164,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
  target_include_directories(grpcpp_channelz
    PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -5728,6 +5788,10 @@ if(WIN32 AND MSVC)
+@@ -5367,6 +5427,10 @@ if(WIN32 AND MSVC)
    endif()
  endif()
  
diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
deleted file mode 100644
index 88b0af7f88..0000000000
--- a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-Upstream-Status: Backport
-
-From de6255941a5e1c2fb2d50e57f84e38c09f45023d Mon Sep 17 00:00:00 2001
-From: Juanli Shen <juanlishen@google.com>
-Date: Fri, 23 Aug 2019 08:46:09 -0700
-Subject: [PATCH] Fix gettid() naming conflict
-
----
- src/core/lib/gpr/log_linux.cc | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
-index 561276f0c20..81026e5689b 100644
---- a/src/core/lib/gpr/log_linux.cc
-+++ b/src/core/lib/gpr/log_linux.cc
-@@ -40,7 +40,9 @@
- #include <time.h>
- #include <unistd.h>
- 
--static long gettid(void) { return syscall(__NR_gettid); }
-+// Not naming it as gettid() to avoid duplicate declarations when complied with
-+// GCC 9.1.
-+static long local_gettid(void) { return syscall(__NR_gettid); }
- 
- void gpr_log(const char* file, int line, gpr_log_severity severity,
-              const char* format, ...) {
-@@ -70,7 +72,7 @@ void gpr_default_log(gpr_log_func_args* args) {
-   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
-   struct tm tm;
-   static __thread long tid = 0;
--  if (tid == 0) tid = gettid();
-+  if (tid == 0) tid = local_gettid();
- 
-   timer = static_cast<time_t>(now.tv_sec);
-   final_slash = strrchr(args->file, '/');
-From 57586a1ca7f17b1916aed3dea4ff8de872dbf853 Mon Sep 17 00:00:00 2001
-From: Benjamin Peterson <benjamin@dropbox.com>
-Date: Fri, 3 May 2019 08:11:00 -0700
-Subject: [PATCH] Rename gettid() functions.
-
-glibc 2.30 will declare its own gettid; see https://sourceware.org/git/?p=glibc.git;a=commit;h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92. Rename the grpc versions to avoid naming conflicts.
----
- src/core/lib/gpr/log_linux.cc          | 6 ++----
- src/core/lib/gpr/log_posix.cc          | 4 ++--
- src/core/lib/iomgr/ev_epollex_linux.cc | 4 ++--
- 3 files changed, 6 insertions(+), 8 deletions(-)
-
-diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
-index 81026e5689b..8b597b4cf2f 100644
---- a/src/core/lib/gpr/log_linux.cc
-+++ b/src/core/lib/gpr/log_linux.cc
-@@ -40,9 +40,7 @@
- #include <time.h>
- #include <unistd.h>
- 
--// Not naming it as gettid() to avoid duplicate declarations when complied with
--// GCC 9.1.
--static long local_gettid(void) { return syscall(__NR_gettid); }
-+static long sys_gettid(void) { return syscall(__NR_gettid); }
- 
- void gpr_log(const char* file, int line, gpr_log_severity severity,
-              const char* format, ...) {
-@@ -72,7 +70,7 @@ void gpr_default_log(gpr_log_func_args* args) {
-   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
-   struct tm tm;
-   static __thread long tid = 0;
--  if (tid == 0) tid = local_gettid();
-+  if (tid == 0) tid = sys_gettid();
- 
-   timer = static_cast<time_t>(now.tv_sec);
-   final_slash = strrchr(args->file, '/');
-diff --git a/src/core/lib/gpr/log_posix.cc b/src/core/lib/gpr/log_posix.cc
-index b6edc14ab6b..2f7c6ce3760 100644
---- a/src/core/lib/gpr/log_posix.cc
-+++ b/src/core/lib/gpr/log_posix.cc
-@@ -31,7 +31,7 @@
- #include <string.h>
- #include <time.h>
- 
--static intptr_t gettid(void) { return (intptr_t)pthread_self(); }
-+static intptr_t sys_gettid(void) { return (intptr_t)pthread_self(); }
- 
- void gpr_log(const char* file, int line, gpr_log_severity severity,
-              const char* format, ...) {
-@@ -86,7 +86,7 @@ void gpr_default_log(gpr_log_func_args* args) {
-   char* prefix;
-   gpr_asprintf(&prefix, "%s%s.%09d %7" PRIdPTR " %s:%d]",
-                gpr_log_severity_string(args->severity), time_buffer,
--               (int)(now.tv_nsec), gettid(), display_file, args->line);
-+               (int)(now.tv_nsec), sys_gettid(), display_file, args->line);
- 
-   fprintf(stderr, "%-70s %s\n", prefix, args->message);
-   gpr_free(prefix);
-diff --git a/src/core/lib/iomgr/ev_epollex_linux.cc b/src/core/lib/iomgr/ev_epollex_linux.cc
-index c2d80c08ddb..4a83cb6c215 100644
---- a/src/core/lib/iomgr/ev_epollex_linux.cc
-+++ b/src/core/lib/iomgr/ev_epollex_linux.cc
-@@ -1077,7 +1077,7 @@ static void end_worker(grpc_pollset* pollset, grpc_pollset_worker* worker,
- }
- 
- #ifndef NDEBUG
--static long gettid(void) { return syscall(__NR_gettid); }
-+static long sys_gettid(void) { return syscall(__NR_gettid); }
- #endif
- 
- /* pollset->mu lock must be held by the caller before calling this.
-@@ -1097,7 +1097,7 @@ static grpc_error* pollset_work(grpc_pollset* pollset,
- #define WORKER_PTR (&worker)
- #endif
- #ifndef NDEBUG
--  WORKER_PTR->originator = gettid();
-+  WORKER_PTR->originator = sys_gettid();
- #endif
-   if (GRPC_TRACE_FLAG_ENABLED(grpc_polling_trace)) {
-     gpr_log(GPR_INFO,
diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
similarity index 73%
rename from meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb
rename to meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
index a80c574cc9..5cfa3aa82e 100644
--- a/meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb
+++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
@@ -11,20 +11,21 @@ DEPENDS_append_class-target = " googletest grpc-native "
 DEPENDS_append_class-nativesdk = " grpc-native "
 
 S = "${WORKDIR}/git"
-SRCREV = "08fd59f039c7cf62614ab7741b3f34527af103c7"
-BRANCH = "v1.22.x"
-SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
+SRCREV_grpc = "fe494ff4104b6f6a78117ab2da71d29c93053267"
+SRCREV_upb = "9effcbcb27f0a665f9f345030188c0b291e32482"
+BRANCH = "v1.24.x"
+SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
+           git://github.com/protocolbuffers/upb;name=upb;destsuffix=git/third_party/upb \
            file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
            "
 SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch \
-                                file://0001-Define-gettid-only-for-glibc-2.30.patch \
                                "
 SRC_URI_append_class-nativesdk = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
 
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
 CXXFLAGS_append_class-native = " -Wl,--no-as-needed"
 
-inherit cmake
+inherit cmake pkgconfig
 
 EXTRA_OECMAKE = " \
     -DgRPC_CARES_PROVIDER=package \
@@ -37,6 +38,10 @@ EXTRA_OECMAKE = " \
     -DBUILD_SHARED_LIBS=ON \
     "
 
+do_configure_prepend_mipsarch() {
+    sed -i -e "s/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} rt m pthread)/set(_gRPC_ALLTARGETS_LIBRARIES \${CMAKE_DL_LIBS} atomic rt m pthread)/g" ${S}/CMakeLists.txt
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 SYSROOT_DIRS_BLACKLIST_append_class-target = "${libdir}/cmake/grpc"
-- 
2.23.0


