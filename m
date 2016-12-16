Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 65F3C71B45
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 22:10:38 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b1so869743pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 14:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/iz+BTAkySjGHKoKkLBAyXtkCYrk4BU6vnjASl8L5es=;
	b=O3/1rvp2Yx14IrYBRUmzoitLwH1GPzdl3tyuMSBK31n9LveUvfu2kKMosJ38MID9za
	bAvogtTgkqdkwOV/WwoJ4oYrLQmrhGzuEGIWzCkY0JqTPeoCJowosRGBHWRJtqyzY5Qf
	nK1ZAlOAI+LwTl5OL1X3iyTxS9rhmoupK8LGUxdUZ/BD8H4HiESQmfO6cYNqLCf0U9VE
	Vfoc2VSwfSzLuafn7SQb94ErCnFVipSL63gKDnL2SLXVulxLRCeJomtsKjY49oCgw9N7
	wJo3adQIZ0lyd4zPHi/CpzuECSprjFj5U1bqEjOEi0cjjn7Lr7zXKv9fUvdBfTE3qds0
	kZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/iz+BTAkySjGHKoKkLBAyXtkCYrk4BU6vnjASl8L5es=;
	b=gPlipuV/pJF1aZBPs6yZ00rAPOCBLMEmiyX3/QjkGjuPejtM596Rs4FTBpcSqnyQbs
	ilDRk5KYyIuVUBoehIylkvrnYLJzzu9BoDQjP+llQLDWmtCBBSDDlCtbArnIAgpTaid2
	INx6dZK7kJ4GtVP6hGpx1oQmqs6M2/G3MYVlpVpM1DKxD03BY48TeACYlfH+AXL+0OPv
	p1abYRyAgV030XdChGeoA4KNiUKKioK4kqmhRN/n6IxN81tJZueirrhhSeQnx4sw+tBV
	75uDDzhTuVWoqwXcuuS0yFOwU8VVhXRfBrUmWL8bSQqcq1iYKDrJdh5i9rE1X7NauomK
	ErkQ==
X-Gm-Message-State: AIkVDXKoJ33UERSdDO20Qq4JnwXS2Xt/tI1jAFXWXFTRK/sf6EMwbdmHLnVrGq49cVjUQw==
X-Received: by 10.99.139.200 with SMTP id j191mr2971261pge.162.1481926240467; 
	Fri, 16 Dec 2016 14:10:40 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	64sm14055855pfu.17.2016.12.16.14.10.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Dec 2016 14:10:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 14:10:33 -0800
Message-Id: <20161216221033.18446-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] hplip: Fix build with clang
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
X-List-Received-Date: Fri, 16 Dec 2016 22:10:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...de-cups-ppd.h-for-missing-ppd-definitions.patch | 42 ++++++++++++++++++++++
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch

diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch b/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
new file mode 100644
index 0000000..f259b5f
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
@@ -0,0 +1,42 @@
+From 7ef9c040dd959105c16d4dc67e14f3bbea25e77f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Dec 2016 19:51:19 +0000
+Subject: [PATCH] include cups/ppd.h for missing ppd definitions
+
+Fixes errors spotted by clang
+
+| prnt/hpcups/HPCupsFilter.cpp:365:18: error: use of undeclared identifier 'ppdFindAttr'
+|     if (((attr = ppdFindAttr(m_ppd, "hpPrinterLanguage", NULL)) == NULL) ||
+|                  ^
+| prnt/hpcups/HPCupsFilter.cpp:368:13: error: use of undeclared identifier 'ppdClose'
+|             ppdClose(m_ppd);
+|             ^
+| prnt/hpcups/HPCupsFilter.cpp:444:9: error: use of undeclared identifier 'ppdClose'
+|         ppdClose(m_ppd);
+|         ^
+| prnt/hpcups/HPCupsFilter.cpp:497:13: error: use of undeclared identifier 'ppdOpenFile'
+|     m_ppd = ppdOpenFile(getenv("PPD"));
+|             ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ prnt/hpcups/HPCupsFilter.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/prnt/hpcups/HPCupsFilter.h b/prnt/hpcups/HPCupsFilter.h
+index 0431a7a..eb0cad6 100644
+--- a/prnt/hpcups/HPCupsFilter.h
++++ b/prnt/hpcups/HPCupsFilter.h
+@@ -37,6 +37,7 @@
+ #include "Job.h"
+ 
+ #include "dbuscomm.h"
++#include <cups/ppd.h>
+ 
+ #define		DBITMAPFILEHEADER		14
+ #define		DBITMAPINFOHEADER		40
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 9848e5a..1f1e80c 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -9,6 +9,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://fix-libusb-paths.patch \
            file://cups-1.6.patch \
            file://configure.patch \
+           file://0001-include-cups-ppd.h-for-missing-ppd-definitions.patch \
 "
 
 DEPENDS += "cups python libusb"
-- 
2.10.2


