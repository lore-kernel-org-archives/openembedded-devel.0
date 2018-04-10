Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 10EA27482B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 21:02:12 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id d1so14105057wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jyYWDCS1ahgyQP9qU9PnpHjtNqw8V1MoxPCWXEpWkqY=;
	b=hgPxCTTExc/MI+Pc0TlVGlI3H0DGBov/VS5gyeyXrrVqoU8NliRl9K0qgMwrfXdmVb
	3lObqYcwoWjKgPxMmf7jYbvJn7b9oqu3EFBRdOxC+tj8ye2qakU4jNLlZRJGx7+oziLI
	Ez+uOjPr22DXiC3c4r1DkxEaRlAepOEeZarBHigkeS8VAmjKX0OjW09Fb9imuK1H9ShJ
	Rr+JV+3b6dn/TfklZS7N2nbnkBI8kVNOgO1Px04UaJ32CwHbsJJ2ULZ1sN/FiefsDpCN
	M4nOrz4mRcUxTZpIOz/yAHHHcjw+2YGm75TOylC113ed19uH61vL/if1HC8KqqMT7vly
	K2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jyYWDCS1ahgyQP9qU9PnpHjtNqw8V1MoxPCWXEpWkqY=;
	b=f5BS6ha42GUIzr7KD9gvjOo3znjKfFPQaqgQHCNbnLcWhQrFwUPl8XV0mMkxA+V+jX
	cdObpOPpQvH4vpnGfU6RfSwuTSGPZgdr2FQQpR52rzOW2EClPT334Ho4x9UApGxdQY3n
	IpkTSeQZR1P8qP5b2WEC1SLpeq5gQZV23IV7uCPoRFmgDxGL4hrpSMoSqMYB0CLK65BJ
	MYLjM5kdMOidiPFjoE3vV0anEtZ6ilx+K/fYXF1kdX/LS5ReCerGPmDnjsIaLN5dlLhV
	3EDyDuStHgZX7k525WkF2ffgbwtchz48qAUBYaPcPOoOiTsdQwA8rLF8JQWi2ee9yTOF
	TOWg==
X-Gm-Message-State: ALQs6tBDbOnGOQtubPsoOyk4Z5/LBnaWTEsmVM6KtBgezU0S7T/J1K9p
	VULIFAxRLJ3wMfun6iRY0kAYZH7p
X-Google-Smtp-Source: AIpwx4++auuriL2SFH1tu5vnBQUaL+RE55ekn3MT6NuSuRzZuqKeOhSF14HhdNMTVZbXprH2m/AAog==
X-Received: by 10.223.196.212 with SMTP id o20mr1419170wrf.144.1523394133088; 
	Tue, 10 Apr 2018 14:02:13 -0700 (PDT)
Received: from localhost.localdomain
	(host167-216-dynamic.251-95-r.retail.telecomitalia.it.
	[95.251.216.167])
	by smtp.gmail.com with ESMTPSA id j3sm4580380wra.19.2018.04.10.14.02.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Apr 2018 14:02:12 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Apr 2018 23:02:09 +0200
Message-Id: <1523394129-15539-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc-2.0.4: refresh patches (using devtool)
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
X-List-Received-Date: Tue, 10 Apr 2018 21:02:13 -0000

Silence warnings about ingnored context.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 ...ine-in_-structs-for-non-glibc-system-libs.patch |  60 ++++----
 ...c-Add-path-to-compiler-headers-via-isyste.patch |  12 +-
 ...c-Use-print-libgcc-file-name-instead-of-p.patch |  10 +-
 .../klibc-2.0.4/0001-always-use-bfd-linker.patch   |   8 +-
 ...arm-Do-not-set-a-fallback-march-and-mtune.patch |  10 +-
 ...0001-dash-Specify-format-string-in-fmtstr.patch |   8 +-
 .../0001-include-linux-sysinfo.h-directly.patch    |   8 +-
 .../klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch |   8 +-
 .../klibc/klibc-2.0.4/armv4-fix-v4bx.patch         |  17 ++-
 .../klibc/klibc-2.0.4/klcc-consider-sysroot.patch  |   8 ++
 .../klibc/klibc-2.0.4/klibc-config-eabi.patch      |  18 ++-
 .../klibc/klibc-2.0.4/klibc-linux-libc-dev.patch   |  23 ++--
 .../klibc/klibc-2.0.4/staging.patch                | 151 +++++++++++----------
 13 files changed, 185 insertions(+), 156 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
