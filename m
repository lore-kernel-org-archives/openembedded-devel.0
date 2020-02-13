Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 19A05608DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 05:55:15 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id d5so1886885pjz.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 21:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B19euo4llC7+FkrN+ViTBMDynrmkLqmKXplaU6pJf5Q=;
	b=m2RRmy6xXfhFPXew/T070TXL9PlKTDs86PSlef2weMqhn55JlMjeCxo835hnta5Ywb
	0zwcMxQvhqTztnrmQH/Mj2nukFlckIlwpcHRORuTTpMlIBTxZkuFDs8aGHtwx/6y97I3
	v0Bnh+cBL//8ozaRNU0IgW7tiQe+fIvL55nEUU+VfR+zj/cjdniC5h4+toVK26uPvsPF
	ayfqHbp0RJLtRIqDVt0aU358ZNerUrwOh2R7/mfbbHsERuT64faFXAGwOJC7uuEoXjYE
	kye4zqGIF2u7LJjE29ULbzY3GqIRlrvoejKWjpoHFzmMMJghjjjyqyt9EelmUU9wzWpq
	foJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=B19euo4llC7+FkrN+ViTBMDynrmkLqmKXplaU6pJf5Q=;
	b=qmj5EkGts0Mh0UHMhnLMgeASPi4Jq+JjBCZM+m5dWLswySG0B+lCdkavn2pCO49dSt
	6W16G73os03Nwobo1lwrNwygb3m+Twfdwl7luUWG76PKDeCotKVkIQ8E9AEokfxaiuDc
	5yZlw2tmLwakLsyDffVCAGaD/E48/Jd/N7UjqxYn9EnaJF1OvOLOi8v3/fvDmcvx41RK
	yz2FOq/vVam4KOTplwpLuZMVyeKisWtozoHUIbsFxns+CAvIoFjTu8/BNVtVIImQEZzJ
	HG6BgB2wdlUGEg6NdfP/0qiwfUEXu+JJ9t8LKnxDR5QdmdIMg5iCLVA/KnttX7EbaMrz
	OTMw==
X-Gm-Message-State: APjAAAUxStmrDXl87NirwsdEPS1/F9+/Ah7E1NMIkDIjo07172ZXP3R7
	G7mWf5MXEWrjvKSqQD6Wf7JTZbuFwUw=
X-Google-Smtp-Source: APXvYqwMTfpCOf0drnOIQ8gnki0H4SkJ6o0Cx/6u0hCZf7Ng4lVaE3aJtippSfVedVwkQiWX0o3pmA==
X-Received: by 2002:a17:902:a616:: with SMTP id
	u22mr11928411plq.173.1581573316286; 
	Wed, 12 Feb 2020 21:55:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	v8sm1152241pfn.172.2020.02.12.21.55.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 21:55:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Feb 2020 21:55:19 -0800
Message-Id: <20200213055519.1978873-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-grpcio: Upgrade to 1.27.1
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
X-List-Received-Date: Thu, 13 Feb 2020 05:55:16 -0000
Content-Transfer-Encoding: 8bit

Delete gettid patch, fixed differenty upstream
Add code to use cross compiler in setup.py

Define GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY so it does not use
SYS_clock_gettime syscalls since it does not work when 64bit time_t is
used on 32bit arches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Do-not-mix-C-and-C-compiler-options.patch | 44 ++++++++++++++-----
 .../python/python-grpcio/gettid.patch         | 26 -----------
 .../python-grpcio/ppc-boringssl-support.patch |  2 +-
 .../python-grpcio/riscv64_support.patch       |  2 +-
 ...pcio_1.19.0.bb => python-grpcio_1.27.1.bb} | 11 ++---
 5 files changed, 40 insertions(+), 45 deletions(-)
 delete mode 100644 recipes-devtools/python/python-grpcio/gettid.patch
 rename recipes-devtools/python/{python-grpcio_1.19.0.bb => python-grpcio_1.27.1.bb} (74%)

diff --git a/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index f17f048..131daac 100644
--- a/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/recipes-devtools/python/python-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -20,21 +20,45 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/setup.py
 +++ b/setup.py
-@@ -145,7 +145,7 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.
+@@ -144,9 +144,10 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.
+ 
+ def check_linker_need_libatomic():
+   """Test if linker on system needs libatomic."""
++  compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'cc'
+   code_test = (b'#include <atomic>\n' +
+                b'int main() { return std::atomic<int64_t>{}; }')
+-  cc_test = subprocess.Popen(['cc', '-x', 'c++', '-std=c++11', '-'],
++  cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c++', '-std=c++11', '-'],
+                              stdin=PIPE,
+                              stdout=PIPE,
+                              stderr=PIPE)
+@@ -163,7 +164,7 @@ def check_linker_need_libatomic():
  EXTRA_ENV_COMPILE_ARGS = os.environ.get('GRPC_PYTHON_CFLAGS', None)
  EXTRA_ENV_LINK_ARGS = os.environ.get('GRPC_PYTHON_LDFLAGS', None)
  if EXTRA_ENV_COMPILE_ARGS is None:
 -  EXTRA_ENV_COMPILE_ARGS = ' -std=c++11'
