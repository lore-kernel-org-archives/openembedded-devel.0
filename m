Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2F29A788A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 15:26:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 07:26:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="33523798"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 28 Feb 2018 07:26:38 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id DE38F5802B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 07:26:37 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Feb 2018 17:29:29 +0200
Message-Id: <1519831772-41479-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
References: <1519831772-41479-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/5] breakpad: remove unused patch
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
X-List-Received-Date: Wed, 28 Feb 2018 15:26:38 -0000

Remove the following unused patch:
        0005-Import-necessary-definitions-from-stab.h.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-Import-necessary-definitions-from-stab.h.patch | 199 ---------------------
 1 file changed, 199 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch
deleted file mode 100644
index 80de8c6..0000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0005-Import-necessary-definitions-from-stab.h.patch
+++ /dev/null
@@ -1,199 +0,0 @@
-From fa7a3b7312307acad0045549d5f306e7fd117804 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sun, 1 Feb 2015 14:34:44 +0100
-Subject: [PATCH 5/6] Import necessary definitions from stab.h
-
----
- configure.ac                        |   1 -
- src/common/android/include/stab.h   | 100 ------------------------------------
- src/common/common.gyp               |   1 -
- src/common/stabs_reader.cc          |   1 -
- src/common/stabs_reader.h           |  13 +++--
- src/common/stabs_reader_unittest.cc |   1 -
- 6 files changed, 10 insertions(+), 107 deletions(-)
- delete mode 100644 src/common/android/include/stab.h
-
-diff --git a/configure.ac b/configure.ac
-index 2223920..0e55cd9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -73,7 +73,6 @@ AC_HEADER_STDC
- AC_SYS_LARGEFILE
- m4_include(m4/ax_pthread.m4)
- AX_PTHREAD
--AC_CHECK_HEADERS([a.out.h])
- 
- # Only build Linux client libs when compiling for Linux
- case $host in
-diff --git a/src/common/android/include/stab.h b/src/common/android/include/stab.h
-deleted file mode 100644
-index cd92902..0000000
---- a/src/common/android/include/stab.h
-+++ /dev/null
-@@ -1,100 +0,0 @@
--// Copyright (c) 2012, Google Inc.
--// All rights reserved.
--//
--// Redistribution and use in source and binary forms, with or without
--// modification, are permitted provided that the following conditions are
--// met:
--//
--//     * Redistributions of source code must retain the above copyright
--// notice, this list of conditions and the following disclaimer.
--//     * Redistributions in binary form must reproduce the above
--// copyright notice, this list of conditions and the following disclaimer
--// in the documentation and/or other materials provided with the
--// distribution.
--//     * Neither the name of Google Inc. nor the names of its
--// contributors may be used to endorse or promote products derived from
--// this software without specific prior written permission.
--//
--// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
--// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
--// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
--// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
--// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
--// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
--// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
--// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
--// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
--// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--
--#ifndef GOOGLE_BREAKPAD_COMMON_ANDROID_INCLUDE_STAB_H
--#define GOOGLE_BREAKPAD_COMMON_ANDROID_INCLUDE_STAB_H
--
--#include <sys/cdefs.h>
--
--#ifdef __BIONIC_HAVE_STAB_H
--#include <stab.h>
--#else
--
--#ifdef __cplusplus
--extern "C" {
--#endif  // __cplusplus
--
--#define _STAB_CODE_LIST       \
--  _STAB_CODE_DEF(UNDF,0x00)   \
--  _STAB_CODE_DEF(GSYM,0x20)   \
--  _STAB_CODE_DEF(FNAME,0x22)  \
--  _STAB_CODE_DEF(FUN,0x24)    \
--  _STAB_CODE_DEF(STSYM,0x26)  \
--  _STAB_CODE_DEF(LCSYM,0x28)  \
--  _STAB_CODE_DEF(MAIN,0x2a)   \
--  _STAB_CODE_DEF(PC,0x30)     \
--  _STAB_CODE_DEF(NSYMS,0x32)  \
--  _STAB_CODE_DEF(NOMAP,0x34)  \
--  _STAB_CODE_DEF(OBJ,0x38)    \
--  _STAB_CODE_DEF(OPT,0x3c)    \
--  _STAB_CODE_DEF(RSYM,0x40)   \
--  _STAB_CODE_DEF(M2C,0x42)    \
--  _STAB_CODE_DEF(SLINE,0x44)  \
--  _STAB_CODE_DEF(DSLINE,0x46) \
--  _STAB_CODE_DEF(BSLINE,0x48) \
--  _STAB_CODE_DEF(BROWS,0x48)  \
--  _STAB_CODE_DEF(DEFD,0x4a)   \
--  _STAB_CODE_DEF(EHDECL,0x50) \
--  _STAB_CODE_DEF(MOD2,0x50)   \
--  _STAB_CODE_DEF(CATCH,0x54)  \
--  _STAB_CODE_DEF(SSYM,0x60)   \
--  _STAB_CODE_DEF(SO,0x64)     \
--  _STAB_CODE_DEF(LSYM,0x80)   \
--  _STAB_CODE_DEF(BINCL,0x82)  \
--  _STAB_CODE_DEF(SOL,0x84)    \
--  _STAB_CODE_DEF(PSYM,0xa0)   \
--  _STAB_CODE_DEF(EINCL,0xa2)  \
--  _STAB_CODE_DEF(ENTRY,0xa4)  \
--  _STAB_CODE_DEF(LBRAC,0xc0)  \
--  _STAB_CODE_DEF(EXCL,0xc2)   \
--  _STAB_CODE_DEF(SCOPE,0xc4)  \
--  _STAB_CODE_DEF(RBRAC,0xe0)  \
--  _STAB_CODE_DEF(BCOMM,0xe2)  \
--  _STAB_CODE_DEF(ECOMM,0xe4)  \
--  _STAB_CODE_DEF(ECOML,0xe8)  \
--  _STAB_CODE_DEF(NBTEXT,0xf0) \
--  _STAB_CODE_DEF(NBDATA,0xf2) \
--  _STAB_CODE_DEF(NBBSS,0xf4)  \
--  _STAB_CODE_DEF(NBSTS,0xf6)  \
--  _STAB_CODE_DEF(NBLCS,0xf8)  \
--  _STAB_CODE_DEF(LENG,0xfe)
--
--enum __stab_debug_code {
--#define _STAB_CODE_DEF(x,y)  N_##x = y,
--_STAB_CODE_LIST
--#undef _STAB_CODE_DEF
--};
--
--#ifdef __cplusplus
--}  // extern "C"
--#endif  // __cplusplus
--
--#endif  // __BIONIC_HAVE_STAB_H
--
--#endif  // GOOGLE_BREAKPAD_COMMON_ANDROID_INCLUDE_STAB_H
-diff --git a/src/common/common.gyp b/src/common/common.gyp
-index f01ede5..c49ff85 100644
---- a/src/common/common.gyp
-+++ b/src/common/common.gyp
-@@ -46,7 +46,6 @@
-         'android/include/elf.h',
-         'android/include/link.h',
-         'android/include/sgidefs.h',
--        'android/include/stab.h',
-         'android/include/sys/procfs.h',
-         'android/include/sys/signal.h',
-         'android/include/sys/user.h',
-diff --git a/src/common/stabs_reader.cc b/src/common/stabs_reader.cc
-index 6019fc7..9562caa 100644
---- a/src/common/stabs_reader.cc
-+++ b/src/common/stabs_reader.cc
-@@ -34,7 +34,6 @@
- #include "common/stabs_reader.h"
- 
- #include <assert.h>
--#include <stab.h>
- #include <string.h>
- 
- #include <string>
-diff --git a/src/common/stabs_reader.h b/src/common/stabs_reader.h
-index d89afc0..591f007 100644
---- a/src/common/stabs_reader.h
-+++ b/src/common/stabs_reader.h
-@@ -53,12 +53,19 @@
- #include <config.h>
- #endif
- 
--#ifdef HAVE_A_OUT_H
--#include <a.out.h>
--#endif
- #ifdef HAVE_MACH_O_NLIST_H
- #include <mach-o/nlist.h>
- #endif
-+// Definitions from <stab.h> and <a.out.h> for systems which
-+// do not have them
-+#undef N_UNDF
-+#define N_UNDF 0x0
-+#define N_FUN 0x24
-+#define N_SLINE 0x44
-+#define N_SO 0x64
-+#define N_LSYM 0x80
-+#define N_BINCL 0x82
-+#define N_SOL 0x84
- 
- #include <string>
- #include <vector>
-diff --git a/src/common/stabs_reader_unittest.cc b/src/common/stabs_reader_unittest.cc
-index a84da1c..854ac42 100644
---- a/src/common/stabs_reader_unittest.cc
-+++ b/src/common/stabs_reader_unittest.cc
-@@ -33,7 +33,6 @@
- 
- #include <assert.h>
- #include <errno.h>
--#include <stab.h>
- #include <stdarg.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.0.5
-
-- 
2.4.0


