Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1655.1792738449478319183
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AccV3nlb;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a089dfee18so918394b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738449; x=1793343249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+7DjXnPpHCTy/iv8nwehTAZXFQxRM1DjFGrJkXfmJ4=;
        b=AccV3nlbyRjF7piRls7XmHHZnKTc9mH+p6cJyYDKK+VB/pwAntYDDKCd3qnqo+ExCk
         XF1l6kQFU0aqrgFbfdrHeH7Ri0kVOwBpFq/M0igzL7SKJyxXKx/xvGpEopb0NaChynwu
         y2Mc+M+2gwTCWFAeKzRZnQ3dLdyuhy0lfcyEhhQtRtH7u1XgFpuSQ0MDD60NIIgyN1dI
         Ae78M9w5FpbJGtpffRR4PegjyQqbsbERkuSgYx13qAtdzRy69BfgSGhAol0FdQsqxjWR
         RNCUtq0rU9YRmniMJkeB9zrFY5UF+4UJMT8hkLGnhyAPiK3xLbfmKh3yU5QeUiqnqnJF
         Dz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738449; x=1793343249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+7DjXnPpHCTy/iv8nwehTAZXFQxRM1DjFGrJkXfmJ4=;
        b=qWE9nhaCch2lcc4sIq4APu0xdAt7m+3gjN7+edupRzGLJLKTg7BnJFVd0mVvFBwD4S
         xZafFl4TtBCR9dJFpv3NPIGHUmFgEcI+Sul7uXube4JOJakbaUEts/VYvIzH7NRgqTht
         pjjchdEk5vip4BT35IpcpOuW3j054pMK3/5OK8Oqq+V1fBcxvXnm3WL1Owttzn0tdHcB
         mSed749LR7T2etR02L/8KbOrqEHdtohEqEmEO+3m2oyGEc4kn1NljQeQ4Bo6HjNlt4sN
         dBlKO7eSDHsoDC/XNKLob6ES1t15qLc0cw/9xDOLhyp46pdCIE/d88nM1GFr7VfSDKqU
         238g==
X-Gm-Message-State: AFq9FYIvwuadV1BGLmpR0cBXRZqjeipRS75F0vaCzcY+IKzMXCp/qwXR
	zM4Q7deR/hjC6QQJCIBRdjdvxSo71eJ+jqN1rBXUqZZ9IG6O+CseHmtQd5yXvUnAPBw=
X-Gm-Gg: AYBFou1oZZVuCqoOAkSrQiBIbUUk0lHPR0iI7CQiOo+HyWBQ2lG3h1qnXNGkruCx2hn
	5OQatMdS4AYDFjAiOWbNUXgghdVrO+kG0d3JJqilbXj0joFVEc7mkLySuDSentnFX32wnaCs0Ae
	MGHOgL3xSAjv9SAE0pkXGVfaxNMapgeU+/yoHLp8e0Ub5FONDU1/J481oTy0K4yH2wP3NGA//5u
	/s0ZISKw2E/WR8p14TN2mPbYcOtE2KVPrTDA+aruoWL9yRyxlN45WNdTrPm6SkjHwQqVNivcW7c
	TR71576qw3dUzjksBeYh9OUUR8WyOaoaNkkoiSvmDaZsdBNBq/vN5RWoYJrMmiV7+zh5Wz+Mljm
	RDoK+9RTMra7p7VKLYORxEbMnMUx/Wi1VlUZTeAUcaFQBjvxmAT+TyogUU7jF6BchrX8aV3KgX4
	YepPMpI24JNZqdsLlM6B52UqdqA71zd3wv8jlWs0zCkoxOc1Cb2aB3jGQOvWuBuByu0oaEhKsX2
	T1PkJWiF4QhTnzn5hDYesM1YlaAisdovixV2vi8bexiqozMN3PLbMlQFVVvkzJ6H+E1rbeiS8IT
	fbPWgqg0YuVyCGXBiz7DQcWoHPFlgMDxy4uEMGPaWBobPYW5b40yHvnmorh3wK3Sgj4zdWoprwU
	z3vVGDnIgIM3MtR/EoMWTdYt+cNDA+NAy/siP7x7FXez64Kp8EsotdV8Vi7lxEIYXT7NMlX2q3j
	KfKk0WECGkYww0GSDDjqhoTWYJuAwyE+yL5scL+e5yo0yf3YJasQOgSoe5WGhA0pP5gnYAquWRJ
	6KQKf7sWqAkEFIH5wc6iNuZqKXL/b8=
X-Received: by 2002:a05:6a20:d80f:b0:3e1:2c06:3a51 with SMTP id adf61e73a8af0-3e359a42429mr800460637.2.1792738448782;
        Thu, 22 Oct 2026 23:54:08 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 13/29] hiawatha: Link with libatomic when 64-bit atomics need it
Date: Thu, 22 Oct 2026 23:53:34 -0700
Message-ID: <20261023065350.3228996-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131337
Content-Type: text/plain; charset="utf-8"

