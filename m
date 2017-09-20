Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 240A06093C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Sep 2017 04:14:41 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f84so722164pfj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 21:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wY0MRVriW/NOca7cDxCmr56tfpr9O+PR0PPZaDWQy7Q=;
	b=XGOB8F1Fnb2aIuveg+OtcIWNUyrUSzsxBl/b0Th0w1ZNcVPq6pN5uLB6WvhULeLXgD
	wX1G+Hzt2zt3iJ3AFHxx0sttFnou6x8ZwWwfVyEoQRevNbS5JkiLKrXpvIX4kxExdwm5
	ozgBZAgWGrfsADd09Ux/FhFR3VwTVYHvvSaGZbF+EEvZFv1lPdD0WwFEbXZ10Cm60DbT
	eG4dGUmRuAR7KoZTUv638FyM1br2sH7YuSqgWlj+axSxGOu7iJPBb7xcNefpY3PP5QKr
	0HNhTS0/NDN6q1FczjPGO/sSRuzRSd7P2RhEOmzQB192/6Jc9kchQ0BE6jIC5JDr49Ol
	KpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wY0MRVriW/NOca7cDxCmr56tfpr9O+PR0PPZaDWQy7Q=;
	b=NX/TfzYYWXub5SKH6pvy5cga3Z8c70j/7PEZFH8Z4GSPtlzs/02eHSIeUX3njRnHzO
	oBHGVUhfDy1MDjjrygogvp3DTtuL6sv0cs444ExItTVG9ljSrMlXDXC75KnYE9SQg8gb
	jxcBmS79MNAwSAEsX1o3B4Hbkt71RXh2mkVZPUhXSzPhdqBb3RZBFaY1+jDNEiYQJ1k2
	yAX3EZbkz8MI7e/s2LcVTunostgx1JZXnF9hHbV76kU14EPNE6Ir2JycbdpcpH93Mc8G
	PrjGqcatn0HwnM+wL24uO/By2d43EOy/qL5+xdX/WFXKo/id4aqgS5X6M9UAXjAAuu8e
	UsDQ==
X-Gm-Message-State: AHPjjUjpprEl8H1UBhmfx7bz/2LC8AkELuHfktwsuowc7wUnlO1fhb5L
	SBSgm8n+nVCtAQ0QZB7RZYVThw==
X-Google-Smtp-Source: AOwi7QB8mHJ0KvTlKCRzJHKBPvwZvIkKrE+rvJF5k07/ocytHrigxYIDsf6zVE+SYUwO51g1Rcfphw==
X-Received: by 10.159.216.145 with SMTP id s17mr794182plp.35.1505880883111;
	Tue, 19 Sep 2017 21:14:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-158-54-208.hsd1.ca.comcast.net.
	[73.158.54.208]) by smtp.gmail.com with ESMTPSA id
	w12sm5277628pfk.83.2017.09.19.21.14.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 21:14:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 21:14:29 -0700
Message-Id: <20170920041429.8047-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920041429.8047-1-raj.khem@gmail.com>
References: <20170920041429.8047-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] mongodb: Fix build on aarch64
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
X-List-Received-Date: Wed, 20 Sep 2017 04:14:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...FPMathLib20U1-Check-for-__DEFINED_wchar_t.patch | 36 ++++++++++++++++
 .../mongodb/mongodb/arm64-support.patch            | 43 +++++++++++++++++++
 .../mongodb/disable-hw-crc32-on-arm64-s390x.patch  | 50 ++++++++++++++++++++++
 meta-oe/recipes-support/mongodb/mongodb_git.bb     |  3 ++
 4 files changed, 132 insertions(+)
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/arm64-support.patch
 create mode 100644 meta-oe/recipes-support/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch

