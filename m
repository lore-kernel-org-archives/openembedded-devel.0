Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3B8C021A7
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46627.1739178121940360202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JkrIyqFE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178131; x=1770714131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WjpOT46IchdfvClf5456lACGZ5Vz8T11xRy/Hda+/nc=;
  b=JkrIyqFEvv6+cdGIo50MkLXrYMu7NHqkhWL/nH38QbMzErNdtdUZnRkJ
   65Lwq0ZQIghjXJBe3s3xKRRFh4LWJfY52zKs38zE3PZMJ4vRmpwEpFeEW
   bGUcnlGEdppWzayUCUiPjh47YF9NtxjIyahm6xIuRjv2PxIkybplgZFZ8
   DL+1rChjhwDbR7Ql8mJdQOtNDBkyCVK9WZNKzvhPUaZNtJ0DRbT56URMp
   y8ZikhtFsQF76ieG42hQBBEyJipE092xsy14krgFaT+jxXOKafBPydkFs
   XKu/cT7YQ3PXnizAGRmrkw1BFIFEOqI8J8uFkoHaojRYIJHHPqfgQI+KX
   Q==;
X-CSE-ConnectionGUID: 0LJbfZFiRzWDnD6saapjYQ==
X-CSE-MsgGUID: K2/05pWSSTCpv9dwckXsqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189490536"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189490536"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:10 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 53D7DD4C6C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1251BD7492
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AB83F1A000B;
	Mon, 10 Feb 2025 17:02:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 58/66] python3-qface: upgrade 2.0.11 -> 2.0.12
Date: Mon, 10 Feb 2025 17:01:27 +0800
Message-Id: <1739178095-26432-58-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115384

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix parse issue due to missing space

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-qface_2.0.11.bb => python3-qface_2.0.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qface_2.0.11.bb => python3-qface_2.0.12.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.11.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.12.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-qface_2.0.11.bb
rename to meta-python/recipes-devtools/python/python3-qface_2.0.12.bb
index 9ecaf5698c..04e1847d5b 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.12.bb
@@ -2,7 +2,7 @@ SUMMARY = "A generator framework based on a common modern IDL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
 
-SRC_URI[sha256sum] = "b55c239f3ae7e23c5c8434f38901c5bcacb6afd17e88e37934b46e44558df295"
+SRC_URI[sha256sum] = "49136491806352e0c503f3ccaca5d77102a5f45f63de74c608576627ebfc81e0"
 
 inherit pypi setuptools3
 
-- 
2.43.0


