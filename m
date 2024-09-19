Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02837CDD577
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11273.1726716752775097297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b0GjKPwJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716755; x=1758252755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1BBYsu4qC4Xl43fbLFPvYYBAFKVLlBDbVXyQ6Eg1eGo=;
  b=b0GjKPwJyejcXL0Xkgu+4tehc92X2q2DCqY5p2KOWyRgrtGPcOcnC2cQ
   Q0uGG289gD354h7qIM60JVtBpEHjG1FiIHWPwmIarS9grAZe1I3CzbRwj
   gIPxc0ZfUcMT1pKPF4zM/rRirbp5R+Y8sG1wIvry9PaTDLPEZP/Xn5mRO
   cspfnokL3/fcV2nSpqB0GN1G6dGMvpBimQtYUmWUyED3gWTrlFeE8Ikas
   stfYSmiJ6J5qD+ttkjVgYzG5A3oTOigWNgBjfmA+tkOtnPk2NSbkKouSC
   fKyg8DN6IKPboWjOlZoMNNz4OJ/gIBKTb8lsmDxlvkIWssAsrHEZ8zhF2
   Q==;
X-CSE-ConnectionGUID: 8rtZpbehTpK5MVBnQx8BWA==
X-CSE-MsgGUID: tGercE3yRwm+zVPhR6fZow==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="153578172"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="153578172"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E794CC142
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD15ED4C32
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3CBFB20086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8EC11A000A;
	Thu, 19 Sep 2024 11:32:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/28] python3-eventlet: upgrade 0.36.1 -> 0.37.0
Date: Thu, 19 Sep 2024 11:31:54 +0800
Message-Id: <1726716733-14548-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--2.912600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbyt3de2OoBqgwn0m
	mlU2RvUrj0t3mYyiJjwZXKdKPNAmBlw7kEHswIBVfUkgDiuGxn9joW73mae/s6Ks3HwKOdLavqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQYA3qL69rXq5pEX
	AOzwbtMeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUL7QQExa///tGxnVphRRWacIYy
	/sc9KLhdxnygveeUrQjW2bzmNxlwjr7zx4DZvBau4ehn3Va1lQ3G/j8KfdpCImWnYcw97MQ7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112368

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [fix] os.read/write waits until file descriptor is ready.
* [fix] Upgrade RLocks as last thing we do
* [security] drop header keys with underscores
* [doc] Various doc updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.36.1.bb => python3-eventlet_0.37.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.36.1.bb => python3-eventlet_0.37.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
index b521162d2..84de0d8e4 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "d227fe76a63d9e6a6cef53beb8ad0b2dc40a5e7737c801f4b474cfae1db07bc5"
+SRC_URI[sha256sum] = "fa49bf5a549cdbaa06919679979ea022ac8f8f3cf0499f26849a1cd8e64c30b1"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


