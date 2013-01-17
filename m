Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1TvfYH-0004hY-Un
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2013 03:50:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0H2Ye3Y027775
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2013 18:34:40 -0800 (PST)
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 16 Jan 2013 18:34:38 -0800
Message-ID: <50F76342.80505@windriver.com>
Date: Thu, 17 Jan 2013 10:34:42 +0800
From: yzhu1 <Yanjun.Zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Joe MacDonald <Joe.MacDonald@windriver.com>
X-Originating-IP: [128.224.162.170]
Cc: openembedded-devel@lists.openembedded.org, lpd-eng-pull@windriver.com
Subject: Check in Request for WIND00398740 : autofs_5.0.7 do_compile failed with the msg "#error Failed to locate modprobe
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
X-List-Received-Date: Thu, 17 Jan 2013 02:50:47 -0000
X-Groupsio-MsgNum: 42722
Content-Type: multipart/mixed; boundary="------------000300030502040601020403"

--------------000300030502040601020403
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi, JoeM

GK && TK is OK.

Please check it this patch. The patch is in the attachment. Please check it.

Thanks a lot.
Zhu Yanjun

--------------000300030502040601020403
Content-Type: text/x-patch;
	name="0001-autofs-do-not-check-for-modprobe.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-autofs-do-not-check-for-modprobe.patch"

From 4fff087eb52462e0817a8d22d6187f9dcd32f924 Mon Sep 17 00:00:00 2001
From: yanjun.zhu <yanjun.zhu@windriver.com>
Date: Tue, 15 Jan 2013 12:45:44 +0800
Subject: [PATCH 1/1] autofs:do not check for modprobe

CQID: WIND00398740

Reference:http://www.spinics.net/lists/autofs/msg00139.html

Loading autofs module is #ifdef'ed in the source, so
there is no need to check for /proc (which is only used
to load module) or modprobe.  Both modprobe and /proc
are always in the fixed location so there's no need to
check for these to start with.

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 .../autofs-5.0.7-do-not-check-for-modprobe.patch   |   66 ++++++++++++++++++++
 recipes-daemons/autofs/autofs_5.0.7.bb             |    1 +
 2 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-not-check-for-modprobe.patch

diff --git a/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-not-check-for-modprobe.patch b/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-not-check-for-modprobe.patch
new file mode 100644
index 0000000..9f89b3c
--- /dev/null
+++ b/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-do-not-check-for-modprobe.patch
@@ -0,0 +1,66 @@
+diff -urpN a/configure.in b/configure.in
+--- a/configure.in	2013-01-15 11:30:22.000000000 +0800
++++ b/configure.in	2013-01-15 11:31:45.000000000 +0800
+@@ -34,11 +34,6 @@ AC_MSG_CHECKING([for binaries in])
+ AC_MSG_RESULT([$searchpath])
+ 
+ #
+-# Make sure we have "/proc"
+-#
+-AF_LINUX_PROCFS()
+-
+-#
+ # Location of init.d directory?
+ #
+ AF_INIT_D()
+@@ -142,7 +137,6 @@ AF_PATH_INCLUDE(UMOUNT, umount, /bin/umo
+ AF_PATH_INCLUDE(E2FSCK, fsck.ext2 e2fsck, , $searchpath)
+ AF_PATH_INCLUDE(E3FSCK, fsck.ext3 e3fsck, , $searchpath)
+ AF_PATH_INCLUDE(E4FSCK, fsck.ext4 e4fsck, , $searchpath)
+-AF_PATH_INCLUDE(MODPROBE, modprobe, , $searchpath)
+ 
+ AF_CHECK_PROG(LEX, flex lex, , $searchpath)
+ AF_CHECK_PROG(YACC, bison, , $searchpath)
+diff -urpN a/daemon/module.c b/daemon/module.c
+--- a/daemon/module.c	2013-01-15 11:30:49.000000000 +0800
++++ b/daemon/module.c	2013-01-15 11:32:00.000000000 +0800
+@@ -18,6 +18,8 @@
+ #include <stdlib.h>
+ #include "automount.h"
+ 
++#if 0
++/* see comment in daemon/automount.c around load_autofs4_module() call */
+ int load_autofs4_module(void)
+ {
+ 	FILE *fp;
+@@ -52,6 +54,7 @@ int load_autofs4_module(void)
+ 
+ 	return 1;
+ }
++#endif
+ 
+ struct lookup_mod *open_lookup(const char *name, const char *err_prefix,
+ 			       const char *mapfmt, int argc, const char *const *argv)
+diff -urpN a/include/automount.h b/include/automount.h
+--- a/include/automount.h	2013-01-15 11:31:10.000000000 +0800
++++ b/include/automount.h	2013-01-15 11:32:06.000000000 +0800
+@@ -50,16 +50,11 @@
+ #error Failed to locate umount(8)!
+ #endif
+ 
+-#ifndef HAVE_MODPROBE
+-#error Failed to locate modprobe(8)!
+-#endif
+-
+-#ifndef HAVE_LINUX_PROCFS
+-#error Failed to verify existence of procfs filesystem!
+-#endif
+-
++#if 0
++/* see comment in daemon/automount.c around load_autofs4_module() call */
+ #define FS_MODULE_NAME  "autofs4"
+ int load_autofs4_module(void);
++#endif
+ 
+ /* The -s (sloppy) option to mount is good, if we have it... */
+ 
diff --git a/recipes-daemons/autofs/autofs_5.0.7.bb b/recipes-daemons/autofs/autofs_5.0.7.bb
index ad737e3..bf679b4 100644
--- a/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://cross.patch \
            file://libtirpc.patch \
            file://libtirpc-name-clash-backout.patch \
+           file://autofs-5.0.7-do-not-check-for-modprobe.patch \
           "
 
 SRC_URI[md5sum] = "bc46838dece83c02d800ff144ed9f431"
-- 
1.7.1


--------------000300030502040601020403--
