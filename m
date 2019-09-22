Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id B10CA6025F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 18:34:38 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id j19so10051207lja.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=sfSguQ9yN2hQ73C2BhDXYR7+My+Vx8W+a9YAAAIotBs=;
	b=JtvxIU7lbBM9vNc66jdjGmn3E7F/oIR3712L5OpA86ac0OeeYIyfVUXsU9B4+fgBwj
	Eaic1oYfcD0jpts5NoJgApw0wxcu8FCQlnKpk+Qo1pHb8wZZcMJ1mN6M1kU+KkpKZSVt
	5ejIvS3ujY+FWqfx2TnuPb47vzQC8yA9g92ju5VH+ltA4BdvvigP+04zjAoQOSnNYEt8
	sQKCqYgYtntX0FBVmWKrsWoFmPFBPnczGe4jlfpDN94LeFMSbk6QVtdXrIEYpAu6Pew5
	8SrkC/bE8bzDk2gZKvx5ZSp7wWBhMdC5tkf1+iJkiuX5xEVh7kOTnL8dCzHjISZdo4xR
	0i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sfSguQ9yN2hQ73C2BhDXYR7+My+Vx8W+a9YAAAIotBs=;
	b=kOxWhV+itL+jVYf24DpyxA7QPyhxuY1a+Z2g7JoPI6qmGby4W0psepp2tOtcThEQfN
	0Zj+DynLWRWUpjkbANBLTbz9L2XXZYTTv3Sc4Hqr408XWwsfS5VReD1MHwPKpy7KUFTz
	/Ua1V0RF5pdQxcoy297pTppiGzvnYhjwXunHCmnRwnBdGZSIu0ZgPeO5OkUTdGpl+Koj
	IBCZqyRubVd2v8HoJqBhtkKe572ORJMbYYFssKArT62uwzLdcRa0uosmA78b8EzU70vc
	uD3X2/itL1PnUWuJyF/tFKqQwSGoDnHUX1T2bPBo8rtejAGvX0+P0T3xpEUO/QYPoxEU
	c6pg==
X-Gm-Message-State: APjAAAUZr8QoGdeYRbkkKpt5Y5ChognV/VdWiPege026qCO3S84HjTef
	Wfcorujy6rzQKwY6YTnUwEbc2qpxzHU=
X-Google-Smtp-Source: APXvYqzJv+4zAgK76GDWlHGMSuMY5W7sjexw2Ky7jduedNYhx2Uj7kkFhSD22iP/jkE/1QomcBwzFA==
X-Received: by 2002:a2e:8054:: with SMTP id p20mr15423566ljg.36.1569177278761; 
	Sun, 22 Sep 2019 11:34:38 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id d3sm1796913ljc.66.2019.09.22.11.34.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 22 Sep 2019 11:34:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Sep 2019 20:34:31 +0200
Message-Id: <20190922183431.32531-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] can-utils: bump to latest revision
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
X-List-Received-Date: Sun, 22 Sep 2019 18:34:39 -0000

License header was moved due to SPDX-License-Identifier being added to
the file.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 106 ------------------
 .../socketcan/can-utils_git.bb                |   9 +-
 2 files changed, 3 insertions(+), 112 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/meta-oe/recipes-extended/socketcan/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
deleted file mode 100644
index cbf3aee10..000000000
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
index db5055fed..b674d7fc4 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -1,18 +1,15 @@
 SUMMARY = "Linux CAN network development utilities"
 DESCRIPTION = "Linux CAN network development"
 LICENSE = "GPLv2 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a069ac1436553ee7"
+LIC_FILES_CHKSUM = "file://include/linux/can.h;beginline=2;endline=44;md5=390a2c9a3c5e3595a069ac1436553ee7"
 
 DEPENDS = "libsocketcan"
 
-SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master \
-           file://0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch \
-           "
-SRCREV = "4c8fb05cb4d6ddcd67299008db54af423f86fd05"
+SRC_URI = "git://github.com/linux-can/${BPN}.git;protocol=git;branch=master"
+SRCREV = "26ae1fffa8f290442882d3e59c7363cb371e2380"
 
 PV = "0.0+gitr${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-
-- 
2.17.1


