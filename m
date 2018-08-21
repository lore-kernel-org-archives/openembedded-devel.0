Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2F87E79017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:03:29 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id h69-v6so92049pfd.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d/uzoOVaVsvsVf9BU/78eETHyJMX/GCHmuzIiU/8yB4=;
	b=sJcx2B2AAIiNPYNxFG7a8JZ7rkMhkRLVcv6JCNlpUa40bWmq/RUtccgEAZ9wxHNx8u
	2zYorJiNxIfowmahl76hTXDFiIluwRQ1fAi9ImUWjiDnjhjmlnZMOmHsJzw/h0mcIvye
	VpGXtJ0DVyE3RLSM0sYDw5c2n7eFcNnjnC28MRBqcGEygb+9AwpsPUmkSrpQFM5ur9vz
	7IanwuEOcSTwHQVmvmj4aZMhAE/cNLK72cx1DdMh/RFsE4b0hbBAzCI/Dx2MspVpThED
	5LD61VhzolYR2vQ84rT5t4gYvVTu+xbNgbR7AgahWQXJljlHPoWW9316x5UXYj8fii+Q
	aEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d/uzoOVaVsvsVf9BU/78eETHyJMX/GCHmuzIiU/8yB4=;
	b=Q47LkupFxGG0GwHsxsZCqn1KGtCSLYQDacD6f31gomrXctqSLJOpYLoCXYG71dw4j8
	OVstymrarFnPadYXmKmygW46eWlz9J8VTqDJQnCfQiA0brHxUun7piLlDQ8bNG45YLoB
	ZNvp5+KJnhcnYxY74LwOoZpdygKiya6qMpCnB2ghfDNwxE3Uo27IxeUPFv+KdcPoMO28
	p86IbzjQQWI02YKrLjvzUhd6nkfqTsgfcBJBI6fU7e9E4qcwyA4X+PlH67MnUaXFfBpY
	Cg4VjbY7saBvW3elvdYaHoBR9lvb0E/YpqjRmDuyBSZvuHYaNBoDD9yS0UX8sTb8inrf
	WZXA==
X-Gm-Message-State: AOUpUlFKGL5Z1pME6ekm+PpNYf/tief3y9A1msN97n07S+EAm8vk0Ygt
	D8xwmSkIe1l40tLN9k5SNkwfke5Y
X-Google-Smtp-Source: AA+uWPwNy3+bDcYuhhq80T5DdXenB9KYqrEKWZFvZW6F3F1LbR/jadWCuPADxpgYtIb8pHzYF+Ru/g==
X-Received: by 2002:a65:4147:: with SMTP id
	x7-v6mr9415425pgp.220.1534835008734; 
	Tue, 21 Aug 2018 00:03:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm21214669pfg.3.2018.08.21.00.03.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 00:03:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 00:03:17 -0700
Message-Id: <20180821070319.36295-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180821070319.36295-1-raj.khem@gmail.com>
References: <20180821070319.36295-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/5] kodi: Remove, use from meta-kodi
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
X-List-Received-Date: Tue, 21 Aug 2018 07:03:29 -0000

Use more uptodate version from
https://github.com/koenkooi/meta-kodi

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kodi/jsonschemabuilder-native.bb          |  24 -
 .../kodi-17/0001-Fix-file_Emu-on-musl.patch   | 496 ------------------
 ...der-of-detecting-libegl-and-libgles2.patch |  32 --
 .../kodi/kodi-17/0002-Remove-FILEWRAP.patch   |  46 --
 ...n-t-try-to-run-stuff-to-find-tinyxml.patch |  25 -
 .../kodi/kodi-17/0004-handle-SIGTERM.patch    | 163 ------
 ...ead-frequency-output-if-using-intel-.patch |  26 -
 .../kodi-17/0006-Disable-DVD-support.patch    |  35 --
 ...0007-Always-compile-libcpluff-as-PIC.patch |  30 --
 ...e-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch |  43 --
 ...-build-Add-support-for-musl-triplets.patch | 180 -------
 ...mpiler-warning-comparing-pointer-to-.patch |  40 --
 ...ss-on-unknown-architectures-setting-.patch |  54 --
 ...t-droid-fix-builds-with-AML-disabled.patch |  87 ---
 .../0013-FTPParse.cpp-use-std-string.patch    |  96 ----
 .../kodi/kodi-startup/kodi.service            |  14 -
 .../recipes-mediacenter/kodi/kodi_17.bb       | 216 --------
 17 files changed, 1607 deletions(-)
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-Fix-file_Emu-on-musl.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-Remove-FILEWRAP.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-handle-SIGTERM.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-add-support-to-read-frequency-output-if-using-intel-.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-Disable-DVD-support.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Always-compile-libcpluff-as-PIC.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0009-build-Add-support-for-musl-triplets.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0011-Let-configure-pass-on-unknown-architectures-setting-.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0012-Revert-droid-fix-builds-with-AML-disabled.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb

