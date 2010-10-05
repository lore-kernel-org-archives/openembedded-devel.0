Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P32CW-0003Au-8P
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:44:44 +0200
Received: by pxi11 with SMTP id 11so1515024pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Og7OdUHFTGEG1jwYPSHYPJnV9LbtDDGFnXWPy/m49h8=;
	b=MIQlJXqU83Jgbt3495/kskJ742Z0EUeLMXpr9nBKd0XvGjV2Av07Q+54FGF1IPgVX1
	orKPgHDD5RmVGSoDKT+QUxE6y5NNFKCW1eT2hIT4rMW8pT2IjBN9zR8v9L+AR/mDB54X
	4ZYUnhCsDgglHCG1yrO/Kp32XIcKaABeEInew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=I0GmnTcaU6gNRwJ5fpbSorSfs9bua2XZ+OO8LGfJhF5qF9+rvB9mdCvVVij1jAKRNK
	EmoV+eTTm3AfuMFHoZhzFCtheJDj7recO1c8/g7MEwTuzYs5HxCYcW4BmjoPxgXOB088
	bQGb8/sB3Xqg2R7cEQLYaFhFHzP2g9bJEZqZ0=
Received: by 10.143.3.17 with SMTP id f17mr9934013wfi.44.1286264657639;
	Tue, 05 Oct 2010 00:44:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 9sm7531414wfd.0.2010.10.05.00.44.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Oct 2010 00:44:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Oct 2010 00:43:58 -0700
Message-Id: <1286264643-6352-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/6] libtool-2.4: Add recipes for libtool 2.4
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
X-List-Received-Date: Tue, 05 Oct 2010 07:44:45 -0000

* Add fixes needed for sysroot working within libtool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/libtool/libtool-2.4/cross.patch            |   34 +++++++
 .../libtool/libtool-2.4/prefix-manpage-fix.patch   |   19 ++++
 recipes/libtool/libtool-2.4/prefix.patch           |  100 ++++++++++++++++++++
 recipes/libtool/libtool-2.4/resolve-sysroot.patch  |   18 ++++
 recipes/libtool/libtool-2.4/trailingslash.patch    |   32 ++++++
 recipes/libtool/libtool-cross_2.4.bb               |   34 +++++++
 recipes/libtool/libtool-native_2.4.bb              |   22 +++++
 recipes/libtool/libtool-nativesdk_2.4.bb           |   26 +++++
 recipes/libtool/libtool-sdk_2.4.bb                 |   54 +++++++++++
 recipes/libtool/libtool_2.4.bb                     |   40 ++++++++
 10 files changed, 379 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libtool/libtool-2.4/cross.patch
 create mode 100644 recipes/libtool/libtool-2.4/prefix-manpage-fix.patch
 create mode 100644 recipes/libtool/libtool-2.4/prefix.patch
 create mode 100644 recipes/libtool/libtool-2.4/resolve-sysroot.patch
 create mode 100644 recipes/libtool/libtool-2.4/trailingslash.patch
 create mode 100644 recipes/libtool/libtool-cross_2.4.bb
 create mode 100644 recipes/libtool/libtool-native_2.4.bb
 create mode 100644 recipes/libtool/libtool-nativesdk_2.4.bb
 create mode 100644 recipes/libtool/libtool-sdk_2.4.bb
 create mode 100644 recipes/libtool/libtool_2.4.bb

