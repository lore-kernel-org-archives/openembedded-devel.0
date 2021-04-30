Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web09.10781.1619785447409001285
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Apr 2021 05:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.kozemcak@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 13UCO5vr018273
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Apr 2021 14:24:05 +0200
Received: from dev.vm7.ccp.siemens.com ([144.145.220.53])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 13UCO4Aj032194;
	Fri, 30 Apr 2021 14:24:05 +0200
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 87AC13061953;
	Fri, 30 Apr 2021 14:24:04 +0200 (CEST)
From: "Andrej Kozemcak" <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH v3] proftpd: Update to 1.3.7a release
Date: Fri, 30 Apr 2021 14:23:14 +0200
Message-Id: <20210430122314.691-1-andrej.kozemcak@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../proftpd/files/build_fixup.patch           | 69 ++++++++-----------
 .../proftpd/files/contrib.patch               | 29 ++++----
 .../{proftpd_1.3.6.bb => proftpd_1.3.7a.bb}   | 13 ++--
 3 files changed, 49 insertions(+), 62 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb => proftpd_1.3.7a.bb} (95%)

diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
index 9816d4d22..d888dd826 100644
--- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
+++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
@@ -9,10 +9,10 @@ redefine PR_RUN_DIR as ${localstatedir}/run
 Signed-off-By: Armin Kuster <akuster808@gmail.com>
 
 
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
@@ -26,11 +26,11 @@ Index: proftpd-1.3.6/Make.rules.in
  
  RM=rm -f
  SHELL=@CONFIG_SHELL@
-Index: proftpd-1.3.6/Makefile.in
-===================================================================
---- proftpd-1.3.6.orig/Makefile.in
-+++ proftpd-1.3.6/Makefile.in
-@@ -105,7 +105,6 @@ check: proftpd$(EXEEXT)
+diff --git a/Makefile.in b/Makefile.in
+index 9434cbd..13f2e16 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -123,7 +123,6 @@ check: proftpd$(EXEEXT)
  $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
  	@if [ ! -d $@ ]; then \
  		mkdir -p $@; \
@@ -38,20 +38,20 @@ Index: proftpd-1.3.6/Makefile.in
  		chmod 0755 $@; \
  	fi
  
