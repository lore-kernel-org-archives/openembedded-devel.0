Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7B20A6B5AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 08:31:17 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id s198so8553620pgs.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Dec 2018 00:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PMjpHT7Qf1WiV76lxBPWuFcHpe6I5+feVtpmqTqiEoI=;
	b=in5PpA+p743IlPBjlIMTd7CLuvLskgNDDnPnYj1evDukZL/YSPtTsK1q431O77BlIf
	d+l0Hc6vHZkKLqbE8DCBvMMUNRoVO1BQxqZg6cNp9IwLS8oN1E81hoK1rberrKPZN8NL
	LMZNziyaeIml8H/0aI4yF8cHvn5VuP1OoulELJctY4dpUh++nFQJANGZZiYsGnhIOAte
	ciacVPAOnJYTYeZAX2r9ydZwr6fhlPpil7Nizg0VIdbJmppVka4GPgCRvHJgUVNlucyg
	yv7QzLAyWxRStMeKMOlKa8FRXz8gnSpfKL3lG+FKvsGUAzoUhH5ZxuDW82MD1NVAFW+D
	kfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PMjpHT7Qf1WiV76lxBPWuFcHpe6I5+feVtpmqTqiEoI=;
	b=msrjbTmmQ2da+ZdIxLnJ0jz2SeBgj3MVJ6mf/LybNIvfeOGDCSodEigVfa9R1+Ydf3
	obgpHMngkJMSKgfCRaShmIGontbeTgSUUncwLQKOjo8PQyGCSzDbbzCin7ZuYSgFABFp
	9nKGMnD5VPQbEQRuLI0tdXCIhG7lIymn49DOLUO0znKlS5YkiHt9Db/Y+nB49mEdEzW7
	1a/P97xAetg/kgPzaP+gLgSQf17/MtD50IOyCxgvEv/v+Xtdz72Mj6hFQKhci2DWDUCL
	oQt1B7Ph2141Y5pR5pRStvNL/vwWYHSZ2ApeLN7Ht+USTGKoBNxzSJMnhA7kzxbbWQ/0
	q+ug==
X-Gm-Message-State: AJcUuke9KYrGgA+FsoWIaBL7MmdQnvxEJ98s8PxsgY+6wmMzpXjA1Yf1
	0k91mpDlCZDSD+9aMgDlc/LwG1NdtErvKQ==
X-Google-Smtp-Source: ALg8bN4QksKZHutHxwQY7yKMVBP6eXHnqigVySE6hIEmxvvSK+ldH4KAdrC0Y4wzQL0rdHibUKlpTw==
X-Received: by 2002:a63:5153:: with SMTP id r19mr21809779pgl.281.1545899478144;
	Thu, 27 Dec 2018 00:31:18 -0800 (PST)
Received: from apnavik-DESK.iind.intel.com (fmdmzpr04-ext.fm.intel.com.
	[192.55.54.39])
	by smtp.gmail.com with ESMTPSA id w3sm56041436pge.8.2018.12.27.00.31.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Dec 2018 00:31:17 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Dec 2018 14:02:55 +0530
Message-Id: <1545899575-21434-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v4] wifi-test-suite: Initial recipe for wifi test suite.
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
X-List-Received-Date: Thu, 27 Dec 2018 08:31:17 -0000

Add generic recipe for wifi test suite from wifi alliance.
Suite is to support certification program development and device certification.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 ...-Use-toolchain-from-environment-variables.patch | 92 ++++++++++++++++++++++
 ...-include-removes-unnedded-stuff-and-add-n.patch | 45 +++++++++++
 ...-usr-sbin-for-script-and-make-script-for-.patch | 58 ++++++++++++++
 .../wifi-test-suite/wifi-test-suite_git.bb         | 37 +++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0001-Use-toolchain-from-environment-variables.patch
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
 create mode 100644 meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch
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
index 0000000..20fb647
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0002-Add-missing-include-removes-unnedded-stuff-and-add-n.patch
@@ -0,0 +1,45 @@
+From 451b162c903a1ef070a75dc18171620f3beef7b3 Mon Sep 17 00:00:00 2001
+From: Ankit Navik <ankit.tarot@gmail.com>
+Date: Tue, 25 Dec 2018 00:36:59 +0530
+Subject: [PATCH 2/3] Add missing include, removes unnedded stuff and add non
+ glibc rpc
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Reto Schneider <code@reto-schneider.ch>
+Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
+---
+ Makefile     | 2 +-
+ inc/wfa_tg.h | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
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
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch
new file mode 100644
index 0000000..a51302a
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/files/0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch
@@ -0,0 +1,58 @@
+From fc7b7106dd0d8d123f20cbd8d408637fbc315e17 Mon Sep 17 00:00:00 2001
+From: Ankit Navik <ankit.tarot@gmail.com>
+Date: Tue, 25 Dec 2018 01:12:32 +0530
+Subject: [PATCH 3/3] fix path to /usr/sbin for script and make script for
+ generic shell
+
+Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
+---
+ lib/wfa_cs.c           | 4 ++--
+ scripts/dev_send_frame | 2 +-
+ scripts/sta_reset_parm | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
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
+diff --git a/scripts/dev_send_frame b/scripts/dev_send_frame
+index 9e6afd3..3c37d61 100644
+--- a/scripts/dev_send_frame
++++ b/scripts/dev_send_frame
+@@ -1,4 +1,4 @@
+-#!/bin/bash 
++#!/usr/bin/env sh 
+ 
+ #
+ # Copyright (c) 2016 Wi-Fi Alliance
+diff --git a/scripts/sta_reset_parm b/scripts/sta_reset_parm
+index 2aff1f1..2c1c31e 100644
+--- a/scripts/sta_reset_parm
++++ b/scripts/sta_reset_parm
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/usr/bin/env sh
+ 
+ #
+ # Copyright (c) 2016 Wi-Fi Alliance
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
new file mode 100644
index 0000000..b866c55
--- /dev/null
+++ b/meta-oe/recipes-connectivity/wifi-test-suite/wifi-test-suite_git.bb
@@ -0,0 +1,37 @@
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
+	file://0003-fix-path-to-usr-sbin-for-script-and-make-script-for-.patch \
+"
+
+# to avoid host path QA error
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+# Fix GNU HASH error
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install () {
+	install -d ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
+	install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}
+	install -d ${D}${sbindir}
+	install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
+	install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
+	install -m 0755 ${S}/scripts/*.sh ${D}${sbindir}
+	install -m 0755 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
+	install -m 0755 ${S}/scripts/dev_send_frame ${D}${sbindir}
+	install -m 0755 ${S}/scripts/sta_reset_parm ${D}${sbindir}
+}
+
+RDEPENDS_${PN} = "wpa-supplicant"
-- 
2.7.4


