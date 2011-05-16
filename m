Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QM2ZK-0007ty-A9
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 20:31:03 +0200
Received: by pzk36 with SMTP id 36so2305640pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=60FdzVLqHCruJjMhKefMZnOeG/WT+vKqpfaPQ3OcR8w=;
	b=luXDrKW4SQpugrl+AR/0u8HICXokYsO1UiOX8vBHn8b1+EWODua4Wo/bumt4F6Cz1o
	IrBcO9hWIWlsPGHVXgBmm40E/6jumBLHg3jxQ8SzrLA9aJM8hbkJw9KtX2nBMB525RgH
	co04+aeXR3wHQYz9c53tChKcPheuMjMUE0his=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Kls6DCP+NaRU+uQDDVMO8NbfnIKD0daOyXU918/VUo/K0/ntW2cGZZTL1e5FVexmMh
	jpnxBa9u0kWbTZ/p0p6Onlhl8IjGBJ77PUdHcA5x8JLJzwKanrCP946J4XFggl4nKWAW
	PWMCm7ux4KiCIbKxARJXr8x/i5f4F/UaC0/Gg=
Received: by 10.143.63.17 with SMTP id q17mr2899009wfk.304.1305570488824;
	Mon, 16 May 2011 11:28:08 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id w14sm4878668wfh.20.2011.05.16.11.28.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 11:28:07 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 11:27:56 -0700
Message-Id: <1305570476-7207-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] uclibc_git.bb: Backport epoll implementation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2011 18:31:03 -0000

From: Khem Raj <raj.khem@gmail.com>

Many applications e.g. firefox need it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-git/uclibc-epoll.patch           |  378 ++++++++++++++++++++
 meta-oe/recipes-core/uclibc/uclibc_git.bb          |    3 +-
 2 files changed, 380 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uclibc-epoll.patch

