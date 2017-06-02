Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA8D77E76
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 06:50:31 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id u26so11734264pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 23:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bddmCpugLOqf2yeQr9I89DwjyWZtBYaVXCRrK/h0diM=;
	b=YQ4CIH2tJTH6OauusRKrQeoucZsn0mD5EYXQmibhAy4UsYoF/CqY37rL6kAx+RVjqs
	VyS5fdKYjP010u57D6OFWVR3aFJCmWHc3SjdklaqzO7+hb89DYhxCormFh4rr6UDXwtX
	gEU8kQk4C7oMdkjYdyDFMyv+aoWYbbQXt4qRTIq/vPnxGZBYNmSlfTMSwnl6YOQZ4yqc
	jCLqb/pk8VjuK1kpM/+KLJeEPSZnnAWhmDo8hYXG15WI8nwnp4hG9opCeofN9/c5rYEn
	X4EU2Y3z3+r8MkO+1s6frD/qAUn7py4AV5VW8qO/9sHayAhQClm61LbnGnod8HhkoVd5
	Zang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bddmCpugLOqf2yeQr9I89DwjyWZtBYaVXCRrK/h0diM=;
	b=TMbrpYZxCzQbMWY6V55+nSDbSDCbPYpijBE/azulErDmTAccve58X/RDMpAiXn1Yb7
	OIYAQGtVUsjUeGF1gMOzLc2AUWqKNgumkl7W1oa+605dsXowcX8+BD1FIwC+I6tS53Tw
	8cxF7GPCadFwek6AIIGezEC+phxlmpT4MqotiEZgn91hLh3uHLIBwHACZFgtJ0tIS7T1
	rnetEuQYoAGcnoz2Tn8C91hgnW9CVKdZd1M2ckLWoBQP8Mj5WmzsXxrdFrcYJNlHDbhd
	/zBOWFA63fKCCo3w/oDOmmVotYW+5/8q7ebqujtzBrCqXoN3thYMkp5mlcfQcHYJ47A2
	EDOg==
X-Gm-Message-State: AODbwcDtsiIf4UCq1GQDHhmqPAG2kVfG21bP7KMW6kSsjAcVe0wLDi/D
	9hmXMbjrUQyHzaKZ
X-Received: by 10.98.16.215 with SMTP id 84mr5292652pfq.210.1496386232940;
	Thu, 01 Jun 2017 23:50:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	a78sm43177369pfk.122.2017.06.01.23.50.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 23:50:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 23:50:16 -0700
Message-Id: <20170602065016.27954-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170602065016.27954-1-raj.khem@gmail.com>
References: <20170602065016.27954-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] proftpd: Update to 1.3.6 release
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
X-List-Received-Date: Fri, 02 Jun 2017 06:50:32 -0000

Use the new gnu-config files for musl support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../proftpd/files/build_fixup.patch                | 54 +++++++++++-----------
 .../{proftpd_1.3.5b.bb => proftpd_1.3.6.bb}        |  7 +--
 2 files changed, 31 insertions(+), 30 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.5b.bb => proftpd_1.3.6.bb} (94%)

diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
index 19617a6bb..9816d4d22 100644
--- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
+++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
@@ -9,11 +9,11 @@ redefine PR_RUN_DIR as ${localstatedir}/run
 Signed-off-By: Armin Kuster <akuster808@gmail.com>
 
 
-Index: proftpd-1.3.5/Make.rules.in
+Index: proftpd-1.3.6/Make.rules.in
 ===================================================================
---- proftpd-1.3.5.orig/Make.rules.in
-+++ proftpd-1.3.5/Make.rules.in
-@@ -29,9 +29,9 @@ INSTALL=@INSTALL@
+--- proftpd-1.3.6.orig/Make.rules.in
++++ proftpd-1.3.6/Make.rules.in
+@@ -30,9 +30,9 @@ INSTALL=@INSTALL@
  INSTALL_STRIP=@INSTALL_STRIP@
  INSTALL_USER=@install_user@
  INSTALL_GROUP=@install_group@
@@ -26,10 +26,10 @@ Index: proftpd-1.3.5/Make.rules.in
  
  RM=rm -f
  SHELL=@CONFIG_SHELL@
-Index: proftpd-1.3.5/Makefile.in
+Index: proftpd-1.3.6/Makefile.in
 ===================================================================