-+  EXTRA_ENV_COMPILE_ARGS = ""
-   if 'win32' in sys.platform and sys.version_info < (3, 5):
-     EXTRA_ENV_COMPILE_ARGS += ' -D_hypot=hypot'
-     # We use define flags here and don't directly add to DEFINE_MACROS below to
-@@ -157,7 +157,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
-     else:
-       EXTRA_ENV_COMPILE_ARGS += ' -D_ftime=_ftime64 -D_timeb=__timeb64'
++  EXTRA_ENV_COMPILE_ARGS = ' '
+   if 'win32' in sys.platform:
+     if sys.version_info < (3, 5):
+       EXTRA_ENV_COMPILE_ARGS += ' -D_hypot=hypot'
+@@ -180,7 +181,7 @@ if EXTRA_ENV_COMPILE_ARGS is None:
+       # available dynamically
+       EXTRA_ENV_COMPILE_ARGS += ' /MT'
    elif "linux" in sys.platform:
 -    EXTRA_ENV_COMPILE_ARGS += ' -std=gnu99 -fvisibility=hidden -fno-wrapv -fno-exceptions'
 +    EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
    elif "darwin" in sys.platform:
-     EXTRA_ENV_COMPILE_ARGS += ' -fvisibility=hidden -fno-wrapv -fno-exceptions'
- EXTRA_ENV_COMPILE_ARGS += ' -DPB_FIELD_32BIT'
+     EXTRA_ENV_COMPILE_ARGS += ' -stdlib=libc++ -fvisibility=hidden -fno-wrapv -fno-exceptions'
+ 
+--- a/src/python/grpcio/commands.py
++++ b/src/python/grpcio/commands.py
+@@ -216,7 +216,8 @@ class BuildExt(build_ext.build_ext):
+             when invoked in C mode. GCC is okay with this, while clang is not.
+             """
+             # TODO(lidiz) Remove the generated a.out for success tests.
+-            cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
++            compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'cc'
++            cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c', '-std=c++11', '-'],
+                                        stdin=subprocess.PIPE,
+                                        stdout=subprocess.PIPE,
+                                        stderr=subprocess.PIPE)
diff --git a/recipes-devtools/python/python-grpcio/gettid.patch b/recipes-devtools/python/python-grpcio/gettid.patch
deleted file mode 100644
index fb15cf7..0000000
--- a/recipes-devtools/python/python-grpcio/gettid.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-use glibc provided gettid API for glibc 2.30+
-
-glibc 2.30 introduced this function see [1]
-so it's best to detect it
-and provide fallback only if it's not present
-
-[1] https://sourceware.org/bugzilla/show_bug.cgi?id=6399
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/src/core/lib/gpr/log_linux.cc
-+++ b/src/core/lib/gpr/log_linux.cc
-@@ -40,7 +40,13 @@
- #include <time.h>
- #include <unistd.h>
- 
-+#if  defined(__GLIBC__)
-+#if !__GLIBC_PREREQ(2,29)
- static long gettid(void) { return syscall(__NR_gettid); }
-+#endif
-+#else
-+static long gettid(void) { return syscall(__NR_gettid); }
-+#endif
- 
- void gpr_log(const char* file, int line, gpr_log_severity severity,
-              const char* format, ...) {
diff --git a/recipes-devtools/python/python-grpcio/ppc-boringssl-support.patch b/recipes-devtools/python/python-grpcio/ppc-boringssl-support.patch
index 6435abb..8ac2aef 100644
--- a/recipes-devtools/python/python-grpcio/ppc-boringssl-support.patch
+++ b/recipes-devtools/python/python-grpcio/ppc-boringssl-support.patch
@@ -5,7 +5,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/third_party/boringssl/include/openssl/base.h
 +++ b/third_party/boringssl/include/openssl/base.h
-@@ -95,6 +95,9 @@ extern "C" {
+@@ -99,6 +99,9 @@ extern "C" {
  #elif (defined(__PPC64__) || defined(__powerpc64__)) && defined(_LITTLE_ENDIAN)
  #define OPENSSL_64_BIT
  #define OPENSSL_PPC64LE
diff --git a/recipes-devtools/python/python-grpcio/riscv64_support.patch b/recipes-devtools/python/python-grpcio/riscv64_support.patch
index fef7d9e..b55d50b 100644
--- a/recipes-devtools/python/python-grpcio/riscv64_support.patch
+++ b/recipes-devtools/python/python-grpcio/riscv64_support.patch
@@ -4,7 +4,7 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/third_party/boringssl/include/openssl/base.h
 +++ b/third_party/boringssl/include/openssl/base.h
-@@ -104,6 +104,9 @@ extern "C" {
+@@ -108,6 +108,9 @@ extern "C" {
  #elif defined(__mips__) && defined(__LP64__)
  #define OPENSSL_64_BIT
  #define OPENSSL_MIPS64
diff --git a/recipes-devtools/python/python-grpcio_1.19.0.bb b/recipes-devtools/python/python-grpcio_1.27.1.bb
similarity index 74%
rename from recipes-devtools/python/python-grpcio_1.19.0.bb
rename to recipes-devtools/python/python-grpcio_1.27.1.bb
index 8a5f71a..6768e7e 100644
--- a/recipes-devtools/python/python-grpcio_1.19.0.bb
+++ b/recipes-devtools/python/python-grpcio_1.27.1.bb
@@ -5,16 +5,12 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "188565f150f34d1927b87e014f0f4b73"
-SRC_URI[sha256sum] = "2ddbca16c2e7b3f2ffc6e34c7cfa6886fb01de9f156ad3f77b72ad652d632097"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-grpcio:"
-
 SRC_URI_append_class-target = " file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
                                 file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
-                                file://gettid.patch \
 "
+SRC_URI[md5sum] = "ccaf4e7eb4f031d926fb80035d193b98"
+SRC_URI[sha256sum] = "a899725d34769a498ecd3be154021c4368dd22bdc69473f6ec46779696f626c4"
 
 DEPENDS_append = " ${PYTHON_PN}-protobuf"
 
@@ -28,7 +24,8 @@ RDEPENDS_${PN} = "\
     python-futures \
 "
 
+export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
+
 CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.25.0


