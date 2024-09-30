Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE45CF649E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.49306.1727682240233710259
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZWZc9gij;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682240; x=1759218240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+AMfDBhXOHgyIjbWch/0M2odwI9EMun1FnLajz0OrFw=;
  b=ZWZc9gijGJKb6RXPz/H0jGH9gWfg9i096/rn3niAYhY3r6z1q2oV0Z50
   EWbHjE2xfDIvDMK/uSj6zrbvzB1ETxYNIqT0RgDu1vfNa9bCM+E4WhFfX
   qxXIGkjcuZA7JaC6084MQIR3EUxYgCen7VwR2S06v6aROD0/8LygbYor2
   8jqX3dPpLqrjgB3uGG5cZdmUIojlcgOTPFMA9jM6Lrce1CVTlQAeVwmZP
   1Hs6YHijlSXolNTbnz0KHkCBMIwNfgfHjrmMhSNxMdrkV7sFGkofsoMtQ
   au76vbVWxALgn5VDpUwbT60Qi+g3igyYm+cVJy8syPOpMXLH4BbnV16vy
   Q==;
X-CSE-ConnectionGUID: GO1dp9vMTCmYV5oOysLmSg==
X-CSE-MsgGUID: HNnYuV4dRwaGBcEJVxMg2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163217066"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163217066"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:47 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44E39C68E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 80171D50A8
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14D946B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B82F51A000A;
	Mon, 30 Sep 2024 15:43:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/40] python3-h5py: upgrade 3.11.0 -> 3.12.1
Date: Mon, 30 Sep 2024 15:42:47 +0800
Message-Id: <1727682185-12664-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--0.567300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yTo39wOA02LhcDzcoONn/M6UoooDQSUSrdnf
	JrUSEbFDJMPD8FR5f58F1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0547V5fSMRD1zqHeK
	4V9iofKinJlHH+cwDTuuLFZZYlisfHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAU+1rcxndm+EBt4e
	Jq7eDFFTtE6eElKxw1Jvhtxwdgd1P62gBzaP673xLKVnyk1SubfKV7/6y4gj8iJTTwZL2F6va69
	f1MPO6Z7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112590

From: Wang Mingyu <wangmy@fujitsu.com>

0001-setup_build.py-avoid-absolute-path.patch
refreshed for 3.12.1

Changelog:
 https://github.com/h5py/h5py/blob/master/docs/whatsnew/3.12.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-setup_build.py-avoid-absolute-path.patch          | 7 +++----
 .../{python3-h5py_3.11.0.bb => python3-h5py_3.12.1.bb}     | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.11.0.bb => python3-h5py_3.12.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
index 0b8555734..de2f09ec8 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -1,4 +1,4 @@
-From 6f8cee826ef9309c174aa97cb6af2ba532ed9dba Mon Sep 17 00:00:00 2001
+From 59d1cc34739a18a32d3250973af2357c41d8d156 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 28 Jan 2021 18:44:10 -0800
 Subject: [PATCH] setup_build.py: avoid absolute path
@@ -9,16 +9,15 @@ Upstream-Status: Submitted [https://github.com/h5py/h5py/pull/1803]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
-
 ---
  setup_build.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup_build.py b/setup_build.py
-index 78c6677..64db7f7 100644
+index a041fa6..4d44215 100644
 --- a/setup_build.py
 +++ b/setup_build.py
-@@ -21,7 +21,7 @@ from setup_configure import BuildConfig
+@@ -20,7 +20,7 @@ from setup_configure import BuildConfig
  
  
  def localpath(*args):
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb
index 1cf5f5638..a84dd2882 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.12.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "7b7e8f78072a2edec87c9836f25f34203fd492a4475709a18b417a33cfb21fa9"
+SRC_URI[sha256sum] = "326d70b53d31baa61f00b8aa5f95c2fcb9621a3ee8365d770c551a13dbbcbfdf"
 
 SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch"
 
-- 
2.34.1


