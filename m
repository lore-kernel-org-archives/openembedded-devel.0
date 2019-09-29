Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8E47F278
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 23:55:25 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 205so4512175pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 16:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2voOa26MMBJ4XiiFd6qiEctK9a83dDlZ9oBKX1JsEJc=;
	b=oniLaPNZ27Y519PKFHRL4Y+jjQTqM6jUbwe1LyYCGtUnMMc3ZeaR/KdV1r96I9/1Ri
	9/wbtkMlDJQILMYKc037rIKEozaV1TYw1CW0FwG3TgtYJCdtKa2ewv5GleNQguTIondD
	FTJJkN34+n+ANT7nsxD1tH9Nij3NjRepw0DkrMIi09dSZ5I1OluEoi6fPECpVWBsyiJF
	o2m3lGwGk1NX92YCvXONhhn6RLfWH0n+cR9L5WbtH7l3XUdJPGgZhEPWcnBE3l2MY/DN
	R+h0iA+N1vDQDMz+b5KliQpcBE44EY2+Z2gpoVxb13Sq8oxsE4YENVnrzL/5BKVXx6ne
	jXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2voOa26MMBJ4XiiFd6qiEctK9a83dDlZ9oBKX1JsEJc=;
	b=Kpl9ehSgO/Iv3AngwwPoQScJU9lso3+lLDIJO+iyhESe3SKPvmwRFYiszonVcKAZ9Z
	3XslJi9z/flC8Kz1kiaCybY1gRiehsM/nOUSc9IxWnQg7de27czG6bLJqW7z4w6XrcTo
	SJp/Pw/S2yGQMPvvMlt2XQFwtBYDVz3LbWDq0c4Odbn32EsAkhZnGuwkjNHPQcemGwHt
	K9XgeA9mll3j9MaVcgoAe6rARvACEqLqDVrHfFr7uo3q2NmSChDoBfVXRwm3gSAgQ7Vl
	FqV6j0FlwDCYURnqATCxteWOYIA5tIuVyaxRsY6qqwnTC2512+IrgDEkeJ23BVTrp7v8
	glUg==
X-Gm-Message-State: APjAAAXrQZcpm3uDZ8o2lsBnmbEueP9M53ABK4oZGSS/UNMDTzF/WDhF
	24qRRKDGZ0QbQ0kcP7ktXKHXQIrgkGg=
X-Google-Smtp-Source: APXvYqxJynyBqgB/KcNl9kAhRkNa28Cgh7iqQk+fNsUlhlX6oXxh61tNab0FQPPvmOdAzbqfDkyjFw==
X-Received: by 2002:a63:5007:: with SMTP id e7mr20315950pgb.2.1569801326470;
	Sun, 29 Sep 2019 16:55:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	p190sm14474778pfb.160.2019.09.29.16.55.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 16:55:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Sep 2019 16:55:07 -0700
Message-Id: <42f877f211aaa1b6299dc222c29f1c2d786a2987.1569801183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569801183.git.akuster808@gmail.com>
References: <cover.1569801183.git.akuster808@gmail.com>
Subject: [warrior-next 09/10] can-utils: Fix build with kernel headers >= 5.2
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
X-List-Received-Date: Sun, 29 Sep 2019 23:55:25 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 33608095e403cb6290ee3a100a1208e6c9faf9d0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ude-to-find-SIOCGSTAMP-with-latest-kernel.patch | 106 +++++++++++++++++++++
 .../recipes-extended/socketcan/can-utils_git.bb    |   4 +-
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
new file mode 100644
index 0000000..cbf3aee
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
index a2d62c3..db5055f 100644
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
2.7.4


