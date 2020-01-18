Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9F97FA42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 22:25:07 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id 62so7129469pfu.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 14:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wlygmjOrcb6MD05hkOiqhmDHjLofDkpZKN0tyZb6Nr4=;
	b=stGriEEO4A9mlqAyqoElGW7utglrjGLMl9D09ypgyVuWSP0d3CCOSH1ENeUy3+rYVJ
	TGeoOSWP1GMeXklmZLm3d8w70xOxGcTBN+5tDXfyWTK6Y9Xe0RitBvtEbZ5jklWSOoz2
	U0AhgrixMe28D/zJ4jy7ZIEn6jvgcIyFIBASVFOtpx4TX9Ak0PPC7hIUnQG9pmpFN9Hz
	sEIQ7yY1PYvfdz/dp2t8oRAs3VqkD4445qeLwGP7Tg4zLJfud655E0HE0TrKGGn6CIgu
	OXhypQWLManFxXKrE7776Ns/YJERwAY+IOncQMNfOOxfIYMiVw8Fo+CYoTFznawhkTKB
	bu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wlygmjOrcb6MD05hkOiqhmDHjLofDkpZKN0tyZb6Nr4=;
	b=ewasRAQSvFpTEOXhQpP2LFGYCLjXxgn0+kq42kTQobbFsFFcp9FKY4MW8o86FPBZ2s
	92QrnL7IWUml09P6IS8qMsHZI8VImcv6zcSFvcIgnVaBairgU9YFeIR2h3Ku2VjmbjE8
	bv2UtGPGTvuttZYPm8OEnzSMlRGPlKC/X+EXXaPjpZEmL/VdnTcZ+EEM1GtJCC5yHyF5
	smWWj6Eatjra6Sl1vj1U/uqNpbPYK5kuIfZ/rX9eMtzczHygNH9L1SUBAC1XH/pBAmt+
	VFYHripEpptPpVb0/7QiBLFWK3KHb3ik0VxbZNzEfRwrWxZbK3G9j/i9446anOZnQjKS
	lT8A==
X-Gm-Message-State: APjAAAWtwXzPY6pZ0cYANkCjpNn7kLKlfHGskfmvm9yTh1SLqgwBgLwg
	SY2zzLVRVX3EQhfz8u6LyyIFkm+bqRc=
X-Google-Smtp-Source: APXvYqyaZ4HhTMMj63f5QPWbOHJQbvxarAcOiP9QW4sQupA6K8pXGTyC1K8oN+971XbE5952Q+AQYw==
X-Received: by 2002:a63:3104:: with SMTP id x4mr51597936pgx.369.1579386308628; 
	Sat, 18 Jan 2020 14:25:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	x18sm34569052pfr.26.2020.01.18.14.25.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 14:25:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 14:25:07 -0800
Message-Id: <20200118222507.1959461-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] recipes: Make powerpc64le overrides
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
X-List-Received-Date: Sat, 18 Jan 2020 22:25:08 -0000
Content-Transfer-Encoding: 8bit

The existing conditions for ppc64/be are applicable for le as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc                  | 1 +
 meta-oe/recipes-benchmark/iozone3/iozone3_488.bb                 | 1 +
 meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb       | 1 +
 meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb                 | 1 +
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb    | 1 +
 meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb    | 1 +
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb                  | 1 +
 meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb             | 1 +
 meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb                  | 1 +
 meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb                | 1 +
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb                 | 1 +
 11 files changed, 11 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 289288d480..54cd3c24bc 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -77,4 +77,5 @@ KLIBC_ARCH_x86 = "i386"
 KLIBC_ARCH_x86-64 = "x86_64"
 KLIBC_ARCH_powerpc = "ppc"
 KLIBC_ARCH_powerpc64 = "ppc64"
+KLIBC_ARCH_powerpc64le = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV}-${PR})"
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
index 4d9e07765f..222a95647e 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_488.bb
@@ -25,6 +25,7 @@ S = "${WORKDIR}/${BPN}_${PV}/src/current/"
 #
 EXTRA_OEMAKE_powerpc = "linux-powerpc CC='${CC}' GCC='${CC}'"
 EXTRA_OEMAKE_powerpc64 = "linux-powerpc64 CC='${CC}' GCC='${CC}'"
