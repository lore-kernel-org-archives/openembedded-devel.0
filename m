Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1Nll3q-0007v5-21
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 16:28:07 +0100
Received: from [192.168.1.135] (95-90-75-53-dynip.superkabel.de [95.90.75.53])
	by dd20204.kasserver.com (Postfix) with ESMTP id 0B0CE1827F698
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 16:25:14 +0100 (CET)
Message-ID: <4B8A8AD9.9040201@opensimpad.org>
Date: Sun, 28 Feb 2010 16:25:13 +0100
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: Bernhard.Guillon@opensimpad.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: uclibc: attr, acl, udev-151
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
X-List-Received-Date: Sun, 28 Feb 2010 15:28:07 -0000
Content-Type: multipart/mixed; boundary="------------070706000602050409050605"

--------------070706000602050409050605
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
today I tried to get udev-151 to compile with uclibc for AVR32. I
attached the resulting patches. For adding them to oe they are not
enough tested and the udev patch is a really _ugly_ hack. It compiles
with uclibc 0.9.30.2 (I needed to update angstroms config). The patches
for attr and acl might be worth pushing them after some clean up.

Anyone want to try and test the patches?
I was able to boot the rootfs and start udev without crashing ;)

Is using mdev or trying to port the eglibc/glibc AVR32 stuff from debian 
a better option?

Best regards
Bernhard Guillon


--------------070706000602050409050605
Content-Type: text/x-patch;
 name="0001-udev-151-add-hack-to-compile-udev-151-with-uclibc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-udev-151-add-hack-to-compile-udev-151-with-uclibc.patch"

From e3b2ff83f8d2fa29d0c13dce65492c66b25c64be Mon Sep 17 00:00:00 2001
From: Bernhard <bguillon@cosy.sbg.ac.at>
Date: Sun, 28 Feb 2010 15:54:52 +0100
Subject: [PATCH] udev-151: add hack to compile udev-151 with uclibc


Signed-off-by: Bernhard <bguillon@cosy.sbg.ac.at>
---
 recipes/udev/files/udev-uclibc-0.9.30.2.HACK |  120 ++++++++++++++++++++++++++
 recipes/udev/udev_151.bb                     |    4 +-
 2 files changed, 123 insertions(+), 1 deletions(-)
 create mode 100644 recipes/udev/files/udev-uclibc-0.9.30.2.HACK

