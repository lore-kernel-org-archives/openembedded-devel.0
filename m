Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA4DC3065D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.167239.1719305851066664531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bIrn0nQy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305851; x=1750841851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BnFk8Is6N6rvbW8zN53DuNMyVDjcBYQftpqHnuZ+e8w=;
  b=bIrn0nQyMWnwr0XNCdf6mSCCjRvBDnTZg+SIq1HDyLFDDTwFQkCA91ig
   lnhWe8oy2V2l+l5lH/aZG3RzWvzdJlF5O1S3YjmkDjFAkcl4Ak3/GLrQy
   6gW5cH+tqptw9NTCMu5nRVyp8yvJOd1gyz1TW/FTB9kJbC8Gm+hf8g9fa
   rBullQJM7A0A3ZruXyyoMy1zTjRuhwxHkG1BPEjP8L2EqErFIhorKPWkI
   lhQAZj6i9L0oiCwS4UODsUY3BlpaXCapupdjE8cofHAt1grIY/DYd2yyG
   etnGdfukVd8MFklV5KGvUJXfnoXONIXm0WLfeWDHAKobyuR33ZbrdV0Zm
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164960073"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164960073"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF59DD647A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 13252D8AF0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3280E2B25
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 51E611A0002;
	Tue, 25 Jun 2024 16:57:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/57] python3-pint: upgrade 0.23 -> 0.24
Date: Tue, 25 Jun 2024 16:56:13 +0800
Message-Id: <1719305790-11484-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--5.242200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyslsQ9ktMX8f0wj
	fHc8vXu33SQgbnlN4I8OAB/GJcYgbeRdshfO+/2pPPov5T+l6PEXivwflisSrNP7VmP7Drr6O5G
	gDUtVs9THRsM5Sw3kjBwbp0hyJgRCkMfljouhjsEReM8i8p3vgApbrx4idn+FlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUPaqMoBhXwtRp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
	q42LRYkY+gb8ieCITbpQ+YaPRkRoFfaTd2qi4mJ6aZY+GNsW65+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111053

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix detection of invalid conversion between offset and delta units.
- Added dBW, decibel Watts, which is used in RF high power applications
- NumPy 2.0 support
- Implement numpy roll (Related to issue #981)
- Implement numpy correlate
- Add 'dim_sort' function to _formatter_helpers.
- Add 'dim_order' and 'default_sort_func' properties to FullFormatter.
- Documented packages using pint.
- Fixed bug causing operations between arrays of quantity scalars and quantity holding
  array resulting in incorrect units.
- Fix LaTeX siuntix formatting when using non_int_type=decimal.Decimal.
- Added refractive index units.
- Fix converting to offset units of higher dimension e.g. gauge pressure
- Fix unhandled TypeError when auto_reduce_dimensions=True and non_int_type=Decimal
- Improved error message in 'get_dimensionality()' when non existent units are passed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pint_0.23.bb => python3-pint_0.24.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.23.bb => python3-pint_0.24.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.23.bb b/meta-python/recipes-devtools/python/python3-pint_0.24.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pint_0.23.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.24.bb
index 370cd7017..c570fed6b 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.24.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit ptest python_setuptools_build_meta
 
-SRCREV = "f2e4081aee38f850938048beac7fb69c4908bc5e"
+SRCREV = "7b47d6b7b0f7655efca810a90f2781c0d1cc7fb9"
 SRC_URI = "git://github.com/hgrecco/pint;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 #SRC_URI[sha256sum] = "e1509b91606dbc52527c600a4ef74ffac12fff70688aff20e9072409346ec9b4"
-- 
2.34.1


