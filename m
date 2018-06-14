Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0026478A52
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 06:56:43 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id z1-v6so2458196pgv.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 23:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fQEJSnPMOj2jFIUNxCdudKoltxN816l6hqhSdTX3SUo=;
	b=eSvdWT1V8ygtGsaJXrfiWX3ssGDVXIxCdk1VobZMUTdg3//sDtdqyZGHtBbF6qPWMh
	oJe4ssU3kDOuWRNiNaZL+4MyQ7lZYKH3CAHYTI/hmoXA638QiCoOrlYhKK8LGUKkNm3l
	Qu4FP5SveY9nwjQYvGZDoYFkGQpo8i541fPV5axa/iiUU/sLWDBqM8bAULrIbiZ47yoA
	Itu2scWpgJZNVXF6QhhHgHfWpNCAPHKgNR/fhkzpTzbrJWw2fa0QvMy7413J3Sz5oTP9
	q9NqQOVt7ReF/qs8FxeOa0TAlCth5abU1I+QyJ3lfcxwJVCYEFjDn6c97gpBsd74BUKu
	dAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fQEJSnPMOj2jFIUNxCdudKoltxN816l6hqhSdTX3SUo=;
	b=T/HXnuMazztVbrG0sDWBVqb3DpNi9AMWCHP+zLDZmMnJZku4tDEBOr2oZXZ45Ivhmr
	WKJdKS72K0PCb3LFGsDqwrLwxg6HEmP8I0fggOvG4c+lxaB39gycP8/66zANnitQ1JZa
	csikDmPa5PS/7iZ2OhQec1OGuL4Zcs3VBQ//p8O0avlXmE/lVi4vG/jL/2E7PsQ2/9Lu
	EGxLJh6CJW0lXzBlWtR7cYUivDZVJ0ubehZ3K0dM3NuNVAt0qsNkmErWGbisXiN32eTe
	OCPwGj6nzIDTfazaB8cdjxrYANZEV3QbYp7N5CbwJig49Oyq82oIAVVcbQFEs53KJ4CX
	1cgA==
X-Gm-Message-State: APt69E1NZHNZWVJ4zSJm9CALpYdCFBe7AdO07eC065+dxnN6vSM5fDNK
	QHEWlGsyGTacga5fffjDkjza8w==
X-Google-Smtp-Source: ADUXVKK1H6zDvQbtvcrEp/p9M6Fm1POD8chthzrisRihqJxEOuairWiFEU0/gj0UQ8+yu9PNa7PCwg==
X-Received: by 2002:a65:611a:: with SMTP id
	z26-v6mr1197663pgu.61.1528959403176; 
	Wed, 13 Jun 2018 23:56:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	n68-v6sm8220209pfk.145.2018.06.13.23.56.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 23:56:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jun 2018 23:56:42 -0700
Message-Id: <20180614065642.15059-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180614065642.15059-1-raj.khem@gmail.com>
References: <20180614065642.15059-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] open-vm-tools: Upgrade to 10.2.5
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
X-List-Received-Date: Thu, 14 Jun 2018 06:56:44 -0000

Fix build on musl while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-configure.ac-don-t-use-dnet-config.patch |  17 +-
 ...include-poll.h-instead-of-sys-poll.h.patch |  26 +
 .../0002-Rename-poll.h-to-vm_poll.h.patch     | 115 +++
 ...oll.h-instead-of-obsolete-sys-poll.h.patch |  24 -
 .../0003-Rename-poll.h-to-vm_poll.h.patch     | 756 ------------------
 ...strerror_r-unless-on-gnu-libc-system.patch |  39 +
 ...04-Use-uintmax_t-for-handling-rlim_t.patch |  29 +
 ...-test-for-feature-instead-of-platfor.patch |  13 +-
 ...0008-use-posix-strerror_r-unless-gnu.patch |  30 -
 ...rt-for-building-with-system-libtirpc.patch | 342 --------
 .../open-vm-tools/0010-gnu-ucontext.patch     |  65 --
 .../fix-subdir-objects-configure-error.patch  |  12 +
 .../{files => open-vm-tools}/tools.conf       |   0
 .../open-vm-tools/use-tirpc.patch             | 481 +++++++++++
 .../{files => open-vm-tools}/vmtoolsd.init    |   0
 .../{files => open-vm-tools}/vmtoolsd.service |   0
 ...ools_10.1.5.bb => open-vm-tools_10.2.5.bb} |  20 +-
 17 files changed, 720 insertions(+), 1249 deletions(-)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-include-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-Rename-poll.h-to-vm_poll.h.patch
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Rename-poll.h-to-vm_poll.h.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Use-uintmax_t-for-handling-rlim_t.patch
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-use-posix-strerror_r-unless-gnu.patch
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Add-support-for-building-with-system-libtirpc.patch
 delete mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-gnu-ucontext.patch
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/fix-subdir-objects-configure-error.patch
 rename meta-oe/recipes-support/open-vm-tools/{files => open-vm-tools}/tools.conf (100%)
 create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/use-tirpc.patch
 rename meta-oe/recipes-support/open-vm-tools/{files => open-vm-tools}/vmtoolsd.init (100%)
 rename meta-oe/recipes-support/open-vm-tools/{files => open-vm-tools}/vmtoolsd.service (100%)
 rename meta-oe/recipes-support/open-vm-tools/{open-vm-tools_10.1.5.bb => open-vm-tools_10.2.5.bb} (87%)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
