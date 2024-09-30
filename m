Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE23CF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.48966.1727682247969298345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HQmmXemf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682248; x=1759218248;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E6G5WEbJJjepRtN+VkXS1IXrQXE8X4BBXCH04oxh1EA=;
  b=HQmmXemfPLh7cj8VAd8rxoaN5kiMKf8mEVZ+M97dJJQjGxrC4emYDYRM
   4VCeK3sxgPFRac7NE4TEcfVfugYjWYwNBxFZWEWTmY+CrsDw4KtR7w9Me
   FjgPGwL0TMgjslr+rQzQ1jdwnkbZO+Eh1rlJMseo0JXxj6HuQziVoNG7P
   r3yVZ2OOvETSs9diEuAGK/jzT3JZ+lIjICD1ZjaOOxEDsqxfiDe7kvtms
   3iF87iy9HunVK6fRBwE8t3JSIWQyvhB6NeeTfsSAEy5V5x9xqhKtlBkfs
   weg0B9IzqHu3yEoEAeMFXVhifCbwL4nF5VU4voCt1LuQG4B77qEAu9M8e
   g==;
X-CSE-ConnectionGUID: p6LcwZlYQSeeZ82gUM9ktQ==
X-CSE-MsgGUID: RVWhbZtWQdWt+g42kSMvDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163217124"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163217124"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:06 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DB5BBD4F54
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 270E8D5098
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B54CA6B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 658DA1A000A;
	Mon, 30 Sep 2024 15:44:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/40] python3-xmlschema: upgrade 3.4.1 -> 3.4.2
Date: Mon, 30 Sep 2024 15:43:01 +0800
Message-Id: <1727682185-12664-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-0.780600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysI8aE7tJDUcEJY
	42p5NWsi+xFlvZshf1b6XlaQTkk4x/DpgNqI2WgtSHCU59h5KrFUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw65x7uAXGEprZiQDIJsDspXmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKUajHGuNZG97pJE142OxiR3HO3dxAUPyr9Q7PvgpuRfRYc/
	Ln2t/IgFdFVDN3EHuuCD+Tz6YrvH0mk0MK4f1YpMTk2CHYzSM5Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112597

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix other failing URL normalization tests
- Avoid the use of sys.version_info for checking results, better to extend the check to more values.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_3.4.1.bb => python3-xmlschema_3.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.4.1.bb => python3-xmlschema_3.4.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
index 845735c9b..b29862b1d 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "4f69eca6f2c446b06c74acd958e7d6613487c253d959a3b75078dfcc880b80ff"
+SRC_URI[sha256sum] = "d35023ea504ea46127302d1297b046d023b96fec5fe4b4b690534ea85b5e9bf8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


