Return-Path: <lravindran@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE05C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 16:02:28 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.1337.1652284946652983310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 09:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=VZTn1wpb;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: lravindran@linux.microsoft.com)
Received: from localhost.localdomain (unknown [50.35.66.8])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8AB5220ECA01
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 09:02:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8AB5220ECA01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1652284945;
	bh=l1oe1qHr+SFpt6e2kr9UP/jhcrFIu6UosJTs3c6avHo=;
	h=From:To:Subject:Date:From;
	b=VZTn1wpbl7cjxm5dplo0Z1R82iDUXjiRf1wdOEWyRq5Z42SdNvgBU0lXOXU1xGxZg
	 HtEoYEzyfEG/d0GrHkAmO77tluMwACIj0CmApHl8LOo/tHixaQUhb8AvcYbXW++YQ6
	 if1HTRybRlaV/Ktg1mz8VryN43UE0ZICHhGBY9OU=
From: Lekshmi Ravindran <lravindran@linux.microsoft.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] Upgrade fluentbit recipe from version 1.3.5 to 1.9.3
Date: Wed, 11 May 2022 09:01:54 -0700
Message-Id: <20220511160154.1351-1-lravindran@linux.microsoft.com>
X-Mailer: git-send-email 2.34.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 16:02:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97042

From: Lekshmi Ravindran <lravindran@microsoft.com>

The current fluentbit version with oe is much old and outdated.
Upgrading to latest version to leverage better stability,
performance and newer feature set from the fluentbit project.
Source - https://github.com/fluent/fluent-bit/blob/v1.9.3/fluent-bit_1.9.=
3.bb

Signed-off-by: Lekshmi Ravindran <lravindran@linux.microsoft.com>
---
 ...nit-install-location-with-SYSTEM_DIR.patch | 28 -------
 ...caused-by-using-flb_free-instead-of-.patch | 43 ----------
 ...-ppc-Fix-signature-for-co_create-API.patch | 38 ---------
 ...GV-caused-by-using-flb_free-instead-.patch | 82 -------------------
 .../fluentbit/fluentbit/builtin-nan.patch     | 27 ------
 .../cross-build-init-system-detection.patch   | 38 ---------
 .../fluentbit/fluentbit/jemalloc.patch        | 16 ----
 .../fluentbit/fluentbit_1.3.5.bb              | 69 ----------------
 .../fluentbit/fluentbit_1.9.3.bb              | 56 +++++++++++++
 9 files changed, 56 insertions(+), 341 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Con=
