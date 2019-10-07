Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8A4867E648
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 18:12:47 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a2so9143168pfo.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2019 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=mipbCvtBB75NXj7lzvqe4/PLFpzz087pGWXA2yt8ciU=;
	b=Gj5G10otQpmut036PmXRJpcpf277iPBR2QfmleZA1QM1mFIojk1DPHavU4btUCHuiu
	Ub16+qpaJYTarjlkwLROlwi9Mz5eWrjabU57b6sY2rUOCGXS3+sehKpy3zpsoOGw0+Eg
	gJSVK00/TIB9SAhFrYiftr4nsYJgS1okrHmwODOV6gNZfRvI1uGS5UT/9xDqh/3bVz/5
	zEXpFlyaPT0a1AIRTQGK9bkJfyBxYjZ+uX63dVel+s0CQhrKa9gVpYCrEpwVTqjZxogs
	mYANCOW2h2xAzqwLWwiYByAIeOx3FSs+gHx+E7e4XSvzX53svc42zcjh9S3HlmX3LJK3
	PkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=mipbCvtBB75NXj7lzvqe4/PLFpzz087pGWXA2yt8ciU=;
	b=ZwIAL9TBa88wDpwpAYEZKbMpl+twqqET6d9/7KM7EcppIsC2s2Q1gG0a+x95L9v1fH
	jUXqERV2iqqbJ4GlIfOvMvjTESzCatYDI885aCyHjWoTN4wjFVTjJNlQw4ujbDX61Hv4
	B2LjvjxpUYCAZMn3xjc+b9+JbYXTq+6mcCYw5D4PX1AiMDf7FEYyT9BaY5dbXLGUtdw/
	TNCMabOVKUuv9cj0lMDFB0RhgW7bKNGstyYfiJKtnUV1GmQcpi+cJmUYU8yrUrOsLFYh
	+Ixxdg1te+TyKjjv0Njcenf2936LG0E9LZzhSn/k2j811UDKl0anVfDzv7gzLCWE1Qsb
	Jwsg==
X-Gm-Message-State: APjAAAV0ytwreRiDq6Mb1K2iGsrs4VHJA/0uozd6qVabjNRJI1hjTb0e
	c9ldM98kKTwpBqvrWIHNNqBq4IRYlvc=
X-Google-Smtp-Source: APXvYqxgMIvB5JZVBb4zYR16WluaHfDqViCj4U12BjF1EtaV695YULSXYzUvpZqLq3E3U22C2pEQZw==
X-Received: by 2002:a17:90a:37d1:: with SMTP id
	v75mr645171pjb.33.1570471967957; 
	Mon, 07 Oct 2019 11:12:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:65e8:7322:d189:1d85?
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	a21sm16244707pfi.0.2019.10.07.11.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Oct 2019 11:12:47 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20191007155509.1555601-1-raj.khem@gmail.com>
	<CAMKF1srKOw=Y-h7e2GHcqe9QkxP4xwBgv-cK5BDjRFdCLO9_yw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <3d06772f-a79f-67c3-372a-0b26d67a8575@gmail.com>
Date: Mon, 7 Oct 2019 11:12:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srKOw=Y-h7e2GHcqe9QkxP4xwBgv-cK5BDjRFdCLO9_yw@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] grpc: Update to 1.24.1
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
X-List-Received-Date: Mon, 07 Oct 2019 18:12:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/7/19 11:04 AM, Khem Raj wrote:
> On Mon, Oct 7, 2019 at 8:55 AM Khem Raj <raj.khem@gmail.com> wrote:

