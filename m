Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BC9C25B7A
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.6641.1714628972752084489
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gj78jGaZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628973; x=1746164973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RNnhYAUdPXm+7HQro9pz1vfQxYxEf1/veRL5l4BJQrI=;
  b=gj78jGaZ/SI/G5CfFUsVGAgJzf11zdAnq2d47hZJOVOedp+zd7SkLcRb
   kbErlrPN7RzQ9w40ll8jXAMuIaZ8uD/EFGjg+ELqmtwUDFibTjl2VVFyQ
   CtoRD5HljxWmtSOYtP81VGv+EMr7LVH8eH6m6pammfk97wnF76Jkr1qly
   vuaVTYgIIS1lE9M1EyFCSlyGH1fyUsVqXd2PAhHqqsyJyHgXNV2jsguaU
   Fu0/4vJvxAe+sfELlD7Cpoc/yIHqdF/olLwaIe0UL5yUow0ijm6BRFKKp
   6zQdR2zFJbtA8c91hNlwMJvCNk1UfOBno8++5SM+BWr0jdTUa4CCXmixp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157117696"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157117696"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:30 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CDF4D6F00
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5320E11C58
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9A102008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:26 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8821F1A0002;
	Thu,  2 May 2024 13:49:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/30] python3-pydantic: upgrade 2.7.0 -> 2.7.1
Date: Thu,  2 May 2024 10:48:14 -0400
Message-Id: <20240502144829.241208-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--0.599400-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeXl90JVB3jyCpGH
	Z85Onc+2vnCllUJsUct8vLO0YKIqwq5cUNmsH5nrgDKP8ZcQucUE9jhJ6ArePAMFD5cGHhglpPO
	rjAffIjb6jUJRbhz65IP7RqXlw/K7V9Ws+nk4Orpg7YsHFMzCIFQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKRmYpU4vHLUjsKXyzHgcEbr0cOi2EyR0mBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrYAx75225HZ8dDArKf0Mh6YrpGBgI2Tc1SvDn+PLtXSS4CGD
	RnJK3CR8+l08AQOUQc3/hbohinmDKU0UOoKN701SQZc9sczBJRXBt/mUREyAj/ZFF9Wfm7hNy7p
	pG0IjcFQqk0j7vLVUewMSBDreIdk=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110222

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Bump pydantic-core to v2.18.2
-Ftp and Websocket connection strings support
-Use field description for RootModel schema description when there is no docstring
-Fix validation_alias behavior with model_construct for AliasChoices and AliasPath
-Revert typing.Literal and import it outside the TYPE_CHECKING block
-Fix Secret serialization schema, applicable for unions
-Fix strict application to function-after with use_enum_values
-Address case where model_construct on a class which defines model_post_init fails with AttributeError
-Fix model_json_schema with config types
-Support multiple zeros as an int
-Fix validation of ints with leading unary plus
-Fix interaction between extra != 'ignore' and from_attributes=True
-Handle error from Enum's missing function as ValidationError
-Fix memory leak with Iterable validation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_2.7.0.bb => python3-pydantic_2.7.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.0.bb => python3-pydantic_2.7.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb
index 36ad83527..3c1114447 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.7.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "b5ecdd42262ca2462e2624793551e80911a1e989f462910bb81aef974b4bb383"
+SRC_URI[sha256sum] = "e9dbb5eada8abe4d9ae5f46b9939aead650cd2b68f249bb3a8139dbe125803cc"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.34.1


