Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A45C531DF
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2883.1722934016725115195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HppSAunf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934016; x=1754470016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=I3f/abF9mn+0rQNOfSkLbtaQGNtvhNR1Gw1UPxZaybY=;
  b=HppSAunf5+aGpP0Bb6ZW8BrXKRcoB/+st6xLiwwuo26WkuEml9Ub5Dk7
   BC4YKn/sPtEYfqFeXdNakExpeu+yIA8XLwljdfJ2Gz4FBkLLSL/YOX2tc
   wAdMYtrKZRU2+Flsz6Y7S3ImgqB/0JnGI2CPv2nbehOkLdf4XV+fVwoOW
   thekxipg5QwgKa7vHVFb+Ic3QIk/Do9JpQYU+7RotQ9Ovl9ye40p+9Zfw
   MrdH94DCMAI5HXMRHTKT4SK6S/JAZ7Tztd/rRQ581tpOtJdhpxcUX7rlQ
   PyvlEUgTPhGOpl2MkWbkXMKHWB06ZTRg5X0J7TZ0toDzY/5mZvmjFwUh9
   A==;
X-CSE-ConnectionGUID: Fm3V7ZrDRxakMD4xpz++kQ==
X-CSE-MsgGUID: TqrieNJMTq2Ml7hlRga4cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157929853"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157929853"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43DE4E4289
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EA2BD50E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28A53401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C81431A000C;
	Tue,  6 Aug 2024 16:46:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/60] fwupd: upgrade 1.9.18 -> 1.9.22
Date: Tue,  6 Aug 2024 16:45:41 +0800
Message-Id: <1722933994-32549-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--3.526200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2s0FJKIRy8cWvsvarl0f1dgA34KY0g5BTcZiTLIQu4YpNW0pkpPR1Da4nP
	T8jZv1NHi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFBNtvKSqXFiHUJ7eqJjcYAGAXl
	CuNcSXaw3WDoAV535l42Vd7rk155azXU4CjGpJ6fm8UOfdIp9pCuSgOkktfdJ+MUQZRCpXeex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111525

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-bsp/fwupd/{fwupd_1.9.18.bb => fwupd_1.9.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.18.bb => fwupd_1.9.22.bb} (98%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
similarity index 98%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
index 99885e814..d9059daa5 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.18.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-na
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "4e554f77a8a73383a41d5637b62e6c8a8936e66cd1d18585baf29d7fe47fc4d7"
+SRC_URI[sha256sum] = "13fe8f3c0feb25234bb0013c16440f1e7905ec1f24e89dfebb4d5c6fadaf5ae1"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


