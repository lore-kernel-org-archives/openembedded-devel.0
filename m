Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AC1C021BD
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46470.1739178127190769251
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LxhneuYS;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178127; x=1770714127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QYnEyq7Mg/sKBFHqhc7ZBCuCuqfKsNj6OMbbDeKZbHg=;
  b=LxhneuYSD+fbz//8cx4f9HBHoju6pbebyoQrTpZSieVC9YuORhDiipBW
   huzfMdxhC5l2wHFCIlQIQ/7cyEHpb6q0VnKR+JnFWIcVzzeFiGU6C/8z3
   Rr3DjBOu2ET5pEM9hGNcq/f70cnMm7aMpgxs8IQmj4LmMqJea5efQKSkJ
   CGQeYzQ+qKKckFYiZ+EyMTXBiSe0WIA2SRRkD7WVBHugB71X/7cAnfZJF
   ZDm45GorIJav+0T+VM8L1Karo0gYWfVuVKNskfUl2dNQogXAleSOjjg9n
   +Z8Q2o2zB6Wjh4bVJx+eUB7Sb5I6lPfMKdSxunNwTY0bxqIyd2/BcYVKd
   g==;
X-CSE-ConnectionGUID: CF25q5f7RVuqlruCNtfy2A==
X-CSE-MsgGUID: 4Zd5YWMDRlqi0saVrli/pQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712447"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712447"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:05 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D6CC3D4C73
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 98DB2D4C35
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3DAF71A006C;
	Mon, 10 Feb 2025 17:02:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/66] python3-jdatetime: upgrade 5.1.0 -> 5.2.0
Date: Mon, 10 Feb 2025 17:01:14 +0800
Message-Id: <1739178095-26432-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115375

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Enhanced character conversion functions using regular expressions.
- Improved date handling in Jalali date and time classes.
- Added new test cases for edge cases and date conversions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jdatetime_5.1.0.bb => python3-jdatetime_5.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_5.1.0.bb => python3-jdatetime_5.2.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_5.1.0.bb b/meta-python/recipes-devtools/python/python3-jdatetime_5.2.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-jdatetime_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_5.2.0.bb
index e2db6e3428..257ac93fbf 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_5.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "25af1f48d1456b9a0acc7b32c68c66e9cccbae541672f9b9724f274d7810a307"
+SRC_URI[sha256sum] = "c81d5898717b82b609a3ce2a73f8b8d3230b0c757e5c0de9d6b1acfdc224f551"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.43.0


