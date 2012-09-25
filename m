Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGZN8-0000aC-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Sep 2012 19:56:39 +0200
Received: by padfa11 with SMTP id fa11so1610684pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2012 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=twBOL2OO+zT3IbFmLoRrejCGADu8gU41ctzTmYDD4pE=;
	b=oJrubFopYKIo23limgv/cKymJMUBzStR/qzE2A/kJzyfZOVVzDs48H6d7xjcilFdkX
	dmkr+AWeVm0fLcwtJx6BGyFX9JB/6dEXziLy7NVIWCaOwnlwqrLRvips1vw2GgNQIFXd
	7JGj2cuv9Q7P+aZWgNhWhNp0c3SR0AqsKRig30WxPMP3/PPU6nzdLp02NwRAjpwmLGyj
	Ygxl2HGt/zIkzzXxtVxVH5aCbY8zyRv64E2kQ+2FHkDfbDzzhU2KMj5Kr5+sI9kRJ60v
	mdAGE3KlnrJ0S4kEPb9t1mr1/87W8cPg5rQyMc0eB4XRTaZUq9QuFHBUbAt+6DKDLT6Z
	SRQw==
Received: by 10.68.196.169 with SMTP id in9mr46227734pbc.70.1348595028855;
	Tue, 25 Sep 2012 10:43:48 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id bn5sm472287pab.12.2012.09.25.10.43.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 10:43:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Sep 2012 10:43:38 -0700
Message-Id: <1348595018-27413-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH V2] systemd: Upgrade past v191
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
X-List-Received-Date: Tue, 25 Sep 2012 17:56:39 -0000

Booted on eglibc/uclibc i586 systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd/optional_secure_getenv.patch   |   19 ++++++++++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   39 +++++++++-----------
 .../systemd/systemd/use-rootlibdir.patch           |   31 +++++++++++-----
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    4 +-
 4 files changed, 61 insertions(+), 32 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch

diff --git a/meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch b/meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch
new file mode 100644
index 0000000..35f1467
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/optional_secure_getenv.patch
@@ -0,0 +1,19 @@
+on uclibc secure_getenv is not available
+therefore default to using getenv instead
+
+Singed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: git/src/shared/missing.h
+===================================================================
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
index 337424e..259da56 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -23,8 +23,7 @@ PR = "r7"
 
 inherit useradd pkgconfig autotools perlnative
 
-SRCREV = "38a60d7112d33ffd596b23e8df53d75a7c09e71b"
-
+SRCREV = "31c460208d92f90f5d1d9253a9c60a8bb75ff5da"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://use-rootlibdir.patch \
            file://gtk-doc.make \
@@ -40,6 +39,7 @@ UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
                              file://systemd-pam-fix-getty-unit.patch \
                              file://systemd-pam-fix-mkostemp.patch \
                              file://systemd-pam-fix-msformat.patch \
+                             file://optional_secure_getenv.patch \
                             "
 LDFLAGS_libc-uclibc_append = " -lrt"
 
-- 
1.7.9.5



