Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F404CCFC538
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.50495.1728896174284022729
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RqxpuBS6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896174; x=1760432174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=H6z1RDVKUXJJCWX2att9M8TliEcyXjKf1pniiDCjjYE=;
  b=RqxpuBS6w7PLx/5eGwOfYxtzmoYeYGYOLnevJeePgtZaqCFpLk/wAQCd
   CNrBmVoKKFKknklAWdNamfPj0LbHU0YoXrOg5dQwRgsYfS1bwQTGpkxFN
   ZiBttcZ+yB9IX7Argqn19yCN810vpc3uOpY6j0ObNugddtc8ULmga5tqW
   FBYezIiaIb2vkv/GeDaWIsWFPPYG6XhYAT9yYA+ws8b9+ZxebwV/hY7Qz
   +LkjXmM1qF57emr/TilDjxyDANZbrwhhri3PY1FLbwbiBXqgkClLRB2p7
   Cm5jYWE+GNqy9aR+s4VizpRkXJ7YQHKyzzTUXSUa0cgWR1TGx98DyAVTu
   Q==;
X-CSE-ConnectionGUID: sR7IacqASQ+0Lhlf+gUogQ==
X-CSE-MsgGUID: XBiLEzY2SgyvYo8WKv4Iwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="164060388"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="164060388"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:12 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7C85D5A47
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 45EA0D5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1FF46B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8898B1A01ED;
	Mon, 14 Oct 2024 16:56:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/54] python3-pyephem: upgrade 4.1.5 -> 4.1.6
Date: Mon, 14 Oct 2024 16:54:54 +0800
Message-Id: <1728896115-2944-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-2.091100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwd3hIj0tmc7f44
	pYPD16CL4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054zP3WYNhkszl1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtnlVv2XS+do/ElR
	eBidg6xbRKu2yFzFpE9601S0E+mePNL+CIR6p16kljaWlJa97gNmXDCm111+0Vrrazb97CL+OrZ
	sbbxSpH7mJLHoL/JV3yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112884

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Build wheels for Python 2.7 again
- Update github actions and add Python 3.13
- Fix or remove several old broken links
- Remove broken link to Meeus's book

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyephem_4.1.5.bb => python3-pyephem_4.1.6.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_4.1.5.bb => python3-pyephem_4.1.6.bb} (77%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.5.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.6.bb
similarity index 77%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.5.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.6.bb
index 8c9262afb..c3b151508 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.5.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c930b395b435b00bb13ec83b0c99f40"
 
-SRC_URI[sha256sum] = "0c64a8aa401574c75942045b9af70d1656e14c5366151c0cbb400cbeedc2362a"
+SRC_URI[sha256sum] = "0ed2e4ea76f9db3eede2204adab8af3f1708201c7c04ee8511e710a54ca6425f"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.34.1


