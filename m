Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05CEC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.7738.1709714691125671463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kiJVM58X;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714691; x=1741250691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0bihSHDBP+XK5zKkPEyEqS3MgTpA05nXRUqLYONQy1A=;
  b=kiJVM58XanAqsfd4TaSCeIsI+lmG4YRGdPt/HSgDpY59H6Xkp21ayCtl
   T5bkFe8YyKjgN+PPZmvNZluDJ2l8L+MJN3NL8JgdLInCBsyBFzl8lrOPh
   UNnk63AH8/IIi+KL92x2obPLgdeH2zC3kOmXShQF8T/EdDirx4nfLDGD+
   kBViRFtt4gJQ3VxXsOv1QTPCJ7cIhg2QMmCbryvRPkH4x1flRz9GFfeGL
   KMX1QL+jK7Vf38UUS/uHiWO4tA5W9LKg0xiA1B1n3Ty/wwhKkA/XVeGh+
   VbGaLlhgv65G6FsNIsGAcatbYfmfvMLwf3K43oPLi4zxertkvS6FBabQp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151251618"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151251618"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E429CEB462
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A1DAFD9E6
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD35141182
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D22F1A006A;
	Wed,  6 Mar 2024 16:44:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/26] python3-scrypt: upgrade 0.8.20 -> 0.8.24
Date: Wed,  6 Mar 2024 16:43:25 +0800
Message-Id: <1709714608-19296-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-0.205600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yRIRh9wkXSlFnJdsOLB4zv5fv9SYkzU9kdnf
	JrUSEbFDJMPD8FR5f58F1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547V5fSMRD1zqRm2
	17yB1jE1ozHPOJ2XzeHbFAx3ld4nvloOuGcWob3TknMSTG9lH+MFy2g/jvFulQcN87KUd5Y+Ug5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlymoWdawv0fUy0kUOHNWkBYRt3O
	XM6DMS6m7Asx3YsRakDEW4lPEfCaJBr8WLw3r7ZDky4y7s39uH71RnQig6/z7E1GT/OOJ7h/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109163

From: Wang Mingyu <wangmy@fujitsu.com>

0001-py-scrypt-remove-the-hard-coded-include-paths.patch
refreshed for 0.8.24

Changelog:
==========
-Remove travis and appveyor
-Support building on MSYS2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ypt-remove-the-hard-coded-include-paths.patch | 16 +++++++---------
 ...scrypt_0.8.20.bb => python3-scrypt_0.8.24.bb} |  2 +-
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scrypt_0.8.20.bb => python3-scrypt_0.8.24.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
index d535e4326..3678d46cf 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
+++ b/meta-python/recipes-devtools/python/python3-scrypt/0001-py-scrypt-remove-the-hard-coded-include-paths.patch
@@ -1,4 +1,4 @@
-From d8db473ce9346cd6254c90e13ac45b3bbde494c4 Mon Sep 17 00:00:00 2001
+From 47ede0950740e8919c28774840e77f223d5f3124 Mon Sep 17 00:00:00 2001
 From: Derek Straka <derek@asterius.io>
 Date: Sun, 11 Mar 2018 19:55:38 -0400
 Subject: [PATCH] py-scrypt: remove the hard coded include paths
@@ -11,16 +11,14 @@ Signed-off-by: Derek Straka <derek@asterius.io>
  1 file changed, 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index e36adc4..2ebfbf1 100644
+index 419a982..3f1fe52 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -24,7 +24,6 @@ if sys.platform.startswith('linux'):
-                      ('HAVE_SYS_SYSINFO_H', '1'),
-                      ('_FILE_OFFSET_BITS', '64')]
+@@ -26,7 +26,6 @@ if sys.platform.startswith('linux'):
+         ('_FILE_OFFSET_BITS', '64'),
+     ]
      libraries = ['crypto', 'rt']
 -    includes = ['/usr/local/include', '/usr/include']
      CFLAGS.append('-O2')
- elif sys.platform.startswith('win32'):
-     define_macros = [('inline', '__inline')]
--- 
-2.7.4
+ elif sys.platform.startswith('win32') and os.environ.get('MSYSTEM'):
+     msys2_env = os.getenv('MSYSTEM')
diff --git a/meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb b/meta-python/recipes-devtools/python/python3-scrypt_0.8.24.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb
rename to meta-python/recipes-devtools/python/python3-scrypt_0.8.24.bb
index ce0d4de9c..94c83e495 100644
--- a/meta-python/recipes-devtools/python/python3-scrypt_0.8.20.bb
+++ b/meta-python/recipes-devtools/python/python3-scrypt_0.8.24.bb
@@ -5,7 +5,7 @@ HOMEPAGE="https://github.com/holgern/py-scrypt"
 
 SRC_URI += "file://0001-py-scrypt-remove-the-hard-coded-include-paths.patch"
 
-SRC_URI[sha256sum] = "0d226c1c6744fb2e308b391410669b1df5cfe82637ffcb5ed489bf82b2d2eb78"
+SRC_URI[sha256sum] = "98ffde45e4a95461d73ded54ba7a26857679920d4f8ff320f6f7ade6e29531bd"
 
 inherit pypi ptest setuptools3 dos2unix
 
-- 
2.34.1


