Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D49C369A5
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.42480.1744017449875198587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CujeJGq5;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017452; x=1775553452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7nKHKOzpA3v9E8HQUpX87aDxrH+KLEaF60cSfx+rDno=;
  b=CujeJGq5OSlDBbBGTA5WNFAhmSYvugcynEi6D+i+o5wxxEgcjziqwtzh
   8ilY9+kPkdV2E8vJngG7lgDM2mHWb8JR6t7DFnpbp/W8TXYShvqlBRtpt
   eadMKZksG/EkhCg4LgTZHN+THKkbXuDAIATOpIudkxJVq/leawt9Mx1uu
   FPhtYem1R3e5ZgyutAJ8TBSZlaFXT3CaeTsoy6/KcSSmJPmTG63VDaq7K
   f9ZbB54H5Gw2SDHNtlFQ+ePBMOU7xFu9pfGbpSLJ7j67f19Po3Y7IQpZq
   1e3tu550t7n1LquyJ4wiPv+gDDxlPf7vdC6KYH+BCVZ6Y+vC+cBd8IMnk
   w==;
X-CSE-ConnectionGUID: XV0tn8eQQJ+lzd3F/DP/4A==
X-CSE-MsgGUID: wBvRTELyRDOnFDAVNjcJ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="174560480"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="174560480"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 71F1DC2269
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37F65D4C39
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E94D81A009A;
	Mon,  7 Apr 2025 17:17:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/30] python3-zeroconf: upgrade 0.146.1 -> 0.146.3
Date: Mon,  7 Apr 2025 17:17:10 +0800
Message-Id: <1744017431-22217-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116650

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.146.1.bb => python3-zeroconf_0.146.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.146.1.bb => python3-zeroconf_0.146.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.146.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.146.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.146.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.146.3.bb
index 724e279c22..257ed4a187 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.146.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.146.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "c53c07d6df3698bd19dcc832a897181872ec47e98e7cd70cff6c1bb0aff0bbfd"
+SRC_URI[sha256sum] = "fc64ed2394291927468b0fcc71c70483fc333bb38e7f9c0f7c5369b525248a85"
 
 inherit pypi python_poetry_core cython
 
-- 
2.43.0


