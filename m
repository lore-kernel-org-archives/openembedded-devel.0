Received: from [64.233.184.236] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1K8eP4-0007F6-MF
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jun 2008 18:51:31 +0200
Received: by wr-out-0506.google.com with SMTP id c53so3470007wra.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2008 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=Czl6Bz9uoNr6JwV060dY6m+73xpCnIJacXJ6rg0g77k=;
	b=XbqFe58rHETJ3lGY3/8mEVCFqGWUE29EA681ZbHs5pHzOtIHnEHt/Fsq8f8+y+p4c5
	Tk7kkL2Q+AOr+HN4dZhS24EA9WAFQUEw4BSRcGDTvCd95HjexVnU3T9IMRQsj5ueF+3V
	Vwq4D558T35t0dJn3q/tZgeZD2Hid1zYzB/ns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=j0hUclgsMZdxe6zsQN+ZH+GAsg4JiVV2P9um+hXft9eVmgSbdisONR3TnwBu4ysrIl
	rw9qhKDX4iA8lJmEumNtjDs8wAKldE0ZDPcvPsV8YbI4o2h0LlbcGGPWUC/rdQcaTfgj
	3LK1kK42rhiMriSeIDBfPnL+CqViGPGF/8hRo=
Received: by 10.90.83.2 with SMTP id g2mr9013154agb.112.1213721439494;
	Tue, 17 Jun 2008 09:50:39 -0700 (PDT)
Received: from ?192.168.178.21? ( [85.178.246.111])
	by mx.google.com with ESMTPS id 52sm6566047hsf.7.2008.06.17.09.50.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Jun 2008 09:50:38 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080615181629.GA4886@rhein.zuhause.netz>
References: <1213441674.30583.3.camel@localhost.localdomain>
	<20080615181629.GA4886@rhein.zuhause.netz>
Date: Tue, 17 Jun 2008 18:50:31 +0200
Message-Id: <1213721431.945.5.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.2 
Subject: Re: [PATCH, RFC] gettext 0.17
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Tue, 17 Jun 2008 16:51:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Am Sonntag, den 15.06.2008, 20:16 +0200 schrieb Henning Heinold:
> Hi,
> 
> as I looked at gettext 0.17 too. I saw that the disable_java patch isnt
> necessary anymore there is now a configure option to disable it.

Thanks, indeed --disable-java seems to work. I still need some help
though. While gettext-native builds fine and seems to work, gettext
fails on my ARM target in gettext-runtime/gnulib-lib/mbslen.c with the
following message:

﻿In file included from mbslen.c:27:
mbuiter.h:112: error: expected specifier-qualifier-list before 'mbstate_t'

Details at http://tinderbox.openembedded.net/builds/6018/
It seems that mbstate_t, which is defined in wchar.h inside
__BEGIN_NAMESPACE_C99 ... __END_NAMESPACE_C99 is not recognized. How
could this be fixed?

regards
Philipp

