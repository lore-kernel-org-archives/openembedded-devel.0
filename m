Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D8A9860BD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 01:45:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86435361"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 09:45:36 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 0841C50A9981
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 09:35:32 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 09:45:33 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 09:45:40 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 00:19:55 -0700
Message-ID: <1584429596-2007-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 0841C50A9981.A569D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] arptables: upgrade 0.0.4 -> 0.0.5
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
X-List-Received-Date: Tue, 17 Mar 2020 01:45:36 -0000
Content-Type: text/plain

arptables-init-busybox.patch
arptables-remove-bashism.patch
removed since they are not available in 0.0.5

refresh 0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-for-package-specific-compiler-flags.patch | 42 +++-------
 .../arptables/arptables-init-busybox.patch    | 77 -------------------
 .../arptables/arptables-remove-bashism.patch  | 37 ---------
 .../arptables/arptables_git.bb                |  6 +-
 4 files changed, 14 insertions(+), 148 deletions(-)
 delete mode 100644 meta-networking/recipes-support/arptables/arptables/arptables-init-busybox.patch
 delete mode 100644 meta-networking/recipes-support/arptables/arptables/arptables-remove-bashism.patch

diff --git a/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch b/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
index e8be45e6b..eb58389c3 100644
--- a/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
+++ b/meta-networking/recipes-support/arptables/arptables/0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch
@@ -8,24 +8,17 @@ which OE uses to pass tweaks
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- Makefile            | 15 +++++++--------
- extensions/Makefile |  5 ++++-
- 2 files changed, 11 insertions(+), 9 deletions(-)
+ Makefile            | 10 ++++------
+ extensions/Makefile |  4 ++++
+ 2 files changed, 8 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 7bead0d..336db6b 100644
+index 62ebdf2..cd06813 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -7,15 +7,13 @@ LIBDIR:=$(PREFIX)/lib
- BINDIR:=$(PREFIX)/sbin
- MANDIR:=$(PREFIX)/man
- man8dir=$(MANDIR)/man8
--INITDIR:=/etc/rc.d/init.d
-+INITDIR:=/etc/init.d
- SYSCONFIGDIR:=/etc/sysconfig
- DESTDIR:=
+@@ -12,9 +12,7 @@ DESTDIR:=
  
- MANS = arptables.8 arptables-save.8 arptables-restore.8
+ MANS = arptables-legacy.8 arptables-save.8 arptables-restore.8
  
 -COPT_FLAGS:=-O2
 -CFLAGS:=$(COPT_FLAGS) -Wall -Wunused -I$(KERNEL_DIR)/include/ -Iinclude/ -DARPTABLES_VERSION=\"$(ARPTABLES_VERSION)\" #-g -DDEBUG #-pg # -DARPTC_DEBUG
@@ -34,8 +27,8 @@ index 7bead0d..336db6b 100644
  ifndef ARPT_LIBDIR
  ARPT_LIBDIR:=$(LIBDIR)/arptables
  endif
-@@ -25,13 +23,13 @@ include extensions/Makefile
- all: arptables libarptc/libarptc.a
+@@ -24,13 +22,13 @@ include extensions/Makefile
+ all: arptables-legacy libarptc/libarptc.a
  
  arptables.o: arptables.c
 -	$(CC) $(CFLAGS) -c -o $@ $<
@@ -51,29 +44,18 @@ index 7bead0d..336db6b 100644
  
  libarptc/libarptc.a: libarptc/libarptc.o
  	$(AR) rcs $@ $<
-@@ -53,7 +51,8 @@ scripts: arptables-save arptables-restore arptables.sysv
- 	install -m 0755 arptables-restore_ $(DESTDIR)$(BINDIR)/arptables-restore
- 	cat arptables.sysv | sed 's/__EXEC_PATH__/$(tmp1)/g' | sed 's/__SYSCONFIG__/$(tmp2)/g' > arptables.sysv_
- 	if [ "$(DESTDIR)" != "" ]; then mkdir -p $(DESTDIR)$(INITDIR); fi
--	if test -d $(DESTDIR)$(INITDIR); then install -m 0755 arptables.sysv_ $(DESTDIR)$(INITDIR)/arptables; fi
-+	install -d $(DESTDIR)$(INITDIR)
-+	install -m 0755 arptables.sysv_ $(DESTDIR)$(INITDIR)/arptables
- 	rm -f arptables-save_ arptables-restore_ arptables.sysv_
- 
- .PHONY: install-man
 diff --git a/extensions/Makefile b/extensions/Makefile
-index 0189cc9..b046425 100644
+index 0189cc9..e8af782 100644
 --- a/extensions/Makefile
 +++ b/extensions/Makefile
-@@ -4,4 +4,7 @@ EXT_FUNC+=standard mangle CLASSIFY MARK
- EXT_OBJS+=$(foreach T,$(EXT_FUNC), extensions/arpt_$(T).o)
+@@ -5,3 +5,7 @@ EXT_OBJS+=$(foreach T,$(EXT_FUNC), extensions/arpt_$(T).o)
  
  extensions/ebt_%.o: extensions/arpt_%.c include/arptables.h include/arptables_common.h
--	$(CC) $(CFLAGS) $(PROGSPECS) -c -o $@ $<
+ 	$(CC) $(CFLAGS) $(PROGSPECS) -c -o $@ $<
 +	$(CC) $(CFLAGS) $(ARPCFLAGS) $(PROGSPECS) -c -o $@ $<
 +
 +extensions/arpt_%.o: extensions/arpt_%.c include/arptables.h include/arptables_common.h
 +	$(CC) $(CFLAGS) $(ARPCFLAGS) $(PROGSPECS) -c -o $@ $<
 -- 