diff --git a/meta-oe/recipes-core/uclibc/uclibc-git/uclibc-epoll.patch b/meta-oe/recipes-core/uclibc/uclibc-git/uclibc-epoll.patch
new file mode 100644
index 0000000..5d0cded
--- /dev/null
+++ b/meta-oe/recipes-core/uclibc/uclibc-git/uclibc-epoll.patch
@@ -0,0 +1,378 @@
+From 00c44b9f566f34d1fa3f2889771730b8496b6f95 Mon Sep 17 00:00:00 2001
+From: Peter S. Mazinger <ps.m@gmx.net>
+Date: Tue, 22 Mar 2011 00:02:10 +0000
+Subject: add epoll_pwait()
+
+Add epoll.h header for sparc.
+Update epoll.h from glibc (disabling though epoll_create1).
+
+Signed-off-by: Peter S. Mazinger <ps.m@gmx.net>
+---
+diff --git a/libc/sysdeps/linux/common/epoll.c b/libc/sysdeps/linux/common/epoll.c
+index dda9228..4fbba16 100644
+--- a/libc/sysdeps/linux/common/epoll.c
++++ b/libc/sysdeps/linux/common/epoll.c
+@@ -1,6 +1,6 @@
+ /* vi: set sw=4 ts=4: */
+ /*
+- * epoll_create() / epoll_ctl() / epoll_wait() for uClibc
++ * epoll_create() / epoll_ctl() / epoll_wait() / epoll_pwait() for uClibc
+  *
+  * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
+  *
+@@ -10,23 +10,19 @@
+ #include <sys/syscall.h>
+ #include <sys/epoll.h>
+ 
+-/*
+- * epoll_create()
+- */
+ #ifdef __NR_epoll_create
+ _syscall1(int, epoll_create, int, size)
+ #endif
+ 
+-/*
+- * epoll_ctl()
+- */
+ #ifdef __NR_epoll_ctl
+-_syscall4(int,epoll_ctl, int, epfd, int, op, int, fd, struct epoll_event *, event)
++_syscall4(int, epoll_ctl, int, epfd, int, op, int, fd, struct epoll_event *, event)
+ #endif
+ 
+-/*
+- * epoll_wait()
+- */
+ #ifdef __NR_epoll_wait
+ _syscall4(int, epoll_wait, int, epfd, struct epoll_event *, events, int, maxevents, int, timeout)
+ #endif
++
++#ifdef __NR_epoll_pwait
++_syscall5(int, epoll_pwait, int, epfd, struct epoll_event *, events, int, maxevents, int, timeout,
++	  const sigset_t *, ss)
++#endif
+diff --git a/libc/sysdeps/linux/common/stubs.c b/libc/sysdeps/linux/common/stubs.c
+index 655c640..0e740b1 100644
+--- a/libc/sysdeps/linux/common/stubs.c
++++ b/libc/sysdeps/linux/common/stubs.c
+@@ -63,6 +63,10 @@ make_stub(epoll_ctl)
+ make_stub(epoll_wait)
+ #endif
+ 
++#ifndef __NR_epoll_pwait
++make_stub(epoll_pwait)
++#endif
++
+ #ifndef __NR_fdatasync
+ make_stub(fdatasync)
+ #endif
+diff --git a/libc/sysdeps/linux/common/sys/epoll.h b/libc/sysdeps/linux/common/sys/epoll.h
+index 44e814b..bf196d2 100644
+--- a/libc/sysdeps/linux/common/sys/epoll.h
++++ b/libc/sysdeps/linux/common/sys/epoll.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2002, 2003, 2004, 2005 Free Software Foundation, Inc.
++/* Copyright (C) 2002-2006, 2007, 2008, 2009 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -22,6 +22,26 @@
+ #include <stdint.h>
+ #include <sys/types.h>
+ 
++/* Get __sigset_t.  */
++#include <bits/sigset.h>
++
++#ifndef __sigset_t_defined
++# define __sigset_t_defined
++typedef __sigset_t sigset_t;
++#endif
++
++
++#if 0
++/* Flags to be passed to epoll_create1.  */
++enum
++  {
++    EPOLL_CLOEXEC = 02000000,
++#define EPOLL_CLOEXEC EPOLL_CLOEXEC
++    EPOLL_NONBLOCK = 04000
++#define EPOLL_NONBLOCK EPOLL_NONBLOCK
++  };
++#endif
++
+ 
+ enum EPOLL_EVENTS
+   {
+@@ -55,9 +75,9 @@ enum EPOLL_EVENTS
+ 
+ 
+ /* Valid opcodes ( "op" parameter ) to issue to epoll_ctl().  */
+-#define EPOLL_CTL_ADD 1	/* Add a file decriptor to the interface.  */
+-#define EPOLL_CTL_DEL 2	/* Remove a file decriptor from the interface.  */
+-#define EPOLL_CTL_MOD 3	/* Change file decriptor epoll_event structure.  */
++#define EPOLL_CTL_ADD 1	/* Add a file descriptor to the interface.  */
++#define EPOLL_CTL_DEL 2	/* Remove a file descriptor from the interface.  */
++#define EPOLL_CTL_MOD 3	/* Change file descriptor epoll_event structure.  */
+ 
+ 
+ typedef union epoll_data
+@@ -83,6 +103,12 @@ __BEGIN_DECLS
+    returned by epoll_create() should be closed with close().  */
+ extern int epoll_create (int __size) __THROW;
+ 
++#if 0
++/* Same as epoll_create but with an FLAGS parameter.  The unused SIZE
++   parameter has been dropped.  */
++extern int epoll_create1 (int __flags) __THROW;
++#endif
++
+ 
+ /* Manipulate an epoll instance "epfd". Returns 0 in case of success,
+    -1 in case of error ( the "errno" variable will contain the
+@@ -107,6 +133,16 @@ extern int epoll_ctl (int __epfd, int __op, int __fd,
+ extern int epoll_wait (int __epfd, struct epoll_event *__events,
+ 		       int __maxevents, int __timeout);
+ 
++
++/* Same as epoll_wait, but the thread's signal mask is temporarily
++   and atomically replaced with the one provided as parameter.
++
++   This function is a cancellation point and therefore not marked with
++   __THROW.  */
++extern int epoll_pwait (int __epfd, struct epoll_event *__events,
++			int __maxevents, int __timeout,
++			__const __sigset_t *__ss);
++
+ __END_DECLS
+ 
+ #endif /* sys/epoll.h */
+diff --git a/libc/sysdeps/linux/sparc/sys/epoll.h b/libc/sysdeps/linux/sparc/sys/epoll.h
+new file mode 100644
+index 0000000..83a61da
+--- a/dev/null
++++ b/libc/sysdeps/linux/sparc/sys/epoll.h
+@@ -0,0 +1,147 @@
++/* Copyright (C) 2002-2006, 2007, 2008 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, write to the Free
++   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
++   02111-1307 USA.  */
++
++#ifndef	_SYS_EPOLL_H
++#define	_SYS_EPOLL_H	1
++
++#include <stdint.h>
++#include <sys/types.h>
++
++/* Get __sigset_t.  */
++#include <bits/sigset.h>
++
++#ifndef __sigset_t_defined
++# define __sigset_t_defined
++typedef __sigset_t sigset_t;
++#endif
++
++
++#if 0
++/* Flags to be passed to epoll_create2.  */
++enum
++  {
++    EPOLL_CLOEXEC = 0x400000,
++#define EPOLL_CLOEXEC EPOLL_CLOEXEC
++    EPOLL_NONBLOCK = 0x4000
++#define EPOLL_NONBLOCK EPOLL_NONBLOCK
++  };
++#endif
++
++
++enum EPOLL_EVENTS
++  {
++    EPOLLIN = 0x001,
++#define EPOLLIN EPOLLIN
++    EPOLLPRI = 0x002,
++#define EPOLLPRI EPOLLPRI
++    EPOLLOUT = 0x004,
++#define EPOLLOUT EPOLLOUT
++    EPOLLRDNORM = 0x040,
++#define EPOLLRDNORM EPOLLRDNORM
++    EPOLLRDBAND = 0x080,
++#define EPOLLRDBAND EPOLLRDBAND
++    EPOLLWRNORM = 0x100,
++#define EPOLLWRNORM EPOLLWRNORM
++    EPOLLWRBAND = 0x200,
++#define EPOLLWRBAND EPOLLWRBAND
++    EPOLLMSG = 0x400,
++#define EPOLLMSG EPOLLMSG
++    EPOLLERR = 0x008,
++#define EPOLLERR EPOLLERR
++    EPOLLHUP = 0x010,
++#define EPOLLHUP EPOLLHUP
++    EPOLLRDHUP = 0x2000,
++#define EPOLLRDHUP EPOLLRDHUP
++    EPOLLONESHOT = (1 << 30),
++#define EPOLLONESHOT EPOLLONESHOT
++    EPOLLET = (1 << 31)
++#define EPOLLET EPOLLET
++  };
++
++
++/* Valid opcodes ( "op" parameter ) to issue to epoll_ctl().  */
++#define EPOLL_CTL_ADD 1	/* Add a file descriptor to the interface.  */
++#define EPOLL_CTL_DEL 2	/* Remove a file descriptor from the interface.  */
++#define EPOLL_CTL_MOD 3	/* Change file descriptor epoll_event structure.  */
++
++
++typedef union epoll_data
++{
++  void *ptr;
++  int fd;
++  uint32_t u32;
++  uint64_t u64;
++} epoll_data_t;
++
++struct epoll_event
++{
++  uint32_t events;	/* Epoll events */
++  epoll_data_t data;	/* User data variable */
++};
++
++
++__BEGIN_DECLS
++
++/* Creates an epoll instance.  Returns an fd for the new instance.
++   The "size" parameter is a hint specifying the number of file
++   descriptors to be associated with the new instance.  The fd
++   returned by epoll_create() should be closed with close().  */
++extern int epoll_create (int __size) __THROW;
++
++#if 0
++/* Same as epoll_create but with an additional FLAGS parameter.  */
++extern int epoll_create2 (int __size, int __flags) __THROW;
++#endif
++
++
++/* Manipulate an epoll instance "epfd". Returns 0 in case of success,
++   -1 in case of error ( the "errno" variable will contain the
++   specific error code ) The "op" parameter is one of the EPOLL_CTL_*
++   constants defined above. The "fd" parameter is the target of the
++   operation. The "event" parameter describes which events the caller
++   is interested in and any associated user data.  */
++extern int epoll_ctl (int __epfd, int __op, int __fd,
++		      struct epoll_event *__event) __THROW;
++
++
++/* Wait for events on an epoll instance "epfd". Returns the number of
++   triggered events returned in "events" buffer. Or -1 in case of
++   error with the "errno" variable set to the specific error code. The
++   "events" parameter is a buffer that will contain triggered
++   events. The "maxevents" is the maximum number of events to be
++   returned ( usually size of "events" ). The "timeout" parameter
++   specifies the maximum wait time in milliseconds (-1 == infinite).
++
++   This function is a cancellation point and therefore not marked with
++   __THROW.  */
++extern int epoll_wait (int __epfd, struct epoll_event *__events,
++		       int __maxevents, int __timeout);
++
++
++/* Same as epoll_wait, but the thread's signal mask is temporarily
++   and atomically replaced with the one provided as parameter.
++
++   This function is a cancellation point and therefore not marked with
++   __THROW.  */
++extern int epoll_pwait (int __epfd, struct epoll_event *__events,
++			int __maxevents, int __timeout,
++			__const __sigset_t *__ss);
++
++__END_DECLS
++
++#endif /* sys/epoll.h */
+diff --git a/libc/sysdeps/linux/x86_64/sys/epoll.h b/libc/sysdeps/linux/x86_64/sys/epoll.h
+index 02672d3..6b90d54 100644
+--- a/libc/sysdeps/linux/x86_64/sys/epoll.h
++++ b/libc/sysdeps/linux/x86_64/sys/epoll.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2002,2003,2004,2005,2006 Free Software Foundation, Inc.
++/* Copyright (C) 2002,2003,2004,2005,2006,2007,2008 Free Software Foundation, Inc.
+    This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+@@ -22,6 +22,26 @@
+ #include <stdint.h>
+ #include <sys/types.h>
+ 
++/* Get __sigset_t.  */
++#include <bits/sigset.h>
++
++#ifndef __sigset_t_defined
++# define __sigset_t_defined
++typedef __sigset_t sigset_t;
++#endif
++
++
++#if 0
++/* Flags to be passed to epoll_create1.  */
++enum
++  {
++    EPOLL_CLOEXEC = 02000000,
++#define EPOLL_CLOEXEC EPOLL_CLOEXEC
++    EPOLL_NONBLOCK = 04000
++#define EPOLL_NONBLOCK EPOLL_NONBLOCK
++  };
++#endif
++
+ 
+ enum EPOLL_EVENTS
+   {
+@@ -45,6 +65,8 @@ enum EPOLL_EVENTS
+ #define EPOLLERR EPOLLERR
+     EPOLLHUP = 0x010,
+ #define EPOLLHUP EPOLLHUP
++    EPOLLRDHUP = 0x2000,
++#define EPOLLRDHUP EPOLLRDHUP
+     EPOLLONESHOT = (1 << 30),
+ #define EPOLLONESHOT EPOLLONESHOT
+     EPOLLET = (1 << 31)
+@@ -81,6 +103,12 @@ __BEGIN_DECLS
+    returned by epoll_create() should be closed with close().  */
+ extern int epoll_create (int __size) __THROW;
+ 
++#if 0
++/* Same as epoll_create but with an FLAGS parameter.  The unused SIZE
++   parameter has been dropped.  */
++extern int epoll_create1 (int __flags) __THROW;
++#endif
++
+ 
+ /* Manipulate an epoll instance "epfd". Returns 0 in case of success,
+    -1 in case of error ( the "errno" variable will contain the
+@@ -105,6 +133,16 @@ extern int epoll_ctl (int __epfd, int __op, int __fd,
+ extern int epoll_wait (int __epfd, struct epoll_event *__events,
+ 		       int __maxevents, int __timeout);
+ 
++
++/* Same as epoll_wait, but the thread's signal mask is temporarily
++   and atomically replaced with the one provided as parameter.
++
++   This function is a cancellation point and therefore not marked with
++   __THROW.  */
++extern int epoll_pwait (int __epfd, struct epoll_event *__events,
++			int __maxevents, int __timeout,
++			__const __sigset_t *__ss);
++
+ __END_DECLS
+ 
+ #endif /* sys/epoll.h */
+--
+cgit v0.8.2.1
diff --git a/meta-oe/recipes-core/uclibc/uclibc_git.bb b/meta-oe/recipes-core/uclibc/uclibc_git.bb
index 3719ea2..cbc8ab8 100644
--- a/meta-oe/recipes-core/uclibc/uclibc_git.bb
+++ b/meta-oe/recipes-core/uclibc/uclibc_git.bb
@@ -11,7 +11,7 @@ SRCREV="074930dd7f2a18a7013cdb72cc38136f3be39c40"
 PR_append = "+gitr${SRCPV}"
 
 require uclibc.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 #recent versions uclibc require real kernel headers
@@ -39,5 +39,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://argp-support.patch \
 	file://argp-headers.patch \
 	file://remove_attribute_optimize_Os.patch \
+	file://uclibc-epoll.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.4.1



