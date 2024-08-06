Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92EAC52D71
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2891.1722934024920500938
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LqMx11fk;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934025; x=1754470025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M30dKXRC+xK0eCZP60uhcSq1AO+c23xvNcCBstmlC/s=;
  b=LqMx11fk4X9TSYE07Dgpo5b2XhG1j1qYik5GGWqCzevtwDgW1J8wJA0Q
   0qTSBO3DAy3q4HXYtbS+JA7Lh0qp3ay37zRxb/RbSksXLVzuUU02usPVl
   RGdCwiKlaBqRwqAMhkQgy++8mlJSItFB3hNDNJ7qvkGL/tmdLcsxnGoyj
   VnJJgRGylJAXHY10UAAu1gsmMuBhA198xtQ3HK06VD3htI9bYAWkNo7o9
   bp4qEZfd25m3h9dtAdqAiWHHOSUa5VQTwM02v4/XIy78TpUDRvNKF1JM0
   XKYur8nIL/wOx2r2jyxy+941UpTUQ33M/nElbVTYSOd0ybZRfDoN5XHpt
   w==;
X-CSE-ConnectionGUID: ZZWcYlhJQ++OdC4w2PSQsQ==
X-CSE-MsgGUID: 9fOMQCVDQGOLS0yiYDQfSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="158213957"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="158213957"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DF08ACC14C
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36D2DD7461
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4FBC401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 63C241A000E;
	Tue,  6 Aug 2024 16:47:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/60] python3-sympy: upgrade 1.13.0 -> 1.13.1
Date: Tue,  6 Aug 2024 16:46:24 +0800
Message-Id: <1722933994-32549-50-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-3.825100-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGGzQB0xBvE+luce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62S+B47ZAaUnDO2D421oHzCAj0LphKzonM53WEYOigs0ZDXoP
	SFjY+hD4dZShTfL6vlBe7wuNaKhSoPzazQTj1FH606ylDPpWCPS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111565

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sympy_1.13.0.bb => python3-sympy_1.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.13.0.bb => python3-sympy_1.13.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.13.0.bb b/meta-python/recipes-devtools/python/python3-sympy_1.13.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sympy_1.13.0.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.13.1.bb
index f0dd4992d..41772b05f 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.13.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea48085d7dff75b49271b25447e8cdca"
 
-SRC_URI[sha256sum] = "3b6af8f4d008b9a1a6a4268b335b984b23835f26d1d60b0526ebc71d48a25f57"
+SRC_URI[sha256sum] = "9cebf7e04ff162015ce31c9c6c9144daa34a93bd082f54fd8f12deca4f47515f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