index 8d1ec69..e7a0cce 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Define-in_-structs-for-non-glibc-system-libs.patch
@@ -1,4 +1,4 @@
-From f414dea1316a48aba3e8e293201ebd51652d3ef4 Mon Sep 17 00:00:00 2001
+From 57e3a60b23891905733bfea7a1cb78c2377cc524 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Jul 2017 15:17:29 -0700
 Subject: [PATCH] Define in_* structs for non-glibc system libs
@@ -10,14 +10,38 @@ glibc in mind, and does not provide adequate guards for musl
 to infer that these structs should be defined in linux/in.h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- usr/include/netinet/in.h | 33 +++++++++++++++++++++++++++++++++
- 1 file changed, 33 insertions(+)
+ usr/include/net/if.h     | 11 +++++++++++
+ usr/include/netinet/in.h | 36 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 47 insertions(+)
 
-Index: git/usr/include/netinet/in.h
-===================================================================
---- git.orig/usr/include/netinet/in.h
-+++ git/usr/include/netinet/in.h
+diff --git a/usr/include/net/if.h b/usr/include/net/if.h
+index 116a176..6246b12 100644
+--- a/usr/include/net/if.h
++++ b/usr/include/net/if.h
+@@ -1,6 +1,17 @@
+ #ifndef _NET_IF_H
+ #define _NET_IF_H
+ 
++#ifndef __GLIBC__
++#include <linux/libc-compat.h>
++#undef __UAPI_DEF_IF_IFREQ
++#define __UAPI_DEF_IF_IFREQ            1
++#undef __UAPI_DEF_IF_IFNAMSIZ
++#define __UAPI_DEF_IF_IFNAMSIZ         1
++#undef __UAPI_DEF_IF_IFMAP
++#define __UAPI_DEF_IF_IFMAP            1
++#undef __UAPI_DEF_IF_NET_DEVICE_FLAGS
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS 1
++#endif
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <linux/if.h>
+diff --git a/usr/include/netinet/in.h b/usr/include/netinet/in.h
+index 2952bb2..0c95bc9 100644
+--- a/usr/include/netinet/in.h
++++ b/usr/include/netinet/in.h
 @@ -5,6 +5,42 @@
  #ifndef _NETINET_IN_H
  #define _NETINET_IN_H
@@ -61,25 +85,3 @@ Index: git/usr/include/netinet/in.h
  #include <klibc/extern.h>
  #include <stdint.h>
  #include <endian.h>		/* Must be included *before* <linux/in.h> */
-Index: git/usr/include/net/if.h
-===================================================================
---- git.orig/usr/include/net/if.h
-+++ git/usr/include/net/if.h
-@@ -1,6 +1,17 @@
- #ifndef _NET_IF_H
- #define _NET_IF_H
- 
-+#ifndef __GLIBC__
-+#include <linux/libc-compat.h>
-+#undef __UAPI_DEF_IF_IFREQ
-+#define __UAPI_DEF_IF_IFREQ            1
-+#undef __UAPI_DEF_IF_IFNAMSIZ
-+#define __UAPI_DEF_IF_IFNAMSIZ         1
-+#undef __UAPI_DEF_IF_IFMAP
-+#define __UAPI_DEF_IF_IFMAP            1
-+#undef __UAPI_DEF_IF_NET_DEVICE_FLAGS
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS 1
-+#endif
- #include <sys/socket.h>
- #include <sys/types.h>
- #include <linux/if.h>
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
index 7cd4c0e..181dcfb 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Add-path-to-compiler-headers-via-isyste.patch
@@ -1,4 +1,4 @@
-From 10fb440795a7796140bd657ee028847ec7c34447 Mon Sep 17 00:00:00 2001
+From 4b4147b76518d31a88fb2c58cdbf2236e159a25c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 8 Sep 2017 23:10:54 -0700
 Subject: [PATCH] Kbuild.klibc: Add path to compiler headers via -isystem
