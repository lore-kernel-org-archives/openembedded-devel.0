Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9D46C226
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 22:15:20 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1001-35.w90-120.abo.wanadoo.fr
	[90.120.192.35]) by koncepto.io (Postfix) with ESMTPSA id 9766560022;
	Sat, 18 Jan 2020 23:15:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1579385718;
	bh=Q82LoQMHnBRtEThmX1ljVzn+8+UG+Vf0bc6zDfBrNdA=;
	h=From:To:Cc:Subject:Date:From;
	b=eZWSGFcXwHWxagXazw2+SrECqZnc8JIckwaIX4ZZL2QLyAczDNWHEJNFVgH+ViZOy
	CB3b7XHJDiF89oAIqef2cSyqiM+rYFxzhlN5Ewmiy8fSSIkvJJ7CoV5gvL6drq7nHB
	Ffzc8pe9fiXLAdYpOCpicNblSF4sO+cNQ9EzaUJbnDqbTtVLkmScHuhophN1svm9g/
	V9v/kExSvEMZCZ9jHdyijRNQNGdJr3aF/NbqbkAGuaY5EdEbMcFKxjD+UuH/CEXIDR
	QIzYfBHV5IQwtVjq5grlh5jftkSm+HEgwWi2uHqh9PB8/UIPbdkcXxJzIrsRPLk3m+
	DXgK3X+l7cJQw==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 23:14:12 +0100
Message-Id: <1579385652-31701-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] can-utils: bump to revision 665d869
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
X-List-Received-Date: Sat, 18 Jan 2020 22:15:20 -0000

Also:
 - remove patch applied upstream
 - update the hash of the license because the file
 now contains a SPDX license identifier

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...ude-to-find-SIOCGSTAMP-with-latest-kernel.patch | 106 ---------------------
 .../recipes-extended/socketcan/can-utils_git.bb    |   9 +-
 2 files changed, 4 insertions(+), 111 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
deleted file mode 100644
index cbf3aee..0000000
--- a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 20981c8a328747f823b7eef68d0c2812b3eaed30 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Jul 2019 21:50:43 +0200
-Subject: [PATCH] fix include to find SIOCGSTAMP with latest kernel
-
-In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
-the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
-Instead it provides only SIOCGSTAMP_OLD.
-
-The linux/sockios.h header now defines SIOCGSTAMP using either
-SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
-header file is not pulled so we get a build failure.
-
-canlogserver.c: In function 'main':
-canlogserver.c:404:21: error: 'SIOCGSTAMP' undeclared (first use in this function); did you mean 'SIOCGRARP'?
-     if (ioctl(s[i], SIOCGSTAMP, &tv) < 0)
-                     ^~~~~~~~~~
-                     SIOCGRARP
-canlogserver.c:404:21: note: each undeclared identifier is reported only once for each function it appears in
-
-Fixes:
- - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
-
-Upstream-Status: Backport [https://github.com/linux-can/can-utils/commit/e9590b1ca75d360eaf3211bebd86058214d48064]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- canlogserver.c | 1 +
- cansniffer.c   | 1 +
- isotpdump.c    | 1 +
- isotpperf.c    | 1 +
- isotpsniffer.c | 1 +
- slcanpty.c     | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/canlogserver.c b/canlogserver.c
-index e3350b7..f53165c 100644
---- a/canlogserver.c
-+++ b/canlogserver.c
-@@ -61,6 +61,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include <signal.h>
- #include <errno.h>
- 
-diff --git a/cansniffer.c b/cansniffer.c
-index 7b0a3fa..bf7d72e 100644
---- a/cansniffer.c
-+++ b/cansniffer.c
-@@ -61,6 +61,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/bcm.h>
-+#include <linux/sockios.h>
- 
- #include "terminal.h"
- 
-diff --git a/isotpdump.c b/isotpdump.c
-index b2b650a..36d8af3 100644
---- a/isotpdump.c
-+++ b/isotpdump.c
-@@ -55,6 +55,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- #include "terminal.h"
- 
- #define NO_CAN_ID 0xFFFFFFFFU
-diff --git a/isotpperf.c b/isotpperf.c
-index db3a2b7..5852a57 100644
---- a/isotpperf.c
-+++ b/isotpperf.c
-@@ -56,6 +56,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- 
- #define NO_CAN_ID 0xFFFFFFFFU
- #define PERCENTRES 2 /* resolution in percent for bargraph */
-diff --git a/isotpsniffer.c b/isotpsniffer.c
-index f42e18b..d7a4c66 100644
---- a/isotpsniffer.c
-+++ b/isotpsniffer.c
-@@ -55,6 +55,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/isotp.h>
-+#include <linux/sockios.h>
- #include "terminal.h"
- 
- #define NO_CAN_ID 0xFFFFFFFFU
-diff --git a/slcanpty.c b/slcanpty.c
-index 431ca68..7dfaf5c 100644
---- a/slcanpty.c
-+++ b/slcanpty.c
-@@ -40,6 +40,7 @@
- 
- #include <linux/can.h>
- #include <linux/can/raw.h>
-+#include <linux/sockios.h>
- 
- /* maximum rx buffer len: extended CAN frame with timestamp */
- #define SLC_MTU (sizeof("T1111222281122334455667788EA5F\r")+1)
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index db5055f..e2609d4 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -1,14 +1,13 @@
 SUMMARY = "Linux CAN network development utilities"
 DESCRIPTION = "Linux CAN network development"
 LICENSE = "GPLv2 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a069ac1436553ee7"
+LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master \
-           file://0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch \
-           "
-SRCREV = "4c8fb05cb4d6ddcd67299008db54af423f86fd05"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
+
+SRCREV = "665d8699ebe728bf48e63e8ae58d2482db72f954"
 
 PV = "0.0+gitr${SRCPV}"
 
-- 
2.7.4


