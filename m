Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3A99D71987
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 07:41:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so15448342pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 23:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8IMz+61MDrCLyH4Xq9j+t3BSwWbexAxIylVBBWuh28A=;
	b=lsAeqk5mVDdnfIfUc45H+YIyJXmIq9zqRfFdHNiyiIOTksCRqJMQgBiXW7twe2gV7l
	UKKXXbdvpUFTeL4B1APG/TSKfK/+1jMbsRwhTtgdW5NJkaMwSwS2JTwYp/2XBi5+sd1j
	jvQ8ZS/neg5ZkKjNpiqla0PvVu8i9qU6X5nreFO3dwMpr/Q7ESjUQrLen3eNJbOZHjbZ
	BYHShtWzVDUq20XtJcDg2wNwjYy4VPqQHEdxXg4W/vhVev/7WuBh9hexPS9ulqgJZBOp
	3VHprzBK/KdItor1KaQLWRRXyz3AQUUwjR9SyU95fis40jG+Mc+DIU+FTCN5/W5EXSID
	l+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8IMz+61MDrCLyH4Xq9j+t3BSwWbexAxIylVBBWuh28A=;
	b=QC/oarVUM1GqD3RCWpYA12OPOPRdtAmQ6PHN1EN8WgMP68jFwfCnb9sOQ3ZZRlBftl
	4XUUS2b1nf6DtEJsfchi69JiLuVAmlasZANzGAqEToNXhtFIgycbN93rlpAdMvkgHDJG
	x7mOapStOOLYdoAQj/mV1zDmeJVVYwsoKYZbNnvfWRs3GcvshrXe5+Sbo5HgEIPq1NEf
	Oat6SGt+C5iXl15JJRhxEXxXp8rLlzDWU7R/hWCJIvukxSWMQULoG+AyH0q0BXLcKVEQ
	CsdCnvzdef4GXbQvF496861B+N2Goex+rzPELeoxYRgezBrRLSmdBop1NzX6kir4ZmaO
	6hOw==
X-Gm-Message-State: ABUngvcwv/ICcAKh/BzDIdqbT2J6GV1pcBZBlQlX1NFfYsLJyFDekM41GqdHZL0w8KDuIA==
X-Received: by 10.99.129.200 with SMTP id t191mr8633753pgd.180.1478504464738; 
	Sun, 06 Nov 2016 23:41:04 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	131sm37626623pfx.92.2016.11.06.23.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 23:41:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:40:56 -0800
