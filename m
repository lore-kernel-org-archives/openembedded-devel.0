Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3F4E37805C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:45 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id v190so4687616pgv.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QqFuWXchOVNEWzxlsCstUjH0t50PE66FInbBVYEceyE=;
	b=BRCucT1QUCLqN68DoHSC0SRBF7SfsHr1l51q1y40egUcqyu3SFyhno92Uzvy2OYj+F
	lDs50U0EXMWcVTInnYIWVdnzKkSl6bKnH1J1vkpZVQvvVQMRg3ylcuu/LpEhnnXEZhdG
	Jv3rgNPpFmkNTK/8sn+jwRuJWhu3TfAAcN6vBhTQ3RG3EGIN3+3h4Id4CsIclPuYWiAG
	D0nr2ccVKehtcT0+9cRH3gLvcbIWcyoRdJDXI3dhgv87YyJcZqyxa0Ya5Ovi90QECHCc
	S9+zn+6FP6KYFUPSFj9dZoiwR8Y5y1SM1MZgxElOB3vrILfRffh6rEsvAY3np1XWet1S
	PFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QqFuWXchOVNEWzxlsCstUjH0t50PE66FInbBVYEceyE=;
	b=uFX3dnzFn76e0lpv5WnVFVHZFGJ0vR6m6wnc879dGVA3C838CoyFsthJulwiNnw+9h
	wQutYW4HYZpMpMNetLL3TryObMC3c0IdT0+H09QldIB9RMnSHCnYa0DNRPEKNf/hbzh7
	7Hnvy3krE2H7A1WYI5A6XB/troCi6BpmFT3W2r61uJVsUmeN4gKOn1tWpqF7MPrrOSFn
	lqbg4loIUQ4CbIqZrZFnyYyLR24w6DzCOmXeoA0W4ohfB4HpFE3XHHpMP3nyfmzT0ht4
	PxJx9Id14rGMawalGx3eLmHibLL0WMGFD2uji23E/DYogCkvfOav1BmGhwuSmEvKobFr
	NPVA==
X-Gm-Message-State: AIVw111A537XWinaV05gc1P04K16uaDJnh2kbZ9ZMfSZ7WmjeDqbq0eg
	lZIcb4VD2X8CImYa
X-Received: by 10.84.217.144 with SMTP id p16mr845857pli.276.1500347445459;
	Mon, 17 Jul 2017 20:10:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:11 -0700
Message-Id: <20170718031013.44536-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/17] open-vm-tools: Fix build with musl
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:46 -0000