-2.12.1
+2.17.1
 
diff --git a/meta-networking/recipes-support/arptables/arptables/arptables-init-busybox.patch b/meta-networking/recipes-support/arptables/arptables/arptables-init-busybox.patch
deleted file mode 100644
index 24956c4ca..000000000
--- a/meta-networking/recipes-support/arptables/arptables/arptables-init-busybox.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-Index: arptables-v0.0.3-4/arptables.sysv
-===================================================================
---- arptables-v0.0.3-4.orig/arptables.sysv	2010-03-22 16:28:03.000000000 +0300
-+++ arptables-v0.0.3-4/arptables.sysv	2010-03-22 16:27:51.000000000 +0300
-@@ -12,10 +12,10 @@
- # config: __SYSCONFIG__/arptables
- 
- source /etc/init.d/functions
--source /etc/sysconfig/network
-+# source /etc/sysconfig/network
- 
- # Check that networking is up.
--[ ${NETWORKING} = "no" ] && exit 0
-+# [ ${NETWORKING} = "no" ] && exit 0
- 
- [ -x __EXEC_PATH__/arptables ] || exit 1
- [ -x __EXEC_PATH__/arptables-save ] || exit 1
-@@ -28,32 +28,30 @@
- desc="Arp filtering"
- 
- start() {
--	echo -n $"Starting $desc ($prog): "
-+	echo -n "Starting $desc ($prog): "
- 	__EXEC_PATH__/arptables-restore < __SYSCONFIG__/arptables || RETVAL=1
- 
- 	if [ $RETVAL -eq 0 ]; then
--		success "$prog startup"
--		rm -f /var/lock/subsys/$prog
-+		echo "$prog ok"
-+		touch /var/lock/subsys/$prog
- 	else
--		failure "$prog startup"
-+		echo "$prog failed"
- 	fi
- 
--	echo
- 	return $RETVAL
- }
- 
- stop() {
--	echo -n $"Stopping $desc ($prog): "
-+	echo -n "Stopping $desc ($prog): "
- 	__EXEC_PATH__/arptables-restore < /dev/null || RETVAL=1
- 
- 	if [ $RETVAL -eq 0 ]; then
--		success "$prog shutdown"
--		rm -f %{_localstatedir}/lock/subsys/$prog
-+		echo "$prog stopped"
-+		rm -f /var/lock/subsys/$prog
- 	else
--		failure "$prog shutdown"
-+		echo "$prog failed to stop"
- 	fi
- 
--	echo
- 	return $RETVAL
- }
- 
-@@ -63,15 +61,14 @@
- }
- 
- save() {
--	echo -n $"Saving $desc ($prog): "
-+	echo -n "Saving $desc ($prog): "
- 	__EXEC_PATH__/arptables-save > __SYSCONFIG__/arptables || RETVAL=1
- 
- 	if [ $RETVAL -eq 0 ]; then
--		success "$prog saved"
-+		echo "$prog saved"
- 	else
--		failure "$prog saved"
-+		echo "$prog is not saved"
- 	fi
--	echo
- }
- 
- case "$1" in
diff --git a/meta-networking/recipes-support/arptables/arptables/arptables-remove-bashism.patch b/meta-networking/recipes-support/arptables/arptables/arptables-remove-bashism.patch
deleted file mode 100644
index f332658bc..000000000
--- a/meta-networking/recipes-support/arptables/arptables/arptables-remove-bashism.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From cd312bc0e3686404428878d23b8888cba09a20e1 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 18 Sep 2014 19:46:58 -0700
-Subject: [PATCH] arptables.sysv: remove bashism
-
-Use "." to replace of "source", and change /bin/bash to /bin/sh, the
-echo $"foo" works well in busybox.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- arptables.sysv |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arptables.sysv b/arptables.sysv
-index 7a90bd2..7710376 100644
---- a/arptables.sysv
-+++ b/arptables.sysv
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- #
- # init script for arptables
- #
-@@ -11,7 +11,7 @@
- #
- # config: __SYSCONFIG__/arptables
- 
--source /etc/init.d/functions
-+. /etc/init.d/functions
- # source /etc/sysconfig/network
- 
- # Check that networking is up.
--- 
-1.7.9.5
-
diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b/meta-networking/recipes-support/arptables/arptables_git.bb
index cec1d1f77..c02a19944 100644
--- a/meta-networking/recipes-support/arptables/arptables_git.bb
+++ b/meta-networking/recipes-support/arptables/arptables_git.bb
@@ -2,15 +2,13 @@ SUMMARY = "Administration tool for arp packet filtering"
 SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
-SRCREV = "f4ab8f63f11a72f14687a6646d04ae1bae3fa45f"
-PV = "0.0.4+git${SRCPV}"
+SRCREV = "efae8949e31f8b2eb6290f377a28384cecaf105a"
+PV = "0.0.5+git${SRCPV}"
 
 SRC_URI = " \
     git://git.netfilter.org/arptables \
     file://0001-Use-ARPCFLAGS-for-package-specific-compiler-flags.patch \
-    file://arptables-init-busybox.patch \
     file://arptables-arpt-get-target-fix.patch \
-    file://arptables-remove-bashism.patch \
     file://arptables.service \
 "
 SRC_URI[arptables.md5sum] = "1d4ab05761f063b0751645d8f2b8f8e5"
-- 
2.17.1