-@@ -115,7 +114,6 @@ install-proftpd: proftpd $(DESTDIR)$(inc
+@@ -133,7 +132,6 @@ install-proftpd: proftpd$(EXEEXT) $(DESTDIR)$(includedir) $(DESTDIR)$(localstate
  		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
  	fi
- 	ln -s proftpd $(DESTDIR)$(sbindir)/in.proftpd
+	ln -s $(top_builddir)/proftpd $(DESTDIR)$(sbindir)/in.proftpd
 -	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.proftpd
  
  install-libs: $(DESTDIR)$(libdir)/proftpd
  	cd lib/ && $(MAKE) install
-@@ -152,11 +150,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DE
- 	$(INSTALL_SBIN) ftpshut  $(DESTDIR)$(sbindir)/ftpshut
- 	$(INSTALL_BIN)  ftptop   $(DESTDIR)$(bindir)/ftptop
- 	$(INSTALL_BIN)  ftpwho   $(DESTDIR)$(bindir)/ftpwho
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
-+	$(INSTALL) -m 0755 src/prxs $(DESTDIR)$(bindir)/prxs
+@@ -170,11 +168,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
+	$(INSTALL_SBIN) $(top_builddir)/ftpshut  $(DESTDIR)$(sbindir)/ftpshut
+	$(INSTALL_BIN)  $(top_builddir)/ftptop   $(DESTDIR)$(bindir)/ftptop
+	$(INSTALL_BIN)  $(top_builddir)/ftpwho   $(DESTDIR)$(bindir)/ftpwho
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(top_builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
++	$(INSTALL) -m 0755 $(top_builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
  
  install-conf: $(DESTDIR)$(sysconfdir)
  	if [ ! -f $(DESTDIR)$(sysconfdir)/proftpd.conf ] ; then \
@@ -60,11 +60,11 @@ Index: proftpd-1.3.6/Makefile.in
  		           $(top_srcdir)/sample-configurations/basic.conf \
  	       	           $(DESTDIR)$(sysconfdir)/proftpd.conf ; \
  	fi
-Index: proftpd-1.3.6/configure
-===================================================================
---- proftpd-1.3.6.orig/configure
-+++ proftpd-1.3.6/configure
-@@ -41777,7 +41777,7 @@ _ACEOF
+diff --git a/configure b/configure
+index 0a51670..69fa130 100755
+--- a/configure
++++ b/configure
+@@ -25116,7 +25116,7 @@ _ACEOF
  
  
  cat >>confdefs.h <<_ACEOF
@@ -73,7 +73,7 @@ Index: proftpd-1.3.6/configure
  _ACEOF
  
  
-@@ -41787,7 +41787,7 @@ _ACEOF
+@@ -25126,7 +25126,7 @@ _ACEOF
  
  
  cat >>confdefs.h <<_ACEOF
@@ -82,11 +82,11 @@ Index: proftpd-1.3.6/configure
  _ACEOF
  
  
-Index: proftpd-1.3.6/configure.in
-===================================================================
---- proftpd-1.3.6.orig/configure.in
-+++ proftpd-1.3.6/configure.in
-@@ -3833,8 +3833,8 @@ locale_dir="`eval echo ${locale_dir}`"
+diff --git a/configure.in b/configure.in
+index 50561de..93cad3f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -4059,8 +4059,8 @@ locale_dir="`eval echo ${locale_dir}`"
  AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`", [Define the locale directory])
  
  AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`", [Define the run directory])
@@ -97,16 +97,3 @@ Index: proftpd-1.3.6/configure.in
  
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
diff --git a/meta-networking/recipes-daemons/proftpd/files/contrib.patch b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
index 7e2a8e3ce..96c237d38 100644
--- a/meta-networking/recipes-daemons/proftpd/files/contrib.patch
+++ b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
@@ -11,32 +11,29 @@ Signed-off-by: Kevin Strasser <kevin.strasser@linux.intel.com>
  2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 5b2e683..ee72fe1 100644
+index 9434cbd..8da7d1f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -120,7 +120,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
+@@ -163,7 +163,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
  	test -z "$(SHARED_MODULE_OBJS)" -a -z "$(SHARED_MODULE_DIRS)" -a -z "$(STATIC_MODULE_DIRS)" || (cd modules/ && $(MAKE) install)
  
  install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
 -	cd contrib/ && $(MAKE) install-utils
 +	cd contrib/ && $(MAKE) DESTDIR=${DESTDIR} install-utils
- 	$(INSTALL_BIN)  ftpcount $(DESTDIR)$(bindir)/ftpcount
- 	$(INSTALL_BIN)  ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
- 	$(INSTALL_SBIN) ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
+	$(INSTALL_BIN)  $(top_builddir)/ftpcount $(DESTDIR)$(bindir)/ftpcount
+	$(INSTALL_BIN)  $(top_builddir)/ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
+	$(INSTALL_SBIN) $(top_builddir)/ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
 diff --git a/contrib/Makefile.in b/contrib/Makefile.in
-index 5bcc038..51d248c 100644
+index d1a31af..65d2abc 100644
 --- a/contrib/Makefile.in
 +++ b/contrib/Makefile.in
-@@ -18,6 +18,6 @@ Makefile: Makefile.in ../config.status
+@@ -17,6 +17,6 @@ Makefile: Makefile.in ../config.status
  	cd ../ && ./config.status
  
  install-utils:
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
--	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
-+	$(INSTALL) -m 0755 ftpasswd $(DESTDIR)$(bindir)/ftpasswd
-+	$(INSTALL) -m 0755 ftpmail $(DESTDIR)$(bindir)/ftpmail
-+	$(INSTALL) -m 0755 ftpquota $(DESTDIR)$(bindir)/ftpquota
--- 
-1.7.9.5
-
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpasswd $(DESTDIR)$(bindir)/ftpasswd
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
+-	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(srcdir)/ftpquota $(DESTDIR)$(bindir)/ftpquota
++	$(INSTALL) -m 0755 $(srcdir)/ftpasswd $(DESTDIR)$(bindir)/ftpasswd
++	$(INSTALL) -m 0755 $(srcdir)/ftpmail $(DESTDIR)$(bindir)/ftpmail
++	$(INSTALL) -m 0755 $(srcdir)/ftpquota $(DESTDIR)$(bindir)/ftpquota
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
similarity index 95%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
index 1e4697a63..7d4013d2c 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7a.bb
@@ -4,7 +4,10 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
+SRCREV = "715eadc1aa4f6b07d69f9d09558e9cb471e51d87"
+BRANCH = "1.3.7"
+
+SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH} \
            file://basic.conf.patch \
            file://proftpd-basic.init \
            file://default \
@@ -13,13 +16,14 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://build_fixup.patch \
            file://proftpd.service \
            "
-SRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
-SRC_URI[sha256sum] = "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf"
+
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
 PACKAGECONFIG ??= "shadow \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
+                   static \
                   "
 
 PACKAGECONFIG[curses] = "--enable-curses --enable-ncurses, --disable-curses --disable-ncurses, ncurses"
@@ -28,6 +32,7 @@ PACKAGECONFIG[pam] = "--enable-auth-pam, --disable-auth-pam, libpam, libpam"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6"
 PACKAGECONFIG[shadow] = "--enable-shadow, --disable-shadow"
 PACKAGECONFIG[pcre] = "--enable-pcre, --disable-pcre, libpcre "
+PACKAGECONFIG[static] = "--enable-static=yes, --enable-static=no"
 
 # enable POSIX.1e capabilities
 PACKAGECONFIG[cap] = "--enable-cap, --disable-cap, libcap, libcap"
@@ -58,14 +63,12 @@ PACKAGECONFIG[largefile] = "--enable-largefile, --disable-largefile"
 #omit mod_auth_file from core modules
 PACKAGECONFIG[auth] = "--enable-auth-file, --disable-auth-file"
 
-
 # proftpd uses libltdl which currently makes configuring using
 # autotools.bbclass a pain...
 do_configure () {
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}
     install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}
     oe_runconf
-    cp ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S}/libtool
 }
 
 FTPUSER = "ftp"
-- 
2.20.1

