Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.5261.1612511182936398548
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QXZcpyQe;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id nm1so3173750pjb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 23:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ljBR1+T5GjZTdMNlldONSscOwwE79z7JRlICcb9ecQI=;
        b=QXZcpyQeNOnvvROmm4C3FbUpBfl0CCbC06+xvc9GO82JjAypauoDOJXG90gx7szL69
         AjFt9N7S3DOcU3Rs1XJC3FexE4lQR861oC1F190lRNg9MNkJy7pe11y7O5ZZXJxj9AzP
         iu3859y1qTAVKOxCAF3/r8NRHx/X+2oPqjfDCXmNaxgTqlAAdwGh0XQYMb4Z7XNU7dpx
         iMuPiY1OorDTyW5e29WByVoUiYu9skX1cQjjOuxMRIl9ym3eUsMQfnfTqNsKNoD+NvpE
         MrbK0adxA6xw2CaOznR4i7uEIOxoqj2goayZi0PZJAxKmii0rjxmULCCYLoy+7/vfwE6
         f5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ljBR1+T5GjZTdMNlldONSscOwwE79z7JRlICcb9ecQI=;
        b=ocPGD4JuUF5tfinv4TfOv59jasn48fXuqy3NFomTISVyTnxF7WOCrnp+1TfnrdlcE/
         2fJQVOAc4N6nbP1wcFZ54wMxjr1bxqawsvo4EVJ3Oy74O5jD0ioOmylX+jHI/m+PSPad
         ZwOP3FwUMjCgyic/OlMFy3soLB+LlwMsO2PAHHFX0458FqZ4SQfA9otah+9ipuVdp1Lz
         h4GWKzf2d1rWzdwWmZAIcIABkgGhTupxdcLAdIGu9X/lenU5mYkw/Y88+sLO0NtckKJH
         Dz/ydc9PfCSVO1JRBkZeaDnnrRgc7AS/E0Qxy1zGWenDwlz178wKsZ8aJ2JVEP7aLS91
         k/xQ==
X-Gm-Message-State: AOAM530nsd8GkqYymA3tExFOyLl9VYFlBmBC5pqre+hP5r3s2kTJjWbt
	vbmND7yoeusy1ysZwNN8uQQ2gGBapVrmcw==
X-Google-Smtp-Source: ABdhPJxGccU0LcE7HN1B/f7PsSe1U/0+LV7+1qKtYV8VGCGKKs4gCKDywG86wJdaOYKYoRjRq+6Khw==
X-Received: by 2002:a17:90b:3787:: with SMTP id mz7mr2890877pjb.96.1612511181509;
        Thu, 04 Feb 2021 23:46:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id s13sm3317423pgq.40.2021.02.04.23.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 23:46:21 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 1/2] klibc: Upgrade to 2.0.8 release
Date: Thu,  4 Feb 2021 23:46:17 -0800
Message-Id: <20210205074618.53017-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust klcc to work with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 ...-ulocked_-fgets-fread-fwrite-aliases.patch | 49 -------------------
 ...-path-to-compiler-headers-via-isyste.patch | 28 -----------
 ...-print-libgcc-file-name-instead-of-p.patch | 28 -----------
 ...o-not-set-a-fallback-march-and-mtune.patch |  2 -
 ...libc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch |  6 +--
 .../0001-klibc-add-getrandom-syscall.patch    |  7 +--
 ...bc_2.0.4-add-kexec_file_load-syscall.patch |  7 +--
 .../klibc/files/cross-clang.patch             | 24 +++++++++
 .../klcc-cross-accept-clang-options.patch     | 14 +++++-
 .../klibc/files/use-env-for-perl.patch        |  2 -
 ...lcc-cross_2.0.7.bb => klcc-cross_2.0.8.bb} |  0
 ...s_2.0.7.bb => klibc-static-utils_2.0.8.bb} |  0
 ...bc-utils_2.0.7.bb => klibc-utils_2.0.8.bb} |  0
 .../recipes-devtools/klibc/klibc.inc          |  8 +--
 .../klibc/{klibc_2.0.7.bb => klibc_2.0.8.bb}  |  0
 ...011-purgatory-Makefile-adapt-to-klcc.patch | 10 ++--
 .../kexec-tools-klibc/include_next.patch      | 22 +++++++++
 .../kexec/kexec-tools-klibc_git.bb            |  4 +-
 18 files changed, 72 insertions(+), 139 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch
 rename meta-initramfs/recipes-devtools/klibc/{klcc-cross_2.0.7.bb => klcc-cross_2.0.8.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-static-utils_2.0.7.bb => klibc-static-utils_2.0.8.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc-utils_2.0.7.bb => klibc-utils_2.0.8.bb} (100%)
 rename meta-initramfs/recipes-devtools/klibc/{klibc_2.0.7.bb => klibc_2.0.8.bb} (100%)
 create mode 100644 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
