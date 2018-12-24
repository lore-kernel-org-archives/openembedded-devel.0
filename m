Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id C6C296C0B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 19:59:23 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id u18so5875313plq.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2018 11:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RO668hqGRqU7gXlQmgz/j0aLtpDEC+0e/fOSHsAAups=;
	b=PIVDU8zB0P/mlcXYHpBaT9k++l3bw75qSxcl+ydoB8cK43jkWdH5H4iURiimDPlMFq
	mkP7R4CUWELssWc+eZbZOxI8Ef0SUoqWLtSfmhsCWbW6S2sEtV3inYasC44J5uR8N7sT
	HdlBC86xuUCyWhxWKIG809jJFc26wMF7KkWpzizHT59ZVoE+ZfRtbQYRzdib4PGnA9XT
	tG8rgfqKWK0TyAYHLfICO92uGdKQm3avgPEyASIeOmsVhVb0I9Px8c3cZx9pLj7kR9Mr
	d/fx5FgnUniyVpdW7E/cPP74NBQxqHcAmOj0DU1avBAmo6hAPn9sYp35hmE3954Wv26C
	mEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RO668hqGRqU7gXlQmgz/j0aLtpDEC+0e/fOSHsAAups=;
	b=AMyonahe6JrJJqxGS9U+XXNj51G80ErBiy1ZiCJFjuya0WubDm7RIVb4KqYL4QpvrF
	0KP48XLw6BAJNV87laknlVyXN5MgDTCkzmGgtEOpn3vmJ4ks/03frwtSY4WDDa9AT1y7
	UUiEA11ORX5LrFsuf04ygj7AVI6s47dZqOKfR1eV4JMnVo3YBW/YCW48CDRBzPNPV61g
	ZdVTKIQUDnzOfWiulY8vfuebz3RHhI4CVsrWY+L3hEKHSOF60m3VZhIIfoiLrtTOOLL6
	2xQ/Kpm/5JrvKQeMlZbj7xMm7e26Ix0shekvshftTjZUh4/SSE34ktDY7PkIsRwbf5FJ
	LhRw==
X-Gm-Message-State: AJcUuke5D5CjO6qIhQUJpXwtqODIampiGL3sywoaZsMyM4L0YUxBzYrL
	WsoHCAsPyt2sSYW1op9uHio06ifkK9w=
X-Google-Smtp-Source: ALg8bN48aCPvTWOGbMAi01IA7xGh4eq7g8FJEtNTcMeERQQzVsv/VtBA5zKTOODl2jq/b4QZhUZPMQ==
X-Received: by 2002:a17:902:28e6:: with SMTP id
	f93mr13895928plb.239.1545681564400; 
	Mon, 24 Dec 2018 11:59:24 -0800 (PST)
Received: from apnavik-DESK.iind.intel.com (fmdmzpr03-ext.fm.intel.com.
	[192.55.54.38]) by smtp.gmail.com with ESMTPSA id
	t13sm52447576pgr.42.2018.12.24.11.59.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Dec 2018 11:59:23 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Dec 2018 01:30:56 +0530
Message-Id: <1545681656-20728-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] wifi-test-suite: Initial recipe for wifi test suite.
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
X-List-Received-Date: Mon, 24 Dec 2018 19:59:24 -0000

Add generic recipe for wifi test suite from wifi alliance.
Suite is to support certification program development and device certification.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 ...-Use-toolchain-from-environment-variables.patch | 92 ++++++++++++++++++++++
 ...-include-removes-unnedded-stuff-and-add-n.patch | 59 ++++++++++++++
 .../0003-fix-path-to-usr-sbin-for-script.patch     | 35 ++++++++
 .../wifi-test-suite/wifi-test-suite_git.bb         | 32 ++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb

diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
new file mode 100644
index 0000000..9ee4a51
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
@@ -0,0 +1,92 @@
+From 6b822b36739222d0c864249992b5d28e3ff4d948 Mon Sep 17 00:00:00 2001
+From: Adrian Friedli <adrian.friedli@husqvarnagroup.com>
+Date: Mon, 3 Sep 2018 17:58:27 +0200
+Subject: [PATCH] Use toolchain from environment variables
+
+Upstream-Status: Submitted [https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/42]
+Signed-off-by: Adrian Friedli <adrian.friedli@husqvarnagroup.com>
+Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
+---
+ Makefile.inc         | 7 ++++---
+ WTGService/Makefile  | 2 +-
+ console_src/Makefile | 2 +-
+ lib/Makefile         | 6 +++---
+ 4 files changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile.inc b/Makefile.inc
+index b0edf5a..0094bdf 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -13,14 +13,15 @@
+ # NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
+ # USE OR PERFORMANCE OF THIS SOFTWARE.
+ #
+-CC = gcc
++CC ?= gcc
++AR ?= ar
+ LIB=lib
+ DUT=dut
+ CA=ca
+ UCC=ucc
+ CON=console_src
+ WTG=WTGService
+-MAKE=make
++MAKE?=make
+ 
+ # This is for WMM-PS
+ #for Ext TG
+@@ -46,7 +47,7 @@ CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc
+ 
+ DUTLIBS = ../lib/libwfa_dut.a -lpthread
+ CALIBS = ../lib/libwfa_ca.a -lpthread
+-RANLIB = ranlib
++RANLIB ?= ranlib
+ 
+ LIBWFA_NAME_DUT = libwfa_dut.a
+ LIBWFA_NAME_CA = libwfa_ca.a
+diff --git a/WTGService/Makefile b/WTGService/Makefile
+index 5312eb6..4855771 100644
+--- a/WTGService/Makefile
++++ b/WTGService/Makefile
+@@ -13,7 +13,7 @@
+ # NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE
+ # USE OR PERFORMANCE OF THIS SOFTWARE.
+ #
+-CC=gcc
++CC?=gcc
+ CFLAGS= -Wall
+ LIB=-lpthread
+ 
+diff --git a/console_src/Makefile b/console_src/Makefile
+index 8282283..d1098eb 100644
+--- a/console_src/Makefile
++++ b/console_src/Makefile
+@@ -14,7 +14,7 @@
+ # USE OR PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-CC	= gcc
++CC	?= gcc
+ CFLAGS	= -g -DWFA_DEBUG -pthread
+ 
+ TARGETS = wfa_con
+diff --git a/lib/Makefile b/lib/Makefile
+index ffcef94..299b8d6 100644
+--- a/lib/Makefile
++++ b/lib/Makefile
+@@ -17,9 +17,9 @@
+ include ../Makefile.inc
+ 
+ all:    ${LIB_OBJS}
+-		ar crv ${LIBWFA_NAME} $?
+-		ar crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
+-		ar crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA} 
++		$(AR) crv ${LIBWFA_NAME} $?
++		$(AR) crv ${LIBWFA_NAME_DUT} ${LIB_OBJS_DUT}
++		$(AR) crv ${LIBWFA_NAME_CA} ${LIB_OBJS_CA}
+ 		${RANLIB} ${LIBWFA_NAME} ${LIBWFA_NAME_DUT} ${LIBWFA_NAME_CA}
+ 
+ wfa_tg.o: wfa_tg.c ../inc/wfa_agt.h ../inc/wfa_types.h ../inc/wfa_rsp.h ../inc/wfa_tlv.h  ../inc/wfa_tg.h
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
new file mode 100644
index 0000000..67400e9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
@@ -0,0 +1,59 @@
+From 1025e4c68e93e6165810e9604666fbc7994c709b Mon Sep 17 00:00:00 2001
+From: Ankit Navik <ankit.tarot@gmail.com>
+Date: Tue, 25 Dec 2018 00:36:59 +0530
+Subject: [PATCH 2/2] Add missing include, removes unnedded stuff and add non
+ glib rpc
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Reto Schneider <code@reto-schneider.ch>
+Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
+---
+ Makefile     | 2 +-
+ Makefile.inc | 2 +-
+ inc/wfa_tg.h | 3 +++
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 2c41a17..5c4ad8c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -15,7 +15,7 @@
+ #
+ include Makefile.inc
+ 
+-DIRS= ${LIB} ${DUT} ${CA} ${TC} ${WTG} ${CON}
++DIRS= ${LIB} ${DUT} ${CA} ${TC}
+ 
+ all:
+ 	for i in ${DIRS}; do \
+diff --git a/Makefile.inc b/Makefile.inc
+index 0094bdf..46f1864 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -43,7 +43,7 @@ MAKE?=make
+ #CFLAGS = -g -O2 -D_REENTRANT  -DWFA_WMM_PS_EXT -DWFA_WMM_AC -DWFA_PC_CONSOLE -DWFA_STA_TB -Wall -I../inc
+ 
+ # This is for WPA2 as default
+-CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc
++CFLAGS = -g -O2 -D_REENTRANT -Wall -I../inc -I/usr/include/tirpc
+ 
+ DUTLIBS = ../lib/libwfa_dut.a -lpthread
+ CALIBS = ../lib/libwfa_ca.a -lpthread
+diff --git a/inc/wfa_tg.h b/inc/wfa_tg.h
+index 799bf9f..a1804dd 100644
+--- a/inc/wfa_tg.h
++++ b/inc/wfa_tg.h
+@@ -24,6 +24,9 @@
+ #ifndef _WFA_TG_H
+ #define _WFA_TG_H
+ 
++#ifndef _WINDOWS
++#include <pthread.h>
++#endif
+ #include <sys/time.h>
+ 
+ /* maximum number of streams to support */
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
new file mode 100644
index 0000000..23dae6a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script.patch
@@ -0,0 +1,35 @@
+From ee5ffceb8c29cb66f323158123c9103d47965184 Mon Sep 17 00:00:00 2001
+From: Ankit Navik <ankit.tarot@gmail.com>
+Date: Tue, 25 Dec 2018 01:12:32 +0530
+Subject: [PATCH 3/3] fix path to /usr/sbin for script
+
+Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
+---
+ lib/wfa_cs.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/wfa_cs.c b/lib/wfa_cs.c
+index 6b1f5a2..2a18533 100644
+--- a/lib/wfa_cs.c
++++ b/lib/wfa_cs.c
+@@ -319,7 +319,7 @@ int wfaStaGetIpConfig(int len, BYTE *caCmdBuf, int *respLen, BYTE *respBuf)
+     /*
+      * check a script file (the current implementation specific)
+      */
+-    ret = access("/usr/local/sbin/getipconfig.sh", F_OK);
++    ret = access("/usr/sbin/getipconfig.sh", F_OK);
+     if(ret == -1)
+     {
+         ipconfigResp->status = STATUS_ERROR;
+@@ -2115,7 +2115,7 @@ int wfaStaPresetParams(int len, BYTE *caCmdBuf, int *respLen, BYTE *respBuf)
+ 	    st = remove("/tmp/processid.txt");
+ 	}
+ 	
+-	sprintf(cmdStr, "/usr/local/sbin/findprocess.sh %s /tmp/processid.txt\n", "wpa_supplicant");
++	sprintf(cmdStr, "/usr/sbin/findprocess.sh %s /tmp/processid.txt\n", "wpa_supplicant");
+ 	st = system(cmdStr);
+ 	
+ 	tmpfd = fopen("/tmp/processid.txt", "r+");
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
new file mode 100644
index 0000000..c826f8a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
@@ -0,0 +1,32 @@
+SUMMARY  = "Wi-Fi Test Suite Linux Control Agent"
+DESCRIPTION = "Wi-Fi Test Suite is a software platform originally developed \
+by Wi-Fi Alliance, the global non-profit industry association that brings you \
+Wi-Fi, to support certification program development and device certification."
+HOMEPAGE = "https://www.wi-fi.org/certification/wi-fi-test-suite"
+LICENSE  = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=0542427ed5c315ca34aa09ae7a85ed32"
+SECTION = "test"
+
+S = "${WORKDIR}/git"
+SRCREV = "f7a8d7ef7d1a831c1bb47de21fa083536ea2f3a9"
+SRC_URI = "git://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT.git \
+	file://0001-Use-toolchain-from-environment-variables.patch \
+	file://0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch \
+	file://0003-fix-path-to-usr-sbin-for-script.patch \
+"
+
+do_install () {
+	install -d ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
+	install -d ${D}${sbindir}
+	install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
+	install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
+	install -m 0644 ${S}/scripts/*.sh ${D}${sbindir}
+	install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
+	install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
+	install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
+}
+
+INSANE_SKIP_${PN} = "ldflags"
-- 
2.7.4