@@ -7,12 +7,13 @@ We need to include this path so it can find compiler headers e.g.
 stdarg.h which is called from wrapper stdarg.h using include_next
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- scripts/Kbuild.klibc | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
+ scripts/Kbuild.klibc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/scripts/Kbuild.klibc b/scripts/Kbuild.klibc
-index f500d535..1d5cdc43 100644
+index 101f86f..1d5cdc4 100644
 --- a/scripts/Kbuild.klibc
 +++ b/scripts/Kbuild.klibc
 @@ -105,7 +105,8 @@ KLIBCOBJCOPY     := $(OBJCOPY)
@@ -25,6 +26,3 @@ index f500d535..1d5cdc43 100644
  		    -I$(KLIBCINC)/arch/$(KLIBCARCHDIR)	\
                      -I$(KLIBCINC)/bits$(KLIBCBITSIZE)	\
  		    -I$(KLIBCOBJ)/../include		\
--- 
-2.14.1
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
index 41cc142..1ba05a8 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-Kbuild.klibc-Use-print-libgcc-file-name-instead-of-p.patch
@@ -1,19 +1,20 @@
-From f66edde8a704131d98e8783ea8d4c848e8119b20 Mon Sep 17 00:00:00 2001
+From b6185401fc3daa7fa8ba2b84db3e4da3b94a9867 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 26 Jul 2017 16:13:16 -0700
-Subject: [PATCH 1/3] Kbuild.klibc: Use -print-libgcc-file-name instead of
+Subject: [PATCH] Kbuild.klibc: Use -print-libgcc-file-name instead of
  --print-libgcc
 
 -print-libgcc-file-name works with clang and gcc unlike --print-libgcc
 which is gcc specific
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  scripts/Kbuild.klibc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scripts/Kbuild.klibc b/scripts/Kbuild.klibc
-index f500d535..101f86f5 100644
+index f500d53..101f86f 100644
 --- a/scripts/Kbuild.klibc
 +++ b/scripts/Kbuild.klibc
 @@ -128,7 +128,7 @@ KLIBCCFLAGS      += $(KLIBCCPPFLAGS) $(KLIBCREQFLAGS) $(KLIBCARCHREQFLAGS)  \
@@ -25,6 +26,3 @@ index f500d535..101f86f5 100644
  KLIBCLIBGCC	 ?= $(KLIBCLIBGCC_DEF)
  KLIBCCRT0        := $(KLIBCOBJ)/arch/$(KLIBCARCHDIR)/crt0.o
  KLIBCLIBC        := $(KLIBCOBJ)/libc.a
--- 
-2.13.3
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch
index 41a6b9e..de04d69 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-always-use-bfd-linker.patch
@@ -1,4 +1,4 @@
-From 9ea19bd9636806a73bcf29cfcee40a268f91eb4c Mon Sep 17 00:00:00 2001
+From 63ab5102d6ef362a597941e62470bf19e6f1652b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 11 Jul 2017 08:09:52 -0700
 Subject: [PATCH] always use bfd linker
@@ -8,12 +8,13 @@ therefore explicitly asking for bfd linker would fix the
 linking issues on such distros
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile b/Makefile
-index dc10fc5d..40647be4 100644
+index dc10fc5..40647be 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -20,7 +20,7 @@ include $(srctree)/scripts/Kbuild.include
@@ -25,6 +26,3 @@ index dc10fc5d..40647be4 100644
  export AR	:= $(KLIBCROSS)ar
  export RANLIB	:= $(KLIBCROSS)ranlib
  export STRIP	:= $(KLIBCROSS)strip
