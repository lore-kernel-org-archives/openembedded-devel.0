Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id EFDC56BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 19:22:14 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id d1so2107638pgp.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 12:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1v6Mbj9wPBzkZnhZgqHmzsKYDal/X/bbSpLMuih5qoE=;
	b=jJ+Vhl+s5iLQvaqPgRFroUUTqppx6V+z4O8H/1np8R3VMTNnDD+6X7CIG+3raXT59q
	zDXu4N24cdhJrNmysMS3zKi5bpndM4FVdMBL0WXpOryZtyZ6kH3yIqiOaePe561lrEV0
	35p3bXDGjnTSCZkmBo5ntU/F1WbtH9NVA08/djT92TfzfBOLED/n64ZNWxm5VRECHlE6
	AJsOHhRcvE6ghpldWVqCDYWKNDJqDAiZxF0s6wlunM9r6wwSNF5UhPTNkqXZDbtJfBxF
	a3L+tITifLOFBAtb6tSQQ+gbVqzwlOaNifWWIfovETBepDI/jaO95tC9Z8dJWCd8bWI+
	o2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1v6Mbj9wPBzkZnhZgqHmzsKYDal/X/bbSpLMuih5qoE=;
	b=aS768HgAvVuks7mu79OnS2vMzWuDrOMHxusDV2SlOej98J6PQS6o4O8uGbkCowCy6v
	h9lAJoLmO7VjxZOjah1YIeWqqUA8YuOfHhZtGFeyEYSPrGxuMhZTdIqMg9OiT1OVSlqs
	lNkuiMdxm/LvZG7hDwuNXZJciZfFp8/cSCa5GBdabFsq89eNxcH27+mZZiwWn3/S7MM0
	BTdtiE0Z0zuNF6rNhA9Mpkl9wXIZs5h06JAVFDOCpgZoZwS7xJ0sy3wxuUs/DRRcYtcW
	BT3x5hhZijiIytYor3S9rLOH7t9LYaUSsBWyHOLZjOeO7A14E71G6FYyloQaALOUQzSV
	DHsQ==
X-Gm-Message-State: APjAAAW1677D+KmHrIfVbVBkPZkRsjWrm8ks50DPQNcLVp+S7DhSnHNf
	p6lHIDa1vLwAGVndAh53sGP8DBJBang=
X-Google-Smtp-Source: APXvYqzvduqM+1drE4lbgpyA+QhUMgP0iuRCZHwCWrcNC7DeGnMdGbOW3fJrkLijzjF6Q98rNnyyWA==
X-Received: by 2002:a17:90b:f03:: with SMTP id
	br3mr11634879pjb.67.1567106535291; 
	Thu, 29 Aug 2019 12:22:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id s16sm4893281pfs.6.2019.08.29.12.22.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 12:22:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 12:22:02 -0700
Message-Id: <20190829192206.1200-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/5] can-utils: Fix build with kernel headers >= 5.2
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
X-List-Received-Date: Thu, 29 Aug 2019 19:22:15 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 106 ++++++++++++++++++
 .../socketcan/can-utils_git.bb                |   4 +-
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
new file mode 100644
index 0000000000..cbf3aee10f
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
@@ -0,0 +1,106 @@
+From 20981c8a328747f823b7eef68d0c2812b3eaed30 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 14 Jul 2019 21:50:43 +0200
+Subject: [PATCH] fix include to find SIOCGSTAMP with latest kernel
+
+In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
+the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
+Instead it provides only SIOCGSTAMP_OLD.
+
+The linux/sockios.h header now defines SIOCGSTAMP using either
+SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
+header file is not pulled so we get a build failure.
+
+canlogserver.c: In function 'main':
+canlogserver.c:404:21: error: 'SIOCGSTAMP' undeclared (first use in this function); did you mean 'SIOCGRARP'?
+     if (ioctl(s[i], SIOCGSTAMP, &tv) < 0)
+                     ^~~~~~~~~~
+                     SIOCGRARP
+canlogserver.c:404:21: note: each undeclared identifier is reported only once for each function it appears in
+
+Fixes:
+ - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
+
+Upstream-Status: Backport [https://github.com/linux-can/can-utils/commit/e9590b1ca75d360eaf3211bebd86058214d48064]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ canlogserver.c | 1 +
+ cansniffer.c   | 1 +
+ isotpdump.c    | 1 +
+ isotpperf.c    | 1 +
+ isotpsniffer.c | 1 +
+ slcanpty.c     | 1 +
+ 6 files changed, 6 insertions(+)
+
+diff --git a/canlogserver.c b/canlogserver.c
+index e3350b7..f53165c 100644
+--- a/canlogserver.c
++++ b/canlogserver.c
+@@ -61,6 +61,7 @@
+ 
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
++#include <linux/sockios.h>
+ #include <signal.h>
+ #include <errno.h>
+ 
+diff --git a/cansniffer.c b/cansniffer.c
+index 7b0a3fa..bf7d72e 100644
+--- a/cansniffer.c
++++ b/cansniffer.c
+@@ -61,6 +61,7 @@
+ 
+ #include <linux/can.h>
+ #include <linux/can/bcm.h>
++#include <linux/sockios.h>
+ 
+ #include "terminal.h"
+ 
+diff --git a/isotpdump.c b/isotpdump.c
+index b2b650a..36d8af3 100644
+--- a/isotpdump.c
++++ b/isotpdump.c
+@@ -55,6 +55,7 @@
+ 
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
++#include <linux/sockios.h>
+ #include "terminal.h"
+ 
+ #define NO_CAN_ID 0xFFFFFFFFU
+diff --git a/isotpperf.c b/isotpperf.c
+index db3a2b7..5852a57 100644
+--- a/isotpperf.c
++++ b/isotpperf.c
+@@ -56,6 +56,7 @@
+ 
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
++#include <linux/sockios.h>
+ 
+ #define NO_CAN_ID 0xFFFFFFFFU
+ #define PERCENTRES 2 /* resolution in percent for bargraph */
+diff --git a/isotpsniffer.c b/isotpsniffer.c
+index f42e18b..d7a4c66 100644
+--- a/isotpsniffer.c
++++ b/isotpsniffer.c
+@@ -55,6 +55,7 @@
+ 
+ #include <linux/can.h>
+ #include <linux/can/isotp.h>
++#include <linux/sockios.h>
+ #include "terminal.h"
+ 
+ #define NO_CAN_ID 0xFFFFFFFFU
+diff --git a/slcanpty.c b/slcanpty.c
+index 431ca68..7dfaf5c 100644
+--- a/slcanpty.c
++++ b/slcanpty.c
+@@ -40,6 +40,7 @@
+ 
+ #include <linux/can.h>
+ #include <linux/can/raw.h>
++#include <linux/sockios.h>
+ 
+ /* maximum rx buffer len: extended CAN frame with timestamp */
+ #define SLC_MTU (sizeof("T1111222281122334455667788EA5F\r")+1)
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
index a2d62c3667..db5055fedd 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a0
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master \
+           file://0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch \
+           "
 SRCREV = "4c8fb05cb4d6ddcd67299008db54af423f86fd05"
 
 PV = "0.0+gitr${SRCPV}"
-- 
2.23.0