Message-Id: <20161107074056.18613-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161107074056.18613-1-raj.khem@gmail.com>
References: <20161107074056.18613-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/3] kodi-17: Fix build with musl
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
X-List-Received-Date: Mon, 07 Nov 2016 07:41:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0006-build-Add-support-for-musl-triplets.patch | 180 ++++++++
 .../kodi/kodi-17/0007-Remove-FILEWRAP.patch        |  58 +++
 .../kodi/kodi-17/0008-Fix-file_Emu-on-musl.patch   | 496 +++++++++++++++++++++
 .../recipes-mediacenter/kodi/kodi_17.bb            |   6 +
 4 files changed, 740 insertions(+)
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-build-Add-support-for-musl-triplets.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Remove-FILEWRAP.patch
 create mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-Fix-file_Emu-on-musl.patch

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-build-Add-support-for-musl-triplets.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-build-Add-support-for-musl-triplets.patch
new file mode 100644
index 0000000..71c5c41
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-build-Add-support-for-musl-triplets.patch
@@ -0,0 +1,180 @@
+From 99769ac5653884e49d1c8c34e65d2e565cd9e314 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 11:54:41 -0800
+Subject: [PATCH 6/6] build: Add support for musl triplets
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac               | 12 ++++++------
+ m4/xbmc_arch.m4            | 22 +++++++++++-----------
+ tools/depends/configure.ac | 12 ++++++------
+ 3 files changed, 23 insertions(+), 23 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 52d5f11..a772973 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -526,7 +526,7 @@ case $host in
+      use_x11=no
+      build_shared_lib=yes
+      ;;
+-  i*86*-linux-gnu*|i*86*-*-linux-uclibc*)
++  i*86*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
+      target_platform=target_linux
+      CORE_SYSTEM_NAME=linux
+      ARCH="i486-linux"
+@@ -549,7 +549,7 @@ case $host in
+        fi
+      fi
+      ;;
+-  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*)
++  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
+      target_platform=target_linux
+      CORE_SYSTEM_NAME=linux
+      ARCH="x86_64-linux"
+@@ -601,17 +601,17 @@ case $host in
+      DEPENDS_ROOT_FOR_XCODE=$(echo ${prefix%/*})
+      AC_SUBST([DEPENDS_ROOT_FOR_XCODE])
+      ;;
+-  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*)
++  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*|powerpc-*-linux-musl*)
+      target_platform=target_linux
+      CORE_SYSTEM_NAME=linux
+      ARCH="powerpc-linux"
+      ;;
+-  powerpc64*-*-linux-gnu*|powerpc64*-*-linux-uclibc*)
++  powerpc64*-*-linux-gnu*|powerpc64*-*-linux-uclibc*|powerpc64*-*-linux-musl*)
+      target_platform=target_linux
+      CORE_SYSTEM_NAME=linux
+      ARCH="powerpc64-linux"
+      ;;
+-  arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
++  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*)
+      target_platform=target_linux
+      CORE_SYSTEM_NAME=linux
+      ARCH="arm"
+@@ -621,7 +621,7 @@ case $host in
+      use_gl=no
+      USE_STATIC_FFMPEG=1
+      ;;
+-  aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*)
++  aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*|aarch64*-*-linux-musl*)
+      target_platform=target_linux
+      ARCH="aarch64"
+      use_arch="aarch64"
+diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
+index d28f263..ff5dc20 100644
+--- a/m4/xbmc_arch.m4
++++ b/m4/xbmc_arch.m4
+@@ -2,10 +2,10 @@ AC_DEFUN([XBMC_SETUP_ARCH_DEFINES],[
+ 
+ # build detection and setup - this is the native arch
+ case $build in
+-  i*86*-linux-gnu*|i*86*-*-linux-uclibc*)
++  i*86*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
+      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+-  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*)
++  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
+      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+   i386-*-freebsd*)
+@@ -17,13 +17,13 @@ case $build in
+   *86*-apple-darwin*)
+      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_DARWIN -DTARGET_DARWIN_OSX -D_LINUX")
+      ;;
+-  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*)
++  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*|powerpc-*-linux-musl*)
+      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_POWERPC")
+      ;;
+-  powerpc64-*-linux-gnu*|powerpc64-*-linux-uclibc*)
++  powerpc64-*-linux-gnu*|powerpc64-*-linux-uclibc*|powerpc64-*-linux-musl*)
+      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_POWERPC64")
+      ;;
+-  arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
++  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*)
+      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+   *)
+@@ -33,10 +33,10 @@ esac
+ 
+ # host detection and setup - this is the target arch
+ case $host in
+-  i*86*-linux-gnu*|i*86*-*-linux-uclibc*)
++  i*86*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+-  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*)
++  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+   i386-*-freebsd*)
+@@ -54,16 +54,16 @@ case $host in
+   powerpc-apple-darwin*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_DARWIN -DTARGET_DARWIN_OSX -D_LINUX")
+      ;;
+-  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*)
++  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*|powerpc-*-linux-musl*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_POWERPC")
+      ;;
+-  powerpc64*-*-linux-gnu*|powerpc64*-*-linux-uclibc*)
++  powerpc64*-*-linux-gnu*|powerpc64*-*-linux-uclibc*|powerpc64*-*-linux-musl*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_POWERPC64")
+      ;;
+-  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*)
++  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*|aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*|aarch64*-*-linux-musl*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+-  mips*-*-linux-gnu*|mips*-*-linux-uclibc*)
++  mips*-*-linux-gnu*|mips*-*-linux-uclibc*|mips*-*-linux-musl*)
+      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
+      ;;
+   *-*linux-android*)
+diff --git a/tools/depends/configure.ac b/tools/depends/configure.ac
+index a0bc386..b96d20e 100644
+--- a/tools/depends/configure.ac
++++ b/tools/depends/configure.ac
+@@ -120,13 +120,13 @@ platform_cc=gcc
+ platform_cxx=g++
+ 
+ case $build in
+-  arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
++  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*)
+     build_os="linux"
+   ;;
+-  *i686*-linux-gnu*|i*86*-*-linux-uclibc*)
++  *i686*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
+     build_os="linux"
+   ;;
+-  x86_64*-linux-gnu*|x86_64-*-linux-uclibc*)
++  x86_64*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
+     build_os="linux"
+   ;;
+   *darwin*)
+@@ -186,7 +186,7 @@ case $host in
+     #android builds are always cross
+     cross_compiling="yes"
+   ;;
+-  arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
++  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*)
+     if test "$use_platform" = "auto"; then
+       if test "x$use_cpu" = "xauto"; then
+         use_cpu=$host_cpu
+@@ -210,12 +210,12 @@ case $host in
+       platform_os="linux"
+     fi
+   ;;
+-  *i686*-linux-gnu*|i*86*-*-linux-uclibc*)
++  *i686*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
+     use_cpu=$host_cpu
+     use_toolchain="${use_toolchain:-/usr}"
+     platform_os="linux"
+   ;;
+-  x86_64*-linux-gnu*|x86_64-*-linux-uclibc*)
++  x86_64*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
+     use_cpu=$host_cpu
+     use_toolchain="${use_toolchain:-/usr}"
+     platform_cflags="-fPIC -DPIC"
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Remove-FILEWRAP.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Remove-FILEWRAP.patch
new file mode 100644
index 0000000..c2d3259
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Remove-FILEWRAP.patch
@@ -0,0 +1,58 @@
+From f4c5710192256e903b253353fb018ebd68d0b651 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 22:35:16 -0800
+Subject: [PATCH 7/8] Remove FILEWRAP
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ xbmc/utils/posix/PosixInterfaceForCLog.cpp | 6 +-----
+ xbmc/utils/posix/PosixInterfaceForCLog.h   | 4 +---
+ 2 files changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/xbmc/utils/posix/PosixInterfaceForCLog.cpp b/xbmc/utils/posix/PosixInterfaceForCLog.cpp
+index 6614487..a91d157 100644
+--- a/xbmc/utils/posix/PosixInterfaceForCLog.cpp
++++ b/xbmc/utils/posix/PosixInterfaceForCLog.cpp
+@@ -28,10 +28,6 @@
+ #include "platform/android/activity/XBMCApp.h"
+ #endif // TARGET_ANDROID
+ 
+-struct FILEWRAP : public FILE
+-{};
+-
+-
+ CPosixInterfaceForCLog::CPosixInterfaceForCLog() :
+   m_file(NULL)
+ { }
+@@ -51,7 +47,7 @@ bool CPosixInterfaceForCLog::OpenLogFile(const std::string &logFilename, const s
+   (void)remove(backupOldLogToFilename.c_str()); // if it's failed, try to continue
+   (void)rename(logFilename.c_str(), backupOldLogToFilename.c_str()); // if it's failed, try to continue
+ 
+-  m_file = (FILEWRAP*)fopen(logFilename.c_str(), "wb");
++  m_file = fopen(logFilename.c_str(), "wb");
+   if (!m_file)
+     return false; // error, can't open log file
+ 
+diff --git a/xbmc/utils/posix/PosixInterfaceForCLog.h b/xbmc/utils/posix/PosixInterfaceForCLog.h
+index bb53442..2983e73 100644
+--- a/xbmc/utils/posix/PosixInterfaceForCLog.h
++++ b/xbmc/utils/posix/PosixInterfaceForCLog.h
+@@ -21,8 +21,6 @@
+ 
+ #include <string>
+ 
+-struct FILEWRAP; // forward declaration, wrapper for FILE
+-
+ class CPosixInterfaceForCLog
+ {
+ public:
+@@ -34,5 +32,5 @@ public:
+   void PrintDebugString(const std::string& debugString);
+   static void GetCurrentLocalTime(int& hour, int& minute, int& second);
+ private:
+-  FILEWRAP* m_file;
++  FILE * m_file;
+ };
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-Fix-file_Emu-on-musl.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-Fix-file_Emu-on-musl.patch
new file mode 100644
index 0000000..7598c7a
--- /dev/null
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-Fix-file_Emu-on-musl.patch
@@ -0,0 +1,496 @@
+From 3a10d9479e7c9a77c478b8b428e4309ff22e8498 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Nov 2016 23:08:27 -0800
+Subject: [PATCH 8/8] Fix file_Emu on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ xbmc/cores/DllLoader/exports/emu_msvcrt.cpp        |  28 ++--
+ xbmc/cores/DllLoader/exports/emu_msvcrt.h          |   2 +-
+ .../DllLoader/exports/util/EmuFileWrapper.cpp      | 172 +++++++++------------
+ xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h |  27 ++--
+ xbmc/cores/DllLoader/exports/wrapper.c             |   4 +-
+ 5 files changed, 99 insertions(+), 134 deletions(-)
+
+diff --git a/xbmc/cores/DllLoader/exports/emu_msvcrt.cpp b/xbmc/cores/DllLoader/exports/emu_msvcrt.cpp
+index ab14942..a39014a 100644
+--- a/xbmc/cores/DllLoader/exports/emu_msvcrt.cpp
++++ b/xbmc/cores/DllLoader/exports/emu_msvcrt.cpp
+@@ -51,6 +51,7 @@
+ #include <fcntl.h>
+ #include <time.h>
+ #include <signal.h>
++#include <paths.h>
+ #ifdef TARGET_POSIX
+ #include "PlatformDefs.h" // for __stat64
+ #include "XFileUtils.h"
+@@ -476,13 +477,10 @@ extern "C"
+     EmuFileObject* o = g_emuFileWrapper.GetFileObjectByDescriptor(fd);
+     if (o)
+     {
+-      if(!o->used)
+-        return NULL;
+-
+       int nmode = convert_fmode(mode);
+       if( (o->mode & nmode) != nmode)
+         CLog::Log(LOGWARNING, "dll_fdopen - mode 0x%x differs from fd mode 0x%x", nmode, o->mode);
+-      return &o->file_emu;
++      return g_emuFileWrapper.GetStreamByFileObject(o);
+     }
+     else if (!IS_STD_DESCRIPTOR(fd))
+     {
+@@ -545,7 +543,7 @@ extern "C"
+         return -1;
+       }
+       object->mode = iMode;
+-      return g_emuFileWrapper.GetDescriptorByStream(&object->file_emu);
++      return g_emuFileWrapper.GetDescriptorByFileObject(object);
+     }
+     delete pFile;
+     return -1;
+@@ -1214,8 +1212,8 @@ extern "C"
+   {
+     FILE* file = NULL;
+ #if defined(TARGET_LINUX) && !defined(TARGET_ANDROID)
+-    if (strcmp(filename, MOUNTED) == 0
+-    ||  strcmp(filename, MNTTAB) == 0)
++    if (strcmp(filename, _PATH_MOUNTED) == 0
++    ||  strcmp(filename, _PATH_MNTTAB) == 0)
+     {
+       CLog::Log(LOGINFO, "%s - something opened the mount file, let's hope it knows what it's doing", __FUNCTION__);
+       return fopen(filename, mode);
+@@ -1622,7 +1620,7 @@ extern "C"
+     int ret;
+ 
+     ret = dll_fgetpos64(stream, &tmpPos);
+-#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
++#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
+     *pos = (fpos_t)tmpPos;
+ #else
+     pos->__pos = (off_t)tmpPos.__pos;
+@@ -1635,8 +1633,9 @@ extern "C"
+     CFile* pFile = g_emuFileWrapper.GetFileXbmcByStream(stream);
+     if (pFile != NULL)
+     {
+-#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
+-      *pos = pFile->GetPosition();
++#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
++      uint64_t *ppos = (uint64_t *) pos;
++      *ppos = pFile->GetPosition();
+ #else
+       pos->__pos = pFile->GetPosition();
+ #endif
+@@ -1657,8 +1656,9 @@ extern "C"
+     int fd = g_emuFileWrapper.GetDescriptorByStream(stream);
+     if (fd >= 0)
+     {
+-#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
+-      if (dll_lseeki64(fd, *pos, SEEK_SET) >= 0)
++#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
++      const uint64_t *ppos = (const uint64_t *) pos;
++      if (dll_lseeki64(fd, *ppos, SEEK_SET) >= 0)
+ #else
+       if (dll_lseeki64(fd, (__off64_t)pos->__pos, SEEK_SET) >= 0)
+ #endif
+@@ -1674,7 +1674,7 @@ extern "C"
+     {
+       // it might be something else than a file, or the file is not emulated
+       // let the operating system handle it
+-#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
++#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
+       return fsetpos(stream, pos);
+ #else
+       return fsetpos64(stream, pos);
+@@ -1690,7 +1690,7 @@ extern "C"
+     if (fd >= 0)
+     {
+       fpos64_t tmpPos;
+-#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
++#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
+       tmpPos= *pos;
+ #else
+       tmpPos.__pos = (off64_t)(pos->__pos);
+diff --git a/xbmc/cores/DllLoader/exports/emu_msvcrt.h b/xbmc/cores/DllLoader/exports/emu_msvcrt.h
+index 3294d9a..c7c483f 100644
+--- a/xbmc/cores/DllLoader/exports/emu_msvcrt.h
++++ b/xbmc/cores/DllLoader/exports/emu_msvcrt.h
+@@ -24,7 +24,7 @@
+ #define _onexit_t void*
+ #endif
+ 
+-#if defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
++#if defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID) || !defined(__GLIBC__)
+ typedef off_t __off_t;
+ typedef int64_t off64_t;
+ typedef off64_t __off64_t;
+diff --git a/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.cpp b/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.cpp
+index 8927d41..e9a2ab0 100644
+--- a/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.cpp
++++ b/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.cpp
+@@ -52,16 +52,7 @@ constexpr bool isValidFilePtr(FILE* f)
+ }
+ CEmuFileWrapper::CEmuFileWrapper()
+ {
+-  // since we always use dlls we might just initialize it directly
+-  for (int i = 0; i < MAX_EMULATED_FILES; i++)
+-  {
+-    memset(&m_files[i], 0, sizeof(EmuFileObject));
+-    m_files[i].used = false;
+-#if defined(TARGET_WINDOWS) && (_MSC_VER >= 1900)
+-    m_files[i].file_emu._Placeholder = new kodi_iobuf();
+-#endif
+-    FileDescriptor(m_files[i].file_emu)->_file = -1;
+-  }
++  memset(m_files, 0, sizeof(m_files));
+ }
+ 
+ CEmuFileWrapper::~CEmuFileWrapper()
+@@ -73,29 +64,7 @@ void CEmuFileWrapper::CleanUp()
+ {
+   CSingleLock lock(m_criticalSection);
+   for (int i = 0; i < MAX_EMULATED_FILES; i++)
+-  {
+-    if (m_files[i].used)
+-    {
+-      m_files[i].file_xbmc->Close();
+-      delete m_files[i].file_xbmc;
+-
+-      if (m_files[i].file_lock)
+-      {
+-        delete m_files[i].file_lock;
+-        m_files[i].file_lock = nullptr;
+-      }
+-#if !defined(TARGET_WINDOWS)
+-      //Don't memset on Windows as it overwrites our pointer
+-      memset(&m_files[i], 0, sizeof(EmuFileObject));
+-#endif
+-      m_files[i].used = false;
+-      FileDescriptor(m_files[i].file_emu)->_file = -1;
+-    }
+-#if defined(TARGET_WINDOWS) && (_MSC_VER >= 1900)
+-    delete static_cast<kodi_iobuf*>(m_files[i].file_emu._Placeholder);
+-    m_files[i].file_emu._Placeholder = nullptr;
+-#endif
+-  }
++    UnRegisterFileObject(&m_files[i], true);
+ }
+ 
+ EmuFileObject* CEmuFileWrapper::RegisterFileObject(XFILE::CFile* pFile)
+@@ -106,13 +75,11 @@ EmuFileObject* CEmuFileWrapper::RegisterFileObject(XFILE::CFile* pFile)
+ 
+   for (int i = 0; i < MAX_EMULATED_FILES; i++)
+   {
+-    if (!m_files[i].used)
++    if (!m_files[i].file_xbmc)
+     {
+       // found a free location
+       object = &m_files[i];
+-      object->used = true;
+       object->file_xbmc = pFile;
+-      FileDescriptor(object->file_emu)->_file = (i + FILE_WRAPPER_OFFSET);
+       object->file_lock = new CCriticalSection();
+       break;
+     }
+@@ -121,82 +88,74 @@ EmuFileObject* CEmuFileWrapper::RegisterFileObject(XFILE::CFile* pFile)
+   return object;
+ }
+ 
+-void CEmuFileWrapper::UnRegisterFileObjectByDescriptor(int fd)
++void CEmuFileWrapper::UnRegisterFileObject(EmuFileObject *object, bool free_file)
++
+ {
+-  int i = fd - FILE_WRAPPER_OFFSET;
+-  if (! (i >= 0 && i < MAX_EMULATED_FILES))
+-    return;
++  if (object && object->file_xbmc)
++  {
++    if (object->file_xbmc && free_file)
++    {
++      object->file_xbmc->Close();
++      delete object->file_xbmc;
++    }
++    if (object->file_lock)
++    {
++      delete object->file_lock;
++    }
+ 
+-  if (!m_files[i].used)
+-    return;
++    memset(object, 0, sizeof(*object));
++   }
++}
+ 
++void CEmuFileWrapper::UnRegisterFileObjectByDescriptor(int fd)
++{
+   CSingleLock lock(m_criticalSection);
+-
+-  // we assume the emulated function alreay deleted the CFile object
+-  if (m_files[i].file_lock)
+-  {
+-    delete m_files[i].file_lock;
+-    m_files[i].file_lock = nullptr;
+-  }
+-#if !defined(TARGET_WINDOWS)
+-  //Don't memset on Windows as it overwrites our pointer
+-  memset(&m_files[i], 0, sizeof(EmuFileObject));
+-#endif
+-  m_files[i].used = false;
+-  FileDescriptor(m_files[i].file_emu)->_file = -1;
++  UnRegisterFileObject(GetFileObjectByDescriptor(fd), false);
+ }
+ 
+ void CEmuFileWrapper::UnRegisterFileObjectByStream(FILE* stream)
+ {
+   if (isValidFilePtr(stream))
+   {
+-    return UnRegisterFileObjectByDescriptor(FileDescriptor(*stream)->_file);
++    CSingleLock lock(m_criticalSection);
++    UnRegisterFileObject(GetFileObjectByStream(stream), false);
+   }
+ }
+ 
+ void CEmuFileWrapper::LockFileObjectByDescriptor(int fd)
+ {
+-  int i = fd - FILE_WRAPPER_OFFSET;
+-  if (i >= 0 && i < MAX_EMULATED_FILES)
++  EmuFileObject* object = GetFileObjectByDescriptor(fd);
++  if (object && object->file_xbmc)
+   {
+-    if (m_files[i].used)
+-    {
+-      m_files[i].file_lock->lock();
+-    }
++    object->file_lock->lock();
+   }
+ }
+ 
+ bool CEmuFileWrapper::TryLockFileObjectByDescriptor(int fd)
+ {
+-  int i = fd - FILE_WRAPPER_OFFSET;
+-  if (i >= 0 && i < MAX_EMULATED_FILES)
++  EmuFileObject* object = GetFileObjectByDescriptor(fd);
++  if (object && object->file_xbmc)
+   {
+-    if (m_files[i].used)
+-    {
+-      return m_files[i].file_lock->try_lock();
+-    }
++    return object->file_lock->try_lock();
+   }
+   return false;
+ }
+ 
+ void CEmuFileWrapper::UnlockFileObjectByDescriptor(int fd)
+ {
+-  int i = fd - FILE_WRAPPER_OFFSET;
+-  if (i >= 0 && i < MAX_EMULATED_FILES)
++  EmuFileObject* object = GetFileObjectByDescriptor(fd);
++  if (object && object->file_xbmc)
+   {
+-    if (m_files[i].used)
+-    {
+-      m_files[i].file_lock->unlock();
+-    }
++    object->file_lock->unlock();
+   }
+ }
+ 
+ EmuFileObject* CEmuFileWrapper::GetFileObjectByDescriptor(int fd)
+ {
+-  int i = fd - FILE_WRAPPER_OFFSET;
++  int i = fd - 0x7000000;
+   if (i >= 0 && i < MAX_EMULATED_FILES)
+   {
+-    if (m_files[i].used)
++    if (m_files[i].file_xbmc)
+     {
+       return &m_files[i];
+     }
+@@ -204,20 +163,39 @@ EmuFileObject* CEmuFileWrapper::GetFileObjectByDescriptor(int fd)
+   return nullptr;
+ }
+ 
++int CEmuFileWrapper::GetDescriptorByFileObject(EmuFileObject *object)
++{
++  int i = object - m_files;
++  if (i >= 0 && i < MAX_EMULATED_FILES)
++  {
++    return 0x7000000 + i;
++  }
++
++  return -1;
++}
++
+ EmuFileObject* CEmuFileWrapper::GetFileObjectByStream(FILE* stream)
+ {
+-  if (isValidFilePtr(stream))
++  EmuFileObject *object = (EmuFileObject*) stream;
++  if (object >= &m_files[0] || object < &m_files[MAX_EMULATED_FILES])
+   {
+-    return GetFileObjectByDescriptor(FileDescriptor(*stream)->_file);
++    if (object->file_xbmc)
++    {
++      return object;
++    }
+   }
++  return NULL;
++}
+ 
+-  return nullptr;
++FILE* CEmuFileWrapper::GetStreamByFileObject(EmuFileObject *object)
++{
++  return (FILE*) object;
+ }
+ 
+ XFILE::CFile* CEmuFileWrapper::GetFileXbmcByDescriptor(int fd)
+ {
+   auto object = GetFileObjectByDescriptor(fd);
+-  if (object != nullptr && object->used)
++  if (object != nullptr)
+   {
+     return object->file_xbmc;
+   }
+@@ -228,8 +206,9 @@ XFILE::CFile* CEmuFileWrapper::GetFileXbmcByStream(FILE* stream)
+ {
+   if (isValidFilePtr(stream))
+   {
+-    auto object = GetFileObjectByDescriptor(FileDescriptor(*stream)->_file);
+-    if (object != nullptr && object->used)
++    EmuFileObject* object = GetFileObjectByStream(stream);
++    if (object != NULL)
++
+     {
+       return object->file_xbmc;
+     }
+@@ -239,32 +218,21 @@ XFILE::CFile* CEmuFileWrapper::GetFileXbmcByStream(FILE* stream)
+ 
+ int CEmuFileWrapper::GetDescriptorByStream(FILE* stream)
+ {
+-  if (isValidFilePtr(stream))
+-  {
+-    int i = FileDescriptor(*stream)->_file - FILE_WRAPPER_OFFSET;
+-    if (i >= 0 && i < MAX_EMULATED_FILES)
+-    {
+-      return i + FILE_WRAPPER_OFFSET;
+-    }
+-  }
+-  return -1;
++  return GetDescriptorByFileObject(GetFileObjectByStream(stream));
+ }
+ 
+ FILE* CEmuFileWrapper::GetStreamByDescriptor(int fd)
+ {
+-  auto object = GetFileObjectByDescriptor(fd);
+-  if (object != nullptr && object->used)
+-  {
+-    return &object->file_emu;
+-  }
+-  return nullptr;
++  return GetStreamByFileObject(GetFileObjectByDescriptor(fd));
++}
++
++bool CEmuFileWrapper::DescriptorIsEmulatedFile(int fd)
++{
++  return GetFileObjectByDescriptor(fd) != NULL;
+ }
+ 
+ bool CEmuFileWrapper::StreamIsEmulatedFile(FILE* stream)
+ {
+-  if (isValidFilePtr(stream))
+-  {
+-    return DescriptorIsEmulatedFile(FileDescriptor(*stream)->_file);
+-  }
+-  return false;
++  return GetFileObjectByStream(stream) != NULL;
+ }
++
+diff --git a/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h b/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h
+index 786fa85..311a5cf 100644
+--- a/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h
++++ b/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h
+@@ -25,14 +25,14 @@
+ #include "system.h"
+ #include "threads/CriticalSection.h"
+ 
+-#if defined(TARGET_POSIX) && !defined(TARGET_DARWIN) && !defined(TARGET_FREEBSD) && !defined(TARGET_ANDROID) && !defined(__UCLIBC__)
+-#define _file _fileno
+-#elif defined(__UCLIBC__)
+-#define _file __filedes
+-#endif
++//#if defined(TARGET_POSIX) && !defined(TARGET_DARWIN) && !defined(TARGET_FREEBSD) && !defined(TARGET_ANDROID) && !defined(__UCLIBC__)
++//#define _file _fileno
++//#elif defined(__UCLIBC__)
++//#define _file __filedes
++//#endif
+ 
+ #define MAX_EMULATED_FILES    50
+-#define FILE_WRAPPER_OFFSET   0x00000200
++//#define FILE_WRAPPER_OFFSET   0x00000200
+ 
+ namespace XFILE
+ {
+@@ -47,12 +47,9 @@ struct kodi_iobuf {
+ 
+ typedef struct stEmuFileObject
+ {
+-  FILE    file_emu;
+   XFILE::CFile*  file_xbmc;
+   CCriticalSection *file_lock;
+   int mode;
+-  //Stick this last to avoid 3-7 bytes of padding
+-  bool    used;
+ } EmuFileObject;
+ 
+ class CEmuFileWrapper
+@@ -67,22 +64,22 @@ public:
+   void CleanUp();
+ 
+   EmuFileObject* RegisterFileObject(XFILE::CFile* pFile);
++  void UnRegisterFileObject(EmuFileObject*, bool free_file);
+   void UnRegisterFileObjectByDescriptor(int fd);
+   void UnRegisterFileObjectByStream(FILE* stream);
+   void LockFileObjectByDescriptor(int fd);
+   bool TryLockFileObjectByDescriptor(int fd);
+   void UnlockFileObjectByDescriptor(int fd);
+   EmuFileObject* GetFileObjectByDescriptor(int fd);
++  int GetDescriptorByFileObject(EmuFileObject*);
+   EmuFileObject* GetFileObjectByStream(FILE* stream);
++  FILE* GetStreamByFileObject(EmuFileObject*);
+   XFILE::CFile* GetFileXbmcByDescriptor(int fd);
+   XFILE::CFile* GetFileXbmcByStream(FILE* stream);
+-  static int GetDescriptorByStream(FILE* stream);
++  int GetDescriptorByStream(FILE* stream);
+   FILE* GetStreamByDescriptor(int fd);
+-  static constexpr bool DescriptorIsEmulatedFile(int fd)
+-  {
+-    return fd >= FILE_WRAPPER_OFFSET && fd < FILE_WRAPPER_OFFSET + MAX_EMULATED_FILES;
+-  }
+-  static bool StreamIsEmulatedFile(FILE* stream);
++  bool DescriptorIsEmulatedFile(int fd);
++  bool StreamIsEmulatedFile(FILE* stream);
+ private:
+   EmuFileObject m_files[MAX_EMULATED_FILES];
+   CCriticalSection m_criticalSection;
+diff --git a/xbmc/cores/DllLoader/exports/wrapper.c b/xbmc/cores/DllLoader/exports/wrapper.c
+index e363662..07825f3 100644
+--- a/xbmc/cores/DllLoader/exports/wrapper.c
++++ b/xbmc/cores/DllLoader/exports/wrapper.c
+@@ -39,13 +39,13 @@
+ #endif
+ #include <dlfcn.h>
+ 
+-#if defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
++#if defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID) || !defined(__GLIBC__)
+ typedef off_t     __off_t;
+ typedef int64_t   off64_t;
+ typedef off64_t   __off64_t;
+ typedef fpos_t    fpos64_t;
+ #define stat64    stat
+-#if defined(TARGET_DARWIN) || defined(TARGET_ANDROID)
++#if defined(TARGET_DARWIN) || defined(TARGET_ANDROID) || !defined(__GLIBC__)
+ #define _G_va_list va_list
+ #endif
+ #endif
+-- 
+2.10.2
+
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 05d9975..13be123 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -71,6 +71,12 @@ SRC_URI = "git://github.com/xbmc/xbmc.git;branch=master \
            file://0003-add-support-to-read-frequency-output-if-using-intel-.patch \
            file://0004-Disable-DVD-support.patch \
            file://0005-Always-compile-libcpluff-as-PIC.patch \
+           file://0006-build-Add-support-for-musl-triplets.patch \
+"
+
+SRC_URI_append_libc-musl = " \
+           file://0007-Remove-FILEWRAP.patch \
+           file://0008-Fix-file_Emu-on-musl.patch \
 "
 
 inherit autotools-brokensep gettext pythonnative
-- 
2.10.2