--- 
-2.13.2
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
index 9c0ea63..fcf4f89 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-arm-Do-not-set-a-fallback-march-and-mtune.patch
@@ -1,4 +1,4 @@
-From a46a144ac883898d9cedf7a0b13aec6d10116125 Mon Sep 17 00:00:00 2001
+From ebd2b0e414c98467156b961abb470b5d07f37ea8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Sep 2017 23:11:53 -0700
 Subject: [PATCH] arm: Do not set a fallback march and mtune
@@ -9,14 +9,13 @@ need to compute values for CPU_ARCH and CPU_TUNE
 which is a bit harder in OE
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
+---
  usr/klibc/arch/arm/MCONFIG | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/usr/klibc/arch/arm/MCONFIG b/usr/klibc/arch/arm/MCONFIG
-index 53bc1dc3..857e2f2d 100644
+index 303c6ac..48d2685 100644
 --- a/usr/klibc/arch/arm/MCONFIG
 +++ b/usr/klibc/arch/arm/MCONFIG
 @@ -10,7 +10,7 @@
@@ -28,6 +27,3 @@ index 53bc1dc3..857e2f2d 100644
  KLIBCBITSIZE  = 32
  KLIBCREQFLAGS += -fno-exceptions
  KLIBCSTRIPFLAGS += -R .ARM.exidx
--- 
-2.14.2
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
index ae8c1f1..46a2398 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-dash-Specify-format-string-in-fmtstr.patch
@@ -1,4 +1,4 @@
-From 2fff607fd0b5550e5072a6fffcbb01c29d5207d2 Mon Sep 17 00:00:00 2001
+From 8beffe501c1ac5b35d62004735c4157c74183901 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Jul 2017 13:51:25 -0700
 Subject: [PATCH] dash: Specify format string in fmtstr()
@@ -9,12 +9,13 @@ usr/dash/jobs.c:429:3: error: format not a string literal and no format argument
    col = fmtstr(s, 32, strsignal(st));
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  usr/dash/jobs.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/usr/dash/jobs.c b/usr/dash/jobs.c
-index 009bbfee..299bcacc 100644
+index 009bbfe..299bcac 100644
 --- a/usr/dash/jobs.c
 +++ b/usr/dash/jobs.c
 @@ -426,7 +426,7 @@ sprint_status(char *s, int status, int sigonly)
