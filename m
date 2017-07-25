Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 378C971957
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 04:58:27 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 123so2938005pgj.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 21:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1+X42EXKOe3nny2EBDtKKdX28iL9Qf8MA06uXY5MPEw=;
	b=sKh6MAHzagwWJ742y3IYQ7CRU80/f97O+Y2RVtZoxsTUSnVlV4JAUzOet5Yff4VUwL
	X6kAaUoPT0TN//7oFInMPanFniHRRN8O+2C1F/Gsd361wYIfcj9sp3y59Nwb10DVlxXN
	y7AFbzqiWaqrvlPZ5uF6H8B1myiLjG9hblatln+oytNtLVxOmC0PvYtM5A9YSRHLlea1
	AMhlT+Zc6ZYMbfkFLqNhHlL9fl//QwHKeweay03FcahiflU5GtuqtyvD0nIuHM++LuAI
	O3YfaY+qZxLKtDAHlFuZYge12Isrhclcck4BAl2rHZ9wQTxG11cl0eFb7HWNsywO+5Ss
	xcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1+X42EXKOe3nny2EBDtKKdX28iL9Qf8MA06uXY5MPEw=;
	b=cJE39hgepPMc5kM9hk4GeVnrJ5b7tN8Z6wP15jG+qEkkn22r6h1RLoGqpz3f2G0iyI
	gRlZuaYdi0wZpkm6mD0ep2IX5e2iKCxDH3rhLOl8thD4jySPRBoZt6Svno/oQH276nES
	0nWVEDtpMajaVraLb0GXj5OWVyZD+s0+s9hwEmfkIFBn0n8T1qKCx8Hb/JYzo5SzgopQ
	L4whrH/WrtVaLIzaUEOl0H7llQ2aeW1oL/elDFa7hxejDHd02d4rzPp2YLkS8dr24L0Y
	SBRngNLtsEnQD+4NbPaYvMYZq5tM62EGDNqlbDOfGAE3/wq5AuPZHdPDHJXbenNYOn6n
	6NFg==
X-Gm-Message-State: AIVw112ZaD1/EIrWPfvt4uc27MOYLODuyriUNbC92zxFr5kRF7b+qZm3
	0XqWvIJ5laMjLK2N
X-Received: by 10.84.128.46 with SMTP id 43mr20677868pla.113.1500958708803;
	Mon, 24 Jul 2017 21:58:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	124sm25442263pgi.62.2017.07.24.21.58.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 21:58:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jul 2017 21:58:16 -0700
Message-Id: <20170725045816.16297-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-oe[PATCH V2] efivar: Upgrade to 0.31
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
X-List-Received-Date: Tue, 25 Jul 2017 04:58:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v1 -> v2:
- Forward port the 0004-fix-unknow-option-for-gold-linker.patch

 ...some-extra-const-that-gcc-complains-about.patch | 44 ---------------
 ...Do-not-use-__bswap_constant_-16-32-macros.patch | 37 ++++++++++++
 ...-version-new-way-symbol-versioning-breaks.patch | 66 ----------------------
 .../efivar/efivar/0002-disable-static-build.patch  | 33 -----------
 .../0004-fix-unknow-option-for-gold-linker.patch   | 15 ++---
 .../fix-compile-failure-with-host-gcc-4.6.patch    | 13 ++---
 .../efivar/efivar/musl-strndupa.patch              | 17 ++++++
 .../efivar/{efivar_0.24.bb => efivar_0.31.bb}      |  9 ++-
 8 files changed, 69 insertions(+), 165 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that-gcc-complains-about.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symbol-versioning-breaks.patch
 delete mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch
 rename meta-oe/recipes-extended/efivar/{efivar_0.24.bb => efivar_0.31.bb} (83%)

diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that-gcc-complains-about.patch b/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that-gcc-complains-about.patch
deleted file mode 100644
index 4ae8cb90f..000000000
--- a/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that-gcc-complains-about.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 29a2dea16113b5a8e51de46437c6a9f7426c5867 Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Mon, 6 Feb 2017 14:28:19 -0500
-Subject: [PATCH 1/2] Remove some extra "const" that gcc complains about.
-
-One of these days I'll get these right.
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
----
- src/include/efivar/efiboot-loadopt.h | 4 ++--
- src/loadopt.c                        | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/include/efivar/efiboot-loadopt.h b/src/include/efivar/efiboot-loadopt.h
-index 07db5c4..efc29c6 100644
---- a/src/include/efivar/efiboot-loadopt.h
-+++ b/src/include/efivar/efiboot-loadopt.h
-@@ -32,8 +32,8 @@ extern ssize_t efi_loadopt_create(uint8_t *buf, ssize_t size,
- 
- extern efidp efi_loadopt_path(efi_load_option *opt, ssize_t limit)
- 	__attribute__((__nonnull__ (1)));
--extern const unsigned char const * efi_loadopt_desc(efi_load_option *opt,
--						    ssize_t limit)
-+extern const unsigned char * efi_loadopt_desc(efi_load_option *opt,
-+					      ssize_t limit)
- 	__attribute__((__visibility__ ("default")))
- 	__attribute__((__nonnull__ (1)));
- extern uint32_t efi_loadopt_attrs(efi_load_option *opt)
-diff --git a/src/loadopt.c b/src/loadopt.c
-index 64e333f..ec50722 100644
---- a/src/loadopt.c
-+++ b/src/loadopt.c
-@@ -336,7 +336,7 @@ teardown(void)
- 
- __attribute__((__nonnull__ (1)))
- __attribute__((__visibility__ ("default")))
--const unsigned char const *
-+const unsigned char *
- efi_loadopt_desc(efi_load_option *opt, ssize_t limit)
- {
- 	if (last_desc) {
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch b/meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
new file mode 100644
index 000000000..73a772186
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch
@@ -0,0 +1,37 @@
+From 98b33d4193998687aa3a78c097f7bd4c393e0c85 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 00:29:42 -0700
+Subject: [PATCH] makeguids: Do not use __bswap_constant_{16|32} macros
+
+not available on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/makeguids.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/makeguids.c b/src/makeguids.c
+index da2f5f7..daf821a 100644
+--- a/src/makeguids.c
++++ b/src/makeguids.c
+@@ -155,13 +155,13 @@ main(int argc, char *argv[])
+ #if BYTE_ORDER == BIG_ENDIAN\n\
+ #define cpu_to_be32(n) (n)\n\
+ #define cpu_to_be16(n) (n)\n\
+-#define cpu_to_le32(n) (__bswap_constant_32(n))\n\
+-#define cpu_to_le16(n) (__bswap_constant_16(n))\n\
++#define cpu_to_le32(n) ((uint32_t) ((n)>>24 | (n)>>8&0xff00 | (n)<<8&0xff0000 | (n)<<24))\n\
++#define cpu_to_le16(n) ((uint16_t) ((n)<<8 | (n)>>8))\n\
+ #else\n\
+ #define cpu_to_le32(n) (n)\n\
+ #define cpu_to_le16(n) (n)\n\
+-#define cpu_to_be32(n) (__bswap_constant_32(n))\n\
+-#define cpu_to_be16(n) (__bswap_constant_16(n))\n\
++#define cpu_to_be32(n) ((uint32_t) ((n)>>24 | (n)>>8&0xff00 | (n)<<8&0xff0000 | (n)<<24))\n\
++#define cpu_to_be16(n) ((uint16_t) ((n)<<8 | (n)>>8))\n\
+ #endif\n\
+ """);
+ 
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symbol-versioning-breaks.patch b/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symbol-versioning-breaks.patch
deleted file mode 100644
index 737b78b01..000000000
--- a/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symbol-versioning-breaks.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 31e655d2b5f66e772d9714422b7332bbaa60d2e6 Mon Sep 17 00:00:00 2001
-From: Peter Jones <pjones@redhat.com>
-Date: Mon, 6 Feb 2017 14:41:58 -0500
-Subject: [PATCH 2/2] New gcc version, new way symbol versioning breaks.
-
-Apparently I get to redo this every time there's a compiler release.
-Yaaaaaay.
-
-Anyway, the current method is to define the two compat things from the
-land before time as @libefivar.so.0 symbols and list them there in the
-link map.  Then we have the real one defined with another name, and set
-as efi_set_variable@@LIBEFIVAR_0.24.  Then to make there actually be a
-efi_set_variable symbol to link against, we create it as a weak alias.
-
-This is all completely absurd.
-
-Signed-off-by: Peter Jones <pjones@redhat.com>
----
- src/lib.c | 17 ++++++++++++-----
- 1 file changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/src/lib.c b/src/lib.c
-index 6a9b392..afa7d94 100644
---- a/src/lib.c
-+++ b/src/lib.c
-@@ -49,7 +49,7 @@ _efi_set_variable(efi_guid_t guid, const char *name, uint8_t *data,
- {
- 	return ops->set_variable(guid, name, data, data_size, attributes, 0600);
- }
--__asm__(".symver _efi_set_variable,_efi_set_variable@");
-+__asm__(".symver _efi_set_variable,_efi_set_variable@libefivar.so.0");
- 
- int
- __attribute__((__nonnull__ (2, 3)))
-@@ -59,17 +59,24 @@ _efi_set_variable_variadic(efi_guid_t guid, const char *name, uint8_t *data,
- {
- 	return ops->set_variable(guid, name, data, data_size, attributes, 0600);
- }
--__asm__(".symver _efi_set_variable_variadic,efi_set_variable@");
-+__asm__(".symver _efi_set_variable_variadic,efi_set_variable@libefivar.so.0");
- 
- int
- __attribute__((__nonnull__ (2, 3)))
- __attribute__((__visibility__ ("default")))
--efi_set_variable(efi_guid_t guid, const char *name, uint8_t *data,
--		 size_t data_size, uint32_t attributes, mode_t mode)
-+_efi_set_variable_mode(efi_guid_t guid, const char *name, uint8_t *data,
-+		       size_t data_size, uint32_t attributes, mode_t mode)
- {
- 	return ops->set_variable(guid, name, data, data_size, attributes, mode);
- }
--__asm__(".symver efi_set_variable,efi_set_variable@@LIBEFIVAR_0.24");
-+__asm__(".symver _efi_set_variable_mode,efi_set_variable@@LIBEFIVAR_0.24");
-+
-+int
-+__attribute__((__nonnull__ (2, 3)))
-+__attribute__((__visibility__ ("default")))
-+efi_set_variable(efi_guid_t guid, const char *name, uint8_t *data,
-+		 size_t data_size, uint32_t attributes, mode_t mode)
-+	__attribute((weak, alias ("_efi_set_variable_mode")));
- 
- int
- __attribute__((__nonnull__ (2, 3)))
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch b/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
deleted file mode 100644
index 951b15921..000000000
--- a/meta-oe/recipes-extended/efivar/efivar/0002-disable-static-build.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 126e0d3c1ad74cf5b0abe9e98ec444bcc3c83159 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen.kooi@linaro.org>
-Date: Fri, 4 Mar 2016 14:53:55 +0100
-Subject: [PATCH 2/2] disable static build
-
-Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
-
-Upstream-Status: Inappropriate [meta-oe specific]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- src/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 1829d22..c7a0ca3 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -8,9 +8,9 @@ include $(TOPDIR)/Make.defaults
- 
- LIBTARGETS=libefivar.so libefiboot.so
- STATICLIBTARGETS=libefivar.a libefiboot.a
--BINTARGETS=efivar efivar-static
-+BINTARGETS=efivar
- PCTARGETS=efivar.pc efiboot.pc
--TARGETS=$(LIBTARGETS) $(STATICLIBTARGETS) $(BINTARGETS) $(PCTARGETS)
-+TARGETS=$(LIBTARGETS) $(BINTARGETS) $(PCTARGETS)
- 
- LIBEFIBOOT_SOURCES = crc32.c creator.c disk.c gpt.c linux.c loadopt.c
- LIBEFIBOOT_OBJECTS = $(patsubst %.c,%.o,$(LIBEFIBOOT_SOURCES))
--- 
-2.4.3
-
diff --git a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
index 5d50c1906..96d0c6b3b 100644
--- a/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
+++ b/meta-oe/recipes-extended/efivar/efivar/0004-fix-unknow-option-for-gold-linker.patch
@@ -23,16 +23,13 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  gcc.specs | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gcc.specs b/gcc.specs
-index 24fabc2..5b0fdef 100644
---- a/gcc.specs
-+++ b/gcc.specs
+Index: git/gcc.specs
+===================================================================
+--- git.orig/gcc.specs
++++ git/gcc.specs
 @@ -14,4 +14,4 @@
  + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
  
  *link:
--+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined --add-needed -z now --build-id %{!static:%{!shared:-PIE}} %{shared:-z relro -PIC} %{static:%<pie}
-++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro -fPIC} %{static:%<pie}
--- 
-2.8.1
-
+-+ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined --add-needed -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
+++ %{!static:--fatal-warnings} --no-undefined-version --no-allow-shlib-undefined -z now --build-id %{!static:%{!shared:-pie}} %{shared:-z relro} %{static:%<pie}
diff --git a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch b/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
index 1c68a2934..e3fa2e1c1 100644
--- a/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
+++ b/meta-oe/recipes-extended/efivar/efivar/fix-compile-failure-with-host-gcc-4.6.patch
@@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  gcc.specs | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/gcc.specs b/gcc.specs
-index 0d4bbda..3802ca6 100644
---- a/gcc.specs
-+++ b/gcc.specs
+Index: git/gcc.specs
+===================================================================
+--- git.orig/gcc.specs
++++ git/gcc.specs
 @@ -2,13 +2,13 @@
  + -D_GNU_SOURCE
  
@@ -35,11 +35,8 @@ index 0d4bbda..3802ca6 100644
  + %(efivar_cpp_options)
  
  *cc1_options:
--+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants -flto -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
+-+ %(efivar_cpp_options) -Wmaybe-uninitialized -fno-merge-constants -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
 ++ %(efivar_cpp_options) -fno-merge-constants -fvisibility=hidden %{!r:%{!fpie:%{!fPIE:%{!fpic:%{!fPIC:%{!fno-pic:-fPIE}}}}}}
  
  *self_spec:
  + %{!shared:%{!static:%{!r:-pie}}} %{static:-Wl,-no-fatal-warnings -Wl,-static -static -Wl,-z,relro,-z,now}
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch b/meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch
new file mode 100644
index 000000000..fc8f8c8b2
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/musl-strndupa.patch
@@ -0,0 +1,17 @@
+Taken from void linux
+
+Index: git/src/linux.c
+===================================================================
+--- git.orig/src/linux.c
++++ git/src/linux.c
+@@ -40,6 +40,10 @@
+ #include <efivar.h>
+ #include <efiboot.h>
+ 
++#if !defined(__GLIBC__)
++#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
++#endif
++
+ #include "dp.h"
+ #include "linux.h"
+ #include "util.h"
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
similarity index 83%
rename from meta-oe/recipes-extended/efivar/efivar_0.24.bb
rename to meta-oe/recipes-extended/efivar/efivar_0.31.bb
index 877ca9045..10dde896e 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.31.bb
@@ -12,13 +12,12 @@ inherit pkgconfig
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRCREV = "963cb2e5adc145fe00717f94e382f2973f80e753"
+SRCREV = "11324799c68193116e1dd5f94b416591bd324f90"
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
-           file://0002-disable-static-build.patch \
            file://allow-multi-definitions-for-native.patch \
-           file://0001-Remove-some-extra-const-that-gcc-complains-about.patch \
-           file://0002-New-gcc-version-new-way-symbol-versioning-breaks.patch \
-"
+           file://0001-makeguids-Do-not-use-__bswap_constant_-16-32-macros.patch \
+           file://musl-strndupa.patch \
+           "
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
                                 ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'file://0004-fix-unknow-option-for-gold-linker.patch', '', d)} \
-- 
2.13.3


