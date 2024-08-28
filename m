Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF1EC54755
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8723.1724833547871109374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AE8nYKVt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833550; x=1756369550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i3hbBCy7t80FQCvs668WyU/CJ3zRqtgmFQZ1BkAw4FA=;
  b=AE8nYKVt7nS3CoViDn0+wGIDSAr+icm5pWYDMvZyMFYNZktH/RpP4hLJ
   Vdo+wJmaUb0UR1h/1jBRVG6YU3eFVsHwHLLF4QUGAQTZBfY2MT4x4t7Ue
   sTXnPN17Rm3+QyrF6XQmnyA7H5tii/962kFMq5nEWRf4UMkxod7g/mAVg
   e4uwBe0wsrhMXF+zhK4EzrNzsfyaOCsok3N/defLAn2TXkgeUbDNj0QrY
   R7kGMnoIZQ8Qy0RAvxPd/dzP2gfW1n2EiCEAflPo7T9Nmj0ddFamnqi80
   gyvpyyGnw8YP49+ry7+5RTWXooepp1r4iHbMGOBgebwOrLH8EWmwdMioA
   w==;
X-CSE-ConnectionGUID: m2vUJAvDTQukO+v6SYpqHQ==
X-CSE-MsgGUID: L8gwzz6yRX2Rjxb1t+1aEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913198"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913198"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:49 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D1ADBC9322
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E881D50FB
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B5F4B6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5E4401A0002;
	Wed, 28 Aug 2024 16:25:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/46] python3-imageio: upgrade 2.35.0 -> 2.35.1
Date: Wed, 28 Aug 2024 16:25:03 +0800
Message-Id: <1724833525-2162-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.581600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLflQJ8Ig66SfY2i8/GMHx7H4LfclTCQw7ee8
	es9n4i8tKFlxQI1mthJiz5JE5J6QCM8WlfMKD5YZWPsg0giGuVigMLn9+CLm3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112001

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Remove pinned numpy regression

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.35.0.bb => python3-imageio_2.35.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.35.0.bb => python3-imageio_2.35.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.35.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.35.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.35.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.35.1.bb
index 92c659e73..6142884e7 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.35.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "e88f759803d2968e19a55fa8372e9fbe12967a8598fe042d8719ca46d03f4256"
+SRC_URI[sha256sum] = "4952dfeef3c3947957f6d5dedb1f4ca31c6e509a476891062396834048aeed2a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


