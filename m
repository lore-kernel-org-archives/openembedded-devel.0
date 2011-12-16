Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbO0e-0004CW-7E
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 03:58:57 +0100
Received: from mail121-tx2-R.bigfish.com (10.9.14.235) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 02:36:54 +0000
Received: from mail121-tx2 (localhost [127.0.0.1])	by
	mail121-tx2-R.bigfish.com (Postfix) with ESMTP id AA855801D0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 02:37:01 +0000 (UTC)
X-SpamScore: -2
X-BigFish: VS-2(zz936eKzz1202hzz8275bh8275dhz2dh2a8h668h839hb79i61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail121-tx2 (localhost.localdomain [127.0.0.1]) by mail121-tx2
	(MessageSwitch) id 1324003020643129_2273;
	Fri, 16 Dec 2011 02:37:00 +0000 (UTC)
Received: from TX2EHSMHS018.bigfish.com (unknown [10.9.14.243])	by
	mail121-tx2.bigfish.com (Postfix) with ESMTP id 94D81100049	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 02:37:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS018.bigfish.com
	(10.9.99.118) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 02:36:52 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 15 Dec 2011 20:36:51 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBG2aliw009971;
	Thu, 15 Dec 2011 20:36:50 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 10:39:26 +0800
Message-ID: <1324003173-13994-2-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324003173-13994-1-git-send-email-b19537@freescale.com>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe 2/9] ietutils: add
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
X-List-Received-Date: Fri, 16 Dec 2011 02:58:57 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    The GNU inetutils are a collection of common networking utilities 
    and servers including ftp, ftpd, rcp, rexec, rlogin, rlogind, rsh,
    rshd, syslog, syslogd, talk, talkd, telnet, telnetd, tftp, tftpd, 
    and uucpd.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../inetutils/inetutils-1.8/fix-disable-ipv6.patch |   58 +++++++++++
 ...tf-parse-pull-in-features.h-for-__GLIBC__.patch |   27 +++++
 ...rgp-fix-program_invocation_name-detection.patch |   51 +++++++++
 .../inetutils-1.8/inetutils-1.8-0003-wchar.patch   |   12 ++
 ...me-ruserpass-to-avoid-C-library-collision.patch |   58 +++++++++++
 ...detect-__rcmd_errstr-support-in-the-C-lib.patch |   57 ++++++++++
 ...e-daemon-from-the-C-library-when-possible.patch |   42 ++++++++
 .../inetutils-1.8-1004-detect-fork-support.patch   |   54 ++++++++++
 ...-1.8-1005-ftpd-add-daemon-D-nommu-support.patch |  109 ++++++++++++++++++++
 .../inetutils/inetutils_1.8.bb                     |   66 ++++++++++++
 10 files changed, 534 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/fix-disable-ipv6.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0003-wchar.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1004-detect-fork-support.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
 create mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb

diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/fix-disable-ipv6.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/fix-disable-ipv6.patch
new file mode 100644
index 0000000..75d51a1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/fix-disable-ipv6.patch
@@ -0,0 +1,58 @@
+Upstream: http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
+
+diff -ur inetutils-1.8.orig/ping/ping_common.h inetutils-1.8/ping/ping_common.h
+--- inetutils-1.8.orig/ping/ping_common.h	2010-05-15 20:55:47.000000000 +0930
++++ inetutils-1.8/ping/ping_common.h	2010-12-01 12:19:08.000000000 +1030
+@@ -17,10 +17,14 @@
+   You should have received a copy of the GNU General Public License
+   along with this program.  If not, see `http://www.gnu.org/licenses/'. */
+ 
++#include <config.h>
++
+ #include <netinet/in_systm.h>
+ #include <netinet/in.h>
+ #include <netinet/ip.h>
++#ifdef HAVE_IPV6
+ #include <netinet/icmp6.h>
++#endif
+ #include <icmp.h>
+ #include <error.h>
+ #include <progname.h>
+@@ -66,13 +70,19 @@
+   (t).tv_usec = ((i)%PING_PRECISION)*(1000000/PING_PRECISION) ;\
+ } while (0)
+ 
++#ifdef HAVE_IPV6
+ /* Not sure about this step*/
+ #define _PING_BUFLEN(p, USE_IPV6) ((USE_IPV6)? ((p)->ping_datalen + sizeof (struct icmp6_hdr)) : \
+ 				   ((p)->ping_datalen + sizeof (icmphdr_t)))
++#else
++#define _PING_BUFLEN(p, USE_IPV6) ((p)->ping_datalen + sizeof (icmphdr_t))
++#endif
+ 
++#ifdef HAVE_IPV6
+ typedef int (*ping_efp6) (int code, void *closure, struct sockaddr_in6 * dest,
+ 			  struct sockaddr_in6 * from, struct icmp6_hdr * icmp,
+ 			  int datalen);
++#endif
+ 
+ typedef int (*ping_efp) (int code,
+ 			 void *closure,
+@@ -81,13 +91,17 @@
+ 			 struct ip * ip, icmphdr_t * icmp, int datalen);
+ 
+ union event {
++#ifdef HAVE_IPV6
+   ping_efp6 handler6;
++#endif
+   ping_efp handler;
+ };
+ 
+ union ping_address {
+   struct sockaddr_in ping_sockaddr;
++#ifdef HAVE_IPV6
+   struct sockaddr_in6 ping_sockaddr6;
++#endif
+ };
+ 
+ typedef struct ping_data PING;
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
new file mode 100644
index 0000000..d328f13
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
@@ -0,0 +1,27 @@
+From 552a7d64ad4a7188a9b7cd89933ae7caf7ebfe90 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier at gentoo.org>
+Date: Thu, 18 Nov 2010 16:59:14 -0500
+Subject: [PATCH gnulib] printf-parse: pull in features.h for __GLIBC__
+
+Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+---
+ lib/printf-parse.h |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/lib/printf-parse.h b/lib/printf-parse.h
+index 67a4a2a..3bd6152 100644
+--- a/lib/printf-parse.h
++++ b/lib/printf-parse.h
+@@ -25,6 +25,9 @@
+ 
+ #include "printf-args.h"
+ 
++#ifdef HAVE_FEATURES_H
++# include <features.h>	/* for __GLIBC__ */
++#endif
+ 
+ /* Flags */
+ #define FLAG_GROUP       1      /* ' flag */
+-- 
+1.7.3.2
+
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
new file mode 100644
index 0000000..6861f21
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
@@ -0,0 +1,51 @@
+From 93dbd3319232613ff8f5f3f08bf5f57b21980ef1 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier at gentoo.org>
+Date: Thu, 18 Nov 2010 17:14:21 -0500
+Subject: [PATCH gnulib] argp: fix program_invocation_name detection
+
+The current program_invocation_name symbol detection fails if the argp.h
+header is missing.  So check for the header first before detecting if the
+symbol exists.
+
+Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+---
+ m4/argp.m4 |   15 +++++++++++++--
+ 1 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/m4/argp.m4 b/m4/argp.m4
+index d3ca5ba..efa562c 100644
+--- a/m4/argp.m4
++++ b/m4/argp.m4
+@@ -31,8 +31,14 @@ AC_DEFUN([gl_ARGP],
+   # are defined elsewhere. It is improbable that only one of them will
+   # be defined and other not, I prefer to stay on the safe side and to
+   # test each one separately.
++  AC_CHECK_HEADERS_ONCE([argp.h])
+   AC_MSG_CHECKING([whether program_invocation_name is defined])
+-  AC_TRY_LINK([#include <argp.h>],
++  AC_TRY_LINK([
++#include <errno.h>
++#ifdef HAVE_ARGP_H
++# include <argp.h>
++#endif
++],
+               [ program_invocation_name = "test"; ],
+               [ AC_DEFINE([HAVE_PROGRAM_INVOCATION_NAME], [1],
+                  [Define if program_invocation_name is defined])
+@@ -40,7 +46,12 @@ AC_DEFUN([gl_ARGP],
+               [ AC_MSG_RESULT([no])] )
+ 
+   AC_MSG_CHECKING([whether program_invocation_short_name is defined])
+-  AC_TRY_LINK([#include <argp.h>],
++  AC_TRY_LINK([
++#include <errno.h>
++#ifdef HAVE_ARGP_H
++# include <argp.h>
++#endif
++],
+               [ program_invocation_short_name = "test"; ],
+               [ AC_DEFINE([HAVE_PROGRAM_INVOCATION_SHORT_NAME], [1],
+                  [Define if program_invocation_short_name is defined])
+-- 
+1.7.3.2
+
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0003-wchar.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0003-wchar.patch
new file mode 100644
index 0000000..21635a7
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0003-wchar.patch
@@ -0,0 +1,12 @@
+--- inetutils-1.8/lib/wchar.in.h
++++ inetutils-1.8/lib/wchar.in.h
+@@ -70,6 +70,9 @@
+ /* The include_next requires a split double-inclusion guard.  */
+ #if @HAVE_WCHAR_H@
+ # @INCLUDE_NEXT@ @NEXT_WCHAR_H@
++#else
++# include <stddef.h>
++# define MB_CUR_MAX 1
+ #endif
+ 
+ #undef _GL_ALREADY_INCLUDING_WCHAR_H
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
new file mode 100644
index 0000000..a6e366d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
@@ -0,0 +1,58 @@
+From 4f890adb39b52bc43c578966071625004988e3b8 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier at gentoo.org>
+Date: Thu, 18 Nov 2010 22:11:48 -0500
+Subject: [PATCH] ftp: rename ruserpass to avoid C library collision
+
+The C library itself defines a "ruserpass" function.  When linking
+statically, it is possible to hit a symbol collision linker error.
+So rename the local ftp version to "remote_userpass".
+
+Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+---
+ ftp/extern.h    |    2 +-
+ ftp/ftp.c       |    2 +-
+ ftp/ruserpass.c |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ftp/extern.h b/ftp/extern.h
+index 8cdb8aa..037cb61 100644
+--- a/ftp/extern.h
++++ b/ftp/extern.h
+@@ -119,7 +119,7 @@ void reset (int, char **);
+ void restart (int, char **);
+ void rmthelp (int, char **);
+ void rmtstatus (int, char **);
+-int ruserpass (char *, char **, char **, char **);
++int remote_userpass (char *, char **, char **, char **);
+ void sendrequest (char *, char *, char *, int);
+ void setascii (int, char **);
+ void setbell (int, char **);
+diff --git a/ftp/ftp.c b/ftp/ftp.c
+index c20ba41..95675cc 100644
+--- a/ftp/ftp.c
++++ b/ftp/ftp.c
+@@ -251,7 +251,7 @@ login (char *host)
+   int n, aflag = 0;
+ 
+   user = pass = acct = 0;
+-  if (ruserpass (host, &user, &pass, &acct) < 0)
++  if (remote_userpass (host, &user, &pass, &acct) < 0)
+     {
+       code = -1;
+       return (0);
+diff --git a/ftp/ruserpass.c b/ftp/ruserpass.c
+index 8572b95..c08fbc0 100644
+--- a/ftp/ruserpass.c
++++ b/ftp/ruserpass.c
+@@ -111,7 +111,7 @@ static struct toktab
+ };
+ 
+ int
+-ruserpass (char *host, char **aname, char **apass, char **aacct)
++remote_userpass (char *host, char **aname, char **apass, char **aacct)
+ {
+   char *hdir, buf[BUFSIZ], *tmp;
+   char *myname = 0, *mydomain;
+-- 
+1.7.3.2
+
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
new file mode 100644
index 0000000..7708c40
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
@@ -0,0 +1,57 @@
+From 730015f060fe76eee615f361a65eb719cdf22eef Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier at gentoo.org>
+Date: Thu, 18 Nov 2010 22:20:39 -0500
+Subject: [PATCH] rshd: detect __rcmd_errstr support in the C lib
+
+Not all C libraries support __rcmd_errstr, so add a configure test for it.
+
+Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+---
+ configure.ac |    2 +-
+ src/rshd.c   |    4 ++++
+ 2 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c1ac270..79d655c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -587,7 +587,7 @@ AC_CHECK_FUNCS(cfsetspeed cgetent dirfd fchdir flock \
+                setsid setregid setreuid setresgid setresuid setutent_r \
+                sigaction sigvec strchr setproctitle tcgetattr tzset utimes \
+                utime uname \
+-               updwtmp updwtmpx vhangup wait3 wait4 opendir2)
++               updwtmp updwtmpx vhangup wait3 wait4 opendir2 __rcmd_errstr)
+ 
+ dnl Functions that we will define if necessary.
+ AC_REPLACE_FUNCS(getpass getusershell memcmp memcpy memmove memset \
+diff --git a/src/rshd.c b/src/rshd.c
+index d49facd..9301ef2 100644
+--- a/src/rshd.c
++++ b/src/rshd.c
+@@ -284,7 +284,9 @@ extern char **environ;
+ void
+ doit (int sockfd, struct sockaddr_in *fromp)
+ {
++#ifdef HAVE___RCMD_ERRSTR
+   extern char *__rcmd_errstr;	/* syslog hook from libc/net/rcmd.c. */
++#endif
+   struct hostent *hp;
+   struct passwd *pwd;
+   u_short port;
+@@ -757,11 +759,13 @@ doit (int sockfd, struct sockaddr_in *fromp)
+                      && (iruserok (fromp->sin_addr.s_addr, pwd->pw_uid == 0,
+                                    remuser, locuser)) < 0))
+     {
++#ifdef HAVE___RCMD_ERRSTR
+       if (__rcmd_errstr)
+ 	syslog (LOG_INFO | LOG_AUTH,
+ 		"%s@%s as %s: permission denied (%s). cmd='%.80s'",
+ 		remuser, hostname, locuser, __rcmd_errstr, cmdbuf);
+       else
++#endif
+ 	syslog (LOG_INFO | LOG_AUTH,
+ 		"%s@%s as %s: permission denied. cmd='%.80s'",
+ 		remuser, hostname, locuser, cmdbuf);
+-- 
+1.7.3.2
+
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
new file mode 100644
index 0000000..8575c10
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
@@ -0,0 +1,42 @@
+From 3b9f64c6a668849b37b884a7826885c70b95787b Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier at gentoo.org>
+Date: Thu, 18 Nov 2010 22:24:06 -0500
+Subject: [PATCH] use daemon from the C library when possible
+
+Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+---
+ configure.ac          |    2 +-
+ libinetutils/daemon.c |    2 ++
+ 2 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 79d655c..25cc3db 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -579,7 +579,7 @@ AC_FUNC_MMAP
+ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+ 
+-AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent dirfd fchdir flock \
++AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent daemon dirfd fchdir flock \
+                fpathconf ftruncate \
+ 	       getcwd getmsg getspnam initgroups initsetproctitle killpg \
+                mkstemp ptsname \
+diff --git a/libinetutils/daemon.c b/libinetutils/daemon.c
+index 2156af4..9beb255 100644
+--- a/libinetutils/daemon.c
++++ b/libinetutils/daemon.c
+@@ -197,8 +197,10 @@ waitdaemon (int nochdir, int noclose, int maxwait)
+   return ppid;
+ }
+ 
++#ifndef HAVE_DAEMON
+ int
+ daemon (int nochdir, int noclose)
+ {
+   return (waitdaemon (nochdir, noclose, 0) == -1) ? -1 : 0;
+ }
++#endif
+-- 
+1.7.3.2
+
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1004-detect-fork-support.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1004-detect-fork-support.patch
new file mode 100644
index 0000000..fc9d726
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1004-detect-fork-support.patch
@@ -0,0 +1,54 @@
+From 0acaed0d4b2bf9495e71ec4c898733bed2a86be0 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier at gentoo.org>
+Date: Thu, 18 Nov 2010 22:27:55 -0500
+Subject: [PATCH] detect fork() support
+
+Linux/nommu systems cannot support a fork(), so add a configure test for
+it so apps can pick that or vfork().
+
+Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+---
+ configure.ac                |    2 +-
+ libinetutils/libinetutils.h |    9 +++++++++
+ 2 files changed, 10 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 25cc3db..98196f4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -580,7 +580,7 @@ AC_FUNC_MALLOC
+ AC_FUNC_REALLOC
+ 
+ AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent daemon dirfd fchdir flock \
+-               fpathconf ftruncate \
++               fork fpathconf ftruncate \
+ 	       getcwd getmsg getspnam initgroups initsetproctitle killpg \
+                mkstemp ptsname \
+                setegid seteuid setpgid \
+diff --git a/libinetutils/libinetutils.h b/libinetutils/libinetutils.h
+index 19bbde5..86365b0 100644
+--- a/libinetutils/libinetutils.h
++++ b/libinetutils/libinetutils.h
+@@ -17,6 +17,8 @@
+   You should have received a copy of the GNU General Public License
+   along with this program.  If not, see `http://www.gnu.org/licenses/'. */
+ 
++#include <config.h>
++
+ #include "argp-version-etc.h"
+ 
+ void utmp_init (char *line, char *user, char *id);
+@@ -32,3 +34,10 @@ extern const char *default_program_authors[];
+ #define iu_argp_init(name, authors)				\
+   argp_program_bug_address = "<" PACKAGE_BUGREPORT ">";		\
+   argp_version_setup (name, authors);
++
++#ifdef HAVE_FORK
++# define fork_exit(s) exit(s)
++#else
++# define fork() vfork()
++# define fork_exit(s) _exit(s)
++#endif
+-- 
+1.7.3.2
+
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
new file mode 100644
index 0000000..844905b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
@@ -0,0 +1,109 @@
+From 1dee55b90d2971859377156e6210efdfdf1bac84 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier at gentoo.org>
+Date: Fri, 19 Nov 2010 20:26:48 -0500
+Subject: [PATCH] ftpd: add daemon (-D) nommu support
+
+The current daemon design of ftpd is to:
+	- loop in server_mode() waiting for a connection
+	- fork a child and return to main() to process like inetd
+	- have parent continue looping in server_mode()
+
+On a nommu system where we can only vfork(), the child returning
+from server_mode() corrupts the stack and messes up the the parent.
+So rather than having the child return, exec a new ftpd process in
+the normal inetd mode.  This also fixes the problem in nommu where
+a vfork-ed child pauses the parent until it either exits or execs
+something.
+
+Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+---
+ ftpd/extern.h      |    3 ++-
+ ftpd/ftpd.c        |   17 ++++++++++++++---
+ ftpd/server_mode.c |    9 ++++++++-
+ 3 files changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/ftpd/extern.h b/ftpd/extern.h
+index 2483fe6..81182e0 100644
+--- a/ftpd/extern.h
++++ b/ftpd/extern.h
+@@ -110,7 +110,8 @@ extern char tmpline[];
+ extern off_t restart_point;
+ 
+ /* Exported from server_mode.c.  */
+-extern int server_mode (const char *pidfile, struct sockaddr_in *phis_addr);
++extern int server_mode (const char *pidfile, struct sockaddr_in *phis_addr,
++			char *argv[]);
+ 
+ /* Credential for the request.  */
+ struct credentials
+diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c
+index aed74e6..c5c4c90 100644
+--- a/ftpd/ftpd.c
++++ b/ftpd/ftpd.c
+@@ -424,8 +424,7 @@ main (int argc, char *argv[], char **envp)
+   argp_parse (&argp, argc, argv, 0, &index, NULL);
+   
+   /* Bail out, wrong usage */
+-  argc -= index;
+-  if (argc != 0)
++  if (argc - index != 0)
+     error (1, 0, "surplus arguments; try `%s --help' for more info",
+ 	   program_name);
+ 
+@@ -438,7 +437,19 @@ main (int argc, char *argv[], char **envp)
+      fd = accept(). tcpd is check if compile with the support  */
+   if (daemon_mode)
+     {
+-      if (server_mode (pid_file, &his_addr) < 0)
++#ifndef HAVE_FORK
++      /* Shift out the daemon option in subforks  */
++      int i;
++      for (i = 0; i < argc; ++i)
++	if (strcmp (argv[i], "-D") == 0)
++	  {
++	    int j;
++	    for (j = i; j < argc; ++j)
++	      argv[j] = argv[j + 1];
++	    argv[--argc] = NULL;
++	  }
++#endif
++      if (server_mode (pid_file, &his_addr, argv) < 0)
+ 	exit (1);
+     }
+   else
+diff --git a/ftpd/server_mode.c b/ftpd/server_mode.c
+index 3d3a498..605e13e 100644
+--- a/ftpd/server_mode.c
++++ b/ftpd/server_mode.c
+@@ -37,6 +37,8 @@
+ # include <tcpd.h>
+ #endif
+ 
++#include <libinetutils.h>
++
+ static void reapchild (int);
+ 
+ #define DEFPORT 21
+@@ -92,7 +94,7 @@ reapchild (int signo ARG_UNUSED)
+ }
+ 
+ int
+-server_mode (const char *pidfile, struct sockaddr_in *phis_addr)
++server_mode (const char *pidfile, struct sockaddr_in *phis_addr, char *argv[])
+ {
+   int ctl_sock, fd;
+   struct servent *sv;
+@@ -176,5 +178,10 @@ server_mode (const char *pidfile, struct sockaddr_in *phis_addr)
+   if (!check_host ((struct sockaddr *) phis_addr))
+     return -1;
+ #endif
++
++#ifndef HAVE_FORK
++  _exit(execvp(argv[0], argv));
++#endif
++
+   return fd;
+ }
+-- 
+1.7.3.2
+
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
new file mode 100644
index 0000000..8fc34d6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
@@ -0,0 +1,66 @@
+SECTION = "libs"
+DEPENDS = "ncurses fakeroot-native"
+LICENSE = "GPL"
+DESCRIPTION = "The GNU inetutils are a collection of common \
+networking utilities and servers including ftp, ftpd, rcp, \
+rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
+talkd, telnet, telnetd, tftp, tftpd, and uucpd."
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
+
+SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
+           file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
+           file://inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch \
+           file://inetutils-1.8-0003-wchar.patch \
+           file://inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch \
+           file://inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch \
+           file://inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch \
+           file://inetutils-1.8-1004-detect-fork-support.patch \
+           file://inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch \
+           file://fix-disable-ipv6.patch \
+"
+
+inherit autotools gettext
+
+noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
+EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
+		--with-path-procnet-dev=/proc/net/dev \
+		${noipv6} \
+		"
+
+do_configure_prepend () {
+	export HELP2MAN='true'
+	cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
+	rm -f ${S}/glob/configure*
+}
+
+fakeroot do_install () {
+	autotools_do_install
+	install -d ${D}${base_sbindir} ${D}${base_bindir}
+	mv ${D}${bindir}/tftp ${D}${bindir}/tftp.${PN}
+	mv ${D}${bindir}/telnet ${D}${bindir}/telnet.${PN}
+	mv ${D}${bindir}/logger ${D}${bindir}/logger.${PN}
+	mv ${D}${bindir}/traceroute ${D}${bindir}/traceroute.${PN}
+	mv ${D}${bindir}/hostname ${D}${base_bindir}/hostname.${PN}
+	mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/ifconfig.${PN}
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${bindir}/tftp tftp tftp.${PN} 100
+	update-alternatives --install ${bindir}/telnet telnet telnet.${PN} 100
+	update-alternatives --install ${bindir}/logger logger logger.${PN} 100
+	update-alternatives --install ${bindir}/traceroute traceroute traceroute.${PN} 100
+	update-alternatives --install ${base_bindir}/hostname hostname hostname.${PN} 100
+	update-alternatives --install ${base_sbindir}/ifconfig ifconfig ifconfig.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove tftp tftp.${PN}
+	update-alternatives --remove telnet telnet.${PN}
+	update-alternatives --remove logger logger.${PN}
+	update-alternatives --remove traceroute traceroute.${PN}
+	update-alternatives --remove ifconfig ifconfig.${PN}
+}
+
+SRC_URI[md5sum] = "ad8fdcdf1797b9ca258264a6b04e48fd"
+SRC_URI[sha256sum] = "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29abf25b52b68311c7"
-- 
1.7.0.4




