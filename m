Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OJuj1-00030l-1R
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:39:45 +0200
Received: by pvc30 with SMTP id 30so2440067pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 13:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=0esjVgNCo4ezon6uX8TM3UhYu3dU4dNMcUueBz1pewM=;
	b=Q4eRP3oX0aL8iex+8yprtuTtVNfQOKvgXuRbXFJX8l1VsFrPrZrbwoV9r7Z4Yja3jj
	BPXz4XOR4/70lyReDizPzwFEuOyMv43rwV2Xx10ILVfI+1cYDyUtPiyZ8Na3QHCXrp0y
	l6BuI6xSDMQqGS/sflNSR6BvwctXWhjw1vfjY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=rqxZKSVuLpwmUZoDpVFEjksfBUVro+jD6uNsUsGDzS6Y7/cxg58kh9jT5fPV0g7QzA
	SNFJFClcPvRcyPzfQvBc01KJvp3hxZ8l6si5EmFFA5AkmjZwXMZ93/Yb2ZzYLsrhoDvU
	19X0wWUbdWl0SyvNTeBdYZVlA03beo/XgyIac=
Received: by 10.142.4.31 with SMTP id 31mr5410100wfd.255.1275510927146;
	Wed, 02 Jun 2010 13:35:27 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 20sm5942447pzk.7.2010.06.02.13.35.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 02 Jun 2010 13:35:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jun 2010 13:34:43 -0700
Message-Id: <1275510896-30845-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/16] gettext-0.18: Add recipe for 0.18
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
X-List-Received-Date: Wed, 02 Jun 2010 20:39:45 -0000

* gl_cv_func_unsetenv_works is not computed correctly in cross
  environment so cache it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gettext/gettext-0.18/autotools.patch       |   28 ++++++++++
 .../gettext-autoconf-lib-link-no-L.patch           |   28 ++++++++++
 .../gettext-error_print_progname.patch             |   13 +++++
 .../gnulib-uclibc-sched_param-def.patch            |   19 +++++++
 recipes/gettext/gettext_0.18.bb                    |   57 ++++++++++++++++++++
 site/common-glibc                                  |    3 +
 6 files changed, 148 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gettext/gettext-0.18/autotools.patch
 create mode 100644 recipes/gettext/gettext-0.18/gettext-autoconf-lib-link-no-L.patch
 create mode 100644 recipes/gettext/gettext-0.18/gettext-error_print_progname.patch
 create mode 100644 recipes/gettext/gettext-0.18/gnulib-uclibc-sched_param-def.patch
 create mode 100644 recipes/gettext/gettext_0.18.bb

