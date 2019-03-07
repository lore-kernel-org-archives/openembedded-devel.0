Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8438E7CCE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 17:38:19 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id a3so11961947pff.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 09:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZEoiljLkFEhB0uRZ2bCPzF/uSuhyVNCETW7KP81ylpY=;
	b=leEt78Sk4EK4xgHxP0Yj9ravNxxuZItYUqgK/jGAAV4rX36SRenuZkkp4L4qEFNWYI
	uKoGEdOlDM3zf1QaEXg0yqHlSGrt1oued8oi3B0QgiuEsiSSUo1UQV0dRAAp1sSOItI+
	lA2GygH7o60HrqM9oJFl9wAO6TGGcDjNjRdZBKMRLWYXDN6I207feHDIZxzPsveZ6NsB
	duOkABeLQS+LiHfJam+dbcpar9FeHprEsl26R1gvKnqRL0SRsj1qtjnfOT5gP6JvG1W1
	mNwXM52RhOs5PxEa2ZYJmegvhmsv+r81bArYt2hJ3sPpYTOJEx4kx8rzgZBEeHDXF2XI
	OSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZEoiljLkFEhB0uRZ2bCPzF/uSuhyVNCETW7KP81ylpY=;
	b=Omw62JQW4kSOjqGhJUcCjxfvcecCXMVwvBDCc20rK3fkg+eXJ1hahoAbPCVStJWBQT
	y5t/5YBnfJFHR9c2qd7FBC43IL47dbNVHCo3ZmT/Wmm5mzsXE3g6QT+1ZLThqsS103GA
	QZV8xfNXaPTmYsKysumRg2MpvDP6czkpi9LFUev9EUOVNB6gFxMg0z7KJHb8p2H+oNYB
	pjZBugA8GFOiiPC0R8El5D+K8RqPISQUUUWiP8anLHap7fkwnzzlgLJNfWmCFBUKMb0q
	Sl1WEh+Ni71/HXy0kTse/n+mRrwxMuGvMF4//gDag1gRJj91AJFwhPM8aDIk0kazcLnP
	gIRw==
X-Gm-Message-State: APjAAAUXz7Sqzd6gVQv4hN7T2NgyEziEUpz5QlBcBt0Xgg3kMBsy41az
	ypWx3CibVCLY3y81I1XOFIwVFJBt
X-Google-Smtp-Source: APXvYqx000BoZ/wrFoAkXBR+hw6GQwsfwyMt+r8BBx1DKlqqtmzMRtIVySfXpPKw70gVLrhOVWj8hw==
X-Received: by 2002:a17:902:2a2b:: with SMTP id
	i40mr12337077plb.236.1551980299652; 
	Thu, 07 Mar 2019 09:38:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	j68sm15394514pfc.64.2019.03.07.09.38.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 09:38:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 09:37:40 -0800
Message-Id: <20190307173754.19820-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Mar 2019 15:16:37 +0000
Cc: Wenzong Fan <wenzong.fan@windriver.com>, Chong Lu <Chong.Lu@windriver.com>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
	Chunrong Guo <b40290@freescale.com>
