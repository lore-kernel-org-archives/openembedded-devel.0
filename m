Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZsmW-000894-S0
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 23:49:25 +0200
Received: by bwz10 with SMTP id 10so1645896bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 14:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=XxnOYzrw8eU5sI6IK7CwEXMTrE8TuW6T+bWhoOmFlYE=;
	b=nWP+CC3DFetFqVw1sAie5dVEw/Mn4MRKiWGuwYwwQ0kDmfS2d62D/j+EgHzR/bXcfA
	0NcvHRULliEtPZFKM9IslkCEMcjWA46T2tU3dS9fSvdvBLagoIwbccAmUCyb3Vhf9Nyh
	aM4IQoGVXG6TOMCU+1y+gUiaGL5R8pEk2TYHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LXrRySl4r/J9yciUbLxVa8ub0msWohpI3HPqGO55N9txa/7YBxkXTyfSMo7DFpnMOP
	rqUrG3l59qetcY0/U+FFD+WiVtjRmcGcDXNuCbWc4JRZgVMLLcXpUZACbzzZ+bc944vt
	IeGb/7zfCXqCisidMN2cwC22HurBO6vYT95EI=
Received: by 10.204.115.200 with SMTP id j8mr1405852bkq.60.1279316956981;
	Fri, 16 Jul 2010 14:49:16 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id
	bq20sm12678757bkb.16.2010.07.16.14.49.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Jul 2010 14:49:16 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZsmJ-0002LO-5q; Fri, 16 Jul 2010 23:49:07 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: raj.khem@gmail.com
Date: Fri, 16 Jul 2010 23:49:05 +0200
Message-Id: <1279316946-8901-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279316946-8901-1-git-send-email-rep.dot.nop@gmail.com>
References: <1279316946-8901-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][CFT 2/3] libgmp: bump version
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
X-List-Received-Date: Fri, 16 Jul 2010 21:49:25 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/gmp/gmp-5.0.1/amd64.patch     |   14 +++
 recipes/gmp/gmp-5.0.1/configure.patch |  193 +++++++++++++++++++++++++++++++++
 recipes/gmp/gmp_5.0.1.bb              |    8 ++
 3 files changed, 215 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gmp/gmp-5.0.1/amd64.patch
 create mode 100644 recipes/gmp/gmp-5.0.1/configure.patch
 create mode 100644 recipes/gmp/gmp_5.0.1.bb

