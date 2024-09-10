Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11080EDE9A1
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.18336.1725959012835706305
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ux9AStNv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959015; x=1757495015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HsicUB3K6c34QP6592cO9eYfG411elHlqO3xvFyusIk=;
  b=Ux9AStNvsYZV8xIhnAefsraCBeb6cu4ZDnfi0Gt3YlakagTzJ3Dh5Ord
   OxZ0mmaRBUQJ0tJet1gl7yySDNHp5dtDpnkS7xtyliEcTWsdVtYpt9Fm3
   6ZXiRc/YBIpbZPzHwWOdGmtTuMiRJLMso+8XdrfN51bkQAAun0OXHWWA8
   8j0uLpxQp05vhOzLFrLZy7PdsYxcixoOggCKU9VHc4JFwdDZ0Jjo1ttmR
   HzMF3IldVZGmz99T8p0phEL6zyVSW9pOcrrAhnyCmlYr1DkjuiDe976n5
   iid4RZdd2/rDfTlT1QBdsfBoOf9bJ6vMNVmhacMkePaGKd4z72DB/AYsE
   g==;
X-CSE-ConnectionGUID: R2Sks3lcSsGw599/EFfGWw==
X-CSE-MsgGUID: TfERFr2yT4e8Pfv0GWMKDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173393783"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173393783"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 363B9D64B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7757CD4C32
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13B3A6BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA7671A000B;
	Tue, 10 Sep 2024 17:03:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/42] python3-validators: upgrade 0.33.0 -> 0.34.0
Date: Tue, 10 Sep 2024 17:03:02 +0800
Message-Id: <1725958990-5719-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-6.825700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrdwX/SSKrKHg1a43ksVK2hWvd
	ltQYL4qH8KbwGrmD2pENyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt72c5
	16rvzqrt3JdDQ85qA8QYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3vz6
	NkpWrYb3sHLb7sa0TwQ89XZbDLLrgAEpBOsC26FVQ/Of+/xWCLpC8pxEjZAVmc/32vEjTgZ5slf
	s3qitlOAGSs02O8iHkLk+kNivZqBw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112220

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- feat: cache IANA TLDs for faster lookups
- chore: update dependencies
- docs: adds configuration info

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-validators_0.33.0.bb => python3-validators_0.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-validators_0.33.0.bb => python3-validators_0.34.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.33.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-validators_0.33.0.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
index 38775cce5..ebba68388 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.34.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
-SRC_URI[sha256sum] = "535867e9617f0100e676a1257ba1e206b9bfd847ddc171e4d44811f07ff0bfbf"
+SRC_URI[sha256sum] = "647fe407b45af9a74d245b943b18e6a816acf4926974278f6dd617778e1e781f"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


