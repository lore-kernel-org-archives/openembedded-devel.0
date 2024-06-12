Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D2DC2BA15
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.2433.1718161120283734111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MxISu4Lo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161122; x=1749697122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Chby3lFjebYGIFiIJRp3Vsf3fr5Xa9nXhDweQfqpMys=;
  b=MxISu4LoUWeRUFJ2CMdmCXVOralXg/D1itiH9justORM/eHtdUe7+m+m
   j+k2vT83JXeQfyPrZ6F3m+sPZMKv8/SW8Z0g+9wz0cEKMBMjleu7hZqre
   Ranb26KYuG+a+QFblffDl/uVoUdB8w+wtUoJwZToNC+aeakr+v9EmiQ9Q
   Qf/Zbt60RBR/VwBXjcqPoe4M7SCh6/8HDi/LLLEqK5v+MW1Zcn+OOhddp
   OUSFWjkrOYMOVlWtS+hpeTAe6AYz54UXgVQ4nGCVWj5Ip4V4feVTKdmw/
   fkMArNKnyiWOeSLuJWEBdQxi3h5a3EJM7uLCFxFnl9ury0PHEDUN0Gfje
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162766209"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162766209"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DB9C9C68E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A6ECD50E2
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B47DE20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 628C61A000C;
	Wed, 12 Jun 2024 10:58:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/43] python3-html2text: upgrade 2020.1.16 -> 2024.2.26
Date: Wed, 12 Jun 2024 10:57:45 +0800
Message-Id: <1718161096-29710-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-4.445700-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrG24YVeuZGmN4YeSlHZYFosWn
	ElC6zRAnlPrJVpcUWozbMcLxCab9iRSHrTqtvqVQWCjDJRYeAZ2pr7RsZn6zme3/E7jvN+gnOxf
	QLcsk9qjRB3/NUcBZS34dje2R46nwNtywwIf5ksVSAphtkUXoaPxKNdLGV09TrblmM/aFaC++qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+ABgA+oehWZhHEosIs7IJbkNb2e
	7N2CFQy2IAqem4wIGqAMuqetGVetnyef22ep6XYxlblqLlYqXIOlWazBA8u5k8a8+neBRVQaM6l
	IgMWJ+9F2r1SU/lFBKUuhAowl3oT3TwBOsl5SDHH5HArG/p6+YwNK1uc0j6r5D/ZPMQOYz/+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110847

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixes #409: IndexError on empty strong mark.
- Fix #332: Insert at most one space for multiple emphasis
- Feature #318: Make padded tables more similar to pandoc's pipe_tables.
- Add support for Python 3.9.
- Fix extra line breaks inside html link text (between '[' and ']')
- Fix #344: indent <ul> inside <ol> three spaces instead of two to comply with CommonMark, GFM, etc.
- Fix #324: unnecessary spaces around <b>, <em>, and strike tags.
- Don't wrap tables by default and add a --wrap-tables config option.
- Feature #198: Ignore <p> tags inside table rows.
- Don't wrap tables by default and add a --wrap-tables config option
- Remove support for Python <= 3.5. Now requires Python 3.6+.
- Support for Python 3.10+.
- Fix #320 padding empty tables and tables with no </tr> tags.
- Add ignore_mailto_links config option to ignore mailto: style links.
- Feature #407: Support the superscript and subscript tags.
- Fix #373: \n inside text of a Markdown link.
- Feature #406: Improve support for null atttibute values.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...3-html2text_2020.1.16.bb => python3-html2text_2024.2.26.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-html2text_2020.1.16.bb => python3-html2text_2024.2.26.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb b/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
rename to meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
index d96f61bdc..4a7ce1e5b 100644
--- a/meta-python/recipes-devtools/python/python3-html2text_2020.1.16.bb
+++ b/meta-python/recipes-devtools/python/python3-html2text_2024.2.26.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/Alir3z4/html2text"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[md5sum] = "c77b580c94d1a9e0145f23cc4472993d"
-SRC_URI[sha256sum] = "e296318e16b059ddb97f7a8a1d6a5c1d7af4544049a01e261731d2d5cc277bbb"
+SRC_URI[sha256sum] = "05f8e367d15aaabc96415376776cdd11afd5127a77fce6e36afc60c563ca2c32"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


