Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E9FC0218F
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.30359.1735032440774627257
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KPNUgOfB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032442; x=1766568442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4CzXJZ51xPbN+VrEIhmi3KR5o1VcppTFTMwDM5eVXi0=;
  b=KPNUgOfB1orCku8yeNuvTXVPg9XIQm0aak+OLK8IBAX+WeH+e/htq+Z7
   +K4Hj8PYmkTT3uyGoUoZk9KnypbYxz/HFUo2+zuQxl49XBA18W8dOfWqA
   nt6AnTshkSS3HzKugLfOcW3N3TfYicjQM/zQTcMuoLsZwE5QXO4pgQ3b5
   /BJB5XPZQ6mtPBS2ZOBP3nYKQAHc3qihYRE8+tw91aO7pfw+y3VWtoEgx
   kcD7QS7k0XMUnxcz+a3h39q1ZZlLxDo4SiNLnfxKmKn/xrIgvqESwvc1J
   xewcCG7jq3XpKkBK7zPovuplUKD5xrCuoXdgyJcxWZXOSZznF5Gu1900Q
   Q==;
X-CSE-ConnectionGUID: AzEdZ+eoQbS8s00S0sCONQ==
X-CSE-MsgGUID: JjZql5Z4RUCpQis6u6/7jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="183972681"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="183972681"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D8D52743B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ED3B0D5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8771E6BB6B
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 31B391A006C;
	Tue, 24 Dec 2024 17:27:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/67] python3-croniter: upgrade 5.0.1 -> 6.0.0
Date: Tue, 24 Dec 2024 17:26:11 +0800
Message-Id: <1735032421-13513-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--6.512900-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrCoPXqoZQJeYoiFyh1jyXYY3E
	akIoHWNdonezSFCgVaf/6GzjzPbZa6JDYOZuN534qoeab9Xgz89Vx1Cg15eisIzzgyOJumyHMFd
	dv+pLbrczrFQIhH7djoqFBnOVW49ruohcuWcG2Ki9HTxRE6QQB8EXY503qgABlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUPc+HB+YVvemDsKXyzHgcEbfS0Ip2eEHnwj/1Rbkzl1EwuTL
	po5HEc1joczmuoPCq3S+7stCqwxJqEoCaM8Y5AIxhvh+Dc5wUgN7SraWM2Eg5up1a26WEL6
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114490

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Announce for now that croniter dev is ended (CRA).
- Rework timestamp_to_datetime to use whatever timezone
- Make datetime_to_timestamp & timestamp_to_datetime public
- Fix EPOCH calculation in case of non UTC & 32 bits based systems
- Apply isort formatter
- Reintegrate test_speed
- Apply black formatter
- Code quality changes
  Remove unused _get_caller_globals_and_locals
  Remove single-use bad_length
  Remove unused days in proc_month
  Use field_index over i for readability
  Always use """ for docstrings
  Make helper instance methods that do not use self static
  Remove unusd call to sys.exc_info
  Remove unused ALPHAS
  Improve croniter.expand documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-croniter_5.0.1.bb => python3-croniter_6.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_5.0.1.bb => python3-croniter_6.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_5.0.1.bb b/meta-python/recipes-devtools/python/python3-croniter_6.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-croniter_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-croniter_6.0.0.bb
index ca99bacf7a..201074e1e3 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_6.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "7d9b1ef25b10eece48fdf29d8ac52f9b6252abff983ac614ade4f3276294019e"
+SRC_URI[sha256sum] = "37c504b313956114a983ece2c2b07790b1f1094fe9d81cc94739214748255577"
 
 inherit pypi setuptools3
 
-- 
2.43.0


