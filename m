Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jlu@pengutronix.de>) id 1SUEdo-0005dw-RT
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 12:06:04 +0200
Received: from dude.hi.pengutronix.de ([2001:6f8:1178:2:21e:67ff:fe11:9c5c])
	by metis.ext.pengutronix.de with esmtp (Exim 4.72)
	(envelope-from <jlu@pengutronix.de>)
	id 1SUEU8-00049S-Ui; Tue, 15 May 2012 11:56:04 +0200
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.77)
	(envelope-from <jlu@pengutronix.de>)
	id 1SUEU8-0002Gz-Tn; Tue, 15 May 2012 11:56:04 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 May 2012 11:56:02 +0200
Message-Id: <1337075762-8696-1-git-send-email-jlu@pengutronix.de>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <4FA2448C.6050401@nedap.com>
References: <4FA2448C.6050401@nedap.com>
X-SA-Exim-Connect-IP: 2001:6f8:1178:2:21e:67ff:fe11:9c5c
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-java][PATCH] llvm2.8: fix llvm compile error by including unistd.h
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
X-List-Received-Date: Tue, 15 May 2012 10:06:05 -0000

Thanks to Jaap de Jong and Khem Raj for reporing the problem and suggesting the fix.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 recipes-core/llvm/llvm2.8/add-unistd.patch |   12 ++++++++++++
 recipes-core/llvm/llvm2.8_2.8.bb           |    3 +++
 2 files changed, 15 insertions(+)
 create mode 100644 recipes-core/llvm/llvm2.8/add-unistd.patch

diff --git a/recipes-core/llvm/llvm2.8/add-unistd.patch b/recipes-core/llvm/llvm2.8/add-unistd.patch
new file mode 100644
index 0000000..1c51b30
--- /dev/null
+++ b/recipes-core/llvm/llvm2.8/add-unistd.patch
@@ -0,0 +1,12 @@
+Index: llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp
+===================================================================
+--- llvm-2.8.orig/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-14 18:31:21.008318473 +0200
++++ llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-14 18:32:53.523734850 +0200
+@@ -19,6 +19,7 @@
+ #include "llvm/Support/ErrorHandling.h"
+ #include "llvm/System/DynamicLibrary.h"
+ #include "llvm/Config/config.h"
++#include <unistd.h>
+ using namespace llvm;
+ 
+ // AtExitHandlers - List of functions to call when the program exits,
diff --git a/recipes-core/llvm/llvm2.8_2.8.bb b/recipes-core/llvm/llvm2.8_2.8.bb
index 310e94e..3459885 100644
--- a/recipes-core/llvm/llvm2.8_2.8.bb
+++ b/recipes-core/llvm/llvm2.8_2.8.bb
@@ -4,9 +4,12 @@ require llvm.inc
 LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
 
+PR = "r1"
+
 SRC_URI += " \
             file://30may-llvm2.8-pr399-ppc-arm.patch \
             file://0019-issue6065.patch \
+            file://add-unistd.patch \
            "
 
 SRC_URI_append_arm = " file://llvm-mc_disable.patch "
-- 
1.7.10