diff --git a/recipes/udev/files/udev-uclibc-0.9.30.2.HACK b/recipes/udev/files/udev-uclibc-0.9.30.2.HACK
new file mode 100644
index 0000000..72658c5
--- /dev/null
+++ b/recipes/udev/files/udev-uclibc-0.9.30.2.HACK
@@ -0,0 +1,120 @@
+diff -Nur udev-151.vanilla/extras/ata_id/ata_id.c udev-151/extras/ata_id/ata_id.c
+--- udev-151.vanilla/extras/ata_id/ata_id.c	2009-12-08 18:43:09.000000000 +0100
++++ udev-151/extras/ata_id/ata_id.c	2010-02-28 15:32:48.000000000 +0100
+@@ -47,6 +47,8 @@
+ 
+ #define COMMAND_TIMEOUT 2000
+ 
++#define le16toh __le16_to_cpu 
++
+ /* Sends a SCSI command block */
+ static int sg_io(int fd, int direction,
+ 		 const void *cdb, size_t cdb_len,
+diff -Nur udev-151.vanilla/libudev/libudev-monitor.c udev-151/libudev/libudev-monitor.c
+--- udev-151.vanilla/libudev/libudev-monitor.c	2009-12-03 13:45:03.000000000 +0100
++++ udev-151/libudev/libudev-monitor.c	2010-02-28 15:32:48.000000000 +0100
+@@ -18,7 +18,9 @@
+ #include <dirent.h>
+ #include <sys/poll.h>
+ #include <sys/stat.h>
+-#include <sys/socket.h>
++#include <linux/socket.h>
++#include <linux/net.h>
++#include <linux/fcntl.h>
+ #include <sys/un.h>
+ #include <arpa/inet.h>
+ #include <linux/netlink.h>
+@@ -27,6 +29,9 @@
+ #include "libudev.h"
+ #include "libudev-private.h"
+ 
++//define SOCK_CLOEXEC as  O_CLOEXEC see bits/socket.h
++#define SOCK_CLOEXEC O_CLOEXEC
++
+ /**
+  * SECTION:libudev-monitor
+  * @short_description: device event source
+diff -Nur udev-151.vanilla/udev/udev-node.c udev-151/udev/udev-node.c
+--- udev-151.vanilla/udev/udev-node.c	2010-01-26 13:44:02.000000000 +0100
++++ udev-151/udev/udev-node.c	2010-02-28 15:32:48.000000000 +0100
+@@ -178,7 +178,10 @@
+ 					info(udev, "preserve already existing symlink '%s' to '%s'\n",
+ 					     slink, target);
+ 					udev_selinux_lsetfilecon(udev, slink, S_IFLNK);
+-					lutimes(slink, NULL);
++//HACK MAKE THIS CODE NONWORKING :D
++//lutimes(slink, NULL);
++
++					utimes(slink, NULL);
+ 					goto exit;
+ 				}
+ 			}
+diff -Nur udev-151.vanilla/udev/udev-watch.c udev-151/udev/udev-watch.c
+--- udev-151.vanilla/udev/udev-watch.c	2009-12-03 13:45:05.000000000 +0100
++++ udev-151/udev/udev-watch.c	2010-02-28 15:32:48.000000000 +0100
+@@ -19,14 +19,16 @@
+ 
+ #include <sys/types.h>
+ #include <errno.h>
+-#include <fcntl.h>
++#include <linux/fcntl.h>
+ #include <stdio.h>
+ #include <dirent.h>
+ #include <stddef.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+-#include <sys/inotify.h>
++#include <linux/inotify.h>
++//#include <sys/inotify.h>
++
+ 
+ #include "udev.h"
+ 
+@@ -38,7 +40,10 @@
+  */
+ int udev_watch_init(struct udev *udev)
+ {
+-	inotify_fd = inotify_init1(IN_CLOEXEC);
++
++//HACK BREAK THIS CODE :D
++//	inotify_fd = inotify_init1(IN_CLOEXEC);
++ inotify_fd = inotify_init();
+ 	if (inotify_fd < 0)
+ 		err(udev, "inotify_init failed: %m\n");
+ 	return inotify_fd;
+diff -Nur udev-151.vanilla/udev/udevd.c udev-151/udev/udevd.c
+--- udev-151.vanilla/udev/udevd.c	2010-01-13 12:39:36.000000000 +0100
++++ udev-151/udev/udevd.c	2010-02-28 15:32:48.000000000 +0100
+@@ -27,13 +27,15 @@
+ #include <stdbool.h>
+ #include <string.h>
+ #include <ctype.h>
+-#include <fcntl.h>
++#include <linux/fcntl.h>
+ #include <time.h>
+ #include <getopt.h>
+ #include <dirent.h>
+ #include <sys/time.h>
+ #include <sys/prctl.h>
+ #include <sys/socket.h>
++//#include <linux/socket.h>
++//#include <linux/net.h>
+ #include <sys/signalfd.h>
+ #include <sys/select.h>
+ #include <sys/poll.h>
+@@ -42,11 +44,14 @@
+ #include <sys/ioctl.h>
+ #include <sys/inotify.h>
+ 
++
+ #include "udev.h"
+ 
+ #define UDEVD_PRIORITY			-4
+ #define UDEV_PRIORITY			-2
+ 
++#define SOCK_CLOEXEC O_CLOEXEC
++
+ static bool debug;
+ 
+ static void log_fn(struct udev *udev, int priority,
diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
index ee31b27..c79e27a 100644
--- a/recipes/udev/udev_151.bb
+++ b/recipes/udev/udev_151.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "udev is a daemon which dynamically creates and removes device nod
 the hotplug package and requires a kernel not older than 2.6.12."
 LICENSE = "GPL"
 
-PR = "r3"
+PR = "r4"
 
 # Untested
 DEFAULT_PREFERENCE = "-1"
@@ -42,6 +42,8 @@ SRC_URI_append_bug = " \
 
 PACKAGE_ARCH_bug = "bug"
 
+SRC_URI_append_linux-uclibc = " file://udev-uclibc-0.9.30.2.HACK;patch=1 "
+
 inherit update-rc.d autotools
 
 EXTRA_OECONF += " --with-udev-prefix= \
-- 
1.5.6.5



--------------070706000602050409050605
Content-Type: text/x-patch;
 name="0002-angstrom-2008.1.conf-update-uclibc-to-uclibc-0.9.30.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0002-angstrom-2008.1.conf-update-uclibc-to-uclibc-0.9.30.pat";
 filename*1="ch"

From f975281b7a52812ef026a67facc8666e0db39f40 Mon Sep 17 00:00:00 2001
From: Bernhard <bguillon@cosy.sbg.ac.at>
Date: Sun, 28 Feb 2010 15:58:17 +0100
Subject: [PATCH] angstrom-2008.1.conf: update uclibc to uclibc 0.9.30.2


Signed-off-by: Bernhard <bguillon@cosy.sbg.ac.at>
---
 conf/distro/angstrom-2008.1.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index c4562cb..225e218 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -84,8 +84,8 @@ PREFERRED_VERSION_linux-libc-headers 	= "2.6.31"
 #Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
 PREFERRED_VERSION_glibc 		?= "2.9"
 PREFERRED_VERSION_glibc-initial 	?= "2.9"
-PREFERRED_VERSION_uclibc        	?= "0.9.30.1"
-PREFERRED_VERSION_uclibc-initial	?= "0.9.30.1"
+PREFERRED_VERSION_uclibc        	?= "0.9.30.2"
+PREFERRED_VERSION_uclibc-initial	?= "0.9.30.2"
 
 #powerpc needs additional patches to gcc
 ANGSTROM_GCC_VERSION_ppc405 		?= "4.1.1"
-- 
1.5.6.5



--------------070706000602050409050605
Content-Type: text/x-patch;
 name="0002-attr-add-gettext-hack-for-uclibc-bump-PR.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0002-attr-add-gettext-hack-for-uclibc-bump-PR.patch"

From d8af51bc314f709ba86c05e3b9305e9abc6e701d Mon Sep 17 00:00:00 2001
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
Date: Fri, 26 Feb 2010 19:55:15 +0100
Subject: [PATCH 2/3] attr: add gettext hack for uclibc, bump PR


Signed-off-by: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
---
 recipes/udev/attr_2.4.44.bb                 |    8 +-
 recipes/udev/files/attr.uclibc.gettext.HACK |  311 +++++++++++++++++++++++++++
 2 files changed, 316 insertions(+), 3 deletions(-)
 create mode 100644 recipes/udev/files/attr.uclibc.gettext.HACK

diff --git a/recipes/udev/attr_2.4.44.bb b/recipes/udev/attr_2.4.44.bb
index 7cb9217..78cdf7c 100644
--- a/recipes/udev/attr_2.4.44.bb
+++ b/recipes/udev/attr_2.4.44.bb
@@ -1,14 +1,16 @@
 DESCRIPTION = "Commands for Manipulating Filesystem Extended Attributes"
 LICENSE = "GPLv2"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "http://mirror.its.uidaho.edu/pub/savannah/attr/attr-${PV}.src.tar.gz"
+SRC_URI = "http://mirror.its.uidaho.edu/pub/savannah/attr/attr-${PV}.src.tar.gz "
+
+SRC_URI_append_linux-uclibc = " file://attr.uclibc.gettext.HACK;patch=1 "
 
 inherit gettext autotools lib_package
 
 EXTRA_OECONF = " --enable-gettext=yes ac_cv_path_XGETTEXT=${STAGING_BINDIR_NATIVE}/xgettext"
-
+#EXTRA_OECONF = " --enable-gettext=no"
 do_configure_append() {
 	# gettext hack
 	echo "#define _(str) str" >> ${S}/include/config.h
diff --git a/recipes/udev/files/attr.uclibc.gettext.HACK b/recipes/udev/files/attr.uclibc.gettext.HACK
new file mode 100644
index 0000000..ecbb79b
--- /dev/null
+++ b/recipes/udev/files/attr.uclibc.gettext.HACK
@@ -0,0 +1,311 @@
+diff -Nur attr-2.4.44.vanilla/attr/attr.c attr-2.4.44/attr/attr.c
+--- attr-2.4.44.vanilla/attr/attr.c	2009-07-31 11:02:14.000000000 +0200
++++ attr-2.4.44/attr/attr.c	2010-02-26 19:06:59.527548378 +0100
+@@ -30,6 +30,8 @@
+ #include <attr/attributes.h>
+ #include "config.h"
+ 
++#include "../gettext.h"
++
+ #define	SETOP		1		/* do a SET operation */
+ #define	GETOP		2		/* do a GET operation */
+ #define	REMOVEOP	3		/* do a REMOVE operation */
+diff -Nur attr-2.4.44.vanilla/getfattr/getfattr.c attr-2.4.44/getfattr/getfattr.c
+--- attr-2.4.44.vanilla/getfattr/getfattr.c	2009-07-31 11:03:50.000000000 +0200
++++ attr-2.4.44/getfattr/getfattr.c	2010-02-26 19:07:25.718548780 +0100
+@@ -33,6 +33,8 @@
+ #include "walk_tree.h"
+ #include "misc.h"
+ 
++#include "../gettext.h"
++
+ #define CMD_LINE_OPTIONS "n:de:m:hRLP"
+ #define CMD_LINE_SPEC "[-hRLP] [-n name|-d] [-e en] [-m pattern] path..."
+ 
+diff -Nur attr-2.4.44.vanilla/gettext.h attr-2.4.44/gettext.h
+--- attr-2.4.44.vanilla/gettext.h	1970-01-01 01:00:00.000000000 +0100
++++ attr-2.4.44/gettext.h	2010-02-26 19:06:30.662546095 +0100
+@@ -0,0 +1,271 @@
++/* Convenience header for conditional use of GNU <libintl.h>.
++   Copyright (C) 1995-1998, 2000-2002, 2004-2006 Free Software Foundation, Inc.
++
++   This program is free software; you can redistribute it and/or modify it
++   under the terms of the GNU General Public License as published
++   by the Free Software Foundation; either version 2, or (at your option)
++   any later version.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Library General Public License for more details.
++
++   You should have received a copy of the GNU General Public
++   License along with this program; if not, write to the Free Software
++   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
++   USA.  */
++
++#ifndef _LIBGETTEXT_H
++#define _LIBGETTEXT_H 1
++
++/* NLS can be disabled through the configure --disable-nls option.  */
++#if ENABLE_NLS
++
++/* Get declarations of GNU message catalog functions.  */
++# include <libintl.h>
++
++/* You can set the DEFAULT_TEXT_DOMAIN macro to specify the domain used by
++   the gettext() and ngettext() macros.  This is an alternative to calling
++   textdomain(), and is useful for libraries.  */
++# ifdef DEFAULT_TEXT_DOMAIN
++#  undef gettext
++#  define gettext(Msgid) \
++     dgettext (DEFAULT_TEXT_DOMAIN, Msgid)
++#  undef ngettext
++#  define ngettext(Msgid1, Msgid2, N) \
++     dngettext (DEFAULT_TEXT_DOMAIN, Msgid1, Msgid2, N)
++# endif
++
++#else
++
++/* Solaris /usr/include/locale.h includes /usr/include/libintl.h, which
++   chokes if dcgettext is defined as a macro.  So include it now, to make
++   later inclusions of <locale.h> a NOP.  We don't include <libintl.h>
++   as well because people using "gettext.h" will not include <libintl.h>,
++   and also including <libintl.h> would fail on SunOS 4, whereas <locale.h>
++   is OK.  */
++#if defined(__sun)
++# include <locale.h>
++#endif
++
++/* Many header files from the libstdc++ coming with g++ 3.3 or newer include
++   <libintl.h>, which chokes if dcgettext is defined as a macro.  So include
++   it now, to make later inclusions of <libintl.h> a NOP.  */
++#if defined(__cplusplus) && defined(__GNUG__) && (__GNUC__ >= 3)
++# include <cstdlib>
++# if (__GLIBC__ >= 2) || _GLIBCXX_HAVE_LIBINTL_H
++#  include <libintl.h>
++# endif
++#endif
++
++/* Disabled NLS.
++   The casts to 'const char *' serve the purpose of producing warnings
++   for invalid uses of the value returned from these functions.
++   On pre-ANSI systems without 'const', the config.h file is supposed to
++   contain "#define const".  */
++# define gettext(Msgid) ((const char *) (Msgid))
++# define dgettext(Domainname, Msgid) ((void) (Domainname), gettext (Msgid))
++# define dcgettext(Domainname, Msgid, Category) \
++    ((void) (Category), dgettext (Domainname, Msgid))
++# define ngettext(Msgid1, Msgid2, N) \
++    ((N) == 1 \
++     ? ((void) (Msgid2), (const char *) (Msgid1)) \
++     : ((void) (Msgid1), (const char *) (Msgid2)))
++# define dngettext(Domainname, Msgid1, Msgid2, N) \
++    ((void) (Domainname), ngettext (Msgid1, Msgid2, N))
++# define dcngettext(Domainname, Msgid1, Msgid2, N, Category) \
++    ((void) (Category), dngettext(Domainname, Msgid1, Msgid2, N))
++# define textdomain(Domainname) ((const char *) (Domainname))
++# define bindtextdomain(Domainname, Dirname) \
++    ((void) (Domainname), (const char *) (Dirname))
++# define bind_textdomain_codeset(Domainname, Codeset) \
++    ((void) (Domainname), (const char *) (Codeset))
++
++#endif
++
++/* A pseudo function call that serves as a marker for the automated
++   extraction of messages, but does not call gettext().  The run-time
++   translation is done at a different place in the code.
++   The argument, String, should be a literal string.  Concatenated strings
++   and other string expressions won't work.
++   The macro's expansion is not parenthesized, so that it is suitable as
++   initializer for static 'char[]' or 'const char[]' variables.  */
++#define gettext_noop(String) String
++
++/* The separator between msgctxt and msgid in a .mo file.  */
++#define GETTEXT_CONTEXT_GLUE "\004"
++
++/* Pseudo function calls, taking a MSGCTXT and a MSGID instead of just a
++   MSGID.  MSGCTXT and MSGID must be string literals.  MSGCTXT should be
++   short and rarely need to change.
++   The letter 'p' stands for 'particular' or 'special'.  */
++#ifdef DEFAULT_TEXT_DOMAIN
++# define pgettext(Msgctxt, Msgid) \
++   pgettext_aux (DEFAULT_TEXT_DOMAIN, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, LC_MESSAGES)
++#else
++# define pgettext(Msgctxt, Msgid) \
++   pgettext_aux (NULL, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, LC_MESSAGES)
++#endif
++#define dpgettext(Domainname, Msgctxt, Msgid) \
++  pgettext_aux (Domainname, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, LC_MESSAGES)
++#define dcpgettext(Domainname, Msgctxt, Msgid, Category) \
++  pgettext_aux (Domainname, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, Category)
++#ifdef DEFAULT_TEXT_DOMAIN
++# define npgettext(Msgctxt, Msgid, MsgidPlural, N) \
++   npgettext_aux (DEFAULT_TEXT_DOMAIN, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, MsgidPlural, N, LC_MESSAGES)
++#else
++# define npgettext(Msgctxt, Msgid, MsgidPlural, N) \
++   npgettext_aux (NULL, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, MsgidPlural, N, LC_MESSAGES)
++#endif
++#define dnpgettext(Domainname, Msgctxt, Msgid, MsgidPlural, N) \
++  npgettext_aux (Domainname, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, MsgidPlural, N, LC_MESSAGES)
++#define dcnpgettext(Domainname, Msgctxt, Msgid, MsgidPlural, N, Category) \
++  npgettext_aux (Domainname, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, MsgidPlural, N, Category)
++
++#ifdef __GNUC__
++__inline
++#else
++#ifdef __cplusplus
++inline
++#endif
++#endif
++static const char *
++pgettext_aux (const char *domain,
++	      const char *msg_ctxt_id, const char *msgid,
++	      int category)
++{
++  const char *translation = dcgettext (domain, msg_ctxt_id, category);
++  if (translation == msg_ctxt_id)
++    return msgid;
++  else
++    return translation;
++}
++
++#ifdef __GNUC__
++__inline
++#else
++#ifdef __cplusplus
++inline
++#endif
++#endif
++static const char *
++npgettext_aux (const char *domain,
++	       const char *msg_ctxt_id, const char *msgid,
++	       const char *msgid_plural, unsigned long int n,
++	       int category)
++{
++  const char *translation =
++    dcngettext (domain, msg_ctxt_id, msgid_plural, n, category);
++  if (translation == msg_ctxt_id || translation == msgid_plural)
++    return (n == 1 ? msgid : msgid_plural);
++  else
++    return translation;
++}
++
++/* The same thing extended for non-constant arguments.  Here MSGCTXT and MSGID
++   can be arbitrary expressions.  But for string literals these macros are
++   less efficient than those above.  */
++
++#include <string.h>
++
++#define _LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS \
++  (((__GNUC__ >= 3 || __GNUG__ >= 2) && !__STRICT_ANSI__) \
++   /* || __STDC_VERSION__ >= 199901L */ )
++
++#if !_LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++#include <stdlib.h>
++#endif
++
++#define pgettext_expr(Msgctxt, Msgid) \
++  dcpgettext_expr (NULL, Msgctxt, Msgid, LC_MESSAGES)
++#define dpgettext_expr(Domainname, Msgctxt, Msgid) \
++  dcpgettext_expr (Domainname, Msgctxt, Msgid, LC_MESSAGES)
++
++#ifdef __GNUC__
++__inline
++#else
++#ifdef __cplusplus
++inline
++#endif
++#endif
++static const char *
++dcpgettext_expr (const char *domain,
++		 const char *msgctxt, const char *msgid,
++		 int category)
++{
++  size_t msgctxt_len = strlen (msgctxt) + 1;
++  size_t msgid_len = strlen (msgid) + 1;
++  const char *translation;
++#if _LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++  char msg_ctxt_id[msgctxt_len + msgid_len];
++#else
++  char buf[1024];
++  char *msg_ctxt_id =
++    (msgctxt_len + msgid_len <= sizeof (buf)
++     ? buf
++     : (char *) malloc (msgctxt_len + msgid_len));
++  if (msg_ctxt_id != NULL)
++#endif
++    {
++      memcpy (msg_ctxt_id, msgctxt, msgctxt_len - 1);
++      msg_ctxt_id[msgctxt_len - 1] = '\004';
++      memcpy (msg_ctxt_id + msgctxt_len, msgid, msgid_len);
++      translation = dcgettext (domain, msg_ctxt_id, category);
++#if !_LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++      if (msg_ctxt_id != buf)
++	free (msg_ctxt_id);
++#endif
++      if (translation != msg_ctxt_id)
++	return translation;
++    }
++  return msgid;
++}
++
++#define npgettext_expr(Msgctxt, Msgid, MsgidPlural, N) \
++  dcnpgettext_expr (NULL, Msgctxt, Msgid, MsgidPlural, N, LC_MESSAGES)
++#define dnpgettext_expr(Domainname, Msgctxt, Msgid, MsgidPlural, N) \
++  dcnpgettext_expr (Domainname, Msgctxt, Msgid, MsgidPlural, N, LC_MESSAGES)
++
++#ifdef __GNUC__
++__inline
++#else
++#ifdef __cplusplus
++inline
++#endif
++#endif
++static const char *
++dcnpgettext_expr (const char *domain,
++		  const char *msgctxt, const char *msgid,
++		  const char *msgid_plural, unsigned long int n,
++		  int category)
++{
++  size_t msgctxt_len = strlen (msgctxt) + 1;
++  size_t msgid_len = strlen (msgid) + 1;
++  const char *translation;
++#if _LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++  char msg_ctxt_id[msgctxt_len + msgid_len];
++#else
++  char buf[1024];
++  char *msg_ctxt_id =
++    (msgctxt_len + msgid_len <= sizeof (buf)
++     ? buf
++     : (char *) malloc (msgctxt_len + msgid_len));
++  if (msg_ctxt_id != NULL)
++#endif
++    {
++      memcpy (msg_ctxt_id, msgctxt, msgctxt_len - 1);
++      msg_ctxt_id[msgctxt_len - 1] = '\004';
++      memcpy (msg_ctxt_id + msgctxt_len, msgid, msgid_len);
++      translation = dcngettext (domain, msg_ctxt_id, msgid_plural, n, category);
++#if !_LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++      if (msg_ctxt_id != buf)
++	free (msg_ctxt_id);
++#endif
++      if (!(translation == msg_ctxt_id || translation == msgid_plural))
++	return translation;
++    }
++  return (n == 1 ? msgid : msgid_plural);
++}
++
++#endif /* _LIBGETTEXT_H */
+diff -Nur attr-2.4.44.vanilla/setfattr/setfattr.c attr-2.4.44/setfattr/setfattr.c
+--- attr-2.4.44.vanilla/setfattr/setfattr.c	2009-07-31 11:03:50.000000000 +0200
++++ attr-2.4.44/setfattr/setfattr.c	2010-02-26 19:07:35.966552805 +0100
+@@ -31,6 +31,8 @@
+ #include "config.h"
+ #include "misc.h"
+ 
++#include "../gettext.h"
++
+ #define CMD_LINE_OPTIONS "n:x:v:h"
+ #define CMD_LINE_SPEC1 "{-n name} [-v value] [-h] file..."
+ #define CMD_LINE_SPEC2 "{-x name} [-h] file..."
-- 
1.6.3.3



--------------070706000602050409050605
Content-Type: text/x-patch;
 name="0003-acl-add-gettext-hack-for-uclibc-bump-PR.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="0003-acl-add-gettext-hack-for-uclibc-bump-PR.patch"

From 9d972705a38a280d877dc3179cb8a8fa659b4fbb Mon Sep 17 00:00:00 2001
From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
Date: Fri, 26 Feb 2010 20:22:50 +0100
Subject: [PATCH 3/3] acl: add gettext hack for uclibc, bump PR


Signed-off-by: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
---
 recipes/udev/acl_2.2.49.bb                |    4 +-
 recipes/udev/files/acl.ulibc.gettext.HACK |  311 +++++++++++++++++++++++++++++
 2 files changed, 314 insertions(+), 1 deletions(-)
 create mode 100644 recipes/udev/files/acl.ulibc.gettext.HACK

diff --git a/recipes/udev/acl_2.2.49.bb b/recipes/udev/acl_2.2.49.bb
index b2b1272..ccd73e1 100644
--- a/recipes/udev/acl_2.2.49.bb
+++ b/recipes/udev/acl_2.2.49.bb
@@ -1,12 +1,14 @@
 DESCRIPTION = "Commands for Manipulating POSIX Access Control Lists"
 LICENSE = "GPLv2"
 
-PR = "r1" 
+PR = "r2" 
 
 DEPENDS = "attr"
 
 SRC_URI = "http://mirror.its.uidaho.edu/pub/savannah/acl/acl-${PV}.src.tar.gz"
 
+SRC_URI_append_linux-uclibc = " file://acl.ulibc.gettext.HACK;patch=1 "
+
 inherit autotools lib_package
 
 EXTRA_OECONF = " --enable-gettext=yes ac_cv_path_XGETTEXT=${STAGING_BINDIR_NATIVE}/xgettext"
diff --git a/recipes/udev/files/acl.ulibc.gettext.HACK b/recipes/udev/files/acl.ulibc.gettext.HACK
new file mode 100644
index 0000000..e01999d
--- /dev/null
+++ b/recipes/udev/files/acl.ulibc.gettext.HACK
@@ -0,0 +1,311 @@
+diff -Nur acl-2.2.49.vanilla/chacl/chacl.c acl-2.2.49/chacl/chacl.c
+--- acl-2.2.49.vanilla/chacl/chacl.c	2009-06-22 20:37:31.000000000 +0200
++++ acl-2.2.49/chacl/chacl.c	2010-02-26 20:18:13.750565624 +0100
+@@ -32,6 +32,8 @@
+ #include <locale.h>
+ #include "config.h"
+ 
++#include "../gettext.h"
++
+ static int acl_delete_file (const char * path, acl_type_t type);
+ static int list_acl(char *file);
+ static int set_acl(acl_t acl, acl_t dacl, const char *fname);
+diff -Nur acl-2.2.49.vanilla/getfacl/getfacl.c acl-2.2.49/getfacl/getfacl.c
+--- acl-2.2.49.vanilla/getfacl/getfacl.c	2009-06-29 21:17:25.000000000 +0200
++++ acl-2.2.49/getfacl/getfacl.c	2010-02-26 20:17:47.318562563 +0100
+@@ -40,6 +40,8 @@
+ #include "walk_tree.h"
+ #include "misc.h"
+ 
++#include "../gettext.h"
++
+ #define POSIXLY_CORRECT_STR "POSIXLY_CORRECT"
+ 
+ #if !POSIXLY_CORRECT
+diff -Nur acl-2.2.49.vanilla/gettext.h acl-2.2.49/gettext.h
+--- acl-2.2.49.vanilla/gettext.h	1970-01-01 01:00:00.000000000 +0100
++++ acl-2.2.49/gettext.h	2010-02-26 20:17:17.871546058 +0100
+@@ -0,0 +1,271 @@
++/* Convenience header for conditional use of GNU <libintl.h>.
++   Copyright (C) 1995-1998, 2000-2002, 2004-2006 Free Software Foundation, Inc.
++
++   This program is free software; you can redistribute it and/or modify it
++   under the terms of the GNU General Public License as published
++   by the Free Software Foundation; either version 2, or (at your option)
++   any later version.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Library General Public License for more details.
++
++   You should have received a copy of the GNU General Public
++   License along with this program; if not, write to the Free Software
++   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
++   USA.  */
++
++#ifndef _LIBGETTEXT_H
++#define _LIBGETTEXT_H 1
++
++/* NLS can be disabled through the configure --disable-nls option.  */
++#if ENABLE_NLS
++
++/* Get declarations of GNU message catalog functions.  */
++# include <libintl.h>
++
++/* You can set the DEFAULT_TEXT_DOMAIN macro to specify the domain used by
++   the gettext() and ngettext() macros.  This is an alternative to calling
++   textdomain(), and is useful for libraries.  */
++# ifdef DEFAULT_TEXT_DOMAIN
++#  undef gettext
++#  define gettext(Msgid) \
++     dgettext (DEFAULT_TEXT_DOMAIN, Msgid)
++#  undef ngettext
++#  define ngettext(Msgid1, Msgid2, N) \
++     dngettext (DEFAULT_TEXT_DOMAIN, Msgid1, Msgid2, N)
++# endif
++
++#else
++
++/* Solaris /usr/include/locale.h includes /usr/include/libintl.h, which
++   chokes if dcgettext is defined as a macro.  So include it now, to make
++   later inclusions of <locale.h> a NOP.  We don't include <libintl.h>
++   as well because people using "gettext.h" will not include <libintl.h>,
++   and also including <libintl.h> would fail on SunOS 4, whereas <locale.h>
++   is OK.  */
++#if defined(__sun)
++# include <locale.h>
++#endif
++
++/* Many header files from the libstdc++ coming with g++ 3.3 or newer include
++   <libintl.h>, which chokes if dcgettext is defined as a macro.  So include
++   it now, to make later inclusions of <libintl.h> a NOP.  */
++#if defined(__cplusplus) && defined(__GNUG__) && (__GNUC__ >= 3)
++# include <cstdlib>
++# if (__GLIBC__ >= 2) || _GLIBCXX_HAVE_LIBINTL_H
++#  include <libintl.h>
++# endif
++#endif
++
++/* Disabled NLS.
++   The casts to 'const char *' serve the purpose of producing warnings
++   for invalid uses of the value returned from these functions.
++   On pre-ANSI systems without 'const', the config.h file is supposed to
++   contain "#define const".  */
++# define gettext(Msgid) ((const char *) (Msgid))
++# define dgettext(Domainname, Msgid) ((void) (Domainname), gettext (Msgid))
++# define dcgettext(Domainname, Msgid, Category) \
++    ((void) (Category), dgettext (Domainname, Msgid))
++# define ngettext(Msgid1, Msgid2, N) \
++    ((N) == 1 \
++     ? ((void) (Msgid2), (const char *) (Msgid1)) \
++     : ((void) (Msgid1), (const char *) (Msgid2)))
++# define dngettext(Domainname, Msgid1, Msgid2, N) \
++    ((void) (Domainname), ngettext (Msgid1, Msgid2, N))
++# define dcngettext(Domainname, Msgid1, Msgid2, N, Category) \
++    ((void) (Category), dngettext(Domainname, Msgid1, Msgid2, N))
++# define textdomain(Domainname) ((const char *) (Domainname))
++# define bindtextdomain(Domainname, Dirname) \
++    ((void) (Domainname), (const char *) (Dirname))
++# define bind_textdomain_codeset(Domainname, Codeset) \
++    ((void) (Domainname), (const char *) (Codeset))
++
++#endif
++
++/* A pseudo function call that serves as a marker for the automated
++   extraction of messages, but does not call gettext().  The run-time
++   translation is done at a different place in the code.
++   The argument, String, should be a literal string.  Concatenated strings
++   and other string expressions won't work.
++   The macro's expansion is not parenthesized, so that it is suitable as
++   initializer for static 'char[]' or 'const char[]' variables.  */
++#define gettext_noop(String) String
++
++/* The separator between msgctxt and msgid in a .mo file.  */
++#define GETTEXT_CONTEXT_GLUE "\004"
++
++/* Pseudo function calls, taking a MSGCTXT and a MSGID instead of just a
++   MSGID.  MSGCTXT and MSGID must be string literals.  MSGCTXT should be
++   short and rarely need to change.
++   The letter 'p' stands for 'particular' or 'special'.  */
++#ifdef DEFAULT_TEXT_DOMAIN
++# define pgettext(Msgctxt, Msgid) \
++   pgettext_aux (DEFAULT_TEXT_DOMAIN, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, LC_MESSAGES)
++#else
++# define pgettext(Msgctxt, Msgid) \
++   pgettext_aux (NULL, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, LC_MESSAGES)
++#endif
++#define dpgettext(Domainname, Msgctxt, Msgid) \
++  pgettext_aux (Domainname, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, LC_MESSAGES)
++#define dcpgettext(Domainname, Msgctxt, Msgid, Category) \
++  pgettext_aux (Domainname, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, Category)
++#ifdef DEFAULT_TEXT_DOMAIN
++# define npgettext(Msgctxt, Msgid, MsgidPlural, N) \
++   npgettext_aux (DEFAULT_TEXT_DOMAIN, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, MsgidPlural, N, LC_MESSAGES)
++#else
++# define npgettext(Msgctxt, Msgid, MsgidPlural, N) \
++   npgettext_aux (NULL, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, MsgidPlural, N, LC_MESSAGES)
++#endif
++#define dnpgettext(Domainname, Msgctxt, Msgid, MsgidPlural, N) \
++  npgettext_aux (Domainname, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, MsgidPlural, N, LC_MESSAGES)
++#define dcnpgettext(Domainname, Msgctxt, Msgid, MsgidPlural, N, Category) \
++  npgettext_aux (Domainname, Msgctxt GETTEXT_CONTEXT_GLUE Msgid, Msgid, MsgidPlural, N, Category)
++
++#ifdef __GNUC__
++__inline
++#else
++#ifdef __cplusplus
++inline
++#endif
++#endif
++static const char *
++pgettext_aux (const char *domain,
++	      const char *msg_ctxt_id, const char *msgid,
++	      int category)
++{
++  const char *translation = dcgettext (domain, msg_ctxt_id, category);
++  if (translation == msg_ctxt_id)
++    return msgid;
++  else
++    return translation;
++}
++
++#ifdef __GNUC__
++__inline
++#else
++#ifdef __cplusplus
++inline
++#endif
++#endif
++static const char *
++npgettext_aux (const char *domain,
++	       const char *msg_ctxt_id, const char *msgid,
++	       const char *msgid_plural, unsigned long int n,
++	       int category)
++{
++  const char *translation =
++    dcngettext (domain, msg_ctxt_id, msgid_plural, n, category);
++  if (translation == msg_ctxt_id || translation == msgid_plural)
++    return (n == 1 ? msgid : msgid_plural);
++  else
++    return translation;
++}
++
++/* The same thing extended for non-constant arguments.  Here MSGCTXT and MSGID
++   can be arbitrary expressions.  But for string literals these macros are
++   less efficient than those above.  */
++
++#include <string.h>
++
++#define _LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS \
++  (((__GNUC__ >= 3 || __GNUG__ >= 2) && !__STRICT_ANSI__) \
++   /* || __STDC_VERSION__ >= 199901L */ )
++
++#if !_LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++#include <stdlib.h>
++#endif
++
++#define pgettext_expr(Msgctxt, Msgid) \
++  dcpgettext_expr (NULL, Msgctxt, Msgid, LC_MESSAGES)
++#define dpgettext_expr(Domainname, Msgctxt, Msgid) \
++  dcpgettext_expr (Domainname, Msgctxt, Msgid, LC_MESSAGES)
++
++#ifdef __GNUC__
++__inline
++#else
++#ifdef __cplusplus
++inline
++#endif
++#endif
++static const char *
++dcpgettext_expr (const char *domain,
++		 const char *msgctxt, const char *msgid,
++		 int category)
++{
++  size_t msgctxt_len = strlen (msgctxt) + 1;
++  size_t msgid_len = strlen (msgid) + 1;
++  const char *translation;
++#if _LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++  char msg_ctxt_id[msgctxt_len + msgid_len];
++#else
++  char buf[1024];
++  char *msg_ctxt_id =
++    (msgctxt_len + msgid_len <= sizeof (buf)
++     ? buf
++     : (char *) malloc (msgctxt_len + msgid_len));
++  if (msg_ctxt_id != NULL)
++#endif
++    {
++      memcpy (msg_ctxt_id, msgctxt, msgctxt_len - 1);
++      msg_ctxt_id[msgctxt_len - 1] = '\004';
++      memcpy (msg_ctxt_id + msgctxt_len, msgid, msgid_len);
++      translation = dcgettext (domain, msg_ctxt_id, category);
++#if !_LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++      if (msg_ctxt_id != buf)
++	free (msg_ctxt_id);
++#endif
++      if (translation != msg_ctxt_id)
++	return translation;
++    }
++  return msgid;
++}
++
++#define npgettext_expr(Msgctxt, Msgid, MsgidPlural, N) \
++  dcnpgettext_expr (NULL, Msgctxt, Msgid, MsgidPlural, N, LC_MESSAGES)
++#define dnpgettext_expr(Domainname, Msgctxt, Msgid, MsgidPlural, N) \
++  dcnpgettext_expr (Domainname, Msgctxt, Msgid, MsgidPlural, N, LC_MESSAGES)
++
++#ifdef __GNUC__
++__inline
++#else
++#ifdef __cplusplus
++inline
++#endif
++#endif
++static const char *
++dcnpgettext_expr (const char *domain,
++		  const char *msgctxt, const char *msgid,
++		  const char *msgid_plural, unsigned long int n,
++		  int category)
++{
++  size_t msgctxt_len = strlen (msgctxt) + 1;
++  size_t msgid_len = strlen (msgid) + 1;
++  const char *translation;
++#if _LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++  char msg_ctxt_id[msgctxt_len + msgid_len];
++#else
++  char buf[1024];
++  char *msg_ctxt_id =
++    (msgctxt_len + msgid_len <= sizeof (buf)
++     ? buf
++     : (char *) malloc (msgctxt_len + msgid_len));
++  if (msg_ctxt_id != NULL)
++#endif
++    {
++      memcpy (msg_ctxt_id, msgctxt, msgctxt_len - 1);
++      msg_ctxt_id[msgctxt_len - 1] = '\004';
++      memcpy (msg_ctxt_id + msgctxt_len, msgid, msgid_len);
++      translation = dcngettext (domain, msg_ctxt_id, msgid_plural, n, category);
++#if !_LIBGETTEXT_HAVE_VARIABLE_SIZE_ARRAYS
++      if (msg_ctxt_id != buf)
++	free (msg_ctxt_id);
++#endif
++      if (!(translation == msg_ctxt_id || translation == msgid_plural))
++	return translation;
++    }
++  return (n == 1 ? msgid : msgid_plural);
++}
++
++#endif /* _LIBGETTEXT_H */
+diff -Nur acl-2.2.49.vanilla/setfacl/setfacl.c acl-2.2.49/setfacl/setfacl.c
+--- acl-2.2.49.vanilla/setfacl/setfacl.c	2009-06-29 21:17:25.000000000 +0200
++++ acl-2.2.49/setfacl/setfacl.c	2010-02-26 20:17:32.258566043 +0100
+@@ -37,6 +37,8 @@
+ #include "walk_tree.h"
+ #include "misc.h"
+ 
++#include "../gettext.h"
++
+ #define POSIXLY_CORRECT_STR "POSIXLY_CORRECT"
+ 
+ /* '-' stands for `process non-option arguments in loop' */
-- 
1.6.3.3



--------------070706000602050409050605--
