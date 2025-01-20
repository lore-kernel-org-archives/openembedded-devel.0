Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BC2C02193
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.32745.1737360861831978250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BenAjUJN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360863; x=1768896863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DsjN0fUlWBfQ4w55yFrl+7R6qvb0LLJKw5FunNq/5Xw=;
  b=BenAjUJN+yAURfmAuO3eNkdJqhAst2PZb9Ah9CPUsEoPvcqa8EyaCSCf
   xFXmkiV3to8DMiCeX7UZ4exwwxzWQCwDtSUzqG2641T+4l1g6P83VBTVc
   inTtJ60emr890CqV3Yl0aq0SILYnx94LEpbymN5RoS4AD9Qo49JOtC88M
   5HA5CRVuZWsodhg02tSEt2Hgv6W3Ll6fg2CRlH2hcxIJe/9jpeREzvbtv
   APllLlPrVRO6VaNeC8qhHD2XDlRTg8aqx0tcwCaMqxsRgyR6YRavn4yJa
   eC2L4MvqDJqG7ObrRI/fyjDtWbPAHFGsowMDq1lZ4hGbtXYWIBmj1qYU+
   g==;
X-CSE-ConnectionGUID: zOE+9sEDR3CDHfqsCGHdpw==
X-CSE-MsgGUID: G7HAJoBAQH6uwRVuY9O8jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="186303496"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="186303496"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:21 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F1A6D146
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3637DCFBC2
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C597720074705
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 69A701A0074;
	Mon, 20 Jan 2025 16:14:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/32] python3-inline-snapshot: upgrade 0.19.1 -> 0.19.3
Date: Mon, 20 Jan 2025 16:13:55 +0800
Message-Id: <1737360846-4824-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-2.096400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhOed0Eey3YOWZY
	/RdXrUKN0CgVIT0NxQ9acZzTSiX0+fBas+2FzMVN/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6VI+
	iZ78Cdc4PUq6JYwe/88wqgUxtYegVIMn22KBYPTN9nv4zPqiKGJ0Ew/O7YAubHILqeuZsjPUovk
	WK/7eMNHuJP9Br6j6mCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114984

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- raise no assertion for positional arguments inside constructor methods.
- fixed a crash when you changed the snapshot to use a custom constructor
  method for dataclass/pydantic models.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.19.1.bb => python3-inline-snapshot_0.19.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.19.1.bb => python3-inline-snapshot_0.19.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.3.bb
index 049d8f25ce..4e172e1820 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.19.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "28b17612e12bc7012468e59c47aeb0e84ce6d6a392b3f78f3bafe8cbf0d77bff"
+SRC_URI[sha256sum] = "1e40f34da64fe2406c6bba3f473905e22386da43e16c85060610692325aa94d7"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


