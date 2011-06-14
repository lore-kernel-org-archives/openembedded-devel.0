Received: from outbound.icp-qv1-irony-out4.iinet.net.au ([203.59.1.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1QWOTV-0000nX-7u
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 09:55:50 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av0EABcS903LO4Se/2dsb2JhbABSpjd3x2GGJASHE48oin4
X-IronPort-AV: E=Sophos;i="4.65,363,1304265600"; d="scan'208";a="661010412"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-qv1-irony-out4.iinet.net.au with ESMTP;
	14 Jun 2011 15:49:17 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2011 15:49:43 +0800
Message-Id: <1308037783-31218-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Cc: James Limbouris <james@digitalmatter.com.au>
Subject: [PATCH] prelink: Added prelink-20100106, which works on ARM.
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
X-List-Received-Date: Tue, 14 Jun 2011 07:55:50 -0000

This version of prelink, together with a patch by
Carsten Munk <carsten@maemo.org>, taken from MeeGo,
fixes an ARM incompatibility with 20090925.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 .../prelink-20100106-arm-fix.patch                 |   86 ++++++++++++++++++++
 recipes/prelink/prelink_20100106.bb                |   53 ++++++++++++
 2 files changed, 139 insertions(+), 0 deletions(-)
 create mode 100755 recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
 create mode 100644 recipes/prelink/prelink_20100106.bb

diff --git a/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch b/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
new file mode 100755
index 0000000..a694541
--- /dev/null
+++ b/recipes/prelink/prelink-20100106/prelink-20100106-arm-fix.patch
@@ -0,0 +1,86 @@
+diff -ru prelink-old/src/arch-arm.c prelink/src/arch-arm.c
+--- prelink-old/src/arch-arm.c	2009-06-15 07:37:50.000000000 -0400
++++ prelink/src/arch-arm.c	2010-08-17 03:35:05.000000000 -0400
+@@ -832,7 +832,7 @@
+   .R_COPY = R_ARM_COPY,
+   .R_RELATIVE = R_ARM_RELATIVE,
+   .rtype_class_valid = RTYPE_CLASS_VALID,
+-  .dynamic_linker = "/lib/ld-linux.so.2",
++  .dynamic_linker = "/lib/ld-linux.so.3",
+   .adjust_dyn = arm_adjust_dyn,
+   .adjust_rel = arm_adjust_rel,
+   .adjust_rela = arm_adjust_rela,
+diff -ru prelink-old/src/execle_open.c prelink/src/execle_open.c
+--- prelink-old/src/execle_open.c	2006-08-13 11:18:17.000000000 -0400
++++ prelink/src/execle_open.c	2010-08-18 03:52:51.000000000 -0400
+@@ -21,6 +21,7 @@
+ #include <stdio.h>
+ #include <sys/wait.h>
+ #include <unistd.h>
++#include <stdlib.h>
+ 
+ static pid_t pid;
+ 
+@@ -32,6 +33,7 @@
+ 
+   if (f != NULL)
+     fclose (f);
++    
+   while ((p = waitpid (pid, &status, 0)) == -1 && errno == EINTR);
+   if (p == -1 || ! WIFEXITED (status))
+     return -1;
+@@ -50,7 +52,7 @@
+       return NULL;
+     }
+ 
+-  switch (vfork ())
++  switch (pid=fork ())
+     {
+     case -1:
+       error (0, errno, "Could not run %s", path);
+@@ -63,7 +65,9 @@
+ 	  close (p[1]);
+ 	}
+       dup2 (1, 2);
+-      execve (path, argv, envp);
++      while (*envp) 
++        putenv(*envp++);
++      execv (path, argv);
+       _exit (127);
+     }
+ 
+diff -ru prelink-old/src/gather.c prelink/src/gather.c
+--- prelink-old/src/gather.c	2008-10-09 16:31:03.000000000 -0400
++++ prelink/src/gather.c	2010-08-17 04:45:53.000000000 -0400
+@@ -208,7 +208,8 @@
+ 		      goto error_out;
+ 		    }
+ 		}
+-	      error (0, 0, "%s: Could not parse `%s'", ent->filename, line);
++	      /* This is not an error situation: error (0, 0, "%s: Could7 not parse `%s'", ent->filename, line); */
++	      continue;
+ 	    }
+ 	  goto error_out;
+ 	}
+diff -ru prelink-old/src/get.c prelink/src/get.c
+--- prelink-old/src/get.c	2009-06-12 08:01:48.000000000 -0400
++++ prelink/src/get.c	2010-08-17 04:29:14.000000000 -0400
+@@ -30,6 +30,7 @@
+ is_ldso_soname (const char *soname)
+ {
+   if (! strcmp (soname, "ld-linux.so.2")
++      || ! strcmp (soname, "ld-linux.so.3")
+       || ! strcmp (soname, "ld.so.1")
+       || ! strcmp (soname, "ld-linux-ia64.so.2")
+       || ! strcmp (soname, "ld-linux-x86-64.so.2")
+diff -ru prelink-old/testsuite/movelibs.sh prelink/testsuite/movelibs.sh
+--- prelink-old/testsuite/movelibs.sh	2009-12-16 06:57:31.000000000 -0500
++++ prelink/testsuite/movelibs.sh	2010-08-18 03:10:19.000000000 -0400
+@@ -6,6 +6,7 @@
+ > syslib.list
+ > syslnk.list
+ for i in `LD_TRACE_PRELINKING=1 LD_WARN= LD_TRACE_LOADED_OBJECTS=1 ./movelibs \
++	  | grep " => " \
+ 	  | awk '$1 !~ /^\.\/movelibs/ { print $3 } '`; do
+   k=`basename $i`
+   if [ -L $i ]; then
diff --git a/recipes/prelink/prelink_20100106.bb b/recipes/prelink/prelink_20100106.bb
new file mode 100644
index 0000000..3fd9f64
--- /dev/null
+++ b/recipes/prelink/prelink_20100106.bb
@@ -0,0 +1,53 @@
+SECTION = "devel"
+DEPENDS = "elfutils"
+DESCRIPTION = " The prelink package contains a utility which modifies ELF shared libraries \
+and executables, so that far fewer relocations need to be resolved at \
+runtime and thus programs come up faster."
+LICENSE = "GPL"
+PR = "r1"
+
+SRC_URI = "http://people.redhat.com/jakub/prelink/${P}.tar.bz2 \
+           file://prelink.conf \
+           file://prelink.cron.daily \
+           file://prelink.default \
+           file://prelink-20100106-arm-fix.patch \
+"
+
+S = "${WORKDIR}/prelink"
+
+EXTRA_OECONF = "--disable-64bit"
+
+inherit autotools
+
+do_compile_prepend () {
+	sed -i -e 's:prelink_LDFLAGS = -all-static:#prelink_LDFLAGS = -all-static:g' src/Makefile
+}
+
+do_install_append () {
+	install -d ${D}${sysconfdir}/cron.daily ${D}${sysconfdir}/default
+	install -m 0644 ${WORKDIR}/prelink.conf ${D}${sysconfdir}/prelink.conf
+	install -m 0644 ${WORKDIR}/prelink.cron.daily ${D}${sysconfdir}/cron.daily/prelink
+	install -m 0644 ${WORKDIR}/prelink.default ${D}${sysconfdir}/default/prelink
+}
+
+pkg_postinst_prelink() {
+#!/bin/sh
+
+if [ "x$D" != "x" ]; then
+  exit 1
+fi
+
+. ${sysconfdir}/cron.daily/prelink
+}
+
+pkg_prerm_prelink() {
+#!/bin/sh
+
+if [ -f ${sysconfdir}/prelink.cache ]; then
+    prelink -au
+    rm -f ${sysconfdir}/prelink.cache
+fi
+}
+
+SRC_URI[md5sum] = "56e2a1b5a478795352bf6e4d2bc6e0ab"
+SRC_URI[sha256sum] = "6aea85b672f2689b52a75e36a5e06fdc9b338e8d2935692dbb0fc61c83491125"
-- 
1.7.3.4



