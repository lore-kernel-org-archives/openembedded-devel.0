Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0209D29F8A
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:33 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.40031.1730874692168519270
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PyI0CEOK;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874693; x=1762410693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IqHtjVWaCARbktSrzVEJyqPLDBjD8SUAEaKWSBCORa0=;
  b=PyI0CEOKaqlzlCw624/HfpW8ClgsiaBPIec58l2cLNkKWWItDd9n7Emd
   WcesF6KpswcfrCDJ2mkNm00xFadIdiTQF3X7BoFb4gHj6rmFabdXh+Tu+
   IoPZN5VoRMU7IfWzXZ9c8n5GzLGxJ/anR+YuAekX1enOY27hTLguCqHg/
   u15wcAtWvEzOCcrkiD7UowryxJlhlZ8K3XICaGiN30sRDrcRrXUiYrrdF
   yzNPgx5iFOYRBTiOY4FAlmatAYh2BJTfau4cIYAteqpsKyIetAuzcZpce
   1okrAvkQnUyt79+DrC8jqZdL2R3XHOmwZWHi1e2Pu0JIg85j02BuZQMQo
   A==;
X-CSE-ConnectionGUID: cvYkWRF+R2akhsrAQX8+PA==
X-CSE-MsgGUID: DAvNw4xgQeS5noYkVKW+lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167636041"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167636041"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E3540D4F55
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2857ACFBC8
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BAD1E20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 695841A000A;
	Wed,  6 Nov 2024 14:31:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/46] python3-types-psutil: upgrade 6.0.0.20241011 -> 6.1.0.20241102
Date: Wed,  6 Nov 2024 14:30:53 +0800
Message-Id: <1730874660-2364-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-2.316400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSb/oIJuUAIuGYkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SCgwBQYU5J6diyCqcuwfsif9grlc3/N1JZ3MagBq0yHMDQh
	YzB7mUU0xvanroYh8Dm3NUjmSEpnN5QdOfu67dHaTygRiTB/LQS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113722

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update type for psutil.cpu_count

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...6.0.0.20241011.bb => python3-types-psutil_6.1.0.20241102.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_6.0.0.20241011.bb => python3-types-psutil_6.1.0.20241102.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20241011.bb b/meta-python/recipes-devtools/python/python3-types-psutil_6.1.0.20241102.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20241011.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_6.1.0.20241102.bb
index c04c14bf4..a24e23be7 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20241011.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_6.1.0.20241102.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5f5c71d02f7a018249d457e080f85966a31a8200644c5459f63cf02be1d85c04"
+SRC_URI[sha256sum] = "8cbe086b9c29f5c0aa55c4422498c07a8e506f096205761dba088905198551dc"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


