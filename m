Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0449ECAAD8
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:42 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.8934.1661843675895366790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UajWPhQg;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id l5so6372929pjy.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=uc2RPKday3VTBSWW3I2ik3xQx9MLqNPZwladhttCwaw=;
        b=UajWPhQg+7YQODml6k7TMNuqdKUvMgpXS9uXT05o+k62eCb8mKn3hCt0s1S1Si6iyV
         Y+834XiDNxO/jELmX/ScN+HjpSRo9ExK0ZrKzHSIFiwgrs3DRsAE5hn1uY2iPLRf7yez
         3bsABiogL/3CW2V5DWy1fzBC6Uqi1pQncUo/3fWVRrNriy6VSn/JsT76/sJFd6wP/v6+
         fEZOrPC5kR0yASaW0MiFQTJ6nu5dnLliinVjJrQTX79wwUXj/HXlvhti2/2g0mrkhWhQ
         OD0axLmThDAsnvZDEGt0pCIExSqJ0YBl3uQumYgayTW7z3NLL19xzrenMBeYyy07J91V
         Ev3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=uc2RPKday3VTBSWW3I2ik3xQx9MLqNPZwladhttCwaw=;
        b=MnKs+rExV8u/kgHiqbWoVRtli078W6I2iL4ncwpPQpHRY5Pn0QvWarjY8QD1wp6GAB
         IrFWfGGjMc/jIIdRjTWKu9+DvuhBRVw5+3U0WmFj7nhPxd5mo+DbN9QkgMualSL+rXcj
         xZwP7JstrG8S+URNEsdvjR8q1yyZ6s9QVJbJb64lGkcR4wdrOw4SypIp69MlI9VnZDFx
         MnieViAQU21WtCOJhMv6DIkErBXJ1XL0dS0oqmWzIIXOpnKROo/jbJm282qqSArdOzod
         PWO5Hv/IN+Ek73gb5I2gh4lzPWXSVrp5b0rYwue0QuYGe1fLXeN8AY7/5ToZOjXRwFAX
         w5CQ==
X-Gm-Message-State: ACgBeo1DJnV5KUZIdga+TVrdeCuitpUrxbSfj7h42UJxcVQefTtOwJav
	ZE1ac9Q+IBJt/rYqQdsQNVYqMuzhwYwduw==
X-Google-Smtp-Source: 
 AA6agR5jYw2XLdvnqNNIBNaGO9sqE4NsNoYblFlOh2lhnD339ZKzbIglIquz2/Ec1aBnH7QFhJDBdw==
X-Received: by 2002:a17:902:b68d:b0:172:e973:82b9 with SMTP id
 c13-20020a170902b68d00b00172e97382b9mr20133777pls.120.1661843674599;
        Tue, 30 Aug 2022 00:14:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 21/21] ot-daemon,ot-br-posix: Fix mbedtls
 module builds
Date: Tue, 30 Aug 2022 00:14:13 -0700
Message-Id: <20220830071413.3887189-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98558

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openthread/ot-br-posix/mbedtls.patch      | 43 +++++++++++++++++++
 .../openthread/ot-br-posix_git.bb             |  6 ++-
 .../openthread/ot-daemon/mbedtls.patch        | 43 +++++++++++++++++++
 .../openthread/ot-daemon_git.bb               |  1 +
 4 files changed, 91 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
 create mode 100644 meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch b/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