diff --git a/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb b/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
deleted file mode 100644
index fdb769943d..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Kodi Media Center"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://JsonSchemaBuilder.cpp;beginline=2;endline=18;md5=1f67721215c03f66545390f6e45b99c7"
-
-SRCREV = "661dd08d221f5b2bf509a696a6aca5ee7d45bb27"
-
-PV = "17.1+gitr${SRCPV}"
-SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton"
-
-inherit autotools-brokensep gettext native
-
-S = "${WORKDIR}/git/tools/depends/native/JsonSchemaBuilder/src"
-
-do_compile_prepend() {
-    for i in $(find . -name "Makefile") ; do
-        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
-    done
-
-    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
-        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${libdir}:g' $i
-    done
-}
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-Fix-file_Emu-on-musl.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-Fix-file_Emu-on-musl.patch
deleted file mode 100644
index 20b6377889..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-Fix-file_Emu-on-musl.patch
+++ /dev/null
@@ -1,496 +0,0 @@
-From 7ae4fcf290ffb0b76374efafeaee575456ac9023 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Nov 2016 23:08:27 -0800
-Subject: [PATCH 01/10] Fix file_Emu on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- xbmc/cores/DllLoader/exports/emu_msvcrt.cpp        |  28 ++--
- xbmc/cores/DllLoader/exports/emu_msvcrt.h          |   2 +-
- .../DllLoader/exports/util/EmuFileWrapper.cpp      | 172 +++++++++------------
- xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h |  27 ++--
- xbmc/cores/DllLoader/exports/wrapper.c             |   4 +-
- 5 files changed, 99 insertions(+), 134 deletions(-)
-
-diff --git a/xbmc/cores/DllLoader/exports/emu_msvcrt.cpp b/xbmc/cores/DllLoader/exports/emu_msvcrt.cpp
-index ab14942..a39014a 100644
---- a/xbmc/cores/DllLoader/exports/emu_msvcrt.cpp
-+++ b/xbmc/cores/DllLoader/exports/emu_msvcrt.cpp
-@@ -51,6 +51,7 @@
- #include <fcntl.h>
- #include <time.h>
- #include <signal.h>
-+#include <paths.h>
- #ifdef TARGET_POSIX
- #include "PlatformDefs.h" // for __stat64
- #include "XFileUtils.h"
-@@ -476,13 +477,10 @@ extern "C"
-     EmuFileObject* o = g_emuFileWrapper.GetFileObjectByDescriptor(fd);
-     if (o)
-     {
--      if(!o->used)
--        return NULL;
--
-       int nmode = convert_fmode(mode);
-       if( (o->mode & nmode) != nmode)
-         CLog::Log(LOGWARNING, "dll_fdopen - mode 0x%x differs from fd mode 0x%x", nmode, o->mode);
--      return &o->file_emu;
-+      return g_emuFileWrapper.GetStreamByFileObject(o);
-     }
-     else if (!IS_STD_DESCRIPTOR(fd))
-     {
-@@ -545,7 +543,7 @@ extern "C"
-         return -1;
-       }
-       object->mode = iMode;
--      return g_emuFileWrapper.GetDescriptorByStream(&object->file_emu);
-+      return g_emuFileWrapper.GetDescriptorByFileObject(object);
-     }
-     delete pFile;
-     return -1;
-@@ -1214,8 +1212,8 @@ extern "C"
-   {
-     FILE* file = NULL;
- #if defined(TARGET_LINUX) && !defined(TARGET_ANDROID)
--    if (strcmp(filename, MOUNTED) == 0
--    ||  strcmp(filename, MNTTAB) == 0)
-+    if (strcmp(filename, _PATH_MOUNTED) == 0
-+    ||  strcmp(filename, _PATH_MNTTAB) == 0)
-     {
-       CLog::Log(LOGINFO, "%s - something opened the mount file, let's hope it knows what it's doing", __FUNCTION__);
-       return fopen(filename, mode);
-@@ -1622,7 +1620,7 @@ extern "C"
-     int ret;
- 
-     ret = dll_fgetpos64(stream, &tmpPos);
--#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-+#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-     *pos = (fpos_t)tmpPos;
- #else
-     pos->__pos = (off_t)tmpPos.__pos;
-@@ -1635,8 +1633,9 @@ extern "C"
-     CFile* pFile = g_emuFileWrapper.GetFileXbmcByStream(stream);
-     if (pFile != NULL)
-     {
--#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
--      *pos = pFile->GetPosition();
-+#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-+      uint64_t *ppos = (uint64_t *) pos;
-+      *ppos = pFile->GetPosition();
- #else
-       pos->__pos = pFile->GetPosition();
- #endif
-@@ -1657,8 +1656,9 @@ extern "C"
-     int fd = g_emuFileWrapper.GetDescriptorByStream(stream);
-     if (fd >= 0)
-     {
--#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
--      if (dll_lseeki64(fd, *pos, SEEK_SET) >= 0)
-+#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-+      const uint64_t *ppos = (const uint64_t *) pos;
-+      if (dll_lseeki64(fd, *ppos, SEEK_SET) >= 0)
- #else
-       if (dll_lseeki64(fd, (__off64_t)pos->__pos, SEEK_SET) >= 0)
- #endif
-@@ -1674,7 +1674,7 @@ extern "C"
-     {
-       // it might be something else than a file, or the file is not emulated
-       // let the operating system handle it
--#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-+#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-       return fsetpos(stream, pos);
- #else
-       return fsetpos64(stream, pos);
-@@ -1690,7 +1690,7 @@ extern "C"
-     if (fd >= 0)
-     {
-       fpos64_t tmpPos;
--#if !defined(TARGET_POSIX) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-+#if !defined(__GLIBC__) || defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-       tmpPos= *pos;
- #else
-       tmpPos.__pos = (off64_t)(pos->__pos);
-diff --git a/xbmc/cores/DllLoader/exports/emu_msvcrt.h b/xbmc/cores/DllLoader/exports/emu_msvcrt.h
-index 3294d9a..c7c483f 100644
---- a/xbmc/cores/DllLoader/exports/emu_msvcrt.h
-+++ b/xbmc/cores/DllLoader/exports/emu_msvcrt.h
-@@ -24,7 +24,7 @@
- #define _onexit_t void*
- #endif
- 
--#if defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-+#if defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID) || !defined(__GLIBC__)
- typedef off_t __off_t;
- typedef int64_t off64_t;
- typedef off64_t __off64_t;
-diff --git a/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.cpp b/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.cpp
-index 8927d41..e9a2ab0 100644
---- a/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.cpp
-+++ b/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.cpp
-@@ -52,16 +52,7 @@ constexpr bool isValidFilePtr(FILE* f)
- }
- CEmuFileWrapper::CEmuFileWrapper()
- {
--  // since we always use dlls we might just initialize it directly
--  for (int i = 0; i < MAX_EMULATED_FILES; i++)
--  {
--    memset(&m_files[i], 0, sizeof(EmuFileObject));
--    m_files[i].used = false;
--#if defined(TARGET_WINDOWS) && (_MSC_VER >= 1900)
--    m_files[i].file_emu._Placeholder = new kodi_iobuf();
--#endif
--    FileDescriptor(m_files[i].file_emu)->_file = -1;
--  }
-+  memset(m_files, 0, sizeof(m_files));
- }
- 
- CEmuFileWrapper::~CEmuFileWrapper()
-@@ -73,29 +64,7 @@ void CEmuFileWrapper::CleanUp()
- {
-   CSingleLock lock(m_criticalSection);
-   for (int i = 0; i < MAX_EMULATED_FILES; i++)
--  {
--    if (m_files[i].used)
--    {
--      m_files[i].file_xbmc->Close();
--      delete m_files[i].file_xbmc;
--
--      if (m_files[i].file_lock)
--      {
--        delete m_files[i].file_lock;
--        m_files[i].file_lock = nullptr;
--      }
--#if !defined(TARGET_WINDOWS)
--      //Don't memset on Windows as it overwrites our pointer
--      memset(&m_files[i], 0, sizeof(EmuFileObject));
--#endif
--      m_files[i].used = false;
--      FileDescriptor(m_files[i].file_emu)->_file = -1;
--    }
--#if defined(TARGET_WINDOWS) && (_MSC_VER >= 1900)
--    delete static_cast<kodi_iobuf*>(m_files[i].file_emu._Placeholder);
--    m_files[i].file_emu._Placeholder = nullptr;
--#endif
--  }
-+    UnRegisterFileObject(&m_files[i], true);
- }
- 
- EmuFileObject* CEmuFileWrapper::RegisterFileObject(XFILE::CFile* pFile)
-@@ -106,13 +75,11 @@ EmuFileObject* CEmuFileWrapper::RegisterFileObject(XFILE::CFile* pFile)
- 
-   for (int i = 0; i < MAX_EMULATED_FILES; i++)
-   {
--    if (!m_files[i].used)
-+    if (!m_files[i].file_xbmc)
-     {
-       // found a free location
-       object = &m_files[i];
--      object->used = true;
-       object->file_xbmc = pFile;
--      FileDescriptor(object->file_emu)->_file = (i + FILE_WRAPPER_OFFSET);
-       object->file_lock = new CCriticalSection();
-       break;
-     }
-@@ -121,82 +88,74 @@ EmuFileObject* CEmuFileWrapper::RegisterFileObject(XFILE::CFile* pFile)
-   return object;
- }
- 
--void CEmuFileWrapper::UnRegisterFileObjectByDescriptor(int fd)
-+void CEmuFileWrapper::UnRegisterFileObject(EmuFileObject *object, bool free_file)
-+
- {
--  int i = fd - FILE_WRAPPER_OFFSET;
--  if (! (i >= 0 && i < MAX_EMULATED_FILES))
--    return;
-+  if (object && object->file_xbmc)
-+  {
-+    if (object->file_xbmc && free_file)
-+    {
-+      object->file_xbmc->Close();
-+      delete object->file_xbmc;
-+    }
-+    if (object->file_lock)
-+    {
-+      delete object->file_lock;
-+    }
- 
--  if (!m_files[i].used)
--    return;
-+    memset(object, 0, sizeof(*object));
-+   }
-+}
- 
-+void CEmuFileWrapper::UnRegisterFileObjectByDescriptor(int fd)
-+{
-   CSingleLock lock(m_criticalSection);
--
--  // we assume the emulated function alreay deleted the CFile object
--  if (m_files[i].file_lock)
--  {
--    delete m_files[i].file_lock;
--    m_files[i].file_lock = nullptr;
--  }
--#if !defined(TARGET_WINDOWS)
--  //Don't memset on Windows as it overwrites our pointer
--  memset(&m_files[i], 0, sizeof(EmuFileObject));
--#endif
--  m_files[i].used = false;
--  FileDescriptor(m_files[i].file_emu)->_file = -1;
-+  UnRegisterFileObject(GetFileObjectByDescriptor(fd), false);
- }
- 
- void CEmuFileWrapper::UnRegisterFileObjectByStream(FILE* stream)
- {
-   if (isValidFilePtr(stream))
-   {
--    return UnRegisterFileObjectByDescriptor(FileDescriptor(*stream)->_file);
-+    CSingleLock lock(m_criticalSection);
-+    UnRegisterFileObject(GetFileObjectByStream(stream), false);
-   }
- }
- 
- void CEmuFileWrapper::LockFileObjectByDescriptor(int fd)
- {
--  int i = fd - FILE_WRAPPER_OFFSET;
--  if (i >= 0 && i < MAX_EMULATED_FILES)
-+  EmuFileObject* object = GetFileObjectByDescriptor(fd);
-+  if (object && object->file_xbmc)
-   {
--    if (m_files[i].used)
--    {
--      m_files[i].file_lock->lock();
--    }
-+    object->file_lock->lock();
-   }
- }
- 
- bool CEmuFileWrapper::TryLockFileObjectByDescriptor(int fd)
- {
--  int i = fd - FILE_WRAPPER_OFFSET;
--  if (i >= 0 && i < MAX_EMULATED_FILES)
-+  EmuFileObject* object = GetFileObjectByDescriptor(fd);
-+  if (object && object->file_xbmc)
-   {
--    if (m_files[i].used)
--    {
--      return m_files[i].file_lock->try_lock();
--    }
-+    return object->file_lock->try_lock();
-   }
-   return false;
- }
- 
- void CEmuFileWrapper::UnlockFileObjectByDescriptor(int fd)
- {
--  int i = fd - FILE_WRAPPER_OFFSET;
--  if (i >= 0 && i < MAX_EMULATED_FILES)
-+  EmuFileObject* object = GetFileObjectByDescriptor(fd);
-+  if (object && object->file_xbmc)
-   {
--    if (m_files[i].used)
--    {
--      m_files[i].file_lock->unlock();
--    }
-+    object->file_lock->unlock();
-   }
- }
- 
- EmuFileObject* CEmuFileWrapper::GetFileObjectByDescriptor(int fd)
- {
--  int i = fd - FILE_WRAPPER_OFFSET;
-+  int i = fd - 0x7000000;
-   if (i >= 0 && i < MAX_EMULATED_FILES)
-   {
--    if (m_files[i].used)
-+    if (m_files[i].file_xbmc)
-     {
-       return &m_files[i];
-     }
-@@ -204,20 +163,39 @@ EmuFileObject* CEmuFileWrapper::GetFileObjectByDescriptor(int fd)
-   return nullptr;
- }
- 
-+int CEmuFileWrapper::GetDescriptorByFileObject(EmuFileObject *object)
-+{
-+  int i = object - m_files;
-+  if (i >= 0 && i < MAX_EMULATED_FILES)
-+  {
-+    return 0x7000000 + i;
-+  }
-+
-+  return -1;
-+}
-+
- EmuFileObject* CEmuFileWrapper::GetFileObjectByStream(FILE* stream)
- {
--  if (isValidFilePtr(stream))
-+  EmuFileObject *object = (EmuFileObject*) stream;
-+  if (object >= &m_files[0] || object < &m_files[MAX_EMULATED_FILES])
-   {
--    return GetFileObjectByDescriptor(FileDescriptor(*stream)->_file);
-+    if (object->file_xbmc)
-+    {
-+      return object;
-+    }
-   }
-+  return NULL;
-+}
- 
--  return nullptr;
-+FILE* CEmuFileWrapper::GetStreamByFileObject(EmuFileObject *object)
-+{
-+  return (FILE*) object;
- }
- 
- XFILE::CFile* CEmuFileWrapper::GetFileXbmcByDescriptor(int fd)
- {
-   auto object = GetFileObjectByDescriptor(fd);
--  if (object != nullptr && object->used)
-+  if (object != nullptr)
-   {
-     return object->file_xbmc;
-   }
-@@ -228,8 +206,9 @@ XFILE::CFile* CEmuFileWrapper::GetFileXbmcByStream(FILE* stream)
- {
-   if (isValidFilePtr(stream))
-   {
--    auto object = GetFileObjectByDescriptor(FileDescriptor(*stream)->_file);
--    if (object != nullptr && object->used)
-+    EmuFileObject* object = GetFileObjectByStream(stream);
-+    if (object != NULL)
-+
-     {
-       return object->file_xbmc;
-     }
-@@ -239,32 +218,21 @@ XFILE::CFile* CEmuFileWrapper::GetFileXbmcByStream(FILE* stream)
- 
- int CEmuFileWrapper::GetDescriptorByStream(FILE* stream)
- {
--  if (isValidFilePtr(stream))
--  {
--    int i = FileDescriptor(*stream)->_file - FILE_WRAPPER_OFFSET;
--    if (i >= 0 && i < MAX_EMULATED_FILES)
--    {
--      return i + FILE_WRAPPER_OFFSET;
--    }
--  }
--  return -1;
-+  return GetDescriptorByFileObject(GetFileObjectByStream(stream));
- }
- 
- FILE* CEmuFileWrapper::GetStreamByDescriptor(int fd)
- {
--  auto object = GetFileObjectByDescriptor(fd);
--  if (object != nullptr && object->used)
--  {
--    return &object->file_emu;
--  }
--  return nullptr;
-+  return GetStreamByFileObject(GetFileObjectByDescriptor(fd));
-+}
-+
-+bool CEmuFileWrapper::DescriptorIsEmulatedFile(int fd)
-+{
-+  return GetFileObjectByDescriptor(fd) != NULL;
- }
- 
- bool CEmuFileWrapper::StreamIsEmulatedFile(FILE* stream)
- {
--  if (isValidFilePtr(stream))
--  {
--    return DescriptorIsEmulatedFile(FileDescriptor(*stream)->_file);
--  }
--  return false;
-+  return GetFileObjectByStream(stream) != NULL;
- }
-+
-diff --git a/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h b/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h
-index 786fa85..311a5cf 100644
---- a/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h
-+++ b/xbmc/cores/DllLoader/exports/util/EmuFileWrapper.h
-@@ -25,14 +25,14 @@
- #include "system.h"
- #include "threads/CriticalSection.h"
- 
--#if defined(TARGET_POSIX) && !defined(TARGET_DARWIN) && !defined(TARGET_FREEBSD) && !defined(TARGET_ANDROID) && !defined(__UCLIBC__)
--#define _file _fileno
--#elif defined(__UCLIBC__)
--#define _file __filedes
--#endif
-+//#if defined(TARGET_POSIX) && !defined(TARGET_DARWIN) && !defined(TARGET_FREEBSD) && !defined(TARGET_ANDROID) && !defined(__UCLIBC__)
-+//#define _file _fileno
-+//#elif defined(__UCLIBC__)
-+//#define _file __filedes
-+//#endif
- 
- #define MAX_EMULATED_FILES    50
--#define FILE_WRAPPER_OFFSET   0x00000200
-+//#define FILE_WRAPPER_OFFSET   0x00000200
- 
- namespace XFILE
- {
-@@ -47,12 +47,9 @@ struct kodi_iobuf {
- 
- typedef struct stEmuFileObject
- {
--  FILE    file_emu;
-   XFILE::CFile*  file_xbmc;
-   CCriticalSection *file_lock;
-   int mode;
--  //Stick this last to avoid 3-7 bytes of padding
--  bool    used;
- } EmuFileObject;
- 
- class CEmuFileWrapper
-@@ -67,22 +64,22 @@ public:
-   void CleanUp();
- 
-   EmuFileObject* RegisterFileObject(XFILE::CFile* pFile);
-+  void UnRegisterFileObject(EmuFileObject*, bool free_file);
-   void UnRegisterFileObjectByDescriptor(int fd);
-   void UnRegisterFileObjectByStream(FILE* stream);
-   void LockFileObjectByDescriptor(int fd);
-   bool TryLockFileObjectByDescriptor(int fd);
-   void UnlockFileObjectByDescriptor(int fd);
-   EmuFileObject* GetFileObjectByDescriptor(int fd);
-+  int GetDescriptorByFileObject(EmuFileObject*);
-   EmuFileObject* GetFileObjectByStream(FILE* stream);
-+  FILE* GetStreamByFileObject(EmuFileObject*);
-   XFILE::CFile* GetFileXbmcByDescriptor(int fd);
-   XFILE::CFile* GetFileXbmcByStream(FILE* stream);
--  static int GetDescriptorByStream(FILE* stream);
-+  int GetDescriptorByStream(FILE* stream);
-   FILE* GetStreamByDescriptor(int fd);
--  static constexpr bool DescriptorIsEmulatedFile(int fd)
--  {
--    return fd >= FILE_WRAPPER_OFFSET && fd < FILE_WRAPPER_OFFSET + MAX_EMULATED_FILES;
--  }
--  static bool StreamIsEmulatedFile(FILE* stream);
-+  bool DescriptorIsEmulatedFile(int fd);
-+  bool StreamIsEmulatedFile(FILE* stream);
- private:
-   EmuFileObject m_files[MAX_EMULATED_FILES];
-   CCriticalSection m_criticalSection;
-diff --git a/xbmc/cores/DllLoader/exports/wrapper.c b/xbmc/cores/DllLoader/exports/wrapper.c
-index e363662..07825f3 100644
---- a/xbmc/cores/DllLoader/exports/wrapper.c
-+++ b/xbmc/cores/DllLoader/exports/wrapper.c
-@@ -39,13 +39,13 @@
- #endif
- #include <dlfcn.h>
- 
--#if defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID)
-+#if defined(TARGET_DARWIN) || defined(TARGET_FREEBSD) || defined(TARGET_ANDROID) || !defined(__GLIBC__)
- typedef off_t     __off_t;
- typedef int64_t   off64_t;
- typedef off64_t   __off64_t;
- typedef fpos_t    fpos64_t;
- #define stat64    stat
--#if defined(TARGET_DARWIN) || defined(TARGET_ANDROID)
-+#if defined(TARGET_DARWIN) || defined(TARGET_ANDROID) || !defined(__GLIBC__)
- #define _G_va_list va_list
- #endif
- #endif
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch
deleted file mode 100644
index 12a6c06e82..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0001-change-order-of-detecting-libegl-and-libgles2.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 21524598110e7a55113205dda4bc1a6d5987111c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 May 2017 06:41:33 +0000
-Subject: [PATCH] change order of detecting libegl and libgles2
-
-This actually helps building it on rpi/userland
-where libEGL depends on few functions from libGLESv2
-see
-https://www.raspberrypi.org/forums/viewtopic.php?t=7090
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b9e4240..1ca0297 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -951,8 +951,8 @@ if test "$use_gles" = "yes"; then
-       AC_MSG_RESULT(== WARNING: OpenGLES support is assumed.)
-       LIBS="$LIBS -lEGL -lGLESv2 -lbcm_host -lvcos -lvchiq_arm -lmmal -lmmal_core -lmmal_util -lvcsm"
-     else
--      AC_CHECK_LIB([EGL],   [main],, AC_MSG_ERROR($missing_library))
-       AC_CHECK_LIB([GLESv2],[main],, AC_MSG_ERROR($missing_library))
-+      AC_CHECK_LIB([EGL],   [main],, AC_MSG_ERROR($missing_library))
-     fi
-   fi
- else
--- 
-1.9.1
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-Remove-FILEWRAP.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-Remove-FILEWRAP.patch
deleted file mode 100644
index 463a5c4f81..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0002-Remove-FILEWRAP.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From ad1977a358319093b305df6d84be6db676ef1e4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Nov 2016 22:35:16 -0800
-Subject: [PATCH 02/10] Remove FILEWRAP
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- xbmc/utils/posix/PosixInterfaceForCLog.cpp | 6 +-----
- xbmc/utils/posix/PosixInterfaceForCLog.h   | 4 +---
- 2 files changed, 2 insertions(+), 8 deletions(-)
-
-Index: git/xbmc/utils/posix/PosixInterfaceForCLog.cpp
-===================================================================
---- git.orig/xbmc/utils/posix/PosixInterfaceForCLog.cpp
-+++ git/xbmc/utils/posix/PosixInterfaceForCLog.cpp
-@@ -29,10 +29,6 @@
- #include "platform/android/activity/XBMCApp.h"
- #endif // TARGET_ANDROID
- 
--struct FILEWRAP : public FILE
--{};
--
--
- CPosixInterfaceForCLog::CPosixInterfaceForCLog() :
-   m_file(NULL)
- { }
-@@ -52,7 +48,7 @@ bool CPosixInterfaceForCLog::OpenLogFile
-   (void)remove(backupOldLogToFilename.c_str()); // if it's failed, try to continue
-   (void)rename(logFilename.c_str(), backupOldLogToFilename.c_str()); // if it's failed, try to continue
- 
--  m_file = (FILEWRAP*)fopen(logFilename.c_str(), "wb");
-+  m_file = fopen(logFilename.c_str(), "wb");
-   if (!m_file)
-     return false; // error, can't open log file
- 
-Index: git/xbmc/utils/posix/PosixInterfaceForCLog.h
-===================================================================
---- git.orig/xbmc/utils/posix/PosixInterfaceForCLog.h
-+++ git/xbmc/utils/posix/PosixInterfaceForCLog.h
-@@ -34,5 +34,5 @@ public:
-   void PrintDebugString(const std::string& debugString);
-   static void GetCurrentLocalTime(int& hour, int& minute, int& second, double& millisecond);
- private:
--  FILEWRAP* m_file;
-+  FILE* m_file;
- };
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
deleted file mode 100644
index 49217a4f7b..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From a91a3ba229dc5903935f7dd98dd03bbb4fe5ac1f Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 6 Feb 2016 15:43:01 +0100
-Subject: [PATCH 03/10] configure: don't try to run stuff to find tinyxml
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 34fe643..3132dc1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1043,7 +1043,7 @@ fi
- AC_LANG_PUSH([C++])
- PKG_CHECK_MODULES([TINYXML], [tinyxml >= 2.6.2],
-   [INCLUDES="$INCLUDES $TINYXML_CFLAGS"; LIBS="$LIBS $TINYXML_LIBS"],
--  [AC_RUN_IFELSE(
-+  [AC_COMPILE_IFELSE(
-    [AC_LANG_SOURCE([[
- #include <stdlib.h>
- #include <tinyxml.h>
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-handle-SIGTERM.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-handle-SIGTERM.patch
deleted file mode 100644
index dc37439353..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0004-handle-SIGTERM.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From 49046c1685465a5486fe9e1c04b99c585aab6862 Mon Sep 17 00:00:00 2001
-From: Stefan Saraev <stefan@saraev.ca>
-Date: Wed, 2 Nov 2016 11:28:34 -0700
-Subject: [PATCH 04/10] handle SIGTERM
-
-0. CApplication::Stop cant be trusted. (deadlocks crashes and boo)
-
-so, when shutdown/reboot is requested:
-
-1. save an exit code (for CEC...)
-2. call CPowerManager::{Reboot,PowerDown}
-3. ... then systemd sends TERM and waits xx seconds before sending KILL
-4. CApplication::Stop has xx seconds to save guisettings.xml and boo
-5. CEC thread has xx seconds to switch off after it received OnQuit
-6. addons / pvrmanager / cec / everything else.. are free to deadlock / crash now, we dont care
-7. KILL
-
-Signed-off-by: Stefan Saraev <stefan@saraev.ca>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- xbmc/Application.cpp         | 17 ++++++++++++-----
- xbmc/Application.h           |  1 +
- xbmc/XBApplicationEx.cpp     |  1 +
- xbmc/XBApplicationEx.h       |  1 +
- xbmc/platform/posix/main.cpp | 15 +++++++++++++++
- 5 files changed, 30 insertions(+), 5 deletions(-)
-
-diff --git a/xbmc/Application.cpp b/xbmc/Application.cpp
-index 100a2f2..fda892d 100644
---- a/xbmc/Application.cpp
-+++ b/xbmc/Application.cpp
-@@ -2426,12 +2426,12 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
-   switch (pMsg->dwMessage)
-   {
-   case TMSG_POWERDOWN:
--    Stop(EXITCODE_POWERDOWN);
-+    SetExitCode(EXITCODE_POWERDOWN);
-     g_powerManager.Powerdown();
-     break;
- 
-   case TMSG_QUIT:
--    Stop(EXITCODE_QUIT);
-+    SetExitCode(EXITCODE_QUIT);
-     break;
-   
-   case TMSG_SHUTDOWN:
-@@ -2452,12 +2452,13 @@ void CApplication::OnApplicationMessage(ThreadMessage* pMsg)
- 
-   case TMSG_RESTART:
-   case TMSG_RESET:
--    Stop(EXITCODE_REBOOT);
-+    SetExitCode(EXITCODE_REBOOT);
-     g_powerManager.Reboot();
-     break;
- 
-   case TMSG_RESTARTAPP:
- #if defined(TARGET_WINDOWS) || defined(TARGET_LINUX)
-+    SetExitCode(EXITCODE_RESTARTAPP);
-     Stop(EXITCODE_RESTARTAPP);
- #endif
-     break;
-@@ -2881,6 +2882,13 @@ bool CApplication::Cleanup()
-   }
- }
- 
-+void CApplication::SetExitCode(int exitCode)
-+{
-+  // save it for CEC
-+  m_ExitCode = exitCode;
-+  m_ExitCodeSet = true;
-+}
-+
- void CApplication::Stop(int exitCode)
- {
-   try
-@@ -2888,7 +2896,7 @@ void CApplication::Stop(int exitCode)
-     m_frameMoveGuard.unlock();
- 
-     CVariant vExitCode(CVariant::VariantTypeObject);
--    vExitCode["exitcode"] = exitCode;
-+    vExitCode["exitcode"] = m_ExitCode;
-     CAnnouncementManager::GetInstance().Announce(System, "xbmc", "OnQuit", vExitCode);
- 
-     // Abort any active screensaver
-@@ -2922,7 +2930,6 @@ void CApplication::Stop(int exitCode)
- 
-     m_bStop = true;
-     m_AppFocused = false;
--    m_ExitCode = exitCode;
-     CLog::Log(LOGNOTICE, "stop all");
- 
-     // cancel any jobs from the jobmanager
-diff --git a/xbmc/Application.h b/xbmc/Application.h
-index a9d9bf5..e536deb 100644
---- a/xbmc/Application.h
-+++ b/xbmc/Application.h
-@@ -159,6 +159,7 @@ public:
-   void StopPVRManager();
-   void ReinitPVRManager();
-   bool IsCurrentThread() const;
-+  void SetExitCode(int exitCode);
-   void Stop(int exitCode);
-   void RestartApp();
-   void UnloadSkin(bool forReload = false);
-diff --git a/xbmc/XBApplicationEx.cpp b/xbmc/XBApplicationEx.cpp
-index 035aed2..34102f5 100644
---- a/xbmc/XBApplicationEx.cpp
-+++ b/xbmc/XBApplicationEx.cpp
-@@ -46,6 +46,7 @@ CXBApplicationEx::CXBApplicationEx()
-   m_bStop = false;
-   m_AppFocused = true;
-   m_ExitCode = EXITCODE_QUIT;
-+  m_ExitCodeSet = false;
-   m_renderGUI = false;
- }
- 
-diff --git a/xbmc/XBApplicationEx.h b/xbmc/XBApplicationEx.h
-index 9bc14fa..f696b89 100644
---- a/xbmc/XBApplicationEx.h
-+++ b/xbmc/XBApplicationEx.h
-@@ -42,6 +42,7 @@ public:
-   // Variables for timing
-   bool m_bStop;
-   int  m_ExitCode;
-+  bool m_ExitCodeSet;
-   bool m_AppFocused;
-   bool m_renderGUI;
- 
-diff --git a/xbmc/platform/posix/main.cpp b/xbmc/platform/posix/main.cpp
-index a8b64e5..3d80032 100644
---- a/xbmc/platform/posix/main.cpp
-+++ b/xbmc/platform/posix/main.cpp
-@@ -41,12 +41,27 @@
- #include "input/linux/LIRC.h"
- #endif
- #include "platform/XbmcContext.h"
-+#include "Application.h"
-+
-+void xbmc_term_handler(int signum)
-+{
-+  CLog::Log(LOGINFO, "Received SIGTERM...");
-+  if (!g_application.m_ExitCodeSet)
-+    g_application.SetExitCode(EXITCODE_RESTARTAPP);
-+  g_application.Stop(EXITCODE_RESTARTAPP);
-+}
- 
- #ifdef __cplusplus
- extern "C"
- #endif
- int main(int argc, char* argv[])
- {
-+  // SIGTERM handler
-+  struct sigaction action;
-+  memset(&action, 0, sizeof(struct sigaction));
-+  action.sa_handler = xbmc_term_handler;
-+  sigaction(SIGTERM, &action, NULL);
-+
-   // set up some xbmc specific relationships
-   XBMC::Context context;
- 
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-add-support-to-read-frequency-output-if-using-intel-.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-add-support-to-read-frequency-output-if-using-intel-.patch
deleted file mode 100644
index ee10c40ac1..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0005-add-support-to-read-frequency-output-if-using-intel-.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4d1368d20f04216aec9551d9845b305f96a21015 Mon Sep 17 00:00:00 2001
-From: Stephan Raue <stephan@openelec.tv>
-Date: Mon, 1 Sep 2014 03:16:37 +0200
-Subject: [PATCH 05/10] add support to read frequency output if using intel's
- pstate driver
-
----
- xbmc/utils/CPUInfo.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/xbmc/utils/CPUInfo.cpp b/xbmc/utils/CPUInfo.cpp
-index 5e2ebbd..fd04d5a 100644
---- a/xbmc/utils/CPUInfo.cpp
-+++ b/xbmc/utils/CPUInfo.cpp
-@@ -274,6 +274,8 @@ CCPUInfo::CCPUInfo(void)
-     m_fProcTemperature = fopen("/sys/class/thermal/thermal_zone0/temp", "r");  // On Raspberry PIs
- 
-   m_fCPUFreq = fopen ("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq", "r");
-+  if (m_fCPUFreq == NULL)
-+    m_fCPUFreq = fopen ("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq", "r");
-   if (!m_fCPUFreq)
-   {
-     m_cpuInfoForFreq = true;
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-Disable-DVD-support.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-Disable-DVD-support.patch
deleted file mode 100644
index 08dfac3240..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0006-Disable-DVD-support.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3d3ec391038c6ee73897a7fab753b11b589de1ed Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 2 Nov 2016 12:39:20 -0700
-Subject: [PATCH 06/10] Disable DVD support
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.in | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 0d70e9b..050c7ca 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -10,8 +10,7 @@ EC_DIRS= \
- 	tools/EventClients
- 
- DVDPCODECS_DIRS= \
--	lib \
--	lib/libdvd
-+	lib
- 
- VideoPlayer_ARCHIVES=xbmc/cores/VideoPlayer/VideoPlayer.a \
-                    xbmc/cores/VideoPlayer/DVDCodecs/DVDCodecs.a \
-@@ -347,7 +346,6 @@ libaddon: exports
- 	$(MAKE) -C lib/addons/library.xbmc.pvr
- 	$(MAKE) -C lib/addons/library.kodi.inputstream
- dvdpcodecs: dllloader
--	$(MAKE) -C lib/libdvd
- 
- dvdpextcodecs:
- 
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Always-compile-libcpluff-as-PIC.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Always-compile-libcpluff-as-PIC.patch
deleted file mode 100644
index 8fd7ece054..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0007-Always-compile-libcpluff-as-PIC.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d989cbdb7686c3b95dc749967f89b93e47f955a6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 3 Nov 2016 13:10:00 -0700
-Subject: [PATCH 07/10] Always compile libcpluff as PIC
-
-Fixes errors e.g.
-
-ld: lib/cpluff/libcpluff/.libs/libcpluff.a(pcontrol.o): relocation R_X86_64_PC32 against symbol `cp_stop_plugins' can not be used when making a shared object; recompile with -fPIC
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3132dc1..ab4eea3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2385,7 +2385,7 @@ XB_CONFIG_MODULE([lib/cpluff], [
-     --prefix="${prefix}" --includedir="${includedir}" --libdir="${libdir}" --datadir="${datadir}" \
-     --host=$host_alias \
-     --build=$build_alias \
--    --target=$target_alias CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
-+    --target=$target_alias --with-pic=yes CFLAGS="$CFLAGS" CC="$CC" CXX="$CXX" LDFLAGS="$LDFLAGS" LIBS=""
-     #LDFLAGS="$LDFLAGS -Wl,-read_only_relocs,suppress"
- ], [0])
- 
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
deleted file mode 100644
index 9390144ceb..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 51cd8d5f084013360b29fe497193288ebde2f4f9 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 29 Jul 2015 23:13:33 +0200
-Subject: [PATCH 08/10] kodi-config.cmake: use CMAKE_FIND_ROOT_PATH to fix
- cross-compilation
-
-When cross-compiling, the location at build time of the libraries is
-not the same as the one at run-time. The CMAKE_FIND_ROOT_PATH variable
-is here to handle this difference, so use it in kodi-config.cmake.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- project/cmake/KodiConfig.cmake.in | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/project/cmake/KodiConfig.cmake.in b/project/cmake/KodiConfig.cmake.in
-index c02a680..9d6a566 100644
---- a/project/cmake/KodiConfig.cmake.in
-+++ b/project/cmake/KodiConfig.cmake.in
-@@ -7,10 +7,10 @@ if(NOT @APP_NAME_UC@_PREFIX)
-   set(@APP_NAME_UC@_PREFIX @APP_PREFIX@)
- endif()
- if(NOT @APP_NAME_UC@_INCLUDE_DIR)
--  set(@APP_NAME_UC@_INCLUDE_DIR @APP_INCLUDE_DIR@)
-+  set(@APP_NAME_UC@_INCLUDE_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_INCLUDE_DIR@)
- endif()
- if(NOT @APP_NAME_UC@_LIB_DIR)
--  set(@APP_NAME_UC@_LIB_DIR @APP_LIB_DIR@)
-+  set(@APP_NAME_UC@_LIB_DIR ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@)
- endif()
- if(NOT @APP_NAME_UC@_DATA_DIR)
-   set(@APP_NAME_UC@_DATA_DIR @APP_DATA_DIR@)
-@@ -19,6 +19,7 @@ if(NOT WIN32)
-   set(CMAKE_CXX_FLAGS "$ENV{CXXFLAGS} @CXX11_SWITCH@")
- endif()
- list(APPEND CMAKE_MODULE_PATH @APP_LIB_DIR@ @APP_DATA_DIR@/cmake)
-+list(APPEND CMAKE_MODULE_PATH ${CMAKE_FIND_ROOT_PATH}/@APP_LIB_DIR@ ${CMAKE_FIND_ROOT_PATH}/@APP_DATA_DIR@/cmake)
- 
- string(REPLACE ";" " " ARCH_DEFINES "@ARCH_DEFINES@")
- add_definitions(${ARCH_DEFINES} -DBUILD_KODI_ADDON)
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0009-build-Add-support-for-musl-triplets.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0009-build-Add-support-for-musl-triplets.patch
deleted file mode 100644
index f3e739aedb..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0009-build-Add-support-for-musl-triplets.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From 8b2bad58585af0f829fb06e19c9bd2b6caf30808 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 6 Nov 2016 11:54:41 -0800
-Subject: [PATCH 09/10] build: Add support for musl triplets
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac               | 12 ++++++------
- m4/xbmc_arch.m4            | 22 +++++++++++-----------
- tools/depends/configure.ac | 12 ++++++------
- 3 files changed, 23 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ab4eea3..925466a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -526,7 +526,7 @@ case $host in
-      use_x11=no
-      build_shared_lib=yes
-      ;;
--  i*86*-linux-gnu*|i*86*-*-linux-uclibc*)
-+  i*86*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
-      target_platform=target_linux
-      CORE_SYSTEM_NAME=linux
-      ARCH="i486-linux"
-@@ -549,7 +549,7 @@ case $host in
-        fi
-      fi
-      ;;
--  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*)
-+  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
-      target_platform=target_linux
-      CORE_SYSTEM_NAME=linux
-      ARCH="x86_64-linux"
-@@ -601,17 +601,17 @@ case $host in
-      DEPENDS_ROOT_FOR_XCODE=$(echo ${prefix%/*})
-      AC_SUBST([DEPENDS_ROOT_FOR_XCODE])
-      ;;
--  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*)
-+  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*|powerpc-*-linux-musl*)
-      target_platform=target_linux
-      CORE_SYSTEM_NAME=linux
-      ARCH="powerpc-linux"
-      ;;
--  powerpc64*-*-linux-gnu*|powerpc64*-*-linux-uclibc*)
-+  powerpc64*-*-linux-gnu*|powerpc64*-*-linux-uclibc*|powerpc64*-*-linux-musl*)
-      target_platform=target_linux
-      CORE_SYSTEM_NAME=linux
-      ARCH="powerpc64-linux"
-      ;;
--  arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
-+  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*)
-      target_platform=target_linux
-      CORE_SYSTEM_NAME=linux
-      ARCH="arm"
-@@ -621,7 +621,7 @@ case $host in
-      use_gl=no
-      USE_STATIC_FFMPEG=1
-      ;;
--  aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*)
-+  aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*|aarch64*-*-linux-musl*)
-      target_platform=target_linux
-      ARCH="aarch64"
-      use_arch="aarch64"
-diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
-index d28f263..ff5dc20 100644
---- a/m4/xbmc_arch.m4
-+++ b/m4/xbmc_arch.m4
-@@ -2,10 +2,10 @@ AC_DEFUN([XBMC_SETUP_ARCH_DEFINES],[
- 
- # build detection and setup - this is the native arch
- case $build in
--  i*86*-linux-gnu*|i*86*-*-linux-uclibc*)
-+  i*86*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
-      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
-      ;;
--  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*)
-+  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
-      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
-      ;;
-   i386-*-freebsd*)
-@@ -17,13 +17,13 @@ case $build in
-   *86*-apple-darwin*)
-      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_DARWIN -DTARGET_DARWIN_OSX -D_LINUX")
-      ;;
--  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*)
-+  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*|powerpc-*-linux-musl*)
-      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_POWERPC")
-      ;;
--  powerpc64-*-linux-gnu*|powerpc64-*-linux-uclibc*)
-+  powerpc64-*-linux-gnu*|powerpc64-*-linux-uclibc*|powerpc64-*-linux-musl*)
-      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_POWERPC64")
-      ;;
--  arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
-+  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*)
-      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
-      ;;
-   *)
-@@ -33,10 +33,10 @@ esac
- 
- # host detection and setup - this is the target arch
- case $host in
--  i*86*-linux-gnu*|i*86*-*-linux-uclibc*)
-+  i*86*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
-      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
-      ;;
--  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*)
-+  x86_64-*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
-      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
-      ;;
-   i386-*-freebsd*)
-@@ -54,16 +54,16 @@ case $host in
-   powerpc-apple-darwin*)
-      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_DARWIN -DTARGET_DARWIN_OSX -D_LINUX")
-      ;;
--  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*)
-+  powerpc-*-linux-gnu*|powerpc-*-linux-uclibc*|powerpc-*-linux-musl*)
-      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_POWERPC")
-      ;;
--  powerpc64*-*-linux-gnu*|powerpc64*-*-linux-uclibc*)
-+  powerpc64*-*-linux-gnu*|powerpc64*-*-linux-uclibc*|powerpc64*-*-linux-musl*)
-      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -D_POWERPC64")
-      ;;
--  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*)
-+  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*|aarch64*-*-linux-gnu*|aarch64*-*-linux-uclibc*|aarch64*-*-linux-musl*)
-      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
-      ;;
--  mips*-*-linux-gnu*|mips*-*-linux-uclibc*)
-+  mips*-*-linux-gnu*|mips*-*-linux-uclibc*|mips*-*-linux-musl*)
-      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
-      ;;
-   *-*linux-android*)
-diff --git a/tools/depends/configure.ac b/tools/depends/configure.ac
-index f438e5d..409f4d7 100644
---- a/tools/depends/configure.ac
-+++ b/tools/depends/configure.ac
-@@ -120,13 +120,13 @@ platform_cc=gcc
- platform_cxx=g++
- 
- case $build in
--  arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
-+  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*)
-     build_os="linux"
-   ;;
--  *i686*-linux-gnu*|i*86*-*-linux-uclibc*)
-+  *i686*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
-     build_os="linux"
-   ;;
--  x86_64*-linux-gnu*|x86_64-*-linux-uclibc*)
-+  x86_64*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
-     build_os="linux"
-   ;;
-   *darwin*)
-@@ -186,7 +186,7 @@ case $host in
-     #android builds are always cross
-     cross_compiling="yes"
-   ;;
--  arm*-*-linux-gnu*|arm*-*-linux-uclibc*)
-+  arm*-*-linux-gnu*|arm*-*-linux-uclibc*|arm*-*-linux-musl*)
-     if test "$use_platform" = "auto"; then
-       if test "x$use_cpu" = "xauto"; then
-         use_cpu=$host_cpu
-@@ -210,12 +210,12 @@ case $host in
-       platform_os="linux"
-     fi
-   ;;
--  *i686*-linux-gnu*|i*86*-*-linux-uclibc*)
-+  *i686*-linux-gnu*|i*86*-*-linux-uclibc*|i*86*-*-linux-musl*)
-     use_cpu=$host_cpu
-     use_toolchain="${use_toolchain:-/usr}"
-     platform_os="linux"
-   ;;
--  x86_64*-linux-gnu*|x86_64-*-linux-uclibc*)
-+  x86_64*-linux-gnu*|x86_64-*-linux-uclibc*|x86_64-*-linux-musl*)
-     use_cpu=$host_cpu
-     use_toolchain="${use_toolchain:-/usr}"
-     platform_cflags="-fPIC -DPIC"
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch
deleted file mode 100644
index e34a5b71e4..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 55233024648b5673dbf223586968e71cc4c70711 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 16 Nov 2016 18:49:36 -0800
-Subject: [PATCH 10/10] RssReader: Fix compiler warning comparing pointer to
- zero
-
-Clang finds this warning
-RssReader.cpp:272:19: error: ordered comparison between pointer and zero ('TiXmlElement *' and 'int')
-  while (itemNode > 0)
-         ~~~~~~~~ ^ ~
-RssReader.cpp:276:22: error: ordered comparison between pointer and zero ('TiXmlNode *' and 'int')
-    while (childNode > 0)
-           ~~~~~~~~~ ^ ~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- xbmc/utils/RssReader.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/xbmc/utils/RssReader.cpp b/xbmc/utils/RssReader.cpp
-index 9186f56..2494dc8 100644
---- a/xbmc/utils/RssReader.cpp
-+++ b/xbmc/utils/RssReader.cpp
-@@ -269,11 +269,11 @@ void CRssReader::GetNewsItems(TiXmlElement* channelXmlNode, int iFeed)
-   if (m_tagSet.empty())
-     AddTag("title");
- 
--  while (itemNode > 0)
-+  while (itemNode != NULL)
-   {
-     TiXmlNode* childNode = itemNode->FirstChild();
-     mTagElements.clear();
--    while (childNode > 0)
-+    while (childNode != NULL)
-     {
-       std::string strName = childNode->ValueStr();
- 
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0011-Let-configure-pass-on-unknown-architectures-setting-.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0011-Let-configure-pass-on-unknown-architectures-setting-.patch
deleted file mode 100644
index 7ee44f1c4e..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0011-Let-configure-pass-on-unknown-architectures-setting-.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 19a1ffc1450bd3ecfb7419d74c733b2e16bf47f3 Mon Sep 17 00:00:00 2001
-From: Balint Reczey <balint@balintreczey.hu>
-Date: Wed, 26 Aug 2015 08:14:41 +0200
-Subject: [PATCH 11/12] Let configure pass on unknown architectures setting
- sane defaults
-
-This helps porting Kodi to new architectures while emitting warnings about
-entering uncharted territory.
----
- configure.ac    | 3 ++-
- m4/xbmc_arch.m4 | 6 ++++--
- 2 files changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 925466a..8369615 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -658,7 +658,8 @@ case $host in
-      USE_STATIC_FFMPEG=1
-      ;;
-   *)
--     AC_MSG_ERROR(unsupported host ($host))
-+    ARCH=$host_cpu"-"$host_os
-+    AC_MSG_WARN([unsupported host ($host), guessing ARCH as $ARCH.])
- esac
- AC_SUBST([ARCH])
- 
-diff --git a/m4/xbmc_arch.m4 b/m4/xbmc_arch.m4
-index ff5dc20..dfb45fd 100644
---- a/m4/xbmc_arch.m4
-+++ b/m4/xbmc_arch.m4
-@@ -27,7 +27,8 @@ case $build in
-      AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
-      ;;
-   *)
--     AC_MSG_ERROR(unsupported native build platform: $build)
-+     AC_MSG_WARN([unsupported native build platform: $build])
-+     AC_SUBST(NATIVE_ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
- esac
- 
- 
-@@ -70,7 +71,8 @@ case $host in
-      AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -DTARGET_ANDROID")
-      ;;
-   *)
--     AC_MSG_ERROR(unsupported build target: $host)
-+     AC_MSG_WARN([unsupported native build platform: $build])
-+     AC_SUBST(ARCH_DEFINES, "-DTARGET_POSIX -DTARGET_LINUX -D_LINUX")
- esac
- 
- if test "$target_platform" = "target_android" ; then
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0012-Revert-droid-fix-builds-with-AML-disabled.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0012-Revert-droid-fix-builds-with-AML-disabled.patch
deleted file mode 100644
index 8d70b3f8f3..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0012-Revert-droid-fix-builds-with-AML-disabled.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 9e88aa086083b80c05b2bf057b92682186c4e6dc Mon Sep 17 00:00:00 2001
-From: Balint Reczey <balint@balintreczey.hu>
-Date: Thu, 6 Oct 2016 18:12:18 +0200
-Subject: [PATCH 12/12] Revert "[droid] fix builds with AML disabled"
-
-This reverts commit 4733383b8f1c1dd0b95e9e5358425d8a0b7ba8fc.
----
- xbmc/utils/SystemInfo.cpp         |  4 ----
- xbmc/windowing/egl/EGLWrapper.cpp | 16 ++++++----------
- 2 files changed, 6 insertions(+), 14 deletions(-)
-
-diff --git a/xbmc/utils/SystemInfo.cpp b/xbmc/utils/SystemInfo.cpp
-index fcc6733..52e7fa3 100644
---- a/xbmc/utils/SystemInfo.cpp
-+++ b/xbmc/utils/SystemInfo.cpp
-@@ -57,10 +57,8 @@
- #include "utils/XMLUtils.h"
- #if defined(TARGET_ANDROID)
- #include "platform/android/jni/Build.h"
--#if defined(HAS_LIBAMCODEC)
- #include "utils/AMLUtils.h"
- #endif
--#endif
- 
- /* Platform identification */
- #if defined(TARGET_DARWIN)
-@@ -873,11 +871,9 @@ bool CSysInfo::IsAeroDisabled()
- bool CSysInfo::HasHW3DInterlaced()
- {
- #if defined(TARGET_ANDROID)
--#if defined(HAS_LIBAMCODEC)
-   if (aml_hw3d_present())
-     return true;
- #endif
--#endif
-   return false;
- }
- 
-diff --git a/xbmc/windowing/egl/EGLWrapper.cpp b/xbmc/windowing/egl/EGLWrapper.cpp
-index 30f5757..583d43a 100644
---- a/xbmc/windowing/egl/EGLWrapper.cpp
-+++ b/xbmc/windowing/egl/EGLWrapper.cpp
-@@ -24,19 +24,15 @@
- #include <assert.h>
- #if defined(TARGET_ANDROID)
-   #include "EGLNativeTypeAndroid.h"
--#if defined(HAS_LIBAMCODEC)
-   #include "EGLNativeTypeAmlAndroid.h"
- #endif
--#endif
- #if defined(TARGET_RASPBERRY_PI)
-   #include "EGLNativeTypeRaspberryPI.h"
- #endif
- #if defined(HAS_IMXVPU)
-   #include "EGLNativeTypeIMX.h"
- #endif
--#if defined(TARGET_LINUX) && defined(HAS_LIBAMCODEC)
- #include "EGLNativeTypeAmlogic.h"
--#endif
- #include "EGLWrapper.h"
- 
- #define CheckError() m_result = eglGetError(); if(m_result != EGL_SUCCESS) CLog::Log(LOGERROR, "EGL error in %s: %x",__FUNCTION__, m_result);
-@@ -91,15 +87,15 @@ bool CEGLWrapper::Initialize(const std::string &implementation)
-   // Try to create each backend in sequence and go with the first one
-   // that we know will work
-   if (
--#if defined(TARGET_ANDROID) && defined(HAS_LIBAMCODEC)
--      (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAmlAndroid>(implementation))
--#elif defined(TARGET_ANDROID)
--      (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAndroid>(implementation))
--#elif defined(TARGET_RASPBERRY_PI)
-+#if defined(TARGET_ANDROID)
-+      (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAmlAndroid>(implementation)) ||
-+      (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAndroid>(implementation)) ||
-+#endif
-+#if defined(TARGET_RASPBERRY_PI)
-       (nativeGuess = CreateEGLNativeType<CEGLNativeTypeRaspberryPI>(implementation))
- #elif defined(HAS_IMXVPU)
-       (nativeGuess = CreateEGLNativeType<CEGLNativeTypeIMX>(implementation))
--#elif defined(TARGET_LINUX) && defined(HAS_LIBAMCODEC)
-+#else
-       (nativeGuess = CreateEGLNativeType<CEGLNativeTypeAmlogic>(implementation))
- #endif
-       )
--- 
-2.10.2
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch b/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch
deleted file mode 100644
index c9c9066449..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-17/0013-FTPParse.cpp-use-std-string.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 5fa10ff6b1b60abee172296d9c1dec8dfc10615c Mon Sep 17 00:00:00 2001
-From: Stefan Saraev <stefan@saraev.ca>
-Date: Sun, 7 May 2017 17:30:47 +0300
-Subject: [PATCH] FTPParse.cpp: use std::string
-
-Fixes build with newer gcc versions.
-
-Taken from [1]
-
-Upstream-Status: Backport [2]
-
-[1] https://git.busybox.net/buildroot/plain/package/kodi/0003-FTPParse.cpp-use-std-string.patch?id=e2f03a6bde19766a1ac047c5ccfb049b5c4f61ca
-[2] https://github.com/xbmc/xbmc/commit/5fa10ff6b1b60abee172296d9c1dec8dfc10615c
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- xbmc/filesystem/FTPParse.cpp | 44 ++++++++++++++++++++++----------------------
- 1 file changed, 22 insertions(+), 22 deletions(-)
-
-diff --git a/xbmc/filesystem/FTPParse.cpp b/xbmc/filesystem/FTPParse.cpp
-index cfcc7c64ed..b0f676ae1a 100644
---- a/xbmc/filesystem/FTPParse.cpp
-+++ b/xbmc/filesystem/FTPParse.cpp
-@@ -34,7 +34,7 @@ CFTPParse::CFTPParse()
-   m_time = 0;
- }
- 
--string CFTPParse::getName()
-+std::string CFTPParse::getName()
- {
-   return m_name;
- }
-@@ -59,16 +59,16 @@ time_t CFTPParse::getTime()
-   return m_time;
- }
- 
--void CFTPParse::setTime(string str)
-+void CFTPParse::setTime(std::string str)
- {
-   /* Variables used to capture patterns via the regexes */
--  string month;
--  string day;
--  string year;
--  string hour;
--  string minute;
--  string second;
--  string am_or_pm;
-+  std::string month;
-+  std::string day;
-+  std::string year;
-+  std::string hour;
-+  std::string minute;
-+  std::string second;
-+  std::string am_or_pm;
- 
-   /* time struct used to set the time_t variable */
-   struct tm time_struct = {};
-@@ -338,21 +338,21 @@ int CFTPParse::getDayOfWeek(int month, int date, int year)
-   return day_of_week;
- }
- 
--int CFTPParse::FTPParse(string str)
-+int CFTPParse::FTPParse(std::string str)
- {
-   /* Various variable to capture patterns via the regexes */
--  string permissions;
--  string link_count;
--  string owner;
--  string group;
--  string size;
--  string date;
--  string name;
--  string type;
--  string stuff;
--  string facts;
--  string version;
--  string file_id;
-+  std::string permissions;
-+  std::string link_count;
-+  std::string owner;
-+  std::string group;
-+  std::string size;
-+  std::string date;
-+  std::string name;
-+  std::string type;
-+  std::string stuff;
-+  std::string facts;
-+  std::string version;
-+  std::string file_id;
- 
-   /* Regex for standard Unix listing formats */
-   pcrecpp::RE unix_re("^([-bcdlps])" // type
--- 
-2.11.0
-
-
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
deleted file mode 100644
index 29d0394e42..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup/kodi.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=Kodi media thing
-
-[Service]
-User=root
-Type=simple
-SuccessExitStatus=0 1
-IOSchedulingClass=realtime
-IOSchedulingPriority=0
-
-ExecStart=/usr/bin/xinit /usr/bin/kodi-standalone -- /usr/bin/X :0 
-
-[Install]
-WantedBy=basic.target
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
deleted file mode 100644
index 295618914b..0000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ /dev/null
@@ -1,216 +0,0 @@
-SUMMARY = "Kodi Media Center"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=930e2a5f63425d8dd72dbd7391c43c46"
-
-FILESPATH =. "${FILE_DIRNAME}/kodi-17:"
-
-DEPENDS = " \
-    cmake-native \
-    curl-native \
-    gperf-native \
-    jsonschemabuilder-native \
-    nasm-native \
-    swig-native \
-    unzip-native \
-    yasm-native \
-    zip-native \
-    avahi \
-    boost \
-    bzip2 \
-    crossguid \
-    curl \
-    dcadec \
-    enca \
-    expat \
-    faad2 \
-    ffmpeg \
-    fontconfig \
-    fribidi \
-    giflib \
-    jasper \
-    libass \
-    libcdio \
-    libcec \
-    libmad \
-    libmicrohttpd \
-    libmms \
-    libmms \
-    libmodplug \
-    libpcre \
-    libplist \
-    libsamplerate0 \
-    libsdl-image \
-    libsdl-mixer \
-    libsquish \
-    libssh \
-    libtinyxml \
-    libusb1 \
-    libxslt \
-    lzo \
-    mpeg2dec \
-    python \
-    sqlite3 \
-    taglib \
-    virtual/egl \
-    virtual/libsdl \
-    wavpack \
-    yajl \
-    zlib \
-    ${@enable_glew(bb, d)} \
-"
-
-PROVIDES = "xbmc"
-
-SRCREV = "6abeebd5ba371547c8f04272296433f5e4e28e86"
-PV = "17.3+gitr${SRCPV}"
-ADDONSPV = "17.1"
-SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton \
-    https://repo.voidlinux.eu/distfiles/${BPN}-${ADDONSPV}-generated-addons.tar.xz;name=addons;unpack=0 \
-    file://0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
-    file://0004-handle-SIGTERM.patch \
-    file://0005-add-support-to-read-frequency-output-if-using-intel-.patch \
-    file://0006-Disable-DVD-support.patch \
-    file://0007-Always-compile-libcpluff-as-PIC.patch \
-    file://0008-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch \
-    file://0009-build-Add-support-for-musl-triplets.patch \
-    file://0010-RssReader-Fix-compiler-warning-comparing-pointer-to-.patch \
-    file://0011-Let-configure-pass-on-unknown-architectures-setting-.patch \
-    file://0012-Revert-droid-fix-builds-with-AML-disabled.patch \
-    file://0001-change-order-of-detecting-libegl-and-libgles2.patch \
-    file://0013-FTPParse.cpp-use-std-string.patch \
-"
-
-SRC_URI_append_libc-musl = " \
-    file://0001-Fix-file_Emu-on-musl.patch \
-    file://0002-Remove-FILEWRAP.patch \
-"
-SRC_URI[addons.md5sum] = "719614fa764011a18665d08af5c8c92f"
-SRC_URI[addons.sha256sum] = "350da57408c27473eaf40e7f544bc94841bf101dc4346085260c5c4af0adac97"
-
-inherit autotools-brokensep gettext pythonnative distro_features_check
-
-REQUIRED_DISTRO_FEATURES += "opengl"
-
-S = "${WORKDIR}/git"
-
-# breaks compilation
-ASNEEDED = ""
-
-ACCEL ?= ""
-ACCEL_x86 = "vaapi vdpau"
-ACCEL_x86-64 = "vaapi vdpau"
-
-PACKAGECONFIG ??= "${ACCEL} opengl \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'openglesv2', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'samba', '', d)} \
-"
-
-PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,"
-PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,virtual/egl"
-PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
-PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
-PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxinerama libxmu libxrandr libxtst"
-PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
-PACKAGECONFIG[lcms] = "--enable-lcms2,--disable-lcms2,lcms"
-PACKAGECONFIG[samba] = "--enable-samba,--disable-samba,samba"
-
-EXTRA_OECONF = " \
-    --disable-debug \
-    --disable-libcap \
-    --disable-ccache \
-    --disable-mid \
-    --enable-libusb \
-    --enable-alsa \
-    --enable-airplay \
-    --disable-optical-drive \
-    --with-ffmpeg=shared \
-    --enable-texturepacker=no \
-    ac_cv_path_JAVA_EXE=/bin/true \
-"
-
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O3 -ffast-math"
-FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit-frame-pointer -O3 -ffast-math"
-BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-
-LDFLAGS_append_mips = " -latomic"
-LDFLAGS_append_mipsel = " -latomic"
-LDFLAGS_append_powerpc = " -latomic"
-LDFLAGS_append_arm = " -latomic"
-
-EXTRA_OECONF_append = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
-
-# for python modules
-export HOST_SYS
-export BUILD_SYS
-export STAGING_LIBDIR
-export STAGING_INCDIR
-export PYTHON_DIR
-
-def enable_glew(bb, d):
-    if bb.utils.contains('PACKAGECONFIG', 'x11', True, False, d) and bb.utils.contains('DISTRO_FEATURES', 'opengl', True, False, d):
-        return "glew"
-    return ""
-
-do_configure() {
-    tar xf ${WORKDIR}/${BPN}-${ADDONSPV}-generated-addons.tar.xz -C ${S}/
-
-    ( for i in $(find ${S} -name configure.ac -or -name configure.in|grep -v ".pc") ; do
-       cd $(dirname $i) && gnu-configize --force || true
-    done )
-    ( for f in ${S}/xbmc/interfaces/python/generated/*.cpp; do
-       touch `echo $f|sed -e 's/.cpp$/.xml/g'`
-    done )
-
-    BOOTSTRAP_STANDALONE=1 make -f bootstrap.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
-    BOOTSTRAP_STANDALONE=1 make JAVA=/bin/true -f codegenerator.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
-    oe_runconf
-}
-
-do_compile_prepend() {
-    for i in $(find . -name "Makefile") ; do
-        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' $i
-    done
-
-    for i in $(find . -name "*.mak*" -o    -name "Makefile") ; do
-        sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' -e 's:-rpath \$(libdir):-rpath ${libdir}:g' $i
-    done
-}
-
-INSANE_SKIP_${PN} = "rpaths"
-
-FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${libdir}/xbmc ${datadir}/xbmc"
-FILES_${PN}-dbg += "${libdir}/kodi/.debug ${libdir}/kodi/*/.debug ${libdir}/kodi/*/*/.debug ${libdir}/kodi/*/*/*/.debug"
-
-# kodi uses some kind of dlopen() method for libcec so we need to add it manually
-# OpenGL builds need glxinfo, that's in mesa-demos
-RRECOMMENDS_${PN}_append = " \
-    libcec \
-    python \
-    python-ctypes \
-    python-lang \
-    python-re \
-    python-netclient \
-    python-html \
-    python-difflib \
-    python-json \
-    python-zlib \
-    python-shell \
-    python-sqlite3 \
-    python-compression \
-    libcurl \
-    ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'xrandr xdpyinfo', '', d)} \
-"
-RRECOMMENDS_${PN}_append_libc-glibc = " \
-    glibc-charmap-ibm850 \
-    glibc-gconv-ibm850 \
-    glibc-gconv-unicode \
-    glibc-gconv-utf-32 \
-    glibc-charmap-utf-8 \
-    glibc-localedata-en-us \
-"
-
-RPROVIDES_${PN} += "xbmc"
-
-TOOLCHAIN = "gcc"
-- 
2.18.0