diff --git a/meta-oe/recipes-support/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch b/meta-oe/recipes-support/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
new file mode 100644
index 000000000..97f5a1d43
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
@@ -0,0 +1,36 @@
+From fbfceebce2121831904f2f7115252dd03b413a6d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Sep 2017 18:52:53 -0700
+Subject: [PATCH] IntelRDFPMathLib20U1: Check for __DEFINED_wchar_t
+
+This is defined by musl if wchar_t is already defined
+
+avoids errors like
+
+src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h:46:15: error: typedef redefinition with different types
+      ('int' vs 'unsigned int')
+typedef int   wchar_t;
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h b/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
+index 2b3f76db86..cc80305775 100755
+--- a/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
++++ b/src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
+@@ -42,7 +42,7 @@
+ #include <ctype.h>
+ 
+ // Fix system header issue on Sun solaris and define required type by ourselves
+-#if !defined(_WCHAR_T) && !defined(_WCHAR_T_DEFINED) && !defined(__QNX__)
++#if !defined(_WCHAR_T) && !defined(_WCHAR_T_DEFINED) && !defined(__QNX__) && !defined(__DEFINED_wchar_t)
+ typedef int   wchar_t;
+ #endif
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/mongodb/mongodb/arm64-support.patch b/meta-oe/recipes-support/mongodb/mongodb/arm64-support.patch
new file mode 100644
index 000000000..9046bb2f4
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/arm64-support.patch
@@ -0,0 +1,43 @@
+Add alises for arm64 which is same as aarch64
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: git/SConstruct
+===================================================================
+--- git.orig/SConstruct
++++ git/SConstruct
+@@ -990,6 +990,7 @@ elif endian == "big":
+ processor_macros = {
+     'arm'     : { 'endian': 'little', 'defines': ('__arm__',) },
+     'aarch64' : { 'endian': 'little', 'defines': ('__arm64__', '__aarch64__')},
++    'arm64'   : { 'endian': 'little', 'defines': ('__arm64__', '__aarch64__')},
+     'i386'    : { 'endian': 'little', 'defines': ('__i386', '_M_IX86')},
+     'ppc64le' : { 'endian': 'little', 'defines': ('__powerpc64__',)},
+     's390x'   : { 'endian': 'big',    'defines': ('__s390x__',)},
+Index: git/src/third_party/IntelRDFPMathLib20U1/SConscript
+===================================================================
+--- git.orig/src/third_party/IntelRDFPMathLib20U1/SConscript
++++ git/src/third_party/IntelRDFPMathLib20U1/SConscript
+@@ -301,7 +301,7 @@ if processor == 'i386':
+ elif processor == 'arm':
+     cpp_defines['IA32'] = '1'
+     cpp_defines['ia32'] = '1'
+-elif processor == "aarch64":
++elif processor == "aarch64" or processor == 'arm64':
+     cpp_defines['efi2'] = '1'
+     cpp_defines['EFI2'] = '1'
+ # Using 64 bit little endian
+Index: git/src/third_party/wiredtiger/SConscript
+===================================================================
+--- git.orig/src/third_party/wiredtiger/SConscript
++++ git/src/third_party/wiredtiger/SConscript
+@@ -139,7 +139,7 @@ condition_map = {
+     'POSIX_HOST'   : not env.TargetOSIs('windows'),
+     'WINDOWS_HOST' : env.TargetOSIs('windows'),
+ 
+-    'ARM64_HOST'   : env['TARGET_ARCH'] == 'aarch64',
++    'ARM64_HOST'   : env['TARGET_ARCH'] in ('aarch64', 'arm64'),
+     'POWERPC_HOST' : env['TARGET_ARCH'] == 'ppc64le',
+     'X86_HOST'     : env['TARGET_ARCH'] == 'x86_64',
+     'ZSERIES_HOST' : env['TARGET_ARCH'] == 's390x',
diff --git a/meta-oe/recipes-support/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch b/meta-oe/recipes-support/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch
new file mode 100644
index 000000000..5c5c20ce3
--- /dev/null
+++ b/meta-oe/recipes-support/mongodb/mongodb/disable-hw-crc32-on-arm64-s390x.patch
@@ -0,0 +1,50 @@
+imported from debian
+
+Upstream-Status: Pending
+Index: git/src/third_party/wiredtiger/SConscript
+===================================================================
+--- git.orig/src/third_party/wiredtiger/SConscript
++++ git/src/third_party/wiredtiger/SConscript
+@@ -169,7 +169,9 @@ if useSnappy:
+ # If not available at runtime, we fall back to software in some cases.
+ #
+ # On zSeries we may disable because SLES 11 kernel doe not support the instructions.
+-if not (env['TARGET_ARCH'] == 's390x' and get_option("use-s390x-crc32") == "off"):
++# Debian: disable hardware-assisted crc32 on s390x and arm64, as at least the
++# buildd's do not support the instructions.
++if env['TARGET_ARCH'] not in ('s390x', 'arm64', 'aarch64'):
+     env.Append(CPPDEFINES=["HAVE_CRC32_HARDWARE"])
+ 
+ wtlib = env.Library(
+Index: git/src/third_party/wiredtiger/dist/filelist
+===================================================================
+--- git.orig/src/third_party/wiredtiger/dist/filelist
++++ git/src/third_party/wiredtiger/dist/filelist
+@@ -54,7 +54,6 @@ src/checksum/power8/crc32_wrapper.c	POWE
+ src/checksum/software/checksum.c
+ src/checksum/x86/crc32-x86.c		X86_HOST
+ src/checksum/zseries/crc32-s390x.c	ZSERIES_HOST
+-src/checksum/zseries/crc32le-vx.sx	ZSERIES_HOST
+ src/config/config.c
+ src/config/config_api.c
+ src/config/config_check.c
+Index: git/src/third_party/wiredtiger/src/checksum/zseries/crc32-s390x.c
+===================================================================
+--- git.orig/src/third_party/wiredtiger/src/checksum/zseries/crc32-s390x.c
++++ git/src/third_party/wiredtiger/src/checksum/zseries/crc32-s390x.c
+@@ -78,6 +78,7 @@ unsigned int __wt_crc32c_le(unsigned int
+ 		return crc;                                                 \
+ 	}
+ 
++#if defined(HAVE_CRC32_HARDWARE)
+ /* Main CRC-32 functions */
+ DEFINE_CRC32_VX(__wt_crc32c_le_vx, __wt_crc32c_le_vgfm_16, __wt_crc32c_le)
+ 
+@@ -90,6 +91,7 @@ __wt_checksum_hw(const void *chunk, size
+ {
+ 	return (~__wt_crc32c_le_vx(0xffffffff, chunk, len));
+ }
++#endif
+ 
+ #endif
+ 
diff --git a/meta-oe/recipes-support/mongodb/mongodb_git.bb b/meta-oe/recipes-support/mongodb/mongodb_git.bb
index 547f60850..ab8ade127 100644
--- a/meta-oe/recipes-support/mongodb/mongodb_git.bb
+++ b/meta-oe/recipes-support/mongodb/mongodb_git.bb
@@ -18,6 +18,9 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
            file://0001-Use-strerror_r-only-on-glibc-systems.patch \
            file://0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch \
            file://0003-Conditionalize-glibc-specific-strerror_r.patch \
+           file://arm64-support.patch \
+           file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
+           file://disable-hw-crc32-on-arm64-s390x.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0004-wiredtiger-Disable-strtouq-on-musl.patch \
-- 
2.14.1