new file mode 100644
index 0000000000..91b3046484
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix/mbedtls.patch
@@ -0,0 +1,43 @@
+mbedtls: Disable documentation warning as error with clang
+
+There are shortcomings with doxygen info which clang-15+ flags, dont
+treat them as errors
+
+Remove unused variable
+
+Fixes
+library/bignum.c:1395:29: error: variable 't' set but not used [-Werror,-Wunused-but-set-variable]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/third_party/openthread/repo/third_party/mbedtls/repo/library/bignum.c
++++ b/third_party/openthread/repo/third_party/mbedtls/repo/library/bignum.c
+@@ -1544,7 +1544,7 @@ __attribute__ ((noinline))
+ #endif
+ void mpi_mul_hlp( size_t i, mbedtls_mpi_uint *s, mbedtls_mpi_uint *d, mbedtls_mpi_uint b )
+ {
+-    mbedtls_mpi_uint c = 0, t = 0;
++    mbedtls_mpi_uint c = 0;
+ 
+ #if defined(MULADDC_HUIT)
+     for( ; i >= 8; i -= 8 )
+@@ -1595,8 +1595,6 @@ void mpi_mul_hlp( size_t i, mbedtls_mpi_
+     }
+ #endif /* MULADDC_HUIT */
+ 
+-    t++;
+-
+     do {
+         *d += c; c = ( *d < c ); d++;
+     }
+--- a/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
++++ b/third_party/openthread/repo/third_party/mbedtls/repo/CMakeLists.txt
+@@ -192,7 +192,7 @@ if(CMAKE_COMPILER_IS_GNU)
+ endif(CMAKE_COMPILER_IS_GNU)
+ 
+ if(CMAKE_COMPILER_IS_CLANG)
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wno-error=documentation")
+     set(CMAKE_C_FLAGS_RELEASE     "-O2")
+     set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
+     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index a16b77849e..3d3c9bc0f2 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -17,14 +17,16 @@ PV = "0.3.0+git${SRCPV}"
 SRC_URI = "gitsm://github.com/openthread/ot-br-posix.git;protocol=https;branch=main \
            file://0001-otbr-agent.service.in-remove-pre-exec-hook-for-mdns-.patch \
            file://0001-cmake-Disable-nonnull-compare-warning-on-gcc.patch \
+           file://mbedtls.patch \
            "
 
 S = "${WORKDIR}/git"
 SYSTEMD_SERVICE:${PN} = "otbr-agent.service"
 
 inherit pkgconfig cmake systemd
-
-CXXFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"
+# openthread/repo/src/cli/cli.cpp:1786:18: fatal error: variable 'i' set but not used [-Wunused-but-set-variable]
+#    for (uint8_t i = 0;; i++)
+CXXFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare -Wno-error=unused-but-set-variable"
 
 EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOTBR_DBUS=ON \
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch b/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch
new file mode 100644
index 0000000000..be26a20dad
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon/mbedtls.patch
@@ -0,0 +1,43 @@
+mbedtls: Disable documentation warning as error with clang
+
+There are shortcomings with doxygen info which clang-15+ flags, dont
+treat them as errors
+
+Remove unused variable
+
+Fixes
+library/bignum.c:1395:29: error: variable 't' set but not used [-Werror,-Wunused-but-set-variable]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/third_party/mbedtls/repo/library/bignum.c
++++ b/third_party/mbedtls/repo/library/bignum.c
+@@ -1544,7 +1544,7 @@ __attribute__ ((noinline))
+ #endif
+ void mpi_mul_hlp( size_t i, mbedtls_mpi_uint *s, mbedtls_mpi_uint *d, mbedtls_mpi_uint b )
+ {
+-    mbedtls_mpi_uint c = 0, t = 0;
++    mbedtls_mpi_uint c = 0;
+ 
+ #if defined(MULADDC_HUIT)
+     for( ; i >= 8; i -= 8 )
+@@ -1595,8 +1595,6 @@ void mpi_mul_hlp( size_t i, mbedtls_mpi_
+     }
+ #endif /* MULADDC_HUIT */
+ 
+-    t++;
+-
+     do {
+         *d += c; c = ( *d < c ); d++;
+     }
+--- a/third_party/mbedtls/repo/CMakeLists.txt
++++ b/third_party/mbedtls/repo/CMakeLists.txt
+@@ -192,7 +192,7 @@ if(CMAKE_COMPILER_IS_GNU)
+ endif(CMAKE_COMPILER_IS_GNU)
+ 
+ if(CMAKE_COMPILER_IS_CLANG)
+-    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla")
++    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wwrite-strings -Wpointer-arith -Wimplicit-fallthrough -Wshadow -Wvla -Wno-error=documentation")
+     set(CMAKE_C_FLAGS_RELEASE     "-O2")
+     set(CMAKE_C_FLAGS_DEBUG       "-O0 -g3")
+     set(CMAKE_C_FLAGS_COVERAGE    "-O0 -g3 --coverage")
diff --git a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
index f3f4c70fa2..1063b5bd42 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-daemon_git.bb
@@ -12,6 +12,7 @@ SRCREV = "7dfde1f12923f03c9680be4d838b94b7a2320324"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://github.com/openthread/openthread.git;protocol=https;branch=main \
+           file://mbedtls.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.37.2