deleted file mode 100644
index eee144dc4a..0000000000
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 241f423a015279cb29b7ad1a34386ef1c32007fc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 9 Dec 2018 16:47:16 -0800
-Subject: [PATCH] Define ulocked_{fgets|fread|fwrite} aliases
-
-latest clang converts the normal calls to the unlocked variant
-equivalents
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Andrea Adami <andrea.adami@gmail.com>
----
- usr/klibc/fgets.c   | 2 ++
- usr/klibc/fread2.c  | 2 ++
- usr/klibc/fwrite2.c | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/usr/klibc/fgets.c b/usr/klibc/fgets.c
-index dbf742c6..2e9fcb65 100644
---- a/usr/klibc/fgets.c
-+++ b/usr/klibc/fgets.c
-@@ -25,3 +25,5 @@ char *fgets(char *s, int n, FILE *f)
- 
- 	return s;
- }
-+char *fgets_unlocked(char *s, int n, FILE *f)
-+  __alias("fgets");
-diff --git a/usr/klibc/fread2.c b/usr/klibc/fread2.c
-index 7dca56b1..5c234766 100644
---- a/usr/klibc/fread2.c
-+++ b/usr/klibc/fread2.c
-@@ -11,3 +11,5 @@ size_t fread(void *ptr, size_t size, size_t nmemb, FILE * f)
- {
- 	return _fread(ptr, size * nmemb, f) / size;
- }
-+size_t fread_unlocked(void *ptr, size_t size, size_t nmemb, FILE *f)
-+  __alias("fread");
-diff --git a/usr/klibc/fwrite2.c b/usr/klibc/fwrite2.c
-index cebc017c..3e0bb57d 100644
---- a/usr/klibc/fwrite2.c
-+++ b/usr/klibc/fwrite2.c
-@@ -11,3 +11,5 @@ size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE * f)
- {
- 	return _fwrite(ptr, size * nmemb, f) / size;
- }
-+size_t fwrite_unlocked(void *ptr, size_t size, size_t nmemb, FILE *f)
-+  __alias("fwrite");
--- 
-2.19.2
-
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
deleted file mode 100644
index 181dcfb6de..0000000000
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4b4147b76518d31a88fb2c58cdbf2236e159a25c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Sep 2017 23:10:54 -0700
-Subject: [PATCH] Kbuild.klibc: Add path to compiler headers via -isystem
-
-We need to include this path so it can find compiler headers e.g.
-stdarg.h which is called from wrapper stdarg.h using include_next
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- scripts/Kbuild.klibc | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/Kbuild.klibc b/scripts/Kbuild.klibc
-index 101f86f..1d5cdc4 100644
---- a/scripts/Kbuild.klibc
-+++ b/scripts/Kbuild.klibc
-@@ -105,7 +105,8 @@ KLIBCOBJCOPY     := $(OBJCOPY)
- KLIBCOBJDUMP     := $(OBJDUMP)
- 
- # klibc include paths
--KLIBCCPPFLAGS    := -nostdinc -iwithprefix include \
-+KLIBCCPPFLAGS    := -nostdinc -iwithprefix include      \
-+		    -isystem $(shell $(CC) -print-file-name=include) \
- 		    -I$(KLIBCINC)/arch/$(KLIBCARCHDIR)	\
-                     -I$(KLIBCINC)/bits$(KLIBCBITSIZE)	\
- 		    -I$(KLIBCOBJ)/../include		\
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
deleted file mode 100644
index 1ba05a811e..0000000000
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b6185401fc3daa7fa8ba2b84db3e4da3b94a9867 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 26 Jul 2017 16:13:16 -0700
-Subject: [PATCH] Kbuild.klibc: Use -print-libgcc-file-name instead of
- --print-libgcc
-
--print-libgcc-file-name works with clang and gcc unlike --print-libgcc
-which is gcc specific
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- scripts/Kbuild.klibc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/Kbuild.klibc b/scripts/Kbuild.klibc
-index f500d53..101f86f 100644
---- a/scripts/Kbuild.klibc
-+++ b/scripts/Kbuild.klibc
-@@ -128,7 +128,7 @@ KLIBCCFLAGS      += $(KLIBCCPPFLAGS) $(KLIBCREQFLAGS) $(KLIBCARCHREQFLAGS)  \
- KLIBCAFLAGS      += -D__ASSEMBLY__ $(KLIBCCFLAGS)
- KLIBCSTRIPFLAGS  += --strip-all -R .comment -R .note
- 
--KLIBCLIBGCC_DEF  := $(shell $(KLIBCCC) $(KLIBCCFLAGS) --print-libgcc)
-+KLIBCLIBGCC_DEF  := $(shell $(KLIBCCC) $(KLIBCCFLAGS) -print-libgcc-file-name)
- KLIBCLIBGCC	 ?= $(KLIBCLIBGCC_DEF)
- KLIBCCRT0        := $(KLIBCOBJ)/arch/$(KLIBCARCHDIR)/crt0.o
- KLIBCLIBC        := $(KLIBCOBJ)/libc.a
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
index fcf4f891a4..ea14c49f0d 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
@@ -14,8 +14,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  usr/klibc/arch/arm/MCONFIG | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/usr/klibc/arch/arm/MCONFIG b/usr/klibc/arch/arm/MCONFIG
-index 303c6ac..48d2685 100644
 --- a/usr/klibc/arch/arm/MCONFIG
 +++ b/usr/klibc/arch/arm/MCONFIG
 @@ -10,7 +10,7 @@
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
index 94818e3669..15b5144e44 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch
@@ -12,11 +12,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  usr/klibc/Kbuild | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/usr/klibc/Kbuild b/usr/klibc/Kbuild
-index 98caf2e9..b34521e0 100644
 --- a/usr/klibc/Kbuild
 +++ b/usr/klibc/Kbuild