trol-sytemd-unit-install-location-with-SYSTEM_DIR.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin=
-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc=
-Fix-signature-for-co_create-API.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-par=
ser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/builtin-=
nan.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/cross-bu=
ild-init-system-detection.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc=
.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_1.9.3.bb

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sy=
temd-unit-install-location-with-SYSTEM_DIR.patch b/meta-oe/recipes-extend=
ed/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYS=
TEM_DIR.patch
deleted file mode 100644
index bf4cda08f..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-un=
it-install-location-with-SYSTEM_DIR.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5571f949fa2048b79c197b5b10a11ecb1891cbe9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Apr 2022 08:24:34 -0700
-Subject: [PATCH] Control sytemd unit install location with SYSTEM_DIR
-
-This helps building when usrmerge is on
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -323,7 +323,11 @@ if(FLB_BINARY)
-       "${PROJECT_SOURCE_DIR}/init/systemd.in"
-       ${FLB_SYSTEMD_SCRIPT}
-       )
--    install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system=
)
-+    if(SYSTEMD_DIR)
-+        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION ${SYSTEMD_DIR})
-+    else()
-+        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/sy=
stem)
-+    endif()
-     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
-   elseif(FLB_UPSTART)
-     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.=
conf")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SI=
GSEGV-caused-by-using-flb_free-instead-of-.patch b/meta-oe/recipes-extend=
ed/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-inst=
ead-of-.patch
deleted file mode 100644
index a6ff5991c..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-c=
aused-by-using-flb_free-instead-of-.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3d7390c89c2205d1eed0384be0bb65adb675e60d Mon Sep 17 00:00:00 2001
-From: Ramon Fried <ramon@neureality.ai>
-Date: Tue, 9 Feb 2021 18:59:59 +0200
-Subject: [PATCH] bin: fix SIGSEGV caused by using flb_free instead of
- mk_mem_free
-
-Upstream-Status: Accepted
-Signed-off-by: Ramon Fried <ramon@neureality.ai>
----
- src/fluent-bit.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/fluent-bit.c b/src/fluent-bit.c
-index c0c73b4..989cfde 100644
---- a/src/fluent-bit.c
-+++ b/src/fluent-bit.c
-@@ -289,7 +289,7 @@ static int input_set_property(struct flb_input_insta=
nce *in, char *kv)
-                 in->p->name, key);
-     }
-=20
--    flb_free(key);
-+    mk_mem_free(key);
-     return ret;
- }
-=20
-@@ -314,7 +314,7 @@ static int output_set_property(struct flb_output_ins=
tance *out, char *kv)
-     }
-=20
-     ret =3D flb_output_set_property(out, key, value);
--    flb_free(key);
-+    mk_mem_free(key);
-     return ret;
- }
-=20
-@@ -340,7 +340,7 @@ static int filter_set_property(struct flb_filter_ins=
tance *filter, char *kv)
-     }
-=20
-     ret =3D flb_filter_set_property(filter, key, value);
--    flb_free(key);
-+    mk_mem_free(key);
-     return ret;
- }
-=20
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-si=
gnature-for-co_create-API.patch b/meta-oe/recipes-extended/fluentbit/flue=
ntbit/0001-ppc-Fix-signature-for-co_create-API.patch
deleted file mode 100644
index 1f36c657e..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature=
-for-co_create-API.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From be4032079c931704f52e29f5da5c01cde24ac842 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 16 Jan 2020 10:44:58 -0800
-Subject: [PATCH] ppc: Fix signature for co_create API
-
-Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/18=
86]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/flb_libco/ppc.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/lib/flb_libco/ppc.c b/lib/flb_libco/ppc.c
-index e6536d56..533256b3 100644
---- a/lib/flb_libco/ppc.c
-+++ b/lib/flb_libco/ppc.c
-@@ -279,7 +279,9 @@ static uint32_t* co_create_(unsigned size, uintptr_t=
 entry) {
-   return t;
- }
-=20
--cothread_t co_create(unsigned int size, void (*entry_)(void)) {
-+cothread_t co_create(unsigned int size, void (*entry_)(void),
-+                     size_t *out_size) {
-+
-   uintptr_t entry =3D (uintptr_t)entry_;
-   uint32_t* t =3D 0;
-=20
-@@ -325,7 +327,7 @@ cothread_t co_create(unsigned int size, void (*entry=
_)(void)) {
-     t[10] =3D (uint32_t)(sp >> shift >> shift);
-     t[11] =3D (uint32_t)sp;
-   }
--
-+  *out_size =3D size;
-   return t;
- }
-=20
---=20
-2.25.0
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix=
-SIGSEGV-caused-by-using-flb_free-instead-.patch b/meta-oe/recipes-extend=
ed/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-i=
nstead-.patch
deleted file mode 100644
index 91675dfc6..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEG=
V-caused-by-using-flb_free-instead-.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 7c3b1dfb174312594d3317c24ed71c60398f653f Mon Sep 17 00:00:00 2001
-From: Ramon Fried <ramon@neureality.ai>
-Date: Wed, 10 Feb 2021 04:23:36 +0200
-Subject: [PATCH] parser: Fix SIGSEGV caused by using flb_free instead of
- mk_mem_free
-
-Upstream-Status: Backport (fix only for 1.3.5)
-Signed-off-by: Ramon Fried <ramon@neureality.ai>
----
- src/flb_parser.c | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/src/flb_parser.c b/src/flb_parser.c
-index d35c568..7c20e12 100644
---- a/src/flb_parser.c
-+++ b/src/flb_parser.c
-@@ -490,7 +490,7 @@ int flb_parser_conf_file(const char *file, struct fl=
b_config *config)
-                                        MK_RCONF_STR);
-         if (str) {
-             time_keep =3D flb_utils_bool(str);
--            flb_free(str);
-+            mk_mem_free(str);
-         }
-         else {
-             time_keep =3D FLB_FALSE;
-@@ -522,23 +522,23 @@ int flb_parser_conf_file(const char *file, struct =
flb_config *config)
-=20
-         flb_debug("[parser] new parser registered: %s", name);
-=20
--        flb_free(name);
--        flb_free(format);
-+        mk_mem_free(name);
-+        mk_mem_free(format);
-=20
-         if (regex) {
--            flb_free(regex);
-+            mk_mem_free(regex);
-         }
-         if (time_fmt) {
--            flb_free(time_fmt);
-+            mk_mem_free(time_fmt);
-         }
-         if (time_key) {
--            flb_free(time_key);
-+            mk_mem_free(time_key);
-         }
-         if (time_offset) {
--            flb_free(time_offset);
-+            mk_mem_free(time_offset);
-         }
-         if (types_str) {
--            flb_free(types_str);
-+            mk_mem_free(types_str);
-         }
-=20
-         decoders =3D NULL;
-@@ -548,19 +548,19 @@ int flb_parser_conf_file(const char *file, struct =
flb_config *config)
-     return 0;
-=20
-  fconf_error:
--    flb_free(name);
--    flb_free(format);
-+    mk_mem_free(name);
-+    mk_mem_free(format);
-     if (regex) {
--        flb_free(regex);
-+        mk_mem_free(regex);
-     }
-     if (time_fmt) {
--        flb_free(time_fmt);
-+        mk_mem_free(time_fmt);
-     }
-     if (time_key) {
--        flb_free(time_key);
-+        mk_mem_free(time_key);
-     }
-     if (types_str) {
--        flb_free(types_str);
-+        mk_mem_free(types_str);
-     }
-     if (decoders) {
-         flb_parser_decoder_list_destroy(decoders);
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.pat=
ch b/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch
deleted file mode 100644
index 8ffc3be3e..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/builtin-nan.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-help complier to use intrinsics, clang in few cases e.g. aarch64 can not
-and then requires linking with libm, its the only function needed from l=
ibm then
-its good to avoid needing it.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/include/fluent-bit/stream_processor/flb_sp_timeseries.h
-+++ b/include/fluent-bit/stream_processor/flb_sp_timeseries.h
-@@ -207,7 +207,7 @@ void cb_forecast_calc(struct timeseries
-         result =3D b0 + b1 * (val->f64 + *forecast->latest_x);
-         break;
-     default:
--        result =3D nan("");
-+        result =3D __builtin_nan("");
-         break;
-     }
-=20
-@@ -283,7 +283,7 @@ void cb_forecast_r_calc(struct timeserie
-             result =3D ((val->i64 - b0) / b1) - *forecast->latest_x;
-             break;
-         default:
--            result =3D nan("");
-+            result =3D __builtin_nan("");
-             break;
-         }
-=20
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-ini=
t-system-detection.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/c=
ross-build-init-system-detection.patch
deleted file mode 100644
index d3822fc8d..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-syste=
m-detection.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Define CMake variables to indicate init system for target
-incase of cross compile, detecting systemd support based on
-host directory structure is not right thing to do
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.kheem@gmail.com>
-
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -317,7 +317,7 @@ if(FLB_BINARY)
-   install(TARGETS fluent-bit-bin RUNTIME DESTINATION ${FLB_INSTALL_BIND=
IR})
-=20
-   # Detect init system, install upstart, systemd or init.d script
--  if(IS_DIRECTORY /lib/systemd/system)
-+  if(FLB_SYSTEMD)
-     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.=
service")
-     configure_file(
-       "${PROJECT_SOURCE_DIR}/init/systemd.in"
-@@ -325,7 +325,7 @@ if(FLB_BINARY)
-       )
-     install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system=
)
-     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
--  elseif(IS_DIRECTORY /usr/share/upstart)
-+  elseif(FLB_UPSTART)
-     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.=
conf")
-     configure_file(
-       "${PROJECT_SOURCE_DIR}/init/upstart.in"
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -70,6 +70,8 @@ option(FLB_RECORD_ACCESSOR    "Enable re
- option(FLB_SYSTEM_STRPTIME    "Use strptime in system libc"  Yes)
- option(FLB_STATIC_CONF        "Build binary using static configuration"=
)
- option(FLB_STREAM_PROCESSOR   "Enable Stream Processor"      Yes)
-+option(FLB_SYSTEMD            "Enable systemd init system"   No)
-+option(FLB_UPSTART            "Enable upstart init system"   No)
- option(FLB_CORO_STACK_SIZE    "Set coroutine stack size")
-=20
- # Metrics: Experimental Feature, disabled by default on 0.12 series
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch =
b/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
deleted file mode 100644
index 67b3397a6..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Add  --with-jemalloc-prefix=3Dje_ so it compiles on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -523,7 +523,7 @@ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME}
-   # Link to Jemalloc as an external dependency
-   ExternalProject_Add(jemalloc
-     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1
--    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1/co=
nfigure ${AUTOCONF_HOST_OPT} --with-lg-quantum=3D3 --enable-cc-silence --=
prefix=3D<INSTALL_DIR>
-+    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1/co=
nfigure ${AUTOCONF_HOST_OPT} --with-jemalloc-prefix=3Dje_ --with-lg-quant=
um=3D3 --enable-cc-silence --prefix=3D<INSTALL_DIR>
-     CFLAGS=3D-std=3Dgnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
-     BUILD_COMMAND $(MAKE)
-     INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
deleted file mode 100644
index b231cc287..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ /dev/null
@@ -1,69 +0,0 @@
-SUMMARY =3D "Fast Log processor and Forwarder"
-DESCRIPTION =3D "Fluent Bit is a data collector, processor and  \
-forwarder for Linux. It supports several input sources and \
-backends (destinations) for your data. \
-"
-
-HOMEPAGE =3D "http://fluentbit.io"
-BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues"
-
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
-SECTION =3D "net"
-
-SRC_URI =3D "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
-           file://jemalloc.patch \
-           file://cross-build-init-system-detection.patch \
-           file://builtin-nan.patch \
-           file://0001-ppc-Fix-signature-for-co_create-API.patch \
-           file://0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-=
of-.patch \
-           file://0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-inste=
ad-.patch \
-           file://0001-Control-sytemd-unit-install-location-with-SYSTEM_=
DIR.patch \
-           "
-SRC_URI[md5sum] =3D "6eae6dfd0a874e5dd270c36e9c68f747"
-SRC_URI[sha256sum] =3D "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f=
9a4b12d781a9c789"
-
-S =3D "${WORKDIR}/fluent-bit-${PV}"
-DEPENDS =3D "zlib bison-native flex-native"
-DEPENDS +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-
-DEPENDS:append:libc-musl =3D " fts "
-
-INSANE_SKIP:${PN}-dev +=3D "dev-elf"
-
-LTO =3D ""
-
-# Use CMake 'Unix Makefiles' generator
-OECMAKE_GENERATOR ?=3D "Unix Makefiles"
-
-# Fluent Bit build options
-# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-# Host related setup
-EXTRA_OECMAKE +=3D "-DGNU_HOST=3D${HOST_SYS} -DFLB_ALL=3DON -DFLB_TD=3D1=
"
-
-# Disable LuaJIT and filter_lua support
-EXTRA_OECMAKE +=3D "-DFLB_LUAJIT=3DOff -DFLB_FILTER_LUA=3DOff "
-
-# Disable Library and examples
-EXTRA_OECMAKE +=3D "-DFLB_SHARED_LIB=3DOff -DFLB_EXAMPLES=3DOff "
-
-# Enable systemd iff systemd is in DISTRO_FEATURES
-EXTRA_OECMAKE +=3D "${@bb.utils.contains('DISTRO_FEATURES','systemd','-D=
FLB_SYSTEMD=3DOn -DSYSTEMD_DIR=3D${systemd_system_unitdir}','-DFLB_SYSTEM=
D=3DOff',d)}"
-
-EXTRA_OECMAKE:append:riscv64 =3D " -DFLB_DEPS=3D'atomic'"
-EXTRA_OECMAKE:append:riscv32 =3D " -DFLB_DEPS=3D'atomic'"
-
-# Kafka Output plugin (disabled by default): note that when
-# enabling Kafka output plugin, the backend library librdkafka
-# requires 'openssl' as a dependency.
-#
-# DEPENDS +=3D "openssl "
-# EXTRA_OECMAKE +=3D "-DFLB_OUT_KAFKA=3DOn "
-
-inherit cmake systemd
-
-CFLAGS +=3D "-fcommon"
-
-SYSTEMD_SERVICE:${PN} =3D "td-agent-bit.service"
-TARGET_CC_ARCH:append =3D " ${SELECTED_OPTIMIZATION}"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.3.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_1.9.3.bb
new file mode 100644
index 000000000..ca5c00485
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.3.bb
@@ -0,0 +1,56 @@
+# Fluent Bit - Yocto / Bitbake
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+# The following Bitbake package the latest Fluent Bit stable release.
+
+SUMMARY =3D "Fast Log processor and Forwarder"
+DESCRIPTION =3D "Fluent Bit is a data collector, processor and  \
+forwarder for Linux. It supports several input sources and \
+backends (destinations) for your data. \
+"
+
+HOMEPAGE =3D "http://fluentbit.io"
+BUGTRACKER =3D "https://github.com/fluent/fluent-bit/issues"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a44fe7014dce33e26468b=
a93"
+SECTION =3D "net"
+
+PV =3D "1.9.3"
+
+SRCREV =3D "9eb4996b7d134227b568aefa5fa0f9ddd6a7b9ce"
+SRC_URI =3D "git://github.com/fluent/fluent-bit.git;protocol=3Dhttps;bra=
nch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+DEPENDS =3D "zlib bison-native flex-native"
+TARGET_CC_ARCH_append =3D " ${SELECTED_OPTIMIZATION}"
+
+# Use CMake 'Unix Makefiles' generator
+OECMAKE_GENERATOR ?=3D "Unix Makefiles"
+
+# Fluent Bit build options
+# =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+# Host related setup
+EXTRA_OECMAKE +=3D "-DGNU_HOST=3D${HOST_SYS} "
+
+# Disable LuaJIT and filter_lua support
+EXTRA_OECMAKE +=3D "-DFLB_LUAJIT=3DOff -DFLB_FILTER_LUA=3DOff "
+
+# Disable Library and examples
+EXTRA_OECMAKE +=3D "-DFLB_SHARED_LIB=3DOff -DFLB_EXAMPLES=3DOff "
+
+# Systemd support (optional)
+DEPENDS +=3D "systemd"
+EXTRA_OECMAKE +=3D "-DFLB_IN_SYSTEMD=3DOn "
+
+# Kafka Output plugin (disabled by default): note that when
+# enabling Kafka output plugin, the backend library librdkafka
+# requires 'openssl' as a dependency.
+#
+# DEPENDS +=3D "openssl "
+# EXTRA_OECMAKE +=3D "-DFLB_OUT_KAFKA=3DOn "
+
+inherit cmake systemd
+
+SYSTEMD_SERVICE_${PN} =3D "fluent-bit.service"
+TARGET_CC_ARCH:append =3D " ${SELECTED_OPTIMIZATION}"
\ No newline at end of file
--=20
2.34.0.windows.1


