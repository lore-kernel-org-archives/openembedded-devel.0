Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E453BCDD573
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.11276.1726716754584067479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DnIQ0C7E;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716754; x=1758252754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=abbdvu2MSwhJaYTC3/FEJ8cuUjFvQ0gSphYgu3/GuSg=;
  b=DnIQ0C7EqD1ue+K8nMTyOVj3BC1oCYQgtdHBpurM97jj561DhWddWEla
   mQmHTIHgrCF2ODblknCicMjNoj2dWfIDb1r6Qh52K088dDAqyssIGOn68
   U4joI4CmvD97Jf5SGldqFEvxwZgqKBnZiaRgYHqs8YLPjwRtiWnCgS3cZ
   23c7L7HW2xwifI0oaCSrPqdNEd0K6LAom+uWl4faKnCTipZSGzRyzN4QD
   fjmob26AesPvYjyKeSE3AzYxQ8JNnk9aB4HFyqH9OLTO1xKBQ3haE9JT+
   6Zb4q6jK3xENqZV79IzP/ggDXuvP8RI6s8O6mhnoghqHhMb6E8ZybT+CY
   g==;
X-CSE-ConnectionGUID: XOVChjKcSEi4V28EIZL85A==
X-CSE-MsgGUID: ykqmjAaxSiit22fT/8NQgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="162453511"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="162453511"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 37EB0D8011
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 748ABD752D
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03E7120086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9F0631A000A;
	Thu, 19 Sep 2024 11:32:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/28] pegtl: upgrade 3.2.7 -> 3.2.8
Date: Thu, 19 Sep 2024 11:31:52 +0800
Message-Id: <1726716733-14548-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-0.057200-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yUIIxwDaU5mr5sPqcQkI8pvfUZT83lbkEIIP
	FubbBVyA+7QcRaVoa8n/tdOuViNvuC/7QU2czuUNEzEoOqAAVLN9LQinZ4QefOYQ3zcXToXr+gt
	Hj7OwNO2OhzOa6g8KrZ+kegZWaduu2ApB29VUFVgROff0ey2l/NttD/UP1DavLvQY2RNZLkm+2d
	DzR1zg6OoWuTFudjL6jUlK7nlNmYESfweg5D8mqB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112370

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed build with '-Wshorten-64-to-32'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/pegtl/{pegtl_3.2.7.bb => pegtl_3.2.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_3.2.7.bb => pegtl_3.2.8.bb} (93%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
similarity index 93%
rename from meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
index 2e32e3e78..fc227734d 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.7.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.8.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://run-ptest \
 "
 
-SRCREV = "cf639f7f4ee125f68e1ccfba8d99ebc0de57b9fe"
+SRCREV = "be527327653e94b02e711f7eff59285ad13e1db0"
 
 inherit cmake ptest
 
-- 
2.34.1


