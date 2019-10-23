Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id D302B7F638
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 12:34:00 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d22so10024853pll.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J9x6FhFcfMxIDUoy/CCyhOlWso3Iw/ZgW/+8OMvI/ow=;
	b=kTaweyfYJLZThydP/+5NqwYM+DuVXm5q4tuG8HVvsjEnc/qH6KlWfSSDNXgTUjLg39
	caM9mG3yhQvhAYHcOK0Lf4qjRlR1hm1Z4aDhLfpnV/5gZOKuJVioTkycN9SktvUOLm92
	4XkuwW6JO8fVVybr+J0EloKcwTJFO0yRv3HVXkJklQfkjJV8AG91i4pJrquIkQypcrPA
	rhcUt5VVHJeZOlO9acFyDERJsRbXoTESOmnjYgnxs515WBQ+5yI3N6lOILeBGp83XCJI
	tiGg5hegUtNWAj86/lSutJgN+6fP+xZXW6dY8fRq5ElqYwlQ6CFlNvD5jM3+o/RTjzp3
	SiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J9x6FhFcfMxIDUoy/CCyhOlWso3Iw/ZgW/+8OMvI/ow=;
	b=H9hV/Zk/rHkp/ICN+oUVYseH47ezjPtNDuXf0iLQML6IAn4hWPTdRIEHhFOgTZPMOR
	EczZAAd2IzFYR5c//bEHtPl/nkrHXGKesPErxVGzOd66y/cJdjlLXWnE8c/gKIbl0x5q
	tIQDBNjrr4hTOtkYFQPpXThoZkHbNljhikTf7MSH/vx5qed9j6svvclXMuC4TfBpxqFi
	sdor2yPISSh9ThtialLaOgrbKCqttEyGr/09oQpe8vyrBOGhUM3BpR8YTIRAe/P+MpQX
	cycYFiiriAlHk/C0x1v1tBWrUzOjkWMc/yMx9K3/0gLz4Lip8n7H49IfeYg4S0XBdL/y
	v3ww==
X-Gm-Message-State: APjAAAXVaUlS3P//bxX0LPaGJE4b47IStiMPeWx2I1Kvxp4VjC/ZoDz6
	BtBye55imIo3u2QrFzfGy+b4GhncwznLcQ==
X-Google-Smtp-Source: APXvYqwRgIAG0bo7SZobgMxFe5HafKqLiP4Qf0c3lqNKMNlOI/r4GTgYTnHs5P5fCu1o0+61ew4mqw==
X-Received: by 2002:a17:902:b193:: with SMTP id
	s19mr2515033plr.298.1571834038352; 
	Wed, 23 Oct 2019 05:33:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::e34d])
	by smtp.gmail.com with ESMTPSA id
	g24sm24085273pfi.81.2019.10.23.05.33.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 05:33:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 05:33:45 -0700
Message-Id: <20191023123345.2588584-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] open-vm-tools: Upgrade to 11.0.1
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
X-List-Received-Date: Wed, 23 Oct 2019 12:34:01 -0000
Content-Transfer-Encoding: 8bit

Drop backported patch available in 11.0 release
--disable-grabbitmqproxy is no longer a supported option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-configure.ac-don-t-use-dnet-config.patch |    8 +-
 .../0009-Rename-poll.h-to-vm_poll.h.patch     |  699 ++++++++-
 ...c-Do-not-print-NULL-string-into-logs.patch |   10 +-
 .../0014-Fix-new-warnings-from-gcc9.patch     | 1281 -----------------
 ...ools_10.3.5.bb => open-vm-tools_11.0.1.bb} |    6 +-
 5 files changed, 671 insertions(+), 1333 deletions(-)
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0014-Fix-new-warnings-from-gcc9.patch
 rename meta-oe/recipes-support/open-vm-tools/{open-vm-tools_10.3.5.bb => open-vm-tools_11.0.1.bb} (95%)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
index 0736572b3e..a711f5e5d2 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
@@ -14,11 +14,9 @@ Signed-off-by: Martin Kelly <mkelly@xevo.com>
  open-vm-tools/configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/open-vm-tools/configure.ac b/open-vm-tools/configure.ac
-index 325a39f5..713ea683 100644
 --- a/open-vm-tools/configure.ac
 +++ b/open-vm-tools/configure.ac
