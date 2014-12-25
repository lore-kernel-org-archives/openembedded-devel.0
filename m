Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD1172671
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Dec 2014 22:29:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 25 Dec 2014 14:29:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="504114334"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.219])
	by orsmga003.jf.intel.com with ESMTP; 25 Dec 2014 14:24:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Dec 2014 22:29:03 +0000
Message-Id: <2a581eb64141e55750a0569e15d1203c597b7dea.1419546494.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419546494.git.paul.eggleton@linux.intel.com>
References: <cover.1419546494.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419546494.git.paul.eggleton@linux.intel.com>
References: <cover.1419546494.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 1/1] ntp: upgrade to 4.2.8
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
X-List-Received-Date: Thu, 25 Dec 2014 22:29:10 -0000

* Upgrade to 4.2.8 which fixes several security issues, including
  CVE-2014-9293, CVE-2014-9294, CVE-2014-9295, and CVE-2014-9296. For
  more details please see:
  https://ics-cert.us-cert.gov/advisories/ICSA-14-353-01A
* LIC_FILES_CHKSUM changed due to a number of copyright year and patch
  list changes; nothing material about the license text changed.
* This version moves a number of binaries from sbindir to bindir;
  there's supposed to be a configure option --with-locfile=legacy to use
  the old layout but it does not seem to work. I guess we'll just have
  to live with the change.
* Drop patches which are no longer applicable.
* Merge inc file into recipe; there were too many changes required to
  the inc file in this version and it's unlikely it was much use split
  out in any case.
* Move remaining files in files/ to ntp/

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/ntp/files/CVE-2013-5211.patch  | 112 --------------
 .../recipes-support/ntp/files/openssl-check.patch  |  59 --------
 .../recipes-support/ntp/files/tickadj.c.patch      |  32 ----
 .../ntp/{files => ntp}/ntp-4.2.4_p6-nano.patch     |   0
 .../ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch  | 168 +++++++++++++++++++++
 .../recipes-support/ntp/{files => ntp}/ntp.conf    |   0
 .../recipes-support/ntp/{files => ntp}/ntpd        |   0
 .../recipes-support/ntp/{files => ntp}/ntpdate     |   0
 .../ntp/{files => ntp}/ntpdate.default             |   0
 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb |   6 -
 .../recipes-support/ntp/{ntp.inc => ntp_4.2.8.bb}  |  41 ++---
 11 files changed, 191 insertions(+), 227 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch
 delete mode 100644 meta-networking/recipes-support/ntp/files/openssl-check.patch
 delete mode 100644 meta-networking/recipes-support/ntp/files/tickadj.c.patch
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntp-4.2.4_p6-nano.patch (100%)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntp.conf (100%)
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntpd (100%)
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntpdate (100%)
 rename meta-networking/recipes-support/ntp/{files => ntp}/ntpdate.default (100%)
 delete mode 100644 meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
 rename meta-networking/recipes-support/ntp/{ntp.inc => ntp_4.2.8.bb} (81%)

