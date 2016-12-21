Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 78FCE71BE5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:03:11 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i5so5389756pgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vNszciFR9p47I+NOKa/adK+Fl/xK/qUmGC8Pf9MMbGY=;
	b=JYFSHWMQ2mnQtPWvCClaRRyS4TzpgjBWdgg8U0lOCs9AJZkxYCXririFW23FSmboJN
	idaL157K0qorCfJfsnhGkic8JRh2utbDi7I0VqQ9oXX+2E6laYwOIMZFv0fEyJTmRFn6
	zp5JbaacQ+Go5O2L71sFyu6KJzE7SeE16N5GhtcOivasOH7ji/ES99MYB2u68hCezODu
	Ye4BwBM5RJa+lgUssArsbawUmgcSEvSPS6YnlJMqP1az85LiZMljESFMGicVDQBIwKti
	tV/KXzqsVWZ8Kd/WhirmzXNmJCPr9KlKb8lUc5ZRXbINtylIiZoUuar8Ju9urcdzDgH5
	eaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vNszciFR9p47I+NOKa/adK+Fl/xK/qUmGC8Pf9MMbGY=;
	b=dCuFI1Ay6OfwXphEM7LpGp4KCT0/ZZH6y08Yc6XQ2srm9AmnhVzHR2nlB1TboAoVFs
	8HfbE7B/CTsgjauMb6v30DstHzt6YWsZ7+OpB14MLdyyMc+Akvr7BSRTyq6ESWdq1heX
	NMFt4Sxi8DDRtCXBfAKv7svsqIcxeK4cRHNdPYPJfeYlny+rZuO+q1C8Rvm9BGm8ft46
	vpIQJyXtwfzoZ0YNs2GwQA5fLE7Nj8H4PFKF56ke5nfXzm+Rlz1PeRKbmCqAcw8P+BMU
	jWv8168YqnYtvyodyekW2BYGC7MG6MbmJ82kh3icfm9glEUntB5DEr2MRyfVwnqg0lNV
	kSdg==
X-Gm-Message-State: AIkVDXKfInc8q8XYlAfdxz6UuhhHxQymI9VoKBFuxIa4YrpS/PCdxTWUEAlOhHgGkpUwJg==
X-Received: by 10.98.68.84 with SMTP id r81mr2620243pfa.174.1482300193537;
	Tue, 20 Dec 2016 22:03:13 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s197sm43526435pgc.38.2016.12.20.22.03.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 22:03:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2016 22:03:04 -0800
Message-Id: <20161221060306.19798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH V2] hplip: Fix build with clang
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
X-List-Received-Date: Wed, 21 Dec 2016 06:03:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...de-cups-ppd.h-for-missing-ppd-definitions.patch | 40 ++++++++++++++++++++++
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch

diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch b/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
new file mode 100644
index 000000000..84a39aeb8
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
@@ -0,0 +1,40 @@
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
+Index: hplip-3.12.6/prnt/hpcups/HPCupsFilter.h
+===================================================================
+--- hplip-3.12.6.orig/prnt/hpcups/HPCupsFilter.h
++++ hplip-3.12.6/prnt/hpcups/HPCupsFilter.h
+@@ -37,7 +37,7 @@
+ #include "Job.h"
+ 
+ #include "dbuscomm.h"
+-
++#include <cups/ppd.h>
+ #define		DBITMAPFILEHEADER		14
+ #define		DBITMAPINFOHEADER		40
+ 
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 9848e5ac1..1f1e80ce8 100644
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
2.11.0