-@@ -949,7 +949,7 @@ if test "$with_dnet" = "yes"; then
+@@ -937,7 +937,7 @@ if test "$with_dnet" = "yes"; then
        AC_VMW_CHECK_LIB([dnet],
                         [DNET],
                         [],
@@ -27,11 +25,11 @@ index 325a39f5..713ea683 100644
                         [],
                         [dnet.h],
                         [intf_open],
-@@ -959,7 +959,7 @@ if test "$with_dnet" = "yes"; then
+@@ -947,7 +947,7 @@ if test "$with_dnet" = "yes"; then
  
     if test $have_dnet = "no"; then
  		AC_MSG_ERROR(
--		   [dnet-config was not found on your PATH. Please configure without dnet (using --without-dnet) or install dnet - http://libdnet.sourceforge.net])
+-		   [dnet-config was not found on your PATH. Please configure without dnet or install dnet - http://libdnet.sourceforge.net])
 +		   [dnet was not found. Please configure without dnet (using --without-dnet) or install dnet - http://libdnet.sourceforge.net])
     fi
  fi
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
index 5c1aa7c40f..9cf54f6f44 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Rename-poll.h-to-vm_poll.h.patch
@@ -19,8 +19,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  7 files changed, 7 insertions(+), 7 deletions(-)
  rename open-vm-tools/lib/include/{poll.h => vm_poll.h} (99%)
 
-diff --git a/open-vm-tools/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
-index b41aa29d..8691309d 100644
 --- a/open-vm-tools/lib/asyncsocket/asyncsocket.c
 +++ b/open-vm-tools/lib/asyncsocket/asyncsocket.c
 @@ -86,7 +86,7 @@
@@ -32,8 +30,6 @@ index b41aa29d..8691309d 100644
  #include "log.h"
  #include "err.h"
  #include "hostinfo.h"
-diff --git a/open-vm-tools/lib/hgfsServer/hgfsServer.c b/open-vm-tools/lib/hgfsServer/hgfsServer.c
-index 7ea3b7f4..740c4fed 100644
 --- a/open-vm-tools/lib/hgfsServer/hgfsServer.c
 +++ b/open-vm-tools/lib/hgfsServer/hgfsServer.c
 @@ -48,7 +48,7 @@
@@ -45,8 +41,6 @@ index 7ea3b7f4..740c4fed 100644
  #include "mutexRankLib.h"
  #include "vm_basic_asm.h"
  #include "unicodeOperations.h"
-diff --git a/open-vm-tools/lib/include/asyncsocket.h b/open-vm-tools/lib/include/asyncsocket.h
-index ec9b45aa..dc91e738 100644
 --- a/open-vm-tools/lib/include/asyncsocket.h
 +++ b/open-vm-tools/lib/include/asyncsocket.h
 @@ -164,7 +164,7 @@ typedef struct AsyncSocket AsyncSocket;
@@ -58,8 +52,6 @@ index ec9b45aa..dc91e738 100644
  struct IVmdbPoll;
  typedef struct AsyncSocketPollParams {
     int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
-diff --git a/open-vm-tools/lib/include/pollImpl.h b/open-vm-tools/lib/include/pollImpl.h
-index 46442e55..8bc66997 100644
 --- a/open-vm-tools/lib/include/pollImpl.h
 +++ b/open-vm-tools/lib/include/pollImpl.h
 @@ -44,7 +44,7 @@
@@ -71,24 +63,672 @@ index 46442e55..8bc66997 100644
  #include "vm_basic_asm.h"
  
  #if defined(__cplusplus)
-diff --git a/open-vm-tools/lib/include/poll.h b/open-vm-tools/lib/include/vm_poll.h
-similarity index 99%
-rename from open-vm-tools/lib/include/poll.h
-rename to open-vm-tools/lib/include/vm_poll.h
-index 6acd4f35..fbc88494 100644
 --- a/open-vm-tools/lib/include/poll.h
-+++ b/open-vm-tools/lib/include/vm_poll.h
-@@ -60,7 +60,7 @@ extern "C" {
- #if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
- #include <sys/kernel.h>
- #endif
++++ /dev/null
+@@ -1,330 +0,0 @@
+-/*********************************************************
+- * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
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
+-#if defined(__cplusplus)
+-extern "C" {
+-#endif
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
 -#include <sys/poll.h>
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
+-   POLL_DEFAULT_FIXED_CLASSES,
+-   /* Size enum to maximum */
+-   POLL_MAX_CLASSES = 31,
+-} PollClass;
+-
+-/*
+- * Do not use; Special pseudo private poll class supported by
+- * PollDefault only
+- */
+-#define POLL_DEFAULT_CLASS_NET POLL_FIXED_CLASSES
+-#define POLL_DEFAULT_CS_NET    PollClassSet_Singleton(POLL_DEFAULT_CLASS_NET)
+-
+-/*
+- * Each callback is registered in a set of classes
+- */
+-
+-typedef struct PollClassSet {
+-   uintptr_t bits;
+-} PollClassSet;
+-
+-/* An empty PollClassSet. */
+-static INLINE PollClassSet
+-PollClassSet_Empty(void)
+-{
+-   PollClassSet set = { 0 };
+-   return set;
+-}
+-
+-/* A PollClassSet with the single member. */
+-static INLINE PollClassSet
+-PollClassSet_Singleton(PollClass c)
+-{
+-   PollClassSet s = PollClassSet_Empty();
+-
+-   ASSERT_ON_COMPILE(POLL_MAX_CLASSES < sizeof s.bits * 8);
+-   ASSERT(c < POLL_MAX_CLASSES);
+-
+-   s.bits = CONST3264U(1) << c;
+-   return s;
+-}
+-
+-/* Combine two PollClassSets. */
+-static INLINE PollClassSet
+-PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
+-{
+-   PollClassSet set;
+-   set.bits = lhs.bits | rhs.bits;
+-   return set;
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
+- * The exception to this rule is POLL_DEVICE callbacks: there is a maximum of
+- * one read and one write callback per fd.
+- *
+- * Poll_CallbackRemove removes one callback. If there are multiple identical
+- * callbacks, which one is removed is an implementation detail. Note that in
+- * the case of POLL_DEVICE and POLL_REALTIME callbacks, the fd/delay used to
+- * create the callback is not specified when removing, so all callbacks
+- * of those types with the same flags, function, and clientData are considered
+- * "identical" even if their fd/delay differed.
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
+-                           int64 delay,   // microseconds
+-                           Bool periodic,
+-                           MXUserRecLock *lock);
+-
+-Bool Poll_CB_RTimeRemove(PollerFunction f,
+-                         void *clientData,
+-                         Bool periodic);
+-
+-
+-#ifdef _WIN32
+-void Poll_SetPumpsWindowsMessages(Bool pumps);
+-void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
+-Bool Poll_FireWndCallback(void *lparam);
+-#endif
+-
+-#if defined(__cplusplus)
+-}  // extern "C"
+-#endif
+-
+-#endif // _POLL_H_
+--- /dev/null
++++ b/open-vm-tools/lib/include/vm_poll.h
+@@ -0,0 +1,330 @@
++/*********************************************************
++ * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
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
++#if defined(__cplusplus)
++extern "C" {
++#endif
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
 +#include <poll.h>
- #define HZ 100
- #endif
- #ifdef __ANDROID__
-diff --git a/open-vm-tools/lib/rpcIn/rpcin.c b/open-vm-tools/lib/rpcIn/rpcin.c
-index 8eea7d86..c48f5be2 100644
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
++   POLL_DEFAULT_FIXED_CLASSES,
++   /* Size enum to maximum */
++   POLL_MAX_CLASSES = 31,
++} PollClass;
++
++/*
++ * Do not use; Special pseudo private poll class supported by
++ * PollDefault only
++ */
++#define POLL_DEFAULT_CLASS_NET POLL_FIXED_CLASSES
++#define POLL_DEFAULT_CS_NET    PollClassSet_Singleton(POLL_DEFAULT_CLASS_NET)
++
++/*
++ * Each callback is registered in a set of classes
++ */
++
++typedef struct PollClassSet {
++   uintptr_t bits;
++} PollClassSet;
++
++/* An empty PollClassSet. */
++static INLINE PollClassSet
++PollClassSet_Empty(void)
++{
++   PollClassSet set = { 0 };
++   return set;
++}
++
++/* A PollClassSet with the single member. */
++static INLINE PollClassSet
++PollClassSet_Singleton(PollClass c)
++{
++   PollClassSet s = PollClassSet_Empty();
++
++   ASSERT_ON_COMPILE(POLL_MAX_CLASSES < sizeof s.bits * 8);
++   ASSERT(c < POLL_MAX_CLASSES);
++
++   s.bits = CONST3264U(1) << c;
++   return s;
++}
++
++/* Combine two PollClassSets. */
++static INLINE PollClassSet
++PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
++{
++   PollClassSet set;
++   set.bits = lhs.bits | rhs.bits;
++   return set;
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
++ * The exception to this rule is POLL_DEVICE callbacks: there is a maximum of
++ * one read and one write callback per fd.
++ *
++ * Poll_CallbackRemove removes one callback. If there are multiple identical
++ * callbacks, which one is removed is an implementation detail. Note that in
++ * the case of POLL_DEVICE and POLL_REALTIME callbacks, the fd/delay used to
++ * create the callback is not specified when removing, so all callbacks
++ * of those types with the same flags, function, and clientData are considered
++ * "identical" even if their fd/delay differed.
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
++                           int64 delay,   // microseconds
++                           Bool periodic,
++                           MXUserRecLock *lock);
++
++Bool Poll_CB_RTimeRemove(PollerFunction f,
++                         void *clientData,
++                         Bool periodic);
++
++
++#ifdef _WIN32
++void Poll_SetPumpsWindowsMessages(Bool pumps);
++void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
++Bool Poll_FireWndCallback(void *lparam);
++#endif
++
++#if defined(__cplusplus)
++}  // extern "C"
++#endif
++
++#endif // _POLL_H_
 --- a/open-vm-tools/lib/rpcIn/rpcin.c
 +++ b/open-vm-tools/lib/rpcIn/rpcin.c
 @@ -57,7 +57,7 @@
@@ -100,16 +740,3 @@ index 8eea7d86..c48f5be2 100644
  #  include "asyncsocket.h"
  #  include "vmci_defs.h"
  #include "dataMap.h"
-diff --git a/open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c b/open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
-index 03700937..f0b49ad7 100644
---- a/open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
-+++ b/open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
-@@ -48,7 +48,7 @@
- #include "rpcout.h"
- #include "rabbitmqProxyConst.h"
- #include "vm_basic_types.h"
--#include "poll.h"
-+#include "vm_poll.h"
- #ifdef OPEN_VM_TOOLS
- #include "vmci_sockets.h"
- #include "sslDirect.h"
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
index 88f4f694c9..3e4753b2a6 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0013-misc-Do-not-print-NULL-string-into-logs.patch
@@ -14,18 +14,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  open-vm-tools/lib/misc/util_misc.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/open-vm-tools/lib/misc/util_misc.c b/open-vm-tools/lib/misc/util_misc.c
-index 198c23d2..0ac0a335 100644
 --- a/open-vm-tools/lib/misc/util_misc.c
 +++ b/open-vm-tools/lib/misc/util_misc.c
-@@ -719,8 +719,8 @@ Util_ExpandString(const char *fileName) // IN  file path to expand
+@@ -719,7 +719,7 @@ Util_ExpandString(const char *fileName)
        ASSERT(!freeChunk[i]);
        chunks[i] = expand;
        if (chunks[i] == NULL) {
--	 Log("%s: Cannot allocate memory to expand \"%s\" in \"%s\".\n",
--             __FUNCTION__, expand, fileName);
+-	 Log("%s: Cannot allocate memory to expand $ in \"%s\".\n",
 +	 Log("%s: Cannot allocate memory to expand in \"%s\".\n",
-+             __FUNCTION__, fileName);
+              __FUNCTION__, fileName);
  	 goto out;
        }
-       chunkSize[i] = strlen(expand);
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0014-Fix-new-warnings-from-gcc9.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0014-Fix-new-warnings-from-gcc9.patch
deleted file mode 100644
index b5ccffd141..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0014-Fix-new-warnings-from-gcc9.patch
+++ /dev/null
@@ -1,1281 +0,0 @@
-From af9eca8689c97ea8e792902b458a31608286655e Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@lge.com>
-Date: Thu, 13 Jun 2019 16:01:03 +0000
-Subject: [PATCH] Fix new warnings from gcc9
-
-Imported from Fedora:
-https://src.fedoraproject.org/rpms/open-vm-tools/raw/master/f/gcc9-warnings.patch
-
-Upstream bug:
-https://github.com/vmware/open-vm-tools/issues/330
-
-Upstream-Status: Pending
----
- open-vm-tools/hgfsmounter/hgfsmounter.c   |  14 +-
- open-vm-tools/lib/hgfsServer/hgfsServer.c |  24 ++-
- open-vm-tools/vmhgfs-fuse/dir.c           | 175 ++++++++---------
- open-vm-tools/vmhgfs-fuse/file.c          | 217 +++++++++++++---------
- open-vm-tools/vmhgfs-fuse/filesystem.c    |  46 ++---
- open-vm-tools/vmhgfs-fuse/fsutil.c        |  63 ++++---
- open-vm-tools/vmhgfs-fuse/link.c          | 125 +++++++------
- 7 files changed, 367 insertions(+), 297 deletions(-)
-
-diff --git a/open-vm-tools/hgfsmounter/hgfsmounter.c b/open-vm-tools/hgfsmounter/hgfsmounter.c
-index 0921b700..3f6798dc 100644
---- a/open-vm-tools/hgfsmounter/hgfsmounter.c
-+++ b/open-vm-tools/hgfsmounter/hgfsmounter.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2006-2017 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2006-2019 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -514,11 +514,13 @@ ParseFmask(const char *option,         // IN:  option string along with value
-            HgfsMountInfo *mountInfo,   // OUT: mount data
-            int *flags)                 // OUT: mount flags
- {
-+   unsigned short fmask = 0;
-    ASSERT(option);
-    ASSERT(mountInfo);
- 
--   if (ParseMask(option, &mountInfo->fmask)) {
--      LOG("Setting mount fmask to %o\n", mountInfo->fmask);
-+   if (ParseMask(option, &fmask)) {
-+      LOG("Setting mount fmask to %o\n", fmask);
-+      mountInfo->fmask = fmask;
-       return TRUE;
-    }
- 
-@@ -548,11 +550,13 @@ ParseDmask(const char *option,         // IN:  option string along with value
-            HgfsMountInfo *mountInfo,   // OUT: mount data
-            int *flags)                 // OUT: mount flags
- {
-+   unsigned short dmask = 0;
-    ASSERT(option);
-    ASSERT(mountInfo);
- 
--   if (ParseMask(option, &mountInfo->dmask)) {
--      LOG("Setting mount dmask to %o\n", mountInfo->dmask);
-+   if (ParseMask(option, &dmask)) {
-+      LOG("Setting mount dmask to %o\n", dmask);
-+      mountInfo->dmask = dmask;
-       return TRUE;
-    }
- 
-diff --git a/open-vm-tools/lib/hgfsServer/hgfsServer.c b/open-vm-tools/lib/hgfsServer/hgfsServer.c
-index 740c4fed..422383cd 100644
---- a/open-vm-tools/lib/hgfsServer/hgfsServer.c
-+++ b/open-vm-tools/lib/hgfsServer/hgfsServer.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
-+ * Copyright (C) 1998-2019 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -159,7 +159,7 @@ struct HgfsTransportSessionInfo {
-    HgfsServerChannelData channelCapabilities;
- };
- 
--/* The input request paramaters object. */
-+/* The input request parameters object. */
- typedef struct HgfsInputParam {
-    const void *request;          /* Hgfs header followed by operation request */
-    size_t requestSize;           /* Size of Hgfs header and operation request */
-@@ -2682,8 +2682,8 @@ HgfsSearchHandle2Search(HgfsHandle handle,         // IN: handle
-  *    None
-  *
-  * Side effects:
-- *    If there isnt enough memory to accomodate the new names, those file nodes
-- *    that couldnt be updated are deleted.
-+ *    If there isn't enough memory to accommodate the new names, those file nodes
-+ *    that couldn't be updated are deleted.
-  *
-  *-----------------------------------------------------------------------------
-  */
-@@ -3399,7 +3399,7 @@ HgfsServerSessionReceive(HgfsPacket *packet,      // IN: Hgfs Packet
- 
-    /* Send error if we fail to process the op. */
-    if (HGFS_ERROR_SUCCESS != status) {
--      LOG(4, ("Error %d occured parsing the packet\n", (uint32)status));
-+      LOG(4, ("Error %d occurred parsing the packet\n", (uint32)status));
-       HgfsServerCompleteRequest(status, 0, input);
-    }
- }
-@@ -4131,7 +4131,7 @@ HgfsServerSetSessionCapability(HgfsOp op,                  // IN: operation code
-          result = TRUE;
-       }
-    }
--   LOG(4, ("%s: Setting capabilitiy flags %x for op code %d %s\n",
-+   LOG(4, ("%s: Setting capability flags %x for op code %d %s\n",
-            __FUNCTION__, flags, op, result ? "succeeded" : "failed"));
- 
-    return result;
-@@ -4143,7 +4143,7 @@ HgfsServerSetSessionCapability(HgfsOp op,                  // IN: operation code
-  *
-  * HgfsServerResEnumInit --
-  *
-- *    Initialize an enumeration of all exisitng resources.
-+ *    Initialize an enumeration of all existing resources.
-  *
-  * Results:
-  *    The enumeration state object.
-@@ -4239,7 +4239,7 @@ HgfsServerResEnumExit(void *enumState)           // IN/OUT: enumeration state
-  *
-  * HgfsServerEnumerateSharedFolders --
-  *
-- *    Enumerates all exisitng shared folders and registers shared folders with
-+ *    Enumerates all existing shared folders and registers shared folders with
-  *    directory notification package.
-  *
-  * Results:
-@@ -6536,11 +6536,13 @@ HgfsServerRead(HgfsInputParam *input)  // IN: Input params
-             payload = &reply->payload[0];
-          }
-          if (payload) {
-+            uint32 actualSize = 0;
-             status = HgfsPlatformReadFile(readFd, input->session, offset,
-                                           requiredSize, payload,
--                                          &reply->actualSize);
-+                                          &actualSize);
-             if (HGFS_ERROR_SUCCESS == status) {
-                reply->reserved = 0;
-+               reply->actualSize = actualSize;
-                replyPayloadSize = sizeof *reply;
- 
-                if (readUseDataBuffer) {
-@@ -6556,11 +6558,13 @@ HgfsServerRead(HgfsInputParam *input)  // IN: Input params
-          break;
-       }
-    case HGFS_OP_READ: {
-+         uint32 actualSize = 0;
-          HgfsReplyRead *reply = replyRead;
- 
-          status = HgfsPlatformReadFile(readFd, input->session, offset, requiredSize,
--                                       reply->payload, &reply->actualSize);
-+                                       reply->payload, &actualSize);
-          if (HGFS_ERROR_SUCCESS == status) {
-+            reply->actualSize = actualSize;
-             replyPayloadSize = sizeof *reply + reply->actualSize;
-          } else {
-             LOG(4, ("%s: V1 Failed to read-> %d.\n", __FUNCTION__, status));
-diff --git a/open-vm-tools/vmhgfs-fuse/dir.c b/open-vm-tools/vmhgfs-fuse/dir.c
-index 6298a4ea..e71b7afd 100644
---- a/open-vm-tools/vmhgfs-fuse/dir.c
-+++ b/open-vm-tools/vmhgfs-fuse/dir.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2013 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2013,2019 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -54,38 +54,53 @@ HgfsPackDirOpenRequest(const char *path,    // IN: Path of the dir to open
-                        HgfsOp opUsed,       // IN: Op to be used
-                        HgfsReq *req)        // IN/OUT: Packet to write into
- {
--   char *name;
--   unsigned int *nameLength = NULL;
-    size_t reqSize;
--   int result;
- 
-    ASSERT(path);
-    ASSERT(req);
-    LOG(4, ("Path = %s \n", path));
-    switch (opUsed) {
-    case HGFS_OP_SEARCH_OPEN_V3: {
-+      int result;
-       HgfsRequestSearchOpenV3 *requestV3 = HgfsGetRequestPayload(req);
- 
--      /* We'll use these later. */
--      name = requestV3->dirName.name;
--      nameLength = &requestV3->dirName.length;
-       requestV3->dirName.flags = 0;
-       requestV3->dirName.caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-       requestV3->dirName.fid = HGFS_INVALID_HANDLE;
-       requestV3->reserved = 0;
-       reqSize = sizeof(*requestV3) + HgfsGetRequestHeaderSize();
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (reqSize - 1),
-+                                requestV3->dirName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed\n"));
-+         return -EINVAL;
-+      }
-+      LOG(4, ("After conversion = %s\n", requestV3->dirName.name));
-+      requestV3->dirName.length = result;
-+      reqSize += result;
-       break;
-    }
- 
-    case HGFS_OP_SEARCH_OPEN: {
-+      int result;
-       HgfsRequestSearchOpen *request;
- 
-       request = (HgfsRequestSearchOpen *)(HGFS_REQ_PAYLOAD(req));
- 
--      /* We'll use these later. */
--      name = request->dirName.name;
--      nameLength = &request->dirName.length;
-       reqSize = sizeof *request;
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (reqSize - 1),
-+                                request->dirName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed\n"));
-+         return -EINVAL;
-+      }
-+      LOG(4, ("After conversion = %s\n", request->dirName.name));
-+      request->dirName.length = result;
-+      reqSize += result;
-       break;
-    }
- 
-@@ -94,21 +109,7 @@ HgfsPackDirOpenRequest(const char *path,    // IN: Path of the dir to open
-       return -EPROTO;
-    }
- 
--   /* Convert to CP name. */
--
--   LOG(4, ("After buildPath = %s\n", path));
--   result = CPName_ConvertTo(path,
--                             HGFS_LARGE_PACKET_MAX - (reqSize - 1),
--                             name);
--   if (result < 0) {
--      LOG(4, ("CP conversion failed\n"));
--      return -EINVAL;
--   }
--
--   LOG(4, ("After conversion = %s\n", name));
--
--   *nameLength = (uint32) result;
--   req->payloadSize = reqSize + result;
-+   req->payloadSize = reqSize;
- 
-    /* Fill in header here as payloadSize needs to be there. */
-    HgfsPackHeader(req, opUsed);
-@@ -149,7 +150,6 @@ HgfsDirOpen(const char* path,       // IN: Path of dir to open
-    int result;
-    HgfsOp opUsed;
-    HgfsStatus replyStatus;
--   HgfsHandle *replySearch;
- 
-    ASSERT(path);
-    req = HgfsGetNewRequest();
-@@ -161,16 +161,6 @@ HgfsDirOpen(const char* path,       // IN: Path of dir to open
- 
- retry:
-    opUsed = hgfsVersionSearchOpen;
--   if (opUsed == HGFS_OP_SEARCH_OPEN_V3) {
--      HgfsReplySearchOpenV3 *requestV3 = HgfsGetReplyPayload(req);
--
--     replySearch = &requestV3->search;
--
--   } else {
--      HgfsReplySearchOpen *request = (HgfsReplySearchOpen *)HGFS_REQ_PAYLOAD(req);
--
--      replySearch = &request->search;
--   }
- 
-    result = HgfsPackDirOpenRequest(path, opUsed, req);
-    if (result != 0) {
-@@ -187,8 +177,14 @@ retry:
- 
-       switch (result) {
-       case 0:
--         *handle = *replySearch;
--         LOG(6, ("Set handle to %u\n", *replySearch));
-+         if (opUsed == HGFS_OP_SEARCH_OPEN_V3) {
-+            HgfsReplySearchOpenV3 *requestV3 = HgfsGetReplyPayload(req);
-+            *handle = requestV3->search;
-+         } else {
-+            HgfsReplySearchOpen *request = (HgfsReplySearchOpen *)HGFS_REQ_PAYLOAD(req);
-+            *handle = request->search;
-+         }
-+         LOG(6, ("Set handle to %u\n", *handle));
-          break;
-       case -EPROTO:
-          /* Retry with older version(s). Set globally. */
-@@ -626,25 +622,30 @@ HgfsPackCreateDirRequest(const char *path,
-                          HgfsOp opUsed,         // IN: Op to be used.
-                          HgfsReq *req)          // IN/OUT: Packet to write into
- {
--   char *fileName = NULL;
--   uint32 *fileNameLength;
-    size_t reqSize;
--   int result;
-+
- 
-    ASSERT(req);
- 
-    switch (opUsed) {
-    case HGFS_OP_CREATE_DIR_V3: {
-+      int result;
-       HgfsRequestCreateDirV3 *requestV3 = HgfsGetRequestPayload(req);
- 
-       reqSize = sizeof(*requestV3) + HgfsGetRequestHeaderSize();
--      /* We'll use these later. */
--      fileName = requestV3->fileName.name;
--      fileNameLength = &requestV3->fileName.length;
-       requestV3->fileName.flags = 0;
-       requestV3->fileName.fid = HGFS_INVALID_HANDLE;
-       requestV3->fileName.caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
--
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (reqSize - 1),
-+                                requestV3->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      requestV3->fileName.length = result;
-+      reqSize += result;
-       requestV3->mask = HGFS_CREATE_DIR_MASK;
- 
-       /* Set permissions. */
-@@ -656,15 +657,23 @@ HgfsPackCreateDirRequest(const char *path,
-       break;
-    }
-    case HGFS_OP_CREATE_DIR_V2: {
-+      int result;
-       HgfsRequestCreateDirV2 *requestV2;
- 
-       requestV2 = (HgfsRequestCreateDirV2 *)(HGFS_REQ_PAYLOAD(req));
- 
--      /* We'll use these later. */
--      fileName = requestV2->fileName.name;
--      fileNameLength = &requestV2->fileName.length;
-       reqSize = sizeof *requestV2;
- 
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (reqSize - 1),
-+                                requestV2->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      requestV2->fileName.length = result;
-+      reqSize += result;
-       requestV2->mask = HGFS_CREATE_DIR_MASK;
- 
-       /* Set permissions. */
-@@ -675,15 +684,22 @@ HgfsPackCreateDirRequest(const char *path,
-       break;
-    }
-    case HGFS_OP_CREATE_DIR: {
-+      int result;
-       HgfsRequestCreateDir *request;
- 
-       request = (HgfsRequestCreateDir *)(HGFS_REQ_PAYLOAD(req));
- 
--      /* We'll use these later. */
--      fileName = request->fileName.name;
--      fileNameLength = &request->fileName.length;
-       reqSize = sizeof *request;
--
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (reqSize - 1),
-+                                request->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      request->fileName.length = result;
-+      reqSize += result;
-       /* Set permissions. */
-       request->permissions = (permsMode & S_IRWXU) >> 6;
-       break;
-@@ -693,18 +709,7 @@ HgfsPackCreateDirRequest(const char *path,
-       return -EPROTO;
-    }
- 
--
--   /* Convert to CP name. */
--   result = CPName_ConvertTo(path,
--                             HGFS_LARGE_PACKET_MAX - (reqSize - 1),
--                             fileName);
--   if (result < 0) {
--      LOG(4, ("CP conversion failed.\n"));
--      return -EINVAL;
--   }
--
--   *fileNameLength = result;
--   req->payloadSize = reqSize + result;
-+   req->payloadSize = reqSize;
- 
-    /* Fill in header here as payloadSize needs to be there. */
-    HgfsPackHeader(req, opUsed);
-@@ -827,8 +832,6 @@ HgfsDelete(const char* path,       // IN: Path to file
-    HgfsReq *req = NULL;
-    int result = 0;
-    HgfsStatus replyStatus;
--   char *fileName = NULL;
--   uint32 *fileNameLength;
-    uint32 reqSize;
-    HgfsOp opUsed;
-    HgfsAttrInfo newAttr = {0};
-@@ -862,8 +865,17 @@ HgfsDelete(const char* path,       // IN: Path to file
- 
-       reqSize = sizeof(*request) + HgfsGetRequestHeaderSize();
-       request->hints = 0;
--      fileName = request->fileName.name;
--      fileNameLength = &request->fileName.length;
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize),
-+                                request->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         result = -EINVAL;
-+         goto out;
-+      }
-+      request->fileName.length = result;
-+      reqSize += result;
-       request->fileName.fid = HGFS_INVALID_HANDLE;
-       request->fileName.flags = 0;
-       request->fileName.caseType = HGFS_FILE_NAME_DEFAULT_CASE;
-@@ -874,24 +886,21 @@ HgfsDelete(const char* path,       // IN: Path to file
- 
-       request = (HgfsRequestDelete *)(HGFS_REQ_PAYLOAD(req));
-       /* Fill out the request packet. */
--      fileName = request->fileName.name;
--      fileNameLength = &request->fileName.length;
-       reqSize = sizeof *request;
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize),
-+                                request->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         result = -EINVAL;
-+         goto out;
-+      }
-+      request->fileName.length = result;
-+      reqSize += result;
-    }
- 
--
--   /* Convert to CP name. */
--   result = CPName_ConvertTo(path,
--                             HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize),
--                             fileName);
--   if (result < 0) {
--      LOG(4, ("CP conversion failed.\n"));
--      result = -EINVAL;
--      goto out;
--   }
--
--   *fileNameLength = result;
--   req->payloadSize = reqSize + result;
-+   req->payloadSize = reqSize;
- 
-    /* Fill in header here as payloadSize needs to be there. */
-    HgfsPackHeader(req, opUsed);
-diff --git a/open-vm-tools/vmhgfs-fuse/file.c b/open-vm-tools/vmhgfs-fuse/file.c
-index 389ebba8..0b6c48bc 100644
---- a/open-vm-tools/vmhgfs-fuse/file.c
-+++ b/open-vm-tools/vmhgfs-fuse/file.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2013,2017 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2013,2018-2019 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -66,10 +66,7 @@ HgfsPackOpenRequest(const char *path,          // IN: Path to file
-                     HgfsOp opUsed,             // IN: Op to use
-                     HgfsReq *req)              // IN/OUT: Packet to write into
- {
--   char *name;
--   uint32 *nameLength;
-    size_t reqSize;
--   int result;
-    int openMode, openFlags;
- 
-    ASSERT(path);
-@@ -88,14 +85,22 @@ HgfsPackOpenRequest(const char *path,          // IN: Path to file
- 
-    switch (opUsed) {
-     case HGFS_OP_OPEN_V3: {
-+      int result;
-       HgfsRequestOpenV3 *requestV3 = HgfsGetRequestPayload(req);
- 
-       reqSize = sizeof(*requestV3) + HgfsGetRequestHeaderSize();
- 
--      /* We'll use these later. */
--      name = requestV3->fileName.name;
--      nameLength = &requestV3->fileName.length;
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (reqSize - 1),
-+                                requestV3->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
- 
-+      requestV3->fileName.length = result;
-+      reqSize += result;
-       /* Linux clients need case-sensitive lookups. */
-       requestV3->fileName.flags = 0;
-       requestV3->fileName.caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-@@ -122,15 +127,24 @@ HgfsPackOpenRequest(const char *path,          // IN: Path to file
-    }
- 
-    case HGFS_OP_OPEN_V2: {
-+      int result;
-       HgfsRequestOpenV2 *requestV2;
- 
-       requestV2 = (HgfsRequestOpenV2 *)(HGFS_REQ_PAYLOAD(req));
- 
--      /* We'll use these later. */
--      name = requestV2->fileName.name;
--      nameLength = &requestV2->fileName.length;
-       reqSize = sizeof *requestV2;
- 
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (reqSize - 1),
-+                                requestV2->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+
-+      requestV2->fileName.length = result;
-+      reqSize += result;
-       requestV2->mask = mask;
-       requestV2->mode = openMode;
-       requestV2->flags = openFlags;
-@@ -148,14 +162,23 @@ HgfsPackOpenRequest(const char *path,          // IN: Path to file
-       break;
-    }
-    case HGFS_OP_OPEN: {
-+      int result;
-       HgfsRequestOpen *request;
- 
-       request = (HgfsRequestOpen *)(HGFS_REQ_PAYLOAD(req));
--      /* We'll use these later. */
--      name = request->fileName.name;
--      nameLength = &request->fileName.length;
-       reqSize = sizeof *request;
- 
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (reqSize - 1),
-+                                request->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+
-+      request->fileName.length = result;
-+      reqSize += result;
-       request->mode = openMode;
-       request->flags = openFlags;
- 
-@@ -168,18 +191,7 @@ HgfsPackOpenRequest(const char *path,          // IN: Path to file
-       return -EPROTO;
-    }
- 
--
--   /* Convert to CP name. */
--   result = CPName_ConvertTo(path,
--                             HGFS_LARGE_PACKET_MAX - (reqSize - 1),
--                             name);
--   if (result < 0) {
--      LOG(4, ("CP conversion failed.\n"));
--      return -EINVAL;
--   }
--
--   *nameLength = (uint32) result;
--   req->payloadSize = reqSize + result;
-+   req->payloadSize = reqSize;
- 
-    /* Fill in header here as payloadSize needs to be there. */
-    HgfsPackHeader(req, opUsed);
-@@ -915,10 +927,6 @@ int
- HgfsRename(const char* from, const char* to)
- {
-    HgfsReq *req = NULL;
--   char *oldName;
--   char *newName;
--   uint32 *oldNameLength;
--   uint32 *newNameLength;
-    int result = 0;
-    uint32 reqSize;
-    HgfsOp opUsed;
-@@ -942,33 +950,41 @@ retry:
-    if (opUsed == HGFS_OP_RENAME_V3) {
-       HgfsRequestRenameV3 *requestV3 = HgfsGetRequestPayload(req);
- 
--      oldName = requestV3->oldName.name;
--      oldNameLength = &requestV3->oldName.length;
-       requestV3->hints = 0;
-       requestV3->oldName.flags = 0;
-       requestV3->oldName.fid = HGFS_INVALID_HANDLE;
-       requestV3->oldName.caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-       requestV3->reserved = 0;
-       reqSize = sizeof(*requestV3) + HgfsGetRequestHeaderSize();
-+      /* Convert old name to CP format. */
-+      result = CPName_ConvertTo(from,
-+                                HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize),
-+                                requestV3->oldName.name);
-+      if (result < 0) {
-+         LOG(4, ("oldName CP conversion failed\n"));
-+         result = -EINVAL;
-+         goto out;
-+      }
-+
-+      requestV3->oldName.length = result;
-+      reqSize += result;
-    } else {
-       HgfsRequestRename *request = (HgfsRequestRename *)HGFS_REQ_PAYLOAD(req);
- 
--      oldName = request->oldName.name;
--      oldNameLength = &request->oldName.length;
-       reqSize = sizeof *request;
--   }
--   /* Convert old name to CP format. */
--   result = CPName_ConvertTo(from,
--                             HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize),
--                             oldName);
--   if (result < 0) {
--      LOG(4, ("oldName CP conversion failed\n"));
--      result = -EINVAL;
--      goto out;
--   }
-+      /* Convert old name to CP format. */
-+      result = CPName_ConvertTo(from,
-+                                HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize),
-+                                request->oldName.name);
-+      if (result < 0) {
-+         LOG(4, ("oldName CP conversion failed\n"));
-+         result = -EINVAL;
-+         goto out;
-+      }
- 
--   *oldNameLength = result;
--   reqSize += result;
-+      request->oldName.length = result;
-+      reqSize += result;
-+   }
- 
-    /*
-     * Build full new name to send to server.
-@@ -983,8 +999,20 @@ retry:
- 
-       newNameP = (HgfsFileNameV3 *)((char *)&requestV3->oldName +
-                                     sizeof requestV3->oldName + result);
--      newName = newNameP->name;
--      newNameLength = &newNameP->length;
-+
-+      LOG(6, ("New name: \"%s\"\n", newNameP->name));
-+
-+      /* Convert new name to CP format. */
-+      result = CPName_ConvertTo(to,
-+                                HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize) - result,
-+                                newNameP->name);
-+      if (result < 0) {
-+         LOG(4, ("newName CP conversion failed\n"));
-+         result = -EINVAL;
-+         goto out;
-+      }
-+      newNameP->length = result;
-+      reqSize += result;
-       newNameP->flags = 0;
-       newNameP->fid = HGFS_INVALID_HANDLE;
-       newNameP->caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-@@ -993,24 +1021,22 @@ retry:
-       HgfsFileName *newNameP;
-       newNameP = (HgfsFileName *)((char *)&request->oldName +
-                                   sizeof request->oldName + result);
--      newName = newNameP->name;
--      newNameLength = &newNameP->length;
--   }
- 
--   LOG(6, ("New name: \"%s\"\n", newName));
-+      LOG(6, ("New name: \"%s\"\n", newNameP->name));
- 
--   /* Convert new name to CP format. */
--   result = CPName_ConvertTo(to,
--                             HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize) - result,
--                             newName);
--   if (result < 0) {
--      LOG(4, ("newName CP conversion failed\n"));
--      result = -EINVAL;
--      goto out;
-+      /* Convert new name to CP format. */
-+      result = CPName_ConvertTo(to,
-+                                HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize) - result,
-+                                newNameP->name);
-+      if (result < 0) {
-+         LOG(4, ("newName CP conversion failed\n"));
-+         result = -EINVAL;
-+         goto out;
-+      }
-+      newNameP->length = result;
-+      reqSize += result;
-    }
- 
--   *newNameLength = result;
--   reqSize += result;
-    req->payloadSize = reqSize;
- 
-    /* Fill in header here as payloadSize needs to be there. */
-@@ -1068,7 +1094,7 @@ retry:
-          }
-          break;
-       default:
--         LOG(4, ("failed with result %d\n", result));
-+         LOG(4, ("Server protocol result %d\n", result));
-       }
-       break;
-    default:
-@@ -1109,21 +1135,17 @@ HgfsPackSetattrRequest(const char *path,   // IN:  path to file
- {
-    HgfsAttrV2 *attrV2;
-    HgfsAttr *attrV1;
--   HgfsAttrHint *hints;
-    HgfsAttrChanges *update;
--   char *fileName = NULL;
--   uint32 *fileNameLength = NULL;
-    size_t reqBufferSize;
-    size_t reqSize;
--   int result = 0;
-    ASSERT(req);
- 
-    switch (opUsed) {
-    case HGFS_OP_SETATTR_V3: {
-+      int result;
-       HgfsRequestSetattrV3 *requestV3 = HgfsGetRequestPayload(req);
- 
-       attrV2 = &requestV3->attr;
--      hints = &requestV3->hints;
- 
-       /*
-        * Clear attributes, mask, and hints before touching them.
-@@ -1131,7 +1153,7 @@ HgfsPackSetattrRequest(const char *path,   // IN:  path to file
-        * make sure to zero them all here.
-        */
-       memset(attrV2, 0, sizeof *attrV2);
--      memset(hints, 0, sizeof *hints);
-+      requestV3->hints = 0;
- 
-       /*
-        * When possible, issue a setattr using an existing handle. This will
-@@ -1143,14 +1165,21 @@ HgfsPackSetattrRequest(const char *path,   // IN:  path to file
-        * the times also requires write permissions on Windows, so we require it
-        * here too. Otherwise, any handle will do.
-        */
--      fileName = requestV3->fileName.name;
--      fileNameLength = &requestV3->fileName.length;
-       requestV3->fileName.caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-       requestV3->fileName.fid = HGFS_INVALID_HANDLE;
-       requestV3->fileName.flags = 0;
-       requestV3->reserved = 0;
-       reqSize = sizeof(*requestV3) + HgfsGetRequestHeaderSize();
-       reqBufferSize = HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize);
-+      result = CPName_ConvertTo(path,
-+                                reqBufferSize,
-+                                requestV3->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      requestV3->fileName.length = result;
-+      reqSize += result;
- 
-       attrV2->mask = attr->mask;
-       if (attr->mask & (HGFS_ATTR_VALID_SPECIAL_PERMS |
-@@ -1173,22 +1202,22 @@ HgfsPackSetattrRequest(const char *path,   // IN:  path to file
-       }
-       if (attr->mask & HGFS_ATTR_VALID_ACCESS_TIME) {
-          attrV2->accessTime = attr->accessTime;
--         *hints |= HGFS_ATTR_HINT_SET_ACCESS_TIME;
-+         requestV3->hints |= HGFS_ATTR_HINT_SET_ACCESS_TIME;
-       }
-       if (attr->mask & HGFS_ATTR_VALID_WRITE_TIME) {
-          attrV2->writeTime = attr->writeTime;
--         *hints |= HGFS_ATTR_HINT_SET_WRITE_TIME;
-+         requestV3->hints |= HGFS_ATTR_HINT_SET_WRITE_TIME;
-       }
- 
-       break;
-    }
-    case HGFS_OP_SETATTR_V2: {
-+      int result;
-       HgfsRequestSetattrV2 *requestV2;
- 
-       requestV2 = (HgfsRequestSetattrV2 *)(HGFS_REQ_PAYLOAD(req));
- 
-       attrV2 = &requestV2->attr;
--      hints = &requestV2->hints;
- 
-       /*
-        * Clear attributes, mask, and hints before touching them.
-@@ -1196,13 +1225,19 @@ HgfsPackSetattrRequest(const char *path,   // IN:  path to file
-        * make sure to zero them all here.
-        */
-       memset(attrV2, 0, sizeof *attrV2);
--      memset(hints, 0, sizeof *hints);
--
--      fileName = requestV2->fileName.name;
--      fileNameLength = &requestV2->fileName.length;
-+      requestV2->hints = 0;
- 
-       reqSize = sizeof *requestV2;
-       reqBufferSize = HGFS_NAME_BUFFER_SIZE(HGFS_LARGE_PACKET_MAX, requestV2);
-+      result = CPName_ConvertTo(path,
-+                                reqBufferSize,
-+                                requestV2->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      requestV2->fileName.length = result;
-+      reqSize += result;
- 
-       if (attr->mask & (HGFS_ATTR_VALID_SPECIAL_PERMS |
-                           HGFS_ATTR_VALID_OWNER_PERMS |
-@@ -1224,16 +1259,17 @@ HgfsPackSetattrRequest(const char *path,   // IN:  path to file
-       }
-       if (attr->mask & HGFS_ATTR_VALID_ACCESS_TIME) {
-          attrV2->accessTime = attr->accessTime;
--         *hints |= HGFS_ATTR_HINT_SET_ACCESS_TIME;
-+         requestV2->hints |= HGFS_ATTR_HINT_SET_ACCESS_TIME;
-       }
-       if (attr->mask & HGFS_ATTR_VALID_WRITE_TIME) {
-          attrV2->writeTime = attr->writeTime;
--         *hints |= HGFS_ATTR_HINT_SET_WRITE_TIME;
-+         requestV2->hints |= HGFS_ATTR_HINT_SET_WRITE_TIME;
-       }
- 
-       break;
-    }
-    case HGFS_OP_SETATTR: {
-+      int result;
-       HgfsRequestSetattr *request;
- 
-       request = (HgfsRequestSetattr *)(HGFS_REQ_PAYLOAD(req));
-@@ -1241,11 +1277,17 @@ HgfsPackSetattrRequest(const char *path,   // IN:  path to file
-       attrV1 = &request->attr;
-       update = &request->update;
- 
--      /* We'll use these later. */
--      fileName = request->fileName.name;
--      fileNameLength = &request->fileName.length;
-       reqSize = sizeof *request;
-       reqBufferSize = HGFS_NAME_BUFFER_SIZE(HGFS_LARGE_PACKET_MAX, request);
-+      result = CPName_ConvertTo(path,
-+                                reqBufferSize,
-+                                request->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      request->fileName.length = result;
-+      reqSize += result;
- 
-       /*
-        * Clear attributes before touching them.
-@@ -1284,16 +1326,7 @@ HgfsPackSetattrRequest(const char *path,   // IN:  path to file
-       return -EPROTO;
-    }
- 
--   result = CPName_ConvertTo(path,
--                             reqBufferSize,
--                             fileName);
--      if (result < 0) {
--         LOG(4, ("CP conversion failed.\n"));
--         return -EINVAL;
--   }
--
--   *fileNameLength = result;
--   req->payloadSize = reqSize + result;
-+   req->payloadSize = reqSize;
- 
-    /* Fill in header here as payloadSize needs to be there. */
-    HgfsPackHeader(req, opUsed);
-diff --git a/open-vm-tools/vmhgfs-fuse/filesystem.c b/open-vm-tools/vmhgfs-fuse/filesystem.c
-index fb9d547d..1931a5d2 100644
---- a/open-vm-tools/vmhgfs-fuse/filesystem.c
-+++ b/open-vm-tools/vmhgfs-fuse/filesystem.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2013 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2013,2019 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -123,36 +123,50 @@ HgfsPackQueryVolumeRequest(const char *path,        // IN: File pointer for this
-                            HgfsOp opUsed,           // IN: Op to be used.
-                            HgfsReq *req)            // IN/OUT: Packet to write into
- {
--   char *name;
--   uint32 *nameLength;
-    size_t requestSize;
--   int result;
-+
- 
-    ASSERT(req);
- 
-    switch (opUsed) {
-    case HGFS_OP_QUERY_VOLUME_INFO_V3: {
-+      int result;
-       HgfsRequestQueryVolumeV3 *requestV3 = HgfsGetRequestPayload(req);
- 
--      /* We'll use these later. */
--      name = requestV3->fileName.name;
--      nameLength = &requestV3->fileName.length;
-       requestV3->fileName.flags = 0;
-       requestV3->fileName.fid = HGFS_INVALID_HANDLE;
-       requestV3->fileName.caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-       requestV3->reserved = 0;
-       requestSize = sizeof(*requestV3) + HgfsGetRequestHeaderSize();
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (requestSize - 1),
-+                                requestV3->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      requestV3->fileName.length = result;
-+      requestSize += result;
-       break;
-    }
-    case HGFS_OP_QUERY_VOLUME_INFO: {
-+      int result;
-       HgfsRequestQueryVolume *request;
- 
-       request = (HgfsRequestQueryVolume *)(HGFS_REQ_PAYLOAD(req));
- 
--      /* We'll use these later. */
--      name = request->fileName.name;
--      nameLength = &request->fileName.length;
-       requestSize = sizeof *request;
-+      /* Convert to CP name. */
-+      result = CPName_ConvertTo(path,
-+                                HGFS_LARGE_PACKET_MAX - (requestSize - 1),
-+                                request->fileName.name);
-+      if (result < 0) {
-+         LOG(4, ("CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      request->fileName.length = result;
-+      requestSize += result;
-       break;
-    }
-    default:
-@@ -160,17 +174,7 @@ HgfsPackQueryVolumeRequest(const char *path,        // IN: File pointer for this
-       return -EPROTO;
-    }
- 
--   /* Convert to CP name. */
--   result = CPName_ConvertTo(path,
--                             HGFS_LARGE_PACKET_MAX - (requestSize - 1),
--                             name);
--   if (result < 0) {
--      LOG(4, ("CP conversion failed.\n"));
--      return -EINVAL;
--   }
--
--   *nameLength = (uint32) result;
--   req->payloadSize = requestSize + result;
-+   req->payloadSize = requestSize;
- 
-    /* Fill in header here as payloadSize needs to be there. */
-    HgfsPackHeader(req, opUsed);
-diff --git a/open-vm-tools/vmhgfs-fuse/fsutil.c b/open-vm-tools/vmhgfs-fuse/fsutil.c
-index 042c223c..af85c405 100644
---- a/open-vm-tools/vmhgfs-fuse/fsutil.c
-+++ b/open-vm-tools/vmhgfs-fuse/fsutil.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2013 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2013,2019 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -189,8 +189,6 @@ HgfsPackGetattrRequest(HgfsReq *req,            // IN/OUT: Request buffer
-    size_t reqBufferSize;
-    size_t reqSize;
-    int result = 0;
--   char *fileName = NULL;
--   uint32 *fileNameLength = NULL;
-    ASSERT(attr);
-    ASSERT(req);
-    ASSERT(path);
-@@ -204,8 +202,6 @@ HgfsPackGetattrRequest(HgfsReq *req,            // IN/OUT: Request buffer
- 
-       /* Fill out the request packet. */
-       requestV3->hints = 0;
--      fileName = requestV3->fileName.name;
--      fileNameLength = &requestV3->fileName.length;
-       requestV3->fileName.flags = 0;
-       requestV3->fileName.fid = HGFS_INVALID_HANDLE;
-       requestV3->fileName.caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-@@ -213,6 +209,19 @@ HgfsPackGetattrRequest(HgfsReq *req,            // IN/OUT: Request buffer
-       requestV3->reserved = 0;
-       reqSize = sizeof(*requestV3) + HgfsGetRequestHeaderSize();
-       reqBufferSize = HGFS_NAME_BUFFER_SIZET(HGFS_LARGE_PACKET_MAX, reqSize);
-+      if (requestV3->fileName.name != NULL) {
-+         /* Convert to CP name. */
-+         result = CPName_ConvertTo(path,
-+                                   reqBufferSize,
-+                                   requestV3->fileName.name);
-+         LOG(8, ("Converted path %s\n", requestV3->fileName.name));
-+         if (result < 0) {
-+            LOG(8, ("CP conversion failed.\n"));
-+            result = -EINVAL;
-+            goto out;
-+         }
-+         requestV3->fileName.length = result;
-+      }
-       break;
-    }
- 
-@@ -223,20 +232,42 @@ HgfsPackGetattrRequest(HgfsReq *req,            // IN/OUT: Request buffer
- 
-       requestV2 = (HgfsRequestGetattrV2 *)(HGFS_REQ_PAYLOAD(req));
-       requestV2->hints = 0;
--      fileName = requestV2->fileName.name;
--      fileNameLength = &requestV2->fileName.length;
-       reqSize = sizeof *requestV2;
-       reqBufferSize = HGFS_NAME_BUFFER_SIZE(HGFS_LARGE_PACKET_MAX, requestV2);
-+      if (requestV2->fileName.name != NULL) {
-+         /* Convert to CP name. */
-+         result = CPName_ConvertTo(path,
-+                                   reqBufferSize,
-+                                   requestV2->fileName.name);
-+         LOG(8, ("Converted path %s\n", requestV2->fileName.name));
-+         if (result < 0) {
-+            LOG(8, ("CP conversion failed.\n"));
-+            result = -EINVAL;
-+            goto out;
-+         }
-+         requestV2->fileName.length = result;
-+      }
-       break;
-    }
- 
-    case HGFS_OP_GETATTR: {
-       HgfsRequestGetattr *requestV1;
-       requestV1 = (HgfsRequestGetattr *)(HGFS_REQ_PAYLOAD(req));
--      fileName = requestV1->fileName.name;
--      fileNameLength = &requestV1->fileName.length;
-       reqSize = sizeof *requestV1;
-       reqBufferSize = HGFS_NAME_BUFFER_SIZE(HGFS_LARGE_PACKET_MAX, requestV1);
-+      if (requestV1->fileName.name != NULL) {
-+         /* Convert to CP name. */
-+         result = CPName_ConvertTo(path,
-+                                   reqBufferSize,
-+                                   requestV1->fileName.name);
-+         LOG(8, ("Converted path %s\n", requestV1->fileName.name));
-+         if (result < 0) {
-+            LOG(8, ("CP conversion failed.\n"));
-+            result = -EINVAL;
-+            goto out;
-+         }
-+         requestV1->fileName.length = result;
-+      }
-       break;
-    }
- 
-@@ -246,20 +277,6 @@ HgfsPackGetattrRequest(HgfsReq *req,            // IN/OUT: Request buffer
-       goto out;
-    }
- 
--   if (fileName != NULL) {
--      /* Convert to CP name. */
--      result = CPName_ConvertTo(path,
--                                reqBufferSize,
--                                fileName);
--      LOG(8, ("Converted path %s\n", fileName));
--      if (result < 0) {
--         LOG(8, ("CP conversion failed.\n"));
--         result = -EINVAL;
--         goto out;
--      }
--      *fileNameLength = result;
--   }
--
-    req->payloadSize = reqSize + result;
- 
-    /* Fill in header here as payloadSize needs to be there. */
-diff --git a/open-vm-tools/vmhgfs-fuse/link.c b/open-vm-tools/vmhgfs-fuse/link.c
-index a00e8446..777eb76e 100644
---- a/open-vm-tools/vmhgfs-fuse/link.c
-+++ b/open-vm-tools/vmhgfs-fuse/link.c
-@@ -1,5 +1,5 @@
- /*********************************************************
-- * Copyright (C) 2013 VMware, Inc. All rights reserved.
-+ * Copyright (C) 2013,2019 VMware, Inc. All rights reserved.
-  *
-  * This program is free software; you can redistribute it and/or modify it
-  * under the terms of the GNU Lesser General Public License as published
-@@ -51,36 +51,81 @@ HgfsPackSymlinkCreateRequest(const char* symlink,     // IN: path of the link
- {
-    HgfsRequestSymlinkCreateV3 *requestV3 = NULL;
-    HgfsRequestSymlinkCreate *request = NULL;
--   char *symlinkName;
--   uint32 *symlinkNameLength;
--   char *targetName;
--   uint32 *targetNameLength;
-    size_t targetNameBytes;
--
-    size_t requestSize;
--   int result;
-+
-+   targetNameBytes = strlen(symname) + 1;
- 
-    switch (opUsed) {
-    case HGFS_OP_CREATE_SYMLINK_V3: {
-+      int result;
-+      HgfsFileNameV3 *fileNameP;
-       requestV3 = HgfsGetRequestPayload(req);
- 
--      /* We'll use these later. */
--      symlinkName = requestV3->symlinkName.name;
--      symlinkNameLength = &requestV3->symlinkName.length;
-       requestV3->symlinkName.flags = 0;
-       requestV3->symlinkName.fid = HGFS_INVALID_HANDLE;
-       requestV3->symlinkName.caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-       requestV3->reserved = 0;
-       requestSize = sizeof(*requestV3) + HgfsGetRequestHeaderSize();
-+      /* Convert symlink name to CP format. */
-+      result = CPName_ConvertTo(symlink,
-+                                HGFS_LARGE_PACKET_MAX - (requestSize - 1),
-+                                requestV3->symlinkName.name);
-+      if (result < 0) {
-+         LOG(4, ("SymlinkName CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      requestV3->symlinkName.length = result;
-+      requestSize += result;
-+
-+      /* Copy target name into request packet. */
-+      if (targetNameBytes > HGFS_LARGE_PACKET_MAX - (requestSize - 1)) {
-+         LOG(4, ("Target name is too long.\n"));
-+         return -EINVAL;
-+      }
-+
-+      fileNameP = (HgfsFileNameV3 *)((char *)&requestV3->symlinkName +
-+                                     sizeof requestV3->symlinkName + result);
-+      memcpy(fileNameP->name, symname, targetNameBytes);
-+      LOG(6, ("Target name: \"%s\"\n", fileNameP->name));
-+      /* Convert target name to CPName-lite format. */
-+      CPNameLite_ConvertTo(fileNameP->name, targetNameBytes - 1, '/');
-+      fileNameP->length = targetNameBytes - 1;
-+      fileNameP->flags = 0;
-+      fileNameP->fid = HGFS_INVALID_HANDLE;
-+      fileNameP->caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
-       break;
-    }
-    case HGFS_OP_CREATE_SYMLINK: {
-+      int result;
-+      HgfsFileName *fileNameP;
-       request = (HgfsRequestSymlinkCreate *)(HGFS_REQ_PAYLOAD(req));
- 
--      /* We'll use these later. */
--      symlinkName = request->symlinkName.name;
--      symlinkNameLength = &request->symlinkName.length;
-       requestSize = sizeof *request;
-+      /* Convert symlink name to CP format. */
-+      result = CPName_ConvertTo(symlink,
-+                                HGFS_LARGE_PACKET_MAX - (requestSize - 1),
-+                                request->symlinkName.name);
-+      if (result < 0) {
-+         LOG(4, ("SymlinkName CP conversion failed.\n"));
-+         return -EINVAL;
-+      }
-+      request->symlinkName.length = result;
-+      requestSize += result;
-+
-+      /* Copy target name into request packet. */
-+      if (targetNameBytes > HGFS_LARGE_PACKET_MAX - (requestSize - 1)) {
-+         LOG(4, ("Target name is too long.\n"));
-+         return -EINVAL;
-+      }
-+
-+      fileNameP = (HgfsFileName *)((char *)&request->symlinkName +
-+                                   sizeof request->symlinkName + result);
-+      memcpy(fileNameP->name, symname, targetNameBytes);
-+      LOG(6, ("Target name: \"%s\"\n", fileNameP->name));
-+      /* Convert target name to CPName-lite format. */
-+      CPNameLite_ConvertTo(fileNameP->name, targetNameBytes - 1, '/');
-+      fileNameP->length = targetNameBytes - 1;
-       break;
-    }
-    default:
-@@ -88,59 +133,13 @@ HgfsPackSymlinkCreateRequest(const char* symlink,     // IN: path of the link
-       return -EPROTO;
-    }
- 
--
--   /* Convert symlink name to CP format. */
--   result = CPName_ConvertTo(symlink,
--                             HGFS_LARGE_PACKET_MAX - (requestSize - 1),
--                             symlinkName);
--   if (result < 0) {
--      LOG(4, ("SymlinkName CP conversion failed.\n"));
--      return -EINVAL;
--   }
--
--   *symlinkNameLength = result;
--   req->payloadSize = requestSize + result;
-+   req->payloadSize = requestSize;
- 
-    /*
--    * Note the different buffer length. This is because HgfsRequestSymlink
--    * contains two filenames, and once we place the first into the packet we
--    * must account for it when determining the amount of buffer available for
--    * the second.
--    *
--    * Also note that targetNameBytes accounts for the NUL character. Once
--    * we've converted it to CP name, it won't be NUL-terminated and the length
--    * of the string in the packet itself won't account for it.
-+    * targetNameBytes accounts for the NUL character. Once we've converted
-+    * it to CP name, it won't be NUL-terminated and the length of the string
-+    * in the packet itself won't account for it.
-     */
--   if (opUsed == HGFS_OP_CREATE_SYMLINK_V3) {
--      HgfsFileNameV3 *fileNameP;
--      fileNameP = (HgfsFileNameV3 *)((char *)&requestV3->symlinkName +
--                                     sizeof requestV3->symlinkName + result);
--      targetName = fileNameP->name;
--      targetNameLength = &fileNameP->length;
--      fileNameP->flags = 0;
--      fileNameP->fid = HGFS_INVALID_HANDLE;
--      fileNameP->caseType = HGFS_FILE_NAME_CASE_SENSITIVE;
--   } else {
--      HgfsFileName *fileNameP;
--      fileNameP = (HgfsFileName *)((char *)&request->symlinkName +
--                                   sizeof request->symlinkName + result);
--      targetName = fileNameP->name;
--      targetNameLength = &fileNameP->length;
--   }
--   targetNameBytes = strlen(symname) + 1;
--
--   /* Copy target name into request packet. */
--   if (targetNameBytes > HGFS_LARGE_PACKET_MAX - (requestSize - 1)) {
--      LOG(4, ("Target name is too long.\n"));
--      return -EINVAL;
--   }
--   memcpy(targetName, symname, targetNameBytes);
--   LOG(6, ("Target name: \"%s\"\n", targetName));
--
--   /* Convert target name to CPName-lite format. */
--   CPNameLite_ConvertTo(targetName, targetNameBytes - 1, '/');
--
--   *targetNameLength = targetNameBytes - 1;
-    req->payloadSize += targetNameBytes - 1;
- 
-    /* Fill in header here as payloadSize needs to be there. */
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
similarity index 95%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
index 63a64fc712..5dcf818381 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.3.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_11.0.1.bb
@@ -38,10 +38,8 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
     file://0011-Use-uintmax_t-for-handling-rlim_t.patch;patchdir=.. \
     file://0012-Use-off64_t-instead-of-__off64_t.patch;patchdir=.. \
     file://0013-misc-Do-not-print-NULL-string-into-logs.patch;patchdir=.. \
-    file://0014-Fix-new-warnings-from-gcc9.patch;patchdir=.. \
 "
-# stable-10.3.5
-SRCREV = "f2ff192717375b95a6b7e278fb47dbb3d3bc56d1"
+SRCREV = "d3edfd142a81096f9f58aff17d84219b457f4987"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
@@ -56,7 +54,7 @@ SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs \
          --disable-tests --without-gtkmm --without-xerces --without-pam \
-         --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg \
+         --disable-vgauth --disable-deploypkg \
          --without-root-privileges --without-kernel-modules"
 
 NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
-- 
2.23.0


