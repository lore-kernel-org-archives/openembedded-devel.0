Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7275D44002
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:26 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.37266.1731922212311143748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jgLrsCuI;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922218; x=1763458218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i/EiD7wifAp03egdid1WuBGnPEsXJzu0RZ4D4JNcJBI=;
  b=jgLrsCuITLOt+6HVuUvparQi8CbBSJjG5VQK1WlvSiJ4mXyDZ61Hl4fM
   TMHapUrElPiSfnplmjyqO9LOBEPWoYYR8DLT3D8+jIOvcb+g9AQjzyCZD
   wAaEcVOT5Wtmtsybh3roZCntkrY+UtrwnFdySWVZ47Nu9K8fSkkwKdWQZ
   Lq9JlvYllIRtlG8t6AOlURIU7tBCZMD3vvJWd7tjsnRHnCHqI4Hhvpcx5
   GEfo2r3FqB5J0TyTbIcmVdwIuSSLVsmtt8rsnHesXxLmUpNO655L7cN84
   O4ewWNj/Jzejxfq5of/O59TOPxtU/ewf4kao2GBWLjlCRrvF9B7DbbyVE
   Q==;
X-CSE-ConnectionGUID: 4dwEy/f9QIGinhhJfVrnXQ==
X-CSE-MsgGUID: CrXERziRRD2JPEBuKl/y/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="159756273"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="159756273"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:17 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A83FBC2260
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 46535D52B8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D95A721FD58
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A1C51A01E9;
	Mon, 18 Nov 2024 17:30:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/32] python3-pdm: upgrade 2.19.2 -> 2.20.1
Date: Mon, 18 Nov 2024 17:29:45 +0800
Message-Id: <1731922195-5266-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10-4.894700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSD/mj0E9XMZRoIB
	CrHXdfvc4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzYt3fV/bCyMK1p6
	u3db2yYFSjNtdj/6vCSZFiCyJZlOOubi7L8/Dw/MAaQX2Vdmjc/L+ZkReExTMJT6L5rfSxitWzk
	Yo8f6PaiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113887

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/pdm-project/pdm/blob/main/CHANGELOG.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.19.2.bb => python3-pdm_2.20.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.19.2.bb => python3-pdm_2.20.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.19.2.bb b/meta-python/recipes-devtools/python/python3-pdm_2.20.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.19.2.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.20.1.bb
index 29c70d18e..a043b4b35 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.19.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.20.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "efb39264569181d0375536ef81c556648f16b540d429a53715730490a2283567"
+SRC_URI[sha256sum] = "5348e9d33de381f998904a63ab18efdd6d1cf6377d45572e8b996d58dfc5b996"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


