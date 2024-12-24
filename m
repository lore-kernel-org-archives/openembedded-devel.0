Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B24AC02180
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.30509.1735032445057522136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rksnOuO8;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032444; x=1766568444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=j3t7rqcisoBM8mF+6f+gRmY3cJlM5wSxNtBqQpHXKLQ=;
  b=rksnOuO81wwQt53e1TA4dgGey20W4h6Uh5T4+uSq8UkTqDU0fkefW/BV
   WzfNZMEIETSTFJ8CcIoOkJwSRiFuwtvi1hG1zj2ykA14rVEaxQ6F/yXzz
   MX0Y8on0nCDksabYnpe5QUbAxAe14qJxAarA63EgMAF8YQSFfxUs/GVoE
   xM+OA9Hd8m2BwnlKi5SFyfa0I2ifZiLbDCI+T5V0WsQC5EwAxVJzERsPo
   pSsBvUz9Kk07PnyiQ8Yv/MO7TaFCQtM7LaEI3sD1QL6iR3Db4ifMyKzC5
   kzfbzla0+E4ibaVcLvrtkMrQTjpFla+A+7GhgcGElrN6Ngx848nm375St
   g==;
X-CSE-ConnectionGUID: CZaWlw9zRPGuNi5tTiXZKA==
X-CSE-MsgGUID: Jh41edXTRmO1k7SyBkbWHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="163714075"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="163714075"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F1D58DBB84
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7DEAD72B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 520A56BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1876B1A006C;
	Tue, 24 Dec 2024 17:27:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/67] python3-grpcio-channelz: upgrade 1.67.1 -> 1.68.1
Date: Tue, 24 Dec 2024 17:26:23 +0800
Message-Id: <1735032421-13513-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.832500-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFZH0YXYnbGozFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtB00
	/kkeBTwDhcQ7L/ibs2VXPsl9AX9UPUO3miAzxY0mtNrAF3r4t7jRajYOFZYVQYYH+1EP5PTvI67
	5zZ/BUWthXuypoTpB7k4yhqesvKCryDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114503

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.67.1.bb => python3-grpcio-channelz_1.68.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.67.1.bb => python3-grpcio-channelz_1.68.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.68.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.68.1.bb
index 9f81c6a691..414db61558 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.68.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "a4ae742c9ca04327ae0eec43d7e5b96c9686b8fc24200ae0816a67ab18342710"
+SRC_URI[sha256sum] = "ebe9b127745306db1707bcb8eb0dc56b947c3b616729b59d7b451e2639ecb6d2"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


