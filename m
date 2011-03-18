Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <woglinde@rhein.zuhause.netz>) id 1Q0WXI-0000TG-Ud
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 11:04:01 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DF13911000B7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:54:00 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 474C811000BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:53:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225072129.adsl.alicedsl.de
	[92.225.72.129]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:53:59 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 448DB3C05A; Fri, 18 Mar 2011 10:53:14 +0100 (CET)
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 10:53:10 +0100
Message-Id: <1300441991-30490-2-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1300441991-30490-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300441991-30490-1-git-send-email-heinold@inf.fu-berlin.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH 1/2] ti-c6accel: fix building for uclibc
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
X-List-Received-Date: Fri, 18 Mar 2011 10:04:01 -0000

From: Henning Heinold <heinold@inf.fu-berlin.de>


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/ti/ti-c6accel.inc                   |    2 +-
 recipes/ti/ti-c6accel/fix_time_symbol.patch |   46 +++++++++++++++++++++++++++
 recipes/ti/ti-c6accel_1.01.00.03.bb         |    2 +
 3 files changed, 49 insertions(+), 1 deletions(-)
 create mode 100644 recipes/ti/ti-c6accel/fix_time_symbol.patch

diff --git a/recipes/ti/ti-c6accel.inc b/recipes/ti/ti-c6accel.inc
index 7d09783..216f4c2 100644
--- a/recipes/ti/ti-c6accel.inc
+++ b/recipes/ti/ti-c6accel.inc
@@ -18,7 +18,7 @@ PROVIDES += "ti-c6accel-apps"
 
 # This recipe links statically against kernel dependant stuff, use kernel PR as base and append a local version
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "c"
+PR_append = "d"
 
 S = "${WORKDIR}/c6accel_${PV}"
 
diff --git a/recipes/ti/ti-c6accel/fix_time_symbol.patch b/recipes/ti/ti-c6accel/fix_time_symbol.patch
new file mode 100644
index 0000000..9963669
--- /dev/null
+++ b/recipes/ti/ti-c6accel/fix_time_symbol.patch
@@ -0,0 +1,46 @@
+Index: c6accel_1_01_00_03/soc/app/benchmark.h
+===================================================================
+--- c6accel_1_01_00_03.orig/soc/app/benchmark.h	2011-03-12 17:45:49.640633120 +0100
++++ c6accel_1_01_00_03/soc/app/benchmark.h	2011-03-12 17:46:10.360988120 +0100
+@@ -39,7 +39,7 @@
+ 
+ 
+  extern Time_Object sTime;
+- extern UInt32      time;
++ extern UInt32      timestamp;
+ 
+  #define OPEN_LOG_FILE(Name)                                    \
+  if ((benchmarkFd = fopen(Name,"wb")) == NULL) {                \
+@@ -49,7 +49,7 @@
+  #define CLOSE_LOG_FILE() fclose(benchmarkFd);
+ 
+  #define START_BENCHMARK()                                     \
+-           Time_delta(&sTime,&time);
++           Time_delta(&sTime,&timestamp);
+ 
+  #define LOG_STRING(str)                                        \
+        fprintf(benchmarkFd,"%s",str);
+@@ -70,8 +70,8 @@
+ 
+ 
+  #define END_AND_WRITE_BENCHMARK()                             \
+-       Time_delta(&sTime,&time);                                \
+-       fprintf(benchmarkFd,"%d",(unsigned int)time);
++       Time_delta(&sTime,&timestamp);                                \
++       fprintf(benchmarkFd,"%d",(unsigned int)timestamp);
+ 
+ 
+ 
+Index: c6accel_1_01_00_03/soc/app/appMain.c
+===================================================================
+--- c6accel_1_01_00_03.orig/soc/app/appMain.c	2011-03-12 17:46:42.030148120 +0100
++++ c6accel_1_01_00_03/soc/app/appMain.c	2011-03-12 17:48:00.619423120 +0100
+@@ -66,7 +66,7 @@
+ /* This object is used in MACRO in benchmark.h */
+ #include "timeObj.h"
+ Time_Object sTime;
+-UInt32      time;
++UInt32      timestamp;
+ 
+ void Time_reset(Time_Object *sTime)
+ {
diff --git a/recipes/ti/ti-c6accel_1.01.00.03.bb b/recipes/ti/ti-c6accel_1.01.00.03.bb
index bf5f1cf..42b0cc6 100644
--- a/recipes/ti/ti-c6accel_1.01.00.03.bb
+++ b/recipes/ti/ti-c6accel_1.01.00.03.bb
@@ -7,6 +7,8 @@ SRC_URI_append = "file://fix-loadmodule.patch \
                   file://0001-soc-honour-buildsystem-CFLAGS-and-LDFLAGS-when-set.patch \
                  "
 
+SRC_URI_append_libc-uclibc = "file://fix_time_symbol.patch"
+
 PV = "1_01_00_03"
 
 
-- 
1.7.4.1


