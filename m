Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id A802378281
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 05:05:55 +0000 (UTC)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
	by m0048204.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7M55kBQ020781 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 01:05:56 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Aug 2017 08:05:38 +0300
Message-Id: <20170822050538.174882-1-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-22_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708220078
Subject: [meta-oe][PATCH v2] Dhrystone: add recipe 2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Aug 2017 05:05:55 -0000

Dhrystone is a synthetic computing benchmark program developed
in 1984 by Reinhold P. Weicker intended to be representative of
system (integer) programming.

https://en.wikipedia.org/wiki/Dhrystone

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
---
 .../dhrystone/dhrystone-2.1/dhrystone.patch        | 81 ++++++++++++++++++++++
 .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 26 +++++++
 2 files changed, 107 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
new file mode 100644
index 0000000..6a5350c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
@@ -0,0 +1,81 @@
+dhrystone: fix compilation problems
+
+This patch fixes two compilation errors with original
+dhrystone sources:
+* Redefinition of times() with wrong return type
+  - Fixed by commenting out the unnecessary redefinition
+* Undefined identifier HZ
+  - Originally HZ was supposed to be the clock frequency
+    value for times()
+  - For Linux, the frequency should come from sysconf
+  - This patch defines global varible HZ and initializes
+    it from sysconf
+
+Additionally, this patch adds a simple Makefile.
+
+Upstream-status: Pending
+
+Sign-off-by: Kimmo Surakka <kimmo.surakka@ge.com>
+Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
+---
+
+diff -Naur dhry.orig/dhry_1.c dhry/dhry_1.c
+--- dhry.orig/dhry_1.c	2015-07-20 14:25:58.059945353 +0300
++++ dhry/dhry_1.c	2015-07-20 12:43:25.318945353 +0300
+@@ -45,11 +45,15 @@
+ 
+ #ifdef TIMES
+ struct tms      time_info;
+-extern  int     times ();
++/* extern  int     times (); */
+                 /* see library function "times" */
+ #define Too_Small_Time 120
+                 /* Measurements should last at least about 2 seconds */
+ #endif
++#ifndef HZ
++#include <unistd.h>  /* sysconf */
++   long HZ;
++#endif
+ #ifdef TIME
+ extern long     time();
+                 /* see library function "time"  */
+@@ -84,6 +88,9 @@
+ 
+   /* Initializations */
+ 
++#ifndef HZ
++  HZ = sysconf(_SC_CLK_TCK);
++#endif
+   Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
+   Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
+ 
+diff -Naur dhry.orig/dhry.h dhry/dhry.h
+--- dhry.orig/dhry.h	2015-07-20 14:25:58.054945353 +0300
++++ dhry/dhry.h	2015-07-20 12:42:59.903945353 +0300
+@@ -420,4 +420,6 @@
+           } variant;
+       } Rec_Type, *Rec_Pointer;
+ 
+-
++#ifndef HZ
++   extern long HZ;
++#endif
+diff -Naur dhry.orig/Makefile dhry/Makefile
+--- dhry.orig/Makefile	1970-01-01 02:00:00.000000000 +0200
++++ dhry/Makefile	2015-07-20 14:10:45.832945353 +0300
+@@ -0,0 +1,15 @@
++CC=gcc
++
++all: dhry
++
++dhry: dhry_1.o dhry_2.o
++	$(CC) $(LDFLAGS) -o $@ $^ $(LOADLIBES) $(LDLIBS)
++
++dhry_1.o: dhry_1.c dhry.h
++
++dhry_2.o: dhry_2.c dhry.h
++
++clean:
++	rm -f *.o *~
++
++.PHONY: all clean
diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
new file mode 100644
index 0000000..17e8c70
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Dhrystone CPU benchmark"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+SRC_URI = "http://www.netlib.org/benchmark/dhry-c;downloadfilename=dhry-c.shar \
+           file://dhrystone.patch"
+SRC_URI[md5sum] = "75aa5909c174eed98c134be2f56307da"
+SRC_URI[sha256sum] = "038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e"
+
+# Need to override Makefile variables
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
+do_unpack() {
+    [ -d ${S} ] || mkdir -p ${S}
+    cd ${S}
+    sh ${DL_DIR}/dhry-c.shar
+}
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/dhry ${D}${bindir}
+}
+
+# Prevent procedure merging as required by dhrystone.c:
+CFLAGS += "-fno-lto"
+
+LDFLAGS += "-fno-lto"
-- 
2.10.1


