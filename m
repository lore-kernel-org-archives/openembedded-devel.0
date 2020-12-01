Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.4188.1606789103770124678
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:18:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; 
   d="scan'208";a="101914147"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Dec 2020 10:18:21 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1384E4CE3B8D
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Dec 2020 10:18:19 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 1 Dec 2020 10:18:13 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] tcsh: upgrade 6.22.02 -> 6.22.03
Date: Tue, 1 Dec 2020 10:18:13 +0800
Message-ID: <1606789093-56752-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1384E4CE3B8D.A9FEA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Remove-defining-handle_interrupt-twice.patch
Removed since this is included in 6.22.03.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...move-defining-handle_interrupt-twice.patch | 28 -------------------
 .../tcsh/{tcsh_6.22.02.bb => tcsh_6.22.03.bb} |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-shells/tcsh/tcsh/0001-Remove-defining-handle_interrupt-twice.patch
 rename meta-oe/recipes-shells/tcsh/{tcsh_6.22.02.bb => tcsh_6.22.03.bb} (87%)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh/0001-Remove-defining-handle_interrupt-twice.patch b/meta-oe/recipes-shells/tcsh/tcsh/0001-Remove-defining-handle_interrupt-twice.patch
deleted file mode 100644
index d6d6ae06d..000000000
--- a/meta-oe/recipes-shells/tcsh/tcsh/0001-Remove-defining-handle_interrupt-twice.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2c77b61506aa867a873e3691214983b3eb7f652d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Aug 2020 19:49:35 -0700
-Subject: [PATCH] Remove defining handle_interrupt twice
-
-Fixes build with -fno-common
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tc.sig.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/tc.sig.c b/tc.sig.c
-index 77659ca..576605a 100644
---- a/tc.sig.c
-+++ b/tc.sig.c
-@@ -56,7 +56,6 @@ int alrmcatch_disabled; /* = 0; */
- int phup_disabled; /* = 0; */
- int pchild_disabled; /* = 0; */
- int pintr_disabled; /* = 0; */
--int handle_interrupt; /* = 0; */
- 
- int
- handle_pending_signals(void)
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.22.03.bb
similarity index 87%
rename from meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
rename to meta-oe/recipes-shells/tcsh/tcsh_6.22.03.bb
index 541f5505f..fab626c61 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.22.02.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.22.03.bb
@@ -12,10 +12,9 @@ SRC_URI = " \
     https://astron.com/pub/${BPN}/${BP}.tar.gz \
     file://0001-Enable-system-malloc-on-all-linux.patch \
     file://0002-Add-debian-csh-scripts.patch \
-    file://0001-Remove-defining-handle_interrupt-twice.patch \
 "
-SRC_URI[md5sum] = "f34909eab33733aecc05d27adc82277b"
-SRC_URI[sha256sum] = "ed287158ca1b00ba477e8ea57bac53609838ebcfd05fcb05ca95021b7ebe885b"
+SRC_URI[md5sum] = "c9387b7c8cf958956e75b1fa4e59b612"
+SRC_URI[sha256sum] = "be2cfd653d2a0c7f506d2dd14c12324ba749bd484037be6df44a3973f52262b7"
 
 EXTRA_OEMAKE += "CC_FOR_GETHOST='${BUILD_CC}'"
 inherit autotools
-- 
2.25.1



