Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C1377723C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 08:53:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44140439"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Nov 2014 16:49:41 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAS8qcBA008572
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 16:52:38 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 28 Nov 2014 16:53:02 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Nov 2014 16:49:43 +0800
Message-ID: <1417164585-46087-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1417164585-46087-1-git-send-email-biannm@cn.fujitsu.com>
References: <1417164585-46087-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 1/3] [meta-oe]daemontools: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Nov 2014 08:53:02 -0000
Content-Type: text/plain

daemontools is a collection of tools for managing UNIX services. 

Though daemontools is a very old tool, but it still supported by some
distro such as ubuntu(trusty 14.04LTS).

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 ...or.h-include-errno.h-instead-of-extern-int.diff | 25 ++++++++++++
 ....c-.-supervise-may-be-a-symlink-if-it-s-da.diff | 47 ++++++++++++++++++++++
 .../daemontools/daemontools/cross-compile.patch    | 45 +++++++++++++++++++++
 .../daemontools/daemontools_0.76.bb                | 47 ++++++++++++++++++++++
 4 files changed, 164 insertions(+)
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
 create mode 100644 meta-oe/recipes-support/daemontools/daemontools_0.76.bb

diff --git a/meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff b/meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff
new file mode 100644
index 0000000..ce19597
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools/0001-error.h-include-errno.h-instead-of-extern-int.diff
@@ -0,0 +1,25 @@
+From d3e7651e2f2492dd1031d09a99713644b604cab5 Mon Sep 17 00:00:00 2001
+From: Gerrit Pape <pape@smarden.org>
+Date: Wed, 12 Dec 2007 13:44:15 +0000
+Subject: [PATCH] error.h: '#include <errno.h>' instead of 'extern int errno;'
+
+---
+ daemontools-0.76/src/error.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git daemontools-0.76.orig/src/error.h daemontools-0.76/src/error.h
+index 086fb55..f7e8273 100644
+--- daemontools-0.76.orig/src/error.h
++++ daemontools-0.76/src/error.h
+@@ -3,7 +3,7 @@
+ #ifndef ERROR_H
+ #define ERROR_H
+ 
+-extern int errno;
++#include <errno.h>
+ 
+ extern int error_intr;
+ extern int error_nomem;
+-- 
+1.5.4.2
+
diff --git a/meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff b/meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff
new file mode 100644
index 0000000..73dce90
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools/0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff
@@ -0,0 +1,47 @@
+From 7ee585cab1d5b68f804a5601a66ae87799c8a7c3 Mon Sep 17 00:00:00 2001
+From: Gerrit Pape <pape@smarden.org>
+Date: Sun, 24 Feb 2008 10:54:26 +0000
+Subject: [PATCH] supervise.c: ./supervise may be a symlink, if it's dangling, create link target
+
+---
+ daemontools-0.76/src/supervise.c |   17 ++++++++++++++++-
+ 1 files changed, 16 insertions(+), 1 deletions(-)
+
+diff --git daemontools-0.76.orig/src/supervise.c daemontools-0.76/src/supervise.c
+index 2482ad2..f43cabf 100644
+--- daemontools-0.76.orig/src/supervise.c
++++ daemontools-0.76/src/supervise.c
+@@ -208,6 +208,8 @@ void doit(void)
+ int main(int argc,char **argv)
+ {
+   struct stat st;
++  int r;
++  char buf[256];
+ 
+   dir = argv[1];
+   if (!dir || argv[2])
+@@ -232,7 +234,20 @@ int main(int argc,char **argv)
+     if (errno != error_noent)
+       strerr_die4sys(111,FATAL,"unable to stat ",dir,"/down: ");
+ 
+-  mkdir("supervise",0700);
++  if (mkdir("supervise",0700) == -1) {
++    if ((r = readlink("supervise", buf, 256)) != -1) {
++      if (r == 256) {
++        errno = EOVERFLOW;
++        strerr_die1sys(111,"unable to readlink ./supervise: ");
++      }
++      buf[r] = 0;
++      mkdir(buf, 0700);
++    }
++    else {
++      if ((errno != ENOENT) && (errno != EINVAL))
++        strerr_die1sys(111, "unable to readlink ./supervise: ");
++    }
++  }
+   fdlock = open_append("supervise/lock");
+   if ((fdlock == -1) || (lock_exnb(fdlock) == -1))
+     strerr_die4sys(111,FATAL,"unable to acquire ",dir,"/supervise/lock: ");
+-- 
+1.5.4.2
+
diff --git a/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
new file mode 100644
index 0000000..f164c2d
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
@@ -0,0 +1,45 @@
+make sure it can be compiled for cross target
+
+1. never try to compile target binary by native gcc
+2. target's chkshsgr doesn't work on native.
+3. it's wrong to do target tests on native.
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+
+diff -Nurp daemontools-0.76.orig/src/conf-cc daemontools-0.76/src/conf-cc
+--- daemontools-0.76.orig/src/conf-cc	2001-07-13 00:49:49.000000000 +0800
++++ daemontools-0.76/src/conf-cc	2014-11-26 09:34:38.828812162 +0800
+@@ -1,3 +1,3 @@
+-gcc -O2 -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitialized -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings
++${CC} -O2 -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitialized -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings
+ 
+ This will be used to compile .c files.
+diff -Nurp daemontools-0.76.orig/src/conf-ld daemontools-0.76/src/conf-ld
+--- daemontools-0.76.orig/src/conf-ld	2001-07-13 00:49:49.000000000 +0800
++++ daemontools-0.76/src/conf-ld	2014-11-26 09:34:49.880811730 +0800
+@@ -1,3 +1,3 @@
+-gcc -s
++${CC}
+ 
+ This will be used to link .o files into an executable.
+diff -Nurp daemontools-0.76.orig/src/Makefile daemontools-0.76/src/Makefile
+--- daemontools-0.76.orig/src/Makefile	2001-07-13 00:49:49.000000000 +0800
++++ daemontools-0.76/src/Makefile	2014-11-26 09:38:47.120802459 +0800
+@@ -165,7 +165,7 @@ hassgprm.h: choose compile hassgprm.h1 h
+ 
+ hasshsgr.h: chkshsgr choose compile hasshsgr.h1 hasshsgr.h2 load \
+ tryshsgr.c warn-shsgr
+-	./chkshsgr || ( cat warn-shsgr; exit 1 )
++	chkshsgr || ( cat warn-shsgr; exit 1 )
+ 	./choose clr tryshsgr hasshsgr.h1 hasshsgr.h2 > hasshsgr.h
+ 
+ haswaitp.h: choose compile haswaitp.h1 haswaitp.h2 load trywaitp.c
+@@ -265,7 +265,7 @@ readproctitle.o: compile error.h readpro
+ rts: envdir envuidgid fghack matchtest multilog pgrphack \
+ readproctitle rts.tests setlock setuidgid softlimit supervise svc \
+ svok svscan svscanboot svstat tai64n tai64nlocal
+-	env - /bin/sh rts.tests 2>&1 | cat -v > rts
++	echo "Warning: We can not run test on cross target."
+ 
+ scan_ulong.o: compile scan.h scan_ulong.c
+ 	./compile scan_ulong.c
diff --git a/meta-oe/recipes-support/daemontools/daemontools_0.76.bb b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
new file mode 100644
index 0000000..fb87ea8
--- /dev/null
+++ b/meta-oe/recipes-support/daemontools/daemontools_0.76.bb
@@ -0,0 +1,47 @@
+SUMMARY = "DJB daemontools"
+DESCRIPTION = "supervise monitors a service. It starts the service and restarts the \
+service if it dies. The companion svc program stops, pauses, or restarts \
+the service on sysadmin request. The svstat program prints a one-line \
+status report. \
+multilog saves error messages to one or more logs.  It optionally timestamps \
+each line and, for each log, includes or excludes lines matching specified \
+patterns.  It automatically rotates logs to limit the amount of disk space \
+used.  If the disk fills up, it pauses and tries again, without losing any \
+data."
+
+SECTION = "System/Servers"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/PD;md5=b3597d12946881e13cb3b548d1173851"
+LICENSE = "PD"
+
+SRC_URI = "http://cr.yp.to/daemontools/${BPN}-${PV}.tar.gz \
+           file://0001-error.h-include-errno.h-instead-of-extern-int.diff \
+           file://0002-supervise.c-.-supervise-may-be-a-symlink-if-it-s-da.diff "
+
+SRC_URI_append_class-target = "file://cross-compile.patch"
+
+SRC_URI[md5sum] = "1871af2453d6e464034968a0fbcb2bfc"
+SRC_URI[sha256sum] = "a55535012b2be7a52dcd9eccabb9a198b13be50d0384143bd3b32b8710df4c1f"
+
+S = "${WORKDIR}/admin/${BPN}-${PV}"
+
+DEPENDS += "daemontools-native"
+DEPENDS_virtclass-native = ""
+
+do_compile() {
+    ./package/compile
+}
+
+do_install() {
+    install -d ${D}/${bindir}
+}
+
+do_install_append_class-native() {
+    install -m 755 ${S}/compile/chkshsgr ${D}/${bindir}
+}
+
+do_install_append_class-target() {
+    install -m755 ${S}/command/* ${D}/${bindir}
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


