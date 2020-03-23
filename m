Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.2108.1584988697703793855
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2020 11:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 02NIcHaQ001936
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2020 11:38:17 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Mon, 23 Mar 2020
 11:38:11 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] nss: suppress unused-function compile error
Date: Mon, 23 Mar 2020 11:38:11 -0700
Message-ID: <20200323183811.67969-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Allows qemumips64 nss to compile.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../nss/nss/no_unused_function_error.patch             | 18 ++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.bb                |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/no_unused_function_error.patch

diff --git a/meta-oe/recipes-support/nss/nss/no_unused_function_error.patch b/meta-oe/recipes-support/nss/nss/no_unused_function_error.patch
new file mode 100644
index 0000000..cce748f
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/no_unused_function_error.patch
@@ -0,0 +1,18 @@
+nss: suppress unused-function compile error
+
+Upstream-Status: Inappropriate [workaround]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/nss/coreconf/Werror.mk
++++ b/nss/coreconf/Werror.mk
+@@ -96,7 +96,7 @@ ifndef WARNING_CFLAGS
+     endif #ndef NSS_ENABLE_WERROR
+ 
+     ifeq ($(NSS_ENABLE_WERROR),1)
+-      WARNING_CFLAGS += -Werror
++      WARNING_CFLAGS += -Werror -Wno-error=unused-function
+     else
+       # Old versions of gcc (< 4.8) don't support #pragma diagnostic in functions.
+       # Use this to disable use of that #pragma and the warnings it suppresses.
diff --git a/meta-oe/recipes-support/nss/nss_3.51.bb b/meta-oe/recipes-support/nss/nss_3.51.bb
index 889967c..73e5150 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://no_unused_function_error.patch \
            "
 
 SRC_URI[md5sum] = "e59dc16965ef7713669c628d2640ebd1"
-- 
2.7.4

