Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGZIp-0000S1-Lf
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2012 19:52:12 +0200
Received: by pbbro12 with SMTP id ro12so495622pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2012 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sUPKJSss9f+cI1/uFc8W4VbKQzyiPhOz7AZiVhvkaI8=;
	b=gm25/h3kMMjDnlbsMHA+T4sz8bRIbysk5a80q4koY28y/u9czfh90rLaGrTHrjKIj1
	W8lC5Bdur5vtuk6Y4EeMf7DSPkVQ8Wnuv6pi4FZ4u7fl+GrOmNGhwCPwUO00foNcdPGA
	+12zihFCBjI+kEV+RKfcYpM+rNw43uUfdobbPjB3yppczQt0Dx/Zl/kbpF9jRMpFJpfi
	gbBfl9rVRgrIMqL8LxxzhNeok7p8VHa4WOxZZmV62kDOrAkQye3rxwSQnyM3fsIELadx
	SLz071T/3yhQBqB+2F2q37456QJSHr6RsWUcNeAShHOnJxjrbs31qxtvLm+fIMwAe6X8
	Ua6w==
Received: by 10.68.224.161 with SMTP id rd1mr48799414pbc.49.1348594761533;
	Tue, 25 Sep 2012 10:39:21 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gt2sm627239pbc.62.2012.09.25.10.39.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 10:39:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Sep 2012 10:39:01 -0700
Message-Id: <1348594741-21920-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH] systemd: Upgrade past v191
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
X-List-Received-Date: Tue, 25 Sep 2012 17:52:12 -0000

Booted on eglibc/uclibc i586 systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emd-id128-internal.la-as-link-time-depend.patch |   41 ------
 .../systemd/systemd/optional_secure_getenv.patch   |  142 +++-----------------
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   39 +++---
 .../systemd/systemd/use-rootlibdir.patch           |   31 +++--
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    5 +-
 5 files changed, 60 insertions(+), 198 deletions(-)
 delete mode 100644 meta-systemd/recipes-core/systemd/systemd/0001-Add-libsystemd-id128-internal.la-as-link-time-depend.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/0001-Add-libsystemd-id128-internal.la-as-link-time-depend.patch b/meta-systemd/recipes-core/systemd/systemd/0001-Add-libsystemd-id128-internal.la-as-link-time-depend.patch
