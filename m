Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N4gpn-0001Ce-Vs
	for openembedded-devel@openembedded.org; Sun, 01 Nov 2009 21:15:35 +0100
Received: (qmail 25254 invoked by uid 813007); 1 Nov 2009 20:14:23 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Nov 2009 20:14:23 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Nov 2009 21:17:37 +0100
Message-Id: <1257106657-22380-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.5
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Holger Hans Peter Freyther <zecke@selfish.org>
Subject: [STABLE][PATCH] uclibc-initial_0.9.30(.1).bb: Fix do_stage for ubuntu karmic
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
X-List-Received-Date: Sun, 01 Nov 2009 20:15:35 -0000

From: Holger Hans Peter Freyther <zecke@selfish.org>

gcc4.4 and glibc 2.10 complain that getline already has
a different signature. Rename the version in the unidef.c.

Hrw's note: patch is also needed on recent Debian system and is not related to
version of GCC (I have 4.3.x). As stable/2009 uses 0.9.30 by default I patched
that version too.

---
 .../uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch    |   31 ++++++++++++++++++++
 recipes/uclibc/uclibc-0.9.30/gcc-4.4-fixlet.patch  |   31 ++++++++++++++++++++
 recipes/uclibc/uclibc_0.9.30.1.bb                  |    1 +
 recipes/uclibc/uclibc_0.9.30.bb                    |    3 +-
 4 files changed, 65 insertions(+), 1 deletions(-)
 create mode 100644 recipes/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch
 create mode 100644 recipes/uclibc/uclibc-0.9.30/gcc-4.4-fixlet.patch

diff --git a/recipes/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch b/recipes/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch
new file mode 100644
index 0000000..b9ff671
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.30.1/gcc-4.4-fixlet.patch
@@ -0,0 +1,31 @@
+Index: uClibc-0.9.30.1/extra/scripts/unifdef.c
+===================================================================
+--- uClibc-0.9.30.1.orig/extra/scripts/unifdef.c	2009-08-09 11:55:23.000000000 +0200
++++ uClibc-0.9.30.1/extra/scripts/unifdef.c	2009-08-09 11:55:46.000000000 +0200
+@@ -206,7 +206,7 @@
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         _getline(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = _getline();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++_getline(void)
+ {
+ 	const char *cp;
+ 	int cursym;
diff --git a/recipes/uclibc/uclibc-0.9.30/gcc-4.4-fixlet.patch b/recipes/uclibc/uclibc-0.9.30/gcc-4.4-fixlet.patch
new file mode 100644
index 0000000..b9ff671
--- /dev/null
+++ b/recipes/uclibc/uclibc-0.9.30/gcc-4.4-fixlet.patch
@@ -0,0 +1,31 @@
+Index: uClibc-0.9.30.1/extra/scripts/unifdef.c
+===================================================================
+--- uClibc-0.9.30.1.orig/extra/scripts/unifdef.c	2009-08-09 11:55:23.000000000 +0200
++++ uClibc-0.9.30.1/extra/scripts/unifdef.c	2009-08-09 11:55:46.000000000 +0200
+@@ -206,7 +206,7 @@
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         _getline(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = _getline();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++_getline(void)
+ {
+ 	const char *cp;
+ 	int cursym;
diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.9.30.1.bb
index d159ab3..21bfeff 100644
--- a/recipes/uclibc/uclibc_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc_0.9.30.1.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://uClibc.machine file://uClibc.distro \
 	    file://pthread_atfork.patch;patch=1 \
 	    file://uclibc_ldso_use_O0.patch;patch=1 \
 	    file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch;patch=1 \
+	    file://gcc-4.4-fixlet.patch;patch=1 \
 	   "
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes/uclibc/uclibc_0.9.30.bb b/recipes/uclibc/uclibc_0.9.30.bb
index bbe809f..7f0f2a4 100644
--- a/recipes/uclibc/uclibc_0.9.30.bb
+++ b/recipes/uclibc/uclibc_0.9.30.bb
@@ -7,7 +7,7 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.30"
-PR = "r6"
+PR = "r7"
 DEFAULT_PREFERENCE = "1"
 
 require uclibc.inc
@@ -20,6 +20,7 @@ SRC_URI += "file://uClibc.machine file://uClibc.distro \
 	    file://pthread_atfork.patch;patch=1 \
 	    file://uclibc_ldso_use_O0.patch;patch=1 \
 	    file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch;patch=1 \
+	    file://gcc-4.4-fixlet.patch;patch=1 \
 	   "
 #recent versions uclibc require real kernel headers
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.6.5