@@ -26,6 +27,3 @@ index 009bbfee..299bcacc 100644
  #ifdef WCOREDUMP
  		if (WCOREDUMP(status)) {
  			col += fmtstr(s + col, 16, " (core dumped)");
--- 
-2.13.2
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
index 1b033ac..04c97fc 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-include-linux-sysinfo.h-directly.patch
@@ -1,4 +1,4 @@
-From ab060a57b41f989665ade20e813bbcb67f91f1f2 Mon Sep 17 00:00:00 2001
+From d966d52d1e569cbc2293d841285e2b8941f28c61 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Jul 2017 15:56:28 -0700
 Subject: [PATCH] include linux/sysinfo.h directly
@@ -10,12 +10,13 @@ but until its done in right place, change the local header
 override to avoid this assumption
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  usr/include/sys/sysinfo.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/usr/include/sys/sysinfo.h b/usr/include/sys/sysinfo.h
-index dba68dc6..d145c0b1 100644
+index dba68dc..d145c0b 100644
 --- a/usr/include/sys/sysinfo.h
 +++ b/usr/include/sys/sysinfo.h
 @@ -5,7 +5,7 @@
@@ -27,6 +28,3 @@ index dba68dc6..d145c0b1 100644
  
  extern int sysinfo(struct sysinfo *info);
  
--- 
-2.13.2
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
index 9791412..3bc081d 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/0001-mkfifo-Implement-mkfifo.patch
@@ -1,15 +1,16 @@
-From b4e120f5edf06e6df138b1804a8b5180584cea6b Mon Sep 17 00:00:00 2001
+From cf97079009ba48d10e52052b2eab7461ea4dd09b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 10 Jul 2017 20:42:50 -0700
 Subject: [PATCH] mkfifo: Implement mkfifo
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  usr/utils/mkfifo.c | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/usr/utils/mkfifo.c b/usr/utils/mkfifo.c
-index 5a758b2a..f1f577e6 100644
+index 5a758b2..f1f577e 100644
 --- a/usr/utils/mkfifo.c
 +++ b/usr/utils/mkfifo.c
 @@ -26,6 +26,11 @@ static int make_fifo(char *dir)
@@ -24,6 +25,3 @@ index 5a758b2a..f1f577e6 100644
  int main(int argc, char *argv[])
  {
  	int c, ret = 0;
--- 
-2.13.2
-
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
index 6bb384b..e842353 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
@@ -1,11 +1,22 @@
+From d2fb484d995221277cce7abddcd7dfa0e8bceec3 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Fri, 11 Jan 2013 17:26:40 +0000
+Subject: [PATCH] klibc_2.0.2: apply FIX_V4BX patch for armv4 targets only
+
 Status: not applicable upstream, in OE/Yocto we use $(FIX_V4BX)
 which is "" in case of armv5 or thumbs.
 
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
---- a/usr/klibc/arch/arm/MCONFIG	2013-01-09 01:12:02.000000000 +0100
-+++ b/usr/klibc/arch/arm/MCONFIG	2013-01-08 23:45:59.000000000 +0100
-@@ -29,6 +29,7 @@
+---
+ usr/klibc/arch/arm/MCONFIG | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/usr/klibc/arch/arm/MCONFIG b/usr/klibc/arch/arm/MCONFIG
+index 53bc1dc..303c6ac 100644
+--- a/usr/klibc/arch/arm/MCONFIG
++++ b/usr/klibc/arch/arm/MCONFIG
+@@ -29,6 +29,7 @@ else
  KLIBCSHAREDFLAGS = -Ttext 0x01800200
  ifeq ($(CONFIG_AEABI),y)
  KLIBCREQFLAGS += -mabi=aapcs-linux -mno-thumb-interwork
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
index 9bc4835..5f47d3f 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klcc-consider-sysroot.patch
@@ -1,3 +1,11 @@
+From 0cb26cf2d25d36c1fdcc4f1635e4329436ed866a Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Fri, 19 Sep 2014 23:09:29 +0200
+
+---
+ klcc/klcc.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
 diff --git a/klcc/klcc.in b/klcc/klcc.in
 index 43d0984..61e9385 100644
 --- a/klcc/klcc.in
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch
index 316c80a..f28cd54 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-config-eabi.patch
@@ -1,12 +1,22 @@
+From 1118cc971917abe19ddb029aa80417f6fd6bb343 Mon Sep 17 00:00:00 2001
+From: Thomas Kunze <thommycheck@gmx.de>
+Date: Sat, 6 Aug 2011 05:30:14 +0000
+Subject: [PATCH] klibc: initial commit of version 1.5.24
+
 Patch was imported from the OpenEmbedded git server
 (git://git.openembedded.org/openembedded)
 as of commit id b6764cf32ec93547531130dca364fb95e1c495f4
 Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
 
-diff -Nur klibc-1.5/defconfig klibc-1.5p/defconfig
---- klibc-1.5/defconfig	2007-03-04 02:52:10.000000000 +0100
-+++ klibc-1.5p/defconfig	2008-02-08 19:24:22.337127756 +0100
-@@ -5,4 +5,4 @@
+---
+ defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/defconfig b/defconfig
+index 04b98e9..0cb23d0 100644
+--- a/defconfig
++++ b/defconfig
+@@ -6,4 +6,4 @@ CONFIG_KLIBC_ZLIB=y
  CONFIG_REGPARM=y
  # ARM options
  # CONFIG_KLIBC_THUMB is not set
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch
index 2043064..a5563b7 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/klibc-linux-libc-dev.patch
@@ -1,15 +1,22 @@
+From 1be2bc41f915922102a3ba671b54c2df6f0052e6 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sun, 14 Mar 2010 18:41:56 +0000
+Subject: [PATCH] klibc_1.5.26: now build against linux-libc-headers
+
 commit 43adf69062254fb4f8d4d11fb5fe36a60ae25d5a
-Author: Ben Hutchings <ben@decadent.org.uk>
-Date:   Sun Mar 14 18:41:56 2010 +0000
 
     Taken from debian "Fix klibc Debian specific build trouble"
     Adapted for klibc_2.0.2
 
-Index: klibc-2.0~rc2/scripts/Kbuild.install
-===================================================================
---- klibc-2.0~rc2.orig/scripts/Kbuild.install	2012-02-11 18:50:21.000000000 +0000
-+++ klibc-2.0~rc2/scripts/Kbuild.install	2012-02-11 19:04:52.000000000 +0000
-@@ -95,7 +95,9 @@
+---
+ scripts/Kbuild.install | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/Kbuild.install b/scripts/Kbuild.install
+index 8af5697..d32a8a5 100644
+--- a/scripts/Kbuild.install
++++ b/scripts/Kbuild.install
+@@ -95,7 +95,9 @@ header:
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)lib
  	$(Q)mkdir -p $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)bin
@@ -18,5 +25,5 @@ Index: klibc-2.0~rc2/scripts/Kbuild.install
 +		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
 +	done
  	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
- 	$(Q)chmod -R a+rX $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
+ 	$(Q)chmod -R a+rX,go-w $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
  	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
index c01c712..5c7a662 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/staging.patch
@@ -1,3 +1,8 @@
+From 1892079b827cf8f8316305b6d6e0985db82441a2 Mon Sep 17 00:00:00 2001
+From: Thomas Kunze <thommycheck@gmx.de>
+Date: Sat, 6 Aug 2011 05:30:14 +0000
+Subject: [PATCH] klibc: initial commit of version 1.5.24
+
 Patch was imported from the OpenEmbedded git server
 (git://git.openembedded.org/openembedded)
 as of commit id eefb99a313bbcc8f34c8b32bf0c5aa2dd2580735
@@ -6,11 +11,25 @@ Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
 Minor edits following upstream changes
 Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
 
-Index: klibc-1.5.24/scripts/Kbuild.install
-===================================================================
---- a/scripts/Kbuild.install	2011-07-27 15:50:53.000000000 +0200
-+++ b/scripts/Kbuild.install	2011-08-01 00:03:03.000000000 +0200
-@@ -88,13 +88,10 @@
+---
+ scripts/Kbuild.install    | 4 ----
+ usr/dash/Kbuild           | 2 --
+ usr/gzip/Kbuild           | 2 --
+ usr/kinit/Kbuild          | 2 --
+ usr/kinit/fstype/Kbuild   | 2 --
+ usr/kinit/ipconfig/Kbuild | 2 --
+ usr/kinit/nfsmount/Kbuild | 2 --
+ usr/kinit/resume/Kbuild   | 2 --
+ usr/kinit/run-init/Kbuild | 2 --
+ usr/klibc/Kbuild          | 2 --
+ usr/utils/Kbuild          | 2 --
+ 11 files changed, 24 deletions(-)
+
+diff --git a/scripts/Kbuild.install b/scripts/Kbuild.install
+index d32a8a5..fda699d 100644
+--- a/scripts/Kbuild.install
++++ b/scripts/Kbuild.install
+@@ -88,19 +88,15 @@ else
  header:
  	$(Q)echo "  INSTALL headers + man pages to $(INSTALLROOT)$(INSTALLDIR)"
  	$(Q)mkdir -p $(INSTALLROOT)$(bindir)
@@ -24,119 +43,107 @@ Index: klibc-1.5.24/scripts/Kbuild.install
  	$(Q)for x in ../../../include/asm ../../../include/asm-generic ../../../include/linux ../../../include/mtd; do \
  		ln -sf $${x} $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/ || exit; \
  	done
-@@ -103,7 +100,6 @@
- 	done
  	$(Q)cp -rf usr/include/. $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include/.
  	$(Q)chmod -R a+rX,go-w $(INSTALLROOT)$(INSTALLDIR)/$(KCROSS)include
 -	$(Q)$(install-data) $(srctree)/klcc/klcc.1 $(INSTALLROOT)$(mandir)/man1/$(KCROSS)klcc.1
  	$(Q)$(install-bin) $(objtree)/klcc/$(KCROSS)klcc $(INSTALLROOT)$(bindir)
  
  footer: header
-
-Index: klibc-1.5.24/usr/dash/Kbuild
-===================================================================
---- a/usr/dash/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/dash/Kbuild	2011-08-01 00:07:56.000000000 +0200
-@@ -92,5 +92,3 @@
+diff --git a/usr/dash/Kbuild b/usr/dash/Kbuild
+index 3a98c1f..1a6920a 100644
+--- a/usr/dash/Kbuild
++++ b/usr/dash/Kbuild
+@@ -92,5 +92,3 @@ $(obj)/syntax.c: $(obj)/mksyntax
  $(obj)/syntax.h: $(obj)/syntax.c
  	$(Q):
  
 -# Targets to install
 -install-y := sh.shared
-
-Index: klibc-1.5.24/usr/gzip/Kbuild
-===================================================================
---- a/usr/gzip/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/gzip/Kbuild	2011-08-01 00:06:39.000000000 +0200
-@@ -21,5 +21,3 @@
+diff --git a/usr/gzip/Kbuild b/usr/gzip/Kbuild
+index 9bbf0a4..c497d02 100644
+--- a/usr/gzip/Kbuild
++++ b/usr/gzip/Kbuild
+@@ -21,5 +21,3 @@ $(obj)/gunzip $(obj)/zcat: $(obj)/gzip
  # Cleaning
  targets := gzip gzip.g gunzip zcat
  
 -# Targets to install
 -install-y := gzip gunzip zcat
-
-Index: klibc-1.5.24/usr/kinit/fstype/Kbuild
-===================================================================
---- a/usr/kinit/fstype/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/fstype/Kbuild	2011-08-01 00:09:12.000000000 +0200
-@@ -21,5 +21,3 @@
+diff --git a/usr/kinit/Kbuild b/usr/kinit/Kbuild
+index 5320127..f7fdccd 100644
+--- a/usr/kinit/Kbuild
++++ b/usr/kinit/Kbuild
+@@ -33,5 +33,3 @@ targets += kinit kinit.g kinit.shared kinit.shared.g
+ subdir- := fstype ipconfig nfsmount resume run-init
+ 
+ 
+-# install binary
+-install-y := kinit kinit.shared
+diff --git a/usr/kinit/fstype/Kbuild b/usr/kinit/fstype/Kbuild
+index 9b20db1..367611d 100644
+--- a/usr/kinit/fstype/Kbuild
++++ b/usr/kinit/fstype/Kbuild
+@@ -21,5 +21,3 @@ shared/fstype-y := $(objs)
  # Cleaning
  clean-dirs := static shared
  
 -# install binary
 -install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/ipconfig/Kbuild
-===================================================================
---- a/usr/kinit/ipconfig/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/ipconfig/Kbuild	2011-08-01 00:10:52.000000000 +0200
-@@ -27,5 +27,3 @@
+diff --git a/usr/kinit/ipconfig/Kbuild b/usr/kinit/ipconfig/Kbuild
+index 7f8d181..eb1d472 100644
+--- a/usr/kinit/ipconfig/Kbuild
++++ b/usr/kinit/ipconfig/Kbuild
+@@ -27,5 +27,3 @@ shared/ipconfig-y := $(objs)
  # Cleaning
  clean-dirs := static shared
  
 -# install binary
 -install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/Kbuild
-===================================================================
---- a/usr/kinit/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/Kbuild	2011-08-01 00:20:18.000000000 +0200
-@@ -33,5 +33,3 @@
- subdir- := fstype ipconfig nfsmount resume run-init
- 
- 
--# install binary
--install-y := kinit kinit.shared
-
-Index: klibc-1.5.24/usr/kinit/nfsmount/Kbuild
-===================================================================
---- a/usr/kinit/nfsmount/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/nfsmount/Kbuild	2011-08-01 00:12:52.000000000 +0200
-@@ -23,5 +23,3 @@
+diff --git a/usr/kinit/nfsmount/Kbuild b/usr/kinit/nfsmount/Kbuild
+index 461e6f3..ba31708 100644
+--- a/usr/kinit/nfsmount/Kbuild
++++ b/usr/kinit/nfsmount/Kbuild
+@@ -23,5 +23,3 @@ dummypmap-y := dummypmap_test.o
  
  clean-dirs := static shared
  
 -# Install binary
 -install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/resume/Kbuild
-===================================================================
---- a/usr/kinit/resume/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/resume/Kbuild	2011-08-01 00:13:51.000000000 +0200
-@@ -26,5 +26,3 @@
+diff --git a/usr/kinit/resume/Kbuild b/usr/kinit/resume/Kbuild
+index 034195d..c1342e1 100644
+--- a/usr/kinit/resume/Kbuild
++++ b/usr/kinit/resume/Kbuild
+@@ -26,5 +26,3 @@ shared/resume-lib := ../lib.a
  # Cleaning
  clean-dirs := static shared
  
 -# install binary
 -install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/kinit/run-init/Kbuild
-===================================================================
---- a/usr/kinit/run-init/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/kinit/run-init/Kbuild	2011-08-01 00:14:41.000000000 +0200
-@@ -25,5 +25,3 @@
+diff --git a/usr/kinit/run-init/Kbuild b/usr/kinit/run-init/Kbuild
+index f7832b7..c153b0a 100644
+--- a/usr/kinit/run-init/Kbuild
++++ b/usr/kinit/run-init/Kbuild
+@@ -30,5 +30,3 @@ shared/run-init-lib := ../lib.a
  # Cleaning
  clean-dirs := static shared
  
 -# install binary
 -install-y := $(shared-y)
-
-Index: klibc-1.5.24/usr/klibc/Kbuild
-===================================================================
---- a/usr/klibc/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/klibc/Kbuild	2011-08-01 00:18:11.000000000 +0200
-@@ -177,5 +177,3 @@
+diff --git a/usr/klibc/Kbuild b/usr/klibc/Kbuild
+index eba6add..98caf2e 100644
+--- a/usr/klibc/Kbuild
++++ b/usr/klibc/Kbuild
+@@ -185,5 +185,3 @@ install-rule:
  	          $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib))
  	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
  	                      $(INSTALLROOT)$(INSTALLDIR)/$(KLIBCCROSS)lib
 -	$(Q)$(install-lib) $(obj)/klibc-$(SOLIBHASH).so \
 -	                      $(INSTALLROOT)$(SHLIBDIR)
-
-Index: klibc-1.5.24/usr/utils/Kbuild
-===================================================================
---- a/usr/utils/Kbuild	2011-07-27 15:50:53.000000000 +0200
-+++ b/usr/utils/Kbuild	2011-08-01 00:19:13.000000000 +0200
-@@ -72,5 +72,3 @@
+diff --git a/usr/utils/Kbuild b/usr/utils/Kbuild
+index 05aa794..67d9486 100644
+--- a/usr/utils/Kbuild
++++ b/usr/utils/Kbuild
+@@ -72,5 +72,3 @@ $(obj)/shared/reboot $(obj)/shared/poweroff: $(obj)/shared/halt
  # Clean deletes the static and shared dir
  clean-dirs := static shared
  
-- 
2.7.4