index e9cb873f1a..b7a4058352 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
@@ -14,11 +14,11 @@ Signed-off-by: Martin Kelly <mkelly@xevo.com>
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 3400b86..7d6119e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -942,7 +942,7 @@ if test "$with_dnet" = "yes"; then
+Index: open-vm-tools/configure.ac
+===================================================================
+--- open-vm-tools.orig/configure.ac
++++ open-vm-tools/configure.ac
+@@ -944,7 +944,7 @@ if test "$with_dnet" = "yes"; then
        AC_VMW_CHECK_LIB([dnet],
                         [DNET],
                         [],
@@ -27,15 +27,12 @@ index 3400b86..7d6119e 100644
                         [],
                         [dnet.h],
                         [intf_open],
-@@ -952,7 +952,7 @@ if test "$with_dnet" = "yes"; then
+@@ -954,7 +954,7 @@ if test "$with_dnet" = "yes"; then
  
     if test $have_dnet = "no"; then
  		AC_MSG_ERROR(
 -		   [dnet-config was not found on your PATH. Please configure without dnet (using --without-dnet) or install dnet - http://libdnet.sourceforge.net])
 +		   [dnet was not found. Please configure without dnet (using --without-dnet) or install dnet - http://libdnet.sourceforge.net])
- 	fi
+    fi
  fi
  
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-include-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-include-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000000..8820581198
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-include-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,26 @@
+From 4981bb3013d7f1e40e44618076d99af3484eedea Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jun 2018 23:02:50 -0700
+Subject: [PATCH] include poll.h instead of sys/poll.h
+
+including sys/poll.h is deprecated
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/asyncsocket/asyncsocket.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/asyncsocket/asyncsocket.c b/lib/asyncsocket/asyncsocket.c
+index 13908679..e0a68e7e 100644
+--- a/lib/asyncsocket/asyncsocket.c
++++ b/lib/asyncsocket/asyncsocket.c
+@@ -69,8 +69,8 @@
+ #else
+ #include <stddef.h>
+ #include <ctype.h>
++#include <poll.h>
+ #include <sys/types.h>
+-#include <sys/poll.h>
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ #include <netdb.h>
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-Rename-poll.h-to-vm_poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-Rename-poll.h-to-vm_poll.h.patch
new file mode 100644
index 0000000000..4d6a0fd6ad
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-Rename-poll.h-to-vm_poll.h.patch
@@ -0,0 +1,115 @@
+From 92955b3a6180b4285d11ef79766df01b9ab60dbd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jun 2018 23:11:58 -0700
+Subject: [PATCH] Rename poll.h to vm_poll.h
+
+musl libc's system headers pulls in open-vm-tools' poll.h. To avoid this
+we rename poll.h to vm_poll.h.
+
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/asyncsocket/asyncsocket.c                     | 2 +-
+ open-vm-tools/lib/hgfsServer/hgfsServer.c                       | 2 +-
+ open-vm-tools/lib/include/asyncsocket.h                         | 2 +-
+ open-vm-tools/lib/include/pollImpl.h                            | 2 +-
+ open-vm-tools/lib/include/{poll.h => vm_poll.h}                 | 2 +-
+ open-vm-tools/lib/rpcIn/rpcin.c                                 | 2 +-
+ .../services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c      | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+ rename open-vm-tools/lib/include/{poll.h => vm_poll.h} (99%)
+
+diff --git a/lib/asyncsocket/asyncsocket.c b/lib/asyncsocket/asyncsocket.c
+index e0a68e7e..b9675674 100644
+--- a/lib/asyncsocket/asyncsocket.c
++++ b/lib/asyncsocket/asyncsocket.c
+@@ -86,7 +86,7 @@
+ #include "random.h"
+ #include "asyncsocket.h"
+ #include "asyncSocketBase.h"
+-#include "poll.h"
++#include "vm_poll.h"
+ #include "log.h"
+ #include "err.h"
+ #include "hostinfo.h"
+diff --git a/lib/hgfsServer/hgfsServer.c b/lib/hgfsServer/hgfsServer.c
+index 991a7941..ed0c09f9 100644
+--- a/lib/hgfsServer/hgfsServer.c
++++ b/lib/hgfsServer/hgfsServer.c
+@@ -48,7 +48,7 @@
+ #include "hgfsServerOplock.h"
+ #include "hgfsDirNotify.h"
+ #include "userlock.h"
+-#include "poll.h"
++#include "vm_poll.h"
+ #include "mutexRankLib.h"
+ #include "vm_basic_asm.h"
+ #include "unicodeOperations.h"
+diff --git a/lib/include/asyncsocket.h b/lib/include/asyncsocket.h
+index 524147ea..103f944f 100644
+--- a/lib/include/asyncsocket.h
++++ b/lib/include/asyncsocket.h
+@@ -164,7 +164,7 @@ typedef struct AsyncSocket AsyncSocket;
+  * Or the client can specify its favorite poll class and locking behavior.
+  * Use of IVmdbPoll is only supported for regular sockets and for Attach.
+  */
+-#include "poll.h"
++#include "vm_poll.h"
+ struct IVmdbPoll;
+ typedef struct AsyncSocketPollParams {
+    int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
+diff --git a/lib/include/pollImpl.h b/lib/include/pollImpl.h
+index 46442e55..8bc66997 100644
+--- a/lib/include/pollImpl.h
++++ b/lib/include/pollImpl.h
+@@ -44,7 +44,7 @@
+ #define INCLUDE_ALLOW_USERLEVEL
+ #include "includeCheck.h"
+ 
+-#include "poll.h"
++#include "vm_poll.h"
+ #include "vm_basic_asm.h"
+ 
+ #if defined(__cplusplus)
+diff --git a/lib/include/poll.h b/lib/include/vm_poll.h
+similarity index 99%
+rename from open-vm-tools/lib/include/poll.h
+rename to open-vm-tools/lib/include/vm_poll.h
+index 988fe6d0..e9e74fb5 100644
+--- a/lib/include/poll.h
++++ b/lib/include/vm_poll.h
+@@ -60,7 +60,7 @@ extern "C" {
+ #if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
+ #include <sys/kernel.h>
+ #endif
+-#include <sys/poll.h>
++#include <poll.h>
+ #define HZ 100
+ #endif
+ #ifdef __ANDROID__
+diff --git a/lib/rpcIn/rpcin.c b/lib/rpcIn/rpcin.c
+index c2c51583..d6c62f10 100644
+--- a/lib/rpcIn/rpcin.c
++++ b/lib/rpcIn/rpcin.c
+@@ -57,7 +57,7 @@
+ 
+ #if defined(VMTOOLS_USE_VSOCKET)
+ #  include <glib.h>
+-#  include "poll.h"
++#  include "vm_poll.h"
+ #  include "asyncsocket.h"
+ #  include "vmci_defs.h"
+ #include "dataMap.h"
+diff --git a/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c b/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
+index 03700937..f0b49ad7 100644
+--- a/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
++++ b/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
+@@ -48,7 +48,7 @@
+ #include "rpcout.h"
+ #include "rabbitmqProxyConst.h"
+ #include "vm_basic_types.h"
+-#include "poll.h"
++#include "vm_poll.h"
+ #ifdef OPEN_VM_TOOLS
+ #include "vmci_sockets.h"
+ #include "sslDirect.h"
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch
deleted file mode 100644
index d26bf2dd30..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From d44c7c9de7380ad7b284231bd5b5c99b5c19758d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 16 Jul 2017 07:37:59 -0700
-Subject: [PATCH 02/11] include poll.h instead of obsolete sys/poll.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- open-vm-tools/lib/asyncsocket/asyncSocketInt.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: open-vm-tools/lib/asyncsocket/asyncSocketInt.h
-===================================================================
---- open-vm-tools.orig/lib/asyncsocket/asyncSocketInt.h
-+++ open-vm-tools/lib/asyncsocket/asyncSocketInt.h
-@@ -71,8 +71,8 @@
- #else
- #include <stddef.h>
- #include <ctype.h>
-+#include <poll.h>
- #include <sys/types.h>
--#include <sys/poll.h>
- #include <sys/socket.h>
- #include <sys/un.h>
- #include <netdb.h>
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Rename-poll.h-to-vm_poll.h.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Rename-poll.h-to-vm_poll.h.patch
deleted file mode 100644
index 8641778d0e..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-Rename-poll.h-to-vm_poll.h.patch
+++ /dev/null
@@ -1,756 +0,0 @@
-From 687fca20b3417ac885b6961e6fe1126d4a3fe7a4 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Tue, 17 Nov 2015 10:57:31 +0000
-Subject: [PATCH 03/11] Rename poll.h to vm_poll.h
-
-musl libc's system headers pulls in open-vm-tools' poll.h. To avoid this
-we rename poll.h to vm_poll.h.
-
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
----
- open-vm-tools/lib/asyncsocket/asyncsocket.c                          | 2 +-
- open-vm-tools/lib/hgfsServer/hgfsServer.c                            | 2 +-
- open-vm-tools/lib/include/asyncsocket.h                              | 2 +-
- open-vm-tools/lib/include/pollImpl.h                                 | 2 +-
- open-vm-tools/lib/include/{poll.h => vm_poll.h}                      | 0
- open-vm-tools/lib/rpcIn/rpcin.c                                      | 2 +-
- open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c | 2 +-
- 7 files changed, 6 insertions(+), 6 deletions(-)
- rename open-vm-tools/lib/include/{poll.h => vm_poll.h} (100%)
-
-Index: open-vm-tools/lib/asyncsocket/asyncsocket.c
-===================================================================
---- open-vm-tools.orig/lib/asyncsocket/asyncsocket.c
-+++ open-vm-tools/lib/asyncsocket/asyncsocket.c
-@@ -52,7 +52,7 @@
- #include "vmware.h"
- #include "asyncsocket.h"
- #include "asyncSocketInt.h"
--#include "poll.h"
-+#include "vm_poll.h"
- #include "log.h"
- #include "err.h"
- #include "hostinfo.h"
-Index: open-vm-tools/lib/hgfsServer/hgfsServer.c
-===================================================================
---- open-vm-tools.orig/lib/hgfsServer/hgfsServer.c
-+++ open-vm-tools/lib/hgfsServer/hgfsServer.c
-@@ -48,7 +48,7 @@
- #include "hgfsServerOplock.h"
- #include "hgfsDirNotify.h"
- #include "userlock.h"
--#include "poll.h"
-+#include "vm_poll.h"
- #include "mutexRankLib.h"
- #include "vm_basic_asm.h"
- #include "unicodeOperations.h"
-Index: open-vm-tools/lib/include/asyncsocket.h
-===================================================================
---- open-vm-tools.orig/lib/include/asyncsocket.h
-+++ open-vm-tools/lib/include/asyncsocket.h
-@@ -129,7 +129,7 @@ typedef struct AsyncSocket AsyncSocket;
-  * Or the client can specify its favorite poll class and locking behavior.
-  * Use of IVmdbPoll is only supported for regular sockets and for Attach.
-  */
--#include "poll.h"
-+#include "vm_poll.h"
- struct IVmdbPoll;
- typedef struct AsyncSocketPollParams {
-    int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
-Index: open-vm-tools/lib/include/poll.h
-===================================================================
---- open-vm-tools.orig/lib/include/poll.h
-+++ /dev/null
-@@ -1,324 +0,0 @@
--/*********************************************************
-- * Copyright (C) 1998-2016 VMware, Inc. All rights reserved.
-- *
-- * This program is free software; you can redistribute it and/or modify it
-- * under the terms of the GNU Lesser General Public License as published
-- * by the Free Software Foundation version 2.1 and no later version.
-- *
-- * This program is distributed in the hope that it will be useful, but
-- * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-- * or FITNESS FOR A PARTICULAR PURPOSE.  See the Lesser GNU General Public
-- * License for more details.
-- *
-- * You should have received a copy of the GNU Lesser General Public License
-- * along with this program; if not, write to the Free Software Foundation, Inc.,
-- * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA.
-- *
-- *********************************************************/
--
--/*********************************************************
-- * The contents of this file are subject to the terms of the Common
-- * Development and Distribution License (the "License") version 1.0
-- * and no later version.  You may not use this file except in
-- * compliance with the License.
-- *
-- * You can obtain a copy of the License at
-- *         http://www.opensource.org/licenses/cddl1.php
-- *
-- * See the License for the specific language governing permissions
-- * and limitations under the License.
-- *
-- *********************************************************/
--
--
--#ifndef _POLL_H_
--#define _POLL_H_
--
--#define INCLUDE_ALLOW_USERLEVEL
--#define INCLUDE_ALLOW_VMCORE
--#include "includeCheck.h"
--
--#include "vm_basic_types.h"
--#include "vm_basic_defs.h"
--#include "vmware.h"
--#include "userlock.h"
--
--#ifdef _WIN32
--#define HZ 100
--#elif defined linux
--#include <asm/param.h>
--#elif __APPLE__
--#include <TargetConditionals.h>
--/*
-- * Old SDKs don't define TARGET_OS_IPHONE at all.
-- * New ones define it to 0 on Mac OS X, 1 on iOS.
-- */
--#if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
--#include <sys/kernel.h>
--#endif
--#include <sys/poll.h>
--#define HZ 100
--#endif
--#ifdef __ANDROID__
--/*
-- * <poll.h> of android should be included, but its name is same
-- * with this file. So its content is put here to avoid conflict.
-- */
--#include <asm/poll.h>
--#define HZ 100
--typedef unsigned int  nfds_t;
--int poll(struct pollfd *, nfds_t, long);
--#endif
--
--
--/*
-- * Poll event types: each type has a different reason for firing,
-- * or condition that must be met before firing.
-- */
--
--typedef enum {
--   /*
--    * Actual Poll queue types against which you can register callbacks.
--    */
--   POLL_VIRTUALREALTIME = -1, /* Negative because it doesn't have its own Q */
--   POLL_VTIME = 0,
--   POLL_REALTIME,
--   POLL_DEVICE,
--   POLL_MAIN_LOOP,
--   POLL_NUM_QUEUES
--} PollEventType;
--
--
--/*
-- * Classes of events
-- *
-- * These are the predefined classes.  More can be declared
-- * with Poll_AllocClass().
-- */
--
--typedef enum PollClass {
--   POLL_CLASS_MAIN,
--   POLL_CLASS_PAUSE,
--   POLL_CLASS_IPC,
--   POLL_CLASS_CPT,
--   POLL_CLASS_MKS,
--   POLL_FIXED_CLASSES,
--   POLL_MAX_CLASSES = 320 /* Size enum to maximum */
--} PollClass;
--
--
--/*
-- * Each callback is registered in a set of classes
-- */
--
--typedef struct PollClassSet {
--   /* Type is uintptr_t to give best 32/64-bit code. */
--#define _POLL_ELEMSIZE (sizeof (uintptr_t) * 8)
--   uintptr_t bits[CEILING(POLL_MAX_CLASSES, _POLL_ELEMSIZE)];
--} PollClassSet;
--
--/* An empty PollClassSet. */
--static INLINE PollClassSet
--PollClassSet_Empty(void)
--{
--   PollClassSet set = { { 0 } };
--   return set;
--}
--
--/* A PollClassSet with the single member. */
--static INLINE PollClassSet
--PollClassSet_Singleton(PollClass c)
--{
--   PollClassSet s = PollClassSet_Empty();
--
--   ASSERT_ON_COMPILE(sizeof s.bits[0] * 8 == _POLL_ELEMSIZE); /* Size correct */
--   ASSERT_ON_COMPILE((_POLL_ELEMSIZE & (_POLL_ELEMSIZE - 1)) == 0); /* power of 2 */
--   ASSERT_ON_COMPILE(POLL_MAX_CLASSES <= ARRAYSIZE(s.bits) * _POLL_ELEMSIZE);
--   ASSERT(c < POLL_MAX_CLASSES);
--
--   s.bits[c / _POLL_ELEMSIZE] = CONST3264U(1) << (c % _POLL_ELEMSIZE);
--   return s;
--}
--
--/* Combine two PollClassSets. */
--static INLINE PollClassSet
--PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
--{
--   PollClassSet u;
--   unsigned i;
--
--   for (i = 0; i < ARRAYSIZE(u.bits); i++) {
--      u.bits[i] = lhs.bits[i] | rhs.bits[i];
--   }
--   return u;
--}
--
--/* Add single class to PollClassSet. */
--static INLINE PollClassSet
--PollClassSet_Include(PollClassSet set, PollClass c)
--{
--   return PollClassSet_Union(set, PollClassSet_Singleton(c));
--}
--
--
--#define POLL_CS_MAIN    PollClassSet_Singleton(POLL_CLASS_MAIN)
--#define POLL_CS_PAUSE   PollClassSet_Union(POLL_CS_MAIN,            \
--                           PollClassSet_Singleton(POLL_CLASS_PAUSE))
--#define POLL_CS_CPT     PollClassSet_Union(POLL_CS_PAUSE,           \
--                           PollClassSet_Singleton(POLL_CLASS_CPT))
--#define POLL_CS_IPC     PollClassSet_Union(POLL_CS_CPT,             \
--                           PollClassSet_Singleton(POLL_CLASS_IPC))
--#define POLL_CS_VMDB    POLL_CS_PAUSE /* POLL_CLASS_VMDB is retired */
--#define POLL_CS_MKS	PollClassSet_Singleton(POLL_CLASS_MKS)
--/* 
-- * DANGER.  You don't need POLL_CS_ALWAYS.  Really.  So don't use it.
-- */
--#define POLL_CS_ALWAYS  PollClassSet_Union(POLL_CS_CPT, POLL_CS_IPC)
--
--/*
-- * Poll class-set taxonomy:
-- * POLL_CS_MAIN
-- *    - Unless you NEED another class, use POLL_CS_MAIN.
-- * POLL_CS_PAUSE
-- *    - For callbacks that must occur even if the guest is paused.
-- *      Most VMDB or Foundry commands are in this category.
-- * POLL_CS_CPT
-- *    - Only for callbacks which can trigger intermediate Checkpoint 
-- *      transitions.
-- *      The ONLY such callback is Migrate.
-- * POLL_CS_IPC
-- *    - Only for callbacks which can contain Msg_(Post|Hint|Question) 
-- *      responses, and for signal handlers (why)?
-- *      Vigor, VMDB, and Foundry can contain Msg_* responses.
-- * POLL_CS_MKS
-- *    - Callback runs in MKS thread.
-- * POLL_CS_ALWAYS
-- *    - Only for events that must be processed immediately.
-- *      The ONLY such callback is OvhdMemVmxSizeCheck.
-- */
--
--
--/*
-- * Poll_Callback flags
-- */
--
--#define POLL_FLAG_PERIODIC		0x01    // keep after firing
--#define POLL_FLAG_REMOVE_AT_POWEROFF	0x02  	// self-explanatory
--#define POLL_FLAG_READ			0x04	// device is ready for reading
--#define POLL_FLAG_WRITE			0x08	// device is ready for writing
--#define POLL_FLAG_SOCKET                0x10    // device is a Windows socket
--#define POLL_FLAG_NO_BULL               0x20    // callback does its own locking
--#define POLL_FLAG_WINSOCK               0x40    // Winsock style write events
--#define POLL_FLAG_FD                    0x80    // device is a Windows file descriptor.
--#define POLL_FLAG_ACCEPT_INVALID_FDS    0x100   // For broken 3rd party libs, e.g. curl
--#define POLL_FLAG_THUNK_TO_WND          0x200   // thunk callback to window message loop
--
--
--/*
-- * Advisory minimum time period.
-- * Users that want the fastest running real-time poll
-- * should use TICKS_TO_USECS(1).
-- */
--
--#define TICKS_TO_USECS(_x) ((_x) * (1000000 / HZ))
--#define USECS_TO_TICKS(_x) ((_x) / (1000000 / HZ))
--
--
--typedef void (*PollerFunction)(void *clientData);
--typedef void (*PollerFireWrapper)(PollerFunction func,
--                                  void *funcData,
--                                  void *wrapperData);
--typedef Bool (*PollerErrorFn)(const char *errorStr);
--
--/*
-- * Initialisers:
-- *
-- *      For the sake of convenience, we declare the initialisers
-- *      for custom implmentations here, even though the actual
-- *      implementations are distinct from the core poll code.
-- */
--
--typedef struct PollOptions {
--   Bool locked;           // Use internal MXUser for locking
--   Bool allowFullQueue;   // Don't assert when device event queue is full.
--   VThreadID windowsMsgThread;       // thread that processes Windows messages
--   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
--   void *fireWrapperData; // optional
--   PollerErrorFn errorFn; // optional; called upon unrecoverable error
--} PollOptions;
--
--
--void Poll_InitDefault(void);
--void Poll_InitDefaultEx(const PollOptions *opts);
--void Poll_InitGtk(void); // On top of glib for Linux
--void Poll_InitCF(void);  // On top of CoreFoundation for OSX
--
--
--/*
-- * Functions
-- */
--int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
--void Poll_Loop(Bool loop, Bool *exit, PollClass c);
--void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
--Bool Poll_LockingEnabled(void);
--void Poll_Exit(void);
--
--
--/*
-- * Poll_Callback adds a callback regardless of whether an identical one exists.
-- *
-- * Likewise, Poll_CallbackRemove removes exactly one callback.
-- */
--
--VMwareStatus Poll_Callback(PollClassSet classSet,
--                           int flags,
--                           PollerFunction f,
--                           void *clientData,
--                           PollEventType type,
--                           PollDevHandle info, // fd/microsec delay
--                           MXUserRecLock *lck);
--Bool Poll_CallbackRemove(PollClassSet classSet,
--                         int flags,
--                         PollerFunction f,
--                         void *clientData,
--                         PollEventType type);
--Bool Poll_CallbackRemoveOneByCB(PollClassSet classSet,
--                                int flags,
--                                PollerFunction f,
--                                PollEventType type,
--                                void **clientData);
--
--void Poll_NotifyChange(PollClassSet classSet);
--
--/*
-- * Wrappers for Poll_Callback and Poll_CallbackRemove that present
-- * simpler subsets of those interfaces.
-- */
--
--VMwareStatus Poll_CB_Device(PollerFunction f,
--                            void *clientData,
--                            PollDevHandle device,
--                            Bool periodic);
--
--Bool Poll_CB_DeviceRemove(PollerFunction f,
--                          void *clientData,
--                          Bool periodic);
--
--
--VMwareStatus Poll_CB_RTime(PollerFunction f,
--                           void *clientData,
--                           int delay,	// microseconds
--                           Bool periodic,
--                           MXUserRecLock *lock);
--
--Bool Poll_CB_RTimeRemove(PollerFunction f,
--                         void *clientData,
--                         Bool periodic);
--
--
--#ifdef _WIN32
--void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
--Bool Poll_FireWndCallback(void *lparam);
--#endif
--
--#endif // _POLL_H_
-Index: open-vm-tools/lib/include/pollImpl.h
-===================================================================
---- open-vm-tools.orig/lib/include/pollImpl.h
-+++ open-vm-tools/lib/include/pollImpl.h
-@@ -44,7 +44,7 @@
- #define INCLUDE_ALLOW_USERLEVEL
- #include "includeCheck.h"
- 
--#include "poll.h"
-+#include "vm_poll.h"
- 
- /*
-  * PollImpl:
-Index: open-vm-tools/lib/include/vm_poll.h
-===================================================================
---- /dev/null
-+++ open-vm-tools/lib/include/vm_poll.h
-@@ -0,0 +1,324 @@
-+/*********************************************************
-+ * Copyright (C) 1998-2016 VMware, Inc. All rights reserved.
-+ *
-+ * This program is free software; you can redistribute it and/or modify it
-+ * under the terms of the GNU Lesser General Public License as published
-+ * by the Free Software Foundation version 2.1 and no later version.
-+ *
-+ * This program is distributed in the hope that it will be useful, but
-+ * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-+ * or FITNESS FOR A PARTICULAR PURPOSE.  See the Lesser GNU General Public
-+ * License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public License
-+ * along with this program; if not, write to the Free Software Foundation, Inc.,
-+ * 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA.
-+ *
-+ *********************************************************/
-+
-+/*********************************************************
-+ * The contents of this file are subject to the terms of the Common
-+ * Development and Distribution License (the "License") version 1.0
-+ * and no later version.  You may not use this file except in
-+ * compliance with the License.
-+ *
-+ * You can obtain a copy of the License at
-+ *         http://www.opensource.org/licenses/cddl1.php
-+ *
-+ * See the License for the specific language governing permissions
-+ * and limitations under the License.
-+ *
-+ *********************************************************/
-+
-+
-+#ifndef _POLL_H_
-+#define _POLL_H_
-+
-+#define INCLUDE_ALLOW_USERLEVEL
-+#define INCLUDE_ALLOW_VMCORE
-+#include "includeCheck.h"
-+
-+#include "vm_basic_types.h"
-+#include "vm_basic_defs.h"
-+#include "vmware.h"
-+#include "userlock.h"
-+
-+#ifdef _WIN32
-+#define HZ 100
-+#elif defined linux
-+#include <asm/param.h>
-+#elif __APPLE__
-+#include <TargetConditionals.h>
-+/*
-+ * Old SDKs don't define TARGET_OS_IPHONE at all.
-+ * New ones define it to 0 on Mac OS X, 1 on iOS.
-+ */
-+#if !defined(TARGET_OS_IPHONE) || TARGET_OS_IPHONE == 0
-+#include <sys/kernel.h>
-+#endif
-+#include <sys/poll.h>
-+#define HZ 100
-+#endif
-+#ifdef __ANDROID__
-+/*
-+ * <poll.h> of android should be included, but its name is same
-+ * with this file. So its content is put here to avoid conflict.
-+ */
-+#include <asm/poll.h>
-+#define HZ 100
-+typedef unsigned int  nfds_t;
-+int poll(struct pollfd *, nfds_t, long);
-+#endif
-+
-+
-+/*
-+ * Poll event types: each type has a different reason for firing,
-+ * or condition that must be met before firing.
-+ */
-+
-+typedef enum {
-+   /*
-+    * Actual Poll queue types against which you can register callbacks.
-+    */
-+   POLL_VIRTUALREALTIME = -1, /* Negative because it doesn't have its own Q */
-+   POLL_VTIME = 0,
-+   POLL_REALTIME,
-+   POLL_DEVICE,
-+   POLL_MAIN_LOOP,
-+   POLL_NUM_QUEUES
-+} PollEventType;
-+
-+
-+/*
-+ * Classes of events
-+ *
-+ * These are the predefined classes.  More can be declared
-+ * with Poll_AllocClass().
-+ */
-+
-+typedef enum PollClass {
-+   POLL_CLASS_MAIN,
-+   POLL_CLASS_PAUSE,
-+   POLL_CLASS_IPC,
-+   POLL_CLASS_CPT,
-+   POLL_CLASS_MKS,
-+   POLL_FIXED_CLASSES,
-+   POLL_MAX_CLASSES = 320 /* Size enum to maximum */
-+} PollClass;
-+
-+
-+/*
-+ * Each callback is registered in a set of classes
-+ */
-+
-+typedef struct PollClassSet {
-+   /* Type is uintptr_t to give best 32/64-bit code. */
-+#define _POLL_ELEMSIZE (sizeof (uintptr_t) * 8)
-+   uintptr_t bits[CEILING(POLL_MAX_CLASSES, _POLL_ELEMSIZE)];
-+} PollClassSet;
-+
-+/* An empty PollClassSet. */
-+static INLINE PollClassSet
-+PollClassSet_Empty(void)
-+{
-+   PollClassSet set = { { 0 } };
-+   return set;
-+}
-+
-+/* A PollClassSet with the single member. */
-+static INLINE PollClassSet
-+PollClassSet_Singleton(PollClass c)
-+{
-+   PollClassSet s = PollClassSet_Empty();
-+
-+   ASSERT_ON_COMPILE(sizeof s.bits[0] * 8 == _POLL_ELEMSIZE); /* Size correct */
-+   ASSERT_ON_COMPILE((_POLL_ELEMSIZE & (_POLL_ELEMSIZE - 1)) == 0); /* power of 2 */
-+   ASSERT_ON_COMPILE(POLL_MAX_CLASSES <= ARRAYSIZE(s.bits) * _POLL_ELEMSIZE);
-+   ASSERT(c < POLL_MAX_CLASSES);
-+
-+   s.bits[c / _POLL_ELEMSIZE] = CONST3264U(1) << (c % _POLL_ELEMSIZE);
-+   return s;
-+}
-+
-+/* Combine two PollClassSets. */
-+static INLINE PollClassSet
-+PollClassSet_Union(PollClassSet lhs, PollClassSet rhs)
-+{
-+   PollClassSet u;
-+   unsigned i;
-+
-+   for (i = 0; i < ARRAYSIZE(u.bits); i++) {
-+      u.bits[i] = lhs.bits[i] | rhs.bits[i];
-+   }
-+   return u;
-+}
-+
-+/* Add single class to PollClassSet. */
-+static INLINE PollClassSet
-+PollClassSet_Include(PollClassSet set, PollClass c)
-+{
-+   return PollClassSet_Union(set, PollClassSet_Singleton(c));
-+}
-+
-+
-+#define POLL_CS_MAIN    PollClassSet_Singleton(POLL_CLASS_MAIN)
-+#define POLL_CS_PAUSE   PollClassSet_Union(POLL_CS_MAIN,            \
-+                           PollClassSet_Singleton(POLL_CLASS_PAUSE))
-+#define POLL_CS_CPT     PollClassSet_Union(POLL_CS_PAUSE,           \
-+                           PollClassSet_Singleton(POLL_CLASS_CPT))
-+#define POLL_CS_IPC     PollClassSet_Union(POLL_CS_CPT,             \
-+                           PollClassSet_Singleton(POLL_CLASS_IPC))
-+#define POLL_CS_VMDB    POLL_CS_PAUSE /* POLL_CLASS_VMDB is retired */
-+#define POLL_CS_MKS	PollClassSet_Singleton(POLL_CLASS_MKS)
-+/* 
-+ * DANGER.  You don't need POLL_CS_ALWAYS.  Really.  So don't use it.
-+ */
-+#define POLL_CS_ALWAYS  PollClassSet_Union(POLL_CS_CPT, POLL_CS_IPC)
-+
-+/*
-+ * Poll class-set taxonomy:
-+ * POLL_CS_MAIN
-+ *    - Unless you NEED another class, use POLL_CS_MAIN.
-+ * POLL_CS_PAUSE
-+ *    - For callbacks that must occur even if the guest is paused.
-+ *      Most VMDB or Foundry commands are in this category.
-+ * POLL_CS_CPT
-+ *    - Only for callbacks which can trigger intermediate Checkpoint 
-+ *      transitions.
-+ *      The ONLY such callback is Migrate.
-+ * POLL_CS_IPC
-+ *    - Only for callbacks which can contain Msg_(Post|Hint|Question) 
-+ *      responses, and for signal handlers (why)?
-+ *      Vigor, VMDB, and Foundry can contain Msg_* responses.
-+ * POLL_CS_MKS
-+ *    - Callback runs in MKS thread.
-+ * POLL_CS_ALWAYS
-+ *    - Only for events that must be processed immediately.
-+ *      The ONLY such callback is OvhdMemVmxSizeCheck.
-+ */
-+
-+
-+/*
-+ * Poll_Callback flags
-+ */
-+
-+#define POLL_FLAG_PERIODIC		0x01    // keep after firing
-+#define POLL_FLAG_REMOVE_AT_POWEROFF	0x02  	// self-explanatory
-+#define POLL_FLAG_READ			0x04	// device is ready for reading
-+#define POLL_FLAG_WRITE			0x08	// device is ready for writing
-+#define POLL_FLAG_SOCKET                0x10    // device is a Windows socket
-+#define POLL_FLAG_NO_BULL               0x20    // callback does its own locking
-+#define POLL_FLAG_WINSOCK               0x40    // Winsock style write events
-+#define POLL_FLAG_FD                    0x80    // device is a Windows file descriptor.
-+#define POLL_FLAG_ACCEPT_INVALID_FDS    0x100   // For broken 3rd party libs, e.g. curl
-+#define POLL_FLAG_THUNK_TO_WND          0x200   // thunk callback to window message loop
-+
-+
-+/*
-+ * Advisory minimum time period.
-+ * Users that want the fastest running real-time poll
-+ * should use TICKS_TO_USECS(1).
-+ */
-+
-+#define TICKS_TO_USECS(_x) ((_x) * (1000000 / HZ))
-+#define USECS_TO_TICKS(_x) ((_x) / (1000000 / HZ))
-+
-+
-+typedef void (*PollerFunction)(void *clientData);
-+typedef void (*PollerFireWrapper)(PollerFunction func,
-+                                  void *funcData,
-+                                  void *wrapperData);
-+typedef Bool (*PollerErrorFn)(const char *errorStr);
-+
-+/*
-+ * Initialisers:
-+ *
-+ *      For the sake of convenience, we declare the initialisers
-+ *      for custom implmentations here, even though the actual
-+ *      implementations are distinct from the core poll code.
-+ */
-+
-+typedef struct PollOptions {
-+   Bool locked;           // Use internal MXUser for locking
-+   Bool allowFullQueue;   // Don't assert when device event queue is full.
-+   VThreadID windowsMsgThread;       // thread that processes Windows messages
-+   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
-+   void *fireWrapperData; // optional
-+   PollerErrorFn errorFn; // optional; called upon unrecoverable error
-+} PollOptions;
-+
-+
-+void Poll_InitDefault(void);
-+void Poll_InitDefaultEx(const PollOptions *opts);
-+void Poll_InitGtk(void); // On top of glib for Linux
-+void Poll_InitCF(void);  // On top of CoreFoundation for OSX
-+
-+
-+/*
-+ * Functions
-+ */
-+int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
-+void Poll_Loop(Bool loop, Bool *exit, PollClass c);
-+void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
-+Bool Poll_LockingEnabled(void);
-+void Poll_Exit(void);
-+
-+
-+/*
-+ * Poll_Callback adds a callback regardless of whether an identical one exists.
-+ *
-+ * Likewise, Poll_CallbackRemove removes exactly one callback.
-+ */
-+
-+VMwareStatus Poll_Callback(PollClassSet classSet,
-+                           int flags,
-+                           PollerFunction f,
-+                           void *clientData,
-+                           PollEventType type,
-+                           PollDevHandle info, // fd/microsec delay
-+                           MXUserRecLock *lck);
-+Bool Poll_CallbackRemove(PollClassSet classSet,
-+                         int flags,
-+                         PollerFunction f,
-+                         void *clientData,
-+                         PollEventType type);
-+Bool Poll_CallbackRemoveOneByCB(PollClassSet classSet,
-+                                int flags,
-+                                PollerFunction f,
-+                                PollEventType type,
-+                                void **clientData);
-+
-+void Poll_NotifyChange(PollClassSet classSet);
-+
-+/*
-+ * Wrappers for Poll_Callback and Poll_CallbackRemove that present
-+ * simpler subsets of those interfaces.
-+ */
-+
-+VMwareStatus Poll_CB_Device(PollerFunction f,
-+                            void *clientData,
-+                            PollDevHandle device,
-+                            Bool periodic);
-+
-+Bool Poll_CB_DeviceRemove(PollerFunction f,
-+                          void *clientData,
-+                          Bool periodic);
-+
-+
-+VMwareStatus Poll_CB_RTime(PollerFunction f,
-+                           void *clientData,
-+                           int delay,	// microseconds
-+                           Bool periodic,
-+                           MXUserRecLock *lock);
-+
-+Bool Poll_CB_RTimeRemove(PollerFunction f,
-+                         void *clientData,
-+                         Bool periodic);
-+
-+
-+#ifdef _WIN32
-+void Poll_SetWindowMessageRecipient(HWND hWnd, UINT msg, Bool alwaysThunk);
-+Bool Poll_FireWndCallback(void *lparam);
-+#endif
-+
-+#endif // _POLL_H_
-Index: open-vm-tools/lib/rpcIn/rpcin.c
-===================================================================
---- open-vm-tools.orig/lib/rpcIn/rpcin.c
-+++ open-vm-tools/lib/rpcIn/rpcin.c
-@@ -57,7 +57,7 @@
- 
- #if defined(VMTOOLS_USE_VSOCKET)
- #  include <glib.h>
--#  include "poll.h"
-+#  include "vm_poll.h"
- #  include "asyncsocket.h"
- #  include "vmci_defs.h"
- #include "dataMap.h"
-Index: open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
-===================================================================
---- open-vm-tools.orig/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
-+++ open-vm-tools/services/plugins/grabbitmqProxy/grabbitmqProxyPlugin.c
-@@ -48,7 +48,7 @@
- #include "rpcout.h"
- #include "rabbitmqProxyConst.h"
- #include "vm_basic_types.h"
--#include "poll.h"
-+#include "vm_poll.h"
- #ifdef OPEN_VM_TOOLS
- #include "vmci_sockets.h"
- #include "sslDirect.h"
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch
new file mode 100644
index 0000000000..c7d34c5cfa
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch
@@ -0,0 +1,39 @@
+From a2e7d9273261c5c5cbc33796900f415097f5455e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jun 2018 23:16:53 -0700
+Subject: [PATCH] use posix strerror_r unless on gnu libc system
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/err/errPosix.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/lib/err/errPosix.c b/lib/err/errPosix.c
+index c81b4c13..7a403640 100644
+--- a/lib/err/errPosix.c
++++ b/lib/err/errPosix.c
+@@ -31,6 +31,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <locale.h>
++#include <stdio.h>
+ 
+ #include "vmware.h"
+ #include "errInt.h"
+@@ -63,11 +64,13 @@ ErrErrno2String(Err_Number errorNumber, // IN
+ {
+    char *p;
+ 
+-#if defined(__linux__) && !defined(__ANDROID__)
++#if defined(__GLIBC__) && !defined(__ANDROID__)
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
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Use-uintmax_t-for-handling-rlim_t.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Use-uintmax_t-for-handling-rlim_t.patch
new file mode 100644
index 0000000000..e802dca4eb
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0004-Use-uintmax_t-for-handling-rlim_t.patch
@@ -0,0 +1,29 @@
+From e694a122c1ff32d8b951ae55756796f9576d23ed Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jun 2018 23:37:09 -0700
+Subject: [PATCH] Use uintmax_t for handling rlim_t
+
+rlimit types are not representable with long or long long
+formats, therefore use uintmax_t to typecast rlim_t types
+and use %j to print it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/hgfsServer/hgfsServerLinux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/hgfsServer/hgfsServerLinux.c b/lib/hgfsServer/hgfsServerLinux.c
+index 2e73707d..a2fdb850 100644
+--- a/lib/hgfsServer/hgfsServerLinux.c
++++ b/lib/hgfsServer/hgfsServerLinux.c
+@@ -5294,8 +5294,8 @@ HgfsWriteCheckIORange(off_t offset,         // IN:
+       goto exit;
+    }
+ 
+-   LOG(6, ("%s: File Size limits: 0x%"FMT64"x 0x%"FMT64"x\n",
+-           __FUNCTION__, fileSize.rlim_cur, fileSize.rlim_max));
++   LOG(6, ("%s: File Size limits: 0x%jx 0x%jx\n",
++           __FUNCTION__, (uintmax_t)fileSize.rlim_cur, (uintmax_t)fileSize.rlim_max));
+ 
+    /*
+     * Check the offset is within the file size range.
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
index 5adf9b0f90..ad19fb24b9 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -29,7 +29,7 @@ Index: open-vm-tools/configure.ac
 ===================================================================
 --- open-vm-tools.orig/configure.ac
 +++ open-vm-tools/configure.ac
-@@ -798,6 +798,7 @@ AC_CHECK_FUNCS(
+@@ -892,6 +892,7 @@ AC_CHECK_FUNCS(
  
  AC_CHECK_FUNCS([ecvt])
  AC_CHECK_FUNCS([fcvt])
@@ -37,7 +37,7 @@ Index: open-vm-tools/configure.ac
  
  AC_CHECK_FUNC([mkdtemp], [have_mkdtemp=yes])
  
-@@ -1063,10 +1064,13 @@ AC_PATH_PROG(
+@@ -1076,10 +1077,13 @@ AC_PATH_PROG(
  ###
  
  AC_CHECK_HEADERS([crypt.h])
@@ -133,12 +133,3 @@ Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
  # include <net/if.h>
  #endif
  #ifndef NO_DNET
-@@ -348,7 +352,7 @@ GuestInfoGetNicInfo(NicInfoV3 *nicInfo)
-  *
-  ******************************************************************************
-  */
--#if defined(__FreeBSD__) || defined(__APPLE__) || defined(USERWORLD)
-+#if defined(NO_DNET) && defined(HAVE_GETIFADDRS)
- 
- char *
- GuestInfoGetPrimaryIP(void)
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-use-posix-strerror_r-unless-gnu.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-use-posix-strerror_r-unless-gnu.patch
deleted file mode 100644
index 3d1291c9fa..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0008-use-posix-strerror_r-unless-gnu.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d4d1e7146ca2698089f6bd532f2fb8b9c1134ca7 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Mon, 2 Jan 2017 14:39:27 +0000
-Subject: [PATCH 08/11] use posix strerror_r unless gnu
-
----
- open-vm-tools/lib/err/errPosix.c | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-Index: open-vm-tools/lib/err/errPosix.c
-===================================================================
---- open-vm-tools.orig/lib/err/errPosix.c
-+++ open-vm-tools/lib/err/errPosix.c
-@@ -63,11 +63,13 @@ ErrErrno2String(Err_Number errorNumber,
- {
-    char *p;
- 
--#if defined(linux) && !defined(N_PLAT_NLM) && !defined(__ANDROID__)
-+#if defined(__GLIBC__)
-    p = strerror_r(errorNumber, buf, bufSize);
- #else
--   p = strerror(errorNumber);
--#endif
-+   if (strerror_r(errorNumber, buf, bufSize) != 0)
-+      snprintf(buf, bufSize, "unknown error %i", errorNumber);
-+   p = buf;
-+#endif /* defined __GLIBC__ */
-    ASSERT(p != NULL);
-    return p;
- }
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Add-support-for-building-with-system-libtirpc.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Add-support-for-building-with-system-libtirpc.patch
deleted file mode 100644
index 2bee5ac821..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0009-Add-support-for-building-with-system-libtirpc.patch
+++ /dev/null
@@ -1,342 +0,0 @@
-From 5ae6c662fefa621f4600559e299a7d97c2254e69 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Sun, 16 Jul 2017 10:20:10 -0700
-Subject: [PATCH 1/3] Add support for building with system libtirpc
-
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- open-vm-tools/configure.ac                               | 14 ++++++++++++++
- open-vm-tools/lib/dynxdr/Makefile.am                     |  8 ++++++--
- open-vm-tools/lib/err/errPosix.c                         |  1 +
- open-vm-tools/lib/guestRpc/Makefile.am                   |  6 ++++++
- open-vm-tools/lib/misc/Makefile.am                       |  1 +
- open-vm-tools/lib/netUtil/Makefile.am                    |  4 ++++
- open-vm-tools/lib/nicInfo/Makefile.am                    |  2 ++
- open-vm-tools/lib/rpcChannel/Makefile.am                 |  4 ++++
- open-vm-tools/lib/slashProc/Makefile.am                  |  4 ++++
- open-vm-tools/lib/string/bsd_output_shared.c             |  2 +-
- open-vm-tools/libguestlib/Makefile.am                    |  2 ++
- open-vm-tools/rpctool/Makefile.am                        |  3 +++
- open-vm-tools/rpctool/rpctool.c                          |  2 ++
- open-vm-tools/services/plugins/dndcp/Makefile.am         |  2 ++
- open-vm-tools/services/plugins/guestInfo/Makefile.am     |  1 +
- open-vm-tools/services/plugins/resolutionSet/Makefile.am |  2 ++
- open-vm-tools/services/plugins/vix/Makefile.am           |  2 ++
- open-vm-tools/services/plugins/vmbackup/Makefile.am      |  2 ++
- open-vm-tools/toolbox/Makefile.am                        |  2 ++
- 19 files changed, 61 insertions(+), 3 deletions(-)
-
-Index: open-vm-tools/configure.ac
-===================================================================
---- open-vm-tools.orig/configure.ac
-+++ open-vm-tools/configure.ac
-@@ -405,6 +405,20 @@ AC_VMW_CHECK_LIB([fuse],
-                   AC_MSG_WARN([Fuse is missing, vmblock-fuse/vmhgfs-fuse will be disabled.])])
- 
- #
-+# Check for libtirpc
-+#
-+AC_VMW_CHECK_LIB([libtirpc],
-+                 [LIBTIRPC],
-+                 [libtirpc],
-+                 [],
-+                 [],
-+                 [rpc/xdr.h],
-+                 [xdr_void],
-+                 [have_libtirpc=yes],
-+                 [have_libtitirpc=no;
-+                  AC_MSG_WARN([libtirpc is missing.])])
-+
-+#
- # Check for PAM.
- #
- AC_ARG_WITH([pam],
-Index: open-vm-tools/lib/dynxdr/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/dynxdr/Makefile.am
-+++ open-vm-tools/lib/dynxdr/Makefile.am
-@@ -17,7 +17,11 @@
- 
- noinst_LTLIBRARIES = libDynxdr.la
- 
--libDynxdr_la_SOURCES = 
-+libDynxdr_la_SOURCES =
- libDynxdr_la_SOURCES += dynxdr.c
- libDynxdr_la_SOURCES += xdrutil.c
--libDynxdr_la_CPPFLAGS = -Wno-incompatible-pointer-types
-+libDynxdr_la_CPPFLAGS = @LIBTIRPC_CPPFLAGS@ -Wno-incompatible-pointer-types
-+
-+libDynxdr_la_LIBADD =
-+libDynxdr_la_LIBADD += @LIBTIRPC_LIBS@
-+
-Index: open-vm-tools/lib/err/errPosix.c
-===================================================================
---- open-vm-tools.orig/lib/err/errPosix.c
-+++ open-vm-tools/lib/err/errPosix.c
-@@ -31,6 +31,7 @@
- #include <errno.h>
- #include <string.h>
- #include <locale.h>
-+#include <stdio.h>
- 
- #include "vmware.h"
- #include "errInt.h"
-Index: open-vm-tools/lib/guestRpc/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/guestRpc/Makefile.am
-+++ open-vm-tools/lib/guestRpc/Makefile.am
-@@ -20,6 +20,12 @@ noinst_LTLIBRARIES = libGuestRpc.la
- libGuestRpc_la_SOURCES =
- libGuestRpc_la_SOURCES += nicinfo_xdr.c
- 
-+libGuestRpc_la_CPPFLAGS =
-+libGuestRpc_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
-+
-+libGuestRpc_la_LIBADD =
-+libGuestRpc_la_LIBADD += @LIBTIRPC_LIBS@
-+
- # XXX: Autoreconf complains about this and recommends using AM_CFLAGS instead.
- # Problem is, $(CFLAGS) is appended to the compiler command line after AM_CFLAGS
- # and after libGuestRpc_la_CFLAGS, so "-Wall -Werror" will override this flag.
-Index: open-vm-tools/lib/misc/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/misc/Makefile.am
-+++ open-vm-tools/lib/misc/Makefile.am
-@@ -52,4 +52,5 @@ libMisc_la_SOURCES += utilMem.c
- libMisc_la_SOURCES += vmstdio.c
- libMisc_la_SOURCES += strutil.c
- libMisc_la_SOURCES += vthreadBase.c
-+libMisc_la_CPPFLAGS = -Wno-error=int-conversion
- 
-Index: open-vm-tools/lib/netUtil/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/netUtil/Makefile.am
-+++ open-vm-tools/lib/netUtil/Makefile.am
-@@ -20,3 +20,7 @@ noinst_LTLIBRARIES = libNetUtil.la
- libNetUtil_la_SOURCES =
- libNetUtil_la_SOURCES += netUtilLinux.c
- 
-+libNetUtil_la_CPPFLAGS =
-+libNetUtil_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
-+
-+libNetUtil_la_LIBADD = @LIBTIRPC_LIBS@
-Index: open-vm-tools/lib/nicInfo/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/nicInfo/Makefile.am
-+++ open-vm-tools/lib/nicInfo/Makefile.am
-@@ -25,12 +25,14 @@ libNicInfo_la_SOURCES += nicInfoPosix.c
- 
- libNicInfo_la_CPPFLAGS =
- libNicInfo_la_CPPFLAGS += @GLIB2_CPPFLAGS@
-+libNicInfo_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
- 
- AM_CFLAGS = $(DNET_CPPFLAGS)
- if USE_SLASH_PROC
- AM_CFLAGS += -DUSE_SLASH_PROC
- endif
- libNicInfo_la_LIBADD =
-+libNicInfo_la_LIBADD += @LIBTIRPC_LIBS@
- if HAVE_DNET
-    libNicInfo_la_LIBADD += @DNET_LIBS@
- endif
-Index: open-vm-tools/lib/rpcChannel/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/rpcChannel/Makefile.am
-+++ open-vm-tools/lib/rpcChannel/Makefile.am
-@@ -27,3 +27,7 @@ endif
- 
- libRpcChannel_la_CPPFLAGS =
- libRpcChannel_la_CPPFLAGS += @VMTOOLS_CPPFLAGS@
-+libRpcChannel_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
-+
-+libRpcChannel_la_LIBADD =
-+libRpcChannel_la_LIBADD += @LIBTIRPC_LIBS@
-Index: open-vm-tools/lib/slashProc/Makefile.am
-===================================================================
---- open-vm-tools.orig/lib/slashProc/Makefile.am
-+++ open-vm-tools/lib/slashProc/Makefile.am
-@@ -22,6 +22,10 @@ libSlashProc_la_SOURCES += net.c
- 
- libSlashProc_la_CPPFLAGS =
- libSlashProc_la_CPPFLAGS += @GLIB2_CPPFLAGS@
-+libSlashProc_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
-+
-+libSlashProc_la_LIBADD =
-+libSlashProc_la_LIBADD += @LIBTIRPC_LIBS@
- 
- AM_CFLAGS = $(DNET_CPPFLAGS)
- 
-Index: open-vm-tools/lib/string/bsd_output_shared.c
-===================================================================
---- open-vm-tools.orig/lib/string/bsd_output_shared.c
-+++ open-vm-tools/lib/string/bsd_output_shared.c
-@@ -38,7 +38,7 @@
- //#include <sys/cdefs.h>
- 
- #if !defined(STR_NO_WIN32_LIBS) && !defined(__FreeBSD__) && !defined(__OpenBSD__) && !defined(__NetBSD__) && !defined(__ANDROID__)
--
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <stdlib.h>
- #ifndef _WIN32
-Index: open-vm-tools/libguestlib/Makefile.am
-===================================================================
---- open-vm-tools.orig/libguestlib/Makefile.am
-+++ open-vm-tools/libguestlib/Makefile.am
-@@ -22,6 +22,7 @@ AM_CFLAGS += -I$(top_srcdir)/include
- 
- libguestlib_la_LIBADD =
- libguestlib_la_LIBADD += @VMTOOLS_LIBS@
-+libguestlib_la_LIBADD += @LIBTIRPC_LIBS@
- 
- libguestlib_la_SOURCES =
- libguestlib_la_SOURCES += guestlibV3_xdr.c
-@@ -56,6 +57,7 @@ CFLAGS += -Wno-unused
- libguestlib_la_CPPFLAGS =
- libguestlib_la_CPPFLAGS += -DVMTOOLS_USE_GLIB
- libguestlib_la_CPPFLAGS += @GLIB2_CPPFLAGS@
-+libguestlib_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
- 
- EXTRA_DIST = vmguestlib.pc.in
- 
-Index: open-vm-tools/rpctool/Makefile.am
-===================================================================
---- open-vm-tools.orig/rpctool/Makefile.am
-+++ open-vm-tools/rpctool/Makefile.am
-@@ -17,10 +17,13 @@
- 
- bin_PROGRAMS = vmware-rpctool
- 
-+vmware_rpctool_CFLAGS= @LIBTIRPC_LIBS@
-+
- vmware_rpctool_SOURCES =
- vmware_rpctool_SOURCES += rpctool.c
- 
- vmware_rpctool_LDADD =
-+vmware_rpctool_LDADD += @LIBTIRPC_LIBS@
- vmware_rpctool_LDADD += ../lib/rpcOut/libRpcOut.la
- vmware_rpctool_LDADD += ../lib/message/libMessage.la
- vmware_rpctool_LDADD += ../lib/backdoor/libBackdoor.la
-Index: open-vm-tools/rpctool/rpctool.c
-===================================================================
---- open-vm-tools.orig/rpctool/rpctool.c
-+++ open-vm-tools/rpctool/rpctool.c
-@@ -23,6 +23,8 @@
-  */
- 
- #ifndef _WIN32
-+#define _GNU_SOURCE
-+#include <signal.h>
- #include "sigPosixRegs.h"
- #include <errno.h>
- #include <stdint.h>
-Index: open-vm-tools/services/plugins/dndcp/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/dndcp/Makefile.am
-+++ open-vm-tools/services/plugins/dndcp/Makefile.am
-@@ -23,6 +23,7 @@ plugin_LTLIBRARIES = libdndcp.la
- libdndcp_la_CPPFLAGS =
- libdndcp_la_CPPFLAGS += @GTK_CPPFLAGS@
- libdndcp_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
-+libdndcp_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
- libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/dnd
- libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/dndGuest
- libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/stringxx
-@@ -44,6 +45,7 @@ libdndcp_la_LIBADD += @GTK_LIBS@
- libdndcp_la_LIBADD += @GTKMM_LIBS@
- libdndcp_la_LIBADD += @VMTOOLS_LIBS@
- libdndcp_la_LIBADD += @HGFS_LIBS@
-+libdndcp_la_LIBADD += @LIBTIRPC_LIBS@
- libdndcp_la_LIBADD += $(top_builddir)/lib/hgfsUri/hgfsUriPosix.lo
- 
- libdndcp_la_SOURCES =
-Index: open-vm-tools/services/plugins/guestInfo/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/guestInfo/Makefile.am
-+++ open-vm-tools/services/plugins/guestInfo/Makefile.am
-@@ -22,6 +22,7 @@ plugin_LTLIBRARIES = libguestInfo.la
- 
- libguestInfo_la_CPPFLAGS =
- libguestInfo_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
-+libguestInfo_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
- 
- libguestInfo_la_LDFLAGS =
- libguestInfo_la_LDFLAGS += @PLUGIN_LDFLAGS@
-Index: open-vm-tools/services/plugins/resolutionSet/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/resolutionSet/Makefile.am
-+++ open-vm-tools/services/plugins/resolutionSet/Makefile.am
-@@ -21,6 +21,7 @@ plugin_LTLIBRARIES = libresolutionSet.la
- libresolutionSet_la_CPPFLAGS =
- libresolutionSet_la_CPPFLAGS += @GTK_CPPFLAGS@
- libresolutionSet_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
-+libresolutionSet_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
- libresolutionSet_la_CPPFLAGS += -DRESOLUTION_X11
- 
- libresolutionSet_la_LDFLAGS =
-@@ -30,6 +31,7 @@ libresolutionSet_la_LIBADD =
- libresolutionSet_la_LIBADD += @COMMON_XLIBS@
- libresolutionSet_la_LIBADD += @GTK_LIBS@
- libresolutionSet_la_LIBADD += @VMTOOLS_LIBS@
-+libresolutionSet_la_LIBADD += @LIBTIRPC_LIBS@
- 
- libresolutionSet_la_SOURCES =
- libresolutionSet_la_SOURCES += libvmwarectrl.c
-Index: open-vm-tools/services/plugins/vix/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/vix/Makefile.am
-+++ open-vm-tools/services/plugins/vix/Makefile.am
-@@ -20,6 +20,7 @@ plugin_LTLIBRARIES = libvix.la
- 
- libvix_la_CPPFLAGS =
- libvix_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
-+libvix_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
- libvix_la_CPPFLAGS += -I$(top_srcdir)/vgauth/public
- 
- libvix_la_LDFLAGS =
-@@ -29,6 +30,7 @@ libvix_la_LIBADD =
- libvix_la_LIBADD += @VIX_LIBADD@
- libvix_la_LIBADD += @VMTOOLS_LIBS@
- libvix_la_LIBADD += @HGFS_LIBS@
-+libvix_la_LIBADD += @LIBTIRPC_LIBS@
- libvix_la_LIBADD += $(top_builddir)/lib/auth/libAuth.la
- libvix_la_LIBADD += $(top_builddir)/lib/foundryMsg/libFoundryMsg.la
- libvix_la_LIBADD += $(top_builddir)/lib/impersonate/libImpersonate.la
-Index: open-vm-tools/services/plugins/vmbackup/Makefile.am
-===================================================================
---- open-vm-tools.orig/services/plugins/vmbackup/Makefile.am
-+++ open-vm-tools/services/plugins/vmbackup/Makefile.am
-@@ -20,6 +20,7 @@ plugin_LTLIBRARIES = libvmbackup.la
- 
- libvmbackup_la_CPPFLAGS =
- libvmbackup_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
-+libvmbackup_la_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
- 
- libvmbackup_la_LDFLAGS =
- libvmbackup_la_LDFLAGS += @PLUGIN_LDFLAGS@
-@@ -27,6 +28,7 @@ libvmbackup_la_LDFLAGS += @PLUGIN_LDFLAG
- libvmbackup_la_LIBADD =
- libvmbackup_la_LIBADD += @GOBJECT_LIBS@
- libvmbackup_la_LIBADD += @VMTOOLS_LIBS@
-+libvmbackup_la_LIBADD += @LIBTIRPC_LIBS@
- 
- libvmbackup_la_SOURCES =
- libvmbackup_la_SOURCES += nullProvider.c
-Index: open-vm-tools/toolbox/Makefile.am
-===================================================================
---- open-vm-tools.orig/toolbox/Makefile.am
-+++ open-vm-tools/toolbox/Makefile.am
-@@ -20,9 +20,11 @@ bin_PROGRAMS = vmware-toolbox-cmd
- vmware_toolbox_cmd_LDADD =
- vmware_toolbox_cmd_LDADD += ../libguestlib/libguestlib.la
- vmware_toolbox_cmd_LDADD += @VMTOOLS_LIBS@
-+vmware_toolbox_cmd_LDADD += @LIBTIRPC_LIBS@
- 
- vmware_toolbox_cmd_CPPFLAGS =
- vmware_toolbox_cmd_CPPFLAGS += @VMTOOLS_CPPFLAGS@
-+vmware_toolbox_cmd_CPPFLAGS += @LIBTIRPC_CPPFLAGS@
- 
- vmware_toolbox_cmd_SOURCES =
- vmware_toolbox_cmd_SOURCES += toolbox-cmd.c
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-gnu-ucontext.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-gnu-ucontext.patch
deleted file mode 100644
index c9beac1fcd..0000000000
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0010-gnu-ucontext.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 27442e2dd287d393d7b3f8bf164a887affef84df Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Wed, 18 Nov 2015 10:27:51 +0000
-Subject: [PATCH 10/11] gnu-ucontext
-
----
- open-vm-tools/lib/include/sigPosixRegs.h | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-Index: open-vm-tools/lib/include/sigPosixRegs.h
-===================================================================
---- open-vm-tools.orig/lib/include/sigPosixRegs.h
-+++ open-vm-tools/lib/include/sigPosixRegs.h
-@@ -33,7 +33,7 @@
- #include "includeCheck.h"
- 
- 
--#if __linux__         // We need the REG_foo offsets in the gregset_t;
-+#if defined(__GLIBC__) // We need the REG_foo offsets in the gregset_t;
- #  define _GNU_SOURCE // _GNU_SOURCE maps to __USE_GNU
- 
- /* And, the REG_foo definitions conflict with our own in x86.h */
-@@ -73,7 +73,7 @@
- #include <sys/ucontext.h>
- #endif
- 
--#if __linux__
-+#if defined(__GLIBC__)
- #  if defined(__x86_64__)
- #    undef REG_RAX
- #    undef REG_RBX
-@@ -199,7 +199,7 @@
- #define SC_ESP(uc) ((unsigned long) (uc)->uc_mcontext.mc_esp)
- #define SC_EIP(uc) ((unsigned long) (uc)->uc_mcontext.mc_eip)
- #endif
--#elif defined (sun)
-+#elif !defined (__GLIBC__)
- #ifdef __x86_64__
- #define SC_EAX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_RAX])
- #define SC_EBX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_RBX])
-@@ -219,15 +219,15 @@
- #define SC_R14(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_R14])
- #define SC_R15(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_R15])
- #else
--#define SC_EAX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EAX])
--#define SC_EBX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EBX])
--#define SC_ECX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[ECX])
--#define SC_EDX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EDX])
--#define SC_EDI(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EDI])
--#define SC_ESI(uc) ((unsigned long) (uc)->uc_mcontext.gregs[ESI])
--#define SC_EBP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EBP])
--#define SC_ESP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[ESP])
--#define SC_EIP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[EIP])
-+#define SC_EAX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EAX])
-+#define SC_EBX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EBX])
-+#define SC_ECX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_ECX])
-+#define SC_EDX(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EDX])
-+#define SC_EDI(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EDI])
-+#define SC_ESI(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_ESI])
-+#define SC_EBP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EBP])
-+#define SC_ESP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_ESP])
-+#define SC_EIP(uc) ((unsigned long) (uc)->uc_mcontext.gregs[REG_EIP])
- #endif
- #elif defined(ANDROID_X86)
- #define SC_EAX(uc) ((unsigned long) (uc)->uc_mcontext.eax)
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/fix-subdir-objects-configure-error.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/fix-subdir-objects-configure-error.patch
new file mode 100644
index 0000000000..1a6bfdb09b
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/fix-subdir-objects-configure-error.patch
@@ -0,0 +1,12 @@
+Index: open-vm-tools/configure.ac
+===================================================================
+--- open-vm-tools.orig/configure.ac
++++ open-vm-tools/configure.ac
+@@ -303,6 +303,7 @@ AC_ARG_ENABLE(
+    [],
+    [enable_resolutionkms="auto"])
+ 
++AM_INIT_AUTOMAKE([subdir-objects])
+ AM_INIT_AUTOMAKE
+ 
+ ###
diff --git a/meta-oe/recipes-support/open-vm-tools/files/tools.conf b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/tools.conf
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/files/tools.conf
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/tools.conf
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools/use-tirpc.patch b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/use-tirpc.patch
new file mode 100644
index 0000000000..a6bb92486f
--- /dev/null
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/use-tirpc.patch
@@ -0,0 +1,481 @@
+Index: open-vm-tools/configure.ac
+===================================================================
+--- open-vm-tools.orig/configure.ac
++++ open-vm-tools/configure.ac
+@@ -586,6 +586,11 @@ AC_ARG_WITH([xml2],
+    [enable_vgauth=no],
+    [with_xml2=yes])
+ 
++AC_ARG_WITH([tirpc],
++   [AS_HELP_STRING([--without-tirpc],
++     [compiles without tirpc support.])],
++   [with_tirpc="$withval"],
++   [with_tirpc="auto"])
+ 
+ # Make sure we are building with openssl 1.0.1 and above so that
+ # we use only TLSv1_2.
+@@ -1067,10 +1072,45 @@ if test "$enable_caf" = "yes"; then
+ 
+ fi
+ 
++have_tirpc="no"
++if test "x$with_tirpc" != "xno"; then
++    AC_VMW_CHECK_LIB([libtirpc],
++                     [TIRPC],
++                     [libtirpc],
++                     [],
++                     [],
++                     [],
++                     [],
++                     [have_tirpc="yes"],
++                     [have_tirpc="no"])
++fi
++
++if test "$with_tirpc" = "no"; then
++   use_tirpc="no"
++elif test "$with_tirpc" = "auto"; then
++   use_tirpc=$have_tirpc
++elif test "$with_tirpc" = "yes"; then
++   if test "$have_tirpc" = "no"; then
++      AC_MSG_ERROR([libtirpc is required, but not found.])
++   else
++      use_tirpc="yes"
++   fi
++fi 
++
++if test "$use_tirpc" = "yes"; then
++   AC_MSG_NOTICE([Building with libtirpc])
++else
++   AC_MSG_NOTICE([Building without libtirpc])
++fi
++
+ AC_PATH_PROG(
+    [RPCGEN],
+    [rpcgen],
+-   [ AC_MSG_ERROR([rpcgen not found. Please install the libc devel package.]) ])
++   [not_found])
++
++if test "$RPCGEN" = "not_found"; then
++   AC_MSG_ERROR([rpcgen not found. Please install libc-devel or libc-rpcgen package.])
++fi
+ 
+ ###
+ ### Headers
+@@ -1411,6 +1451,7 @@ AM_CONDITIONAL(HAVE_MKDTEMP, test "$have
+ AM_CONDITIONAL(HAVE_UDEV, test "$have_udev" = "yes")
+ AM_CONDITIONAL(ENABLE_RESOLUTIONKMS, test "x$enable_resolutionkms" = "xyes")
+ AM_CONDITIONAL(VGAUTH_USE_CXX, test "$with_icu" = "yes" -o "$use_xmlsec1" != "yes")
++AM_CONDITIONAL(HAVE_TIRPC, test "$use_tirpc" = "yes")
+ 
+ if test "$have_xsm" != "yes"; then
+ AC_DEFINE([NO_XSM], 1, [])
+@@ -1459,6 +1500,13 @@ if test "$os" = "solaris"; then
+    XDR_LIBS="-lnsl -lrpcsvc"
+ fi
+ 
++# In newer Linux distros Sun RPC has been removed from libc
++XDR_CPPFLAGS=
++if test "$os" = "linux" -a "$use_tirpc" = "yes"; then
++   XDR_CPPFLAGS="-DUSE_TIRPC $TIRPC_CPPFLAGS"
++   XDR_LIBS="$TIRPC_LIBS"
++fi
++
+ # Installation directories for core services plugins.
+ TEST_PLUGIN_INSTALLDIR=$datadir/open-vm-tools/tests
+ COMMON_PLUGIN_INSTALLDIR=$libdir/open-vm-tools/plugins/common
+@@ -1497,6 +1545,7 @@ AC_SUBST([PLUGIN_LDFLAGS])
+ AC_SUBST([VMTOOLS_CPPFLAGS])
+ AC_SUBST([VMTOOLS_LIBS])
+ AC_SUBST([RPCGENFLAGS])
++AC_SUBST([XDR_CPPFLAGS])
+ AC_SUBST([XDR_LIBS])
+ AC_SUBST([TEST_PLUGIN_INSTALLDIR])
+ AC_SUBST([COMMON_PLUGIN_INSTALLDIR])
+Index: open-vm-tools/lib/dynxdr/dynxdr.c
+===================================================================
+--- open-vm-tools.orig/lib/dynxdr/dynxdr.c
++++ open-vm-tools/lib/dynxdr/dynxdr.c
+@@ -1,5 +1,5 @@
+ /*********************************************************
+- * Copyright (C) 2008-2017 VMware, Inc. All rights reserved.
++ * Copyright (C) 2008-2018 VMware, Inc. All rights reserved.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -55,7 +55,7 @@ typedef struct DynXdrData {
+  * Mac OS X, FreeBSD and Solaris don't take a const parameter to the
+  * "x_getpostn" function.
+  */
+-#if defined(__APPLE__) || defined(__FreeBSD__) || defined(sun)
++#if defined(__APPLE__) || defined(__FreeBSD__) || defined(sun) || defined(USE_TIRPC)
+ #  define DYNXDR_GETPOS_CONST
+ #else
+ #  define DYNXDR_GETPOS_CONST const
+@@ -172,7 +172,11 @@ DynXdrSetPos(XDR *xdrs, // IN
+ }
+ 
+ 
+-#if defined(__GLIBC__) || (defined(sun) && (defined(_LP64) || defined(_KERNEL)))
++#if !defined(USE_TIRPC) &&    \
++     defined(__GLIBC__) ||    \
++     (defined(sun) &&         \
++        (defined(_LP64) ||    \
++           defined(_KERNEL)))
+ /*
+  *-----------------------------------------------------------------------------
+  *
+@@ -322,11 +326,11 @@ DynXdr_Create(XDR *in)  // IN
+       DynXdrSetPos,     /* x_setpostn */
+       DynXdrInline,     /* x_inline */
+       NULL,             /* x_destroy */
+-#if defined(__GLIBC__)
++#if defined(__APPLE__) || defined (USE_TIRPC)
++      NULL,             /* x_control */
++#elif defined(__GLIBC__)
+       NULL,             /* x_getint32 */
+       DynXdrPutInt32,   /* x_putint32 */
+-#elif defined(__APPLE__)
+-      NULL,             /* x_control */
+ #elif defined(sun) && (defined(_LP64) || defined(_KERNEL))
+       NULL,             /* x_control */
+       NULL,             /* x_getint32 */
+Index: open-vm-tools/lib/dynxdr/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/dynxdr/Makefile.am
++++ open-vm-tools/lib/dynxdr/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2008-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2008-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -20,4 +20,7 @@ noinst_LTLIBRARIES = libDynxdr.la
+ libDynxdr_la_SOURCES = 
+ libDynxdr_la_SOURCES += dynxdr.c
+ libDynxdr_la_SOURCES += xdrutil.c
+-libDynxdr_la_CPPFLAGS = -Wno-incompatible-pointer-types
++
++libDynxdr_la_CPPFLAGS = @XDR_CPPFLAGS@ -Wno-incompatible-pointer-types
++libDynxdr_la_LIBADD = @XDR_LIBS@
++
+Index: open-vm-tools/lib/guestRpc/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/guestRpc/Makefile.am
++++ open-vm-tools/lib/guestRpc/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2008-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2008-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -20,6 +20,10 @@ noinst_LTLIBRARIES = libGuestRpc.la
+ libGuestRpc_la_SOURCES =
+ libGuestRpc_la_SOURCES += nicinfo_xdr.c
+ 
++libGuestRpc_la_CPPFLAGS = @XDR_CPPFLAGS@
++
++libGuestRpc_la_LIBADD = @XDR_LIBS@
++
+ # XXX: Autoreconf complains about this and recommends using AM_CFLAGS instead.
+ # Problem is, $(CFLAGS) is appended to the compiler command line after AM_CFLAGS
+ # and after libGuestRpc_la_CFLAGS, so "-Wall -Werror" will override this flag.
+Index: open-vm-tools/lib/netUtil/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/netUtil/Makefile.am
++++ open-vm-tools/lib/netUtil/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2007-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2007-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -20,3 +20,6 @@ noinst_LTLIBRARIES = libNetUtil.la
+ libNetUtil_la_SOURCES =
+ libNetUtil_la_SOURCES += netUtilLinux.c
+ 
++libNetUtil_la_CPPFLAGS = @XDR_CPPFLAGS@
++
++libNetUtil_la_LIBADD = @XDR_LIBS@
+Index: open-vm-tools/lib/nicInfo/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/nicInfo/Makefile.am
++++ open-vm-tools/lib/nicInfo/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2014-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2014-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -25,6 +25,9 @@ libNicInfo_la_SOURCES += nicInfoPosix.c
+ 
+ libNicInfo_la_CPPFLAGS =
+ libNicInfo_la_CPPFLAGS += @GLIB2_CPPFLAGS@
++libNicInfo_la_CPPFLAGS += @XDR_CPPFLAGS@
++
++libNicInfo_la_LIBADD = @XDR_LIBS@
+ 
+ AM_CFLAGS = $(DNET_CPPFLAGS)
+ if USE_SLASH_PROC
+Index: open-vm-tools/lib/rpcChannel/Makefile.am
+===================================================================
+--- open-vm-tools.orig/lib/rpcChannel/Makefile.am
++++ open-vm-tools/lib/rpcChannel/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2009-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -27,3 +27,6 @@ endif
+ 
+ libRpcChannel_la_CPPFLAGS =
+ libRpcChannel_la_CPPFLAGS += @VMTOOLS_CPPFLAGS@
++libRpcChannel_la_CPPFLAGS += @XDR_CPPFLAGS@
++
++libRpcChannel_la_LIBADD = @XDR_LIBS@
+Index: open-vm-tools/lib/slashProc/net.c
+===================================================================
+--- open-vm-tools.orig/lib/slashProc/net.c
++++ open-vm-tools/lib/slashProc/net.c
+@@ -1,5 +1,5 @@
+ /*********************************************************
+- * Copyright (C) 2009-2016 VMware, Inc. All rights reserved.
++ * Copyright (C) 2009-2018 VMware, Inc. All rights reserved.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -36,7 +36,6 @@
+ #include "panic.h"
+ #include "slashProc.h"
+ #include "slashProcNetInt.h"
+-#include "netutil.h"
+ 
+ 
+ /*
+Index: open-vm-tools/libguestlib/Makefile.am
+===================================================================
+--- open-vm-tools.orig/libguestlib/Makefile.am
++++ open-vm-tools/libguestlib/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2007-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2007-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -22,6 +22,7 @@ AM_CFLAGS += -I$(top_srcdir)/include
+ 
+ libguestlib_la_LIBADD =
+ libguestlib_la_LIBADD += @VMTOOLS_LIBS@
++libguestlib_la_LIBADD += @XDR_LIBS@
+ 
+ libguestlib_la_SOURCES =
+ libguestlib_la_SOURCES += guestlibV3_xdr.c
+@@ -56,6 +57,7 @@ CFLAGS += -Wno-unused
+ libguestlib_la_CPPFLAGS =
+ libguestlib_la_CPPFLAGS += -DVMTOOLS_USE_GLIB
+ libguestlib_la_CPPFLAGS += @GLIB2_CPPFLAGS@
++libguestlib_la_CPPFLAGS += @XDR_CPPFLAGS@
+ 
+ EXTRA_DIST = vmguestlib.pc.in
+ 
+Index: open-vm-tools/services/plugins/dndcp/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/dndcp/Makefile.am
++++ open-vm-tools/services/plugins/dndcp/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2009-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -28,6 +28,7 @@ libdndcp_la_CPPFLAGS += -I$(top_srcdir)/
+ libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/stringxx
+ libdndcp_la_CPPFLAGS += -I$(top_srcdir)/services/plugins/dndcp/xutils
+ libdndcp_la_CPPFLAGS += -I$(top_srcdir)/include
++libdndcp_la_CPPFLAGS += @XDR_CPPFLAGS@
+ 
+ # Passing C++ related flags to CPPFLAGS generates error.
+ # So, we need to pass these to C++ compilation only.
+@@ -45,6 +46,7 @@ libdndcp_la_LIBADD += @GTKMM_LIBS@
+ libdndcp_la_LIBADD += @VMTOOLS_LIBS@
+ libdndcp_la_LIBADD += @HGFS_LIBS@
+ libdndcp_la_LIBADD += $(top_builddir)/lib/hgfsUri/hgfsUriPosix.lo
++libdndcp_la_LIBADD += @XDR_LIBS@
+ 
+ libdndcp_la_SOURCES =
+ 
+Index: open-vm-tools/services/plugins/guestInfo/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/guestInfo/Makefile.am
++++ open-vm-tools/services/plugins/guestInfo/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2009-2017 VMware, Inc.  All rights reserved.
++### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -22,6 +22,7 @@ plugin_LTLIBRARIES = libguestInfo.la
+ 
+ libguestInfo_la_CPPFLAGS =
+ libguestInfo_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
++libguestInfo_la_CPPFLAGS += @XDR_CPPFLAGS@
+ 
+ libguestInfo_la_LDFLAGS =
+ libguestInfo_la_LDFLAGS += @PLUGIN_LDFLAGS@
+Index: open-vm-tools/services/plugins/resolutionKMS/resolutionKMS.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/resolutionKMS/resolutionKMS.c
++++ open-vm-tools/services/plugins/resolutionKMS/resolutionKMS.c
+@@ -1,5 +1,5 @@
+ /*********************************************************
+- * Copyright (C) 2008-2017 VMware, Inc. All rights reserved.
++ * Copyright (C) 2008-2018 VMware, Inc. All rights reserved.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -29,16 +29,13 @@
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ 
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ 
+ #include "vmware.h"
+-#include "debug.h"
+-#include "rpcout.h"
+-#include "str.h"
+ #include "strutil.h"
+ 
+-#include "xdrutil.h"
+ #include "vmware/guestrpc/tclodefs.h"
+ #include "vmware/tools/plugin.h"
+ #include "vmware/tools/utils.h"
+Index: open-vm-tools/services/plugins/resolutionSet/resolutionSet.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/resolutionSet/resolutionSet.c
++++ open-vm-tools/services/plugins/resolutionSet/resolutionSet.c
+@@ -1,5 +1,5 @@
+ /*********************************************************
+- * Copyright (C) 2008-2017 VMware, Inc. All rights reserved.
++ * Copyright (C) 2008-2018 VMware, Inc. All rights reserved.
+  *
+  * This program is free software; you can redistribute it and/or modify it
+  * under the terms of the GNU Lesser General Public License as published
+@@ -34,7 +34,6 @@
+ 
+ #include "resolutionInt.h"
+ 
+-#include "xdrutil.h"
+ #include "vmware/guestrpc/tclodefs.h"
+ #include "vmware/tools/plugin.h"
+ #include "vmware/tools/utils.h"
+Index: open-vm-tools/services/plugins/vix/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/vix/Makefile.am
++++ open-vm-tools/services/plugins/vix/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2009-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -20,6 +20,7 @@ plugin_LTLIBRARIES = libvix.la
+ 
+ libvix_la_CPPFLAGS =
+ libvix_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
++libvix_la_CPPFLAGS += @XDR_CPPFLAGS@
+ libvix_la_CPPFLAGS += -I$(top_srcdir)/vgauth/public
+ 
+ libvix_la_LDFLAGS =
+@@ -32,6 +33,7 @@ libvix_la_LIBADD += @HGFS_LIBS@
+ libvix_la_LIBADD += $(top_builddir)/lib/auth/libAuth.la
+ libvix_la_LIBADD += $(top_builddir)/lib/foundryMsg/libFoundryMsg.la
+ libvix_la_LIBADD += $(top_builddir)/lib/impersonate/libImpersonate.la
++libvix_la_LIBADD += @XDR_LIBS@
+ if ENABLE_VGAUTH
+    libvix_la_LIBADD += $(top_builddir)/vgauth/lib/libvgauth.la
+ endif
+Index: open-vm-tools/services/plugins/vix/vixTools.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/vix/vixTools.c
++++ open-vm-tools/services/plugins/vix/vixTools.c
+@@ -91,7 +91,6 @@
+ #include "str.h"
+ #include "file.h"
+ #include "err.h"
+-#include "guestInfo.h"  // MAX_VALUE_LEN
+ #include "hostinfo.h"
+ #include "guest_os.h"
+ #include "guest_msg_def.h"
+Index: open-vm-tools/services/plugins/vmbackup/Makefile.am
+===================================================================
+--- open-vm-tools.orig/services/plugins/vmbackup/Makefile.am
++++ open-vm-tools/services/plugins/vmbackup/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2009-2017 VMware, Inc.  All rights reserved.
++### Copyright (C) 2009-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -20,6 +20,7 @@ plugin_LTLIBRARIES = libvmbackup.la
+ 
+ libvmbackup_la_CPPFLAGS =
+ libvmbackup_la_CPPFLAGS += @PLUGIN_CPPFLAGS@
++libvmbackup_la_CPPFLAGS += @XDR_CPPFLAGS@
+ 
+ libvmbackup_la_LDFLAGS =
+ libvmbackup_la_LDFLAGS += @PLUGIN_LDFLAGS@
+@@ -27,6 +28,7 @@ libvmbackup_la_LDFLAGS += @PLUGIN_LDFLAG
+ libvmbackup_la_LIBADD =
+ libvmbackup_la_LIBADD += @GOBJECT_LIBS@
+ libvmbackup_la_LIBADD += @VMTOOLS_LIBS@
++libvmbackup_la_LIBADD += @XDR_LIBS@
+ 
+ libvmbackup_la_SOURCES =
+ libvmbackup_la_SOURCES += nullProvider.c
+Index: open-vm-tools/services/plugins/vmbackup/stateMachine.c
+===================================================================
+--- open-vm-tools.orig/services/plugins/vmbackup/stateMachine.c
++++ open-vm-tools/services/plugins/vmbackup/stateMachine.c
+@@ -35,7 +35,6 @@
+ 
+ #include "vmBackupInt.h"
+ 
+-#include "dynxdr.h"
+ #include <glib-object.h>
+ #include <gmodule.h>
+ #include "guestApp.h"
+Index: open-vm-tools/toolbox/Makefile.am
+===================================================================
+--- open-vm-tools.orig/toolbox/Makefile.am
++++ open-vm-tools/toolbox/Makefile.am
+@@ -1,5 +1,5 @@
+ ################################################################################
+-### Copyright (C) 2007-2016 VMware, Inc.  All rights reserved.
++### Copyright (C) 2007-2018 VMware, Inc.  All rights reserved.
+ ###
+ ### This program is free software; you can redistribute it and/or modify
+ ### it under the terms of version 2 of the GNU General Public License as
+@@ -20,9 +20,11 @@ bin_PROGRAMS = vmware-toolbox-cmd
+ vmware_toolbox_cmd_LDADD =
+ vmware_toolbox_cmd_LDADD += ../libguestlib/libguestlib.la
+ vmware_toolbox_cmd_LDADD += @VMTOOLS_LIBS@
++vmware_toolbox_cmd_LDADD += @XDR_LIBS@
+ 
+ vmware_toolbox_cmd_CPPFLAGS =
+ vmware_toolbox_cmd_CPPFLAGS += @VMTOOLS_CPPFLAGS@
++vmware_toolbox_cmd_CPPFLAGS += @XDR_CPPFLAGS@
+ 
+ vmware_toolbox_cmd_SOURCES =
+ vmware_toolbox_cmd_SOURCES += toolbox-cmd.c
diff --git a/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.init
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.init
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.init
diff --git a/meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service b/meta-oe/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.service
similarity index 100%
rename from meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools/vmtoolsd.service
diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.2.5.bb
similarity index 87%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.2.5.bb
index c32d2c5b33..820c95bbd0 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.2.5.bb
@@ -14,7 +14,7 @@ HOMEPAGE = "https://github.com/vmware/open-vm-tools"
 SECTION = "vmware-tools"
 
 LICENSE = "LGPL-2.0 & GPL-2.0 & BSD & CDDL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b66ba4cb4fc017682c95efc300410e79"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e5000bc3c5a39b6e66579d72cc32b45a"
 LICENSE_modules/freebsd/vmblock = "BSD"
 LICENSE_modules/freebsd/vmmemctl = "GPL-2.0"
 LICENSE_modules/freebsd/vmxnet = "GPL-2.0"
@@ -28,25 +28,23 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://0001-configure.ac-don-t-use-dnet-config.patch \
            file://0002-add-include-sys-sysmacros.h.patch \
            file://0001-Remove-assumptions-about-glibc-being-only-libc-imple.patch \
-           file://0002-include-poll.h-instead-of-obsolete-sys-poll.h.patch \
-           file://0003-Rename-poll.h-to-vm_poll.h.patch \
            file://0004-Add-Wno-incompatible-pointer-types-and-Wno-error-add.patch \
            file://0005-Use-configure-test-for-struct-timespec.patch \
            file://0006-Fix-definition-of-ALLPERMS-and-ACCESSPERMS.patch \
            file://0007-Use-configure-to-test-for-feature-instead-of-platfor.patch \
-           file://0008-use-posix-strerror_r-unless-gnu.patch \
            file://0011-Use-configure-test-for-sys-stat.h-include.patch \
+           file://use-tirpc.patch \
+           file://fix-subdir-objects-configure-error.patch \
+           file://0001-include-poll.h-instead-of-sys-poll.h.patch \
+           file://0002-Rename-poll.h-to-vm_poll.h.patch \
+           file://0003-use-posix-strerror_r-unless-on-gnu-libc-system.patch \
+           file://0004-Use-uintmax_t-for-handling-rlim_t.patch \
            "
-SRC_URI_append_libc-musl = "\
-           file://0009-Add-support-for-building-with-system-libtirpc.patch \
-           file://0010-gnu-ucontext.patch \
-           "
-SRCREV = "854c0bb374612f7e633b448ca273f970f154458b"
+SRCREV = "380a3d9747999e8bcbcbcd03b1402b702770db79"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-DEPENDS = "glib-2.0 glib-2.0-native util-linux libdnet procps"
-DEPENDS_append_libc-musl = " libtirpc"
+DEPENDS = "glib-2.0 glib-2.0-native util-linux libdnet procps libtirpc"
 
 # open-vm-tools is supported only on x86.
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
-- 
2.17.1


