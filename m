Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jlu@pengutronix.de>) id 1SUEeH-0005li-BM
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 12:06:33 +0200
Received: from dude.hi.pengutronix.de ([2001:6f8:1178:2:21e:67ff:fe11:9c5c])
	by metis.ext.pengutronix.de with esmtp (Exim 4.72)
	(envelope-from <jlu@pengutronix.de>)
	id 1SUEUb-0004Ab-G0; Tue, 15 May 2012 11:56:33 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.77)
	(envelope-from <jlu@pengutronix.de>)
	id 1SUEUb-0002rk-F4; Tue, 15 May 2012 11:56:33 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2012 11:56:31 +0200
Message-Id: <1337075791-8745-1-git-send-email-jlu@pengutronix.de>
X-Mailer: git-send-email 1.7.10
X-SA-Exim-Connect-IP: 2001:6f8:1178:2:21e:67ff:fe11:9c5c
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-java][PATCH] jamvm: work around min heap size greater than max error
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
X-List-Received-Date: Tue, 15 May 2012 10:06:33 -0000

On system with large amounts of RAM (such as 96GB), the default
initial heap size is larger than the max heap size specified in
some build commands. Set min_heap to the max_heap value in those
cases instead.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch |   15 +++++++++++++++
 recipes-core/jamvm/jamvm_git.bb                  |    3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch

diff --git a/recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch b/recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch
new file mode 100644
index 0000000..bf0fda5
--- /dev/null
+++ b/recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch
@@ -0,0 +1,15 @@
+diff --git a/src/jam.c b/src/jam.c
+index b76ce8b..dc5eac3 100644
+--- a/src/jam.c
++++ b/src/jam.c
+@@ -133,9 +133,7 @@ int parseCommandLine(int argc, char *argv[], InitArgs *args) {
+     for(i = 1; i < argc; i++) {
+         if(*argv[i] != '-') {
+             if(args->min_heap > args->max_heap) {
+-                printf("Minimum heap size greater than max!\n");
+-                status = 1;
+-                goto exit;
++                args->min_heap = args->max_heap;
+             }
+ 
+             if(args->props_count) {
diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
index 2a4213b..7b28600 100644
--- a/recipes-core/jamvm/jamvm_git.bb
+++ b/recipes-core/jamvm/jamvm_git.bb
@@ -6,11 +6,12 @@ require jamvm.inc
 SRCREV = "4617da717ecb05654ea5bb9572338061106a414d"
 PV = "1.5.5+1.6.0-devel+git${SRCPV}"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://git.berlios.de/jamvm;protocol=git \
            file://jamvm-jni_h-noinst.patch \
            file://libffi.patch \
+           file://jamvm-minmax-heap.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.7.10



