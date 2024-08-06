Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE69C52D7D
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2889.1722934023407604320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jdq6q+4g;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934024; x=1754470024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OyYgK1TsIAyETdcwQWr+d2JAPMOunkymuvcf7Xa38TQ=;
  b=Jdq6q+4g+ywKxqJkwqsDF4Kqc7OgPVfF+H0Y1yWS3XLEZKDSO2Wm7Zaw
   LT+D0tRxsv0GMjc9oNxDGihv6+KtnYZ1zppW1s2qKq28enxuvfG/ezCct
   DvQnxgjBKzjd43FdiAgzc+l6/1K8O+8tlyBQ5G1ufPWGtHPnAKb2S0vAK
   kVLPELm8IMLD436nHy9AjBaSwmayBTN0fImqakih24eVVDKKm7F+K6vZx
   UD+PgO9f+zBeb93/HxjtG3YLyMS8daZ73xxff3Gl5xqoAVCg4DHcPisEP
   uKvtyit8BlfrKjYbMlWYCMHFmhZZiaWE/1d8W4zw+Xvg5lss7q8ViqSa0
   w==;
X-CSE-ConnectionGUID: a6jr1u6nSr2CEtsYHSjoQw==
X-CSE-MsgGUID: XOUJuRDFQWybGll68wWmPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="158213954"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="158213954"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:02 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DAE2D4250
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C42B3BF493
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 675E720050194
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 162D01A0002;
	Tue,  6 Aug 2024 16:46:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/60] python3-pytest-lazy-fixtures: upgrade 1.0.7 -> 1.1.1
Date: Tue,  6 Aug 2024 16:46:18 +0800
Message-Id: <1722933994-32549-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.376400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGJQblBoaVxK9uce7gFxhKa2+OGVbYwYsiSdeYiTfKGnjo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJJ+bPjXb6iIvYEkRcZXTPxx4nOrdlUrAg6zt
	7BLntfvoV16kxqxNs10BD8RFxUBosPqSC7oTYdnDOMcjUnYOrVkaeEltS/zXP+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111561

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-fixtures_1.0.7.bb => python3-pytest-lazy-fixtures_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-lazy-fixtures_1.0.7.bb => python3-pytest-lazy-fixtures_1.1.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.7.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.7.bb
rename to meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb
index f5e6dbfcd..bd6d81aec 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixtures_1.1.1.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://github.com/dev-petrov/pytest-lazy-fixtures"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4475e66fcfabe27395e6764c8f69c876"
 
-SRC_URI[sha256sum] = "87ef7424dc0229ff9cb72d482f49b7806535c3500641f612c13ddf243c9adacb"
+SRC_URI[sha256sum] = "0c561f0d29eea5b55cf29b9264a3241999ffdb74c6b6e8c4ccc0bd2c934d01ed"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