#
# old_revision [333e287567474447d260204effba70e5e0c2eb71]
#
# rename "packages/gettext/gettext-native_0.14.1.bb"
#     to "packages/gettext/gettext-native.inc"
# 
# rename "packages/gettext/gettext_0.14.1.bb"
#     to "packages/gettext/gettext.inc"
# 
# add_dir "packages/gettext/gettext-0.17"
# 
# add_file "packages/gettext/gettext-0.17/gettext-error_print_progname.patch"
#  content [a9549cd124898ccf32e3b9a64f38d4a44468a6eb]
# 
# add_file "packages/gettext/gettext-0.17/gettext-vpath.patch"
#  content [1fd3e5ba072410b744ae1604d822e2e2e686e29e]
# 
# add_file "packages/gettext/gettext-0.17/remove-ac-type-long-long.patch"
#  content [b4fe85e3f1d636f72036a29e3dacf8c38546069c]
# 
# add_file "packages/gettext/gettext-native_0.14.1.bb"
#  content [ab34f7581364c41b1a14550311222f17a893cd9e]
# 
# add_file "packages/gettext/gettext-native_0.17.bb"
#  content [5d4c3db07e4b86964f1a0daf0f2f55ec6d4e95b8]
# 
# add_file "packages/gettext/gettext_0.14.1.bb"
#  content [6c6f763dad3ecd027f8a52722c6e3c3726cd20d7]
# 
# add_file "packages/gettext/gettext_0.17.bb"
#  content [d9999281598fb210b069a7910786ed2f2cf63398]
# 
# patch "packages/gettext/gettext-native.inc"
#  from [2e903067b552793b23bc96c5ec738ada09f03316]
#    to [274a5fef08d3b1b8af231284a6102f689b991d22]
# 
# patch "packages/gettext/gettext.inc"
#  from [3a0fa051089a75ecb61149ba3b56405116c60bb2]
#    to [585c5f573f51886bc8116f17ef4d7067560601da]
#
============================================================
--- packages/gettext/gettext-0.17/gettext-error_print_progname.patch	a9549cd124898ccf32e3b9a64f38d4a44468a6eb
+++ packages/gettext/gettext-0.17/gettext-error_print_progname.patch	a9549cd124898ccf32e3b9a64f38d4a44468a6eb
@@ -0,0 +1,12 @@
+diff -ur gettext-0.14.6/gettext-tools/lib/error.h gettext-0.14.6-patched/gettext-tools/lib/error.h
+--- gettext-0.14.6/gettext-tools/gnulib-lib/error.h	2005-05-20 16:03:42.000000000 -0500
++++ gettext-0.14.6-patched/gettext-tools/gnulib-lib/error.h	2007-01-13 20:57:24.422168053 -0600
+@@ -50,7 +50,7 @@
+ /* If NULL, error will flush stdout, then print on stderr the program
+    name, a colon and a space.  Otherwise, error will call this
+    function without parameters instead.  */
+-extern DLL_VARIABLE void (*error_print_progname) (void);
++void (*error_print_progname) (void);
+ 
+ /* This variable is incremented each time `error' is called.  */
+ extern DLL_VARIABLE unsigned int error_message_count;
============================================================
--- packages/gettext/gettext-0.17/gettext-vpath.patch	1fd3e5ba072410b744ae1604d822e2e2e686e29e
+++ packages/gettext/gettext-0.17/gettext-vpath.patch	1fd3e5ba072410b744ae1604d822e2e2e686e29e
@@ -0,0 +1,13 @@
+Index: gettext-0.17/gettext-runtime/intl/Makefile.in
+===================================================================
+--- gettext-0.17.orig/gettext-runtime/intl/Makefile.in	2007-11-04 22:21:12.000000000 +0100
++++ gettext-0.17/gettext-runtime/intl/Makefile.in	2008-06-11 16:33:50.000000000 +0200
+@@ -35,7 +35,7 @@
+ #    'make' does the wrong thing if GNU gettext was configured with
+ #    "./configure --srcdir=`pwd`", namely it gets confused by the .lo and .la
+ #    files it finds in srcdir = ../../gettext-runtime/intl.
+-VPATH = $(srcdir)
++#VPATH = $(srcdir)
+ 
+ prefix = @prefix@
+ exec_prefix = @exec_prefix@
============================================================
--- packages/gettext/gettext-0.17/remove-ac-type-long-long.patch	b4fe85e3f1d636f72036a29e3dacf8c38546069c
+++ packages/gettext/gettext-0.17/remove-ac-type-long-long.patch	b4fe85e3f1d636f72036a29e3dacf8c38546069c
@@ -0,0 +1,12 @@
+Index: gettext-0.17/gettext-runtime/libasprintf/configure.ac
+===================================================================
+--- gettext-0.17.orig/gettext-runtime/libasprintf/configure.ac	2008-06-11 17:00:05.000000000 +0200
++++ gettext-0.17/gettext-runtime/libasprintf/configure.ac	2008-06-11 17:00:12.000000000 +0200
+@@ -54,7 +54,6 @@
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_INLINE
+ AC_TYPE_SIZE_T
+-gl_AC_TYPE_LONG_LONG
+ gt_TYPE_LONGDOUBLE
+ gt_TYPE_WCHAR_T
+ gt_TYPE_WINT_T
============================================================
--- packages/gettext/gettext-native_0.14.1.bb	ab34f7581364c41b1a14550311222f17a893cd9e
+++ packages/gettext/gettext-native_0.14.1.bb	ab34f7581364c41b1a14550311222f17a893cd9e
@@ -0,0 +1,9 @@
+require gettext_${PV}.bb
+require gettext-native.inc
+
+M4 += "\
+inttypes.m4 \
+isc-posix.m4 \
+longdouble.m4 \
+signed.m4 \
+"
============================================================
--- packages/gettext/gettext-native_0.17.bb	5d4c3db07e4b86964f1a0daf0f2f55ec6d4e95b8
+++ packages/gettext/gettext-native_0.17.bb	5d4c3db07e4b86964f1a0daf0f2f55ec6d4e95b8
@@ -0,0 +1,2 @@
+require gettext_${PV}.bb
+require gettext-native.inc
============================================================
--- packages/gettext/gettext_0.14.1.bb	6c6f763dad3ecd027f8a52722c6e3c3726cd20d7
+++ packages/gettext/gettext_0.14.1.bb	6c6f763dad3ecd027f8a52722c6e3c3726cd20d7
@@ -0,0 +1,13 @@
+require gettext.inc
+
+PR = "r9"
+
+SRC_URI += "file://fixchicken.patch;patch=1;pnum=1 \
+            file://linklib_from_0.17.patch;patch=1 \
+            file://getline.m4.patch;patch=1 \
+            file://disable_java.patch;patch=1"
+
+do_configure_prepend() {
+	rm -f ${S}/config/m4/libtool.m4
+	install -m 0644 ${STAGING_DATADIR}/aclocal/libtool.m4 ${S}/config/m4/
+}
============================================================
--- packages/gettext/gettext_0.17.bb	d9999281598fb210b069a7910786ed2f2cf63398
+++ packages/gettext/gettext_0.17.bb	d9999281598fb210b069a7910786ed2f2cf63398
@@ -0,0 +1,10 @@
+require gettext.inc
+
+SRC_URI += "file://remove-ac-type-long-long.patch;patch=1"
+
+do_configure_prepend() {
+	rm -f ${S}/m4/libtool.m4
+	install -m 0644 ${STAGING_DATADIR}/aclocal/libtool.m4 ${S}/m4/
+}
+
+EXTRA_OECONF += "--disable-java --with-included-glib"
============================================================
--- packages/gettext/gettext-native_0.14.1.bb	2e903067b552793b23bc96c5ec738ada09f03316
+++ packages/gettext/gettext-native.inc	274a5fef08d3b1b8af231284a6102f689b991d22
@@ -1,4 +1,3 @@
-require gettext_${PV}.bb
 S = "${WORKDIR}/gettext-${PV}"
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gettext-${PV}"
 inherit native
