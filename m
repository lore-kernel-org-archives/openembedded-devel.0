Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC1F72621
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 05:44:47 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id v10so12578559pde.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Dec 2014 21:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1M+e+QeltNjBpefiU8m1bAR/PutdSG1n5hhLfy3/A5s=;
	b=fXbAR59NFfw9e7EzHh1KpWgV5wrrdHxC8d3qxFoQy/EO3oTnjdhcUnwQhdyJdHX65M
	1dkMCrTQ5uZMut8EHL8lFLgrN9+dThQ634z5/QVDy64L3rIJ5Akx6pMD/dndzt8lwWY0
	LGCYMKgHsnAPNVuuRA3Mc8Ikkemro9T1B9pOLGCg/MOlIcT0lb7lE2ZdP3IeMGDpdVN4
	HIkDsTuZEfXrKDWhF85Ct+RXJUlRKWdC32vqFZv8OfaPtpEndlLNnoebZKmb/es48gHx
	q86mFqldqrsN+aILa8PIog+ypm+hDAlc+waTR02+zQFfxCFnJESQ1BpH83syPUMBIr09
	NCbQ==
X-Received: by 10.66.251.167 with SMTP id zl7mr66660190pac.140.1419572688158; 
	Thu, 25 Dec 2014 21:44:48 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	th7sm27157997pac.47.2014.12.25.21.44.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Dec 2014 21:44:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Dec 2014 21:44:35 -0800
Message-Id: <1419572675-28661-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] proftpd: update to 1.3.5
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
X-List-Received-Date: Fri, 26 Dec 2014 05:44:49 -0000

dropped proftpd-sftp.patch as it is included in update.
combined make.patch, move-pidfile-to-var-run.patch, move-runfile-to-var-run.patch into
build_fixup

Added several packagesconfig options (too much eggnog)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../proftpd/files/build_fixup.patch                | 112 ++++++++++++++++
 .../recipes-daemons/proftpd/files/make.patch       |  66 ----------
 .../proftpd/files/move-pidfile-to-var-run.patch    |  39 ------
 .../proftpd/files/move-runfile-to-var-run.patch    |  39 ------
 .../proftpd/files/proftpd-sftp.patch               | 142 ---------------------
 .../{proftpd_1.3.4b.bb => proftpd_1.3.5.bb}        |  59 ++++++---
 6 files changed, 156 insertions(+), 301 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
 delete mode 100644 meta-networking/recipes-daemons/proftpd/files/make.patch
 delete mode 100644 meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-run.patch
 delete mode 100644 meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
 delete mode 100644 meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.4b.bb => proftpd_1.3.5.bb} (51%)

diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
new file mode 100644
index 0000000..19617a6
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
@@ -0,0 +1,112 @@
+Upstream-Status: Inappropriate [configuration]
+
+combined the following patches into one:
+make, move-pidfile-to-var-run, move-runfile-to-var-run
+
+move pidfile to /var/run
+redefine PR_RUN_DIR as ${localstatedir}/run
+
+Signed-off-By: Armin Kuster <akuster808@gmail.com>
+
+
+Index: proftpd-1.3.5/Make.rules.in
+===================================================================
+--- proftpd-1.3.5.orig/Make.rules.in
++++ proftpd-1.3.5/Make.rules.in
+@@ -29,9 +29,9 @@ INSTALL=@INSTALL@
+ INSTALL_STRIP=@INSTALL_STRIP@
+ INSTALL_USER=@install_user@
+ INSTALL_GROUP=@install_group@
+-INSTALL_BIN=$(INSTALL) $(INSTALL_STRIP) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755
+-INSTALL_SBIN=$(INSTALL) $(INSTALL_STRIP) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755
+-INSTALL_MAN=$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644
++INSTALL_BIN=$(INSTALL) -m 0755
++INSTALL_SBIN=$(INSTALL) -m 0755
++INSTALL_MAN=$(INSTALL) -m 0644
+ 
+ RM=rm -f
+ SHELL=@CONFIG_SHELL@
+Index: proftpd-1.3.5/Makefile.in
+===================================================================
+--- proftpd-1.3.5.orig/Makefile.in
++++ proftpd-1.3.5/Makefile.in
+@@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
+ $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
+ 	@if [ ! -d $@ ]; then \
+ 		mkdir -p $@; \
+-		chown $(INSTALL_USER):$(INSTALL_GROUP) $@; \
+ 		chmod 0755 $@; \
+ 	fi
+ 
+@@ -115,7 +114,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
+ 		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
+ 	fi
+ 	ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
+-	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.proftpd
+ 
+ install-libs: $(DESTDIR)$(libdir)/proftpd
+ 	cd lib/ && $(MAKE) install
+@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
+ 	$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
+ 	$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
+ 	$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
++	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
+ 
+ install-conf: $(DESTDIR)$(sysconfdir)
+ 	if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \
+-		$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644 \
++		$(INSTALL) -m 0644 \
+ 		           $(top_srcdir)/sample-configurations/basic.conf \
+ 	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
+ 	fi
+Index: proftpd-1.3.5/configure
+===================================================================
+--- proftpd-1.3.5.orig/configure
++++ proftpd-1.3.5/configure
+@@ -38255,7 +38255,7 @@ _ACEOF
+ 
+ 
+ cat >>confdefs.h <<_ACEOF
+-#define PR_RUN_DIR "`eval echo "${localstatedir}"`"
++#define PR_RUN_DIR "`eval echo "${localstatedir}"/run/`"
+ _ACEOF
+ 
+ cat >>confdefs.h <<_ACEOF
+@@ -38263,7 +38263,7 @@ cat >>confdefs.h <<_ACEOF
+ _ACEOF
+ 
+ cat >>confdefs.h <<_ACEOF
+-#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/proftpd.pid"`"
++#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/run/proftpd.pid"`"
+ _ACEOF
+ 
+ 
+Index: proftpd-1.3.5/configure.in
+===================================================================
+--- proftpd-1.3.5.orig/configure.in
++++ proftpd-1.3.5/configure.in
+@@ -2971,8 +2971,8 @@ locale_dir="`eval echo ${locale_dir}`"
+ AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`")
+ 
+ AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
+-AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/proftpd.conf"`")
+-AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/proftpd.pid"`")
++AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/run/proftpd.conf"`")
++AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/proftpd.pid"`")
+ 
+ prefix="$pr_saved_prefix"
+ exec_prefix="$pr_saved_exec_prefix"
+Index: proftpd-1.3.5/lib/libcap/Makefile
+===================================================================
+--- proftpd-1.3.5.orig/lib/libcap/Makefile
++++ proftpd-1.3.5/lib/libcap/Makefile
+@@ -26,7 +26,7 @@ OBJS=$(addsuffix .o, $(FILES))
+ all: $(LIBNAME)
+ 
+ _makenames: _makenames.c cap_names.sed
+-	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
++	$(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
+ 
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
diff --git a/meta-networking/recipes-daemons/proftpd/files/make.patch b/meta-networking/recipes-daemons/proftpd/files/make.patch
deleted file mode 100644
index c5ff013..0000000
--- a/meta-networking/recipes-daemons/proftpd/files/make.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: proftpd-1.3.2/Makefile.in
-===================================================================
---- proftpd-1.3.2.orig/Makefile.in
-+++ proftpd-1.3.2/Makefile.in
-@@ -76,7 +76,6 @@ check: proftpd$(EXEEXT)
- $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir) $(DESTDIR)$(rundir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
- 	@if [ ! -d $@ ]; then \
- 		mkdir -p $@; \
--		chown $(INSTALL_USER):$(INSTALL_GROUP) $@; \
- 		chmod 0755 $@; \
- 	fi
- 
-@@ -86,7 +85,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
- 		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
- 	fi
- 	ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
--	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.proftpd
- 
- install-libs: $(DESTDIR)$(libdir)/proftpd
- 	cd lib/ && $(MAKE) install
-@@ -121,11 +119,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
- 	$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
- 	$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
- 	$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
-+	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
- 
- install-conf: $(DESTDIR)$(sysconfdir)
- 	if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \
--		$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644 \
-+		$(INSTALL) -m 0644 \
- 		           $(top_srcdir)/sample-configurations/basic.conf \
- 	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
- 	fi
-Index: proftpd-1.3.2/Make.rules.in
-===================================================================
---- proftpd-1.3.2.orig/Make.rules.in
-+++ proftpd-1.3.2/Make.rules.in
-@@ -29,9 +29,9 @@ UTILS_LIBS=@UTILS_LIBS@ @LIBS@
- INSTALL=@INSTALL@
- INSTALL_USER=@install_user@
- INSTALL_GROUP=@install_group@
--INSTALL_BIN=$(INSTALL) @INSTALL_STRIP@ -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755
--INSTALL_SBIN=$(INSTALL) @INSTALL_STRIP@ -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755
--INSTALL_MAN=$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0644
-+INSTALL_BIN=$(INSTALL) -m 0755
-+INSTALL_SBIN=$(INSTALL) -m 0755
-+INSTALL_MAN=$(INSTALL) -m 0644
- 
- RM=rm -f
- SHELL=/bin/sh
-Index: proftpd-1.3.2/lib/libcap/Makefile
-===================================================================
---- proftpd-1.3.2.orig/lib/libcap/Makefile
-+++ proftpd-1.3.2/lib/libcap/Makefile
-@@ -26,7 +26,7 @@ OBJS=$(addsuffix .o, $(FILES))
- all: $(LIBNAME)
- 
- _makenames: _makenames.c cap_names.sed
--	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
-+	$(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
- 
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
diff --git a/meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-run.patch b/meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-run.patch
deleted file mode 100644
index 953bbdd..0000000
--- a/meta-networking/recipes-daemons/proftpd/files/move-pidfile-to-var-run.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-move pidfile to /var/run
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- configure    |    2 +-
- configure.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index e6268f5..ebed38e 100755
---- a/configure
-+++ b/configure
-@@ -33587,7 +33587,7 @@ cat >>confdefs.h <<_ACEOF
- _ACEOF
- 
- cat >>confdefs.h <<_ACEOF
--#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/proftpd.pid"`"
-+#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/run/proftpd.pid"`"
- _ACEOF
- 
- 
-diff --git a/configure.in b/configure.in
-index df9186a..e2ae868 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2790,7 +2790,7 @@ AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`")
- 
- AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
- AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/proftpd.conf"`")
--AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/proftpd.pid"`")
-+AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/proftpd.pid"`")
- 
- prefix="$pr_saved_prefix"
- exec_prefix="$pr_saved_exec_prefix"
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch b/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
deleted file mode 100644
index 1561ed8..0000000
--- a/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-redefine PR_RUN_DIR as ${localstatedir}/run
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- configure    |    2 +-
- configure.in |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index ebed38e..445d5bc 100755
---- a/configure
-+++ b/configure
-@@ -33579,7 +33579,7 @@ _ACEOF
- 
- 
- cat >>confdefs.h <<_ACEOF
--#define PR_RUN_DIR "`eval echo "${localstatedir}"`"
-+#define PR_RUN_DIR "`eval echo "${localstatedir}"/run/`"
- _ACEOF
- 
- cat >>confdefs.h <<_ACEOF
-diff --git a/configure.in b/configure.in
-index c17929c..df9186a 100644
---- a/configure.in
-+++ b/configure.in
-@@ -2788,7 +2788,7 @@ locale_dir="`eval echo ${localedir}`"
- locale_dir="`eval echo ${locale_dir}`"
- AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`")
- 
--AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
-+AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}/run"`")
- AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/proftpd.conf"`")
- AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/proftpd.pid"`")
- 
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch b/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch
deleted file mode 100644
index 8c71263..0000000
--- a/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-proftpd/mod_sftp: fix too much memory allocation bug of mod_sftp
-
-This patch fixes the too much memory allocation bug of the mod_sftp by
-ensuring both that a) the received response count matches the number of
-challenges sent, and b) that the received response count is not too high
-(as an additional sanity check); the upper bound is still set to 500.
-
-The patch is picked from: http://bugs.proftpd.org/show_bug.cgi?id=3973
-
-Upstream-Status: Backport CVE-2013-4359
-
-diff --git a/contrib/mod_sftp/kbdint.c b/contrib/mod_sftp/kbdint.c
-index 0271fb2..de651fa 100644
---- a/contrib/mod_sftp/kbdint.c
-+++ b/contrib/mod_sftp/kbdint.c
-@@ -1,6 +1,6 @@
- /*
-  * ProFTPD - mod_sftp keyboard-interactive driver mgmt
-- * Copyright (c) 2008-2009 TJ Saunders
-+ * Copyright (c) 2008-2013 TJ Saunders
-  *
-  * This program is free software; you can redistribute it and/or modify
-  * it under the terms of the GNU General Public License as published by
-@@ -31,6 +31,8 @@
- #include "utf8.h"
- #include "kbdint.h"
- 
-+#define SFTP_KBDINT_MAX_RESPONSES	500
-+
- struct kbdint_driver {
-   struct kbdint_driver *next, *prev;
- 
-@@ -252,8 +254,8 @@ int sftp_kbdint_send_challenge(const char *user, const char *instruction,
-   return res;
- }
- 
--int sftp_kbdint_recv_response(pool *p, unsigned int *count,
--    const char ***responses) {
-+int sftp_kbdint_recv_response(pool *p, unsigned int expected_count,
-+    unsigned int *rcvd_count, const char ***responses) {
-   register unsigned int i;
-   char *buf;
-   cmd_rec *cmd;
-@@ -264,7 +266,7 @@ int sftp_kbdint_recv_response(pool *p, unsigned int *count,
-   int res;
- 
-   if (p == NULL ||
--      count == NULL ||
-+      rcvd_count == NULL ||
-       responses == NULL) {
-     errno = EINVAL;
-     return -1;
-@@ -299,6 +301,29 @@ int sftp_kbdint_recv_response(pool *p, unsigned int *count,
- 
-   resp_count = sftp_msg_read_int(pkt->pool, &buf, &buflen);
- 
-+  /* Ensure that the number of responses sent by the client is the same
-+   * as the number of challenges sent, lest a malicious client attempt to
-+   * trick us into allocating too much memory (Bug#3973).
-+   */
-+  if (resp_count != expected_count) {
-+    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
-+      "sent %lu %s, but received %lu %s", (unsigned long) expected_count,
-+      expected_count != 1 ? "challenges" : "challenge",
-+      (unsigned long) resp_count, resp_count != 1 ? "responses" : "response");
-+    destroy_pool(pkt->pool);
-+    errno = EPERM;
-+    return -1;
-+  }
-+
-+  if (resp_count > SFTP_KBDINT_MAX_RESPONSES) {
-+    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
-+      "received too many responses (%lu > max %lu), rejecting",
-+      (unsigned long) resp_count, (unsigned long) SFTP_KBDINT_MAX_RESPONSES);
-+    destroy_pool(pkt->pool);
-+    errno = EPERM;
-+    return -1;
-+  }
-+
-   list = make_array(p, resp_count, sizeof(char *));
-   for (i = 0; i < resp_count; i++) {
-     char *resp;
-@@ -307,7 +332,7 @@ int sftp_kbdint_recv_response(pool *p, unsigned int *count,
-     *((char **) push_array(list)) = pstrdup(p, sftp_utf8_decode_str(p, resp));
-   }
- 
--  *count = (unsigned int) resp_count;
-+  *rcvd_count = (unsigned int) resp_count;
-   *responses = ((const char **) list->elts);
-   return 0;
- }
-diff --git a/contrib/mod_sftp/mod_sftp.h.in b/contrib/mod_sftp/mod_sftp.h.in
-index 3e91390..c547be0 100644
---- a/contrib/mod_sftp/mod_sftp.h.in
-+++ b/contrib/mod_sftp/mod_sftp.h.in
-@@ -1,6 +1,6 @@
- /*
-  * ProFTPD - mod_sftp
-- * Copyright (c) 2008-2011 TJ Saunders
-+ * Copyright (c) 2008-2013 TJ Saunders
-  *
-  * This program is free software; you can redistribute it and/or modify
-  * it under the terms of the GNU General Public License as published by
-@@ -174,7 +174,8 @@ int sftp_kbdint_register_driver(const char *name, sftp_kbdint_driver_t *driver);
- int sftp_kbdint_unregister_driver(const char *name);
- int sftp_kbdint_send_challenge(const char *, const char *, unsigned int,
-   sftp_kbdint_challenge_t *);
--int sftp_kbdint_recv_response(pool *, unsigned int *, const char ***);
-+int sftp_kbdint_recv_response(pool *, unsigned int, unsigned int *,
-+  const char ***);
- 
- /* API for modules that which to register keystores, for the
-  * SFTPAuthorizedHostKeys and SFTPAuthorizedUserKeys directives.
-diff --git a/contrib/mod_sftp_pam.c b/contrib/mod_sftp_pam.c
-index 6c32df0..81aa113 100644
---- a/contrib/mod_sftp_pam.c
-+++ b/contrib/mod_sftp_pam.c
-@@ -179,22 +179,13 @@ static int sftppam_converse(int nmsgs, PR_PAM_CONST struct pam_message **msgs,
-     return PAM_CONV_ERR;
-   }
- 
--  if (sftp_kbdint_recv_response(sftppam_driver.driver_pool, &recvd_count,
--      &recvd_responses) < 0) {
-+  if (sftp_kbdint_recv_response(sftppam_driver.driver_pool, list->nelts,
-+      &recvd_count, &recvd_responses) < 0) {
-     pr_trace_msg(trace_channel, 3,
-       "error receiving keyboard-interactive responses: %s", strerror(errno));
-     return PAM_CONV_ERR;
-   }
- 
--  /* Make sure that the count of responses matches the challenge count. */
--  if (recvd_count != list->nelts) {
--    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_PAM_VERSION,
--      "sent %d %s, but received %u %s", nmsgs,
--      list->nelts != 1 ? "challenges" : "challenge", recvd_count,
--      recvd_count != 1 ? "responses" : "response");
--    return PAM_CONV_ERR;
--  }
--
-   res = calloc(nmsgs, sizeof(struct pam_response));
-   if (res == NULL) {
-     pr_log_pri(PR_LOG_CRIT, "Out of memory!");
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
similarity index 51%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
index a5e766a..cba39e8 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
@@ -4,31 +4,60 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-PR = "r4"
-
 SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
-           file://make.patch \
            file://basic.conf.patch \
-           file://contrib.patch \
            file://proftpd-basic.init \
            file://default \
-           file://move-pidfile-to-var-run.patch \
            file://close-RequireValidShell-check.patch \
-           file://move-runfile-to-var-run.patch \
-           file://proftpd-sftp.patch \
-"
+           file://contrib.patch  \
+           file://build_fixup.patch \
+           "
 
-SRC_URI[md5sum] = "0871e0b93c9c3c88ca950b6d9a04aed2"
-SRC_URI[sha256sum] = "9f659585cea90fc6af34a0ffae4a90e4ed37abe92dbd9b6c311f95a436c961cb"
+SRC_URI[md5sum] = "aff1bff40e675244d72c4667f203e5bb"
+SRC_URI[sha256sum] = "c10316fb003bd25eccbc08c77dd9057e053693e6527ffa2ea2cc4e08ccb87715"
 
 inherit autotools-brokensep useradd update-rc.d
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses,--disable-curses --disable-ncurses,ncurses"
+PACKAGECONFIG ??= "sia shadow"
+PACKAGECONFIG += " ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+
+PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses, --disable-curses --disable-ncurses, ncurses"
+PACKAGECONFIG[openssl] = "--enable-openssl, --disable-openssl, openssl, openssl"
+PACKAGECONFIG[pam] = "--enable-auth-pam, --disable-auth-pam, libpam, libpam"
+PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6"
+PACKAGECONFIG[shadow] = "--enable-shadow, --disable-shadow"
+PACKAGECONFIG[pcre] = "--enable-pcre, --disable-pcre, libpcre "
+
+# enable POSIX.1e capabilities
+PACKAGECONFIG[cap] = "--enable-cap, --disable-cap, libcap, libcap"
+
+#enable support for POSIX ACLs
+PACKAGECONFIG[acl] = "--enable-facl, --disable-facl"
+
+#enable proftpd controls via ftpdct
+PACKAGECONFIG[ctrls] = "--enable-ctrls, --disable-crtls"
+
+#prevent proftpd from using its bundled getopt implementation.
+PACKAGECONFIG[getopt] = "--with-getopt, --without-getopt"
+
+#do not strip debugging symbols from installed code
+PACKAGECONFIG[strip] = "--enable-strip, --disable-strip"
+
+#enable SIA authentication support (Tru64)
+PACKAGECONFIG[sia] = "--enable-sia, --disable-sia"
+PACKAGECONFIG[sendfile] = "-enable-sendfile, --disable-sendfile"
+
+#enable Native Language Support (NLS)
+PACKAGECONFIG[nls] = "--enable-nls, --disable-nls"
+
+#add mod_dso to core modules
+PACKAGECONFIG[dso] = "--enable-dso, --disable-dso"
+PACKAGECONFIG[largefile] = "--enable-largefile, --disable-largefile"
+
+#omit mod_auth_file from core modules
+PACKAGECONFIG[auth] = "--enable-auth-file, --disable-auth-file"
 
-EXTRA_OECONF = "--disable-cap \
-                --disable-auth-pam \
-"
 
 # proftpd uses libltdl which currently makes configuring using
 # autotools.bbclass a pain...
-- 
1.9.1