>> upb dependency needs to fed as source, since it lacks the CMake based
>> external module builds like some other deps
>>
>> Forward port the cross lib installation patch
>>
>> Drop gettid patch as it was a backport which is in this revision
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...Fix-libraries-installation-for-Linux.patch |  44 +++----
>>  ...01-Define-gettid-only-for-glibc-2.30.patch | 115 ------------------
>>  .../grpc/{grpc_1.22.0.bb => grpc_1.24.1.bb}   |  11 +-
>>  3 files changed, 28 insertions(+), 142 deletions(-)
>>  delete mode 100644 meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
>>  rename meta-networking/recipes-devtools/grpc/{grpc_1.22.0.bb => grpc_1.24.1.bb} (81%)
>>
>> diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>> index 3282b5413e..e517355d34 100644
>> --- a/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>> +++ b/meta-networking/recipes-devtools/grpc/grpc/0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch
>> @@ -29,7 +29,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>   set(gRPC_INSTALL_BINDIR "bin" CACHE STRING "Installation directory for executables")
>>   set(gRPC_INSTALL_LIBDIR "lib" CACHE STRING "Installation directory for libraries")
>>   set(gRPC_INSTALL_INCLUDEDIR "include" CACHE STRING "Installation directory for headers")
>> -@@ -769,6 +778,10 @@ if(WIN32 AND MSVC)
>> +@@ -777,6 +786,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -51,7 +51,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>
>>   target_include_directories(gpr
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -1333,6 +1350,10 @@ if(WIN32 AND MSVC)
>> +@@ -1367,6 +1384,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -62,7 +62,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>
>>   target_include_directories(grpc
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -1731,6 +1752,10 @@ if(WIN32 AND MSVC)
>> +@@ -1782,6 +1803,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -73,7 +73,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>
>>   target_include_directories(grpc_cronet
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -2744,6 +2769,10 @@ if(WIN32 AND MSVC)
>> +@@ -2869,6 +2894,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -84,7 +84,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>
>>   target_include_directories(grpc_unsecure
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -3083,6 +3112,10 @@ if(WIN32 AND MSVC)
>> +@@ -3206,6 +3235,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -95,18 +95,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>
>>   target_include_directories(grpc++
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -3703,6 +3736,10 @@ if(WIN32 AND MSVC)
>> -   endif()
>> - endif()
>> -
>> -+if(_gRPC_PLATFORM_LINUX)
>> -+  set_property(TARGET grpc++_cronet PROPERTY VERSION ${CPP_VERSION})
>> -+  set_property(TARGET grpc++_cronet PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
>> -+endif()
>> -
>> - target_include_directories(grpc++_cronet
>> -   PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -4013,6 +4050,11 @@ protobuf_generate_grpc_cpp(
>> +@@ -3589,6 +3622,11 @@ protobuf_generate_grpc_cpp(
>>     src/proto/grpc/status/status.proto
>>   )
>>
>> @@ -118,7 +107,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>   target_include_directories(grpc++_error_details
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>>     PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
>> -@@ -4147,6 +4189,11 @@ protobuf_generate_grpc_cpp(
>> +@@ -3727,6 +3765,11 @@ protobuf_generate_grpc_cpp(
>>     src/proto/grpc/reflection/v1alpha/reflection.proto
>>   )
>>
>> @@ -130,7 +119,18 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>   target_include_directories(grpc++_reflection
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>>     PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
>> -@@ -4704,6 +4751,10 @@ if(WIN32 AND MSVC)
>> +@@ -3816,6 +3859,10 @@ target_link_libraries(grpc++_test_config
>> +   ${_gRPC_GFLAGS_LIBRARIES}
>> + )
>> +
>> ++if(_gRPC_PLATFORM_LINUX)
>> ++  set_property(TARGET grpc++_cronet PROPERTY VERSION ${CPP_VERSION})
>> ++  set_property(TARGET grpc++_cronet PROPERTY SOVERSION ${CPP_VERSION_MAJOR})
>> ++endif()
>> +
>> + endif (gRPC_BUILD_TESTS)
>> + if (gRPC_BUILD_TESTS)
>> +@@ -4307,6 +4354,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -141,7 +141,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>
>>   target_include_directories(grpc++_unsecure
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -5124,6 +5175,10 @@ if(WIN32 AND MSVC)
>> +@@ -4745,6 +4796,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> @@ -152,7 +152,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>
>>   target_include_directories(grpc_plugin_support
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>> -@@ -5190,6 +5245,11 @@ protobuf_generate_grpc_cpp(
>> +@@ -4813,6 +4868,11 @@ protobuf_generate_grpc_cpp(
>>     src/proto/grpc/channelz/channelz.proto
>>   )
>>
>> @@ -164,7 +164,7 @@ Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>>   target_include_directories(grpcpp_channelz
>>     PUBLIC $<INSTALL_INTERFACE:${gRPC_INSTALL_INCLUDEDIR}> $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
>>     PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
>> -@@ -5728,6 +5788,10 @@ if(WIN32 AND MSVC)
>> +@@ -5367,6 +5427,10 @@ if(WIN32 AND MSVC)
>>     endif()
>>   endif()
>>
>> diff --git a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch b/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
>> deleted file mode 100644
>> index 88b0af7f88..0000000000
>> --- a/meta-networking/recipes-devtools/grpc/grpc/0001-Define-gettid-only-for-glibc-2.30.patch
>> +++ /dev/null
>> @@ -1,115 +0,0 @@
>> -Upstream-Status: Backport
>> -
>> -From de6255941a5e1c2fb2d50e57f84e38c09f45023d Mon Sep 17 00:00:00 2001
>> -From: Juanli Shen <juanlishen@google.com>
>> -Date: Fri, 23 Aug 2019 08:46:09 -0700
>> -Subject: [PATCH] Fix gettid() naming conflict
>> -
>> ----
>> - src/core/lib/gpr/log_linux.cc | 6 ++++--
>> - 1 file changed, 4 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
>> -index 561276f0c20..81026e5689b 100644
>> ---- a/src/core/lib/gpr/log_linux.cc
>> -+++ b/src/core/lib/gpr/log_linux.cc
>> -@@ -40,7 +40,9 @@
>> - #include <time.h>
>> - #include <unistd.h>
>> -
>> --static long gettid(void) { return syscall(__NR_gettid); }
>> -+// Not naming it as gettid() to avoid duplicate declarations when complied with
>> -+// GCC 9.1.
>> -+static long local_gettid(void) { return syscall(__NR_gettid); }
>> -
>> - void gpr_log(const char* file, int line, gpr_log_severity severity,
>> -              const char* format, ...) {
>> -@@ -70,7 +72,7 @@ void gpr_default_log(gpr_log_func_args* args) {
>> -   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
>> -   struct tm tm;
>> -   static __thread long tid = 0;
>> --  if (tid == 0) tid = gettid();
>> -+  if (tid == 0) tid = local_gettid();
>> -
>> -   timer = static_cast<time_t>(now.tv_sec);
>> -   final_slash = strrchr(args->file, '/');
>> -From 57586a1ca7f17b1916aed3dea4ff8de872dbf853 Mon Sep 17 00:00:00 2001
>> -From: Benjamin Peterson <benjamin@dropbox.com>
>> -Date: Fri, 3 May 2019 08:11:00 -0700
>> -Subject: [PATCH] Rename gettid() functions.
>> -
>> -glibc 2.30 will declare its own gettid; see https://sourceware.org/git/?p=glibc.git;a=commit;h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92. Rename the grpc versions to avoid naming conflicts.
>> ----
>> - src/core/lib/gpr/log_linux.cc          | 6 ++----
>> - src/core/lib/gpr/log_posix.cc          | 4 ++--
>> - src/core/lib/iomgr/ev_epollex_linux.cc | 4 ++--
>> - 3 files changed, 6 insertions(+), 8 deletions(-)
>> -
>> -diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
>> -index 81026e5689b..8b597b4cf2f 100644
>> ---- a/src/core/lib/gpr/log_linux.cc
>> -+++ b/src/core/lib/gpr/log_linux.cc
>> -@@ -40,9 +40,7 @@
>> - #include <time.h>
>> - #include <unistd.h>
>> -
>> --// Not naming it as gettid() to avoid duplicate declarations when complied with
>> --// GCC 9.1.
>> --static long local_gettid(void) { return syscall(__NR_gettid); }
>> -+static long sys_gettid(void) { return syscall(__NR_gettid); }
>> -
>> - void gpr_log(const char* file, int line, gpr_log_severity severity,
>> -              const char* format, ...) {
>> -@@ -72,7 +70,7 @@ void gpr_default_log(gpr_log_func_args* args) {
>> -   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
>> -   struct tm tm;
>> -   static __thread long tid = 0;
>> --  if (tid == 0) tid = local_gettid();
>> -+  if (tid == 0) tid = sys_gettid();
>> -
>> -   timer = static_cast<time_t>(now.tv_sec);
>> -   final_slash = strrchr(args->file, '/');
>> -diff --git a/src/core/lib/gpr/log_posix.cc b/src/core/lib/gpr/log_posix.cc
>> -index b6edc14ab6b..2f7c6ce3760 100644
>> ---- a/src/core/lib/gpr/log_posix.cc
>> -+++ b/src/core/lib/gpr/log_posix.cc
>> -@@ -31,7 +31,7 @@
>> - #include <string.h>
>> - #include <time.h>
>> -
>> --static intptr_t gettid(void) { return (intptr_t)pthread_self(); }
>> -+static intptr_t sys_gettid(void) { return (intptr_t)pthread_self(); }
>> -
>> - void gpr_log(const char* file, int line, gpr_log_severity severity,
>> -              const char* format, ...) {
>> -@@ -86,7 +86,7 @@ void gpr_default_log(gpr_log_func_args* args) {
>> -   char* prefix;
>> -   gpr_asprintf(&prefix, "%s%s.%09d %7" PRIdPTR " %s:%d]",
>> -                gpr_log_severity_string(args->severity), time_buffer,
>> --               (int)(now.tv_nsec), gettid(), display_file, args->line);
>> -+               (int)(now.tv_nsec), sys_gettid(), display_file, args->line);
>> -
>> -   fprintf(stderr, "%-70s %s\n", prefix, args->message);
>> -   gpr_free(prefix);
>> -diff --git a/src/core/lib/iomgr/ev_epollex_linux.cc b/src/core/lib/iomgr/ev_epollex_linux.cc
>> -index c2d80c08ddb..4a83cb6c215 100644
>> ---- a/src/core/lib/iomgr/ev_epollex_linux.cc
>> -+++ b/src/core/lib/iomgr/ev_epollex_linux.cc
>> -@@ -1077,7 +1077,7 @@ static void end_worker(grpc_pollset* pollset, grpc_pollset_worker* worker,
>> - }
>> -
>> - #ifndef NDEBUG
>> --static long gettid(void) { return syscall(__NR_gettid); }
>> -+static long sys_gettid(void) { return syscall(__NR_gettid); }
>> - #endif
>> -
>> - /* pollset->mu lock must be held by the caller before calling this.
>> -@@ -1097,7 +1097,7 @@ static grpc_error* pollset_work(grpc_pollset* pollset,
>> - #define WORKER_PTR (&worker)
>> - #endif
>> - #ifndef NDEBUG
>> --  WORKER_PTR->originator = gettid();
>> -+  WORKER_PTR->originator = sys_gettid();
>> - #endif
>> -   if (GRPC_TRACE_FLAG_ENABLED(grpc_polling_trace)) {
>> -     gpr_log(GPR_INFO,
>> diff --git a/meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
>> similarity index 81%
>> rename from meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb
>> rename to meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
>> index a80c574cc9..4ae9e107d3 100644
>> --- a/meta-networking/recipes-devtools/grpc/grpc_1.22.0.bb
>> +++ b/meta-networking/recipes-devtools/grpc/grpc_1.24.1.bb
>> @@ -6,18 +6,19 @@ SECTION = "libs"
>>  LICENSE = "Apache-2"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>>
>> -DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl"
>> +DEPENDS = "gflags c-ares protobuf protobuf-native protobuf-c protobuf-c-native openssl upb"
> since we are now including upb as internally we don't need it on
> depends, I have staged a fix without me.


Are you talking to yourself??
>
>>  DEPENDS_append_class-target = " googletest grpc-native "
>>  DEPENDS_append_class-nativesdk = " grpc-native "
>>
>>  S = "${WORKDIR}/git"
>> -SRCREV = "08fd59f039c7cf62614ab7741b3f34527af103c7"
>> -BRANCH = "v1.22.x"
>> -SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;branch=${BRANCH} \
>> +SRCREV_grpc = "fe494ff4104b6f6a78117ab2da71d29c93053267"
>> +SRCREV_upb = "9effcbcb27f0a665f9f345030188c0b291e32482"
>> +BRANCH = "v1.24.x"
>> +SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>> +           git://github.com/protocolbuffers/upb;name=upb;destsuffix=git/third_party/upb \
>>             file://0001-CMakeLists.txt-Fix-libraries-installation-for-Linux.patch \
>>             "
>>  SRC_URI_append_class-target = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch \
>> -                                file://0001-Define-gettid-only-for-glibc-2.30.patch \
>>                                 "
>>  SRC_URI_append_class-nativesdk = " file://0001-CMakeLists.txt-Fix-grpc_cpp_plugin-path-during-cross.patch"
>>
>> --
>> 2.23.0
>>


