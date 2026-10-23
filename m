Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1659.1792738454867799432
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W3CapP6E;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso235577a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738454; x=1793343254; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/jMdvF3efdpvXL1S7ACXH83o1329rhyLACJPxnHGgY=;
        b=W3CapP6EAm/RIBfn06kzPQZVZu67C237mQlI1i/bpuPqjRUdWKOYh97k38YQtQF4Zj
         aEfvedEy+XdTOv61s4dF031rOV/CiXY5F4iL5YBqcXJGa/Pk1JkU5sx7+Nh+w8JmIBNK
         Zs82bDj8hOTK6rXHcb5mzFAbSE/XtOC8epp7ogqBXAybJGzu1e65c9r+XKiHNPVKRIE4
         +1ut8q2JStBCLXf3nssdZ+ri8BSNS+FKhLTMVzPv4fHvK/fqY5q0q58SChRBicrGlEbj
         vCHIWI0oVjABWzxIJKtKpIim0LPMtgvZv4/z88CkJRx2lu+8oFJcDc435JWQmjk1JHeC
         MpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738454; x=1793343254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/jMdvF3efdpvXL1S7ACXH83o1329rhyLACJPxnHGgY=;
        b=hyHTKtaxebtG/1yWMAOp1JQ9km6xiZuffs5yPCl2TUo2EiLW0CVDsePfYDJvfHK1g4
         r3EqLHeQkzr4mSr7i5fAKRqvOBSaCVE3n/ARpjV/9JrRO9MpIz7sqp6C5rRwcdaABD5/
         rDRkGCOdImCaht6JfhSG3SVZoetpnd/G/1RpZcp1+/4yc7Kbyi+j0ihZSAZuxaxiYO3i
         V2DLkmefuqf8Qbt1YReP0W9DsPSEJ7+1FODYTmjJvj2wfkgng1/6CRPotE6nnRCW1Oci
         QiiO4Xe5yJVQNMRCY2kA86IqI9tC36yNaolpBmuINh48Ffy7vmnQiGOPb6rNj0xPOXbf
         IIsg==
X-Gm-Message-State: AFq9FYLJerasYtk/8J6zIs3VPyaGC0qRNMiWXt5XYyLuR+GUtP4UrLS/
	rwQLhI2ATyR2RHHu7VVmoQzMeqHk7IWPBCJDS9Dz3i2cWkAhEjzRmsX90GSYQeW5mFc=
X-Gm-Gg: AYBFou16ScaMh0J/mOnTQLSG2nK13eVkorjSZ+JqLOEHtA+EjskOxLCTOkQaNcP+TsD
	/GCVPnoP1Bz6TmdrTQSUuNzUEkjGrbvAxa+iR+yVNNWNzDXeE0LcSO+uCcymNLru+1vfwGdaWms
	0uDTTPK4WLgYe02me8xNMCCJuf0OyAKSEbjoaMsW6GaGaHBpz7DRXKRJ7vhtKOb/XX8cbfKw0hY
	yWlrifGyi9Z8OaV4eUjv+A7V7zKpNrkiCaofTnKusgJuFdXgEUTKkm3qA/F9EVIb6cGaBjt1kT/
	bdKFInWd2T7+nXnVH5rtZ7/p7dWv/L1g1dMoS3c9PoPlfkjNl2npeM7OruA1pGULcxOdUFAZxl5
	3gKm9yKf5kxGSaGBkjR3dkENYzlMEYBNuTbaY/8CKJcrLCn2CedL5dFELUVFBrgZjEMfkuirYKE
	AonZ4wrBg7djQOZdC9CZUiQKXDGhbO5+AAV/gVQTqa6oKK2MNdqFbQ0DhP7h4egjcXhylApRMvy
	qq4qo3Pi5vGW0TLtStu6zzZ8WOpMHM4nHlZF9BH56gSB4rZK5A42/b8qiHggOlcsDdGmAmMY3Y1
	SaEnU1E12Z6iOBFHeYJ1pNECQF4onp9i0FzZgfDm8oZheSedCygTFm3VYyanJhfbtS5veoToDW8
	+Ba1nUNh1vJ+6mGyoBcy011uywH3Ui7OLDfKgLC3Q0a2kjflaxkkUceRJMuJTRW0MqbZB18orwO
	qdXmBnqZLJfOaUEgRX3ZNt0MTgxtZtSHVQrGW8ShnR88/Oqx6aUPSS5lfVUIdq7DLxmxZeJocwf
	kXBqIKWHCtNrTmheLH6CXYhNp+Po5uj
X-Received: by 2002:a05:6a20:4306:b0:3e1:bcb:1d19 with SMTP id adf61e73a8af0-3e3767aa026mr1172559637.67.1792738454023;
        Thu, 22 Oct 2026 23:54:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 17/29] floret: Link with libatomic when 64-bit atomics need it
Date: Thu, 22 Oct 2026 23:53:38 -0700
Message-ID: <20261023065350.3228996-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131341
Content-Type: text/plain; charset="utf-8"

floret keeps its training token counter in a std::atomic<int64_t>. On
riscv32 its operations become __atomic_*_8 libcalls, and floret is not
linked with libatomic, so linking the CLI fails:

  ld.lld: error: undefined symbol: __atomic_fetch_add_8

