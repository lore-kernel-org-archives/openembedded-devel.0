Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvX-0006vx-Dt
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:20 +0200
Received: by pwi10 with SMTP id 10so937583pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=UXtLhSoksQ7/+EtCimDbpvtn4WapNMJuppq/q/1h2Us=;
	b=TU4EBfzMzUgCinm7TjQ1ndvNQHx2meGl9DBBXWeqB7I5C9Y3Jt+smEuCIuhxu1K2X8
	wNtEaxSDr31XltcfD/qKZdYS+vPN6zfPXcsc6V1UhP/IdhiYT84e40waqpyPtnIDx0Zo
	fwgdT90wkb6stwSc1/MT3bnBfeJkAWcDbCDZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cgrkgiLd34POueTqfBbBPm/UIVFEk68J/N85EzXOty1R0DgrtRwBDCeXvdjzv3uqaQ
	dHtKTWU/QqGQAfDQ/C2gwM6D1l4/P+tRBv+HF24/aG8VheDT/VUdy0SAKF0YXvI2TRZq
	QzNuy28GQBl/QVWUNFyn1tulOMaLzM0xDpNd4=
Received: by 10.114.74.7 with SMTP id w7mr5929671waa.3.1285456377673;
	Sat, 25 Sep 2010 16:12:57 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:30 -0700
Message-Id: <1285456353-27457-10-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 09/12] eglibc-2.12: Configure for 64-bit mips
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:27 -0000

* Make it to install into /lib and /usr/lib instead of
  /lib64 and /usr/lib64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc-initial.inc                  |    7 +-
 recipes/eglibc/eglibc-package.bbclass              |    5 +-
 recipes/eglibc/eglibc_2.12.bb                      |    6 +-
 .../eglibc/files/eglibc-dont-cache-slibdir.patch   |  132 ++++++++++++++++++++
 4 files changed, 146 insertions(+), 4 deletions(-)
 create mode 100644 recipes/eglibc/files/eglibc-dont-cache-slibdir.patch

