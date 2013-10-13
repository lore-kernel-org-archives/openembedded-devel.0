Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 58D936CF9C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 08:44:11 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id bj1so6288108pad.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uXC3rDKorHbKQTkTlkmoZNNWso3BEpCY/8q3nbIYGmY=;
	b=qxPsLDoo6yB5kXUgKUp7YsaRoOWgP8aDeF7inKERzyxu8gyckrdO8d9dhIpplFQ2wM
	G9hzvMG6NtJXK5lmJjcXtA/FnCYpbWetWMBKxR3zCm9vJJUpsoL6BgikGsrm2uEczyW2
	TmXkxn7KJ32hMLABswdjMM+PoyV5+iJzDqiY2IADltcmHz7jmeecl/kVDWoBtcgdFcCS
	YFfgZ3woYn3W3fjdn+gjuvWc6AecSz6e7ioYlKNfZ3mo1RpFLb2GLzAsXD0ueWypioT2
	dnp7WQf+RCJYC8deMxtlNMRXy1hE9mgUBiK1Ne4k+pabkltybJ8/IzBCQWyoOLN9KJ29
	t/uA==
X-Received: by 10.66.119.136 with SMTP id ku8mr31662241pab.121.1381653853222; 
	Sun, 13 Oct 2013 01:44:13 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id l8sm70753592pbl.22.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 01:44:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:43:53 -0700
Message-Id: <1381653835-32079-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/6] libmikmod: Upgrade libmikmod_3.2.0.bb -> libmikmod_3.3.2.bb
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
X-List-Received-Date: Sun, 13 Oct 2013 08:44:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mikmod/libmikmod/autofoo.patch                 |  16 --
 .../mikmod/libmikmod/ldflags.patch                 |  12 --
 .../recipes-multimedia/mikmod/libmikmod/m4.patch   | 197 ---------------------
 .../libmikmod/obsolete_automake_macros.patch       |  15 --
 .../{libmikmod_3.2.0.bb => libmikmod_3.3.2.bb}     |   9 +-
 5 files changed, 2 insertions(+), 247 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
 delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
 delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
 delete mode 100644 meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch
 rename meta-oe/recipes-multimedia/mikmod/{libmikmod_3.2.0.bb => libmikmod_3.3.2.bb} (68%)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch b/meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
