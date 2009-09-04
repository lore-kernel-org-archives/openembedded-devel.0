Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mjcui-00014s-Lz
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 19:49:32 +0200
Received: by ewy19 with SMTP id 19so1042385ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=e+Fc5krJqScNQZt0XP3TZE/Z0zPblz+7+7sAPR0h9UI=;
	b=TfipZVoyJrnNhn4dWL3NP8PQ9U0pnCe2Q7Ydvdkbrf5ARaz9wsYXk82c8dPe1414PE
	U3/yW8QyjyfiNwkZlhYNXoza0wdSQuhdzC+1pwOOZY7bhIV2NqeC3Wgfn/DnQR8ppjY7
	SDliVpkTZ21L8O7Fd8bpwlCjS0idH6Z71qMno=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ucEpu1j2YKCEU6N54/IvnJuFOXcWw0elU8mPzYkb4RXt8ugBqo8qRYWSyafbBzyrPX
	PdCQE7U8ZOoGikNISZdrgQfqG83s0BxkVkLtxjMcqVf/09E1CDOa1O1bGW3aNUSAO0uM
	5x2gy0y/rljwhtrdVeAr8oK6reKZr8hrj1/0E=
Received: by 10.216.90.131 with SMTP id e3mr898361wef.69.1252085432504;
	Fri, 04 Sep 2009 10:30:32 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id i6sm3805380gve.22.2009.09.04.10.30.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Sep 2009 10:30:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2009 10:30:23 -0700
Message-Id: <1252085423-5450-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] libpam_1.0.2.bb: Fix compilation for uclibc systems.
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
X-List-Received-Date: Fri, 04 Sep 2009 17:49:33 -0000

* libpam is not able to figure out that
  uclibc does not support NIS. This patch
  helps in making it do so. The patch is only
  applied for uclibc OVERRIDES.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libpam-1.0.2/pam-disable-nis-on-uclibc.patch   |  251 ++++++++++++++++++++
 recipes/pam/libpam_1.0.2.bb                        |    6 +-
 2 files changed, 256 insertions(+), 1 deletions(-)
 create mode 100644 recipes/pam/libpam-1.0.2/pam-disable-nis-on-uclibc.patch