diff --git a/recipes/eglibc/eglibc-initial.inc b/recipes/eglibc/eglibc-initial.inc
index eb765df..2a68fd6 100644
--- a/recipes/eglibc/eglibc-initial.inc
+++ b/recipes/eglibc/eglibc-initial.inc
@@ -24,9 +24,14 @@ do_compile () {
 do_install () {
        oe_runmake cross-compiling=yes install_root=${D} \
        includedir='${includedir}' prefix='${prefix}' \
+       libdir='${libdir}' slibdir='${base_libdir}' \
+       localedir='${libdir}/locale' \
        install-bootstrap-headers=yes install-headers
 
-       oe_runmake csu/subdir_lib
+       oe_runmake includedir='${includedir}' prefix='${prefix}' \
+       libdir='${libdir}' slibdir='${base_libdir}' \
+       localedir='${libdir}/locale' \
+       csu/subdir_lib
        # Two headers -- stubs.h and features.h -- aren't installed by install-headers,
        # so do them by hand.  We can tolerate an empty stubs.h for the moment.
        # See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
diff --git a/recipes/eglibc/eglibc-package.bbclass b/recipes/eglibc/eglibc-package.bbclass
index a041f93..9727747 100644
--- a/recipes/eglibc/eglibc-package.bbclass
+++ b/recipes/eglibc/eglibc-package.bbclass
@@ -88,7 +88,10 @@ do_configure_prepend() {
 }
 
 do_install() {
-	oe_runmake install_root=${D} install
+	oe_runmake install_root=${D} \
+	libdir='${libdir}' slibdir='${base_libdir}' \
+	localedir='${libdir}/locale' \
+	install
 	for r in ${rpcsvc}; do
 		h=`echo $r|sed -e's,\.x$,.h,'`
 		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index fce0bdd..aff8aa3 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -4,7 +4,7 @@ DEFAULT_PREFERENCE = "-1"
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.12"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 PR_append = "+svnr${SRCPV}"
 SRCREV="11306"
 EGLIBC_BRANCH="eglibc-2_12"
@@ -14,6 +14,7 @@ SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://shorten-build-commands.patch \
            file://sh4_set_fpscr_2.12.patch \
            file://sh4_local-fpscr_values.patch \
+           file://eglibc-dont-cache-slibdir.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk"
 S = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
@@ -89,7 +90,8 @@ rpcsvc = "bootparam_prot.x nlm_prot.x rstat.x \
 do_compile () {
 	# -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
 	unset LDFLAGS
-	base_do_compile
+	oe_runmake libdir='${libdir}' slibdir='${base_libdir}' \
+        localedir='${libdir}/locale'
 	(
 		cd ${S}/sunrpc/rpcsvc
 		for r in ${rpcsvc}; do
diff --git a/recipes/eglibc/files/eglibc-dont-cache-slibdir.patch b/recipes/eglibc/files/eglibc-dont-cache-slibdir.patch
new file mode 100644
index 0000000..97bc53a
--- /dev/null
+++ b/recipes/eglibc/files/eglibc-dont-cache-slibdir.patch
@@ -0,0 +1,132 @@
+Source: http://sourceware.org/ml/libc-alpha/2008-03/msg00105.html
+Status: Not applied upstream
+
+After reconfiguring, the value of slibdir changes from ${exec_prefix}/lib32 or
+${exec_prefix}/lib64 to ${exec_prefix}/lib.
+
+This is because the code that sets libdir is only executed if libc_cv_slibdir
+is unset (this is to provide an override mechanism for subtargets).  If the
+value of libc_cv_slibdir is read from the config cache the value of libdir is
+never adjusted.  Or:
+
+  $ rm config.cache 
+  $ ~/src/glibc/configure --host=mips64-unknown-linux-gnu --build=i686-linux --prefix=/usr --cache-file=config.cache &>/dev/null
+  $ grep libdir config.make 
+  libdir = ${exec_prefix}/lib32
+  slibdir = /lib32
+  $ ~/src/glibc/configure --host=mips64-unknown-linux-gnu --build=i686-linux --prefix=/usr --cache-file=config.cache &>/dev/null
+  $ grep libdir config.make 
+  libdir = ${exec_prefix}/lib
+  slibdir = /lib32
+
+With the current logic, either both libdir and slibdir should be cached or
+neither.  This patch renames slibdir so that it is no longer cached.
+
+The patch has been in our tree for a few weeks now and produced no regressions
+with glibc testing (make check).
+
+Please apply if OK.
+
+Adam
+
+	* config.make.in (libc_cv_slibdir): Rename to slibdir.
+	* configure.in: Rename libc_cv_slibdir to slibdir.
+	* sysdeps/unix/sysv/linux/configure.in: Likewise.
+	* ports/sysdeps/unix/sysv/linux/mips/configure.in: Likewise
+	* configure: Regenerate.
+	* sysdeps/unix/sysv/linux/configure: Likewise.
+	* ports/sysdeps/unix/sysv/linux/mips/configure: Likewise.
+
+Index: libc/config.make.in
+===================================================================
+--- libc.orig/config.make.in	2010-08-25 00:26:33.000000000 -0700
++++ libc/config.make.in	2010-09-25 12:31:21.460933356 -0700
+@@ -10,7 +10,7 @@
+ exec_prefix = @exec_prefix@
+ datadir = @datadir@
+ libdir = @libdir@
+-slibdir = @libc_cv_slibdir@
++slibdir = @slibdir@
+ localedir = @libc_cv_localedir@
+ sysconfdir = @libc_cv_sysconfdir@
+ libexecdir = @libexecdir@
+Index: libc/configure.in
+===================================================================
+--- libc.orig/configure.in	2010-08-25 00:26:33.000000000 -0700
++++ libc/configure.in	2010-09-25 12:31:21.484430729 -0700
+@@ -2337,7 +2337,7 @@
+ fi
+ AC_SUBST(old_glibc_headers)
+ 
+-AC_SUBST(libc_cv_slibdir)
++AC_SUBST(slibdir)
+ AC_SUBST(libc_cv_localedir)
+ AC_SUBST(libc_cv_sysconfdir)
+ AC_SUBST(libc_cv_rootsbindir)
+Index: libc/sysdeps/unix/sysv/linux/configure.in
+===================================================================
+--- libc.orig/sysdeps/unix/sysv/linux/configure.in	2010-08-25 00:25:11.000000000 -0700
++++ libc/sysdeps/unix/sysv/linux/configure.in	2010-09-25 12:31:21.500430612 -0700
+@@ -147,12 +147,12 @@
+ case "$prefix" in
+ /usr | /usr/)
+   # 64-bit libraries on bi-arch platforms go in /lib64 instead of /lib.
+-  # Allow earlier configure scripts to handle libc_cv_slibdir, libdir,
++  # Allow earlier configure scripts to handle slibdir, libdir,
+   # and libc_cv_localedir.
+-  test -n "$libc_cv_slibdir" || \
++  test -n "$slibdir" || \
+   case $machine in
+   sparc/sparc64 | x86_64 | powerpc/powerpc64 | s390/s390-64)
+-    libc_cv_slibdir="/lib64"
++    slibdir="/lib64"
+     if test "$libdir" = '${exec_prefix}/lib'; then
+       libdir='${exec_prefix}/lib64';
+       # Locale data can be shared between 32bit and 64bit libraries
+@@ -160,7 +160,7 @@
+     fi
+     ;;
+   *)
+-    libc_cv_slibdir="/lib"
++    slibdir="/lib"
+     ;;
+   esac
+   # Allow the user to override the path with --sysconfdir
+Index: libc/ports/sysdeps/unix/sysv/linux/mips/configure.in
+===================================================================
+--- libc.orig/ports/sysdeps/unix/sysv/linux/mips/configure.in	2010-08-25 00:24:01.000000000 -0700
++++ libc/ports/sysdeps/unix/sysv/linux/mips/configure.in	2010-09-25 12:31:21.500430612 -0700
+@@ -80,12 +80,12 @@
+ case "$prefix" in
+ /usr | /usr/)
+   # 64-bit libraries on bi-arch platforms go in /lib64 instead of /lib.
+-  # Allow earlier configure scripts to handle libc_cv_slibdir, libdir,
++  # Allow earlier configure scripts to handle slibdir, libdir,
+   # and libc_cv_localedir.
+-  test -n "$libc_cv_slibdir" || \
++  test -n "$slibdir" || \
+   case $machine in
+   mips/mips64/n64/* )
+-    libc_cv_slibdir="/lib64"
++    slibdir="/lib64"
+     if test "$libdir" = '${exec_prefix}/lib'; then
+       libdir='${exec_prefix}/lib64';
+       # Locale data can be shared between 32bit and 64bit libraries
+@@ -93,7 +93,7 @@
+     fi
+     ;;
+   mips/mips64/n32/* )
+-    libc_cv_slibdir="/lib32"
++    slibdir="/lib32"
+     if test "$libdir" = '${exec_prefix}/lib'; then
+       libdir='${exec_prefix}/lib32';
+       # Locale data can be shared between 32bit and 64bit libraries
+@@ -101,7 +101,7 @@
+     fi
+     ;;
+   *)
+-    libc_cv_slibdir="/lib"
++    slibdir="/lib"
+     ;;
+   esac
+ esac
-- 
1.7.0.4



