Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03DBCD129D
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.39356.1711983099599367728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ms8Eh75J;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983099; x=1743519099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zqNk4gtAZ2598TQ5kQxQqluulTXTB79zcwPpUWOmGy0=;
  b=Ms8Eh75JwcnD9n/qiXSilABZj6wdo89YFO7th6H/4gWj3fLA1SSMvzp+
   +c5qfZ2fofIr3APXekJMv3Gez0ex7u5eYThZHKM6iUVAkbgj5XEJE2UWA
   O3pCHeJnWU1WB+l46KaPo18WQye7y0gqZvGny3VVrXfBTpQ6xv9P+AkLm
   ILImokLgMIQw2tU2+qakdfBUhXx2kpV+fW7IzZy9ezyUFvFEKgc/hR3/f
   J9lC9nn9FOhv5RNbqZiBoRBScLCPrK0jrTFJFOlgFChQwUszyh8IFm6PK
   qorHj6NXgxpTZP6jQgRVIIHFzu4WdqlNxaoRrVubX1J/6Q7RtPKwkIgnH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154534823"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154534823"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BAD2D3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A066D3F25
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C743620093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 79E161A000A;
	Mon,  1 Apr 2024 22:51:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/47] python3-flatbuffers: upgrade 24.3.7 -> 24.3.25
Date: Mon,  1 Apr 2024 22:50:51 +0800
Message-Id: <1711983079-16849-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--1.695700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuBAXl9LkPp6RkL
	G1omkvpsCC8aAmGeO6lV00+whwxVQy/7QU2czuUNA9lly13c/gH4g3OQ8ZO3R6B5jk2TXXjF1+0
	KsXaxWz7i8zVgXoAltmHJPdY2OmlS0C1sQRfQzEHEQdG7H66TyHEqm8QYBtMODViPqXJtUfdA9I
	xRItKj0YI96NLIj9Gk7pDtpLUfJWGsmgK/gjZrfJhsOEiYMKs9cMM6IOuuMtk5t8k25VCjGcEFu
	MsuuVDLgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109737

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix License
-Fix handling non null-terminated string_views in LookupByKey

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index fb9f97bc1..8f6c4c68f 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "24.3.7"
-SRCREV = "6ff9e90e7e399f3977e99a315856b57c8afe5b4d"
+PV = "24.3.25"
+SRCREV = "595bf0007ab1929570c7671f091313c8fc20644e"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.34.1