Add a patch that checks in CMake whether 64-bit atomics need libatomic
and only then links the libraries with it and adds it to floret.pc.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...libatomic-when-64-bit-atomics-need-i.patch | 77 +++++++++++++++++++
 .../recipes-support/floret/floret_0.10.5.bb   |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-support/floret/files/0003-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch

diff --git a/meta-oe/recipes-support/floret/files/0003-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch b/meta-oe/recipes-support/floret/files/0003-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch
new file mode 100644
index 0000000000..0c5bebc827
--- /dev/null
+++ b/meta-oe/recipes-support/floret/files/0003-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch
@@ -0,0 +1,77 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 21 Oct 2026 17:00:00 -0700
+Subject: [PATCH] cmake: Link with libatomic when 64-bit atomics need it
+
+FastText::tokenCount_ is a std::atomic<int64_t>. On 32-bit targets
+without 64-bit atomic instructions, such as riscv32, its operations
+become __atomic_*_8 libcalls, but floret is not linked with libatomic,
+so linking the floret CLI fails:
+
+  ld.lld: error: undefined symbol: __atomic_fetch_add_8
+  >>> referenced by fasttext.cc
+  >>>               fasttext.cc.o:(fasttext::FastText::trainThread(...)) in archive libfloret.a
+
+Check whether 64-bit atomics link on their own, and if not, whether
+they link with libatomic, and only in that case link the libraries with
+it, which also covers the CLI linking the static library, and add it to
+Libs.private in floret.pc. The test variable is global so the compiler
+cannot optimize the atomic operations away.
+
+Upstream-Status: Submitted [https://github.com/explosion/floret/pull/34]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt | 27 +++++++++++++++++++++++++++
+ floret.pc.in   |  1 +
+ 2 files changed, 28 insertions(+)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,6 +52,29 @@
+     src/vector.cc)
+
+
++# std::atomic<int64_t> needs libatomic on 32-bit targets without 64-bit
++# atomic instructions, e.g. riscv32. The variable is global so the compiler
++# cannot optimize the atomic operations away.
++include(CheckCXXSourceCompiles)
++set(ATOMIC64_TEST "
++#include <atomic>
++#include <cstdint>
++std::atomic<int64_t> v;
++int main() {
++  v.fetch_add(1);
++  return static_cast<int>(v.load());
++}")
++check_cxx_source_compiles("${ATOMIC64_TEST}" HAVE_ATOMIC64)
++if (NOT HAVE_ATOMIC64)
++  set(CMAKE_REQUIRED_LIBRARIES atomic)
++  check_cxx_source_compiles("${ATOMIC64_TEST}" HAVE_ATOMIC64_WITH_LIBATOMIC)
++  unset(CMAKE_REQUIRED_LIBRARIES)
++  if (HAVE_ATOMIC64_WITH_LIBATOMIC)
++    set(ATOMIC_LIBRARY atomic)
++    set(PC_LIBS_PRIVATE "-latomic")
++  endif()
++endif()
++
+ if (NOT MSVC)
+   include(GNUInstallDirs)
+   configure_file("floret.pc.in" "floret.pc" @ONLY)
+@@ -66,6 +89,10 @@
+ set_target_properties(floret-static PROPERTIES OUTPUT_NAME floret)
+ set_target_properties(floret-static_pic PROPERTIES OUTPUT_NAME floret_pic
+   POSITION_INDEPENDENT_CODE True)
++target_link_libraries(floret-shared ${ATOMIC_LIBRARY})
++target_link_libraries(floret-static ${ATOMIC_LIBRARY})
++target_link_libraries(floret-static_pic ${ATOMIC_LIBRARY})
++
+ add_executable(floret-bin src/main.cc)
+ target_link_libraries(floret-bin pthread floret-static)
+ set_target_properties(floret-bin PROPERTIES PUBLIC_HEADER "${HEADER_FILES}" OUTPUT_NAME floret)
+--- a/floret.pc.in
++++ b/floret.pc.in
+@@ -7,4 +7,5 @@
+ Description: Efficient learning of word representations and sentence classification
+ Version: @PROJECT_VERSION@
+ Libs: -L${libdir} -lfloret
++Libs.private: @PC_LIBS_PRIVATE@
+ Cflags: -I${includedir}
diff --git a/meta-oe/recipes-support/floret/floret_0.10.5.bb b/meta-oe/recipes-support/floret/floret_0.10.5.bb
index fd96ed701c..4bd4ec2c82 100644
--- a/meta-oe/recipes-support/floret/floret_0.10.5.bb
+++ b/meta-oe/recipes-support/floret/floret_0.10.5.bb
@@ -18,6 +18,7 @@ DEPENDS = "zlib"
 SRC_URI = "git://github.com/explosion/floret.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-PATCH-floret-Adjust-CMake-flags-for-cross-compilation.patch \
            file://0002-args.h-add-missing-cstdint-include-for-int64_t.patch \
+           file://0003-cmake-Link-with-libatomic-when-64-bit-atomics-need-i.patch \
            "

 SRCREV = "775638223bee4fabc420cc8234632557452558e0"
