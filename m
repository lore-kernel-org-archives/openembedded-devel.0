Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCF0D29FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.40137.1730874687516066881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KkGVQu3M;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874689; x=1762410689;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PfzHzcPLxsa8vWg0XkT3T37l5CObWgWdfIuzvLrE+LQ=;
  b=KkGVQu3Mv9vIykC4AwiSlGrHACVcChSJD3tKnolkyXPoh5CzXIj1fmRp
   aDho5WPVLuVjZ+3pfJpDscF6lXMbgFYFeThrwArraikPTnV/uqOoE4oya
   12FaBCOPEMk716/qqDm+ryKOc4gR8jpHzURFNS7lN2RR0ndRj2DkHh/1N
   h6nYxIyi2pT4nNhNXP5B6Q7KSAn071AnOusqCC3XMPCaBJNWTqHAQ94Iu
   eJ94aQi1lHZBWf2JW+uiYUAB4HumgxvvldwacToa6Qtf19kha+f4ovX6H
   /d1UkfhUMSryhBspZUC7ymu9eguqjnLjc2uXf/x0AYcc6V9c9dd+J+dRt
   g==;
X-CSE-ConnectionGUID: dwHoXPdSTwaOqIOqlvrTLQ==
X-CSE-MsgGUID: AZuY4WLsSB6Q1G0zgNWoIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="179341288"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="179341288"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:26 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 46E11C684E
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 860D6D968F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 207216BA6D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C34F11A000A;
	Wed,  6 Nov 2024 14:31:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/46] python3-prettytable: upgrade 3.11.0 -> 3.12.0
Date: Wed,  6 Nov 2024 14:30:44 +0800
Message-Id: <1730874660-2364-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--0.066900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxYC5LPd7BvbVxc
	aPG5Iqk8nJ0c0AWmZwHhTMOht/kDw8RtdQ+Byd8E/9mRo9wUk+U4Ddbs3t0GCf9b1MifZCVy7Sc
	dpy2ZKwKcrQThtVmcVou5LnX5kwAT7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5BEGD
	rWRIrgOIGQRIwjTl3iao1ovsqxhbivvxILmKK/HBRFJJyf5BJeXU/IDt4T4+H6C0ePs7A07YVH0
	dq7wY7uIMlChDfvpXE/vZ8x/HZ+83OZqsKwmpMp00bxtKOmGMwD1QfrxXVxQVSEvZrepm7yGD4t
	Z74CJHBuNvvmQpDOuUktqSl3Pp+HMi5lZCU5YJRTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113714

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Emit DeprecationWarnings for hrule and tableStyle constants
- Add new themes to ColorTable
- Use SPDX license identifier
- Add IntEnum for HRuleStyle and VRuleStyle
- Add IntEnum for Table styles
- Add OptionsType
- Add attribute type hints
- Add missing attribute annotations
- Add type aliases for Align, VAlign, HeaderStyle
- Add type annotations for attributes property
- Improve TableHandler type annotations
- Improve function type annotations
- Improve row and column type annotations
- Improve type annotations for field names
- Include RowType in __all__
- Small improvements
- Generate __version__ at build to avoid slow importlib.metadata call
- Release to PyPI using Trusted Publishing
- Drop support for Python 3.8
- Update new home to prettytable/prettytable
- Fix drawing headerless colored tables with title
- 1Adjust format validation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-prettytable_3.11.0.bb => python3-prettytable_3.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_3.11.0.bb => python3-prettytable_3.12.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.11.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-prettytable_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb
index df11141a5..442aadda2 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.12.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c9a6829fcd174d9535b46211917c7671"
 
 
-SRC_URI[sha256sum] = "7e23ca1e68bbfd06ba8de98bf553bf3493264c96d5e8a615c0471025deeba722"
+SRC_URI[sha256sum] = "f04b3e1ba35747ac86e96ec33e3bb9748ce08e254dc2a1c6253945901beec804"
 SRC_URI += " \
 	file://run-ptest \
 "
-- 
2.34.1


