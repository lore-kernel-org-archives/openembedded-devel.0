Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDB2C48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 08:19:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8713.1708503576417050123
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 00:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ldvjPufZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708503576; x=1740039576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FnHCeQyw+DmYzvyUGqu//7u1sub5Mkv7y7HUd8RsGQ8=;
  b=ldvjPufZvN9USmvPmxkaHlh4y7dnkZbX2AW7IhRaygK19PeoBkrwdZ0K
   jmbJvjfzojXfQsyb/tWfPHzR8dDJisImndeXb7yrzpgmy2i38Iq1akqoB
   n9NO3gedRJxgpPrFgzxUPHVfa3hcrSwrBuI9R+TW0+CO5WwLQ51V+lmt7
   cqlQOXtfBZiWOEp1lOohoYbDgJyhGPv5tQGR4DhIg82Tm+QSqRdBKoK7X
   If/v3CBbq9QjSbM1LBW7ZbGL56KDpOxaZOiDloqZHy+8OmnY9twqyEKYV
   tdmrjg5LKB2Yae0pGC1Sdm/KpnSV5OYD65gQZrOc+n9HiqztJtGPU1ldV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="149481556"
X-IronPort-AV: E=Sophos;i="6.06,175,1705330800"; 
   d="scan'208";a="149481556"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 17:19:33 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D6F6D772C
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C8E8AE631F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4DC4470B15
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 017CD1A006B;
	Wed, 21 Feb 2024 16:19:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 3/4] python3-socketio: upgrade 5.11.0 -> 5.11.1
Date: Wed, 21 Feb 2024 16:19:18 +0800
Message-Id: <1708503559-1895-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708503559-1895-1-git-send-email-wangmy@fujitsu.com>
References: <1708503559-1895-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28204.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28204.005
X-TMASE-Result: 10--3.130800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrJF8tFEtOdqswAYdq1VTXo8P+
	gsBeuI3ipPkgFEQ0YZkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl/qzSYnI5VS9npt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFL7DYDiNdSvKL1KXtdF99EDz91
	YqnwzeMDkvM/j9JZNcV/+P3k6nh1IlzHWrM2rjgiiX+T9LXD5okWpvUlv7i0KrgaceLDFp6Ox9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 08:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108961

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Connection retry option in the client
-use Socket.IO sid in transport
-Add support for Python 3.12 and drop 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.11.0.bb => python3-socketio_5.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.11.0.bb => python3-socketio_5.11.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
index b267afc99..91feec98f 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.11.1.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "b03186e04b942088781f6286c13604a853e5e35ed59158c51ff7af22fa032e6f"
+SRC_URI[sha256sum] = "bbcbd758ed8c183775cb2853ba001361e2fa018babf5cbe11a5b77e91c2ec2a2"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
-- 
2.34.1