diff --git a/recipes/pam/libpam-1.0.2/pam-disable-nis-on-uclibc.patch b/recipes/pam/libpam-1.0.2/pam-disable-nis-on-uclibc.patch
new file mode 100644
index 0000000..258166c
--- /dev/null
+++ b/recipes/pam/libpam-1.0.2/pam-disable-nis-on-uclibc.patch
@@ -0,0 +1,251 @@
+Index: Linux-PAM-1.0.2/Makefile.in
+===================================================================
+--- Linux-PAM-1.0.2.orig/Makefile.in	2008-08-29 01:14:12.000000000 -0700
++++ Linux-PAM-1.0.2/Makefile.in	2009-09-04 01:06:22.571466501 -0700
+@@ -71,8 +71,7 @@
+   distclean-recursive maintainer-clean-recursive
+ ETAGS = etags
+ CTAGS = ctags
+-DIST_SUBDIRS = libpam tests libpamc libpam_misc modules po conf doc \
+-	examples xtests
++DIST_SUBDIRS = libpam libpamc libpam_misc modules po conf
+ DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
+ distdir = $(PACKAGE)-$(VERSION)
+ top_distdir = $(distdir)
+@@ -244,8 +243,8 @@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+ AUTOMAKE_OPTIONS = 1.9 gnu dist-bzip2 check-news
+-@STATIC_MODULES_FALSE@SUBDIRS = libpam tests libpamc libpam_misc modules po conf doc examples xtests
+-@STATIC_MODULES_TRUE@SUBDIRS = modules libpam libpamc libpam_misc tests po conf doc examples xtests
++@STATIC_MODULES_FALSE@SUBDIRS = libpam libpamc libpam_misc modules po conf
++@STATIC_MODULES_TRUE@SUBDIRS = modules libpam libpamc libpam_misc po conf
+ CLEANFILES = *~
+ M4_FILES = m4/codeset.m4 m4/gettext.m4 m4/glibc21.m4 m4/glibc2.m4 \
+ 	m4/iconv.m4 m4/intdiv0.m4 m4/intmax.m4 m4/inttypes_h.m4 \
+Index: Linux-PAM-1.0.2/modules/pam_access/pam_access.c
+===================================================================
+--- Linux-PAM-1.0.2.orig/modules/pam_access/pam_access.c	2007-12-07 07:40:01.000000000 -0800
++++ Linux-PAM-1.0.2/modules/pam_access/pam_access.c	2009-09-04 01:06:22.575455835 -0700
+@@ -41,7 +41,11 @@
+ #include <errno.h>
+ #include <ctype.h>
+ #include <sys/utsname.h>
++
++#ifdef NIS
+ #include <rpcsvc/ypclnt.h>
++#endif
++
+ #include <arpa/inet.h>
+ #include <netdb.h>
+ #include <sys/socket.h>
+@@ -479,8 +483,9 @@
+   char *mydomain = NULL;
+   int retval;
+ 
++#ifdef NIS
+   yp_get_default_domain(&mydomain);
+-
++#endif
+ 
+   retval = innetgr (netgroup, machine, user, mydomain);
+   if (debug == YES)
+Index: Linux-PAM-1.0.2/modules/pam_unix/Makefile.am
+===================================================================
+--- Linux-PAM-1.0.2.orig/modules/pam_unix/Makefile.am	2008-02-29 07:22:03.000000000 -0800
++++ Linux-PAM-1.0.2/modules/pam_unix/Makefile.am	2009-09-04 01:09:46.519457167 -0700
+@@ -32,7 +32,7 @@
+ 
+ securelib_LTLIBRARIES = pam_unix.la
+ 
+-noinst_HEADERS = md5.h support.h yppasswd.h bigcrypt.h passverify.h
++noinst_HEADERS = md5.h support.h bigcrypt.h passverify.h
+ 
+ sbin_PROGRAMS = unix_chkpwd unix_update
+ 
+@@ -40,7 +40,7 @@
+ 
+ pam_unix_la_SOURCES = bigcrypt.c pam_unix_acct.c \
+ 	pam_unix_auth.c pam_unix_passwd.c pam_unix_sess.c support.c \
+-	passverify.c yppasswd_xdr.c md5_good.c md5_broken.c
++	passverify.c md5_good.c md5_broken.c
+ 
+ bigcrypt_SOURCES = bigcrypt.c bigcrypt_main.c
+ bigcrypt_CFLAGS = $(AM_CFLAGS)
+Index: Linux-PAM-1.0.2/modules/pam_unix/Makefile.in
+===================================================================
+--- Linux-PAM-1.0.2.orig/modules/pam_unix/Makefile.in	2008-08-29 01:14:10.000000000 -0700
++++ Linux-PAM-1.0.2/modules/pam_unix/Makefile.in	2009-09-04 01:13:42.939510044 -0700
+@@ -74,7 +74,7 @@
+ pam_unix_la_DEPENDENCIES =
+ am_pam_unix_la_OBJECTS = bigcrypt.lo pam_unix_acct.lo pam_unix_auth.lo \
+ 	pam_unix_passwd.lo pam_unix_sess.lo support.lo passverify.lo \
+-	yppasswd_xdr.lo md5_good.lo md5_broken.lo
++	md5_good.lo md5_broken.lo
+ pam_unix_la_OBJECTS = $(am_pam_unix_la_OBJECTS)
+ pam_unix_la_LINK = $(LIBTOOL) --tag=CC $(AM_LIBTOOLFLAGS) \
+ 	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
+@@ -310,10 +310,10 @@
+ 	@LIBCRYPT@ @LIBSELINUX@
+ 
+ securelib_LTLIBRARIES = pam_unix.la
+-noinst_HEADERS = md5.h support.h yppasswd.h bigcrypt.h passverify.h
++noinst_HEADERS = md5.h support.h bigcrypt.h passverify.h
+ pam_unix_la_SOURCES = bigcrypt.c pam_unix_acct.c \
+ 	pam_unix_auth.c pam_unix_passwd.c pam_unix_sess.c support.c \
+-	passverify.c yppasswd_xdr.c md5_good.c md5_broken.c
++	passverify.c md5_good.c md5_broken.c
+ 
+ bigcrypt_SOURCES = bigcrypt.c bigcrypt_main.c
+ bigcrypt_CFLAGS = $(AM_CFLAGS)
+@@ -465,7 +465,6 @@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/unix_update-md5_good.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/unix_update-passverify.Po@am__quote@
+ @AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/unix_update-unix_update.Po@am__quote@
+-@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/yppasswd_xdr.Plo@am__quote@
+ 
+ .c.o:
+ @am__fastdepCC_TRUE@	$(COMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
+Index: Linux-PAM-1.0.2/modules/pam_unix/pam_unix_passwd.c
+===================================================================
+--- Linux-PAM-1.0.2.orig/modules/pam_unix/pam_unix_passwd.c	2008-02-29 07:22:03.000000000 -0800
++++ Linux-PAM-1.0.2/modules/pam_unix/pam_unix_passwd.c	2009-09-04 01:06:22.579455994 -0700
+@@ -55,8 +55,11 @@
+ #include <sys/time.h>
+ #include <sys/stat.h>
+ #include <rpc/rpc.h>
++
++#ifdef NIS
+ #include <rpcsvc/yp_prot.h>
+ #include <rpcsvc/ypclnt.h>
++#endif
+ 
+ #include <signal.h>
+ #include <errno.h>
+@@ -77,7 +80,10 @@
+ #include <security/pam_ext.h>
+ #include <security/pam_modutil.h>
+ 
++#ifdef NIS
+ #include "yppasswd.h"
++#endif
++
+ #include "md5.h"
+ #include "support.h"
+ #include "passverify.h"
+@@ -105,6 +111,7 @@
+ 
+ static char *getNISserver(pam_handle_t *pamh)
+ {
++#ifdef NIS
+ 	char *master;
+ 	char *domainname;
+ 	int port, err;
+@@ -131,6 +138,9 @@
+ 		return NULL;
+ 	}
+ 	return master;
++#else
++	return NULL;
++#endif
+ }
+ 
+ #ifdef WITH_SELINUX
+@@ -301,6 +311,7 @@
+ 
+ 	if (on(UNIX_NIS, ctrl) && _unix_comesfromsource(pamh, forwho, 0, 1)) {
+ 	    if ((master=getNISserver(pamh)) != NULL) {
++#ifdef NIS
+ 		struct timeval timeout;
+ 		struct yppasswd yppwd;
+ 		CLIENT *clnt;
+@@ -362,6 +373,7 @@
+ #ifdef DEBUG
+ 		sleep(5);
+ #endif
++#endif
+ 	    } else {
+ 		    retval = PAM_TRY_AGAIN;
+ 	    }
+Index: Linux-PAM-1.0.2/modules/pam_unix/support.c
+===================================================================
+--- Linux-PAM-1.0.2.orig/modules/pam_unix/support.c	2008-01-23 07:35:13.000000000 -0800
++++ Linux-PAM-1.0.2/modules/pam_unix/support.c	2009-09-04 01:06:22.579455994 -0700
+@@ -19,7 +19,10 @@
+ #include <ctype.h>
+ #include <syslog.h>
+ #include <sys/resource.h>
++
++#ifdef NIS
+ #include <rpcsvc/ypclnt.h>
++#endif
+ 
+ #include <security/_pam_macros.h>
+ #include <security/pam_modules.h>
+@@ -266,6 +269,7 @@
+ 	if (!matched && nis) {
+ 		char *userinfo = NULL, *domain = NULL;
+ 		int len = 0, i;
++#ifdef NIS
+ 		len = yp_get_default_domain(&domain);
+ 		if (len == YPERR_SUCCESS) {
+ 			len = yp_bind(domain);
+@@ -280,6 +284,7 @@
+ 				matched = 1;
+ 			}
+ 		}
++#endif
+ 	}
+ 
+ 	if (matched && (ret != NULL)) {
+Index: Linux-PAM-1.0.2/modules/pam_unix/yppasswd.h
+===================================================================
+--- Linux-PAM-1.0.2.orig/modules/pam_unix/yppasswd.h	2000-06-20 15:12:08.000000000 -0700
++++ Linux-PAM-1.0.2/modules/pam_unix/yppasswd.h	2009-09-04 01:06:22.579455994 -0700
+@@ -13,6 +13,8 @@
+ #ifndef _YPPASSWD_H_
+ #define _YPPASSWD_H_
+ 
++#ifdef NIS
++
+ #define YPPASSWDPROG ((u_long)100009)
+ #define YPPASSWDVERS ((u_long)1)
+ #define YPPASSWDPROC_UPDATE ((u_long)1)
+@@ -48,4 +50,6 @@
+ bool_t xdr_xpasswd(XDR * xdrs, xpasswd * objp);
+ bool_t xdr_yppasswd(XDR * xdrs, yppasswd * objp);
+ 
++#endif
++
+ #endif	/* _YPPASSWD_H_ */
+Index: Linux-PAM-1.0.2/modules/pam_unix/yppasswd_xdr.c
+===================================================================
+--- Linux-PAM-1.0.2.orig/modules/pam_unix/yppasswd_xdr.c	2005-07-20 02:46:19.000000000 -0700
++++ Linux-PAM-1.0.2/modules/pam_unix/yppasswd_xdr.c	2009-09-04 01:06:22.579455994 -0700
+@@ -10,6 +10,8 @@
+  * editied manually.
+  */
+ 
++#ifdef NIS
++
+ #include "config.h"
+ 
+ #include <rpc/rpc.h>
+@@ -36,3 +38,5 @@
+ 	return xdr_string(xdrs, &objp->oldpass, ~0)
+ 	    && xdr_xpasswd(xdrs, &objp->newpw);
+ }
++
++#endif
+Index: Linux-PAM-1.0.2/po/POTFILES.in
+===================================================================
+--- Linux-PAM-1.0.2.orig/po/POTFILES.in	2008-02-13 06:39:41.000000000 -0800
++++ Linux-PAM-1.0.2/po/POTFILES.in	2009-09-04 01:06:22.579455994 -0700
+@@ -85,7 +85,6 @@
+ ./modules/pam_unix/passverify.c
+ ./modules/pam_unix/support.c
+ ./modules/pam_unix/unix_chkpwd.c
+-./modules/pam_unix/yppasswd_xdr.c
+ ./modules/pam_userdb/pam_userdb.c
+ ./modules/pam_warn/pam_warn.c
+ ./modules/pam_wheel/pam_wheel.c
diff --git a/recipes/pam/libpam_1.0.2.bb b/recipes/pam/libpam_1.0.2.bb
index 2acbe0a..17d8f30 100644
--- a/recipes/pam/libpam_1.0.2.bb
+++ b/recipes/pam/libpam_1.0.2.bb
@@ -12,7 +12,7 @@ LICENSE = "GPLv2"
 
 DEPENDS = "flex flex-native"
 
-PR = "r2"
+PR = "r3"
 
 # The project is actually called Linux-PAM but that gives
 # a bad OE package name because of the upper case characters
@@ -23,6 +23,10 @@ S = "${WORKDIR}/${p}"
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/libs/pam/library/${p}.tar.bz2 \
            file://pam-nodocs.patch;patch=1 "
 
+SRC_URI_append_linux-uclibc = "file://pam-disable-nis-on-uclibc.patch;patch=1"
+SRC_URI_append_linux-uclibceabi = "file://pam-disable-nis-on-uclibc.patch;patch=1"
+SRC_URI_append_linux-uclibcspe = "file://pam-disable-nis-on-uclibc.patch;patch=1"
+
 inherit autotools
 
 LEAD_SONAME = "libpam.so.*"
-- 
1.6.3.3