+EXTRA_OEMAKE_powerpc64le = "linux-powerpc64 CC='${CC}' GCC='${CC}'"
 EXTRA_OEMAKE_x86-64 = "linux-AMD64 CC='${CC}' GCC='${CC}'"
 EXTRA_OEMAKE_arm = "linux-arm CC='${CC}' GCC='${CC}'"
 EXTRA_OEMAKE = "linux CC='${CC}' GCC='${CC}'"
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index e66db1a090..f1a4efba26 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -37,6 +37,7 @@ LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
 LIBHUGETLBFS_ARCH_powerpc = "ppc"
 LIBHUGETLBFS_ARCH_powerpc64 = "ppc64"
+LIBHUGETLBFS_ARCH_powerpc64le = "ppc64"
 EXTRA_OEMAKE = "'ARCH=${LIBHUGETLBFS_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} BUILDTYPE=NATIVEONLY V=2"
 PARALLEL_MAKE = ""
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
index 09e7384882..b89fe6771c 100644
--- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
@@ -30,6 +30,7 @@ RDEPENDS_${PN}_arm = "dmidecode"
 RDEPENDS_${PN}_aarch64 = "dmidecode"
 RDEPENDS_${PN}_powerpc = "dmidecode"
 RDEPENDS_${PN}_powerpc64 = "dmidecode"
+RDEPENDS_${PN}_powerpc64le = "dmidecode"
 RDEPENDS_${PN}_append = " \
     perl \
     perl-module-file-basename \
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index c0d08db174..3555aff3cd 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -61,6 +61,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 COMPATIBLE_HOST_powerpc = "(null)"
 COMPATIBLE_HOST_powerpc64 = "(null)"
+COMPATIBLE_HOST_powerpc64le = "(null)"
 
 inherit systemd
 
diff --git a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
index 19767c311e..8c6cf7db20 100644
--- a/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
+++ b/meta-oe/recipes-devtools/concurrencykit/concurrencykit_git.bb
@@ -21,6 +21,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64).*-linux*"
 inherit autotools-brokensep
 
 PLAT_powerpc64 = "ppc64"
+PLAT_powerpc64le = "ppc64"
 PLAT ?= "${HOST_ARCH}"
 
 do_configure () {
diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index 08a0470b04..d0dc1c28dd 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -96,3 +96,4 @@ COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 COMPATIBLE_HOST_powerpc = "null"
 COMPATIBLE_HOST_powerpc64 = "null"
+COMPATIBLE_HOST_powerpc64le = "null"
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
index 02ac03eae3..29bba2d9a7 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
@@ -179,6 +179,7 @@ VALGRIND_linux-gnun32 = ''
 
 # Disable for powerpc64 with musl
 VALGRIND_libc-musl_powerpc64 = ''
+VALGRIND_libc-musl_powerpc64le = ''
 
 # RISC-V support for valgrind is not there yet
 VALGRIND_riscv64 = ""
diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb b/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
index 9b43b4a975..ff56d48043 100644
--- a/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
@@ -23,6 +23,7 @@ UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
 EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\""
 EXTRA_OEMAKE_append_powerpc = " ARCH=\"powerpc\""
 EXTRA_OEMAKE_append_powerpc64 = " ARCH=\"powerpc\" BITMODE=\"64\""
+EXTRA_OEMAKE_append_powerpc64le = " ARCH=\"powerpc\" BITMODE=\"64\""
 
 S = "${WORKDIR}/libpfm-${PV}"
 
diff --git a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
index 4e5b6ca33c..bab38e2509 100644
--- a/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
+++ b/meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
@@ -1,6 +1,7 @@
 require oprofile.inc
 
 DEPENDS_append_powerpc64 = " libpfm4"
+DEPENDS_append_powerpc64le = " libpfm4"
 
 SRC_URI[md5sum] = "bd998df5521ebedae31e71cd3fb6200b"
 SRC_URI[sha256sum] = "95ded8bde1ec39922f0af015981a67aec63e025a501e4dc04cd65d38f73647e6"
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index c327c45e66..245dfe22ca 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -30,6 +30,7 @@ LUA ?= "lua"
 LUA_mips64  = ""
 LUA_aarch64  = ""
 LUA_powerpc64  = ""
+LUA_powerpc64le  = ""
 LUA_powerpc  = ""
 
 # Note: both lua and libass are required to get on-screen-display (controls)
-- 
2.25.0


