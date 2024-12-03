Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960CCE69EAA
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8075.1733185017305588202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NKEFYe3y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185017; x=1764721017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a8jqRks3Yt4VOGeNR85TB1mKDzMlyk7oeCd3wiH3G8c=;
  b=NKEFYe3yPmgck7YKe09V/Wrwa7Q8q4Kz/jNZddluUeT5PV8UGVVwVGWE
   KThOX+e7FgeQyr4eKJ/MnH0IOZgBV74oWR+xlWykPqgw1KJ7TJmxipQHB
   xDljxhTXMi8OsXlgPeCQwo/WRcmh1QWoasM18xdOK5cXOkU5aFoeTSvpd
   y1fP1h0dUFcNMvlTt3C5mAH/9l6u3zBLQYtVLMcN8FVx4EmfuidDzwUJB
   zEJLpenBfffVapofugPYe77TjKJtgu1SU9R9BgwKt2xSI2X2tJ3E8QIPb
   6WxzvbRYnPbciHYFtJOdGQKLYDwYXXKdkglmXvoCg9a+LQDj3oVbGiCaO
   g==;
X-CSE-ConnectionGUID: TW0jggtGTu+4PMLr6steqQ==
X-CSE-MsgGUID: b/7HAeThT1meS5vlXh3uYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="161830268"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="161830268"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 25B8AD4F41
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EEEF7CF7D9
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 800B06CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2CA811A0003;
	Tue,  3 Dec 2024 08:16:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/34] plocate: upgrade 1.1.22 -> 1.1.23
Date: Tue,  3 Dec 2024 08:16:16 +0800
Message-Id: <1733184999-27041-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--1.891100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGNWbXi3zj8O0A34KY0g5BTfYUDvAr2Y/15yka59saICoZx2
	5js+HUUPi8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFM4rU0bcmUYxaO4r1wC+2Y/bpL
	SIPkEUJFDtQGg/GXL+sPXmeXKXki20bYxIbKBxmsQwfAtWPD0oZoP8VeJe8Q9eOjK8qDbmyOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114153

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../plocate/{plocate_1.1.22.bb => plocate_1.1.23.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/plocate/{plocate_1.1.22.bb => plocate_1.1.23.bb} (86%)

diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.22.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.23.bb
similarity index 86%
rename from meta-oe/recipes-extended/plocate/plocate_1.1.22.bb
rename to meta-oe/recipes-extended/plocate/plocate_1.1.23.bb
index 694c29776a..c9502db16a 100644
--- a/meta-oe/recipes-extended/plocate/plocate_1.1.22.bb
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.23.bb
@@ -12,4 +12,4 @@ DEPENDS = "zstd liburing"
 SRC_URI = "https://plocate.sesse.net/download/${BP}.tar.gz \
            file://0001-Include-linux-stat.h-only-when-sys-stat.h-is-not-inc.patch"
 
-SRC_URI[sha256sum] = "3b7e4741b4aa2ec044e53eff06474a32a3fb1e928b9382351fe79d4c27fb0049"
+SRC_URI[sha256sum] = "06bd3b284d5d077b441bef74edb0cc6f8e3f0a6f58b4c15ef865d3c460733783"
-- 
2.34.1