---- proftpd-1.3.5.orig/Makefile.in
-+++ proftpd-1.3.5/Makefile.in
+--- proftpd-1.3.6.orig/Makefile.in
++++ proftpd-1.3.6/Makefile.in
 @@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
  $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
  	@if [ ! -d $@ ]; then \
@@ -60,11 +60,11 @@ Index: proftpd-1.3.5/Makefile.in
  		           $(top_srcdir)/sample-configurations/basic.conf \
  	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
  	fi
-Index: proftpd-1.3.5/configure
+Index: proftpd-1.3.6/configure
 ===================================================================
---- proftpd-1.3.5.orig/configure
-+++ proftpd-1.3.5/configure
-@@ -38255,7 +38255,7 @@ _ACEOF
+--- proftpd-1.3.6.orig/configure
++++ proftpd-1.3.6/configure
+@@ -41777,7 +41777,7 @@ _ACEOF
  
  
  cat >>confdefs.h <<_ACEOF
@@ -72,9 +72,9 @@ Index: proftpd-1.3.5/configure
 +#define PR_RUN_DIR "`eval echo "${localstatedir}"/run/`"
  _ACEOF
  
- cat >>confdefs.h <<_ACEOF
-@@ -38263,7 +38263,7 @@ cat >>confdefs.h <<_ACEOF
- _ACEOF
+ 
+@@ -41787,7 +41787,7 @@ _ACEOF
+ 
  
  cat >>confdefs.h <<_ACEOF
 -#define PR_PID_FILE_PATH "`eval echo "${localstatedir}/proftpd.pid"`"
@@ -82,25 +82,25 @@ Index: proftpd-1.3.5/configure
  _ACEOF
  
  
-Index: proftpd-1.3.5/configure.in
+Index: proftpd-1.3.6/configure.in
 ===================================================================
---- proftpd-1.3.5.orig/configure.in
-+++ proftpd-1.3.5/configure.in
-@@ -2971,8 +2971,8 @@ locale_dir="`eval echo ${locale_dir}`"
- AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`")
+--- proftpd-1.3.6.orig/configure.in
++++ proftpd-1.3.6/configure.in
+@@ -3833,8 +3833,8 @@ locale_dir="`eval echo ${locale_dir}`"
+ AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`", [Define the locale directory])
  
- AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
--AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/proftpd.conf"`")
--AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/proftpd.pid"`")
-+AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/run/proftpd.conf"`")
-+AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/proftpd.pid"`")
+ AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`", [Define the run directory])
+-AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/proftpd.conf"`", [Define the configuration file path])
+-AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/proftpd.pid"`", [Define the PID file path])
++AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/run/proftpd.conf"`", [Define the configuration file path])
++AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/proftpd.pid"`", [Define the PID file path])
  
  prefix="$pr_saved_prefix"
  exec_prefix="$pr_saved_exec_prefix"
-Index: proftpd-1.3.5/lib/libcap/Makefile
+Index: proftpd-1.3.6/lib/libcap/Makefile
 ===================================================================
---- proftpd-1.3.5.orig/lib/libcap/Makefile
-+++ proftpd-1.3.5/lib/libcap/Makefile
+--- proftpd-1.3.6.orig/lib/libcap/Makefile
++++ proftpd-1.3.6/lib/libcap/Makefile
 @@ -26,7 +26,7 @@ OBJS=$(addsuffix .o, $(FILES))
  all: $(LIBNAME)
  
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
similarity index 94%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
index 73efac2fb..409947265 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
@@ -13,9 +13,8 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://build_fixup.patch \
            file://proftpd.service \
            "
-
-SRC_URI[md5sum] = "f7b8e3a383b34a894c2502db74ccccde"
-SRC_URI[sha256sum] = "afc1789f2478acf88dfdc7d70da90a4fa2786d628218e9574273295d044b4fc8"
+iSRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
+SRC_URI[sha256sum] = "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf"
 
 inherit autotools-brokensep useradd update-rc.d systemd
 
@@ -63,6 +62,8 @@ PACKAGECONFIG[auth] = "--enable-auth-file, --disable-auth-file"
 # proftpd uses libltdl which currently makes configuring using
 # autotools.bbclass a pain...
 do_configure () {
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
+    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     oe_runconf
     cp ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S}/libtool
 }
-- 
2.13.0