deleted file mode 100644
index 22d8170..0000000
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod/autofoo.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- libmikmod-3.2.0-beta2/configure.in~autofoo
-+++ libmikmod-3.2.0-beta2/configure.in
-@@ -415,8 +415,6 @@
- 
- AC_CHECK_FUNCS(setenv snprintf srandom)
- AC_REPLACE_FUNCS(strcasecmp strdup strstr)
--# Change extension, as we use libtool
--LIBOBJS="`echo $LIBOBJS|sed -e 's/\.o/\.lo/g'`"
- 
- AC_HEADER_EGREP(srandom,math.h,AC_DEFINE(SRANDOM_IN_MATH_H))
- 
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch b/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
deleted file mode 100644
index de31139..0000000
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod/ldflags.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN libmikmod-3.1.12.orig/libmikmod/Makefile.in libmikmod-3.1.12/libmikmod/Makefile.in
---- libmikmod-3.1.12.orig/libmikmod/Makefile.in	2004-01-21 17:43:52.000000000 +0000
-+++ libmikmod-3.1.12/libmikmod/Makefile.in	2009-04-02 11:28:01.000000000 +0000
-@@ -72,7 +72,7 @@
- 	rm -f Makefile
- 
- $(LIB): $(OBJ)
--	$(LIBTOOL) --mode=link $(CC) -version-info 3:0:0 -o $@ $(OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
-+	$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -version-info 3:0:0 -o $@ $(OBJ) $(LIBRARY_LIB) -rpath $(DESTDIR)$(libdir)
- 
- dl_hpux.lo:	$(top_srcdir)/dlapi/dl_hpux.c \
- 			$(top_srcdir)/dlapi/dlfcn.h
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch b/meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
deleted file mode 100644
index ac7f2d7..0000000
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod/m4.patch
+++ /dev/null
@@ -1,197 +0,0 @@
---- /dev/null
-+++ libmikmod-3.2.0-beta2/m4/esd.m4
-@@ -0,0 +1,194 @@
-+# Configure paths for ESD
-+# Manish Singh    98-9-30
-+# stolen back from Frank Belew
-+# stolen from Manish Singh
-+# Shamelessly stolen from Owen Taylor
-+
-+dnl AM_PATH_ESD([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
-+dnl Test for ESD, and define ESD_CFLAGS and ESD_LIBS
-+dnl
-+AC_DEFUN(AM_PATH_ESD,
-+[dnl 
-+dnl Get the cflags and libraries from the esd-config script
-+dnl
-+AC_ARG_WITH(esd-prefix,[  --with-esd-prefix=PFX   Prefix where ESD is installed (optional)],
-+            esd_prefix="$withval", esd_prefix="")
-+AC_ARG_WITH(esd-exec-prefix,[  --with-esd-exec-prefix=PFX Exec prefix where ESD is installed (optional)],
-+            esd_exec_prefix="$withval", esd_exec_prefix="")
-+AC_ARG_ENABLE(esdtest, [  --disable-esdtest       Do not try to compile and run a test ESD program],
-+		    , enable_esdtest=yes)
-+
-+  if test x$esd_exec_prefix != x ; then
-+     esd_args="$esd_args --exec-prefix=$esd_exec_prefix"
-+     if test x${ESD_CONFIG+set} != xset ; then
-+        ESD_CONFIG=$esd_exec_prefix/bin/esd-config
-+     fi
-+  fi
-+  if test x$esd_prefix != x ; then
-+     esd_args="$esd_args --prefix=$esd_prefix"
-+     if test x${ESD_CONFIG+set} != xset ; then
-+        ESD_CONFIG=$esd_prefix/bin/esd-config
-+     fi
-+  fi
-+
-+  AC_PATH_PROG(ESD_CONFIG, esd-config, no)
-+  min_esd_version=ifelse([$1], ,0.2.7,$1)
-+  AC_MSG_CHECKING(for ESD - version >= $min_esd_version)
-+  no_esd=""
-+  if test "$ESD_CONFIG" = "no" ; then
-+    no_esd=yes
-+  else
-+    AC_LANG_SAVE
-+    AC_LANG_C
-+    ESD_CFLAGS=`$ESD_CONFIG $esdconf_args --cflags`
-+    ESD_LIBS=`$ESD_CONFIG $esdconf_args --libs`
-+
-+    esd_major_version=`$ESD_CONFIG $esd_args --version | \
-+           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
-+    esd_minor_version=`$ESD_CONFIG $esd_args --version | \
-+           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
-+    esd_micro_version=`$ESD_CONFIG $esd_config_args --version | \
-+           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
-+    if test "x$enable_esdtest" = "xyes" ; then
-+      ac_save_CFLAGS="$CFLAGS"
-+      ac_save_LIBS="$LIBS"
-+      CFLAGS="$CFLAGS $ESD_CFLAGS"
-+      LIBS="$LIBS $ESD_LIBS"
-+dnl
-+dnl Now check if the installed ESD is sufficiently new. (Also sanity
-+dnl checks the results of esd-config to some extent
-+dnl
-+      rm -f conf.esdtest
-+      AC_TRY_RUN([
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <esd.h>
-+
-+char*
-+my_strdup (char *str)
-+{
-+  char *new_str;
-+  
-+  if (str)
-+    {
-+      new_str = malloc ((strlen (str) + 1) * sizeof(char));
-+      strcpy (new_str, str);
-+    }
-+  else
-+    new_str = NULL;
-+  
-+  return new_str;
-+}
-+
-+int main ()
-+{
-+  int major, minor, micro;
-+  char *tmp_version;
-+
-+  system ("touch conf.esdtest");
-+
-+  /* HP/UX 9 (%@#!) writes to sscanf strings */
-+  tmp_version = my_strdup("$min_esd_version");
-+  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
-+     printf("%s, bad version string\n", "$min_esd_version");
-+     exit(1);
-+   }
-+
-+   if (($esd_major_version > major) ||
-+      (($esd_major_version == major) && ($esd_minor_version > minor)) ||
-+      (($esd_major_version == major) && ($esd_minor_version == minor) && ($esd_micro_version >= micro)))
-+    {
-+      return 0;
-+    }
-+  else
-+    {
-+      printf("\n*** 'esd-config --version' returned %d.%d.%d, but the minimum version\n", $esd_major_version, $esd_minor_version, $esd_micro_version);
-+      printf("*** of ESD required is %d.%d.%d. If esd-config is correct, then it is\n", major, minor, micro);
-+      printf("*** best to upgrade to the required version.\n");
-+      printf("*** If esd-config was wrong, set the environment variable ESD_CONFIG\n");
-+      printf("*** to point to the correct copy of esd-config, and remove the file\n");
-+      printf("*** config.cache before re-running configure\n");
-+      return 1;
-+    }
-+}
-+
-+],, no_esd=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
-+       CFLAGS="$ac_save_CFLAGS"
-+       LIBS="$ac_save_LIBS"
-+       AC_LANG_RESTORE
-+     fi
-+  fi
-+  if test "x$no_esd" = x ; then
-+     AC_MSG_RESULT(yes)
-+     ifelse([$2], , :, [$2])     
-+  else
-+     AC_MSG_RESULT(no)
-+     if test "$ESD_CONFIG" = "no" ; then
-+       echo "*** The esd-config script installed by ESD could not be found"
-+       echo "*** If ESD was installed in PREFIX, make sure PREFIX/bin is in"
-+       echo "*** your path, or set the ESD_CONFIG environment variable to the"
-+       echo "*** full path to esd-config."
-+     else
-+       if test -f conf.esdtest ; then
-+        :
-+       else
-+          echo "*** Could not run ESD test program, checking why..."
-+          CFLAGS="$CFLAGS $ESD_CFLAGS"
-+          LIBS="$LIBS $ESD_LIBS"
-+          AC_LANG_SAVE
-+          AC_LANG_C
-+          AC_TRY_LINK([
-+#include <stdio.h>
-+#include <esd.h>
-+],      [ return 0; ],
-+        [ echo "*** The test program compiled, but did not run. This usually means"
-+          echo "*** that the run-time linker is not finding ESD or finding the wrong"
-+          echo "*** version of ESD. If it is not finding ESD, you'll need to set your"
-+          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
-+          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
-+          echo "*** is required on your system"
-+	  echo "***"
-+          echo "*** If you have an old version installed, it is best to remove it, although"
-+          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"],
-+        [ echo "*** The test program failed to compile or link. See the file config.log for the"
-+          echo "*** exact error that occured. This usually means ESD was incorrectly installed"
-+          echo "*** or that you have moved ESD since it was installed. In the latter case, you"
-+          echo "*** may want to edit the esd-config script: $ESD_CONFIG" ])
-+          CFLAGS="$ac_save_CFLAGS"
-+          LIBS="$ac_save_LIBS"
-+          AC_LANG_RESTORE
-+       fi
-+     fi
-+     ESD_CFLAGS=""
-+     ESD_LIBS=""
-+     ifelse([$3], , :, [$3])
-+  fi
-+  AC_SUBST(ESD_CFLAGS)
-+  AC_SUBST(ESD_LIBS)
-+  rm -f conf.esdtest
-+])
-+
-+dnl AM_ESD_SUPPORTS_MULTIPLE_RECORD([ACTION-IF-SUPPORTS [, ACTION-IF-NOT-SUPPORTS]])
-+dnl Test, whether esd supports multiple recording clients (version >=0.2.21)
-+dnl
-+AC_DEFUN(AM_ESD_SUPPORTS_MULTIPLE_RECORD,
-+[dnl
-+  AC_MSG_NOTICE([whether installed esd version supports multiple recording clients])
-+  ac_save_ESD_CFLAGS="$ESD_CFLAGS"
-+  ac_save_ESD_LIBS="$ESD_LIBS"
-+  AM_PATH_ESD(0.2.21,
-+    ifelse([$1], , [
-+      AM_CONDITIONAL(ESD_SUPPORTS_MULTIPLE_RECORD, true)
-+      AC_DEFINE(ESD_SUPPORTS_MULTIPLE_RECORD, 1,
-+	[Define if you have esound with support of multiple recording clients.])],
-+    [$1]),
-+    ifelse([$2], , [AM_CONDITIONAL(ESD_SUPPORTS_MULTIPLE_RECORD, false)], [$2])
-+    if test "x$ac_save_ESD_CFLAGS" != x ; then
-+       ESD_CFLAGS="$ac_save_ESD_CFLAGS"
-+    fi
-+    if test "x$ac_save_ESD_LIBS" != x ; then
-+       ESD_LIBS="$ac_save_ESD_LIBS"
-+    fi
-+  )
-+])
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch b/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch
deleted file mode 100644
index 082bb04..0000000
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted (https://sourceforge.net/tracker/?func=detail&aid=3599281&group_id=40531&atid=428227)
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libmikmod-3.1.12/configure.in libmikmod-3.1.12/configure.in
---- libmikmod-3.1.12/configure.in	2007-12-15 11:22:57.000000000 +0200
-+++ libmikmod-3.1.12/configure.in	2013-01-03 07:26:10.662775603 +0200
-@@ -13,7 +13,7 @@
- LIBMIKMOD_VERSION=$LIBMIKMOD_MAJOR_VERSION.$LIBMIKMOD_MINOR_VERSION.$LIBMIKMOD_MICRO_VERSION$BETA
-
- AM_INIT_AUTOMAKE(libmikmod,$LIBMIKMOD_VERSION)
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- AM_MAINTAINER_MODE
-
- # ==============================================================
diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
similarity index 68%
rename from meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb
rename to meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
index b1ebf97..4ab293f 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.2.0.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.2.bb
@@ -7,14 +7,9 @@ DEPENDS = "alsa-lib texinfo"
 
 SRC_URI = "\
     http://mikmod.shlomifish.org/files/${P}.tar.gz \
-    file://m4.patch \
-    file://autofoo.patch \
-    file://ldflags.patch \
-    file://obsolete_automake_macros.patch \
 "
-
-SRC_URI[md5sum] = "96e9820d72a41fe27ff304071739696c"
-SRC_URI[sha256sum] = "734c8490bbf9b0c587920b92414dcfa3c2267838a0cdf698d5f1fb6bba8f661e"
+SRC_URI[md5sum] = "60ac77a804d082230df3009af11ef44f"
+SRC_URI[sha256sum] = "2311b209255bf24e95161907a16778cb054ac6d447fd8d05f1f0e41a555c7580"
 
 inherit autotools binconfig lib_package
 
-- 
1.8.3.2