Subject: [meta-oe][PATCH] inetutils,vim: Remove
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
X-List-Received-Date: Thu, 07 Mar 2019 17:38:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These recipes have moved into OE-Core now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-rcp-fix-to-work-with-large-files.patch |  31 ---
 .../inetutils/fix-disable-ipv6.patch          |  83 -------
 ...rse-pull-in-features.h-for-__GLIBC__.patch |  29 ---
 .../inetutils/inetutils-1.8-0003-wchar.patch  |  14 --
 .../inetutils-1.9-PATH_PROCNET_DEV.patch      |  26 ---
 ...ly-check-pam_appl.h-when-pam-enabled.patch |  40 ----
 .../inetutils/rexec.xinetd.inetutils          |  20 --
 .../inetutils/rlogin.xinetd.inetutils         |  23 --
 .../inetutils/inetutils/rsh.xinetd.inetutils  |  21 --
 .../inetutils/telnet.xinetd.inetutils         |  13 --
 .../inetutils/tftpd.xinetd.inetutils          |  19 --
 .../inetutils/inetutils/version.patch         |  17 --
 .../inetutils/inetutils_1.9.4.bb              | 206 ------------------
 ...src-Makefile-improve-reproducibility.patch |  46 ----
 .../vim/files/disable_acl_header_check.patch  |  39 ----
 ...m-add-knob-whether-elf.h-are-checked.patch |  42 ----
 .../recipes-support/vim/vim-tiny_8.1.0347.bb  |  15 --
 meta-oe/recipes-support/vim/vim_8.1.0347.bb   | 129 -----------
 18 files changed, 813 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
 delete mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
 delete mode 100644 meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
 delete mode 100644 meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
 delete mode 100644 meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
 delete mode 100644 meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
 delete mode 100644 meta-oe/recipes-support/vim/vim_8.1.0347.bb

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
deleted file mode 100644
index d4764f5867..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Pending
-
-Subject: rcp: fix to work with large files
-
-When we copy file by rcp command, if the file > 2GB, it will fail.
-The cause is that it used incorrect data type on file size in sink() of rcp.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/rcp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/rcp.c b/src/rcp.c
-index 21f55b6..bafa35f 100644
---- a/src/rcp.c
-+++ b/src/rcp.c
-@@ -876,9 +876,9 @@ sink (int argc, char *argv[])
-   enum
-   { YES, NO, DISPLAYED } wrerr;
-   BUF *bp;
--  off_t i, j;
-+  off_t i, j, size;
-   int amt, count, exists, first, mask, mode, ofd, omode;
--  int setimes, size, targisdir, wrerrno;
-+  int setimes, targisdir, wrerrno;
-   char ch, *cp, *np, *targ, *vect[1], buf[BUFSIZ];
-   const char *why;
- 
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
deleted file mode 100644
index 24c134fcac..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Upstream: http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
-
-Upstream-Status: Pending
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- ping/ping_common.h | 20 ++++++++++++++++++++
- 1 file changed, 20 insertions(+)
-
-diff --git a/ping/ping_common.h b/ping/ping_common.h
-index 1dfd1b5..3bfbd12 100644
---- a/ping/ping_common.h
-+++ b/ping/ping_common.h
-@@ -17,10 +17,14 @@
-   You should have received a copy of the GNU General Public License
-   along with this program.  If not, see `http://www.gnu.org/licenses/'. */
- 
-+#include <config.h>
-+
- #include <netinet/in_systm.h>
- #include <netinet/in.h>
- #include <netinet/ip.h>
-+#ifdef HAVE_IPV6
- #include <netinet/icmp6.h>
-+#endif
- #include <icmp.h>
- #include <error.h>
- #include <progname.h>
-@@ -62,7 +66,12 @@ struct ping_stat
-    want to follow the traditional behaviour of ping.  */
- #define DEFAULT_PING_COUNT 0
- 
-+#ifdef HAVE_IPV6
- #define PING_HEADER_LEN (USE_IPV6 ? sizeof (struct icmp6_hdr) : ICMP_MINLEN)
-+#else
-+#define PING_HEADER_LEN (ICMP_MINLEN)
-+#endif
-+
- #define PING_TIMING(s)  ((s) >= sizeof (struct timeval))
- #define PING_DATALEN    (64 - PING_HEADER_LEN)  /* default data length */
- 
-@@ -74,13 +83,20 @@ struct ping_stat
-   (t).tv_usec = ((i)%PING_PRECISION)*(1000000/PING_PRECISION) ;\
- } while (0)
- 
-+#ifdef HAVE_IPV6
- /* FIXME: Adjust IPv6 case for options and their consumption.  */
- #define _PING_BUFLEN(p, u) ((u)? ((p)->ping_datalen + sizeof (struct icmp6_hdr)) : \
- 				   (MAXIPLEN + (p)->ping_datalen + ICMP_TSLEN))
- 
-+#else
-+#define _PING_BUFLEN(p, u) (MAXIPLEN + (p)->ping_datalen + ICMP_TSLEN)
-+#endif
-+
-+#ifdef HAVE_IPV6
- typedef int (*ping_efp6) (int code, void *closure, struct sockaddr_in6 * dest,
- 			  struct sockaddr_in6 * from, struct icmp6_hdr * icmp,
- 			  int datalen);
-+#endif
- 
- typedef int (*ping_efp) (int code,
- 			 void *closure,
-@@ -89,13 +105,17 @@ typedef int (*ping_efp) (int code,
- 			 struct ip * ip, icmphdr_t * icmp, int datalen);
- 
- union event {
-+#ifdef HAVE_IPV6
-   ping_efp6 handler6;
-+#endif
-   ping_efp handler;
- };
- 
- union ping_address {
-   struct sockaddr_in ping_sockaddr;
-+#ifdef HAVE_IPV6
-   struct sockaddr_in6 ping_sockaddr6;
-+#endif
- };
- 
- typedef struct ping_data PING;
--- 
-2.8.3
-
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
deleted file mode 100644
index 3da4e9f55a..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 552a7d64ad4a7188a9b7cd89933ae7caf7ebfe90 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier at gentoo.org>
-Date: Thu, 18 Nov 2010 16:59:14 -0500
-Subject: [PATCH gnulib] printf-parse: pull in features.h for __GLIBC__
-
-Upstream-Status: Pending
-
-Signed-off-by: Mike Frysinger <vapier at gentoo.org>
----
- lib/printf-parse.h |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
-
-diff --git a/lib/printf-parse.h b/lib/printf-parse.h
-index 67a4a2a..3bd6152 100644
---- a/lib/printf-parse.h
-+++ b/lib/printf-parse.h
-@@ -25,6 +25,9 @@
- 
- #include "printf-args.h"
- 
-+#ifdef HAVE_FEATURES_H
-+# include <features.h>	/* for __GLIBC__ */
-+#endif
- 
- /* Flags */
- #define FLAG_GROUP       1      /* ' flag */
--- 
-1.7.3.2
-
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
deleted file mode 100644
index b13bb9229f..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Pending
-
---- inetutils-1.8/lib/wchar.in.h
-+++ inetutils-1.8/lib/wchar.in.h
-@@ -70,6 +70,9 @@
- /* The include_next requires a split double-inclusion guard.  */
- #if @HAVE_WCHAR_H@
- # @INCLUDE_NEXT@ @NEXT_WCHAR_H@
-+#else
-+# include <stddef.h>
-+# define MB_CUR_MAX 1
- #endif
- 
- #undef _GL_ALREADY_INCLUDING_WCHAR_H
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
deleted file mode 100644
index 2592989a90..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-inetutils: define PATH_PROCNET_DEV if not already defined
-
-this prevents the following compilation error :
-system/linux.c:401:15: error: 'PATH_PROCNET_DEV' undeclared (first use in this function)
-
-this patch comes from :
- http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9/
-
-Upstream-Status: Inappropriate [not author]
-
-Signed-of-by: Eric Bénard <eric@eukrea.com>
----
-diff -Naur inetutils-1.9.orig/ifconfig/system/linux.c inetutils-1.9/ifconfig/system/linux.c
---- inetutils-1.9.orig/ifconfig/system/linux.c	2012-01-04 16:31:36.000000000 -0500
-+++ inetutils-1.9/ifconfig/system/linux.c	2012-01-04 16:40:53.000000000 -0500
-@@ -49,6 +49,10 @@
- #include "../ifconfig.h"
- 
- 
-+#ifndef PATH_PROCNET_DEV
-+  #define PATH_PROCNET_DEV "/proc/net/dev"
-+#endif
-+
- /* ARPHRD stuff.  */
- 
- static void
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
deleted file mode 100644
index ff3abd86aa..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Only check security/pam_appl.h which is provided by package libpam when pam is
-enabled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/configure.ac b/configure.ac
-index b35e672..e78a751 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -195,6 +195,19 @@ fi
- 
- # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
- if test "$with_pam" = yes ; then
-+  AC_CHECK_HEADERS([security/pam_appl.h], [], [], [
-+#include <sys/types.h>
-+#ifdef HAVE_NETINET_IN_SYSTM_H
-+# include <netinet/in_systm.h>
-+#endif
-+#include <netinet/in.h>
-+#ifdef HAVE_NETINET_IP_H
-+# include <netinet/ip.h>
-+#endif
-+#ifdef HAVE_SYS_PARAM_H
-+# include <sys/param.h>
-+#endif
-+])
-   AC_CHECK_LIB(dl, dlopen, LIBDL=-ldl)
-   AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=-lpam)
-   if test "$ac_cv_lib_pam_pam_authenticate" = yes ; then
-@@ -587,7 +600,7 @@ AC_HEADER_DIRENT
- AC_CHECK_HEADERS([arpa/nameser.h errno.h fcntl.h features.h \
- 		  glob.h memory.h netinet/ether.h netinet/in_systm.h \
- 		  netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
--		  security/pam_appl.h shadow.h \
-+		  shadow.h \
- 		  stdarg.h stdlib.h string.h stropts.h sys/tty.h \
- 		  sys/utsname.h sys/ptyvar.h sys/msgbuf.h sys/filio.h \
- 		  sys/ioctl_compat.h sys/cdefs.h sys/stream.h sys/mkdev.h \
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
deleted file mode 100644
index 30e81ef450..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
+++ /dev/null
@@ -1,20 +0,0 @@
-# default: off
-# description:
-# Rexecd is the server for the rexec program. The server provides remote 
-# execution facilities with authentication based on user names and 
-# passwords.
-#
-service exec
-{
-	socket_type	= stream
-	protocol	= tcp
-	flags		= NAMEINARGS
-	wait		= no
-	user		= root
-	group		= root
-	log_on_success	+= USERID
-	log_on_failure	+= USERID
-	server		= @SBINDIR@/tcpd
-	server_args	= @SBINDIR@/in.rexecd
-	disable		= yes
-}
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
deleted file mode 100644
index 21b55da9a9..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
+++ /dev/null
@@ -1,23 +0,0 @@
-# default: off
-# description:
-# Rlogind is a server for the rlogin program. The server provides remote 
-# execution with authentication based on privileged port numbers from trusted
-# host
-#
-service login
-{
-	socket_type	= stream
-	protocol	= tcp
-	flags		= NAMEINARGS
-	wait		= no
-	user		= root
-	group		= root
-	log_on_success	+= USERID
-	log_on_failure	+= USERID
-	server		= @SBINDIR@/tcpd
-	server_args	= @SBINDIR@/in.rlogind -a
-	disable		= yes
-}
-							
-							
-							
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
deleted file mode 100644
index 2b894a74bd..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
+++ /dev/null
@@ -1,21 +0,0 @@
-# default: off
-# description:
-# The rshd server is a server for the rcmd(3) routine and, 
-# consequently, for the rsh(1) program. The server provides 
-# remote execution facilities with authentication based on 
-# privileged port numbers from trusted hosts.
-#
-service shell
-{
-	socket_type	= stream
-	protocol	= tcp
-	flags		= NAMEINARGS
-	wait		= no
-	user		= root
-	group		= root
-	log_on_success	+= USERID
-	log_on_failure	+= USERID
-	server		= @SBINDIR@/tcpd
-	server_args	= @SBINDIR@/in.rshd -aL
-	disable		= yes
-}
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
deleted file mode 100644
index 2d9a0408c0..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
+++ /dev/null
@@ -1,13 +0,0 @@
-# default: on
-# description: The telnet server serves telnet sessions; it uses \
-#       unencrypted username/password pairs for authentication.
-service telnet
-{
-	disable		= no
-	flags		= REUSE
-	socket_type	= stream
-	wait		= no
-	user		= root
-	server		= @SBINDIR@/in.telnetd
-	log_on_failure	+= USERID
-}
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
deleted file mode 100644
index 67b44c43e8..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
+++ /dev/null
@@ -1,19 +0,0 @@
-# default: off
-# description:
-# Tftpd is a server which supports the Internet Trivial File Transfer
-# Pro-tocol (RFC 783). The TFTP server operates at the port indicated
-# in the tftp service description; see services(5).
-#
-service tftp
-{
-        disable         = yes
-        socket_type     = dgram
-        protocol        = udp
-        flags           = IPv6
-        wait            = yes
-        user            = root
-        group           = root
-        server          = @SBINDIR@/in.tftpd
-        server_args     = /tftpboot
-}
-
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/version.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
deleted file mode 100644
index 532a0e5c08..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils/version.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-remove m4_esyscmd function
-
-Signed-off-by: Chunrong Guo <b40290@freescale.com>
---- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
-+++ inetutils-1.9.1/configure.ac	2012-11-12 14:01:11.732957019 +0800
-@@ -20,8 +20,7 @@
- 
- AC_PREREQ(2.59)
- 
--AC_INIT([GNU inetutils],
-- m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v/;s/_/./g']),
-+AC_INIT([GNU inetutils],[1.9.4],
-  [bug-inetutils@gnu.org])
- 
- AC_CONFIG_SRCDIR([src/inetd.c])
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
deleted file mode 100644
index a27dbae2e6..0000000000
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ /dev/null
@@ -1,206 +0,0 @@
-DESCRIPTION = "The GNU inetutils are a collection of common \
-networking utilities and servers including ftp, ftpd, rcp, \
-rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
-talkd, telnet, telnetd, tftp, tftpd, and uucpd."
-HOMEPAGE = "http://www.gnu.org/software/inetutils"
-SECTION = "net"
-DEPENDS = "ncurses netbase readline virtual/crypt"
-
-LICENSE = "GPLv3"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
-
-SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
-           file://version.patch \
-           file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
-           file://inetutils-1.8-0003-wchar.patch \
-           file://rexec.xinetd.inetutils  \
-           file://rlogin.xinetd.inetutils \
-           file://rsh.xinetd.inetutils \
-           file://telnet.xinetd.inetutils \
-           file://tftpd.xinetd.inetutils \
-           file://inetutils-1.9-PATH_PROCNET_DEV.patch \
-           file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
-           file://0001-rcp-fix-to-work-with-large-files.patch \
-"
-
-SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-SRC_URI[sha256sum] = "be8f75eff936b8e41b112462db51adf689715658a1b09e0d6b05d11ec92cc616"
-
-inherit autotools gettext update-alternatives texinfo
-
-acpaths = "-I ./m4"
-
-SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
-
-PACKAGECONFIG ??= "ftp uucpd \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6 ping6', '', d)} \
-                  "
-PACKAGECONFIG[ftp] = "--enable-ftp,--disable-ftp,readline"
-PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
-PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6 gl_cv_socket_ipv6=no,"
-PACKAGECONFIG[ping6] = "--enable-ping6,--disable-ping6,"
-
-EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
-        inetutils_cv_path_login=${base_bindir}/login \
-        --with-libreadline-prefix=${STAGING_LIBDIR} \
-        --enable-rpath=no \
-"
-
-EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin "
-
-do_configure_prepend () {
-    export HELP2MAN='true'
-    cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
-    rm -f ${S}/glob/configure*
-}
-
-do_install_append () {
-    install -m 0755 -d ${D}${base_sbindir}
-    install -m 0755 -d ${D}${sbindir}
-    install -m 0755 -d ${D}${sysconfdir}/xinetd.d
-    if [ "${base_bindir}" != "${bindir}" ] ; then
-         install -m 0755 -d ${D}${base_bindir}
-         mv ${D}${bindir}/ping* ${D}${base_bindir}/
-         mv ${D}${bindir}/hostname ${D}${base_bindir}/
-    fi
-    mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/
-    mv ${D}${libexecdir}/syslogd ${D}${base_sbindir}/
-    mv ${D}${libexecdir}/tftpd ${D}${sbindir}/in.tftpd
-    mv ${D}${libexecdir}/telnetd ${D}${sbindir}/in.telnetd
-    mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
-    if [ -e ${D}${libexecdir}/rlogind ]; then
-        mv ${D}${libexecdir}/rlogind ${D}${sbindir}/in.rlogind
-    fi
-    if [ -e ${D}${libexecdir}/rshd ]; then
-        mv ${D}${libexecdir}/rshd ${D}${sbindir}/in.rshd
-    fi
-    if [ -e ${D}${libexecdir}/talkd ]; then
-        mv ${D}${libexecdir}/talkd ${D}${sbindir}/in.talkd
-    fi
-    mv ${D}${libexecdir}/uucpd ${D}${sbindir}/in.uucpd
-    mv ${D}${libexecdir}/* ${D}${bindir}/
-    cp ${WORKDIR}/rexec.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rexec
-    cp ${WORKDIR}/rlogin.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rlogin
-    cp ${WORKDIR}/rsh.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rsh
-    cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
-    cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
-
-    sed -e 's,@SBINDIR@,${sbindir},g' -i ${D}/${sysconfdir}/xinetd.d/*
-    if [ -e ${D}${libdir}/charset.alias ]; then
-        rm -rf ${D}${libdir}/charset.alias
-    fi
-    rm -rf ${D}${libexecdir}/
-    # remove usr/lib if empty
-    rmdir ${D}${libdir} || true
-}
-
-PACKAGES =+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
-${PN}-tftp ${PN}-logger ${PN}-traceroute ${PN}-syslogd \
-${PN}-ftp ${PN}-ftpd ${PN}-tftpd ${PN}-telnet ${PN}-telnetd ${PN}-inetd \
-${PN}-rsh ${PN}-rshd"
-
-# The packages tftpd, telnetd and rshd conflict with the ones
-# provided by netkit, so add the corresponding -dbg packages
-# for them to avoid the confliction between the dbg package
-# of inetutils and netkit.
-PACKAGES =+ "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
-NOAUTOPACKAGEDEBUG = "1"
-
-ALTERNATIVE_PRIORITY = "79"
-ALTERNATIVE_${PN} = "talk whois"
-ALTERNATIVE_LINK_NAME[talkd]  = "${sbindir}/in.talkd"
-ALTERNATIVE_LINK_NAME[uucpd]  = "${sbindir}/in.uucpd"
-
-ALTERNATIVE_PRIORITY_${PN}-logger = "60"
-ALTERNATIVE_${PN}-logger = "logger"
-ALTERNATIVE_${PN}-syslogd = "syslogd"
-ALTERNATIVE_LINK_NAME[syslogd]  = "${base_sbindir}/syslogd"
-
-ALTERNATIVE_${PN}-ftp = "ftp"
-ALTERNATIVE_${PN}-ftpd = "ftpd"
-ALTERNATIVE_${PN}-tftp = "tftp"
-ALTERNATIVE_${PN}-tftpd = "tftpd"
-ALTERNATIVE_LINK_NAME[tftpd] = "${sbindir}/tftpd"
-ALTERNATIVE_TARGET[tftpd]  = "${sbindir}/in.tftpd"
-
-ALTERNATIVE_${PN}-telnet = "telnet"
-ALTERNATIVE_${PN}-telnetd = "telnetd"
-ALTERNATIVE_LINK_NAME[telnetd] = "${sbindir}/telnetd"
-ALTERNATIVE_TARGET[telnetd] = "${sbindir}/in.telnetd"
-
-ALTERNATIVE_${PN}-rsh = "rcp rexec rlogin rsh"
-ALTERNATIVE_${PN}-rshd = "rshd rexecd rlogind"
-ALTERNATIVE_LINK_NAME[rshd] = "${sbindir}/rshd"
-ALTERNATIVE_TARGET[rshd] = "${sbindir}/in.rshd"
-ALTERNATIVE_LINK_NAME[rexecd] = "${sbindir}/rexecd"
-ALTERNATIVE_TARGET[rexecd] = "${sbindir}/in.rexecd"
-ALTERNATIVE_LINK_NAME[rlogind] = "${sbindir}/rlogind"
-ALTERNATIVE_TARGET[rlogind] = "${sbindir}/in.rlogind"
-
-ALTERNATIVE_${PN}-inetd= "inetd"
-ALTERNATIVE_${PN}-traceroute = "traceroute"
-
-ALTERNATIVE_${PN}-hostname = "hostname"
-ALTERNATIVE_LINK_NAME[hostname]  = "${base_bindir}/hostname"
-
-ALTERNATIVE_${PN}-doc = "hostname.1 dnsdomainname.1 logger.1 syslogd.8"
-ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
-ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
-ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
-ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
-
-ALTERNATIVE_${PN}-ifconfig = "ifconfig"
-ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
-
-ALTERNATIVE_${PN}-ping = "ping"
-ALTERNATIVE_LINK_NAME[ping]   = "${base_bindir}/ping"
-
-ALTERNATIVE_${PN}-ping6 = "${@bb.utils.filter('PACKAGECONFIG', 'ping6', d)}"
-ALTERNATIVE_LINK_NAME[ping6]  = "${base_bindir}/ping6"
-
-
-FILES_${PN}-dbg += "${base_bindir}/.debug ${base_sbindir}/.debug ${bindir}/.debug ${sbindir}/.debug"
-FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
-FILES_${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
-FILES_${PN}-hostname = "${base_bindir}/hostname.${BPN}"
-FILES_${PN}-ifconfig = "${base_sbindir}/ifconfig.${BPN}"
-FILES_${PN}-traceroute = "${bindir}/traceroute.${BPN}"
-FILES_${PN}-logger = "${bindir}/logger.${BPN}"
-
-FILES_${PN}-syslogd = "${base_sbindir}/syslogd.${BPN}"
-RCONFLICTS_${PN}-syslogd = "rsyslog busybox-syslog sysklogd syslog-ng"
-
-FILES_${PN}-ftp = "${bindir}/ftp.${BPN}"
-
-FILES_${PN}-tftp = "${bindir}/tftp.${BPN}"
-FILES_${PN}-telnet = "${bindir}/telnet.${BPN}"
-FILES_${PN}-rsh = "${bindir}/rsh.${BPN} ${bindir}/rlogin.${BPN} ${bindir}/rexec.${BPN} ${bindir}/rcp.${BPN}"
-
-FILES_${PN}-rshd = "${sbindir}/in.rshd ${sbindir}/in.rlogind ${sbindir}/in.rexecd \
-                    ${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rlogin ${sysconfdir}/xinetd.d/rexec"
-FILES_${PN}-rshd-dbg = "${sbindir}/.debug/in.rshd ${sbindir}/.debug/in.rlogind ${sbindir}/.debug/in.rexecd"
-RDEPENDS_${PN}-rshd += "xinetd tcp-wrappers"
-RCONFLICTS_${PN}-rshd += "netkit-rshd"
-RPROVIDES_${PN}-rshd = "rshd"
-
-FILES_${PN}-ftpd = "${bindir}/ftpd.${BPN}"
-FILES_${PN}-ftpd-dbg = "${bindir}/.debug/ftpd.${BPN}"
-RDEPENDS_${PN}-ftpd += "xinetd"
-
-FILES_${PN}-tftpd = "${sbindir}/in.tftpd ${sysconfdir}/xinetd.d/tftpd"
-FILES_${PN}-tftpd-dbg = "${sbindir}/.debug/in.tftpd"
-RCONFLICTS_${PN}-tftpd += "netkit-tftpd"
-RDEPENDS_${PN}-tftpd += "xinetd"
-
-FILES_${PN}-telnetd = "${sbindir}/in.telnetd ${sysconfdir}/xinetd.d/telnet"
-FILES_${PN}-telnetd-dbg = "${sbindir}/.debug/in.telnetd"
-RCONFLICTS_${PN}-telnetd += "netkit-telnetd"
-RPROVIDES_${PN}-telnetd = "telnetd"
-RDEPENDS_${PN}-telnetd += "xinetd"
-
-FILES_${PN}-inetd = "${bindir}/inetd.${BPN}"
-
-RDEPENDS_${PN} = "xinetd"
diff --git a/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch b/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
deleted file mode 100644
index 63a7b78f12..0000000000
--- a/meta-oe/recipes-support/vim/files/0001-src-Makefile-improve-reproducibility.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 133ab27cdb17ca20ef6b0304cf30621d2bcbe757 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 31 Jan 2019 21:32:26 -0800
-Subject: [PATCH] src/Makefile: improve reproducibility
-
-Clear all_cflags, all_lflags, compiled_user
-and compiled_sys to avoid introducing build
-info to improve reproducibility as below:
-
-WARNING: vim-8.1.0347-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-linux/vim/8.1.0347-r0/packages-split/vim/usr/bin/vim.vim in package contained reference to tmpdir [buildpaths]
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/Makefile | 14 ++++----------
- 1 file changed, 4 insertions(+), 10 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index f2fafa4dc..7148d4bd9 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2845,16 +2845,10 @@ auto/pathdef.c: Makefile auto/config.mk
- 	-@echo '#include "vim.h"' >> $@
- 	-@echo 'char_u *default_vim_dir = (char_u *)"$(VIMRCLOC)";' | $(QUOTESED) >> $@
- 	-@echo 'char_u *default_vimruntime_dir = (char_u *)"$(VIMRUNTIMEDIR)";' | $(QUOTESED) >> $@
--	-@echo 'char_u *all_cflags = (char_u *)"$(CC) -c -I$(srcdir) $(ALL_CFLAGS)";' | $(QUOTESED) >>  $@
--	-@echo 'char_u *all_lflags = (char_u *)"$(CC) $(ALL_LIB_DIRS) $(LDFLAGS) -o $(VIMTARGET) $(ALL_LIBS) ";' | $(QUOTESED) >>  $@
--	-@echo 'char_u *compiled_user = (char_u *)"' | tr -d $(NL) >> $@
--	-@if test -n "$(COMPILEDBY)"; then \
--		echo "$(COMPILEDBY)" | tr -d $(NL) >> $@; \
--		else ((logname) 2>/dev/null || whoami) | tr -d $(NL) >> $@; fi
--	-@echo '";' >> $@
--	-@echo 'char_u *compiled_sys = (char_u *)"' | tr -d $(NL) >> $@
--	-@if test -z "$(COMPILEDBY)"; then hostname | tr -d $(NL) >> $@; fi
--	-@echo '";' >> $@
-+	-@echo 'char_u *all_cflags = (char_u *)"";' | $(QUOTESED) >>  $@
-+	-@echo 'char_u *all_lflags = (char_u *)"";' | $(QUOTESED) >>  $@
-+	-@echo 'char_u *compiled_user = (char_u *)"";' >> $@
-+	-@echo 'char_u *compiled_sys = (char_u *)"";' >> $@
- 	-@sh $(srcdir)/pathdef.sh
- 
- GUI_GTK_RES_INPUTS = \
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch b/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
deleted file mode 100644
index 4720003c25..0000000000
--- a/meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5ed25c076a1fb1889a3c50dddf29f21850b59a13 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com> 
-Date: Tue, 26 Jun 2018 17:29:09 +0800
-Subject: [PATCH] disable acl header check
-
-Don't check 'sys/acl.h' if acl support disabled for vim/vim-tiny.
-
-Upstream-Status: pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/configure.ac | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/configure.ac b/src/configure.ac
-index 107c170..0ee86ad 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -3220,7 +3220,7 @@ AC_CHECK_HEADERS(stdint.h stdlib.h string.h \
- 	sys/systeminfo.h locale.h sys/stream.h termios.h \
- 	libc.h sys/statfs.h poll.h sys/poll.h pwd.h \
- 	utime.h sys/param.h libintl.h libgen.h \
--	util/debug.h util/msg18n.h frame.h sys/acl.h \
-+	util/debug.h util/msg18n.h frame.h \
- 	sys/access.h sys/sysinfo.h wchar.h wctype.h)
- 
- dnl sys/ptem.h depends on sys/stream.h on Solaris
-@@ -3848,6 +3848,7 @@ AC_ARG_ENABLE(acl,
- 	, [enable_acl="yes"])
- if test "$enable_acl" = "yes"; then
-   AC_MSG_RESULT(no)
-+  AC_CHECK_HEADERS(sys/acl.h)
-   AC_CHECK_LIB(posix1e, acl_get_file, [LIBS="$LIBS -lposix1e"],
- 	AC_CHECK_LIB(acl, acl_get_file, [LIBS="$LIBS -lacl"
- 		  AC_CHECK_LIB(attr, fgetxattr, LIBS="$LIBS -lattr",,)],,),)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch b/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
deleted file mode 100644
index 37914d4cd9..0000000000
--- a/meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 38de4bccdb8a861ffdd447f12fdab19d6d852c02 Mon Sep 17 00:00:00 2001
-From: Chong Lu <Chong.Lu@windriver.com>
-Date: Tue, 26 Jun 2018 17:34:15 +0800
-Subject: [PATCH] vim: add knob whether elf.h are checked
-
-Previously, it still was checked when there was no elf library in sysroots directory.
-Add knob to decide whether elf.h are checked or not.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/configure.ac | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/configure.ac b/src/configure.ac
-index 0ee86ad..64736f0 100644
---- a/src/configure.ac
-+++ b/src/configure.ac
-@@ -3192,11 +3192,18 @@ AC_TRY_COMPILE([#include <stdio.h>], [int x __attribute__((unused));],
- 	AC_MSG_RESULT(no))
- 
- dnl Checks for header files.
-+AC_MSG_CHECKING(whether or not to look for elf.h)
-+AC_ARG_ENABLE(elf-check,
-+        [  --enable-elf-check      If elfutils, check for elf.h [default=no]],
-+        , enable_elf_check="no")
-+AC_MSG_RESULT($enable_elf_check)
-+if test "x$enable_elf_check" != "xno"; then
- AC_CHECK_HEADER(elf.h, HAS_ELF=1)
- dnl AC_CHECK_HEADER(dwarf.h, SVR4=1)
- if test "$HAS_ELF" = 1; then
-   AC_CHECK_LIB(elf, main)
- fi
-+fi
- 
- AC_HEADER_DIRENT
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
deleted file mode 100644
index 8b1fb7b115..0000000000
--- a/meta-oe/recipes-support/vim/vim-tiny_8.1.0347.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require vim_${PV}.bb
-
-SUMMARY += " (with tiny features)"
-
-PROVIDES_remove = "xxd"
-ALTERNATIVE_${PN}_remove = "xxd"
-
-PACKAGECONFIG += "tiny"
-
-do_install() {
-    install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
-}
-
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta-oe/recipes-support/vim/vim_8.1.0347.bb b/meta-oe/recipes-support/vim/vim_8.1.0347.bb
deleted file mode 100644
index 1c41caaf10..0000000000
--- a/meta-oe/recipes-support/vim/vim_8.1.0347.bb
+++ /dev/null
@@ -1,129 +0,0 @@
-SUMMARY = "Vi IMproved - enhanced vi editor"
-SECTION = "console/utils"
-
-PROVIDES = "xxd"
-DEPENDS = "ncurses gettext-native"
-# vimdiff doesn't like busybox diff
-RSUGGESTS_${PN} = "diffutils"
-LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
-
-SRC_URI = "git://github.com/vim/vim.git \
-           file://disable_acl_header_check.patch;patchdir=.. \
-           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
-           file://0001-src-Makefile-improve-reproducibility.patch;patchdir=.. \
-"
-SRCREV = "f1c118be93184e8e57e3e80b1b3383f464ed649e"
-
-S = "${WORKDIR}/git/src"
-
-VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
-
-inherit autotools-brokensep update-alternatives
-
-CLEANBROKEN = "1"
-
-# vim configure.in contains functions which got 'dropped' by autotools.bbclass
-do_configure () {
-    rm -f auto/*
-    touch auto/config.mk
-    aclocal
-    autoconf
-    oe_runconf
-    touch auto/configure
-    touch auto/config.mk auto/config.h
-}
-
-#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
-PACKAGECONFIG ??= ""
-PACKAGECONFIG += " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
-"
-PACKAGECONFIG_class-native = ""
-
-PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
-PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
-PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
-PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
-PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
-
-EXTRA_OECONF = " \
-    --disable-gpm \
-    --disable-gtktest \
-    --disable-xim \
-    --disable-netbeans \
-    --with-tlib=ncurses \
-    ac_cv_small_wchar_t=no \
-    vim_cv_getcwd_broken=no \
-    vim_cv_memmove_handles_overlap=yes \
-    vim_cv_stat_ignores_slash=no \
-    vim_cv_terminfo=yes \
-    vim_cv_tgetent=non-zero \
-    vim_cv_toupper_broken=no \
-    vim_cv_tty_group=world \
-    STRIP=/bin/true \
-"
-
-do_install() {
-    autotools_do_install
-
-    # Work around file-rdeps picking up csh, awk, perl or python as a dep
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
-    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
-
-    # Install example vimrc from runtime files
-    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
-
-    # we use --with-features=big as default
-    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
-
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
-	# The mouse being autoenabled is just annoying in xfce4-terminal (mouse
-	# drag make vim go into visual mode and there is no right click menu),
-	# delete the block.
-	sed -i '/the mouse works just fine/,+4d' ${D}/${datadir}/${BPN}/vimrc
-    fi
-}
-
-PARALLEL_MAKEINST = ""
-
-PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
-FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
-FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
-FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
-FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
-FILES_${PN}-data = "${datadir}/${BPN}"
-FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
-FILES_${PN}-common = " \
-    ${datadir}/${BPN}/${VIMDIR}/*.vim \
-    ${datadir}/${BPN}/${VIMDIR}/autoload \
-    ${datadir}/${BPN}/${VIMDIR}/colors \
-    ${datadir}/${BPN}/${VIMDIR}/compiler \
-    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
-    ${datadir}/${BPN}/${VIMDIR}/indent \
-    ${datadir}/${BPN}/${VIMDIR}/keymap \
-    ${datadir}/${BPN}/${VIMDIR}/lang \
-    ${datadir}/${BPN}/${VIMDIR}/macros \
-    ${datadir}/${BPN}/${VIMDIR}/plugin \
-    ${datadir}/${BPN}/${VIMDIR}/print \
-    ${datadir}/${BPN}/${VIMDIR}/spell \
-    ${datadir}/icons \
-"
-
-RDEPENDS_${BPN} = "ncurses-terminfo-base"
-# Recommend that runtime data is installed along with vim
-RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
-
-ALTERNATIVE_${PN} = "vi vim xxd"
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
-ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
-ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
-ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
-ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
-
-BBCLASSEXTEND = "native"
-- 
2.21.0


