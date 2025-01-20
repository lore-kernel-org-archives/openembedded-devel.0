Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6177FC02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.32741.1737360857036511562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fCoTGS3Y;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360861; x=1768896861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fDaTZWuJnUPeJr8CK8+Z8AajPeqMLnozFMsMT8ehI2I=;
  b=fCoTGS3Y7QM+eUAL/iZgGFNCYCBFGM49P1rhlvbfG3mitTZg+gP/1dcs
   jYaTVIGgnDz+NgeqH9goQlHplJy37h2xKaDr9DuITNia5pixRm9t+T0Sc
   y7sMKadgSHS7LEJoSMlZ+j96mSyGmOOfYcseFP4RODyV+RoDfYzmd+Wf3
   ZdSCkucqg7BoMnNmr6pnnIwMVRG7yQEEZWi3zf6iNloJjpCqwgJG+q2ku
   WfkPMvw6Og/BQM9vl9VHEUDGk25LtRfOGZDbRwUOTBdvBbH6luxyZGmYJ
   sz0AtaWwLg8swxpliTeK+Vs1WA619DXyXwbynIVJcNCS9Wbskmt5ZGaJ4
   Q==;
X-CSE-ConnectionGUID: WFxUlBQqQVCbILVUy/78MA==
X-CSE-MsgGUID: YoRvfwMCTU6Pz/UOaXZWbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175491033"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175491033"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:19 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 17830DBB80
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5B8ABF3EF
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8247C20074705
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D5F21A0074;
	Mon, 20 Jan 2025 16:14:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/32] python3-cmd2: upgrade 2.5.8 -> 2.5.9
Date: Mon, 20 Jan 2025 16:13:51 +0800
Message-Id: <1737360846-4824-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-2.388400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiRlBdzYSbt4msW
	ZV9YMDBbEFRfkXUcAJm8xfjW6NxdqO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzzpE32gpsPjoSFO
	I4M9zHBdVkuQ7JqECwL03B04eNL0KX+3TgvG0Xz8npORdKYFGdo4z8hFUXvtXtxZNamFWXTRI5e
	QD31QmriB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114978

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed 'index out of range' error when passing no arguments to an argparse-based command function.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_2.5.8.bb => python3-cmd2_2.5.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_2.5.8.bb => python3-cmd2_2.5.9.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_2.5.8.bb b/meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cmd2_2.5.8.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb
index 34fd3d1bc9..b49bce53e5 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_2.5.8.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_2.5.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d2b71040983a2abc614fc4d0284771"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "ddf29beaa7c9d4e9806eefad528a59c372ca97b4c0d83e019fef0e37c44f4497"
+SRC_URI[sha256sum] = "09bb13637832bc818aad5577ccdf5dbeb0c9fbe5b9412ff78d5084f7846f83ab"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