Use SPDX format for LICENSES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...mptions-about-glibc-being-only-libc-imple.patch |  45 ++
 ...ude-poll.h-instead-of-obsolete-sys-poll.h.patch |  24 +
 .../0003-Rename-poll.h-to-vm_poll.h.patch          | 756 +++++++++++++++++++++
 ...ompatible-pointer-types-and-Wno-error-add.patch |  31 +
 ...05-Use-configure-test-for-struct-timespec.patch |  45 ++
 ...ix-definition-of-ALLPERMS-and-ACCESSPERMS.patch |  58 ++
 ...re-to-test-for-feature-instead-of-platfor.patch | 144 ++++
 .../0008-use-posix-strerror_r-unless-gnu.patch     |  30 +
 ...support-for-building-with-system-libtirpc.patch | 342 ++++++++++
 .../open-vm-tools/0010-gnu-ucontext.patch          |  65 ++
 ...Use-configure-test-for-sys-stat.h-include.patch |  25 +
 .../open-vm-tools/open-vm-tools_10.1.5.bb          |  25 +-
 12 files changed, 1584 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Rename-poll.h-to-vm_poll.h.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-struct-timespec.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-use-posix-strerror_r-unless-gnu.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Add-support-for-building-with-system-libtirpc.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-gnu-ucontext.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-configure-test-for-sys-stat.h-include.patch

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch
new file mode 100644
index 000000000..9773b4a94
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch
@@ -0,0 +1,45 @@
+From a0983d84185f04c4e40778fe951fde4439894882 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Jul 2017 07:37:03 -0700
+Subject: [PATCH 01/11] Remove assumptions about glibc being only libc
+ implementation on linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/file/fileIOPosix.c      | 2 +-
+ open-vm-tools/lib/include/vm_basic_defs.h | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+Index: open-vm-tools/lib/file/fileIOPosix.c
+===================================================================
+--- open-vm-tools.orig/lib/file/fileIOPosix.c
++++ open-vm-tools/lib/file/fileIOPosix.c
+@@ -205,7 +205,7 @@ static AlignedPool alignedPool;
+  * are not available in any header file.
+  */
+ 
+-#if defined(__linux__) && !defined(__ANDROID__)
++#if defined(__linux__) && defined(__GLIBC__)
+    #if defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS == 64)
+       /*
+        * We want preadv/pwritev. But due to FOB=64, the symbols are -64.
+Index: open-vm-tools/lib/include/vm_basic_defs.h
+===================================================================
+--- open-vm-tools.orig/lib/include/vm_basic_defs.h
++++ open-vm-tools/lib/include/vm_basic_defs.h
+@@ -571,6 +571,7 @@ typedef int pid_t;
+ #if defined __linux__ && !defined __KERNEL__ && !defined MODULE && \
+                          !defined VMM && !defined FROBOS && !defined __ANDROID__
+ #include <features.h>
++#if __GLIBC__
+ #if __GLIBC_PREREQ(2, 1) && !defined GLIBC_VERSION_21
+ #define GLIBC_VERSION_21
+ #endif
+@@ -590,6 +591,7 @@ typedef int pid_t;
+ #define GLIBC_VERSION_212
+ #endif
+ #endif
++#endif
+ 
+ /*
+  * Convenience definitions of unicode characters.
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch
new file mode 100644
index 000000000..d26bf2dd3
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch
@@ -0,0 +1,24 @@
+From d44c7c9de7380ad7b284231bd5b5c99b5c19758d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Jul 2017 07:37:59 -0700
+Subject: [PATCH 02/11] include poll.h instead of obsolete sys/poll.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/asyncsocket/asyncSocketInt.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: open-vm-tools/lib/asyncsocket/asyncSocketInt.h
+===================================================================
+--- open-vm-tools.orig/lib/asyncsocket/asyncSocketInt.h
++++ open-vm-tools/lib/asyncsocket/asyncSocketInt.h
+@@ -71,8 +71,8 @@
+ #else
+ #include <stddef.h>
+ #include <ctype.h>
++#include <poll.h>
+ #include <sys/types.h>
+-#include <sys/poll.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <netdb.h>
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Rename-poll.h-to-vm_poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Rename-poll.h-to-vm_poll.h.patch
new file mode 100644
index 000000000..8641778d0
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Rename-poll.h-to-vm_poll.h.patch
@@ -0,0 +1,756 @@
+From 687fca20b3417ac885b6961e6fe1126d4a3fe7a4 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Tue, 17 Nov 2015 10:57:31 +0000
+Subject: [PATCH 03/11] Rename poll.h to vm_poll.h
+
+musl libc's system headers pulls in open-vm-tools' poll.h. To avoid this
+we rename poll.h to vm_poll.h.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+ open-vm-tools/lib/asyncsocket/asyncsocket.c                          | 2 +-
+ open-vm-tools/lib/hgfsServer/hgfsServer.c                            | 2 +-
+ open-vm-tools/lib/include/asyncsocket.h                              | 2 +-
+ open-vm-tools/lib/include/pollImpl.h                                 | 2 +-
+ open-vm-tools/lib/include/{poll.h => vm_poll.h}                      | 0
+ open-vm-tools/lib/rpcIn/rpcin.c                                      | 2 +-
+ open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c | 2 +-
+ 7 files changed, 6 insertions(+), 6 deletions(-)
+ rename open-vm-tools/lib/include/{poll.h => vm_poll.h} (100%)
+
+Index: open-vm-tools/lib/asyncsocket/asyncsocket.c
+===================================================================
+--- open-vm-tools.orig/lib/asyncsocket/asyncsocket.c
++++ open-vm-tools/lib/asyncsocket/asyncsocket.c
+@@ -52,7 +52,7 @@
+ #include "vmware.h"
+ #include "asyncsocket.h"
+ #include "asyncSocketInt.h"
+-#include "poll.h"
++#include "vm_poll.h"
+ #include "log.h"
+ #include "err.h"
+ #include "hostinfo.h"
+Index: open-vm-tools/lib/hgfsServer/hgfsServer.c
+===================================================================
+--- open-vm-tools.orig/lib/hgfsServer/hgfsServer.c
++++ open-vm-tools/lib/hgfsServer/hgfsServer.c
+@@ -48,7 +48,7 @@
+ #include "hgfsServerOplock.h"
+ #include "hgfsDirNotify.h"
+ #include "userlock.h"
+-#include "poll.h"
++#include "vm_poll.h"
+ #include "mutexRankLib.h"
+ #include "vm_basic_asm.h"
+ #include "unicodeOperations.h"
+Index: open-vm-tools/lib/include/asyncsocket.h
+===================================================================
+--- open-vm-tools.orig/lib/include/asyncsocket.h
++++ open-vm-tools/lib/include/asyncsocket.h
+@@ -129,7 +129,7 @@ typedef struct AsyncSocket AsyncSocket;
+  * Or the client can specify its favorite poll class and locking behavior.
+  * Use of IVmdbPoll is only supported for regular sockets and for Attach.
+  */
+-#include "poll.h"
++#include "vm_poll.h"
+ struct IVmdbPoll;
+ typedef struct AsyncSocketPollParams {
+    int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
+Index: open-vm-tools/lib/include/poll.h
+===================================================================
+--- open-vm-tools.orig/lib/include/poll.h
++++ /dev/null
+@@ -1,324 +0,0 @@
+-/*********************************************************
+- * Copyright (C) 1998-2016 VMware, Inc. All rights reserved.
+- *
+- * This program is free software; you can redistribute it and/or modify it
+- * under the terms of the GNU Lesser General Public License as published
+- * by the Free Software Foundation version 2.1 and no later version.
+- *
+- * This program is distributed in the hope that it will be useful, but
+- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+- * or FITNESS FOR A PARTICULAR PURPOSE.  See the Lesser GNU General Public
+- * License for more details.
+- *
+- * You should have received a copy of the GNU Lesser General Public License
+- * along with this program; if not, write to the Free Software Foundation, Inc.,
+- * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA.
+- *
+- *********************************************************/
+-
+-/*********************************************************
+- * The contents of this file are subject to the terms of the Common
+- * Development and Distribution License (the "License") version 1.0
+- * and no later version.  You may not use this file except in
+- * compliance with the License.
+- *
+- * You can obtain a copy of the License at
+- *         http://www.opensource.org/licenses/cddl1.php
+- *
+- * See the License for the specific language governing permissions
+- * and limitations under the License.
+- *
+- *********************************************************/
+-
+-
+-#ifndef _POLL_H_
+-#define _POLL_H_
+-
+-#define INCLUDE_ALLOW_USERLEVEL
+-#define INCLUDE_ALLOW_VMCORE
+-#include "includeCheck.h"
+-
+-#include "vm_basic_types.h"
+-#include "vm_basic_defs.h"
+-#include "vmware.h"
+-#include "userlock.h"
+-
+-#ifdef _WIN32
+-#define HZ 100
+-#elif defined linux
+-#include <asm/param.h>
+-#elif __APPLE__
+-#include <TargetConditionals.h>
+-/*
+- * Old SDKs don't define TARGET_OS_IPHONE at all.
+- * New ones define it to 0 on Mac OS X, 1 on iOS.
+- */
+-#if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
+-#include <sys/kernel.h>
+-#endif
+-#include <sys/poll.h>
+-#define HZ 100
+-#endif
+-#ifdef __ANDROID__
+-/*
+- * <poll.h> of android should be included, but its name is same
+- * with this file. So its content is put here to avoid conflict.
+- */
+-#include <asm/poll.h>
+-#define HZ 100
+-typedef unsigned int  nfds_t;
+-int poll(struct pollfd *, nfds_t, long);
+-#endif
+-
+-
+-/*
+- * Poll event types: each type has a different reason for firing,
+- * or condition that must be met before firing.
+- */
+-
+-typedef enum {
+-   /*
+-    * Actual Poll queue types against which you can register callbacks.
+-    */
+-   POLL_VIRTUALREALTIME = -1, /* Negative because it doesn't have its own Q */
+-   POLL_VTIME = 0,
+-   POLL_REALTIME,
+-   POLL_DEVICE,
+-   POLL_MAIN_LOOP,
+-   POLL_NUM_QUEUES
+-} PollEventType;
+-
+-
+-/*
+- * Classes of events
+- *
+- * These are the predefined classes.  More can be declared
+- * with Poll_AllocClass().
+- */
+-
+-typedef enum PollClass {
+-   POLL_CLASS_MAIN,
+-   POLL_CLASS_PAUSE,
+-   POLL_CLASS_IPC,
+-   POLL_CLASS_CPT,
+-   POLL_CLASS_MKS,
+-   POLL_FIXED_CLASSES,
+-   POLL_MAX_CLASSES = 320 /* Size enum to maximum */
+-} PollClass;
+-
+-
+-/*
+- * Each callback is registered in a set of classes
+- */
+-
+-typedef struct PollClassSet {
+-   /* Type is uintptr_t to give best 32/64-bit code. */
+-#define _POLL_ELEMSIZE (sizeof (uintptr_t) * 8)
+-   uintptr_t bits[CEILING(POLL_MAX_CLASSES, _POLL_ELEMSIZE)];
+-} PollClassSet;
+-
+-/* An empty PollClassSet. */
+-static INLINE PollClassSet
+-PollClassSet_Empty(void)
+-{
+-   PollClassSet set = { { 0 } };
+-   return set;
+-}
+-
+-/* A PollClassSet with the single member. */
+-static INLINE PollClassSet
+-PollClassSet_Singleton(PollClass c)
+-{
+-   PollClassSet s = PollClassSet_Empty();
+-
+-   ASSERT_ON_COMPILE(sizeof s.bits[0] * 8 == _POLL_ELEMSIZE); /* Size correct */
+-   ASSERT_ON_COMPILE((_POLL_ELEMSIZE & (_POLL_ELEMSIZE - 1)) == 0); /* power of 2 */
+-   ASSERT_ON_COMPILE(POLL_MAX_CLASSES <= ARRAYSIZE(s.bits) * _POLL_ELEMSIZE);
+-   ASSERT(c < POLL_MAX_CLASSES);
+-
+-   s.bits[c / _POLL_ELEMSIZE] = CONST3264U(1) << (c % _POLL_ELEMSIZE);
+-   return s;
+-}
+-
+-/* Combine two PollClassSets. */
+-static INLINE PollClassSet
+-PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
+-{
+-   PollClassSet u;
+-   unsigned i;
+-
+-   for (i = 0; i < ARRAYSIZE(u.bits); i++) {
+-      u.bits[i] = lhs.bits[i] | rhs.bits[i];
+-   }
+-   return u;
+-}
+-
+-/* Add single class to PollClassSet. */
+-static INLINE PollClassSet
+-PollClassSet_Include(PollClassSet set, PollClass c)
+-{
+-   return PollClassSet_Union(set, PollClassSet_Singleton(c));
+-}
+-
+-
+-#define POLL_CS_MAIN    PollClassSet_Singleton(POLL_CLASS_MAIN)
+-#define POLL_CS_PAUSE   PollClassSet_Union(POLL_CS_MAIN,            \
+-                           PollClassSet_Singleton(POLL_CLASS_PAUSE))
+-#define POLL_CS_CPT     PollClassSet_Union(POLL_CS_PAUSE,           \
+-                           PollClassSet_Singleton(POLL_CLASS_CPT))
+-#define POLL_CS_IPC     PollClassSet_Union(POLL_CS_CPT,             \
+-                           PollClassSet_Singleton(POLL_CLASS_IPC))
+-#define POLL_CS_VMDB    POLL_CS_PAUSE /* POLL_CLASS_VMDB is retired */
+-#define POLL_CS_MKS	PollClassSet_Singleton(POLL_CLASS_MKS)
+-/* 
+- * DANGER.  You don't need POLL_CS_ALWAYS.  Really.  So don't use it.
+- */
+-#define POLL_CS_ALWAYS  PollClassSet_Union(POLL_CS_CPT, POLL_CS_IPC)
+-
+-/*
+- * Poll class-set taxonomy:
+- * POLL_CS_MAIN
+- *    - Unless you NEED another class, use POLL_CS_MAIN.
+- * POLL_CS_PAUSE
+- *    - For callbacks that must occur even if the guest is paused.
+- *      Most VMDB or Foundry commands are in this category.
+- * POLL_CS_CPT
+- *    - Only for callbacks which can trigger intermediate Checkpoint 
+- *      transitions.
+- *      The ONLY such callback is Migrate.
+- * POLL_CS_IPC
+- *    - Only for callbacks which can contain Msg_(Post|Hint|Question) 
+- *      responses, and for signal handlers (why)?
+- *      Vigor, VMDB, and Foundry can contain Msg_* responses.
+- * POLL_CS_MKS
+- *    - Callback runs in MKS thread.
+- * POLL_CS_ALWAYS
+- *    - Only for events that must be processed immediately.
+- *      The ONLY such callback is OvhdMemVmxSizeCheck.
+- */
+-
+-
+-/*
+- * Poll_Callback flags
+- */
+-
+-#define POLL_FLAG_PERIODIC		0x01    // keep after firing
+-#define POLL_FLAG_REMOVE_AT_POWEROFF	0x02  	// self-explanatory
+-#define POLL_FLAG_READ			0x04	// device is ready for reading
+-#define POLL_FLAG_WRITE			0x08	// device is ready for writing
+-#define POLL_FLAG_SOCKET                0x10    // device is a Windows socket
+-#define POLL_FLAG_NO_BULL               0x20    // callback does its own locking
+-#define POLL_FLAG_WINSOCK               0x40    // Winsock style write events
+-#define POLL_FLAG_FD                    0x80    // device is a Windows file descriptor.
+-#define POLL_FLAG_ACCEPT_INVALID_FDS    0x100   // For broken 3rd party libs, e.g. curl
+-#define POLL_FLAG_THUNK_TO_WND          0x200   // thunk callback to window message loop
+-
+-
+-/*
+- * Advisory minimum time period.
+- * Users that want the fastest running real-time poll
+- * should use TICKS_TO_USECS(1).
+- */
+-
+-#define TICKS_TO_USECS(_x) ((_x) * (1000000 / HZ))
+-#define USECS_TO_TICKS(_x) ((_x) / (1000000 / HZ))
+-
+-
+-typedef void (*PollerFunction)(void *clientData);
+-typedef void (*PollerFireWrapper)(PollerFunction func,
+-                                  void *funcData,
+-                                  void *wrapperData);
+-typedef Bool (*PollerErrorFn)(const char *errorStr);
+-
+-/*
+- * Initialisers:
+- *
+- *      For the sake of convenience, we declare the initialisers
+- *      for custom implmentations here, even though the actual
+- *      implementations are distinct from the core poll code.
+- */
+-
+-typedef struct PollOptions {
+-   Bool locked;           // Use internal MXUser for locking
+-   Bool allowFullQueue;   // Don't assert when device event queue is full.
+-   VThreadID windowsMsgThread;       // thread that processes Windows messages
+-   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
+-   void *fireWrapperData; // optional
+-   PollerErrorFn errorFn; // optional; called upon unrecoverable error
+-} PollOptions;
+-
+-
+-void Poll_InitDefault(void);
+-void Poll_InitDefaultEx(const PollOptions *opts);
+-void Poll_InitGtk(void); // On top of glib for Linux
+-void Poll_InitCF(void);  // On top of CoreFoundation for OSX
+-
+-
+-/*
+- * Functions
+- */
+-int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
+-void Poll_Loop(Bool loop, Bool *exit, PollClass c);
+-void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
+-Bool Poll_LockingEnabled(void);
+-void Poll_Exit(void);
+-
+-
+-/*
+- * Poll_Callback adds a callback regardless of whether an identical one exists.
+- *
+- * Likewise, Poll_CallbackRemove removes exactly one callback.
+- */
+-
+-VMwareStatus Poll_Callback(PollClassSet classSet,
+-                           int flags,
+-                           PollerFunction f,
+-                           void *clientData,
+-                           PollEventType type,
+-                           PollDevHandle info, // fd/microsec delay
+-                           MXUserRecLock *lck);
+-Bool Poll_CallbackRemove(PollClassSet classSet,
+-                         int flags,
+-                         PollerFunction f,
+-                         void *clientData,
+-                         PollEventType type);
+-Bool Poll_CallbackRemoveOneByCB(PollClassSet classSet,
+-                                int flags,
+-                                PollerFunction f,
+-                                PollEventType type,
+-                                void **clientData);
+-
+-void Poll_NotifyChange(PollClassSet classSet);
+-
+-/*
+- * Wrappers for Poll_Callback and Poll_CallbackRemove that present
+- * simpler subsets of those interfaces.
+- */
+-
+-VMwareStatus Poll_CB_Device(PollerFunction f,
+-                            void *clientData,
+-                            PollDevHandle device,
+-                            Bool periodic);
+-
+-Bool Poll_CB_DeviceRemove(PollerFunction f,
+-                          void *clientData,
+-                          Bool periodic);
+-
+-
+-VMwareStatus Poll_CB_RTime(PollerFunction f,
+-                           void *clientData,
+-                           int delay,	// microseconds
+-                           Bool periodic,
+-                           MXUserRecLock *lock);
+-
+-Bool Poll_CB_RTimeRemove(PollerFunction f,
+-                         void *clientData,
+-                         Bool periodic);
+-
+-
+-#ifdef _WIN32
+-void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
+-Bool Poll_FireWndCallback(void *lparam);
+-#endif
+-
+-#endif // _POLL_H_
+Index: open-vm-tools/lib/include/pollImpl.h
+===================================================================
+--- open-vm-tools.orig/lib/include/pollImpl.h
++++ open-vm-tools/lib/include/pollImpl.h
+@@ -44,7 +44,7 @@
+ #define INCLUDE_ALLOW_USERLEVEL
+ #include "includeCheck.h"
+ 
+-#include "poll.h"
++#include "vm_poll.h"
+ 
+ /*
+  * PollImpl:
+Index: open-vm-tools/lib/include/vm_poll.h
+===================================================================
+--- /dev/null
++++ open-vm-tools/lib/include/vm_poll.h
+@@ -0,0 +1,324 @@
++/*********************************************************
++ * Copyright (C) 1998-2016 VMware, Inc. All rights reserved.
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU Lesser General Public License as published
++ * by the Free Software Foundation version 2.1 and no later version.
++ *
++ * This program is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++ * or FITNESS FOR A PARTICULAR PURPOSE.  See the Lesser GNU General Public
++ * License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program; if not, write to the Free Software Foundation, Inc.,
++ * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA.
++ *
++ *********************************************************/
++
++/*********************************************************
++ * The contents of this file are subject to the terms of the Common
++ * Development and Distribution License (the "License") version 1.0
++ * and no later version.  You may not use this file except in
++ * compliance with the License.
++ *
++ * You can obtain a copy of the License at
++ *         http://www.opensource.org/licenses/cddl1.php
++ *
++ * See the License for the specific language governing permissions
++ * and limitations under the License.
++ *
++ *********************************************************/
++
++
++#ifndef _POLL_H_
++#define _POLL_H_
++
++#define INCLUDE_ALLOW_USERLEVEL
++#define INCLUDE_ALLOW_VMCORE
++#include "includeCheck.h"
++
++#include "vm_basic_types.h"
++#include "vm_basic_defs.h"
++#include "vmware.h"
++#include "userlock.h"
++
++#ifdef _WIN32
++#define HZ 100
++#elif defined linux
++#include <asm/param.h>
++#elif __APPLE__
++#include <TargetConditionals.h>
++/*
++ * Old SDKs don't define TARGET_OS_IPHONE at all.
++ * New ones define it to 0 on Mac OS X, 1 on iOS.
++ */
++#if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
++#include <sys/kernel.h>
++#endif
++#include <sys/poll.h>
++#define HZ 100
++#endif
++#ifdef __ANDROID__
++/*
++ * <poll.h> of android should be included, but its name is same
++ * with this file. So its content is put here to avoid conflict.
++ */
++#include <asm/poll.h>
++#define HZ 100
++typedef unsigned int  nfds_t;
++int poll(struct pollfd *, nfds_t, long);
++#endif
++
++
++/*
++ * Poll event types: each type has a different reason for firing,
++ * or condition that must be met before firing.
++ */
++
++typedef enum {
++   /*
++    * Actual Poll queue types against which you can register callbacks.
++    */
++   POLL_VIRTUALREALTIME = -1, /* Negative because it doesn't have its own Q */
++   POLL_VTIME = 0,
++   POLL_REALTIME,
++   POLL_DEVICE,
++   POLL_MAIN_LOOP,
++   POLL_NUM_QUEUES
++} PollEventType;
++
++
++/*
++ * Classes of events
++ *
++ * These are the predefined classes.  More can be declared
++ * with Poll_AllocClass().
++ */
++
++typedef enum PollClass {
++   POLL_CLASS_MAIN,
++   POLL_CLASS_PAUSE,
++   POLL_CLASS_IPC,
++   POLL_CLASS_CPT,
++   POLL_CLASS_MKS,
++   POLL_FIXED_CLASSES,
++   POLL_MAX_CLASSES = 320 /* Size enum to maximum */
++} PollClass;
++
++
++/*
++ * Each callback is registered in a set of classes
++ */
++
++typedef struct PollClassSet {
++   /* Type is uintptr_t to give best 32/64-bit code. */
++#define _POLL_ELEMSIZE (sizeof (uintptr_t) * 8)
++   uintptr_t bits[CEILING(POLL_MAX_CLASSES, _POLL_ELEMSIZE)];
++} PollClassSet;
++
++/* An empty PollClassSet. */
++static INLINE PollClassSet
++PollClassSet_Empty(void)
++{
++   PollClassSet set = { { 0 } };
++   return set;
++}
++
++/* A PollClassSet with the single member. */
++static INLINE PollClassSet
++PollClassSet_Singleton(PollClass c)
++{
++   PollClassSet s = PollClassSet_Empty();
++
++   ASSERT_ON_COMPILE(sizeof s.bits[0] * 8 == _POLL_ELEMSIZE); /* Size correct */
++   ASSERT_ON_COMPILE((_POLL_ELEMSIZE & (_POLL_ELEMSIZE - 1)) == 0); /* power of 2 */
++   ASSERT_ON_COMPILE(POLL_MAX_CLASSES <= ARRAYSIZE(s.bits) * _POLL_ELEMSIZE);
++   ASSERT(c < POLL_MAX_CLASSES);
++
++   s.bits[c / _POLL_ELEMSIZE] = CONST3264U(1) << (c % _POLL_ELEMSIZE);
++   return s;
++}
++
++/* Combine two PollClassSets. */
++static INLINE PollClassSet
++PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
++{
++   PollClassSet u;
++   unsigned i;
++
++   for (i = 0; i < ARRAYSIZE(u.bits); i++) {
++      u.bits[i] = lhs.bits[i] | rhs.bits[i];
++   }
++   return u;
++}
++
++/* Add single class to PollClassSet. */
++static INLINE PollClassSet
++PollClassSet_Include(PollClassSet set, PollClass c)
++{
++   return PollClassSet_Union(set, PollClassSet_Singleton(c));
++}
++
++
++#define POLL_CS_MAIN    PollClassSet_Singleton(POLL_CLASS_MAIN)
++#define POLL_CS_PAUSE   PollClassSet_Union(POLL_CS_MAIN,            \
++                           PollClassSet_Singleton(POLL_CLASS_PAUSE))
++#define POLL_CS_CPT     PollClassSet_Union(POLL_CS_PAUSE,           \
++                           PollClassSet_Singleton(POLL_CLASS_CPT))
++#define POLL_CS_IPC     PollClassSet_Union(POLL_CS_CPT,             \
++                           PollClassSet_Singleton(POLL_CLASS_IPC))
++#define POLL_CS_VMDB    POLL_CS_PAUSE /* POLL_CLASS_VMDB is retired */
++#define POLL_CS_MKS	PollClassSet_Singleton(POLL_CLASS_MKS)
++/* 
++ * DANGER.  You don't need POLL_CS_ALWAYS.  Really.  So don't use it.
++ */
++#define POLL_CS_ALWAYS  PollClassSet_Union(POLL_CS_CPT, POLL_CS_IPC)
++
++/*
++ * Poll class-set taxonomy:
++ * POLL_CS_MAIN
++ *    - Unless you NEED another class, use POLL_CS_MAIN.
++ * POLL_CS_PAUSE
++ *    - For callbacks that must occur even if the guest is paused.
++ *      Most VMDB or Foundry commands are in this category.
++ * POLL_CS_CPT
++ *    - Only for callbacks which can trigger intermediate Checkpoint 
++ *      transitions.
++ *      The ONLY such callback is Migrate.
++ * POLL_CS_IPC
++ *    - Only for callbacks which can contain Msg_(Post|Hint|Question) 
++ *      responses, and for signal handlers (why)?
++ *      Vigor, VMDB, and Foundry can contain Msg_* responses.
++ * POLL_CS_MKS
++ *    - Callback runs in MKS thread.
++ * POLL_CS_ALWAYS
++ *    - Only for events that must be processed immediately.
++ *      The ONLY such callback is OvhdMemVmxSizeCheck.
++ */
++
++
++/*
++ * Poll_Callback flags
++ */
++
++#define POLL_FLAG_PERIODIC		0x01    // keep after firing
++#define POLL_FLAG_REMOVE_AT_POWEROFF	0x02  	// self-explanatory
++#define POLL_FLAG_READ			0x04	// device is ready for reading
++#define POLL_FLAG_WRITE			0x08	// device is ready for writing
++#define POLL_FLAG_SOCKET                0x10    // device is a Windows socket
++#define POLL_FLAG_NO_BULL               0x20    // callback does its own locking
++#define POLL_FLAG_WINSOCK               0x40    // Winsock style write events
++#define POLL_FLAG_FD                    0x80    // device is a Windows file descriptor.
++#define POLL_FLAG_ACCEPT_INVALID_FDS    0x100   // For broken 3rd party libs, e.g. curl
++#define POLL_FLAG_THUNK_TO_WND          0x200   // thunk callback to window message loop
++
++
++/*
++ * Advisory minimum time period.
++ * Users that want the fastest running real-time poll
++ * should use TICKS_TO_USECS(1).
++ */
++
++#define TICKS_TO_USECS(_x) ((_x) * (1000000 / HZ))
++#define USECS_TO_TICKS(_x) ((_x) / (1000000 / HZ))
++
++
++typedef void (*PollerFunction)(void *clientData);
++typedef void (*PollerFireWrapper)(PollerFunction func,
++                                  void *funcData,
++                                  void *wrapperData);
++typedef Bool (*PollerErrorFn)(const char *errorStr);
++
++/*
++ * Initialisers:
++ *
++ *      For the sake of convenience, we declare the initialisers
++ *      for custom implmentations here, even though the actual
++ *      implementations are distinct from the core poll code.
++ */
++
++typedef struct PollOptions {
++   Bool locked;           // Use internal MXUser for locking
++   Bool allowFullQueue;   // Don't assert when device event queue is full.
++   VThreadID windowsMsgThread;       // thread that processes Windows messages
++   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
++   void *fireWrapperData; // optional
++   PollerErrorFn errorFn; // optional; called upon unrecoverable error
++} PollOptions;
++
++
++void Poll_InitDefault(void);
++void Poll_InitDefaultEx(const PollOptions *opts);
++void Poll_InitGtk(void); // On top of glib for Linux
++void Poll_InitCF(void);  // On top of CoreFoundation for OSX
++
++
++/*
++ * Functions
++ */
++int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
++void Poll_Loop(Bool loop, Bool *exit, PollClass c);
++void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
++Bool Poll_LockingEnabled(void);
++void Poll_Exit(void);
++
++
++/*
++ * Poll_Callback adds a callback regardless of whether an identical one exists.
++ *
++ * Likewise, Poll_CallbackRemove removes exactly one callback.
++ */
++
++VMwareStatus Poll_Callback(PollClassSet classSet,
++                           int flags,
++                           PollerFunction f,
++                           void *clientData,
++                           PollEventType type,
++                           PollDevHandle info, // fd/microsec delay
++                           MXUserRecLock *lck);
++Bool Poll_CallbackRemove(PollClassSet classSet,
++                         int flags,
++                         PollerFunction f,
++                         void *clientData,
++                         PollEventType type);
++Bool Poll_CallbackRemoveOneByCB(PollClassSet classSet,
++                                int flags,
++                                PollerFunction f,
++                                PollEventType type,
++                                void **clientData);
++
++void Poll_NotifyChange(PollClassSet classSet);
++
++/*
++ * Wrappers for Poll_Callback and Poll_CallbackRemove that present
++ * simpler subsets of those interfaces.
++ */
++
++VMwareStatus Poll_CB_Device(PollerFunction f,
++                            void *clientData,
++                            PollDevHandle device,
++                            Bool periodic);
++
++Bool Poll_CB_DeviceRemove(PollerFunction f,
++                          void *clientData,
++                          Bool periodic);
++
++
++VMwareStatus Poll_CB_RTime(PollerFunction f,
++                           void *clientData,
++                           int delay,	// microseconds
++                           Bool periodic,
++                           MXUserRecLock *lock);
++
++Bool Poll_CB_RTimeRemove(PollerFunction f,
++                         void *clientData,
++                         Bool periodic);
++
++
++#ifdef _WIN32
++void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
++Bool Poll_FireWndCallback(void *lparam);
++#endif
++
++#endif // _POLL_H_
+Index: open-vm-tools/lib/rpcIn/rpcin.c
+===================================================================
+--- open-vm-tools.orig/lib/rpcIn/rpcin.c
++++ open-vm-tools/lib/rpcIn/rpcin.c
+@@ -57,7 +57,7 @@
+ 
+ #if defined(VMTOOLS_USE_VSOCKET)
+ #  include <glib.h>
+-#  include "poll.h"
++#  include "vm_poll.h"
+ #  include "asyncsocket.h"
+ #  include "vmci_defs.h"
+ #include "dataMap.h"
+Index: open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
++++ open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
+@@ -48,7 +48,7 @@
+ #include "rpcout.h"
+ #include "rabbitmqProxyConst.h"
+ #include "vm_basic_types.h"
+-#include "poll.h"
++#include "vm_poll.h"
+ #ifdef OPEN_VM_TOOLS
+ #include "vmci_sockets.h"
+ #include "sslDirect.h"
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch
new file mode 100644
index 000000000..010516761
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch
@@ -0,0 +1,31 @@
+From cdb0b3c898c6b6b6c8259d9ddb8b00163ac5e419 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Jul 2017 09:43:18 -0700
+Subject: [PATCH 04/11] Add -Wno-incompatible-pointer-types and
+ -Wno-error=address
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/dynxdr/Makefile.am | 2 +-
+ open-vm-tools/lib/file/Makefile.am   | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+Index: open-vm-tools/lib/dynxdr/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/dynxdr/Makefile.am
++++ open-vm-tools/lib/dynxdr/Makefile.am
+@@ -20,4 +20,4 @@ noinst_LTLIBRARIES = libDynxdr.la
+ libDynxdr_la_SOURCES = 
+ libDynxdr_la_SOURCES += dynxdr.c
+ libDynxdr_la_SOURCES += xdrutil.c
+-
++libDynxdr_la_CPPFLAGS = -Wno-incompatible-pointer-types
+Index: open-vm-tools/lib/file/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/file/Makefile.am
++++ open-vm-tools/lib/file/Makefile.am
+@@ -27,3 +27,4 @@ libFile_la_SOURCES += fileLockPrimitive.
+ libFile_la_SOURCES += fileLockPosix.c
+ libFile_la_SOURCES += fileTempPosix.c
+ libFile_la_SOURCES += fileTemp.c
++libFile_la_CPPFLAGS = -Wno-error=address
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-struct-timespec.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-struct-timespec.patch
new file mode 100644
index 000000000..f02d00f84
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0005-Use-configure-test-for-struct-timespec.patch
@@ -0,0 +1,45 @@
+From bf1eafb07297711baf9320b1edcca8a3376f117d Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 09:03:00 +0000
+Subject: [PATCH 05/11] Use configure test for struct timespec
+
+Use the configure script to test for struct time spec instead of trying
+to keep track of what platforms has it.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+ open-vm-tools/configure.ac           | 1 +
+ open-vm-tools/lib/include/hgfsUtil.h | 8 +-------
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+Index: open-vm-tools/configure.ac
+===================================================================
+--- open-vm-tools.orig/configure.ac
++++ open-vm-tools/configure.ac
+@@ -1127,6 +1127,7 @@ AC_TYPE_OFF_T
+ AC_TYPE_PID_T
+ AC_TYPE_SIZE_T
+ AC_CHECK_MEMBERS([struct stat.st_rdev])
++AC_CHECK_MEMBERS([struct timespec.tv_sec],[],[],[[#include <time.h>]])
+ AC_HEADER_TIME
+ AC_STRUCT_TM
+ AC_C_VOLATILE
+Index: open-vm-tools/lib/include/hgfsUtil.h
+===================================================================
+--- open-vm-tools.orig/lib/include/hgfsUtil.h
++++ open-vm-tools/lib/include/hgfsUtil.h
+@@ -53,13 +53,7 @@
+ #      include <time.h>
+ #   endif
+ #   include "vm_basic_types.h"
+-#   if !defined _STRUCT_TIMESPEC &&   \
+-       !defined _TIMESPEC_DECLARED && \
+-       !defined __timespec_defined && \
+-       !defined sun && \
+-       !defined __FreeBSD__ && \
+-       !__APPLE__ && \
+-       !defined _WIN32
++#   if !defined HAVE_STRUCT_TIMESPEC_TV_SEC
+ struct timespec {
+    time_t tv_sec;
+    long   tv_nsec;
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
new file mode 100644
index 000000000..d1f4eff9b
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch
@@ -0,0 +1,58 @@
+From 31ae6f42458f90d4994a4ad8e2b7673691612c36 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 09:10:14 +0000
+Subject: [PATCH 06/11] Fix definition of ALLPERMS and ACCESSPERMS
+
+The ALLPERMS and ACCESSPERMS defines are not specified in POSIX so
+assume it is not there instead of testing for specific implementations.
+
+This is needed for musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+ open-vm-tools/lib/hgfsServer/hgfsServerLinux.c      | 8 +++++---
+ open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c | 3 +--
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+Index: open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+===================================================================
+--- open-vm-tools.orig/lib/hgfsServer/hgfsServerLinux.c
++++ open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+@@ -107,11 +107,13 @@ typedef struct DirectoryEntry {
+ #endif
+ 
+ /*
+- * ALLPERMS (mode 07777) and ACCESSPERMS (mode 0777) are not defined in the
+- * Solaris version of <sys/stat.h>.
++ * ALLPERMS (mode 07777) and ACCESSPERMS (mode 0777) are not specified in
++ * POSIX.
+  */
+-#ifdef sun
++#ifndef ACCESSPERMS
+ #   define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO)
++#endif
++#ifndef ALLPERMS
+ #   define ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
+ #endif
+ 
+Index: open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/dndcp/dnd/dndLinux.c
++++ open-vm-tools/services/plugins/dndcp/dnd/dndLinux.c
+@@ -51,7 +51,7 @@
+ 
+ #define DND_ROOTDIR_PERMS     (S_IRWXU | S_IRWXG | S_IRWXO)
+ #define DND_STAGINGDIR_PERMS  (S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH)
+-#ifdef sun
++#ifndef ACCESSPERMS
+ #define ACCESSPERMS           (S_IRWXU | S_IRWXG | S_IRWXO)
+ #endif
+ #ifdef __ANDROID__
+@@ -60,7 +60,6 @@
+  */
+ #define NO_SETMNTENT
+ #define NO_ENDMNTENT
+-#define ACCESSPERMS           (S_IRWXU | S_IRWXG | S_IRWXO)
+ #endif
+ 
+ 
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
new file mode 100644
index 000000000..5adf9b0f9
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -0,0 +1,144 @@
+From 6cc1c22cc30320f56da552a76bd956db8f255b6a Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 10:05:07 +0000
+Subject: [PATCH 07/11] Use configure to test for feature instead of platform
+
+Test for various functions instead of trying to keep track of what
+platform and what version of the given platform has support for what.
+
+This should make it easier to port to currently unknown platforms and
+will solve the issue if a platform add support for a missing feature in
+the future.
+
+The features we test for are:
+- getifaddrs
+- getauxval
+- issetugid
+- __secure_getenv
+
+This is needed for musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+ open-vm-tools/configure.ac               |  4 ++++
+ open-vm-tools/lib/misc/idLinux.c         | 30 ++++++++++++++----------------
+ open-vm-tools/lib/nicInfo/nicInfoPosix.c |  8 ++++++--
+ 3 files changed, 24 insertions(+), 18 deletions(-)
+
+Index: open-vm-tools/configure.ac
+===================================================================
+--- open-vm-tools.orig/configure.ac
++++ open-vm-tools/configure.ac
+@@ -798,6 +798,7 @@ AC_CHECK_FUNCS(
+ 
+ AC_CHECK_FUNCS([ecvt])
+ AC_CHECK_FUNCS([fcvt])
++AC_CHECK_FUNCS([getifaddrs getauxval issetugid __secure_getenv])
+ 
+ AC_CHECK_FUNC([mkdtemp], [have_mkdtemp=yes])
+ 
+@@ -1063,10 +1064,13 @@ AC_PATH_PROG(
+ ###
+ 
+ AC_CHECK_HEADERS([crypt.h])
++AC_CHECK_HEADERS([ifaddrs.h])
+ AC_CHECK_HEADERS([inttypes.h])
+ AC_CHECK_HEADERS([stdint.h])
+ AC_CHECK_HEADERS([stdlib.h])
+ AC_CHECK_HEADERS([wchar.h])
++AC_CHECK_HEADERS([net/if.h])
++AC_CHECK_HEADERS([sys/auxv.h])
+ AC_CHECK_HEADERS([sys/inttypes.h])
+ AC_CHECK_HEADERS([sys/io.h])
+ AC_CHECK_HEADERS([sys/param.h]) # Required to make the sys/user.h check work correctly on FreeBSD
+Index: open-vm-tools/lib/misc/idLinux.c
+===================================================================
+--- open-vm-tools.orig/lib/misc/idLinux.c
++++ open-vm-tools/lib/misc/idLinux.c
+@@ -27,12 +27,9 @@
+ #include <sys/syscall.h>
+ #include <string.h>
+ #include <unistd.h>
+-#ifdef __linux__
+-#if defined(__GLIBC__) && \
+-           (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
++#ifdef HAVE_SYS_AUXV_H
+ #include <sys/auxv.h>
+ #endif
+-#endif
+ #ifdef __APPLE__
+ #include <sys/socket.h>
+ #include <TargetConditionals.h>
+@@ -997,31 +994,32 @@ Id_EndSuperUser(uid_t uid)  // IN:
+ static Bool
+ IdIsSetUGid(void)
+ {
+-#if defined(__ANDROID__)
+-   /* Android does not have a secure_getenv, so be conservative. */
+-   return TRUE;
+-#else
+    /*
+     * We use __secure_getenv, which returns NULL if the binary is
+-    * setuid or setgid. Alternatives include,
++    * setuid or setgid, when issetugid or getauxval(AT_SECURE) is not
++    * available. Alternatives include,
+     *
+-    *   a) getauxval(AT_SECURE); not available until glibc 2.16.
+-    *   b) __libc_enable_secure; may not be exported.
++    *   a) issetugid(); not (yet?) available in glibc.
++    *   b) getauxval(AT_SECURE); not available until glibc 2.16.
++    *   c) __libc_enable_secure; may not be exported.
+     *
+-    * Use (a) when we are based on glibc 2.16, or newer.
++    * Use (b) when we are based on glibc 2.16, or newer.
+     */
+ 
+-#if defined(__GLIBC__) && \
+-           (__GLIBC__ > 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 16))
++#if HAVE_ISSETUGID
++   return issetugid();
++#elif HAVE_GETAUXVAL
+    return getauxval(AT_SECURE) != 0;
+-#else
++#elif HAVE___SECURE_GETENV
+    static const char envName[] = "VMW_SETUGID_TEST";
+ 
+    if (setenv(envName, "1", TRUE) == -1) {
+       return TRUE; /* Conservative */
+    }
+    return __secure_getenv(envName) == NULL;
+-#endif
++#else
++   /* Android does not have a secure_getenv, so be conservative. */
++   return TRUE;
+ #endif
+ }
+ #endif
+Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
+===================================================================
+--- open-vm-tools.orig/lib/nicInfo/nicInfoPosix.c
++++ open-vm-tools/lib/nicInfo/nicInfoPosix.c
+@@ -34,9 +34,13 @@
+ #include <sys/socket.h>
+ #include <sys/stat.h>
+ #include <errno.h>
+-#if defined(__FreeBSD__) || defined(__APPLE__)
++#if HAVE_SYS_SYSCTL_H
+ # include <sys/sysctl.h>
++#endif
++#if HAVE_IFADDRS_H
+ # include <ifaddrs.h>
++#endif
++#if HAVE_NET_IF_H
+ # include <net/if.h>
+ #endif
+ #ifndef NO_DNET
+@@ -348,7 +352,7 @@ GuestInfoGetNicInfo(NicInfoV3 *nicInfo)
+  *
+  ******************************************************************************
+  */
+-#if defined(__FreeBSD__) || defined(__APPLE__) || defined(USERWORLD)
++#if defined(NO_DNET) && defined(HAVE_GETIFADDRS)
+ 
+ char *
+ GuestInfoGetPrimaryIP(void)
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-use-posix-strerror_r-unless-gnu.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-use-posix-strerror_r-unless-gnu.patch
new file mode 100644
index 000000000..3d1291c9f
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-use-posix-strerror_r-unless-gnu.patch
@@ -0,0 +1,30 @@
+From d4d1e7146ca2698089f6bd532f2fb8b9c1134ca7 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Mon, 2 Jan 2017 14:39:27 +0000
+Subject: [PATCH 08/11] use posix strerror_r unless gnu
+
+---
+ open-vm-tools/lib/err/errPosix.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+Index: open-vm-tools/lib/err/errPosix.c
+===================================================================
+--- open-vm-tools.orig/lib/err/errPosix.c
++++ open-vm-tools/lib/err/errPosix.c
+@@ -63,11 +63,13 @@ ErrErrno2String(Err_Number errorNumber,
+ {
+    char *p;
+ 
+-#if defined(linux) && !defined(N_PLAT_NLM) && !defined(__ANDROID__)
++#if defined(__GLIBC__)
+    p = strerror_r(errorNumber, buf, bufSize);
+ #else
+-   p = strerror(errorNumber);
+-#endif
++   if (strerror_r(errorNumber, buf, bufSize) != 0)
++      snprintf(buf, bufSize, "unknown error %i", errorNumber);
++   p = buf;
++#endif /* defined __GLIBC__ */
+    ASSERT(p != NULL);
+    return p;
+ }
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Add-support-for-building-with-system-libtirpc.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Add-support-for-building-with-system-libtirpc.patch
new file mode 100644
index 000000000..2bee5ac82
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Add-support-for-building-with-system-libtirpc.patch
@@ -0,0 +1,342 @@
+From 5ae6c662fefa621f4600559e299a7d97c2254e69 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Sun, 16 Jul 2017 10:20:10 -0700
+Subject: [PATCH 1/3] Add support for building with system libtirpc
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ open-vm-tools/configure.ac                               | 14 ++++++++++++++
+ open-vm-tools/lib/dynxdr/Makefile.am                     |  8 ++++++--
+ open-vm-tools/lib/err/errPosix.c                         |  1 +
+ open-vm-tools/lib/guestRpc/Makefile.am                   |  6 ++++++
+ open-vm-tools/lib/misc/Makefile.am                       |  1 +
+ open-vm-tools/lib/netUtil/Makefile.am                    |  4 ++++
+ open-vm-tools/lib/nicInfo/Makefile.am                    |  2 ++
+ open-vm-tools/lib/rpcChannel/Makefile.am                 |  4 ++++
+ open-vm-tools/lib/slashProc/Makefile.am                  |  4 ++++
+ open-vm-tools/lib/string/bsd_output_shared.c             |  2 +-
+ open-vm-tools/libguestlib/Makefile.am                    |  2 ++
+ open-vm-tools/rpctool/Makefile.am                        |  3 +++
+ open-vm-tools/rpctool/rpctool.c                          |  2 ++
+ open-vm-tools/services/plugins/dndcp/Makefile.am         |  2 ++
+ open-vm-tools/services/plugins/guestInfo/Makefile.am     |  1 +
+ open-vm-tools/services/plugins/resolutionSet/Makefile.am |  2 ++
+ open-vm-tools/services/plugins/vix/Makefile.am           |  2 ++
+ open-vm-tools/services/plugins/vmbackup/Makefile.am      |  2 ++
+ open-vm-tools/toolbox/Makefile.am                        |  2 ++
+ 19 files changed, 61 insertions(+), 3 deletions(-)
+
+Index: open-vm-tools/configure.ac
+===================================================================
+--- open-vm-tools.orig/configure.ac
++++ open-vm-tools/configure.ac
+@@ -405,6 +405,20 @@ AC_VMW_CHECK_LIB([fuse],
+                   AC_MSG_WARN([Fuse is missing, vmblock-fuse/vmhgfs-fuse will be disabled.])])
+ 
+ #
++# Check for libtirpc
++#
++AC_VMW_CHECK_LIB([libtirpc],
++                 [LIBTIRPC],
++                 [libtirpc],
++                 [],
++                 [],
++                 [rpc/xdr.h],
++                 [xdr_void],
++                 [have_libtirpc=yes],
++                 [have_libtitirpc=no;
++                  AC_MSG_WARN([libtirpc is missing.])])
++
++#
+ # Check for PAM.
+ #
+ AC_ARG_WITH([pam],
+Index: open-vm-tools/lib/dynxdr/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/dynxdr/Makefile.am
++++ open-vm-tools/lib/dynxdr/Makefile.am
+@@ -17,7 +17,11 @@
+ 
+ noinst_LTLIBRARIES = libDynxdr.la
+ 
+-libDynxdr_la_SOURCES = 
++libDynxdr_la_SOURCES =
+ libDynxdr_la_SOURCES += dynxdr.c
+ libDynxdr_la_SOURCES += xdrutil.c
+-libDynxdr_la_CPPFLAGS = -Wno-incompatible-pointer-types
++libDynxdr_la_CPPFLAGS = @LIBTIRPC_CPPFLAGS@ -Wno-incompatible-pointer-types
++
++libDynxdr_la_LIBADD =
++libDynxdr_la_LIBADD += @LIBTIRPC_LIBS@
++
+Index: open-vm-tools/lib/err/errPosix.c
+===================================================================
+--- open-vm-tools.orig/lib/err/errPosix.c
++++ open-vm-tools/lib/err/errPosix.c
+@@ -31,6 +31,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <locale.h>
++#include <stdio.h>
+ 
+ #include "vmware.h"
+ #include "errInt.h"
+Index: open-vm-tools/lib/guestRpc/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/guestRpc/Makefile.am
++++ open-vm-tools/lib/guestRpc/Makefile.am
+@@ -20,6 +20,12 @@ noinst_LTLIBRARIES = libGuestRpc.la
+ libGuestRpc_la_SOURCES =
+ libGuestRpc_la_SOURCES += nicinfo_xdr.c
+ 
++libGuestRpc_la_CPPFLAGS =
++libGuestRpc_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
++
++libGuestRpc_la_LIBADD =
++libGuestRpc_la_LIBADD += @LIBTIRPC_LIBS@
++
+ # XXX: Autoreconf complains about this and recommends using AM_CFLAGS instead.
+ # Problem is, $(CFLAGS) is appended to the compiler command line after AM_CFLAGS
+ # and after libGuestRpc_la_CFLAGS, so "-Wall -Werror" will override this flag.
+Index: open-vm-tools/lib/misc/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/misc/Makefile.am
++++ open-vm-tools/lib/misc/Makefile.am
+@@ -52,4 +52,5 @@ libMisc_la_SOURCES += utilMem.c
+ libMisc_la_SOURCES += vmstdio.c
+ libMisc_la_SOURCES += strutil.c
+ libMisc_la_SOURCES += vthreadBase.c
++libMisc_la_CPPFLAGS = -Wno-error=int-conversion
+ 
+Index: open-vm-tools/lib/netUtil/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/netUtil/Makefile.am
++++ open-vm-tools/lib/netUtil/Makefile.am
+@@ -20,3 +20,7 @@ noinst_LTLIBRARIES = libNetUtil.la
+ libNetUtil_la_SOURCES =
+ libNetUtil_la_SOURCES += netUtilLinux.c
+ 
++libNetUtil_la_CPPFLAGS =
++libNetUtil_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
++
++libNetUtil_la_LIBADD = @LIBTIRPC_LIBS@
+Index: open-vm-tools/lib/nicInfo/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/nicInfo/Makefile.am
++++ open-vm-tools/lib/nicInfo/Makefile.am
+@@ -25,12 +25,14 @@ libNicInfo_la_SOURCES += nicInfoPosix.c
+ 
+ libNicInfo_la_CPPFLAGS =
+ libNicInfo_la_CPPFLAGS += @GLIB2_CPPFLAGS@
++libNicInfo_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
+ 
+ AM_CFLAGS = $(DNET_CPPFLAGS)
+ if USE_SLASH_PROC
+ AM_CFLAGS += -DUSE_SLASH_PROC
+ endif
+ libNicInfo_la_LIBADD =
++libNicInfo_la_LIBADD += @LIBTIRPC_LIBS@
+ if HAVE_DNET
+    libNicInfo_la_LIBADD += @DNET_LIBS@
+ endif
+Index: open-vm-tools/lib/rpcChannel/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/rpcChannel/Makefile.am
++++ open-vm-tools/lib/rpcChannel/Makefile.am
+@@ -27,3 +27,7 @@ endif
+ 
+ libRpcChannel_la_CPPFLAGS =
+ libRpcChannel_la_CPPFLAGS += @VMTOOLS_CPPFLAGS@
++libRpcChannel_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
++
++libRpcChannel_la_LIBADD =
++libRpcChannel_la_LIBADD += @LIBTIRPC_LIBS@
+Index: open-vm-tools/lib/slashProc/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/slashProc/Makefile.am
++++ open-vm-tools/lib/slashProc/Makefile.am
+@@ -22,6 +22,10 @@ libSlashProc_la_SOURCES += net.c
+ 
+ libSlashProc_la_CPPFLAGS =
+ libSlashProc_la_CPPFLAGS += @GLIB2_CPPFLAGS@
++libSlashProc_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
++
++libSlashProc_la_LIBADD =
++libSlashProc_la_LIBADD += @LIBTIRPC_LIBS@
+ 
+ AM_CFLAGS = $(DNET_CPPFLAGS)
+ 
+Index: open-vm-tools/lib/string/bsd_output_shared.c
+===================================================================
+--- open-vm-tools.orig/lib/string/bsd_output_shared.c
++++ open-vm-tools/lib/string/bsd_output_shared.c
+@@ -38,7 +38,7 @@
+ //#include <sys/cdefs.h>
+ 
+ #if !defined(STR_NO_WIN32_LIBS) && !defined(__FreeBSD__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__ANDROID__)
+-
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #ifndef _WIN32
+Index: open-vm-tools/libguestlib/Makefile.am
+===================================================================
+--- open-vm-tools.orig/libguestlib/Makefile.am
++++ open-vm-tools/libguestlib/Makefile.am
+@@ -22,6 +22,7 @@ AM_CFLAGS += -I$(top_srcdir)/include
+ 
+ libguestlib_la_LIBADD =
+ libguestlib_la_LIBADD += @VMTOOLS_LIBS@
++libguestlib_la_LIBADD += @LIBTIRPC_LIBS@
+ 
+ libguestlib_la_SOURCES =
+ libguestlib_la_SOURCES += guestlibV3_xdr.c
+@@ -56,6 +57,7 @@ CFLAGS += -Wno-unused
+ libguestlib_la_CPPFLAGS =
+ libguestlib_la_CPPFLAGS += -DVMTOOLS_USE_GLIB
+ libguestlib_la_CPPFLAGS += @GLIB2_CPPFLAGS@
++libguestlib_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
+ 
+ EXTRA_DIST = vmguestlib.pc.in
+ 
+Index: open-vm-tools/rpctool/Makefile.am
+===================================================================
+--- open-vm-tools.orig/rpctool/Makefile.am
++++ open-vm-tools/rpctool/Makefile.am
+@@ -17,10 +17,13 @@
+ 
+ bin_PROGRAMS = vmware-rpctool
+ 
++vmware_rpctool_CFLAGS= @LIBTIRPC_LIBS@
++
+ vmware_rpctool_SOURCES =
+ vmware_rpctool_SOURCES += rpctool.c
+ 
+ vmware_rpctool_LDADD =
++vmware_rpctool_LDADD += @LIBTIRPC_LIBS@
+ vmware_rpctool_LDADD += ../lib/rpcOut/libRpcOut.la
+ vmware_rpctool_LDADD += ../lib/message/libMessage.la
+ vmware_rpctool_LDADD += ../lib/backdoor/libBackdoor.la
+Index: open-vm-tools/rpctool/rpctool.c
+===================================================================
+--- open-vm-tools.orig/rpctool/rpctool.c
++++ open-vm-tools/rpctool/rpctool.c
+@@ -23,6 +23,8 @@
+  */
+ 
+ #ifndef _WIN32
++#define _GNU_SOURCE
++#include <signal.h>
+ #include "sigPosixRegs.h"
+ #include <errno.h>
+ #include <stdint.h>
+Index: open-vm-tools/services/plugins/dndcp/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/dndcp/Makefile.am
++++ open-vm-tools/services/plugins/dndcp/Makefile.am
+@@ -23,6 +23,7 @@ plugin_LTLIBRARIES = libdndcp.la
+ libdndcp_la_CPPFLAGS =
+ libdndcp_la_CPPFLAGS += @GTK_CPPFLAGS@
+ libdndcp_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
++libdndcp_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
+ libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/dnd
+ libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/dndGuest
+ libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/stringxx
+@@ -44,6 +45,7 @@ libdndcp_la_LIBADD += @GTK_LIBS@
+ libdndcp_la_LIBADD += @GTKMM_LIBS@
+ libdndcp_la_LIBADD += @VMTOOLS_LIBS@
+ libdndcp_la_LIBADD += @HGFS_LIBS@
++libdndcp_la_LIBADD += @LIBTIRPC_LIBS@
+ libdndcp_la_LIBADD += $(top_builddir)/lib/hgfsUri/hgfsUriPosix.lo
+ 
+ libdndcp_la_SOURCES =
+Index: open-vm-tools/services/plugins/guestInfo/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/guestInfo/Makefile.am
++++ open-vm-tools/services/plugins/guestInfo/Makefile.am
+@@ -22,6 +22,7 @@ plugin_LTLIBRARIES = libguestInfo.la
+ 
+ libguestInfo_la_CPPFLAGS =
+ libguestInfo_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
++libguestInfo_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
+ 
+ libguestInfo_la_LDFLAGS =
+ libguestInfo_la_LDFLAGS += @PLUGIN_LDFLAGS@
+Index: open-vm-tools/services/plugins/resolutionSet/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/resolutionSet/Makefile.am
++++ open-vm-tools/services/plugins/resolutionSet/Makefile.am
+@@ -21,6 +21,7 @@ plugin_LTLIBRARIES = libresolutionSet.la
+ libresolutionSet_la_CPPFLAGS =
+ libresolutionSet_la_CPPFLAGS += @GTK_CPPFLAGS@
+ libresolutionSet_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
++libresolutionSet_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
+ libresolutionSet_la_CPPFLAGS += -DRESOLUTION_X11
+ 
+ libresolutionSet_la_LDFLAGS =
+@@ -30,6 +31,7 @@ libresolutionSet_la_LIBADD =
+ libresolutionSet_la_LIBADD += @COMMON_XLIBS@
+ libresolutionSet_la_LIBADD += @GTK_LIBS@
+ libresolutionSet_la_LIBADD += @VMTOOLS_LIBS@
++libresolutionSet_la_LIBADD += @LIBTIRPC_LIBS@
+ 
+ libresolutionSet_la_SOURCES =
+ libresolutionSet_la_SOURCES += libvmwarectrl.c
+Index: open-vm-tools/services/plugins/vix/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/vix/Makefile.am
++++ open-vm-tools/services/plugins/vix/Makefile.am
+@@ -20,6 +20,7 @@ plugin_LTLIBRARIES = libvix.la
+ 
+ libvix_la_CPPFLAGS =
+ libvix_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
++libvix_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
+ libvix_la_CPPFLAGS += -I$(top_srcdir)/vgauth/public
+ 
+ libvix_la_LDFLAGS =
+@@ -29,6 +30,7 @@ libvix_la_LIBADD =
+ libvix_la_LIBADD += @VIX_LIBADD@
+ libvix_la_LIBADD += @VMTOOLS_LIBS@
+ libvix_la_LIBADD += @HGFS_LIBS@
++libvix_la_LIBADD += @LIBTIRPC_LIBS@
+ libvix_la_LIBADD += $(top_builddir)/lib/auth/libAuth.la
+ libvix_la_LIBADD += $(top_builddir)/lib/foundryMsg/libFoundryMsg.la
+ libvix_la_LIBADD += $(top_builddir)/lib/impersonate/libImpersonate.la
+Index: open-vm-tools/services/plugins/vmbackup/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/vmbackup/Makefile.am
++++ open-vm-tools/services/plugins/vmbackup/Makefile.am
+@@ -20,6 +20,7 @@ plugin_LTLIBRARIES = libvmbackup.la
+ 
+ libvmbackup_la_CPPFLAGS =
+ libvmbackup_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
++libvmbackup_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
+ 
+ libvmbackup_la_LDFLAGS =
+ libvmbackup_la_LDFLAGS += @PLUGIN_LDFLAGS@
+@@ -27,6 +28,7 @@ libvmbackup_la_LDFLAGS += @PLUGIN_LDFLAG
+ libvmbackup_la_LIBADD =
+ libvmbackup_la_LIBADD += @GOBJECT_LIBS@
+ libvmbackup_la_LIBADD += @VMTOOLS_LIBS@
++libvmbackup_la_LIBADD += @LIBTIRPC_LIBS@
+ 
+ libvmbackup_la_SOURCES =
+ libvmbackup_la_SOURCES += nullProvider.c
+Index: open-vm-tools/toolbox/Makefile.am
+===================================================================
+--- open-vm-tools.orig/toolbox/Makefile.am
++++ open-vm-tools/toolbox/Makefile.am
+@@ -20,9 +20,11 @@ bin_PROGRAMS = vmware-toolbox-cmd
+ vmware_toolbox_cmd_LDADD =
+ vmware_toolbox_cmd_LDADD += ../libguestlib/libguestlib.la
+ vmware_toolbox_cmd_LDADD += @VMTOOLS_LIBS@
++vmware_toolbox_cmd_LDADD += @LIBTIRPC_LIBS@
+ 
+ vmware_toolbox_cmd_CPPFLAGS =
+ vmware_toolbox_cmd_CPPFLAGS += @VMTOOLS_CPPFLAGS@
++vmware_toolbox_cmd_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
+ 
+ vmware_toolbox_cmd_SOURCES =
+ vmware_toolbox_cmd_SOURCES += toolbox-cmd.c
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-gnu-ucontext.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-gnu-ucontext.patch
new file mode 100644
index 000000000..c9beac1fc
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-gnu-ucontext.patch
@@ -0,0 +1,65 @@
+From 27442e2dd287d393d7b3f8bf164a887affef84df Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 10:27:51 +0000
+Subject: [PATCH 10/11] gnu-ucontext
+
+---
+ open-vm-tools/lib/include/sigPosixRegs.h | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+Index: open-vm-tools/lib/include/sigPosixRegs.h
+===================================================================
+--- open-vm-tools.orig/lib/include/sigPosixRegs.h
++++ open-vm-tools/lib/include/sigPosixRegs.h
+@@ -33,7 +33,7 @@
+ #include "includeCheck.h"
+ 
+ 
+-#if __linux__         // We need the REG_foo offsets in the gregset_t;
++#if defined(__GLIBC__) // We need the REG_foo offsets in the gregset_t;
+ #  define _GNU_SOURCE // _GNU_SOURCE maps to __USE_GNU
+ 
+ /* And, the REG_foo definitions conflict with our own in x86.h */
+@@ -73,7 +73,7 @@
+ #include <sys/ucontext.h>
+ #endif
+ 
+-#if __linux__
++#if defined(__GLIBC__)
+ #  if defined(__x86_64__)
+ #    undef REG_RAX
+ #    undef REG_RBX
+@@ -199,7 +199,7 @@
+ #define SC_ESP(uc) ((unsigned long) (uc)->uc_mcontext.mc_esp)
+ #define SC_EIP(uc) ((unsigned long) (uc)->uc_mcontext.mc_eip)
+ #endif
+-#elif defined (sun)
++#elif !defined (__GLIBC__)
+ #ifdef __x86_64__
+ #define SC_EAX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_RAX])
+ #define SC_EBX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_RBX])
+@@ -219,15 +219,15 @@
+ #define SC_R14(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_R14])
+ #define SC_R15(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_R15])
+ #else
+-#define SC_EAX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EAX])
+-#define SC_EBX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EBX])
+-#define SC_ECX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[ECX])
+-#define SC_EDX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EDX])
+-#define SC_EDI(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EDI])
+-#define SC_ESI(uc) ((unsigned long) (uc)->uc_mcontext.gregs[ESI])
+-#define SC_EBP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EBP])
+-#define SC_ESP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[ESP])
+-#define SC_EIP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EIP])
++#define SC_EAX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EAX])
++#define SC_EBX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EBX])
++#define SC_ECX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_ECX])
++#define SC_EDX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EDX])
++#define SC_EDI(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EDI])
++#define SC_ESI(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_ESI])
++#define SC_EBP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EBP])
++#define SC_ESP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_ESP])
++#define SC_EIP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EIP])
+ #endif
+ #elif defined(ANDROID_X86)
+ #define SC_EAX(uc) ((unsigned long) (uc)->uc_mcontext.eax)
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-configure-test-for-sys-stat.h-include.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-configure-test-for-sys-stat.h-include.patch
new file mode 100644
index 000000000..78722390e
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0011-Use-configure-test-for-sys-stat.h-include.patch
@@ -0,0 +1,25 @@
+From 95c6184d9ff70a47c41768850923a96de9e544aa Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 18 Nov 2015 10:41:01 +0000
+Subject: [PATCH 11/11] Use configure test for sys/stat.h include
+
+This is needed for musl libc.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+---
+ open-vm-tools/services/plugins/vix/vixTools.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: open-vm-tools/services/plugins/vix/vixTools.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/vix/vixTools.c
++++ open-vm-tools/services/plugins/vix/vixTools.c
+@@ -66,7 +66,7 @@
+ #include <unistd.h>
+ #endif
+ 
+-#if defined(sun) || defined(__FreeBSD__) || defined(__APPLE__)
++#ifdef HAVE_SYS_STAT_H
+ #include <sys/stat.h>
+ #endif
+ 
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 65fbfc9e9..569aef79b 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -13,26 +13,39 @@ SUMMARY = "Tools to enhance VMWare guest integration and performance"
 HOMEPAGE = "https://github.com/vmware/open-vm-tools"
 SECTION = "vmware-tools"
 
-LICENSE = "LGPLv2.1 & GPLv2 & BSD & CDDLv1"
+LICENSE = "LGPL-2.0 & GPL-2.0 & BSD & CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b66ba4cb4fc017682c95efc300410e79"
 LICENSE_modules/freebsd/vmblock = "BSD"
-LICENSE_modules/freebsd/vmmemctl = "GPLv2"
-LICENSE_modules/freebsd/vmxnet = "GPLv2"
-LICENSE_modules/linux = "GPLv2"
-LICENSE_modules/solaris = "CDDLv1"
+LICENSE_modules/freebsd/vmmemctl = "GPL-2.0"
+LICENSE_modules/freebsd/vmxnet = "GPL-2.0"
+LICENSE_modules/linux = "GPL-2.0"
+LICENSE_modules/solaris = "CDDL-1.0"
 
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://tools.conf \
            file://vmtoolsd.service \
            file://0001-configure.ac-don-t-use-dnet-config.patch \
            file://0002-add-include-sys-sysmacros.h.patch \
+           file://0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch \
+           file://0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch \
+           file://0003-Rename-poll.h-to-vm_poll.h.patch \
+           file://0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch \
+           file://0005-Use-configure-test-for-struct-timespec.patch \
+           file://0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch \
+           file://0007-Use-configure-to-test-for-feature-instead-of-platfor.patch \
+           file://0008-use-posix-strerror_r-unless-gnu.patch \
+           file://0011-Use-configure-test-for-sys-stat.h-include.patch \
+           "
+SRC_URI_append_libc-musl = "\
+           file://0009-Add-support-for-building-with-system-libtirpc.patch \
+           file://0010-gnu-ucontext.patch \
            "
-
 SRCREV = "854c0bb374612f7e633b448ca273f970f154458b"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
 DEPENDS = "glib-2.0 glib-2.0-native util-linux libdnet procps"
+DEPENDS_append_libc-musl = " libtirpc"
 
 # open-vm-tools is supported only on x86.
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
-- 
2.13.3


