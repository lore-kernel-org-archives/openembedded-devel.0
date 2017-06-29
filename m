Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 238B777F79
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:53:03 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u36so10486950pgn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 21:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VxxxtiijBjcNK2g0sTwT984KA0v7fEN0bzo1HvhCGA4=;
	b=TeBdkX7G1urz/9HDaqNgPTNmnZYycugR7WKaAb81lkuP2nAQie0nk/8hFitJdr0gCU
	nCcUSlcN88ZxJGWZaSwlFv41aY5AbrQWQ/AJZ4HL29c3y3sYUoXSc1B35C4MbdYhQUs3
	X2A9nRrCiRmGXf7BlBJmk3Eyta90UoEnt0/+4cGJhV48ryeBjrmMCdQoVJ388IX/mlaS
	L4R6ohXs4NJXEQOvovJua/nJbsECNSMFfe7bkoWLisyfdXZTnwdj/o5d2UoS3xf3SeHp
	1ZkDhE9eISBzcxSTXqvFzMp71QHG3Q8mDmWYNychWOo3GyEQ8cwsUGVjIMuR978M0mh+
	RFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VxxxtiijBjcNK2g0sTwT984KA0v7fEN0bzo1HvhCGA4=;
	b=tUtPHE/y2fCe6O3I5o4ik+6omoC8AJ7F/GrAxxjRZGQKauXke90vF9le64x61eFGa0
	br41Q07oX73gxY0P1+YsvhG3cgy8IByegSRGaQ/TI9YfzkFbgT7Mu/q22NiLscW+iQ+Z
	22/aoU+keMA6+D3wzFlHLfxhJIDtExvK5f2qJl6jlxIDT4tHAHZuW4JGePqB4DrI0qwW
	f379JPG1xc6GEBQ5HJkO7mOFoCNblNmUzzBjgzlb+vpAV+RCJG1UODkfCL8l+IUNRWHg
	6S9j3bmBpdOCc7eqmuDZbHb/rLl36nNkOkg5+59SawiZoWjQelHX08EMdlr/mJaX/Gu3
	bo2g==
X-Gm-Message-State: AKS2vOxENKotOzXhCD5okOOWeYYLy1q7kkpbL3FEy256TWsexMXZfKJT
	58iwNSPippKUqYmI
X-Received: by 10.101.69.194 with SMTP id m2mr14017747pgr.105.1498711984797;
	Wed, 28 Jun 2017 21:53:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id 3sm8068423pfp.11.2017.06.28.21.53.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 21:53:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jun 2017 21:52:51 -0700
Message-Id: <20170629045254.22351-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH 1/4] fluentbit: Upgrade to 0.11.11
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
X-List-Received-Date: Thu, 29 Jun 2017 04:53:04 -0000

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch | 52 ----------------------
 .../{fluentbit_0.11.3.bb => fluentbit_0.11.11.bb}  |  7 ++-
 2 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_0.11.3.bb => fluentbit_0.11.11.bb} (67%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch
deleted file mode 100644
index 539a42a7d..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From ceb47f37582a055bb7f253f813c435ad55c5b6eb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Apr 2017 10:02:50 -0700
-Subject: [PATCH 1/2] CMakeLists.txt: Add AUTOCONF_HOST_OPT to help cross
- compiling
-
-This helps in doing cross compiles for modules which are using
-GNU autoconf for build system
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b093f9a..ebf0cd7 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -290,6 +290,12 @@ else()
-   endif()
- endif()
- 
-+if("${GNU_HOST}" STREQUAL "")
-+    set(AUTOCONF_HOST_OPT "")
-+else()
-+    set(AUTOCONF_HOST_OPT "--host=${GNU_HOST}")
-+endif()
-+
- # Memory Allocator
- # ================
- if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME} MATCHES "Linux")
-@@ -299,7 +305,7 @@ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME} MATCHES "Linux")
-   # Link to Jemalloc as an external dependency
-   ExternalProject_Add(jemalloc
-     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc
--    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
-+    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
-     CFLAGS=-std=gnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
-     BUILD_COMMAND ${MAKE}
-     INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
-@@ -317,7 +323,7 @@ endif()
- if(FLB_REGEX)
-   ExternalProject_Add(onigmo
-     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/onigmo
--    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/onigmo/configure --with-pic --disable-shared --enable-static --prefix=<INSTALL_DIR>
-+    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/onigmo/configure ${AUTOCONF_HOST_OPT} --with-pic --disable-shared --enable-static --prefix=<INSTALL_DIR>
-     CFLAGS=-std=gnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
-     BUILD_COMMAND ${MAKE}
-     INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
similarity index 67%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
index 8d756e6a4..46c47fd55 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.3.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
@@ -3,11 +3,10 @@ HOMEPAGE = "http://fluentbit.io"
 BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
 
 SRC_URI = "http://fluentbit.io/releases/0.11/fluent-bit-${PV}.tar.gz \
-           file://0001-CMakeLists.txt-Add-AUTOCONF_HOST_OPT-to-help-cross-c.patch \
            file://0002-msgpack-Add-comment-for-intended-fallthrough.patch \
            "
-SRC_URI[md5sum] = "9383262339412782b80cc49e7ad15609"
-SRC_URI[sha256sum] = "eb8a85c656fa60682b0bf8dd1ad58d848cd251dab4f35a6777acd552c65b0511"
+SRC_URI[md5sum] = "7bce8091c41fb6412b7fe0185b3cb8d6"
+SRC_URI[sha256sum] = "93b1bdd14db20f2823cd31c6f1a2f3fcb7c94ec3e0c8daefabf130310b7fc4ed"
 
 S = "${WORKDIR}/fluent-bit-${PV}"
 
@@ -19,6 +18,6 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 
 inherit cmake systemd
 
-EXTRA_OECMAKE = "-DGNU_HOST=${HOST_SYS}"
+EXTRA_OECMAKE = "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
 
 SYSTEMD_SERVICE_${PN} = "fluent-bit.service"
-- 
2.13.2


