Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id EB072605C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 20:18:06 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id my20so1307592pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Sep 2016 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jqc3cRo5NuwkAWGEo15ZBSKoTjZxUCJwclA/BqjvH5g=;
	b=a/r6P0SOZX6AHsTC24fbwdbsrMdRfQ12f7jg9wfoFSP2zFgoN1VTsOZnO3FQBunE1W
	9g3rYUEKtBLEkx4/B8ZWb9q3Xcrz7Hs1n8OYBEEZAWC9zNn3q64+7ria/2/O4XODR8zX
	X+HmIxiqTCvk5D7Cqmtgm8j0nASPcgGkAz59/IUcgkartGAfIuE0b0t5lG3ota9EZSmd
	EPyuPyq9ksuscoCREdaRo8ljqp1poQS/7cj9xyscIZf3d0rsmotJ7BdjGdWeQeWE2OcM
	2phvV17M1TXDZsqdkNgu+6YXBwCSC3cQgFoTvQZIadv+M68sAdK4HM0ugYB6j3u3Tcs4
	wmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jqc3cRo5NuwkAWGEo15ZBSKoTjZxUCJwclA/BqjvH5g=;
	b=VuQfrtOprh7z0vIZIFKc3PLsa4WzzAPtVWUeFdqcGqVee6DQ3aUmZQJzqrgajYXitA
	xKC+ihRrCA7N/sDgqdNulja/uS5k+18Ugdu9AzS5IdQkUdommBvK8nVQ4RqL+YsEcrSd
	Oj5epT/VumXJG4E7T5pBwti/OcEukOSsUixDOU6YnxzOTfqto7/gnpmYJhw19oPbmxka
	mL5WU+/VL30BKX8KxTb0B7Dpr0O3p9pNFohqmm9Qlm8ozUyC4UxaJbLQ1Ai/y44AKqYp
	i+UIClGYcXo7VStyVU199XLGSJep8MyrmYlzuqxurnZJNeiGZzSlMQ9kjFU3AzxqyepB
	FPPg==
X-Gm-Message-State: AE9vXwMyQLziOLyss86QAOAyfmT/P1zgoyLsZriwB7WAc/M9rP1FHAiOpnpDonk3dF61og==
X-Received: by 10.66.72.69 with SMTP id b5mr58053465pav.98.1474402687616;
	Tue, 20 Sep 2016 13:18:07 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id z5sm110645pff.3.2016.09.20.13.18.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Sep 2016 13:18:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Sep 2016 13:17:57 -0700
Message-Id: <20160920201759.28409-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-networking][PATCH 1/3] net-snmp: Fix build issue found with musl
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
X-List-Received-Date: Tue, 20 Sep 2016 20:18:09 -0000

limits.h is needed for PATH_MAX and NAME_MAX

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-get_pid_from_inode-Include-limit.h.patch  | 29 +++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   | 33 +++++++++++-----------
 2 files changed, 46 insertions(+), 16 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
new file mode 100644
index 0000000..60ce809
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-get_pid_from_inode-Include-limit.h.patch
@@ -0,0 +1,29 @@
+From 7136d593ba96b64537069637c328bc65e1b66b2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 Jul 2016 18:34:39 +0000
+Subject: [PATCH] get_pid_from_inode: Include limit.h
+
+PATH_MAX and NAME_MAX are required by this file
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ agent/mibgroup/util_funcs/get_pid_from_inode.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/agent/mibgroup/util_funcs/get_pid_from_inode.c b/agent/mibgroup/util_funcs/get_pid_from_inode.c
+index 8e157ae..a494ec7 100644
+--- a/agent/mibgroup/util_funcs/get_pid_from_inode.c
++++ b/agent/mibgroup/util_funcs/get_pid_from_inode.c
+@@ -5,6 +5,7 @@
+ #include <net-snmp/output_api.h>
+ 
+ #include <ctype.h>
++#include <limits.h>
+ #include <stdio.h>
+ #if HAVE_STDLIB_H
+ #include <stdlib.h>
+-- 
+1.8.3.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 4ad5b21..1997d5c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -8,22 +8,23 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5
 DEPENDS = "openssl libnl pciutils"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
-        file://init \
-        file://snmpd.conf \
-        file://snmptrapd.conf \
-        file://systemd-support.patch \
-        file://snmpd.service \
-        file://snmptrapd.service \
-        file://net-snmp-add-knob-whether-nlist.h-are-checked.patch \
-        file://fix-libtool-finish.patch \
-        file://net-snmp-testing-add-the-output-format-for-ptest.patch \
-        file://run-ptest \
-        file://dont-return-incompletely-parsed-varbinds.patch \
-        file://0001-config_os_headers-Error-Fix.patch \
-        file://0001-config_os_libs2-Error-Fix.patch \
-        file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
-        file://net-snmp-agentx-crash.patch \
-"
+           file://init \
+           file://snmpd.conf \
+           file://snmptrapd.conf \
+           file://systemd-support.patch \
+           file://snmpd.service \
+           file://snmptrapd.service \
+           file://net-snmp-add-knob-whether-nlist.h-are-checked.patch \
+           file://fix-libtool-finish.patch \
+           file://net-snmp-testing-add-the-output-format-for-ptest.patch \
+           file://run-ptest \
+           file://dont-return-incompletely-parsed-varbinds.patch \
+           file://0001-config_os_headers-Error-Fix.patch \
+           file://0001-config_os_libs2-Error-Fix.patch \
+           file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
+           file://net-snmp-agentx-crash.patch \
+           file://0001-get_pid_from_inode-Include-limit.h.patch \
+           "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
 
-- 
2.9.3