deleted file mode 100644
index be48909..0000000
--- a/meta-systemd/recipes-core/systemd/systemd/0001-Add-libsystemd-id128-internal.la-as-link-time-depend.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 547ca840ec640580d698c00758ecc177c22b0978 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Sep 2012 19:54:06 -0700
-Subject: [PATCH] Add libsystemd-id128-internal.la as link time dependency for
- test-engine and test_job_type
-
-Fixes linking errors like
-src/core/condition.c:207: undefined reference to `sd_id128_get_machine'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am |    6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7ccec67..304a990 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1137,7 +1137,8 @@ test_engine_CFLAGS = \
- test_engine_LDADD = \
- 	libsystemd-core.la \
- 	libsystemd-daemon.la \
--	libsystemd-dbus.la
-+	libsystemd-dbus.la \
-+	libsystemd-id128-internal.la
- 
- test_job_type_SOURCES = \
- 	src/test/test-job-type.c
-@@ -1148,7 +1149,8 @@ test_job_type_CFLAGS = \
- 
- test_job_type_LDADD = \
- 	libsystemd-core.la \
--	libsystemd-daemon.la
-+	libsystemd-daemon.la \
-+	libsystemd-id128-internal.la
- 
- test_ns_SOURCES = \
- 	src/test/test-ns.c
--- 
-1.7.9.5
-
diff --git a/meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch b/meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch
index 6657efd..35f1467 100644
--- a/meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch
+++ b/meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch
@@ -1,125 +1,19 @@
-Index: git/src/core/dbus.c
+on uclibc secure_getenv is not available
+therefore default to using getenv instead
+
+Singed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: git/src/shared/missing.h
 ===================================================================
---- git.orig/src/core/dbus.c	2012-09-07 19:08:00.287792474 -0700
-+++ git/src/core/dbus.c	2012-09-07 19:19:33.959818851 -0700
-@@ -955,12 +955,20 @@
- 
-         switch (type) {
-         case DBUS_BUS_SYSTEM:
-+#ifdef HAVE___SECURE_GETENV
-                 address = __secure_getenv("DBUS_SYSTEM_BUS_ADDRESS");
-+#else
-+		address = getenv("DBUS_SYSTEM_BUS_ADDRESS");
-+#endif
-                 if (!address || !address[0])
-                         address = DBUS_SYSTEM_BUS_DEFAULT_ADDRESS;
-                 break;
-         case DBUS_BUS_SESSION:
-+#ifdef HAVE___SECURE_GETENV
-                 address = __secure_getenv("DBUS_SESSION_BUS_ADDRESS");
-+#else
-+		address = getenv("DBUS_SESSION_BUS_ADDRESS");
-+#endif
-                 if (!address || !address[0])
-                         address = DBUS_SESSION_BUS_DEFAULT_ADDRESS;
-                 break;
-@@ -1076,8 +1084,11 @@
-         } else {
-                 const char *e;
-                 char *p;
--
-+#ifdef HAVE___SECURE_GETENV
-                 e = __secure_getenv("XDG_RUNTIME_DIR");
-+#else
-+		e = getenv("XDG_RUNTIME_DIR");
-+#endif
-                 if (!e)
-                         return 0;
- 
-Index: git/src/libudev/libudev.c
-===================================================================
---- git.orig/src/libudev/libudev.c	2012-09-07 19:08:00.319792476 -0700
-+++ git/src/libudev/libudev.c	2012-09-07 19:20:41.183821472 -0700
-@@ -191,7 +191,11 @@
-         }
- 
-         /* environment overrides config */
-+#ifdef HAVE___SECURE_GETENV
-         env = __secure_getenv("UDEV_LOG");
-+#else
-+	env = getenv("UDEV_LOG");
-+#endif
-         if (env != NULL)
-                 udev_set_log_priority(udev, util_log_priority(env));
- 
-Index: git/src/shared/dbus-common.c
-===================================================================
---- git.orig/src/shared/dbus-common.c	2012-09-07 19:08:00.331792476 -0700
-+++ git/src/shared/dbus-common.c	2012-09-07 19:21:37.787823562 -0700
-@@ -120,8 +120,11 @@
-                         /* If we are supposed to talk to the instance,
-                          * try via XDG_RUNTIME_DIR first, then
-                          * fallback to normal bus access */
--
-+#ifdef HAVE___SECURE_GETENV
-                         e = __secure_getenv("XDG_RUNTIME_DIR");
-+#else
-+			e = getenv("XDG_RUNTIME_DIR");
-+#endif
-                         if (e) {
-                                 char *p;
- 
-Index: git/src/shared/log.c
-===================================================================
---- git.orig/src/shared/log.c	2012-09-07 19:08:00.335792477 -0700
-+++ git/src/shared/log.c	2012-09-07 19:24:32.875830224 -0700
-@@ -803,20 +803,32 @@
- 
- void log_parse_environment(void) {
-         const char *e;
--
-+#ifdef HAVE___SECURE_GETENV
-         e = __secure_getenv("SYSTEMD_LOG_TARGET");
-+#else
-+	e = getenv("SYSTEMD_LOG_TARGET");
-+#endif
-         if (e && log_set_target_from_string(e) < 0)
-                 log_warning("Failed to parse log target %s. Ignoring.", e);
--
-+#ifdef HAVE___SECURE_GETENV
-         e = __secure_getenv("SYSTEMD_LOG_LEVEL");
-+#else
-+	e = getenv("SYSTEMD_LOG_LEVEL");
-+#endif
-         if (e && log_set_max_level_from_string(e) < 0)
-                 log_warning("Failed to parse log level %s. Ignoring.", e);
--
-+#ifdef HAVE___SECURE_GETENV
-         e = __secure_getenv("SYSTEMD_LOG_COLOR");
-+#else
-+	e = getenv("SYSTEMD_LOG_COLOR");
-+#endif
-         if (e && log_show_color_from_string(e) < 0)
-                 log_warning("Failed to parse bool %s. Ignoring.", e);
--
-+#ifdef HAVE___SECURE_GETENV
-         e = __secure_getenv("SYSTEMD_LOG_LOCATION");
-+#else
-+	e = getenv("SYSTEMD_LOG_LOCATION");
-+#endif
-         if (e && log_show_location_from_string(e) < 0)
-                 log_warning("Failed to parse bool %s. Ignoring.", e);
- }
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2012-09-07 19:08:25.103793418 -0700
-+++ git/configure.ac	2012-09-07 19:26:27.875834594 -0700
-@@ -65,7 +65,7 @@
- 
- # check for few functions not implemented in uClibc
- 
--AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate)
-+AC_CHECK_FUNCS_ONCE(mkostemp execvpe posix_fallocate __secure_getenv)
- 
- # check for %ms format support - assume always no if cross compiling
- 
+--- git.orig/src/shared/missing.h	2012-09-22 18:46:44.141282145 -0700
++++ git/src/shared/missing.h	2012-09-22 18:48:44.081276570 -0700
+@@ -233,6 +233,8 @@
+ #ifndef HAVE_SECURE_GETENV
+ #  ifdef HAVE___SECURE_GETENV
+ #    define secure_getenv __secure_getenv
++#  elif defined __UCLIBC__
++#    define secure_getenv getenv
+ #  else
+ #    error neither secure_getenv nor __secure_getenv are available
+ #  endif
diff --git a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
index ea8b3ff..449c27f 100644
--- a/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
+++ b/meta-systemd/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
@@ -1,29 +1,26 @@
---- systemd-pam-185/src/nspawn/nspawn.c.orig	2012-06-21 05:31:24.000000000 -0400
-+++ systemd-pam-185/src/nspawn/nspawn.c	2012-06-21 05:29:50.000000000 -0400
-@@ -61,6 +61,8 @@
- #include "path-util.h"
- #include "loopback-setup.h"
+Index: git/src/nspawn/nspawn.c
+===================================================================
+--- git.orig/src/nspawn/nspawn.c	2012-09-22 17:57:05.000000000 -0700
++++ git/src/nspawn/nspawn.c	2012-09-22 18:01:41.541405768 -0700
+@@ -63,6 +63,8 @@
+         LINK_GUEST
+ } LinkJournal;
  
 +#include "config.h"
 +
  static char *arg_directory = NULL;
  static char *arg_user = NULL;
  static char **arg_controllers = NULL;
-@@ -1315,9 +1317,14 @@
- 
-                         a[0] = (char*) "/sbin/init";
-                         execve(a[0], a, (char**) envp);
--                } else if (argc > optind)
--                        execvpe(argv[optind], argv + optind, (char**) envp);
--                else {
-+                } else if (argc > optind) {
+@@ -1373,7 +1375,12 @@
+                                 a[0] = (char*) "/sbin/init";
+                                 execve(a[0], a, (char**) envp);
+                         } else if (argc > optind)
 +#ifdef HAVE_EXECVPE
-+			execvpe(argv[optind], argv + optind, (char**) envp);
+                                 execvpe(argv[optind], argv + optind, (char**) envp);
 +#else
-+			environ = (char **)envp;
-+			execvp(argv[optind], argv + optind);
-+#endif	/* HAVE_EXECVPE */
-+		} else {
-                         chdir(home ? home : "/root");
-                         execle("/bin/bash", "-bash", NULL, (char**) envp);
-                 }
++                                environ = (char **)envp;
++                                execvp(argv[optind], argv + optind);
++#endif /* HAVE_EXECVPE */			
+                         else {
+                                 chdir(home ? home : "/root");
+                                 execle("/bin/bash", "-bash", NULL, (char**) envp);
diff --git a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
index 2167216..4c471b6 100644
--- a/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
+++ b/meta-systemd/recipes-core/systemd/systemd/use-rootlibdir.patch
@@ -11,17 +11,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Index: git/Makefile.am
 ===================================================================
---- git.orig/Makefile.am	2012-07-22 16:20:38.424405916 -0700
-+++ git/Makefile.am	2012-07-22 16:23:21.232406621 -0700
-@@ -61,23 +61,23 @@
+--- git.orig/Makefile.am	2012-09-22 11:07:58.811981199 -0700
++++ git/Makefile.am	2012-09-22 11:09:11.267983956 -0700
+@@ -64,25 +64,25 @@
  
  # Our own, non-special dirs
  pkgsysconfdir=$(sysconfdir)/systemd
 -userunitdir=$(prefix)/lib/systemd/user
+-userpresetdir=$(prefix)/lib/systemd/user-preset
 -tmpfilesdir=$(prefix)/lib/tmpfiles.d
 -sysctldir=$(prefix)/lib/sysctl.d
 -usergeneratordir=$(prefix)/lib/systemd/user-generators
 +userunitdir=$(prefix)/$(rootlibdir)/systemd/user
++userpresetdir=$(prefix)/$(rootlibdir)/systemd/user-preset
 +tmpfilesdir=$(prefix)/$(rootlibdir)/tmpfiles.d
 +sysctldir=$(prefix)/$(rootlibdir)/sysctl.d
 +usergeneratordir=$(prefix)/$(rootlibdir)/systemd/user-generators
@@ -30,8 +32,10 @@ Index: git/Makefile.am
  systemshutdowndir=$(rootlibexecdir)/system-shutdown
  systemsleepdir=$(rootlibexecdir)/system-sleep
 -systemunitdir=$(rootprefix)/lib/systemd/system
+-systempresetdir=$(rootprefix)/lib/systemd/system-preset
 -udevlibexecdir=$(rootprefix)/lib/udev
 +systemunitdir=$(rootprefix)/$(rootlibdir)/systemd/system
++systempresetdir=$(rootprefix)/$(rootlibdir)/systemd/system-preset
 +udevlibexecdir=$(rootprefix)/$(rootlibdir)/udev
  udevhomedir = $(udevlibexecdir)
  udevrulesdir = $(udevlibexecdir)/rules.d
@@ -42,9 +46,9 @@ Index: git/Makefile.am
 -rootlibexecdir=$(rootprefix)/lib/systemd
 +rootlibexecdir=$(rootprefix)/$(rootlibdir)/systemd
  
- CLEANFILES =
+ CLEANFILES = $(BUILT_SOURCES)
  EXTRA_DIST =
-@@ -126,7 +126,7 @@
+@@ -132,7 +132,7 @@
  	-DSYSTEMD_STDIO_BRIDGE_BINARY_PATH=\"$(bindir)/systemd-stdio-bridge\" \
  	-DROOTPREFIX=\"$(rootprefix)\" \
  	-DRUNTIME_DIR=\"/run\" \
@@ -53,7 +57,7 @@ Index: git/Makefile.am
  	-DSYSTEMD_CRYPTSETUP_PATH=\"$(rootlibexecdir)/systemd-cryptsetup\" \
  	-DSYSTEM_GENERATOR_PATH=\"$(systemgeneratordir)\" \
  	-DUSER_GENERATOR_PATH=\"$(usergeneratordir)\" \
-@@ -2535,7 +2535,7 @@
+@@ -2692,7 +2692,7 @@
  
  binfmt-install-data-hook:
  	$(MKDIR_P) -m 0755 \
@@ -62,7 +66,16 @@ Index: git/Makefile.am
  		$(DESTDIR)$(sysconfdir)/binfmt.d \
  		$(DESTDIR)$(systemunitdir)/sysinit.target.wants
  	( cd $(DESTDIR)$(systemunitdir)/sysinit.target.wants && \
-@@ -3165,7 +3165,7 @@
+@@ -3107,7 +3107,7 @@
+ 
+ timedated-install-data-hook:
+ 	$(MKDIR_P) -m 0755 \
+-		$(DESTDIR)$(prefix)/lib/systemd/ntp-units.d \
++		$(DESTDIR)$(prefix)/$(rootlibdir)/systemd/ntp-units.d \
+ 		$(DESTDIR)$(sysconfdir)/systemd/ntp-units.d
+ 	( cd $(DESTDIR)$(systemunitdir) && \
+ 		rm -f dbus-org.freedesktop.timedate1.service  && \
+@@ -3337,7 +3337,7 @@
  logind-install-data-hook:
  	$(MKDIR_P) -m 0755 \
  		$(DESTDIR)$(systemunitdir)/multi-user.target.wants \
@@ -71,7 +84,7 @@ Index: git/Makefile.am
  	( cd $(DESTDIR)$(systemunitdir) && \
  		rm -f dbus-org.freedesktop.login1.service && \
  		$(LN_S) systemd-logind.service dbus-org.freedesktop.login1.service)
-@@ -3284,7 +3284,7 @@
+@@ -3494,7 +3494,7 @@
  		-e 's,@PACKAGE_VERSION\@,$(PACKAGE_VERSION),g' \
  		-e 's,@PACKAGE_NAME\@,$(PACKAGE_NAME),g' \
  		-e 's,@PACKAGE_URL\@,$(PACKAGE_URL),g' \
@@ -80,7 +93,7 @@ Index: git/Makefile.am
  		-e 's,@prefix\@,$(prefix),g' \
  		-e 's,@exec_prefix\@,$(exec_prefix),g' \
  		-e 's,@libdir\@,$(libdir),g' \
-@@ -3407,9 +3407,9 @@
+@@ -3619,9 +3619,9 @@
  	$(MKDIR_P) -m 0755 \
  		$(DESTDIR)$(tmpfilesdir) \
  		$(DESTDIR)$(sysconfdir)/tmpfiles.d \
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 98b098f..259da56 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -23,11 +23,9 @@ PR = "r7"
 
 inherit useradd pkgconfig autotools perlnative
 
-SRCREV = "cb273c51eaf622b1e92d5ca0656b06073cb02da2"
-
+SRCREV = "31c460208d92f90f5d1d9253a9c60a8bb75ff5da"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://use-rootlibdir.patch \
-           file://0001-Add-libsystemd-id128-internal.la-as-link-time-depend.patch \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
@@ -41,6 +39,7 @@ UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
                              file://systemd-pam-fix-getty-unit.patch \
                              file://systemd-pam-fix-mkostemp.patch \
                              file://systemd-pam-fix-msformat.patch \
+                             file://optional_secure_getenv.patch \
                             "
 LDFLAGS_libc-uclibc_append = " -lrt"
 
-- 
1.7.9.5