-@@ -168,7 +168,8 @@ $(SOHASH): $(SOLIB) $(SOLIB).hash
+@@ -183,7 +183,8 @@ $(SOHASH): $(SOLIB) $(SOLIB).hash
  targets += interp.o
  
  quiet_cmd_interp = BUILD   $@
@@ -25,4 +23,4 @@ index 98caf2e9..b34521e0 100644
 +                             -D__ASSEMBLY__     \
                               -DLIBDIR=\"$(SHLIBDIR)\"         \
  			     -DSOHASH=\"$(SOLIBHASH)\" \
- 			     -c -o $@ $<
+                              $(KLIBCSTACKFLAGS) \
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch
index 0768f6d514..f096486d0b 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc-add-getrandom-syscall.patch
@@ -10,11 +10,9 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  usr/klibc/SYSCALLS.def | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/usr/klibc/SYSCALLS.def b/usr/klibc/SYSCALLS.def
-index 6b3bf4c..d4184ba 100644
 --- a/usr/klibc/SYSCALLS.def
 +++ b/usr/klibc/SYSCALLS.def
-@@ -274,6 +274,7 @@ int syslog::klogctl(int, char *, int);
+@@ -275,6 +275,7 @@ int syslog::klogctl(int, char *, int);
  int sysinfo(struct sysinfo *);
  long kexec_load(void *, unsigned long, struct kexec_segment *, unsigned long);
  <x86_64,ppc64,s390x> long kexec_file_load(int, int, unsigned long, const char *, unsigned long);
