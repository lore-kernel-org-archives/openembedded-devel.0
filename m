Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LyoR0-0002V9-EK
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 16:37:22 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 67175188454; Tue, 28 Apr 2009 16:36:31 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Apr 2009 16:36:31 +0200
Message-Id: <1240929391-17101-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] linux-libc-headers_2.6.23.bb : more modern glibc expose getline from
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
X-List-Received-Date: Tue, 28 Apr 2009 14:37:22 -0000

From: Graeme Gregory <dp@xora.org.uk>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/linux-libc-headers/files/unifdef.patch     |   31 ++++++++++++++++++++
 .../linux-libc-headers_2.6.23.bb                   |    5 ++-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 recipes/linux-libc-headers/files/unifdef.patch

diff --git a/recipes/linux-libc-headers/files/unifdef.patch b/recipes/linux-libc-headers/files/unifdef.patch
new file mode 100644
index 0000000..800c3c8
--- /dev/null
+++ b/recipes/linux-libc-headers/files/unifdef.patch
@@ -0,0 +1,31 @@
+Index: linux-2.6.23/scripts/unifdef.c
+===================================================================
+--- linux-2.6.23.orig/scripts/unifdef.c
++++ linux-2.6.23/scripts/unifdef.c
+@@ -206,7 +206,7 @@ static void             done(void);
+ static void             error(const char *);
+ static int              findsym(const char *);
+ static void             flushline(bool);
+-static Linetype         getline(void);
++static Linetype         parseline(void);
+ static Linetype         ifeval(const char **);
+ static void             ignoreoff(void);
+ static void             ignoreon(void);
+@@ -512,7 +512,7 @@ process(void)
+ 
+ 	for (;;) {
+ 		linenum++;
+-		lineval = getline();
++		lineval = parseline();
+ 		trans_table[ifstate[depth]][lineval]();
+ 		debug("process %s -> %s depth %d",
+ 		    linetype_name[lineval],
+@@ -526,7 +526,7 @@ process(void)
+  * help from skipcomment().
+  */
+ static Linetype
+-getline(void)
++parseline(void)
+ {
+ 	const char *cp;
+ 	int cursym;
diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
index 13579f9..95152f1 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
@@ -2,10 +2,11 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
-           file://procinfo.h"
+           file://procinfo.h \
+           file://unifdef.patch;patch=1"
 
 S = "${WORKDIR}/linux-${PV}"
 
-- 
1.5.6.5



