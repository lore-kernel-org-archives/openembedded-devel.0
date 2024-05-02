Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3486C25B10
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6643.1714628974399893057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fOFlz52z;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628974; x=1746164974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vfWOlvNqlyArfuvsbqZW2neRvyj+ewEe5dtPOSSMjAg=;
  b=fOFlz52zFvBMU+OnvEwEksVNEHfzmu5zqz+u4lJUY3qw5IZcSR8dAzm9
   h5jqEqAoMJ5/CsYLj9KaNWqhNsQV2AerOQ8TDReOStRTnrIb3N/3Zhqa+
   m9Tf4MOaipaMIAaI355rkhDB05IDWcEGwSocrlBp3HmcwL1MIOMZsGURW
   RiKHBwlXPw+0GndGaxSv5mbsr09ZHPcUEIEvo28MiCGt0rU9XEaISan3J
   vMiVeUAy0lldOCyp3+/5pjcRxBjetvP6rmGZHs0XX3GDq/ciZ3893J8nn
   7b9bWlxWX6FKQo0Bm4th/A1gsDN9ibjNillRJqvA8UVUwAiFolsWusIci
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="145701207"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="145701207"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 83B95C2AC2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C33E521D6C
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EE262008BCDD
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:28 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03EB81A000C;
	Thu,  2 May 2024 13:49:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/30] python3-rlp: upgrade 4.0.0 -> 4.0.1
Date: Thu,  2 May 2024 10:48:17 -0400
Message-Id: <20240502144829.241208-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--0.861600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwE0UFIWrnxY76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzkrsReveVUH5JGa
	zClBBf1OzGGZT/gV9oCzffmV9eFG1M+ObF4xzhAHGb0ny6xV6N18m7mVPij/o4ZT0XxpxXr+YPe
	4/SiCHkIcmnZRhVxyrE4HwnSlEuHInEpJmLAFfpC1FNc6oqYVV+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110225

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add python 3.12 support, rust-backend now works with python 3.11 and 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-rlp_4.0.0.bb => python3-rlp_4.0.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rlp_4.0.0.bb => python3-rlp_4.0.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb b/meta-python/recipes-devtools/python/python3-rlp_4.0.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-rlp_4.0.1.bb
index 7df8ac07c..46ca600ea 100644
--- a/meta-python/recipes-devtools/python/python3-rlp_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-rlp_4.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00854fa80a84236706b11f47f23e61e7"
 
-SRC_URI[sha256sum] = "61a5541f86e4684ab145cb849a5929d2ced8222930a570b3941cf4af16b72a78"
+SRC_URI[sha256sum] = "bcefb11013dfadf8902642337923bd0c786dc8a27cb4c21da6e154e52869ecb1"
 
 inherit pypi setuptools3
 
-- 
2.34.1