hiawatha uses __atomic_store_n()/__atomic_load_n() on time_t values. On
riscv32, where time_t is 64-bit but there are no 64-bit atomic
instructions, these become __atomic_*_8 libcalls, and linking fails:

  ld.lld: error: undefined symbol: __atomic_store_8

Add a patch that checks in CMake whether atomic operations on a time_t
need libatomic and links hiawatha with it only in that case.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...libatomic-when-64-bit-atomics-need-i.patch | 70 +++++++++++++++++++
 .../recipes-httpd/hiawatha/hiawatha_12.4.bb   |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/hiawatha/files/0001-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch

diff --git a/meta-webserver/recipes-httpd/hiawatha/files/0001-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch b/meta-webserver/recipes-httpd/hiawatha/files/0001-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch
new file mode 100644
index 0000000000..11f5780ce0
--- /dev/null
+++ b/meta-webserver/recipes-httpd/hiawatha/files/0001-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch
@@ -0,0 +1,70 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 14:00:00 -0700
+Subject: [PATCH] cmake: Link with libatomic when 64-bit atomics need it
+
+hiawatha uses __atomic_store_n()/__atomic_load_n() on time_t values,
+host->access_time in workers.c and, with ENABLE_HTTP2, drain_deadline in
+http2.c. On 32-bit targets with a 64-bit time_t but no 64-bit atomic
+instructions, such as riscv32, the compiler lowers these to
+__atomic_*_8 libcalls, and linking hiawatha fails:
+
+  ld.lld: error: undefined symbol: __atomic_store_8
+  >>> referenced by workers.c (src/workers.c)
+
+Check whether atomic operations on a time_t link on their own, and if
+not, whether they link with libatomic, and link hiawatha with it only in
+that case. The test variable is global so the compiler cannot optimize
+the atomic operations away.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -25,6 +25,7 @@
+ include(CheckFunctionExists)
+ include(CheckLibraryExists)
+ include(CheckSymbolExists)
++include(CheckCSourceCompiles)
+ include(GNUInstallDirs)
+ if(ENABLE_XSLT)
+ 	include(FindLibXml2)
+@@ -85,6 +86,26 @@
+ check_symbol_exists("kqueue" "sys/types.h;sys/event.h;sys/time.h" HAVE_KQUEUE)
+ check_symbol_exists("kqueue1" "sys/types.h;sys/event.h;sys/time.h" HAVE_KQUEUE1)
+
++# Atomic operations on time_t need libatomic on 32-bit targets with a 64-bit
++# time_t but without 64-bit atomic instructions, e.g. riscv32. The variable is
++# global so the compiler cannot optimize the atomic operations away.
++set(ATOMIC64_TEST_SOURCE "
++#include <time.h>
++time_t t;
++int main(void) {
++	__atomic_store_n(&t, time(NULL), __ATOMIC_RELEASE);
++	return __atomic_load_n(&t, __ATOMIC_SEQ_CST) == 0;
++}")
++check_c_source_compiles("${ATOMIC64_TEST_SOURCE}" HAVE_ATOMIC64)
++if(NOT HAVE_ATOMIC64)
++	set(CMAKE_REQUIRED_LIBRARIES atomic)
++	check_c_source_compiles("${ATOMIC64_TEST_SOURCE}" HAVE_ATOMIC64_WITH_LIBATOMIC)
++	unset(CMAKE_REQUIRED_LIBRARIES)
++	if(HAVE_ATOMIC64_WITH_LIBATOMIC)
++		set(ATOMIC_LIBRARY "atomic")
++	endif()
++endif()
++
+ if(HAVE_CRYPT_LIBRARY)
+ 	set(CRYPT_LIBRARY "crypt")
+ endif()
+@@ -168,7 +189,7 @@
+ add_executable(ssi-cgi ${ssi_cgi_src})
+ add_executable(wigwam ${wigwam_src})
+ target_link_libraries(cgi-wrapper ${Z_LIBRARY})
+-target_link_libraries(hiawatha ${CRYPT_LIBRARY} pthread ${Z_LIBRARY} ${MBEDTLS_LIBRARIES})
++target_link_libraries(hiawatha ${CRYPT_LIBRARY} pthread ${Z_LIBRARY} ${MBEDTLS_LIBRARIES} ${ATOMIC_LIBRARY})
+ target_link_libraries(ssi-cgi ${Z_LIBRARY})
+ target_link_libraries(wigwam ${CRYPT_LIBRARY} ${Z_LIBRARY} ${MBEDTLS_LIBRARIES})
+ if(ENABLE_HTTP2)
diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.4.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.4.bb
index 8164b3076f..87bf6e5409 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.4.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.4.bb
@@ -7,6 +7,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 SECTION = "net"

 SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-${PV}.tar.gz \
+           file://0001-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch \
            file://hiawatha-init \
            file://hiawatha.service \
           "
