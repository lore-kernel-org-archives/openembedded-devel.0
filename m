Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 42E5E601D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 17:43:54 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id 34so5916680qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 10:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VGCORazhuWVsieEm1PYfHFIg8cpAxkdo8PjrfbLEuT8=;
	b=Anbetzbjm6Vtaz0tEsyQWl1iMd17GWwe23OPOwLYLXTyv1ApPAwFZgqfs9k7jtT+ML
	9o0Is4jvqufWdaZigNWqlkAfnP8aquVrWshXcGKlf4unPMKTD8SBGl8Sghl8aIQby9K3
	ujGY7XXJb52FobnSCBU8Gb1pHAH09Yv2ZyMUtLTXI7hZRtdGy3IEJKh3K7BPGewZMD9o
	OvwauCgIq7h5iEaqy1yoygEJF0ZfGVFkDDThd2sEEuNpkVm1nCiT3o+3CHRWL8CclUUr
	nPr8HBDGQicpYEAjGloJM2KmFMyzyXqiB7QXtHVyQXGghKzQ4uYw8zj2lsW+dWxbhbhM
	L4pw==
X-Gm-Message-State: ALyK8tLA2hQprXOIwkjU62G5f3Uu5h+dgdWe4yFmA2+EhgLzdLfYGmRtMMQQeKZ/9VrooA==
X-Received: by 10.140.23.8 with SMTP id 8mr3704007qgo.78.1466185435224;
	Fri, 17 Jun 2016 10:43:55 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	x21sm5613702qkx.12.2016.06.17.10.43.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 10:43:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jun 2016 13:43:41 -0400
Message-Id: <1466185421-5620-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] crash: update to version 7.1.5
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
X-List-Received-Date: Fri, 17 Jun 2016 17:43:55 -0000

  * Resolves issues with gcc-6 on ARM

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../crash/crash/0001-cross_add_configure_option.patch              | 4 ++--
 .../crash/crash/gdb_build_jobs_and_not_write_crash_target.patch    | 2 +-
 .../crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch  | 6 +++---
 meta-oe/recipes-kernel/crash/{crash_7.1.3.bb => crash_7.1.5.bb}    | 7 ++-----
 4 files changed, 8 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-kernel/crash/{crash_7.1.3.bb => crash_7.1.5.bb} (94%)

diff --git a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
index 229647f..39732a9 100644
--- a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
+++ b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
@@ -11,13 +11,13 @@ diff --git a/Makefile b/Makefile
 index 9c44633..39bebd0 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -229,7 +229,7 @@ gdb_merge: force
+@@ -232,7 +232,7 @@ gdb_merge: force
  	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
  	@rm -f ${PROGRAM}
  	@if [ ! -f ${GDB}/config.status ]; then \
 -	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
 +	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
- 	    --with-bugurl="" --with-expat=no --with-python=no; \
+ 	    --with-bugurl="" --with-expat=no --with-python=no --disable-sim; \
  	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
  	else make --no-print-directory rebuild; fi
 @@ -277,7 +277,7 @@ force:
diff --git a/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch b/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
index 3f4d1bc..aa5f44d 100644
--- a/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
+++ b/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
@@ -16,7 +16,7 @@ index 27a1d47..bcf2d2f 100644
 @@ -232,8 +232,8 @@ gdb_merge: force
  	@if [ ! -f ${GDB}/config.status ]; then \
  	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
- 	    --with-bugurl="" --with-expat=no --with-python=no; \
+ 	    --with-bugurl="" --with-expat=no --with-python=no --disable-sim; \
 -	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
 -	else make --no-print-directory rebuild; fi
 +	  make --no-print-directory CRASH_TARGET=${TARGET} ${GDB_MAKE_JOBS}; ) \
diff --git a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch b/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
index c24db10..905b4c2 100644
--- a/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
+++ b/meta-oe/recipes-kernel/crash/crash/remove-unrecognized-gcc-option-m32-for-mips.patch
@@ -13,16 +13,16 @@ diff --git a/configure.c b/configure.c
 index cf1973b..71e97b3 100644
 --- a/configure.c
 +++ b/configure.c
-@@ -148,7 +148,7 @@ void add_extra_lib(char *);
+@@ -151,7 +151,7 @@ void add_extra_lib(char *);
  #define TARGET_CFLAGS_PPC64_ON_X86_64  "TARGET_CFLAGS="
  #define TARGET_CFLAGS_MIPS            "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
  #define TARGET_CFLAGS_MIPS_ON_X86     "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
 -#define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-m32 -D_FILE_OFFSET_BITS=64"
 +#define TARGET_CFLAGS_MIPS_ON_X86_64  "TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64"
+ #define TARGET_CFLAGS_SPARC64         "TARGET_CFLAGS="
  
  #define GDB_TARGET_DEFAULT        "GDB_CONF_FLAGS="
- #define GDB_TARGET_ARM_ON_X86     "GDB_CONF_FLAGS=--target=arm-elf-linux"
-@@ -158,7 +158,7 @@ void add_extra_lib(char *);
+@@ -162,7 +162,7 @@ void add_extra_lib(char *);
  #define GDB_TARGET_ARM64_ON_X86_64  "GDB_CONF_FLAGS=--target=aarch64-elf-linux"   /* TBD */
  #define GDB_TARGET_PPC64_ON_X86_64  "GDB_CONF_FLAGS=--target=powerpc64le-unknown-linux-gnu"
  #define GDB_TARGET_MIPS_ON_X86     "GDB_CONF_FLAGS=--target=mipsel-elf-linux"
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
similarity index 94%
rename from meta-oe/recipes-kernel/crash/crash_7.1.3.bb
rename to meta-oe/recipes-kernel/crash/crash_7.1.5.bb
index 49b187d..ce13b71 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
@@ -24,8 +24,8 @@ SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;download
            file://remove-unrecognized-gcc-option-m32-for-mips.patch \
            "
 
-SRC_URI[md5sum] = "155889a233c5230ef1d387858091d294"
-SRC_URI[sha256sum] = "ae98529d42b843f07d795b86b8f8529f64cc607ee3c58affc5a8aa8a506e183d"
+SRC_URI[md5sum] = "7bd06eaec6827d4fac636b2b592d3056"
+SRC_URI[sha256sum] = "c3954412c8557614a0d50092c007aa96b4e3e6e97453dfbb60241ab680caf7b2"
 
 SRC_URI[gdb.md5sum] = "a9836707337e5f7bf76a009a8904f470"
 SRC_URI[gdb.sha256sum] = "8070389a5dcc104eb0be483d582729f98ed4d761ad19cedd3f17b5d2502faa36"
@@ -110,6 +110,3 @@ RDEPENDS_${PN}_class-cross = ""
 # Causes gcc to get stuck and eat all available memory in qemuarm builds
 # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
 ARM_INSTRUCTION_SET = "arm"
-
-# http://errors.yoctoproject.org/Errors/Details/68624/
-PNBLACKLIST[crash] ?= "BROKEN: fails to build with gcc-6"
-- 
1.9.1


