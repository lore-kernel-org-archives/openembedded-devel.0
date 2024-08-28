Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A77C5475C
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8720.1724833545202925320
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l8NBRW14;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833545; x=1756369545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xmI2EIn2eo6WyD29owINHA9ZgN820oxcTH0Nx21DRkg=;
  b=l8NBRW14zFdZo9C9kou4P5Tb6lBCTdtxkEjOMcXy9CasRIr0ywm0Rjms
   /6HI6C2M7Lcn4q724OTmqX1FCCim9aLdUdM1cAABEj90aDaZBmcp2iv1l
   vxOLWmz3VGcQBd17S4ms4wsOQFrsnGpfJLPwiOPabX6RAPh/iBIyPW0aG
   EgZbt4pRjRTONluQuzGKGcM8QPMIjHUop6jF8QsNi4ZOFt8QUhMxDYrim
   dd/Ifi/GOIqpurYIKxZ+W3tfijouKuTAxtCgtVWJgS7Kbu+jxQuSZN/B6
   Jwp3v7Y8mUfx8o+MvzSpgpUVu//KcvArVoKJZJf2TUgsyzra+ZDGajr2x
   Q==;
X-CSE-ConnectionGUID: /E7/Ant/TLqoXwuJGsOXqA==
X-CSE-MsgGUID: V5BHGbLSQICUh7fXgSQydw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171131391"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171131391"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04A6AC932B
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45987D509B
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D113E6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7ADA11A0002;
	Wed, 28 Aug 2024 16:25:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/46] pcsc-tools: upgrade 1.7.1 -> 1.7.2
Date: Wed, 28 Aug 2024 16:24:54 +0800
Message-Id: <1724833525-2162-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--0.275400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrKQNhMboqZlogxiy2xJZXvRWW
	aZILA2NwvunLxXuwfLeEXcNnT4S7NaqrJ2yPRGzpqhcdnP91eXGuwxEhllDJ5ZTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprZiQDIJsDspXCzkaVcXrvbOjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipctA3e6VG86otJxhhc9ULKcvWWbp21ArqRMyQ0
	0uvDNNnIGyaYd3eXt8POCNoMFXejSDfTU9ZXUSlLWgHZKEms5LuNjqiwZokTf6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111993

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- 191 new ATRs
- provide meson configuration file
- improve pcsc_scan Windows support
- Use Ctrl-C also on Windows
- Windows can also use option -n
- better output on Windows dumb terminals
- minor fixes and improvements
- Initialize the reader state structure to 0
- smartcard_list: Add D-Trust Card 5.1/5.4 card

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-tools/{pcsc-tools_1.7.1.bb => pcsc-tools_1.7.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.7.1.bb => pcsc-tools_1.7.2.bb} (92%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
similarity index 92%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
index 97a94ec97..1dfba7c71 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.1.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master"
 
-SRCREV = "53834cd33155ae1f0332102b1baca6ce63660fc5"
+SRCREV = "778da3d86a59f5166443118c158e11ba4da9a5f1"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


