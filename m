Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEECCE8D5A
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.11285.1726716763160939036
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pJX47S8n;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716763; x=1758252763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PpuWMZkCaPzW8PGY0sSMFXEkuFMaor+DsvyhXu9B7oQ=;
  b=pJX47S8nlW5RgyyAbgKxzUeFOxcE+xUkBADjlv8ixfEReaqXZe1FfiI9
   CXRy51RlC3RNwsBSYnk87pMoeHPtUuvk2lCm05K+IweK+OKYiOrZ6Vp3W
   eYUOmK9rqbz4LDCR4UVkIRyK0GYF+Wmvx9GiB+o8BglbVd/LczX/6qj39
   rSX5H0EXo9e2wcfhSXY9aySSIK/Q2MuWVA/RXFtMv7KVTvtgB7+ZOK+xE
   0KfidYuHa28RbGWFLs0Smb9lnRddUEFWx0XKxKIx0ip6Pkj7yQbVccWBV
   XuYomtFwrSDV6w1GU4NYJrbaXL5hkb0DrtwB4GpzQNMlVW6F2ak+E0ZGc
   g==;
X-CSE-ConnectionGUID: H57mvg32Rue8sCPAJYU8mw==
X-CSE-MsgGUID: ss8lSHqJRIawTnbmKEaa7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="162453561"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="162453561"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D2ECBE4458
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F0520D5108
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A36920086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 36D671A000A;
	Thu, 19 Sep 2024 11:32:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/28] python3-xmlschema: upgrade 3.3.2 -> 3.4.1
Date: Thu, 19 Sep 2024 11:32:09 +0800
Message-Id: <1726716733-14548-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10-1.911600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysI8aE7tJDUcCcJ
	pluaZgGOHr3zfXlPv74f1AdLUyG7nR1YpEPWJiyzP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNR08OMuSP+vEH5VrRwBcZFYeO8r8Zr3W0eZg85JbHXtd9U7CB7hYVXiPGX/VUTfCD491z
	AXD/CliMIecGplRSZg7xO78je+xvo4g39jQjFhNU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112385

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix failing URL normalization tests
- Disable protocols checking with elementpath v4.5.0
- Extended ModelVisitor to make it usable as an helper class for generating content

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_3.3.2.bb => python3-xmlschema_3.4.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_3.3.2.bb => python3-xmlschema_3.4.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb
index 33244d98e..845735c9b 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_3.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "a2f021f21d0b5ab371e9bcb5a1d5c34b9ba2c74ad3e32854474c4159bf94e158"
+SRC_URI[sha256sum] = "4f69eca6f2c446b06c74acd958e7d6613487c253d959a3b75078dfcc880b80ff"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


