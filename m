Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6734.1586915444268886228
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 18:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,385,1580745600"; 
   d="scan'208";a="89043915"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Apr 2020 09:50:40 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 0666749DF12A
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2020 09:40:07 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 15 Apr 2020 09:50:35 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 15 Apr 2020 09:50:43 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-networking][PATCH] proftpd: upgrade 1.3.6 -> 1.3.7rc3
Date: Wed, 15 Apr 2020 01:31:37 -0700
Message-ID: <1586939501-29659-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 0666749DF12A.A8370
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

refresh the following patches:
build_fixup.patch
contrib.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../proftpd/files/build_fixup.patch           | 75 +++++++++----------
 .../proftpd/files/contrib.patch               | 29 +++----
 .../{proftpd_1.3.6.bb => proftpd_1.3.7rc3.bb} |  4 +-
 3 files changed, 52 insertions(+), 56 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb => proftpd_1.3.7rc3.bb} (97%)

diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
index 9816d4d22..9f45a1c2f 100644
--- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
+++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
@@ -7,12 +7,17 @@ move pidfile to /var/run
 redefine PR_RUN_DIR as ${localstatedir}/run
 
 Signed-off-By: Armin Kuster <akuster808@gmail.com>
+---
+ Make.rules.in | 6 +++---
+ Makefile.in   | 6 ++----
+ configure     | 4 ++--
+ configure.in  | 4 ++--
+ 4 files changed, 9 insertions(+), 11 deletions(-)
 
-
-Index: proftpd-1.3.6/Make.rules.in
-===================================================================
---- proftpd-1.3.6.orig/Make.rules.in
-+++ proftpd-1.3.6/Make.rules.in
+diff --git a/Make.rules.in b/Make.rules.in
+index a5028ac..ccd7807 100644
+--- a/Make.rules.in
++++ b/Make.rules.in
 @@ -30,9 +30,9 @@ INSTALL=@INSTALL@
  INSTALL_STRIP=@INSTALL_STRIP@
  INSTALL_USER=@install_user@
@@ -26,10 +31,10 @@ Index: proftpd-1.3.6/Make.rules.in
  
  RM=rm -f
  SHELL=@CONFIG_SHELL@
-Index: proftpd-1.3.6/Makefile.in
-===================================================================
---- proftpd-1.3.6.orig/Makefile.in
-+++ proftpd-1.3.6/Makefile.in
+diff --git a/Makefile.in b/Makefile.in
+index abacc9f..be22353 100644
+--- a/Makefile.in
++++ b/Makefile.in
 @@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
  $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
  	@if [ ! -d $@ ]; then \
@@ -38,19 +43,19 @@ Index: proftpd-1.3.6/Makefile.in
  		chmod 0755 $@; \
  	fi
  
