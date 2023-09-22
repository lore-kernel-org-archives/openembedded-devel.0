Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F562CD4F53
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:19:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.18544.1695377960065652485
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ev8OwRZB;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695377960; x=1726913960;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TT/9l7BMAnIIlpnnAR5cXTc3VrPh/JTiQt1lKQgQfyQ=;
  b=ev8OwRZBa1s7IZpWvh88vJMfEhRTRTGMAf3h4VxbykfztY4Nz2Y/PuxD
   3IktMF/f75cKpUisN5qd2UgaD+JCxMTr6p4fkOvsjVvm8V87jX1ewfj5z
   /c4btq+W2NrgxUdR1xE/yzlfaDvXCtcroX/FxDAjhplgpz75ljECJMoac
   zAo6g545V+vWVr5jLL2Ya5LkPA3IaIeyIhrsO1xp+24noJsSpGUlWTMg6
   TMVPibyVzkJkaB6RkL5mXSDk/FnCgY8iaC9Urns+KqwA3D+yPfe4YTjFd
   t3JVyN2FxdCqIvefqIeJaQutPIdiuwqH+64wGiv1q1NoIIuvJJxWh7m0J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="383542992"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="383542992"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 03:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="817729064"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="817729064"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2023 03:19:19 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] iniparser: Fix CVE-2023-33461
Date: Fri, 22 Sep 2023 17:59:38 +0800
Message-Id: <20230922095941.3958983-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230922095941.3958983-1-chee.yang.lee@intel.com>
References: <20230922095941.3958983-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 10:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105051

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../iniparser/iniparser/CVE-2023-33461.patch  | 48 +++++++++++++++++++
 .../iniparser/iniparser_4.1.bb                |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch

diff --git a/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch b/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
new file mode 100644
index 0000000000..db5fb06aac
--- /dev/null
+++ b/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
@@ -0,0 +1,48 @@
+CVE: CVE-2023-33461
+Upstream-Status: Backport [https://github.com/ndevilla/iniparser/pull/146/commits/ace9871f65d11b5d73f0b9ee8cf5d2807439442d]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From ace9871f65d11b5d73f0b9ee8cf5d2807439442d Mon Sep 17 00:00:00 2001
+From: Antonio <antoniolrt@gmail.com>
+Date: Fri, 2 Jun 2023 15:03:10 -0300
+Subject: [PATCH] Handle null return from iniparser_getstring
+
+Fix handling of NULL returns from iniparser_getstring in
+iniparser_getboolean, iniparser_getlongint and iniparser_getdouble,
+avoiding a crash.
+---
+ src/iniparser.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/iniparser.c b/src/iniparser.c
+index f1d1658..dbceb20 100644
+--- a/src/iniparser.c
++++ b/src/iniparser.c
+@@ -456,7 +456,7 @@ long int iniparser_getlongint(const dictionary * d, const char * key, long int n
+     const char * str ;
+ 
+     str = iniparser_getstring(d, key, INI_INVALID_KEY);
+-    if (str==INI_INVALID_KEY) return notfound ;
++    if (str==NULL || str==INI_INVALID_KEY) return notfound ;
+     return strtol(str, NULL, 0);
+ }
+ 
+@@ -511,7 +511,7 @@ double iniparser_getdouble(const dictionary * d, const char * key, double notfou
+     const char * str ;
+ 
+     str = iniparser_getstring(d, key, INI_INVALID_KEY);
+-    if (str==INI_INVALID_KEY) return notfound ;
++    if (str==NULL || str==INI_INVALID_KEY) return notfound ;
+     return atof(str);
+ }
+ 
+@@ -553,7 +553,7 @@ int iniparser_getboolean(const dictionary * d, const char * key, int notfound)
+     const char * c ;
+ 
+     c = iniparser_getstring(d, key, INI_INVALID_KEY);
+-    if (c==INI_INVALID_KEY) return notfound ;
++    if (c==NULL || c==INI_INVALID_KEY) return notfound ;
+     if (c[0]=='y' || c[0]=='Y' || c[0]=='1' || c[0]=='t' || c[0]=='T') {
+         ret = 1 ;
+     } else if (c[0]=='n' || c[0]=='N' || c[0]=='0' || c[0]=='f' || c[0]=='F') {
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
index f9e1530161..5e42cdcb06 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -10,7 +10,9 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \
            file://0001-iniparser.pc-Make-libpath-a-variable.patch \
-	   file://Add-CMake-support.patch"
+	   file://Add-CMake-support.patch \
+           file://CVE-2023-33461.patch \
+"
 
 SRCREV= "deb85ad4936d4ca32cc2260ce43323d47936410d"
 
-- 
2.37.3