@@ -15,18 +14,14 @@ intmax.m4 \
 iconv.m4 \
 intdiv0.m4 \
 intmax.m4 \
-inttypes.m4 \
 inttypes_h.m4 \
 inttypes-pri.m4 \
-isc-posix.m4 \
 lcmessage.m4 \
-longdouble.m4 \
 longlong.m4 \
 nls.m4 \
 po.m4 \
 printf-posix.m4 \
 progtest.m4 \
-signed.m4 \
 size_max.m4 \
 stdint_h.m4 \
 uintmax_t.m4 \
@@ -43,6 +38,11 @@ do_stage_append() {
 			src="gettext-tools/m4/$i"
 		fi
 		if [ ! -f $src ]; then
+			# only for ulonglong.m4,
+			# should go away with autoconf 2.62
+			src="gettext-tools/libgettextpo/gnulib-m4/$i"
+		fi
+		if [ ! -f $src ]; then
 			src="autoconf-lib-link/m4/$i"
 		fi
 		if [ ! -f $src ]; then
============================================================
--- packages/gettext/gettext_0.14.1.bb	3a0fa051089a75ecb61149ba3b56405116c60bb2
+++ packages/gettext/gettext.inc	585c5f573f51886bc8116f17ef4d7067560601da
@@ -2,16 +2,11 @@ LICENSE = "GPL"
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SECTION = "libs"
 LICENSE = "GPL"
-PR = "r9"
 DEPENDS = "virtual/libiconv"
 PROVIDES = "virtual/libintl"
 
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
-	   file://gettext-vpath.patch;patch=1;pnum=1 \
-	   file://fixchicken.patch;patch=1;pnum=1 \
-	   file://linklib_from_0.17.patch;patch=1 \
-           file://getline.m4.patch;patch=1 \
-           file://disable_java.patch;patch=1"
+	   file://gettext-vpath.patch;patch=1;pnum=1"
 
 SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
 SRC_URI_append_linux-uclibcgnueabi = " file://gettext-error_print_progname.patch;patch=1"
@@ -25,11 +20,6 @@ acpaths = '-I ${S}/autoconf-lib-link/m4/
 	   -I ${S}/gettext-runtime/m4 \
 	   -I ${S}/gettext-tools/m4'
 
-do_configure_prepend() {
-	rm -f ${S}/config/m4/libtool.m4
-	install -m 0644 ${STAGING_DATADIR}/aclocal/libtool.m4 ${S}/config/m4/
-}
-
 # these lack the .x behind the .so, but shouldn't be in the -dev package
 # Otherwise you get the following results:
 # 7.4M    glibc/images/ep93xx/Angstrom-console-image-glibc-ipk-2008.1-test-20080104-ep93xx.rootfs.tar.gz