diff --git a/recipes/gmp/gmp-5.0.1/amd64.patch b/recipes/gmp/gmp-5.0.1/amd64.patch
new file mode 100644
index 0000000..6a537dd
--- /dev/null
+++ b/recipes/gmp/gmp-5.0.1/amd64.patch
@@ -0,0 +1,14 @@
+--- gmp-5.0.1.oorig/longlong.h	2010-02-06 13:43:13.000000000 +0100
++++ gmp-5.0.1/longlong.h	2010-02-08 17:22:46.000000000 +0100
+@@ -849,8 +849,10 @@ extern UWtype __MPN(udiv_qrnnd) _PROTO (
+    count is only an int. */
+ #define count_trailing_zeros(count, x)					\
+   do {									\
++    UDItype __cbtmp;							\
+     ASSERT ((x) != 0);							\
+-    __asm__ ("bsfq %1,%q0" : "=r" (count) : "rm" ((UDItype)(x)));	\
++    __asm__ ("bsfq %1,%0" : "=r" (__cbtmp) : "rm" ((UDItype)(x)));	\
++    (count) = __cbtmp;						\
+   } while (0)
+ #endif /* x86_64 */
+ 
diff --git a/recipes/gmp/gmp-5.0.1/configure.patch b/recipes/gmp/gmp-5.0.1/configure.patch
new file mode 100644
index 0000000..f89ce07
--- /dev/null
+++ b/recipes/gmp/gmp-5.0.1/configure.patch
@@ -0,0 +1,193 @@
+diff -rdup gmp-5.0.1.oorig/acinclude.m4 gmp-5.0.1/acinclude.m4
+--- gmp-5.0.1.oorig/acinclude.m4	2010-02-06 13:43:13.000000000 +0100
++++ gmp-5.0.1/acinclude.m4	2010-02-08 17:19:44.000000000 +0100
+@@ -30,23 +30,23 @@ dnl    a_out.exe - OpenVMS DEC C called 
+ dnl    conftest.exe - various DOS compilers
+ 
+ 
+-define(IA64_PATTERN,
++define([IA64_PATTERN],
+ [[ia64*-*-* | itanium-*-* | itanium2-*-*]])
+ 
+ dnl  Need to be careful not to match m6811, m6812, m68hc11 and m68hc12, all
+ dnl  of which config.sub accepts.  (Though none of which are likely to work
+ dnl  with GMP.)
+ dnl
+-define(M68K_PATTERN,
++define([M68K_PATTERN],
+ [[m68k-*-* | m68[0-9][0-9][0-9]-*-*]])
+ 
+-define(POWERPC64_PATTERN,
++define([POWERPC64_PATTERN],
+ [[powerpc64-*-* | powerpc64le-*-* | powerpc620-*-* | powerpc630-*-* | powerpc970-*-* | power[3-9]-*-*]])
+ 
+-define(X86_PATTERN,
++define([X86_PATTERN],
+ [[i?86*-*-* | k[5-8]*-*-* | pentium*-*-* | athlon-*-* | viac3*-*-* | geode*-*-* | atom-*-*]])
+ 
+-define(X86_64_PATTERN,
++define([X86_64_PATTERN],
+ [[athlon64-*-* | pentium4-*-* | atom-*-* | core2-*-* | corei-*-* | x86_64-*-* | nano-*-*]])
+ 
+ dnl  GMP_FAT_SUFFIX(DSTVAR, DIRECTORY)
+@@ -64,7 +64,7 @@ dnl      x86         ->  x86
+ dnl      x86/k6      ->  k6
+ dnl      x86/k6/mmx  ->  k6_mmx
+ 
+-define(GMP_FAT_SUFFIX,
++define([GMP_FAT_SUFFIX],
+ [[$1=`echo $2 | sed -e '/\//s:^[^/]*/::' -e 's:[\\/]:_:g'`]])
+ 
+ 
+@@ -73,7 +73,7 @@ dnl  ----------------------------------
+ dnl  Emit code to remove any occurrence of ITEM from $LISTVAR.  ITEM can be a
+ dnl  shell expression like $foo if desired.
+ 
+-define(GMP_REMOVE_FROM_LIST,
++define([GMP_REMOVE_FROM_LIST],
+ [remove_from_list_tmp=
+ for remove_from_list_i in $[][$1]; do
+   if test $remove_from_list_i = [$2]; then :;
+@@ -89,12 +89,12 @@ dnl  GMP_STRIP_PATH(subdir)
+ dnl  ----------------------
+ dnl  Strip entries */subdir from $path and $fat_path.
+ 
+-define(GMP_STRIP_PATH,
++define([GMP_STRIP_PATH],
+ [GMP_STRIP_PATH_VAR(path, [$1])
+ GMP_STRIP_PATH_VAR(fat_path, [$1])
+ ])
+ 
+-define(GMP_STRIP_PATH_VAR,
++define([GMP_STRIP_PATH_VAR],
+ [tmp_path=
+ for i in $[][$1]; do
+   case $i in
+@@ -115,7 +115,7 @@ dnl
+ dnl  Dummy value for GMP_LIMB_BITS is enough
+ dnl  for all current configure-time uses of gmp.h.
+ 
+-define(GMP_INCLUDE_GMP_H,
++define([GMP_INCLUDE_GMP_H],
+ [[#define __GMP_WITHIN_CONFIGURE 1   /* ignore template stuff */
+ #define GMP_NAIL_BITS $GMP_NAIL_BITS
+ #define GMP_LIMB_BITS 123
+@@ -130,7 +130,7 @@ dnl  Expand at autoconf time to the valu
+ dnl  FILE.  The regexps here aren't very rugged, but are enough for gmp.
+ dnl  /dev/null as a parameter prevents a hang if $2 is accidentally omitted.
+ 
+-define(GMP_HEADER_GETVAL,
++define([GMP_HEADER_GETVAL],
+ [patsubst(patsubst(
+ esyscmd([grep "^#define $1 " $2 /dev/null 2>/dev/null]),
+ [^.*$1[ 	]+],[]),
+@@ -144,7 +144,7 @@ dnl  The gmp version number, extracted f
+ dnl  autoconf time.  Two digits like 3.0 if patchlevel <= 0, or three digits
+ dnl  like 3.0.1 if patchlevel > 0.
+ 
+-define(GMP_VERSION,
++define([GMP_VERSION],
+ [GMP_HEADER_GETVAL(__GNU_MP_VERSION,gmp-h.in)[]dnl
+ .GMP_HEADER_GETVAL(__GNU_MP_VERSION_MINOR,gmp-h.in)[]dnl
+ .GMP_HEADER_GETVAL(__GNU_MP_VERSION_PATCHLEVEL,gmp-h.in)])
+@@ -1506,7 +1506,9 @@ esac
+ echo ["define(<CONFIG_TOP_SRCDIR>,<\`$tmp'>)"] >>$gmp_tmpconfigm4
+ 
+ # All CPUs use asm-defs.m4
+-echo ["include][(CONFIG_TOP_SRCDIR\`/mpn/asm-defs.m4')"] >>$gmp_tmpconfigm4i
++echo -n ["include("] >>$gmp_tmpconfigm4i
++echo -n ["CONFIG_TOP_SRCDIR\`/mpn/asm-defs.m4'"] >>$gmp_tmpconfigm4i
++echo [")"] >>$gmp_tmpconfigm4i
+ ])
+ 
+ 
+diff -rdup gmp-5.0.1.oorig/configure.in gmp-5.0.1/configure.in
+--- gmp-5.0.1.oorig/configure.in	2010-02-06 13:43:13.000000000 +0100
++++ gmp-5.0.1/configure.in	2010-02-08 17:18:30.000000000 +0100
+@@ -29,12 +29,6 @@ AC_REVISION($Revision$)
+ AC_PREREQ(2.59)
+ AC_INIT(GNU MP, GMP_VERSION, gmp-bugs@gmplib.org, gmp)
+ AC_CONFIG_SRCDIR(gmp-impl.h)
+-m4_pattern_forbid([^[ \t]*GMP_])
+-m4_pattern_allow(GMP_LDFLAGS)
+-m4_pattern_allow(GMP_LIMB_BITS)
+-m4_pattern_allow(GMP_MPARAM_H_SUGGEST)
+-m4_pattern_allow(GMP_NAIL_BITS)
+-m4_pattern_allow(GMP_NUMB_BITS)
+ 
+ # If --target is not used then $target_alias is empty, but if say
+ # "./configure athlon-pc-freebsd3.5" is used, then all three of
+@@ -303,7 +297,7 @@ AH_VERBATIM([HAVE_HOST_CPU_1],
+ # After GMP specific searches and tests, the standard autoconf AC_PROG_CC is
+ # called.  User selections of CC etc are respected.
+ #
+-# Care is taken not to use macros like AC_TRY_COMPILE during the GMP
++# Care is taken not to use macros like AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[]])],[],[]) during the GMP
+ # pre-testing, since they of course depend on AC_PROG_CC, and also some of
+ # them cache their results, which is not wanted.
+ #
+@@ -395,7 +389,7 @@ abilist="standard"
+ # FIXME: We'd like to prefer an ANSI compiler, perhaps by preferring
+ # c89 over cc here.  But note that on HP-UX c89 provides a castrated
+ # environment, and would want to be excluded somehow.  Maybe
+-# AC_PROG_CC_STDC already does enough to stick cc into ANSI mode and
++#  already does enough to stick cc into ANSI mode and
+ # we don't need to worry.
+ #
+ cclist="gcc cc"
+@@ -1580,7 +1574,7 @@ esac
+ CFLAGS_or_unset=${CFLAGS-'(unset)'}
+ CPPFLAGS_or_unset=${CPPFLAGS-'(unset)'}
+ 
+-cat >&AC_FD_CC <<EOF
++cat >&AS_MESSAGE_LOG_FD() <<EOF
+ User:
+ ABI=$ABI
+ CC=$CC
+@@ -1987,7 +1981,6 @@ AC_SUBST(DEFN_LONG_LONG_LIMB)
+ 
+ # The C compiler and preprocessor, put into ANSI mode if possible.
+ AC_PROG_CC
+-AC_PROG_CC_STDC
+ AC_PROG_CPP
+ GMP_H_ANSI
+ 
+@@ -2010,11 +2003,11 @@ AC_SUBST(CCAS)
+ 
+ # The C++ compiler, if desired.
+ want_cxx=no
++AC_PROG_CXX
+ if test $enable_cxx != no; then
+   test_CXXFLAGS=${CXXFLAGS+set}
+-  AC_PROG_CXX
+ 
+-  echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AC_FD_CC
++  echo "CXXFLAGS chosen by autoconf: $CXXFLAGS" >&AS_MESSAGE_LOG_FD()
+   cxxflags_ac_prog_cxx=$CXXFLAGS
+   cxxflags_list=ac_prog_cxx
+ 
+@@ -2120,7 +2113,7 @@ case $host in
+ esac
+ 
+ 
+-cat >&AC_FD_CC <<EOF
++cat >&AS_MESSAGE_LOG_FD() <<EOF
+ Decided:
+ ABI=$ABI
+ CC=$CC
+@@ -3376,7 +3369,7 @@ GMP_FINISH
+ # FIXME: Upcoming version of autoconf/automake may not like broken lines.
+ #        Right now automake isn't accepting the new AC_CONFIG_FILES scheme.
+ 
+-AC_OUTPUT(Makefile							\
++AC_CONFIG_FILES([Makefile							\
+   mpbsd/Makefile mpf/Makefile mpn/Makefile mpq/Makefile			\
+   mpz/Makefile printf/Makefile scanf/Makefile cxx/Makefile		\
+   tests/Makefile tests/devel/Makefile tests/mpbsd/Makefile		\
+@@ -3385,4 +3378,5 @@ AC_OUTPUT(Makefile							\
+   tests/cxx/Makefile							\
+   doc/Makefile tune/Makefile						\
+   demos/Makefile demos/calc/Makefile demos/expr/Makefile		\
+-  gmp.h:gmp-h.in mp.h:mp-h.in)
++  gmp.h:gmp-h.in mp.h:mp-h.in])
++AC_OUTPUT
diff --git a/recipes/gmp/gmp_5.0.1.bb b/recipes/gmp/gmp_5.0.1.bb
new file mode 100644
index 0000000..80f78bc
--- /dev/null
+++ b/recipes/gmp/gmp_5.0.1.bb
@@ -0,0 +1,8 @@
+INC_PR = "r0"
+PR = "${INC_PR}.1"
+SRC_URI[gmp.md5sum] = "6bac6df75c192a13419dfd71d19240a7"
+SRC_URI[gmp.sha256sum] = "a2a610f01fd3298dc08c87bf30498c2402590e1bcb227fc40b15ee6d280939fb"
+require gmp.inc
+LICENSE = "GPLv3 LGPLv3"
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
-- 
1.7.1



