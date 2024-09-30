Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4670CF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:58 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.48959.1727682234343244503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OeD14b2V;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682234; x=1759218234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a6ROZEvFFeWpvTXKwfl28cH6MD9NT73/wPmq+Bn8ZUk=;
  b=OeD14b2Vbmd4eBHSZMDzkUuiWP4CaCT/FBT0AVvZc7jFIgQQphNND9jG
   aKHXkhKZhW8i/ESX0lppAZ2FzsHqdL+zIAVmUH45eintfTX9e0kJWiO3g
   P2zjgU2FXfq4lWYu8bINtQi9Du4kvgDBKyD4iIomJxgf89t/S6vDbpeeR
   9mMv/RJmoUow86MRAklo96Wu1inRz+d+40kQQ5UUUyw0UMgJKA3M4DYNV
   3tNIWdiKRjRYZSBkTKqkWuQFjT5I42VMeXOtDw5a66X6f8b8/0GDxiK95
   GW+8FskPEpC6AVPUjWpcTfuWn8byI0aX/oz/M15lPk2fr6daBsst7yiz4
   A==;
X-CSE-ConnectionGUID: Xg3+lWewRW2ODW2x5dpBbw==
X-CSE-MsgGUID: TGdYx/rmQd2xeg7tHSVA5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175192743"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175192743"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 43EE1D2AB6
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 64CD2D8ADF
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB4AE20076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 987781A000A;
	Mon, 30 Sep 2024 15:43:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/40] python3-python-multipart: upgrade 0.0.10 -> 0.0.11
Date: Mon, 30 Sep 2024 15:42:52 +0800
Message-Id: <1727682185-12664-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--1.909600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrmdrHMkUHHq+j+B3Hb2+8p76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFIdPtiRVCrjsdoMGzl5TPWPx4w
	KjYu6uaKIDXVLSQKc/gwtVu2kjRbByexsa2YnIeCvlYuP8UTepQsnodpCTsu048nXk/QJYC+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112587

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Improve performance, especially in data with many CR-LF
- Handle invalid CRLF in header name

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.10.bb => python3-python-multipart_0.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.10.bb => python3-python-multipart_0.0.11.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.10.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.11.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.10.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.11.bb
index df52f7a35..b325f90ad 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3d98f0d58b28321924a89ab60c82410e"
 
-SRC_URI[sha256sum] = "46eb3c6ce6fdda5fb1a03c7e11d490e407c6930a2703fe7aef4da71c374688fa"
+SRC_URI[sha256sum] = "1d377f074b69a47dd204c990de57a7cf03d9b85695a3e57faec32d54b78e3e48"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