-@@ -115,7 +114,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
+@@ -115,7 +114,6 @@ install-proftpd: proftpd$(EXEEXT) $(DESTDIR)$(includedir) $(DESTDIR)$(localstate
  		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
  	fi
- 	ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
+ 	ln -s $(top_builddir)/proftpd $(DESTDIR)$(sbindir)/in.proftpd
 -	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.proftpd
  
  install-libs: $(DESTDIR)$(libdir)/proftpd
  	cd lib/ && $(MAKE) install
-@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
- 	$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
- 	$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
- 	$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
+@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
+ 	$(INSTALL_SBIN) $(top_builddir)/ftpshut  $(DESTDIR)$(sbindir)/ftpshut
+ 	$(INSTALL_BIN)  $(top_builddir)/ftptop   $(DESTDIR)$(bindir)/ftptop
+ 	$(INSTALL_BIN)  $(top_builddir)/ftpwho   $(DESTDIR)$(bindir)/ftpwho
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(top_builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
 +	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
  
  install-conf: $(DESTDIR)$(sysconfdir)
@@ -60,11 +65,11 @@ Index: proftpd-1.3.6/Makefile.in
  		           $(top_srcdir)/sample-configurations/basic.conf \
  	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
  	fi
-Index: proftpd-1.3.6/configure
-===================================================================
---- proftpd-1.3.6.orig/configure
-+++ proftpd-1.3.6/configure
-@@ -41777,7 +41777,7 @@ _ACEOF
+diff --git a/configure b/configure
+index 033f12f..242d18b 100755
+--- a/configure
++++ b/configure
+@@ -42308,7 +42308,7 @@ _ACEOF
  
  
  cat >>confdefs.h <<_ACEOF
@@ -73,7 +78,7 @@ Index: proftpd-1.3.6/configure
  _ACEOF
  
  
-@@ -41787,7 +41787,7 @@ _ACEOF
+@@ -42318,7 +42318,7 @@ _ACEOF
  
  
  cat >>confdefs.h <<_ACEOF
@@ -82,11 +87,11 @@ Index: proftpd-1.3.6/configure
  _ACEOF
  
  
-Index: proftpd-1.3.6/configure.in
-===================================================================
---- proftpd-1.3.6.orig/configure.in
-+++ proftpd-1.3.6/configure.in
-@@ -3833,8 +3833,8 @@ locale_dir="`eval echo ${locale_dir}`"
+diff --git a/configure.in b/configure.in
+index a4affa9..5449060 100644
+--- a/configure.in
++++ b/configure.in
+@@ -3956,8 +3956,8 @@ locale_dir="`eval echo ${locale_dir}`"
  AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`", [Define the locale directory])
  
  AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`", [Define the run directory])
@@ -97,16 +102,6 @@ Index: proftpd-1.3.6/configure.in
  
  prefix="$pr_saved_prefix"
  exec_prefix="$pr_saved_exec_prefix"
-Index: proftpd-1.3.6/lib/libcap/Makefile
-===================================================================
---- proftpd-1.3.6.orig/lib/libcap/Makefile
-+++ proftpd-1.3.6/lib/libcap/Makefile
-@@ -26,7 +26,7 @@ OBJS=$(addsuffix .o, $(FILES))
- all: $(LIBNAME)
- 
- _makenames: _makenames.c cap_names.sed
--	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
-+	$(BUILD_CC) $(CFLAGS) $(LDFLAGS) $< -o $@
- 
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-daemons/proftpd/files/contrib.patch b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
index 7e2a8e3ce..e4ff539de 100644
--- a/meta-networking/recipes-daemons/proftpd/files/contrib.patch
+++ b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
@@ -6,37 +6,38 @@ Upstream-Status: Pending
 
 Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
 ---
- Makefile.in         |    2 +-
- contrib/Makefile.in |    6 +++---
- 2 files changed, 4 insertions(+), 4 deletions(-)
+ Makefile.in         | 2 +-
+ contrib/Makefile.in | 7 ++++---
+ 2 files changed, 5 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 5b2e683..ee72fe1 100644
+index 3f325e5..abacc9f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -120,7 +120,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
+@@ -145,7 +145,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
  	test -z "$(SHARED_MODULE_OBJS)" -a -z "$(SHARED_MODULE_DIRS)" -a -z "$(STATIC_MODULE_DIRS)" || (cd modules/ && $(MAKE) install)
  
  install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
 -	cd contrib/ && $(MAKE) install-utils
 +	cd contrib/ && $(MAKE) DESTDIR=${DESTDIR} install-utils
- 	$(INSTALL_BIN)  ftpcount $(DESTDIR)$(bindir)/ftpcount
- 	$(INSTALL_BIN)  ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
- 	$(INSTALL_SBIN) ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
+ 	$(INSTALL_BIN)  $(top_builddir)/ftpcount $(DESTDIR)$(bindir)/ftpcount
+ 	$(INSTALL_BIN)  $(top_builddir)/ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
+ 	$(INSTALL_SBIN) $(top_builddir)/ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
 diff --git a/contrib/Makefile.in b/contrib/Makefile.in
-index 5bcc038..51d248c 100644
+index d1a31af..865a6ff 100644
 --- a/contrib/Makefile.in
 +++ b/contrib/Makefile.in
-@@ -18,6 +18,6 @@ Makefile: Makefile.in ../config.status
+@@ -17,6 +17,7 @@ Makefile: Makefile.in ../config.status
  	cd ../ && ./config.status
  
  install-utils:
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpasswd $(DESTDIR)$(bindir)/ftpasswd
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpquota $(DESTDIR)$(bindir)/ftpquota
 +	$(INSTALL) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
 +	$(INSTALL) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
 +	$(INSTALL) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
++
 -- 
-1.7.9.5
+2.17.1
 
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7rc3.bb
similarity index 97%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.7rc3.bb
index d5bbdd374..10a9219d1 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7rc3.bb
@@ -13,8 +13,8 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://build_fixup.patch \
            file://proftpd.service \
            "
-iSRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
-SRC_URI[sha256sum] = "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf"
+SRC_URI[md5sum] = "2492bed101f2dd798453b389370dadb1"
+SRC_URI[sha256sum] = "ae06a9da10165407cc525966cf4704b3b54295957fe42a234af52944815dc9ee"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
-- 
2.17.1