diff --git a/recipes/libtool/libtool-2.4/cross.patch b/recipes/libtool/libtool-2.4/cross.patch
new file mode 100644
index 0000000..fb25e38
--- /dev/null
+++ b/recipes/libtool/libtool-2.4/cross.patch
@@ -0,0 +1,34 @@
+Index: libtool-2.4/libltdl/config/ltmain.m4sh
+===================================================================
+--- libtool-2.4.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.4/libltdl/config/ltmain.m4sh
+@@ -6121,8 +6121,6 @@ func_mode_link ()
+ 		add="$libdir/$linklib"
+ 	      fi
+ 	    else
+-	      # We cannot seem to hardcode it, guess we'll fake it.
+-	      add_dir="-L$libdir"
+ 	      # Try looking first in the location we're being installed to.
+ 	      if test -n "$inst_prefix_dir"; then
+ 		case $libdir in
+@@ -6277,8 +6275,18 @@ func_mode_link ()
+ 		  fi
+ 		  ;;
+ 		*)
+-		  path="-L$absdir/$objdir"
+-		  ;;
++                  # OE sets installed=no in staging. We need to look in $objdir and $absdir,
++                  # preferring $objdir. RP 31/04/2008
++		  if test -f "$absdir/$objdir/$depdepl" ; then
++		    depdepl="$absdir/$objdir/$depdepl"
++		    path="-L$absdir/$objdir"
++		  elif test -f "$absdir/$depdepl" ; then
++		    depdepl="$absdir/$depdepl"
++		    path="-L$absdir"
++		  else
++		    path="-L$absdir/$objdir"
++		  fi
++		;;
+ 		esac
+ 		else
+ 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
diff --git a/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch b/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch
new file mode 100644
index 0000000..4728669
--- /dev/null
+++ b/recipes/libtool/libtool-2.4/prefix-manpage-fix.patch
@@ -0,0 +1,19 @@
+For cross environment, it not possible to run the generated executable.
+nstead use the build version of libtool to generate the man pages. 
+
+Date: 2010/07/09
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: libtool-2.2.10/Makefile.am
+===================================================================
+--- libtool-2.2.10.orig/Makefile.am
++++ libtool-2.2.10/Makefile.am
+@@ -337,7 +337,7 @@ update_mans = \
+   PATH=.$(PATH_SEPARATOR)$$PATH; export PATH; \
+   $(HELP2MAN) --output=$@
+ $(srcdir)/doc/libtool.1: $(srcdir)/$(auxdir)/ltmain.sh
+-	$(update_mans) --help-option=--help-all libtool
++	$(update_mans) --help-option=--help-all ${build_alias}-libtool
+ $(srcdir)/doc/libtoolize.1: $(srcdir)/libtoolize.in
+ 	$(update_mans) libtoolize
+ 
diff --git a/recipes/libtool/libtool-2.4/prefix.patch b/recipes/libtool/libtool-2.4/prefix.patch
new file mode 100644
index 0000000..70bbd15
--- /dev/null
+++ b/recipes/libtool/libtool-2.4/prefix.patch
@@ -0,0 +1,100 @@
+Renames "libtool" -> "${TARGET_PREFIX}libtool" which makes sure
+it can't be confused with the host libtool.
+
+Originally by: RP
+
+Updated: Date: 2010/06/28
+Nitin A Kamble <nitin.a.kamble@intel.com>
+
+
+Index: libtool-2.4/libltdl/m4/libtool.m4
+===================================================================
+--- libtool-2.4.orig/libltdl/m4/libtool.m4
++++ libtool-2.4/libltdl/m4/libtool.m4
+@@ -94,7 +94,8 @@ _LT_SET_OPTIONS([$0], [$1])
+ LIBTOOL_DEPS="$ltmain"
+ 
+ # Always use our own libtool.
+-LIBTOOL='$(SHELL) $(top_builddir)/libtool'
++LIBTOOL='$(SHELL) $(top_builddir)'
++LIBTOOL="$LIBTOOL/${host_alias}-libtool"
+ AC_SUBST(LIBTOOL)dnl
+ 
+ _LT_SETUP
+@@ -204,7 +205,7 @@ aix3*)
+ esac
+ 
+ # Global variables:
+-ofile=libtool
++ofile=${host_alias}-libtool
+ can_build_shared=yes
+ 
+ # All known linkers require a `.a' archive for static linking (except MSVC,
+Index: libtool-2.4/Makefile.am
+===================================================================
+--- libtool-2.4.orig/Makefile.am
++++ libtool-2.4/Makefile.am
+@@ -31,7 +31,7 @@ AM_LDFLAGS		=
+ DIST_SUBDIRS		= .
+ EXTRA_DIST		=
+ 
+-BUILT_SOURCES		= libtool libtoolize
++BUILT_SOURCES		= $(host_alias)-libtool libtoolize
+ 
+ CLEANFILES		=
+ MOSTLYCLEANFILES	=
+@@ -65,7 +65,7 @@ rebuild = rebuild=:; $(timestamp); corre
+ ## ---------------- ##
+ 
+ # The libtool distributor and the standalone libtool script.
+-bin_SCRIPTS = libtoolize libtool
++bin_SCRIPTS = libtoolize $(host_alias)-libtool
+ 
+ libtoolize: $(srcdir)/libtoolize.in $(top_builddir)/config.status
+ 	rm -f libtoolize.tmp libtoolize
+@@ -90,8 +90,8 @@ $(srcdir)/libtoolize.in: $(sh_files) lib
+ # We used to do this with a 'stamp-vcl' file, but non-gmake builds
+ # would rerun configure on every invocation, so now we manually
+ # check the version numbers from the build rule when necessary.
+-libtool: $(top_builddir)/config.status $(srcdir)/$(auxdir)/ltmain.sh ChangeLog
+-	@target=libtool; $(rebuild); \
++$(host_alias)-libtool: $(top_builddir)/config.status $(srcdir)/$(auxdir)/ltmain.sh ChangeLog
++	@target=$(host_alias)-libtool; $(rebuild); \
+ 	if test -f "$$target"; then \
+ 	  set dummy `./$$target --version | sed 1q`; actualver="$$5"; \
+ 	  test "$$actualver" = "$$correctver" && rebuild=false; \
+@@ -100,8 +100,8 @@ libtool: $(top_builddir)/config.status $
+ 	  case $$prereq in *ChangeLog);; *) rebuild=:;; esac; \
+ 	done; \
+ 	if $$rebuild; then \
+-	  echo $(SHELL) ./config.status $$target; \
+-	  cd $(top_builddir) && $(SHELL) ./config.status $$target; \
++	  echo $(SHELL) ./config.status libtool; \
++	  cd $(top_builddir) && $(SHELL) ./config.status libtool; \
+ 	fi
+ 
+ .PHONY: configure-subdirs
+@@ -146,7 +146,7 @@ EXTRA_DIST     += bootstrap $(srcdir)/li
+ 		  ChangeLog.2002 ChangeLog.2003 ChangeLog.2004 \
+ 		  ChangeLog.2005 ChangeLog.2006 ChangeLog.2007 \
+ 		  ChangeLog.2008 ChangeLog.2009
+-CLEANFILES     += libtool libtoolize libtoolize.tmp \
++CLEANFILES     += $(host_alias)-libtool libtoolize libtoolize.tmp \
+ 		  $(auxdir)/ltmain.tmp $(m4dir)/ltversion.tmp
+ 
+ ## We build ltversion.m4 here, instead of from config.status,
+@@ -526,12 +526,12 @@ TESTS_ENVIRONMENT = MAKE="$(MAKE)" CC="$
+ 
+ BUILDCHECK_ENVIRONMENT = _lt_pkgdatadir="$(abs_top_srcdir)" \
+ 	LIBTOOLIZE="$(abs_top_builddir)/libtoolize" \
+-	LIBTOOL="$(abs_top_builddir)/libtool" \
++	LIBTOOL="$(abs_top_builddir)/$(host_alias)-libtool" \
+ 	tst_aclocaldir="$(abs_top_srcdir)/libltdl/m4"
+ 
+ INSTALLCHECK_ENVIRONMENT = \
+ 	LIBTOOLIZE="$(bindir)/`echo libtoolize | sed '$(program_transform_name)'`" \
+-	LIBTOOL="$(bindir)/`echo libtool | sed '$(program_transform_name)'`" \
++	LIBTOOL="$(bindir)/`echo $(host_alias)-libtool | sed '$(program_transform_name)'`" \
+ 	LTDLINCL="-I$(includedir)" \
+ 	LIBLTDL="$(libdir)/libltdl.la" \
+ 	tst_aclocaldir="$(aclocaldir)"
diff --git a/recipes/libtool/libtool-2.4/resolve-sysroot.patch b/recipes/libtool/libtool-2.4/resolve-sysroot.patch
new file mode 100644
index 0000000..57689a5
--- /dev/null
+++ b/recipes/libtool/libtool-2.4/resolve-sysroot.patch
@@ -0,0 +1,18 @@
+Sometimes .las have =/a/b/c.la in dependency_libs this should be
+resolved to sysroot
+-Khem
+
+Index: libtool-2.4/libltdl/config/ltmain.m4sh
+===================================================================
+--- libtool-2.4.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.4/libltdl/config/ltmain.m4sh
+@@ -8480,7 +8480,8 @@ EOF
+ 	      *.la)
+ 		func_basename "$deplib"
+ 		name="$func_basename_result"
+-		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
++		func_resolve_sysroot "$deplib"
++		eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $func_resolve_sysroot_result`
+ 		test -z "$libdir" && \
+ 		  func_fatal_error "\`$deplib' is not a valid libtool archive"
+ 		func_append newdependency_libs " ${lt_sysroot:+=}$libdir/$name"
diff --git a/recipes/libtool/libtool-2.4/trailingslash.patch b/recipes/libtool/libtool-2.4/trailingslash.patch
new file mode 100644
index 0000000..313c262
--- /dev/null
+++ b/recipes/libtool/libtool-2.4/trailingslash.patch
@@ -0,0 +1,32 @@
+A command like /bin/sh ../../i586-poky-linux-libtool   --mode=install /usr/bin/install -c   gck-roots-store-standalone.la '/media/data1/builds/poky1/tmp/work/core2-poky-linux/gnome-keyring-2.26.1-r1/image/usr/lib/gnome-keyring/standalone/' fails (e.g. gnome-keyring or pulseaudio)
+
+This is because libdir has a trailing slash which breaks the comparision.
+
+RP 2/1/10
+
+Merged a patch received from Gary Thomas <gary@mlbassoc.com>
+
+Date: 2010/07/12
+Nitin A Kamble <nitin.a.kamble@intel.com>
+
+Index: libtool-2.2.10/libltdl/config/ltmain.m4sh
+===================================================================
+--- libtool-2.2.10.orig/libltdl/config/ltmain.m4sh
++++ libtool-2.2.10/libltdl/config/ltmain.m4sh
+@@ -1634,8 +1634,15 @@ func_mode_install ()
+ 	dir="$dir$objdir"
+ 
+ 	if test -n "$relink_command"; then
++      # Strip any trailing slash from the destination.
++      func_stripname '' '/' "$libdir"
++      destlibdir=$func_stripname_result
++
++      func_stripname '' '/' "$destdir"
++      s_destdir=$func_stripname_result
++
+ 	  # Determine the prefix the user has applied to our future dir.
+-	  inst_prefix_dir=`$ECHO "$destdir" | $SED -e "s%$libdir\$%%"`
++	  inst_prefix_dir=`$ECHO "X$s_destdir" | $Xsed -e "s%$destlibdir\$%%"`
+ 
+ 	  # Don't allow the user to place us outside of our expected
+ 	  # location b/c this prevents finding dependent libraries that
diff --git a/recipes/libtool/libtool-cross_2.4.bb b/recipes/libtool/libtool-cross_2.4.bb
new file mode 100644
index 0000000..e20c2c3
--- /dev/null
+++ b/recipes/libtool/libtool-cross_2.4.bb
@@ -0,0 +1,34 @@
+require libtool_${PV}.bb
+
+PACKAGES = ""
+SRC_URI_append = " file://prefix.patch \
+                   file://cross.patch \
+                 "
+
+DEPENDS += "libtool-native"
+
+do_configure_prepend () {
+        # Remove any existing libtool m4 since old stale versions would break
+        # any upgrade
+        rm -f ${STAGING_DATADIR}/aclocal/libtool.m4
+        rm -f ${STAGING_DATADIR}/aclocal/lt*.m4
+}
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
+        install -d ${D}${datadir}/libtool/
+        install -d ${D}${datadir}/aclocal/
+        install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
+        install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
+        install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/
+        install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${D}${datadir}/aclocal/
+        install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${D}${datadir}/aclocal/
+}
+
+SYSROOT_PREPROCESS_FUNCS += "libtoolcross_sysroot_preprocess"
+
+libtoolcross_sysroot_preprocess () {
+        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/
+        install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool
+}
diff --git a/recipes/libtool/libtool-native_2.4.bb b/recipes/libtool/libtool-native_2.4.bb
new file mode 100644
index 0000000..82b2419
--- /dev/null
+++ b/recipes/libtool/libtool-native_2.4.bb
@@ -0,0 +1,22 @@
+require libtool_${PV}.bb
+
+DEPENDS = ""
+
+SRC_URI_append = " file://prefix.patch \
+                   file://cross.patch \
+                 "
+
+inherit native
+EXTRA_OECONF = " --with-sysroot=${STAGING_DIR_NATIVE}"
+do_configure_prepend () {
+        # Remove any existing libtool m4 since old stale versions would break
+        # any upgrade
+        rm -f ${STAGING_DATADIR}/aclocal/libtool.m4
+        rm -f ${STAGING_DATADIR}/aclocal/lt*.m4
+}
+
+do_install () {
+        autotools_do_install
+        install -d ${D}${bindir}/
+        install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
+}
diff --git a/recipes/libtool/libtool-nativesdk_2.4.bb b/recipes/libtool/libtool-nativesdk_2.4.bb
new file mode 100644
index 0000000..34f728a
--- /dev/null
+++ b/recipes/libtool/libtool-nativesdk_2.4.bb
@@ -0,0 +1,26 @@
+require libtool_${PV}.bb
+
+SRC_URI_append = " file://prefix.patch \
+                   file://cross.patch \
+                 "
+
+inherit nativesdk
+do_configure_prepend () {
+        # Remove any existing libtool m4 since old stale versions would break
+        # any upgrade
+        rm -f ${STAGING_DATADIR}/aclocal/libtool.m4
+        rm -f ${STAGING_DATADIR}/aclocal/lt*.m4
+}
+
+do_install () {
+        autotools_do_install
+        install -d ${D}${bindir}/
+        install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/
+}
+
+SYSROOT_PREPROCESS_FUNCS += "libtoolnativesdk_sysroot_preprocess"
+
+libtoolnativesdk_sysroot_preprocess () {
+        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/
+        install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool
+}
diff --git a/recipes/libtool/libtool-sdk_2.4.bb b/recipes/libtool/libtool-sdk_2.4.bb
new file mode 100644
index 0000000..f7d6cb5
--- /dev/null
+++ b/recipes/libtool/libtool-sdk_2.4.bb
@@ -0,0 +1,54 @@
+require libtool_${PV}.bb
+
+PR = "${INC_PR}.0"
+SRC_URI_append = " file://cross_compile.patch"
+
+inherit sdk
+
+do_install () {
+	install -d ${D}${bindir}/
+	install -m 0755 libtool ${D}${bindir}/
+	install -m 0755 libtoolize ${D}${bindir}/
+
+	install -d ${D}${libdir}/
+	oe_libinstall -a -so -C libltdl libltdl ${D}${libdir}
+
+	install -d ${D}${includedir}/
+	install -m 0644 libltdl/ltdl.h ${D}${includedir}
+
+	install -d ${D}${datadir}/libtool/config/
+	install -c ${S}/libltdl/config/config.guess ${D}${datadir}/libtool/
+	install -c ${S}/libltdl/config/config.sub ${D}${datadir}/libtool/
+	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${D}${datadir}/libtool/config/
+
+	install -d ${D}${datadir}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${D}${datadir}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${D}${datadir}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/ltoptions.m4 ${D}${datadir}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/ltversion.m4 ${D}${datadir}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/ltsugar.m4 ${D}${datadir}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/lt~obsolete.m4 ${D}${datadir}/aclocal/
+}
+
+do_stage () {
+	install -d ${STAGING_BINDIR}/
+	install -m 0755 libtool ${STAGING_BINDIR}/${HOST_SYS}-libtool
+	install -m 0755 libtoolize ${STAGING_BINDIR}/libtoolize
+
+	oe_libinstall -a -so -C libltdl libltdl ${STAGING_LIBDIR}
+	install -d ${STAGING_INCDIR}
+	install -m 0644 libltdl/ltdl.h ${STAGING_INCDIR}/
+
+	install -d ${STAGING_DATADIR}/libtool/config/
+	install -c ${S}/libltdl/config/config.guess ${STAGING_DATADIR}/libtool/
+	install -c ${S}/libltdl/config/config.sub ${STAGING_DATADIR}/libtool/
+	install -c -m 0644 ${S}/libltdl/config/ltmain.sh ${STAGING_DATADIR}/libtool/config/
+
+	install -d ${STAGING_DATADIR}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/libtool.m4 ${STAGING_DATADIR}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/ltdl.m4 ${STAGING_DATADIR}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/ltoptions.m4 ${STAGING_DATADIR}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/ltversion.m4 ${STAGING_DATADIR}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/ltsugar.m4 ${STAGING_DATADIR}/aclocal/
+	install -c -m 0644 ${S}/libltdl/m4/lt~obsolete.m4 ${STAGING_DATADIR}/aclocal/
+}
diff --git a/recipes/libtool/libtool_2.4.bb b/recipes/libtool/libtool_2.4.bb
new file mode 100644
index 0000000..ffc525d
--- /dev/null
+++ b/recipes/libtool/libtool_2.4.bb
@@ -0,0 +1,40 @@
+require libtool.inc
+DEPENDS = "libtool-native"
+PR = "${INC_PR}.0"
+
+SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
+           file://trailingslash.patch \
+           file://prefix-manpage-fix.patch \
+	   file://resolve-sysroot.patch \
+          "
+SRC_URI[md5sum] = "b32b04148ecdd7344abc6fe8bd1bb021"
+SRC_URI[sha256sum] = "13df57ab63a94e196c5d6e95d64e53262834fe780d5e82c28f177f9f71ddf62e"
+PACKAGES =+ "libltdl libltdl-dev libltdl-dbg"
+FILES_${PN} += "${datadir}/aclocal*"
+FILES_libltdl = "${libdir}/libltdl.so.*"
+FILES_libltdl-dev = "${libdir}/libltdl.* ${includedir}/ltdl.h"
+FILES_libltdl-dbg = "${libdir}/.debug/"
+
+inherit autotools
+
+EXTRA_AUTORECONF = "--exclude=libtoolize"
+EXTRA_OECONF = " --with-sysroot"
+do_compile_prepend () {
+        # Sometimes this file doesn't get rebuilt, force the issue
+        rm -f ${S}/libltdl/config/ltmain.sh
+        make libltdl/config/ltmain.sh
+}
+
+#
+# We want the results of libtool-cross preserved - don't stage anything ourselves.
+#
+SYSROOT_PREPROCESS_FUNCS += "libtool_sysroot_preprocess"
+
+libtool_sysroot_preprocess () {
+        if [ "${PN}" == "libtool" ]; then
+                rm -rf ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${bindir}/*
+                rm -rf ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${datadir}/aclocal/*
+                rm -rf ${SYSROOT_DESTDIR}${STAGING_DIR_TARGET}${datadir}/libtool/config/*
+        fi
+}
+
-- 
1.7.1