@@ -22,6 +20,3 @@ index 6b3bf4c..d4184ba 100644
  
  /*
   * Low-level I/O (generally architecture-specific);
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
index 3d8d987c43..b03fb91265 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-klibc_2.0.4-add-kexec_file_load-syscall.patch
@@ -10,11 +10,9 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  usr/klibc/SYSCALLS.def | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/usr/klibc/SYSCALLS.def b/usr/klibc/SYSCALLS.def
-index c56e8f9..6b3bf4c 100644
 --- a/usr/klibc/SYSCALLS.def
 +++ b/usr/klibc/SYSCALLS.def
-@@ -273,6 +273,7 @@ int reboot::__reboot(int, int, int, void *);
+@@ -274,6 +274,7 @@ int reboot::__reboot(int, int, int, void
  int syslog::klogctl(int, char *, int);
  int sysinfo(struct sysinfo *);
  long kexec_load(void *, unsigned long, struct kexec_segment *, unsigned long);
@@ -22,6 +20,3 @@ index c56e8f9..6b3bf4c 100644
  
  /*
   * Low-level I/O (generally architecture-specific);
--- 
-2.7.4
-
diff --git a/meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch b/meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch
new file mode 100644
index 0000000000..69799c5c76
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/cross-clang.patch
@@ -0,0 +1,24 @@
+--- a/scripts/Kbuild.klibc
++++ b/scripts/Kbuild.klibc
+@@ -113,10 +113,8 @@ KLIBCCPPFLAGS    := -nostdinc -iwithpref
+                     -I$(KLIBCINC)/arch/$(KLIBCARCHDIR)	\
+                     -I$(KLIBCINC)/bits$(KLIBCBITSIZE)	\
+                     -I$(KLIBCOBJ)/../include		\
+-                    -I$(KLIBCINC)
+-ifeq ($(cc-name),clang)
+-KLIBCCPPFLAGS    += -I$(shell $(KLIBCCC) $(KLIBCCFLAGS) --print-file-name=include)
+-endif
++                    -I$(KLIBCINC) \
++                    -I$(shell $(KLIBCCC) $(KLIBCCFLAGS) --print-file-name=include)
+ 
+ # kernel include paths
+ KLIBCKERNELSRC	 ?= $(srctree)
+@@ -137,7 +135,7 @@ KLIBCCFLAGS      += $(KLIBCCPPFLAGS) $(K
+ KLIBCAFLAGS      += -D__ASSEMBLY__ $(KLIBCCFLAGS)
+ KLIBCSTRIPFLAGS  += --strip-all -R .comment -R .note
+ 
+-KLIBCLIBGCC_DEF  := $(shell $(KLIBCCC) $(KLIBCCFLAGS) $(if $(filter gcc,$(cc-name)),--print-libgcc,--print-libgcc-file-name))
++KLIBCLIBGCC_DEF  := $(shell $(KLIBCCC) $(KLIBCCFLAGS) --print-libgcc-file-name)
+ KLIBCLIBGCC      ?= $(KLIBCLIBGCC_DEF)
+ KLIBCCRT0        := $(KLIBCOBJ)/arch/$(KLIBCARCHDIR)/crt0.o
+ KLIBCLIBC        := $(KLIBCOBJ)/libc.a
diff --git a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
index 3b7031e981..56905a5159 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/klcc-cross-accept-clang-options.patch
@@ -5,10 +5,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/klcc/klcc.in
 +++ b/klcc/klcc.in
-@@ -207,6 +207,12 @@ while ( defined($a = shift(@ARGV)) ) {
+@@ -207,6 +207,24 @@ while ( defined($a = shift(@ARGV)) ) {
      } elsif ( $a =~ /^--([sysroot=])(.*)$/ ) {
  	# Override gcc encoded sysroot
  	push(@ccopt, $a);
++    } elsif ( $a eq '-nostartfiles' ) {
++        # Allow clang options
++        push(@ccopt, $a);
++    } elsif ( $a eq '-nostdlib' ) {
++        # Allow clang options
++        push(@ccopt, $a);
++    } elsif ( $a eq '-nodefaultlibs' ) {
++        # Allow clang options
++        push(@ccopt, $a);
++    } elsif ( $a eq '-no-pie' ) {
++        # Allow clang options
++        push(@ccopt, $a);
 +    } elsif ( $a eq '-no-integrated-as' ) {
 +	# Allow clang options
 +	push(@ccopt, $a);
diff --git a/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch b/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch
index eac128cc09..5973824885 100644
--- a/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch
+++ b/meta-initramfs/recipes-devtools/klibc/files/use-env-for-perl.patch
@@ -10,8 +10,6 @@ that /usr/bin/env perl will always return ours (if it has been built).
 
 Signed-off-by: Tom Rini <tom_rini@mentor.com>
 
-Index: klibc-1.5.20/klcc/makeklcc.pl
-===================================================================
 --- a/klcc/makeklcc.pl
 +++ b/klcc/makeklcc.pl
 @@ -26,7 +26,7 @@ sub pathsearch($) {
diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.7.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.8.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.7.bb
rename to meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.8.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.7.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.8.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.7.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.8.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.7.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.8.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.7.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.8.bb
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 243107e9ae..6e8ec0fd56 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -15,13 +15,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://0001-include-linux-sysinfo.h-directly.patch \
            file://0001-mkfifo-Implement-mkfifo.patch \
            file://0001-always-use-bfd-linker.patch \
-           file://0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch \
-           file://0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch \
            file://0001-arm-Do-not-set-a-fallback-march-and-mtune.patch \
            file://0001-klibc_2.0.4-add-kexec_file_load-syscall.patch \
            file://0001-klibc-add-getrandom-syscall.patch \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
-           file://0001-Define-ulocked_-fgets-fread-fwrite-aliases.patch \
+           file://cross-clang.patch \
            "
 
 ARMPATCHES ?= ""
@@ -29,9 +27,7 @@ ARMPATCHES ?= ""
 ARMPATCHES_arm = " \
                   file://armv4-fix-v4bx.patch \
                  "
-
-SRC_URI[md5sum] = "712f8bc1a069e03d92584b7f5380c521"
-SRC_URI[sha256sum] = "abef2637ca823485d9c90ce9512e2b08a65047ec4da204635eeaef95a41a9122"
+SRC_URI[sha256sum] = "4e48f1398cfe3ce0b6df55ce6e70acf54fc8488e3aea3fb3610ee1622d9cb436"
 
 S = "${WORKDIR}/klibc-${PV}"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.7.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.8.bb
similarity index 100%
rename from meta-initramfs/recipes-devtools/klibc/klibc_2.0.7.bb
rename to meta-initramfs/recipes-devtools/klibc/klibc_2.0.8.bb
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
index 5bbb178bc6..07fa841ccc 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/0011-purgatory-Makefile-adapt-to-klcc.patch
@@ -10,11 +10,9 @@ Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
  purgatory/Makefile | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/purgatory/Makefile b/purgatory/Makefile
-index 49ce80a..1542b3a 100644
 --- a/purgatory/Makefile
 +++ b/purgatory/Makefile
-@@ -47,7 +47,7 @@ purgatory/sha256.o: $(srcdir)/util_lib/sha256.c
+@@ -47,7 +47,7 @@ purgatory/sha256.o: $(srcdir)/util_lib/s
  $(PURGATORY): CC=$(TARGET_CC)
  $(PURGATORY): CFLAGS+=$(PURGATORY_EXTRA_CFLAGS) \
  		      $($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
@@ -23,14 +21,14 @@ index 49ce80a..1542b3a 100644
  		      -fno-zero-initialized-in-bss \
  		      -fno-PIC -fno-PIE -fno-stack-protector
  
-@@ -59,8 +59,8 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS) \
+@@ -59,8 +59,8 @@ $(PURGATORY): CPPFLAGS=$($(ARCH)_PURGATO
  			-Iinclude \
  			-I$(shell $(CC) -print-file-name=include)
  $(PURGATORY): LDFLAGS=$($(ARCH)_PURGATORY_EXTRA_CFLAGS)\
 -			-Wl,--no-undefined -nostartfiles -nostdlib \
 -			-nodefaultlibs -e purgatory_start -r \
-+			-Wl,--no-undefined -Wl,-no-pie -Wl,-nostartfiles -Wl,-nostdlib \
-+			-Wl,-nodefaultlibs -Wl,--entry=purgatory_start -Wl,-r \
++			-Wl,--no-undefined -no-pie -nostartfiles -nostdlib \
++			-nodefaultlibs -Wl,--entry=purgatory_start -Wl,-r \
  			-Wl,-Map=$(PURGATORY_MAP)
  
  $(PURGATORY): $(PURGATORY_OBJS)
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch
new file mode 100644
index 0000000000..d4fbd1436f
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc/include_next.patch
@@ -0,0 +1,22 @@
+--- a/kexec/Makefile
++++ b/kexec/Makefile
+@@ -110,7 +110,7 @@ $(KEXEC): $(KEXEC_OBJS) $(UTIL_LIB)
+ 	@$(MKDIR) -p $(@D)
+ 	$(LINK.o) -o $@ $^ $(CFLAGS) $(LIBS)
+ 
+-$(KEXEC): CPPFLAGS+=-I$(srcdir)/kexec/arch/$(ARCH)/include
++$(KEXEC): CPPFLAGS+=-I$(srcdir)/kexec/arch/$(ARCH)/include -I$(shell $(CC) -print-file-name=include)
+ 
+ kexec/fs2dt.o: CPPFLAGS+=$($(ARCH)_FS2DT_INCLUDE)
+ 
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -46,7 +46,7 @@ TARGET_CFLAGS	= @TARGET_CFLAGS@
+ # Base compiler flags. These are extended by the subcomponent-Makefiles
+ # where necessary.
+ CPPFLAGS	= @CPPFLAGS@ -I$(srcdir)/include -I$(srcdir)/util_lib/include \
+-			-Iinclude/ $($(ARCH)_CPPFLAGS)
++			-Iinclude/ $($(ARCH)_CPPFLAGS) -I$(shell $(CC) -print-file-name=include)
+ CFLAGS		= @CFLAGS@ -static -fno-strict-aliasing -Wall -Wstrict-prototypes
+ PURGATORY_EXTRA_CFLAGS = @PURGATORY_EXTRA_CFLAGS@
+ ASFLAGS		= @ASFLAGS@ $($(ARCH)_ASFLAGS)
diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index d28cfc90f2..c49b24f52f 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -32,7 +32,9 @@ KLIBC_PATCHES += " \
             file://0013-sha256.h-avoid-inclusion-of-sys-types.h.patch \
             file://0014-add-if_nameindex-from-musl.patch \
             file://0015-vmcore-dmesg-fix-warning.patch \
-            file://klibc-reboot.patch"
+            file://klibc-reboot.patch \
+            file://include_next.patch \
+            "
 
 WARNING_FIXES = ""
 FROM_OE_CORE = "file://arm_crashdump-fix-buffer-align.patch \
-- 
2.30.0

