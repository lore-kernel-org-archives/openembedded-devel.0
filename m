Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZy7-0006n8-Ia
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id C0BD34036DE75;
	Wed, 21 Jul 2010 16:07:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id B96784036DE77;
	Wed, 21 Jul 2010 16:07:28 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iizB+7zZPdBW; Wed, 21 Jul 2010 16:07:28 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 8875F4036DE75;
	Wed, 21 Jul 2010 16:07:28 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxC-0006Uc-2k; Wed, 21 Jul 2010 16:07:22 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:10 +0200
Message-Id: <1279721232-24744-20-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 19/21] inetlib: backport from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:41 -0000

From: Henning Heinold <h.heinold@tarent.de>

* checksum are already in conf/checksums.ini
---
 recipes/classpath/files/toolwrapper-exithook.patch |   46 ++++++++++++++++++++
 recipes/classpath/inetlib-1.1.1/datadir_java.patch |   23 ++++++++++
 recipes/classpath/inetlib-native_1.1.1.bb          |    3 +
 recipes/classpath/inetlib_1.1.1.bb                 |   30 +++++++++++++
 4 files changed, 102 insertions(+), 0 deletions(-)
 create mode 100644 recipes/classpath/files/toolwrapper-exithook.patch
 create mode 100644 recipes/classpath/inetlib-1.1.1/datadir_java.patch
 create mode 100644 recipes/classpath/inetlib-native_1.1.1.bb
 create mode 100644 recipes/classpath/inetlib_1.1.1.bb

diff --git a/recipes/classpath/files/toolwrapper-exithook.patch b/recipes/classpath/files/toolwrapper-exithook.patch
new file mode 100644
index 0000000..49b6631
--- /dev/null
+++ b/recipes/classpath/files/toolwrapper-exithook.patch
@@ -0,0 +1,46 @@
+Index: classpath-0.97.2/tools/toolwrapper.c
+===================================================================
+--- classpath-0.97.2.orig/tools/toolwrapper.c	2006-12-13 18:56:44.000000000 +0100
++++ classpath-0.97.2/tools/toolwrapper.c	2009-12-24 13:16:44.295000627 +0100
+@@ -59,6 +59,10 @@
+ /* Typedef for JNI_CreateJavaVM dlopen call. */
+ typedef jint createVM (JavaVM **, void **, void *);
+ 
++void exit_hook(jint);
++
++int return_code = 1;
++
+ int
+ main (int argc, const char** argv)
+ {
+@@ -143,6 +147,17 @@
+       vm_args.options[vm_args.nOptions++].optionString = "-Xbootclasspath/p:" TOOLS_ZIP;
+     }
+ 
++  /* Set the exit hook */
++  vm_args.options = (JavaVMOption*) realloc (vm_args.options, (vm_args.nOptions + 1) * sizeof (JavaVMOption));
++
++  if (vm_args.options == NULL)
++	{
++	  fprintf (stderr, TOOLNAME ": realloc failed.\n");
++	  goto destroy;
++	}
++  vm_args.options[vm_args.nOptions].optionString = "exit";
++  vm_args.options[vm_args.nOptions++].extraInfo = (void *) exit_hook;
++  
+   /* Terminate vm_args.options with a NULL element. */
+   vm_args.options = (JavaVMOption*) realloc (vm_args.options, (vm_args.nOptions + 1) * sizeof (JavaVMOption));
+   if (vm_args.options == NULL)
+@@ -260,5 +275,11 @@
+   if (lt_dlexit () != 0)
+     fprintf (stderr, TOOLNAME ": lt_dlexit failed.\n");
+ 
+-  return 1;
++  return return_code;
++}
++
++void exit_hook(jint code)
++{
++	return_code = code;
+ }
++
diff --git a/recipes/classpath/inetlib-1.1.1/datadir_java.patch b/recipes/classpath/inetlib-1.1.1/datadir_java.patch
new file mode 100644
index 0000000..16302cd
--- /dev/null
+++ b/recipes/classpath/inetlib-1.1.1/datadir_java.patch
@@ -0,0 +1,23 @@
+Index: inetlib-1.1.1/Makefile.am
+===================================================================
+--- inetlib-1.1.1.orig/Makefile.am	2008-03-01 10:49:49.000000000 +0100
++++ inetlib-1.1.1/Makefile.am	2008-03-01 10:52:21.000000000 +0100
+@@ -7,6 +7,8 @@
+ JAVADOC = @JAVADOC@
+ JAVADOCFLAGS = @JAVADOCFLAGS@
+ 
++JARDIR = $(datadir)/java
++
+ src = @srcdir@/source
+ dst = classes
+ doc = @srcdir@/docs
+@@ -280,7 +282,7 @@
+ 	find $(dst) -name '*.class' -exec rm -f '{}' ';'
+ 
+ install-data-local:
+-	$(mkinstalldirs) $(prefix)/share/java
+-	$(INSTALL_DATA) $(inetlib_jar) $(prefix)/share/java
++	$(mkinstalldirs) $(DESTDIR)/$(JARDIR)
++	$(INSTALL_DATA) $(inetlib_jar) $(DESTDIR)/$(JARDIR)
+ 
+ # End of Makefile.am
diff --git a/recipes/classpath/inetlib-native_1.1.1.bb b/recipes/classpath/inetlib-native_1.1.1.bb
new file mode 100644
index 0000000..53ee782
--- /dev/null
+++ b/recipes/classpath/inetlib-native_1.1.1.bb
@@ -0,0 +1,3 @@
+require inetlib_${PV}.bb
+
+inherit native
diff --git a/recipes/classpath/inetlib_1.1.1.bb b/recipes/classpath/inetlib_1.1.1.bb
new file mode 100644
index 0000000..1fba4b4
--- /dev/null
+++ b/recipes/classpath/inetlib_1.1.1.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "A Java library of clients for common internet protocols"
+LICENSE = "GPL + library exception"
+AUTHOR = "GNU Classpath"
+HOMEPAGE = "http://gnu.org/software/classpath/inetlib.html"
+
+SRC_URI = "\
+  http://ftp.gnu.org/gnu/classpath/${BP}.tar.gz \
+  file://datadir_java.patch;patch=1 \
+  "
+
+inherit java-library autotools
+
+DEPENDS = "fastjar-native"
+
+JPN = "libgnuinet-java"
+
+export JAVAC = "javac"
+
+export JAVA = "java"
+
+# We fake this, it is not neccessary anyway.
+export JAVADOC = "true"
+
+do_compile() {
+  oe_runmake JARDIR=${datadir_java} inetlib_jar=${JARFILENAME}
+}
+
+do_install_append() {
+  java_install
+}
-- 
1.7.0.4