diff --git a/meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch b/meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch
deleted file mode 100644
index ddcb044..0000000
--- a/meta-networking/recipes-support/ntp/files/CVE-2013-5211.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-ntp: fix CVE-2013-5211
-
-Upstream-status: Backport
-
-The monlist feature in ntp_request.c in ntpd in NTP before
-4.2.7p26 allows remote attackers to cause a denial of service
-(traffic amplification) via forged (1) REQ_MON_GETLIST or
-(2) REQ_MON_GETLIST_1 requests, as exploited in the wild
-in December 2013.
-
-Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
-
---- a/ntpd/ntp_request.c
-+++ b/ntpd/ntp_request.c
-@@ -1912,44 +1912,11 @@ mon_getlist_0(
- 	struct req_pkt *inpkt
- 	)
- {
--	register struct info_monitor *im;
--	register struct mon_data *md;
--	extern struct mon_data mon_mru_list;
--	extern int mon_enabled;
--
- #ifdef DEBUG
- 	if (debug > 2)
- 	    printf("wants monitor 0 list\n");
- #endif
--	if (!mon_enabled) {
--		req_ack(srcadr, inter, inpkt, INFO_ERR_NODATA);
--		return;
--	}
--	im = (struct info_monitor *)prepare_pkt(srcadr, inter, inpkt,
--	    v6sizeof(struct info_monitor));
--	for (md = mon_mru_list.mru_next; md != &mon_mru_list && im != 0;
--	     md = md->mru_next) {
--		im->lasttime = htonl((u_int32)((current_time -
--		    md->firsttime) / md->count));
--		im->firsttime = htonl((u_int32)(current_time - md->lasttime));
--		im->restr = htonl((u_int32)md->flags);
--		im->count = htonl((u_int32)(md->count));
--		if (IS_IPV6(&md->rmtadr)) {
--			if (!client_v6_capable)
--				continue;
--			im->addr6 = SOCK_ADDR6(&md->rmtadr);
--			im->v6_flag = 1;
--		} else {
--			im->addr = NSRCADR(&md->rmtadr);
--			if (client_v6_capable)
--				im->v6_flag = 0;
--		}
--		im->port = md->rmtport;
--		im->mode = md->mode;
--		im->version = md->version;
--		im = (struct info_monitor *)more_pkt();
--	}
--	flush_pkt();
-+	req_ack(srcadr, inter, inpkt, INFO_ERR_NODATA);
- }
- 
- /*
-@@ -1962,50 +1929,7 @@ mon_getlist_1(
- 	struct req_pkt *inpkt
- 	)
- {
--	register struct info_monitor_1 *im;
--	register struct mon_data *md;
--	extern struct mon_data mon_mru_list;
--	extern int mon_enabled;
--
--	if (!mon_enabled) {
--		req_ack(srcadr, inter, inpkt, INFO_ERR_NODATA);
--		return;
--	}
--	im = (struct info_monitor_1 *)prepare_pkt(srcadr, inter, inpkt,
--	    v6sizeof(struct info_monitor_1));
--	for (md = mon_mru_list.mru_next; md != &mon_mru_list && im != 0;
--	     md = md->mru_next) {
--		im->lasttime = htonl((u_int32)((current_time -
--		    md->firsttime) / md->count));
--		im->firsttime = htonl((u_int32)(current_time - md->lasttime));
--		im->restr = htonl((u_int32)md->flags);
--		im->count = htonl((u_int32)md->count);
--		if (IS_IPV6(&md->rmtadr)) {
--			if (!client_v6_capable)
--				continue;
--			im->addr6 = SOCK_ADDR6(&md->rmtadr);
--			im->v6_flag = 1;
--			im->daddr6 = SOCK_ADDR6(&md->interface->sin);
--		} else {
--			im->addr = NSRCADR(&md->rmtadr);
--			if (client_v6_capable)
--				im->v6_flag = 0;
--			if (MDF_BCAST == md->cast_flags)
--				im->daddr = NSRCADR(&md->interface->bcast);
--			else if (md->cast_flags) {
--				im->daddr = NSRCADR(&md->interface->sin);
--				if (!im->daddr)
--					im->daddr = NSRCADR(&md->interface->bcast);
--			} else
--				im->daddr = 4;
--		}
--		im->flags = htonl(md->cast_flags);
--		im->port = md->rmtport;
--		im->mode = md->mode;
--		im->version = md->version;
--		im = (struct info_monitor_1 *)more_pkt();
--	}
--	flush_pkt();
-+	req_ack(srcadr, inter, inpkt, INFO_ERR_NODATA);
- }
- 
- /*
diff --git a/meta-networking/recipes-support/ntp/files/openssl-check.patch b/meta-networking/recipes-support/ntp/files/openssl-check.patch
deleted file mode 100644
index 8b4a673..0000000
--- a/meta-networking/recipes-support/ntp/files/openssl-check.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Hack OpenSSL check to work when libssl and libcrypto aren't in same dir
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
----
- configure         |    4 ++--
- m4/ntp_openssl.m4 |    4 ++--
- sntp/configure    |    4 ++--
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
-index aae2c01..6a3c15e 100755
---- a/configure
-+++ b/configure
-@@ -22868,8 +22868,8 @@ case "$ans" in
- 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
- 	    ;;
- 	 *)
--	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
--	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
-+	    test -f $i/libssl.so && break
-+	    test -f $i/libssl.a && break
- 	    ;;
- 	esac
-     done
-diff --git a/m4/ntp_openssl.m4 b/m4/ntp_openssl.m4
-index 7d9f477..67bdd55 100644
---- a/m4/ntp_openssl.m4
-+++ b/m4/ntp_openssl.m4
-@@ -41,8 +41,8 @@ case "$ans" in
- 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
- 	    ;;
- 	 *)
--	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
--	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
-+	    test -f $i/libssl.so && break
-+	    test -f $i/libssl.a && break
- 	    ;;
- 	esac
-     done
-diff --git a/sntp/configure b/sntp/configure
-index 7782c29..55e82d9 100755
---- a/sntp/configure
-+++ b/sntp/configure
-@@ -14810,8 +14810,8 @@ case "$ans" in
- 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
- 	    ;;
- 	 *)
--	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
--	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
-+	    test -f $i/libssl.so && break
-+	    test -f $i/libssl.a && break
- 	    ;;
- 	esac
-     done
--- 
-1.7.1
-
diff --git a/meta-networking/recipes-support/ntp/files/tickadj.c.patch b/meta-networking/recipes-support/ntp/files/tickadj.c.patch
deleted file mode 100644
index 9ef9de9..0000000
--- a/meta-networking/recipes-support/ntp/files/tickadj.c.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Index: ntp-4.2.2p3-r0/ntp-4.2.2p3/util/tickadj.c
-===================================================================
---- ntp-4.2.2p3/util/tickadj.c	2004-02-25 06:58:33.000000000 +0100
-+++ ntp-4.2.2p3/util/tickadj.c	2007-07-07 01:00:54.000000000 +0200
-@@ -21,7 +21,8 @@
- # include <unistd.h>
- #endif /* HAVE_UNISTD_H */
- 
--#ifdef HAVE___ADJTIMEX		/* Linux */
-+/* proper handling here has been moved to upstream ntp bugzilla */
-+#ifdef linux
- 
- #include <sys/timex.h>
- struct timex txc;
-@@ -91,7 +92,7 @@
- 	}
- 
- 	if (!errflg) {
--		if (__adjtimex(&txc) < 0)
-+		if (adjtimex(&txc) < 0)
- 			perror("adjtimex");
- 		else if (!quiet)
- 			printf("tick     = %ld\ntick_adj = %d\n",
-@@ -146,7 +147,7 @@
- #endif
- 	}
-     
--	if (__adjtimex(&txc) < 0)
-+	if (adjtimex(&txc) < 0)
- 	{
- 		perror("adjtimex");
- 	}
diff --git a/meta-networking/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
similarity index 100%
rename from meta-networking/recipes-support/ntp/files/ntp-4.2.4_p6-nano.patch
rename to meta-networking/recipes-support/ntp/ntp/ntp-4.2.4_p6-nano.patch
diff --git a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch
new file mode 100644
index 0000000..9b9af63
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch
@@ -0,0 +1,168 @@
+Fix ntp-keygen build without OpenSSL
+
+Patch borrowed from Gentoo, originally from upstream
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Upstream-Status: Backport
+
+Upstream commit:
+http://bk1.ntp.org/ntp-stable/?PAGE=patch&REV=5497b345z5MNTuNvJWuqPSje25NQTg
+Gentoo bugzilla: https://bugs.gentoo.org/show_bug.cgi?id=533238
+
+Signed-off-by: Markos Chandras <hwoarang@gentoo.org>
+Index: ntp-4.2.8/Makefile.am
+===================================================================
+--- ntp-4.2.8.orig/Makefile.am
++++ ntp-4.2.8/Makefile.am
+@@ -2,7 +2,10 @@ ACLOCAL_AMFLAGS = -I sntp/m4 -I sntp/lib
+ 
+ NULL =
+ 
++# moved sntp first to get libtool and libevent built.
++
+ SUBDIRS =		\
++	sntp		\
+ 	scripts		\
+ 	include		\
+ 	libntp		\
+@@ -17,7 +20,6 @@ SUBDIRS =		\
+ 	clockstuff	\
+ 	kernel		\
+ 	util		\
+-	sntp		\
+ 	tests		\
+ 	$(NULL)
+ 
+@@ -64,7 +66,6 @@ BUILT_SOURCES =				\
+ 	.gcc-warning			\
+ 	'libtool				\
+ 	html/.datecheck			\
+-	sntp/built-sources-only		\
+ 	$(srcdir)/COPYRIGHT		\
+ 	$(srcdir)/.checkChangeLog	\
+ 	$(NULL)
+Index: ntp-4.2.8/configure.ac
+===================================================================
+--- ntp-4.2.8.orig/configure.ac
++++ ntp-4.2.8/configure.ac
+@@ -102,7 +102,7 @@ esac
+ enable_nls=no
+ LIBOPTS_CHECK_NOBUILD([sntp/libopts])
+ 
+-NTP_ENABLE_LOCAL_LIBEVENT
++NTP_LIBEVENT_CHECK_NOBUILD([2], [sntp/libevent])
+ 
+ NTP_LIBNTP
+ 
+@@ -771,6 +771,10 @@ esac
+ 
+ #### 
+ 
++AC_CHECK_FUNCS([arc4random_buf])
++
++#### 
++
+ saved_LIBS="$LIBS"
+ LIBS="$LIBS $LDADD_LIBNTP"
+ AC_CHECK_FUNCS([daemon])
+Index: ntp-4.2.8/libntp/ntp_crypto_rnd.c
+===================================================================
+--- ntp-4.2.8.orig/libntp/ntp_crypto_rnd.c
++++ ntp-4.2.8/libntp/ntp_crypto_rnd.c
+@@ -24,6 +24,21 @@
+ int crypto_rand_init = 0;
+ #endif
+ 
++#ifndef HAVE_ARC4RANDOM_BUF
++static void
++arc4random_buf(void *buf, size_t nbytes);
++
++void
++evutil_secure_rng_get_bytes(void *buf, size_t nbytes);
++
++static void
++arc4random_buf(void *buf, size_t nbytes)
++{
++	evutil_secure_rng_get_bytes(buf, nbytes);
++	return;
++}
++#endif
++
+ /*
+  * As of late 2014, here's how we plan to provide cryptographic-quality
+  * random numbers:
+Index: ntp-4.2.8/sntp/configure.ac
+===================================================================
+--- ntp-4.2.8.orig/sntp/configure.ac
++++ ntp-4.2.8/sntp/configure.ac
+@@ -97,11 +97,14 @@ esac
+ enable_nls=no
+ LIBOPTS_CHECK
+ 
+-AM_COND_IF(
+-    [BUILD_SNTP],
+-    [NTP_LIBEVENT_CHECK],
+-    [NTP_LIBEVENT_CHECK_NOBUILD]
+-)
++# From when we only used libevent for sntp:
++#AM_COND_IF(
++#    [BUILD_SNTP],
++#    [NTP_LIBEVENT_CHECK],
++#    [NTP_LIBEVENT_CHECK_NOBUILD]
++#)
++
++NTP_LIBEVENT_CHECK([2])
+ 
+ # Checks for libraries.
+ 
+Index: ntp-4.2.8/sntp/m4/ntp_libevent.m4
+===================================================================
+--- ntp-4.2.8.orig/sntp/m4/ntp_libevent.m4
++++ ntp-4.2.8/sntp/m4/ntp_libevent.m4
+@@ -1,4 +1,25 @@
+-dnl NTP_ENABLE_LOCAL_LIBEVENT				     -*- Autoconf -*-
++# SYNOPSIS						-*- Autoconf -*-
++#
++#  NTP_ENABLE_LOCAL_LIBEVENT
++#  NTP_LIBEVENT_CHECK([MINVERSION [, DIR]])
++#  NTP_LIBEVENT_CHECK_NOBUILD([MINVERSION [, DIR]])
++#
++# DESCRIPTION
++#
++# AUTHOR
++#
++#  Harlan Stenn
++#
++# LICENSE
++#
++#  This file is Copyright (c) 2014 Network Time Foundation
++# 
++#  Copying and distribution of this file, with or without modification, are
++#  permitted in any medium without royalty provided the copyright notice,
++#  author attribution and this notice are preserved.  This file is offered
++#  as-is, without any warranty.
++
++dnl NTP_ENABLE_LOCAL_LIBEVENT
+ dnl
+ dnl Provide only the --enable-local-libevent command-line option.
+ dnl
+@@ -29,7 +50,7 @@ dnl If NOBUILD is provided as the 3rd ar
+ dnl but DO NOT invoke DIR/configure if we are going to use our bundled
+ dnl version.  This may be the case for nested packages.
+ dnl
+-dnl provide --enable-local-libevent .
++dnl provides --enable-local-libevent .
+ dnl
+ dnl Examples:
+ dnl
+Index: ntp-4.2.8/util/Makefile.am
+===================================================================
+--- ntp-4.2.8.orig/util/Makefile.am
++++ ntp-4.2.8/util/Makefile.am
+@@ -19,6 +19,7 @@ AM_LDFLAGS = $(LDFLAGS_NTP)
+ LDADD=		../libntp/libntp.a $(LDADD_LIBNTP) $(LIBM) $(PTHREAD_LIBS)
+ tg2_LDADD=	../libntp/libntp.a $(LDADD_LIBNTP) $(LIBM)
+ ntp_keygen_LDADD  = version.o $(LIBOPTS_LDADD) ../libntp/libntp.a
++ntp_keygen_LDADD += $(LDADD_LIBEVENT)
+ ntp_keygen_LDADD += $(LDADD_LIBNTP) $(PTHREAD_LIBS) $(LDADD_NTP) $(LIBM)
+ ntp_keygen_SOURCES = ntp-keygen.c ntp-keygen-opts.c ntp-keygen-opts.h
+ 
diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-networking/recipes-support/ntp/ntp/ntp.conf
similarity index 100%
rename from meta-networking/recipes-support/ntp/files/ntp.conf
rename to meta-networking/recipes-support/ntp/ntp/ntp.conf
diff --git a/meta-networking/recipes-support/ntp/files/ntpd b/meta-networking/recipes-support/ntp/ntp/ntpd
similarity index 100%
rename from meta-networking/recipes-support/ntp/files/ntpd
rename to meta-networking/recipes-support/ntp/ntp/ntpd
diff --git a/meta-networking/recipes-support/ntp/files/ntpdate b/meta-networking/recipes-support/ntp/ntp/ntpdate
similarity index 100%
rename from meta-networking/recipes-support/ntp/files/ntpdate
rename to meta-networking/recipes-support/ntp/ntp/ntpdate
diff --git a/meta-networking/recipes-support/ntp/files/ntpdate.default b/meta-networking/recipes-support/ntp/ntp/ntpdate.default
similarity index 100%
rename from meta-networking/recipes-support/ntp/files/ntpdate.default
rename to meta-networking/recipes-support/ntp/ntp/ntpdate.default
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
deleted file mode 100644
index 588a1b0..0000000
--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ntp.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "00df80a84ec9528fcfb09498075525bc"
-SRC_URI[sha256sum] = "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23ea25ac1405432f91c"
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
similarity index 81%
rename from meta-networking/recipes-support/ntp/ntp.inc
rename to meta-networking/recipes-support/ntp/ntp_4.2.8.bb
index 142f904..7e1b1c1 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
@@ -6,16 +6,12 @@ or satellite receiver or modem."
 HOMEPAGE = "http://support.ntp.org"
 SECTION = "console/network"
 LICENSE = "NTP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ebe123f74017224947c78d472407c10f"
 
-DEPENDS = "pps-tools"
-
-INC_PR = "r6"
+DEPENDS = "pps-tools libevent"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
-           file://tickadj.c.patch \
            file://ntp-4.2.4_p6-nano.patch \
-           file://openssl-check.patch \
            file://ntpd \
            file://ntp.conf \
            file://ntpdate \
@@ -25,14 +21,21 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://sntp.service \
            file://sntp \
            file://ntpd.list \
-           file://CVE-2013-5211.patch \
+           file://ntp-4.2.8-ntp-keygen-no-openssl.patch \
 "
 
-inherit autotools update-rc.d useradd systemd
+SRC_URI[md5sum] = "6972a626be6150db8cfbd0b63d8719e7"
+SRC_URI[sha256sum] = "2e920df8b6a5a410567a73767fa458c00c7f0acec3213e69ed0134414a50d8ee"
+
+inherit autotools update-rc.d useradd systemd pkgconfig
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
 # readline or curses
-EXTRA_OECONF += "--with-net-snmp-config=no --without-ntpsnmpd ac_cv_header_readline_history_h=no --with-binsubdir=sbin"
+EXTRA_OECONF += "--with-net-snmp-config=no \
+                 --without-ntpsnmpd \
+                 ac_cv_header_readline_history_h=no \
+                 --with-yielding_select=yes \
+                 "
 CFLAGS_append = " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
 
 USERADD_PACKAGES = "${PN}"
@@ -68,10 +71,10 @@ do_install_append() {
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd ${D}${bindir}/ntpdate-sync
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${bindir}/ntpdate-sync
-    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntptrace
-    sed -i '/use/i use warnings;' ${D}${sbindir}/ntptrace
-    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${sbindir}/ntp-wait
-    sed -i '/use/i use warnings;' ${D}${sbindir}/ntp-wait
+    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${bindir}/ntptrace
+    sed -i '/use/i use warnings;' ${D}${bindir}/ntptrace
+    sed -i '1s,#!.*perl -w,#! ${bindir}/env perl,' ${D}${bindir}/ntp-wait
+    sed -i '/use/i use warnings;' ${D}${bindir}/ntp-wait
 
     install -d ${D}/${sysconfdir}/default
     install -m 644 ${WORKDIR}/ntpdate.default ${D}${sysconfdir}/default/ntpdate
@@ -87,6 +90,8 @@ do_install_append() {
 
     install -d ${D}${systemd_unitdir}/ntp-units.d
     install -m 0644 ${WORKDIR}/ntpd.list ${D}${systemd_unitdir}/ntp-units.d/60-ntpd.list
+
+    rmdir ${D}${sbindir}
 }
 
 PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
@@ -115,19 +120,19 @@ RCONFLICTS_ntpdate += "ntpdate-systemd"
 
 RSUGGESTS_${PN} = "iana-etc"
 
-FILES_${PN} = "${sbindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
+FILES_${PN} = "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/init.d/ntpd ${libdir} \
     ${NTP_USER_HOME} \
     ${systemd_unitdir}/ntp-units.d/60-ntpd.list \
 "
-FILES_${PN}-tickadj = "${sbindir}/tickadj"
-FILES_${PN}-utils = "${sbindir}"
-FILES_ntpdate = "${sbindir}/ntpdate \
+FILES_${PN}-tickadj = "${bindir}/tickadj"
+FILES_${PN}-utils = "${bindir} ${datadir}/ntp/lib"
+FILES_ntpdate = "${bindir}/ntpdate \
     ${sysconfdir}/network/if-up.d/ntpdate-sync \
     ${bindir}/ntpdate-sync \
     ${sysconfdir}/default/ntpdate \
     ${systemd_unitdir}/system/ntpdate.service \
 "
-FILES_sntp = "${sbindir}/sntp \
+FILES_sntp = "${bindir}/sntp \
               ${sysconfdir}/default/sntp \
               ${systemd_unitdir}/system/sntp.service \
              "
-- 
1.9.3