diff --git a/recipes/gettext/gettext-0.18/autotools.patch b/recipes/gettext/gettext-0.18/autotools.patch
new file mode 100644
index 0000000..8302b34
--- /dev/null
+++ b/recipes/gettext/gettext-0.18/autotools.patch
@@ -0,0 +1,28 @@
+Index: gettext-0.18/gettext-runtime/man/Makefile.am
+===================================================================
+--- gettext-0.18.orig/gettext-runtime/man/Makefile.am	2009-06-28 12:44:04.000000000 -0700
++++ gettext-0.18/gettext-runtime/man/Makefile.am	2010-05-18 16:58:51.130518057 -0700
+@@ -159,8 +159,7 @@ bind_textdomain_codeset.3.html: bind_tex
+ 	$(MAN2HTML) $(srcdir)/bind_textdomain_codeset.3.in | sed -e '/CreationDate:/d' > t-$@
+ 	mv t-$@ $@
+ 
+-install-html-local:
+-	$(mkdir_p) $(DESTDIR)$(htmldir)
++install-html: installdirs-html
+ 	for file in $(man_HTML); do \
+ 	  if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
+ 	  $(INSTALL_DATA) $$dir/$$file $(DESTDIR)$(htmldir)/$$file; \
+Index: gettext-0.18/gettext-tools/man/Makefile.am
+===================================================================
+--- gettext-0.18.orig/gettext-tools/man/Makefile.am	2009-06-28 12:44:04.000000000 -0700
++++ gettext-0.18/gettext-tools/man/Makefile.am	2010-05-18 16:58:51.130518057 -0700
+@@ -186,8 +186,7 @@ autopoint.1.html: autopoint.1
+ 	$(MAN2HTML) `if test -f autopoint.1; then echo .; else echo $(srcdir); fi`/autopoint.1 | sed -e '/CreationDate:/d' > t-$@
+ 	mv t-$@ $@
+ 
+-install-html-local:
+-	$(mkdir_p) $(DESTDIR)$(htmldir)
++install-html: installdirs-html
+ 	for file in $(man_HTML); do \
+ 	  if test -f $$file; then dir=.; else dir=$(srcdir); fi; \
+ 	  $(INSTALL_DATA) $$dir/$$file $(DESTDIR)$(htmldir)/$$file; \
diff --git a/recipes/gettext/gettext-0.18/gettext-autoconf-lib-link-no-L.patch b/recipes/gettext/gettext-0.18/gettext-autoconf-lib-link-no-L.patch
new file mode 100644
index 0000000..d2063b0
--- /dev/null
+++ b/recipes/gettext/gettext-0.18/gettext-autoconf-lib-link-no-L.patch
@@ -0,0 +1,28 @@
+Index: gettext-0.18/gettext-runtime/gnulib-m4/lib-link.m4
+===================================================================
+--- gettext-0.18.orig/gettext-runtime/gnulib-m4/lib-link.m4	2010-05-18 17:12:12.593014616 -0700
++++ gettext-0.18/gettext-runtime/gnulib-m4/lib-link.m4	2010-05-18 17:12:58.631176939 -0700
+@@ -312,6 +312,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
+               fi
+             fi
+           fi
++          dnl Just let the compiler find the library, the compiler and user are smarter then this script
++          dnl when cross compiling and working with a relocated install.
++          found_dir=""
+           if test "X$found_dir" = "X"; then
+             for x in $LDFLAGS $LTLIB[]NAME; do
+               AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+Index: gettext-0.18/gettext-tools/gnulib-m4/lib-link.m4
+===================================================================
+--- gettext-0.18.orig/gettext-tools/gnulib-m4/lib-link.m4	2010-05-18 17:12:12.633052946 -0700
++++ gettext-0.18/gettext-tools/gnulib-m4/lib-link.m4	2010-05-18 17:13:35.020559106 -0700
+@@ -312,6 +312,9 @@ AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
+               fi
+             fi
+           fi
++          dnl Just let the compiler find the library, the compiler and user are smarter then this script
++          dnl when cross compiling and working with a relocated install.
++          found_dir=""
+           if test "X$found_dir" = "X"; then
+             for x in $LDFLAGS $LTLIB[]NAME; do
+               AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
diff --git a/recipes/gettext/gettext-0.18/gettext-error_print_progname.patch b/recipes/gettext/gettext-0.18/gettext-error_print_progname.patch
new file mode 100644
index 0000000..0f67cd0
--- /dev/null
+++ b/recipes/gettext/gettext-0.18/gettext-error_print_progname.patch
@@ -0,0 +1,13 @@
+Index: gettext-0.17/gettext-tools/libgettextpo/error.h
+===================================================================
+--- gettext-0.17.orig/gettext-tools/libgettextpo/error.h	2008-07-27 21:16:25.561115527 +0200
++++ gettext-0.17/gettext-tools/libgettextpo/error.h	2008-07-27 21:16:52.454440505 +0200
+@@ -49,7 +49,7 @@
+ /* If NULL, error will flush stdout, then print on stderr the program
+    name, a colon and a space.  Otherwise, error will call this
+    function without parameters instead.  */
+-extern DLL_VARIABLE void (*error_print_progname) (void);
++void (*error_print_progname) (void);
+ 
+ /* This variable is incremented each time `error' is called.  */
+ extern DLL_VARIABLE unsigned int error_message_count;
diff --git a/recipes/gettext/gettext-0.18/gnulib-uclibc-sched_param-def.patch b/recipes/gettext/gettext-0.18/gnulib-uclibc-sched_param-def.patch
new file mode 100644
index 0000000..074723a
--- /dev/null
+++ b/recipes/gettext/gettext-0.18/gnulib-uclibc-sched_param-def.patch
@@ -0,0 +1,19 @@
+uclibc defines __GLIBC__ but it does not expose struct shed_param as much as glibc
+and is not needed too per standard. gnulib attempts to use it but we have to account
+for it because in this case uclibc does not behave like glibc.
+
+-Khem
+
+Index: gettext-0.18/gettext-tools/gnulib-lib/spawn.in.h
+===================================================================
+--- gettext-0.18.orig/gettext-tools/gnulib-lib/spawn.in.h	2010-06-01 17:20:09.036427575 -0700
++++ gettext-0.18/gettext-tools/gnulib-lib/spawn.in.h	2010-06-01 17:20:38.856613943 -0700
+@@ -31,7 +31,7 @@
+ 
+ /* Get definitions of 'struct sched_param' and 'sigset_t'.
+    But avoid namespace pollution on glibc systems.  */
+-#ifndef __GLIBC__
++#if !defined __GLIBC__ || defined __UCLIBC__
+ # include <sched.h>
+ # include <signal.h>
+ #endif
diff --git a/recipes/gettext/gettext_0.18.bb b/recipes/gettext/gettext_0.18.bb
new file mode 100644
index 0000000..5e22b5a
--- /dev/null
+++ b/recipes/gettext/gettext_0.18.bb
@@ -0,0 +1,57 @@
+DESCRIPTION = "The GNU internationalization library."
+HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
+SECTION = "libs"
+LICENSE = "GPLv3"
+PR = "r0"
+DEPENDS = "gettext-native virtual/libiconv ncurses expat"
+DEPENDS_virtclass-native = "libxml2-native"
+PROVIDES = "virtual/libintl"
+PROVIDES_virtclass-native = ""
+RCONFLICTS_gettext-libintl = "proxy-libintl"
+
+BBCLASSEXTEND = "native nativesdk"
+
+SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
+           file://autotools.patch \
+           file://gettext-autoconf-lib-link-no-L.patch \
+	   file://gnulib-uclibc-sched_param-def.patch \
+	  "
+
+SRC_URI_append_libc-uclibc = " file://gettext-error_print_progname.patch"
+
+PARALLEL_MAKE = ""
+
+inherit autotools
+
+EXTRA_OECONF += "--without-lispdir \
+		 --disable-csharp \
+		 --disable-libasprintf \
+		 --disable-java \
+		 --disable-native-java \
+		 --disable-openmp \
+		 --with-included-glib \
+		 --without-emacs \
+	        "
+acpaths = '-I ${S}/gnulib-local/m4/ \
+	   -I ${S}/gettext-runtime/m4 \
+	   -I ${S}/gettext-tools/m4'
+
+
+# these lack the .x behind the .so, but shouldn't be in the -dev package
+# Otherwise you get the following results:
+# 7.4M    glibc/images/ep93xx/Angstrom-console-image-glibc-ipk-2008.1-test-20080104-ep93xx.rootfs.tar.gz
+# 25M     uclibc/images/ep93xx/Angstrom-console-image-uclibc-ipk-2008.1-test-20080104-ep93xx.rootfs.tar.gz
+# because gettext depends on gettext-dev, which pulls in more -dev packages:
+# 15228   KiB /ep93xx/libstdc++-dev_4.2.2-r2_ep93xx.ipk
+# 1300    KiB /ep93xx/uclibc-dev_0.9.29-r8_ep93xx.ipk
+# 140     KiB /armv4t/gettext-dev_0.14.1-r6_armv4t.ipk
+# 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
+
+PACKAGES =+ "gettext-libintl libgettextlib libgettextsrc"
+
+FILES_gettext-libintl = "${libdir}/libintl*.so.*"
+FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
+FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
+
+SRC_URI[md5sum] = "d52a3e061032a1ed13856d42fc86f0fd"
+SRC_URI[sha256sum] = "02342c1de18c03c601f8b91cbd896b70486a4b945bd816f34541e0d7b5a96fe5"
diff --git a/site/common-glibc b/site/common-glibc
index b298e46..6dc2363 100644
--- a/site/common-glibc
+++ b/site/common-glibc
@@ -22,6 +22,9 @@ ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
 glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
 glib_cv_long_long_format=${glib_cv_long_long_format=ll}
 
+# gettext
+gl_cv_func_unsetenv_works=${gl_cv_func_unsetenv_works=yes}
+
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 
-- 
1.7.0.4



