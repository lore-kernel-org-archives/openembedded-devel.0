Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD66C02194
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.32748.1737360862571949079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nUjCQkzj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360862; x=1768896862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kxAlEeN3xGkL+viwui35KUSfRmHWsSZlRktbUg+nR04=;
  b=nUjCQkzjcsXhjK0KHSucBy/d7sbTpzHy8jGEXc3Zo/MKbSzzHdEjMKLN
   0ksMWp3pEZFywIoQ3MaH8NOhkKdlcVHBvWSbTWdsy6hfvd5/aaQBONM1M
   sqpqmQBBhdMcMb6ggp30kzi5X6TRnKf8y8rYSQVpTGG/ydvb2ceHVQFwu
   78UHDA11AyXpuy5yvuOn+I/Nu4lr7XZvr0mXMiGesjckkXfsnZe+gHYrN
   eZJiC/WjS7EaZrQABLeBjsPHzQqDCkQqj1hWJuIttt7f6IHYbf2vcoQ/n
   BGVJH9Bu2vWvWo+WVrkdeyh2KTzI9l/Gndl3sQHsaYNIX0SEla5mXQHsH
   w==;
X-CSE-ConnectionGUID: 372r9rIxQsa5V5Mcs/rx7Q==
X-CSE-MsgGUID: HVD3iLG6QauEw3R0yK+Dgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175108130"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175108130"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:20 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 96383C2260
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EAB4D4EB9
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DAFD6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9F1C1A0071;
	Mon, 20 Jan 2025 16:14:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/32] python3-jdatetime: upgrade 5.0.0 -> 5.1.0
Date: Mon, 20 Jan 2025 16:13:56 +0800
Message-Id: <1737360846-4824-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-1.902700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv/mj0E9XMZRq4r
	mQIDoB6SpPkgFEQ0YZkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6YM/
	MrNoB9lkyrEsKqeyR2Fm55vhbZ6ZOffv4whvGpEdeA3hod0VbwR5poRG9/JLCDz3w9D/rjqK6Un
	ewiT35MzivVpGgX58iCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114983

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix appveyor builds by installing current project
- Move datetime-specific code from date methods into datetime class
- Add Python 3.13 support and drop Pyhton 3.8 support
- Fix compare datetime with diffrent timezones

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jdatetime_5.0.0.bb => python3-jdatetime_5.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_5.0.0.bb => python3-jdatetime_5.1.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_5.0.0.bb b/meta-python/recipes-devtools/python/python3-jdatetime_5.1.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-jdatetime_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_5.1.0.bb
index f1dd368ea0..e2db6e3428 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_5.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "2cc603d913c0d8e328928454d3d295261cb037e9950227f67c9629ab4710fdf9"
+SRC_URI[sha256sum] = "25af1f48d1456b9a0acc7b32c68c66e9cccbae541672f9b9724f274d7810a307"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.43.0


