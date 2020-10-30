Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.9533.1604037591335707844
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:59:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,432,1596470400"; 
   d="scan'208";a="100750157"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 30 Oct 2020 13:59:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id A69A34CE3119
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2020 13:59:49 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 30 Oct 2020 13:59:50 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] toybox: upgrade 0.8.3 -> 0.8.4
Date: Fri, 30 Oct 2020 13:59:41 +0800
Message-ID: <1604037581-71974-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A69A34CE3119.A1D24
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Tackle-SIGEMT-and-SIGSTKFLT-is-not-glibc-specific.patch
mips-no-STKFLT.patch
Removed since these are included in 0.8.4

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...-and-SIGSTKFLT-is-not-glibc-specific.patch | 30 -------------------
 .../toybox/toybox/mips-no-STKFLT.patch        | 25 ----------------
 .../{toybox_0.8.3.bb => toybox_0.8.4.bb}      |  4 +--
 3 files changed, 1 insertion(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/0001-Tackle-SIGEMT-and-SIGSTKFLT-is-not-glibc-specific.patch
 delete mode 100644 meta-oe/recipes-core/toybox/toybox/mips-no-STKFLT.patch
 rename meta-oe/recipes-core/toybox/{toybox_0.8.3.bb => toybox_0.8.4.bb} (94%)

diff --git a/meta-oe/recipes-core/toybox/toybox/0001-Tackle-SIGEMT-and-SIGSTKFLT-is-not-glibc-specific.patch b/meta-oe/recipes-core/toybox/toybox/0001-Tackle-SIGEMT-and-SIGSTKFLT-is-not-glibc-specific.patch
deleted file mode 100644
index faabc597e..000000000
--- a/meta-oe/recipes-core/toybox/toybox/0001-Tackle-SIGEMT-and-SIGSTKFLT-is-not-glibc-specific.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9e5b1420b89813ee3c58c2b792077fa8bb71f327 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 21 May 2020 13:53:27 -0700
-Subject: [PATCH] Tackle SIGEMT and SIGSTKFLT is not glibc specific
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/portability.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/lib/portability.c b/lib/portability.c
-index 294141c6..1c7ebc12 100644
---- a/lib/portability.c
-+++ b/lib/portability.c
-@@ -430,8 +430,11 @@ static const struct signame signames[] = {
-   // Non-POSIX signals that cause termination
-   SIGNIFY(PROF), SIGNIFY(IO),
- #ifdef __linux__
--# if !defined(__GLIBC__) && !defined(__mips__)
-+# ifdef SIGSTKFLT
-    SIGNIFY(STKFLT),
-+# endif
-+# ifdef SIGEMT
-+   SIGNIFY(EMT),
- # endif
-   SIGNIFY(POLL), SIGNIFY(PWR),
- #elif defined(__APPLE__)
--- 
-2.26.2
-
diff --git a/meta-oe/recipes-core/toybox/toybox/mips-no-STKFLT.patch b/meta-oe/recipes-core/toybox/toybox/mips-no-STKFLT.patch
deleted file mode 100644
index 7ab95932c..000000000
--- a/meta-oe/recipes-core/toybox/toybox/mips-no-STKFLT.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-glibc on mips is missing SIGSTKFLT
-
-Do not therefore assume it being available linuxwide
-
-Fixes
-| lib/portability.c:433:3: error: use of undeclared identifier 'SIGSTKFLT'
-|   SIGNIFY(STKFLT), SIGNIFY(POLL), SIGNIFY(PWR),
-|   ^
-
-Upstream-Status: Submitted [https://github.com/landley/toybox/pull/195]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/lib/portability.c
-+++ b/lib/portability.c
-@@ -430,7 +430,10 @@ static const struct signame signames[] =
-   // Non-POSIX signals that cause termination
-   SIGNIFY(PROF), SIGNIFY(IO),
- #ifdef __linux__
--  SIGNIFY(STKFLT), SIGNIFY(POLL), SIGNIFY(PWR),
-+# if !defined(__GLIBC__) && !defined(__mips__)
-+   SIGNIFY(STKFLT),
-+# endif
-+  SIGNIFY(POLL), SIGNIFY(PWR),
- #elif defined(__APPLE__)
-   SIGNIFY(EMT), SIGNIFY(INFO),
- #endif
diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.3.bb b/meta-oe/recipes-core/toybox/toybox_0.8.4.bb
similarity index 94%
rename from meta-oe/recipes-core/toybox/toybox_0.8.3.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.4.bb
index 1513255c4..cc98b9ec0 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.3.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.4.bb
@@ -8,10 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
-           file://mips-no-STKFLT.patch \
-           file://0001-Tackle-SIGEMT-and-SIGSTKFLT-is-not-glibc-specific.patch \
            "
-SRC_URI[sha256sum] = "eab28fd29d19d4e61ef09704e5871940e6f35fd35a3bb1285e41f204504b5c01"
+SRC_URI[sha256sum] = "cb2a565a8d30015d08d73628795dca51a85b99b149aeabbbecd9e8dbdbd8fddc"
 
 SECTION = "base"
 
-- 
2.25.1



