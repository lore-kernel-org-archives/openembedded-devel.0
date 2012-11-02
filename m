Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1TUEzs-0004cA-HN
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Nov 2012 12:01:09 +0100
Received: from mail72-am1-R.bigfish.com (10.3.201.226) by
	AM1EHSOBE001.bigfish.com (10.3.204.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 2 Nov 2012 10:17:19 +0000
Received: from mail72-am1 (localhost [127.0.0.1])	by mail72-am1-R.bigfish.com
	(Postfix) with ESMTP id 8AF614203D0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2012 10:17:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzc8kzz1de0h1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h1155h)
Received: from mail72-am1 (localhost.localdomain [127.0.0.1]) by mail72-am1
	(MessageSwitch) id 1351851413166556_15668;
	Fri,  2 Nov 2012 10:16:53 +0000 (UTC)
Received: from AM1EHSMHS016.bigfish.com (unknown [10.3.201.252])	by
	mail72-am1.bigfish.com (Postfix) with ESMTP id 1A4A64E0068	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2012 10:16:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS016.bigfish.com
	(10.3.207.154) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 2 Nov 2012 10:16:50 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 2 Nov 2012 10:16:48 +0000
Received: from localhost.localdomain (guo-desktop.ap.freescale.net
	[10.192.208.249])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id qA2AGih9008176;	Fri, 2 Nov 2012 03:16:46 -0700
From: Chunrong Guo <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Nov 2012 18:20:20 +0800
Message-ID: <1351851620-20483-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com, B19537@freescale.com
Subject: [meta-oe v2] inetutils: fix the issue of "ifconfig -a" that can not display all interfaces
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
X-List-Received-Date: Fri, 02 Nov 2012 11:01:09 -0000
Content-Type: text/plain

"ifconfig -a" doesn't show all avaiable ethernet interfaces, the patch fixes the issue.

Signed-off-by: Chunrong Guo <b40290@freescale.com>
---
 ...ue-of-ifconfig-a-that-can-not-display-all.patch |  482 ++++++++++++++++++++
 .../inetutils/inetutils_1.8.bb                     |    3 +-
 2 files changed, 484 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/0001-fix-the-issue-of-ifconfig-a-that-can-not-display-all.patch

diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/0001-fix-the-issue-of-ifconfig-a-that-can-not-display-all.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/0001-fix-the-issue-of-ifconfig-a-that-can-not-display-all.patch
new file mode 100644
index 0000000..dd01ff2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/0001-fix-the-issue-of-ifconfig-a-that-can-not-display-all.patch
@@ -0,0 +1,482 @@
+From 7d8af05baeec680f17d6070708893f1a4f05bfa4 Mon Sep 17 00:00:00 2001
+From: Chunrong Guo <b40290@freescale.com>
+Date: Fri, 2 Nov 2012 01:28:37 -0500
+Subject: [PATCH] fix the issue of "ifconfig -a" that can not display all
+ interfaces
+
+Upstream-Status: Accepted
+
+"ifconfig -a" doesn't show all avaiable ethernet interfaces, the patch can
+fix the issue.
+
+Signed-off-by: Chunrong Guo <b40290@freescale.com>
+---
+ ifconfig/if_index.c |  135 ++++++++++++++++++++++++++----------
+ lib/gnulib.mk       |    9 +++
+ lib/read-file.c     |  191 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ lib/read-file.h     |   36 ++++++++++
+ 4 files changed, 333 insertions(+), 38 deletions(-)
+ create mode 100644 lib/read-file.c
+ create mode 100644 lib/read-file.h
+
+diff --git a/ifconfig/if_index.c b/ifconfig/if_index.c
+index e2737c2..5fb0ac7 100644
+--- a/ifconfig/if_index.c
++++ b/ifconfig/if_index.c
+@@ -28,7 +28,7 @@
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-
++#include <read-file.h>
+ /* Solaris at least earlier 2.6 and before does not include
+    the ioctl definitions if BSD_COMP is not set.  */
+ #if defined(__svr4__)
+@@ -97,24 +97,29 @@ if_freenameindex (struct if_nameindex *ifn)
+ struct if_nameindex *
+ if_nameindex (void)
+ {
+-#if defined(SIOCGIFCONF)
+-  int fd = socket (AF_INET, SOCK_DGRAM, 0);
+-  struct ifconf ifc;
+-  unsigned int i = 0;
+-  int rq_len, last_len;
+-  struct if_nameindex *idx = NULL;
+-  struct ifreq *ifr, *end, *cur;
++  //printk("if_nameindex\n");
+ 
++//#if defined(SIOCGIFCONF)
++//  int fd = socket (AF_INET, SOCK_DGRAM, 0);
++//  struct ifconf ifc;
++//  unsigned int i = 0;
++//  int rq_len, last_len;
++    char *content, *it;
++    size_t length, index;
++    struct if_nameindex *idx = NULL;
++//  struct ifreq *ifr, *end, *cur;
++     int fd;
++    fd = socket (AF_INET, SOCK_DGRAM, 0);
+   if (fd < 0)
+     return NULL;
+ 
+   /* A first estimate.  */
+-  rq_len = 4 * sizeof (struct ifreq);
++ // rq_len = 4 * sizeof (struct ifreq);
+ 
+-  ifc.ifc_buf = NULL;
+-  ifc.ifc_len = 0;
++//  ifc.ifc_buf = NULL;
++//  ifc.ifc_len = 0;
+   /* Read all the interfaces out of the kernel.  */
+-  do
++/*  do
+     {
+       last_len = ifc.ifc_len;
+       ifc.ifc_buf = alloca (ifc.ifc_len = rq_len);
+@@ -142,30 +147,59 @@ if_nameindex (void)
+ # endif
+ 
+       cur = ifr;
+-
+-      /* Step along the array by the size of the current structure */
+-      ifr = (struct ifreq *) ((caddr_t) ifr + len + IFNAMSIZ);
++*/
++      content = read_file (PATH_PROCNET_DEV, &length);
++      if (content == NULL)
++         return NULL;
++         /* Count how many interfaces we have.  */
++   {
++    size_t n = 0;
++    it = content;
++    do
++      {
++        it = memchr (it + 1, ':', length - (it - content));
++        n++;
++      }
++    while (it);
++ 
++     /* Step along the array by the size of the current structure */
++     // ifr = (struct ifreq *) ((caddr_t) ifr + len + IFNAMSIZ);
+ 
+       /* We ignore the other families .. OK ?  */
+-      if (cur->ifr_addr.sa_family != AF_INET)
+-	continue;
+-
++    //  if (cur->ifr_addr.sa_family != AF_INET)
++	//continue;
++   idx = malloc (n * sizeof(*idx));
++   if (idx == NULL)
+       /* Make Room safely.  */
+       {
+-	struct if_nameindex *tidx = NULL;
+-	tidx = realloc (idx, (i + 1) * sizeof (*idx));
+-	if (tidx == NULL)
+-	  {
+-	    if_freenameindex (idx);
+-	    close (fd);
+-	    errno = ENOBUFS;
+-	    return NULL;
+-	  }
+-	idx = tidx;
++	//struct if_nameindex *tidx = NULL;
++	//tidx = realloc (idx, (i + 1) * sizeof (*idx));
++	//if (tidx == NULL)
++	//  {
++	 //   if_freenameindex (idx);
++	  //  close (fd);
++	   // errno = ENOBUFS;
++	  //  return NULL;
++	 // }
++//	idx = tidx;
++      int saved_errno = errno;
++      close (fd);
++      free(content);
++      errno = saved_errno;
++     return NULL;
+       }
+-
++  }
+       /* FIXME: We did not deal with duplicates or interface aliases.  */
++  for (it = memchr (content, ':', length), index = 0; it;
++       it = memchr (it, ':', it - content), index++)
++    {
++      char *start = it - 1;
++      *it = '\0';
+ 
++      while (*start != ' ' && *start != '\n')
++        start--;
++
++/*
+       idx[i].if_name = strdup (cur->ifr_name);
+       if (idx[i].if_name == NULL)
+ 	{
+@@ -174,18 +208,38 @@ if_nameindex (void)
+ 	  errno = ENOBUFS;
+ 	  return NULL;
+ 	}
++*/
++      idx[index].if_name = strdup (start + 1);
++      idx[index].if_index = index + 1;
+ 
+ # if defined(SIOCGIFINDEX)
+-      if (ioctl (fd, SIOCGIFINDEX, cur) >= 0)
+-	idx[i].if_index = cur->ifr_index;
+-      else
++  //    if (ioctl (fd, SIOCGIFINDEX, cur) >= 0)
++//	idx[i].if_index = cur->ifr_index;
++ //     else
++    {
++        struct ifreq cur;
++        strcpy (cur.ifr_name, idx[index].if_name);
++        cur.ifr_index = -1;
++        if (ioctl (fd, SIOCGIFINDEX, &cur) >= 0)
++          idx[index].if_index = cur.ifr_index;
++      }
++
+ # endif
+-	idx[i].if_index = i + 1;
+-      i++;
++//	idx[i].if_index = i + 1;
++ //      i++;
++   if (idx[index].if_name == NULL)
++        {
++          int saved_errno = errno;
++          close (fd);
++          free (content);
++          errno = saved_errno;
++          return NULL;
++        }
++
+     }
+ 
+   /* Terminate the array with an empty solt.  */
+-  {
++/*  {
+     struct if_nameindex *tidx = NULL;
+     tidx = realloc (idx, (i + 1) * sizeof (*idx));
+     if (tidx == NULL)
+@@ -199,14 +253,19 @@ if_nameindex (void)
+   }
+   idx[i].if_index = 0;
+   idx[i].if_name = NULL;
+-
+-  close (fd);
++*/
++  idx[index].if_index = 0;
++  idx[index].if_name = NULL;
++ 
++ // close (fd);
++ free(content);
+   return idx;
+-
++/*
+ #else
+   errno = ENOSYS;
+   return NULL;
+ #endif
++*/
+ }
+ 
+ char *
+diff --git a/lib/gnulib.mk b/lib/gnulib.mk
+index ebc3b22..defb086 100644
+--- a/lib/gnulib.mk
++++ b/lib/gnulib.mk
+@@ -111,6 +111,15 @@ libgnu_a_SOURCES += argp-version-etc.h argp-version-etc.c
+ 
+ ## end   gnulib module argp-version-etc
+ 
++
++## begin gnulib module read-file
++
++libgnu_a_SOURCES += read-file.c
++
++EXTRA_DIST += read-file.h
++
++## end   gnulib module read-file
++
+ ## begin gnulib module arpa_inet
+ 
+ BUILT_SOURCES += arpa/inet.h
+diff --git a/lib/read-file.c b/lib/read-file.c
+new file mode 100644
+index 0000000..ba7aef3
+--- /dev/null
++++ b/lib/read-file.c
+@@ -0,0 +1,191 @@
++/* -*- buffer-read-only: t -*- vi: set ro: */
++/* DO NOT EDIT! GENERATED AUTOMATICALLY! */
++/* read-file.c -- read file contents into a string
++   Copyright (C) 2006, 2009-2011 Free Software Foundation, Inc.
++   Written by Simon Josefsson and Bruno Haible.
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3, or (at your option)
++   any later version.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
++
++#include <config.h>
++
++#include "read-file.h"
++
++/* Get fstat.  */
++#include <sys/stat.h>
++
++/* Get ftello.  */
++#include <stdio.h>
++
++/* Get SIZE_MAX.  */
++#include <stdint.h>
++
++/* Get malloc, realloc, free. */
++#include <stdlib.h>
++
++/* Get errno. */
++#include <errno.h>
++
++/* Read a STREAM and return a newly allocated string with the content,
++   and set *LENGTH to the length of the string.  The string is
++   zero-terminated, but the terminating zero byte is not counted in
++   *LENGTH.  On errors, *LENGTH is undefined, errno preserves the
++   values set by system functions (if any), and NULL is returned.  */
++char *
++fread_file (FILE *stream, size_t *length)
++{
++  char *buf = NULL;
++  size_t alloc = BUFSIZ;
++
++  /* For a regular file, allocate a buffer that has exactly the right
++     size.  This avoids the need to do dynamic reallocations later.  */
++  {
++    struct stat st;
++
++    if (fstat (fileno (stream), &st) >= 0 && S_ISREG (st.st_mode))
++      {
++        off_t pos = ftello (stream);
++
++        if (pos >= 0 && pos < st.st_size)
++          {
++            off_t alloc_off = st.st_size - pos;
++
++            /* '1' below, accounts for the trailing NUL.  */
++            if (SIZE_MAX - 1 < alloc_off)
++              {
++                errno = ENOMEM;
++                return NULL;
++              }
++
++            alloc = alloc_off + 1;
++          }
++      }
++  }
++
++  if (!(buf = malloc (alloc)))
++    return NULL; /* errno is ENOMEM.  */
++
++  {
++    size_t size = 0; /* number of bytes read so far */
++    int save_errno;
++
++    for (;;)
++      {
++        /* This reads 1 more than the size of a regular file
++           so that we get eof immediately.  */
++        size_t requested = alloc - size;
++        size_t count = fread (buf + size, 1, requested, stream);
++        size += count;
++
++        if (count != requested)
++          {
++            save_errno = errno;
++            if (ferror (stream))
++              break;
++
++            /* Shrink the allocated memory if possible.  */
++            if (size < alloc - 1)
++              {
++                char *smaller_buf = realloc (buf, size + 1);
++                if (smaller_buf != NULL)
++                  buf = smaller_buf;
++              }
++
++            buf[size] = '\0';
++            *length = size;
++            return buf;
++          }
++
++        {
++          char *new_buf;
++
++          if (alloc == SIZE_MAX)
++            {
++              save_errno = ENOMEM;
++              break;
++            }
++
++          if (alloc < SIZE_MAX - alloc / 2)
++            alloc = alloc + alloc / 2;
++          else
++            alloc = SIZE_MAX;
++
++          if (!(new_buf = realloc (buf, alloc)))
++            {
++              save_errno = errno;
++              break;
++            }
++
++          buf = new_buf;
++        }
++      }
++
++    free (buf);
++    errno = save_errno;
++    return NULL;
++  }
++}
++
++static char *
++internal_read_file (const char *filename, size_t *length, const char *mode)
++{
++  FILE *stream = fopen (filename, mode);
++  char *out;
++  int save_errno;
++
++  if (!stream)
++    return NULL;
++
++  out = fread_file (stream, length);
++
++  save_errno = errno;
++
++  if (fclose (stream) != 0)
++    {
++      if (out)
++        {
++          save_errno = errno;
++          free (out);
++        }
++      errno = save_errno;
++      return NULL;
++    }
++
++  return out;
++}
++
++/* Open and read the contents of FILENAME, and return a newly
++   allocated string with the content, and set *LENGTH to the length of
++   the string.  The string is zero-terminated, but the terminating
++   zero byte is not counted in *LENGTH.  On errors, *LENGTH is
++   undefined, errno preserves the values set by system functions (if
++   any), and NULL is returned.  */
++char *
++read_file (const char *filename, size_t *length)
++{
++  return internal_read_file (filename, length, "r");
++}
++
++/* Open (on non-POSIX systems, in binary mode) and read the contents
++   of FILENAME, and return a newly allocated string with the content,
++   and set LENGTH to the length of the string.  The string is
++   zero-terminated, but the terminating zero byte is not counted in
++   the LENGTH variable.  On errors, *LENGTH is undefined, errno
++   preserves the values set by system functions (if any), and NULL is
++   returned.  */
++char *
++read_binary_file (const char *filename, size_t *length)
++{
++  return internal_read_file (filename, length, "rb");
++}
+diff --git a/lib/read-file.h b/lib/read-file.h
+new file mode 100644
+index 0000000..14041dc
+--- /dev/null
++++ b/lib/read-file.h
+@@ -0,0 +1,36 @@
++/* -*- buffer-read-only: t -*- vi: set ro: */
++/* DO NOT EDIT! GENERATED AUTOMATICALLY! */
++/* read-file.h -- read file contents into a string
++   Copyright (C) 2006, 2009-2011 Free Software Foundation, Inc.
++   Written by Simon Josefsson.
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3, or (at your option)
++   any later version.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program; if not, write to the Free Software Foundation,
++   Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.  */
++
++#ifndef READ_FILE_H
++#define READ_FILE_H
++
++/* Get size_t.  */
++#include <stddef.h>
++
++/* Get FILE.  */
++#include <stdio.h>
++
++extern char *fread_file (FILE * stream, size_t * length);
++
++extern char *read_file (const char *filename, size_t * length);
++
++extern char *read_binary_file (const char *filename, size_t * length);
++
++#endif /* READ_FILE_H */
+-- 
+1.7.9.7
+
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
index 761b2e6..a3b4359 100644
--- a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://fix-disable-ipv6.patch \
            file://disable-pre-ANSI-compilers.patch \
            file://remove_gets.patch \
+           file://0001-fix-the-issue-of-ifconfig-a-that-can-not-display-all.patch \
 " 
 SRC_URI[md5sum] = "ad8fdcdf1797b9ca258264a6b04e48fd"
 SRC_URI[sha256sum] = "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29abf25b52b68311c7"
-- 
1.7.0.4




