Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078B9E77195
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.30362.1735032443247103847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F382e12t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032447; x=1766568447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5h/7EeQ3vF+/o81xqKS+WAzn5c9UHYS6kzYyU89M20g=;
  b=F382e12tL7wFVsDS11KqbnbwZgptC6fVDuTPTk6DP0vkUqwm4TfTDWZ/
   Ei0BPGF+Gxza7LUEZlvu4mV8s5iVrxeeymtviW39n1XA6U9TQ0/KMmGpI
   sBcRYk5SPIw3FlQ7HN2UnOeGh4SOjn4+X5Eh52w8K9JWs8aT1RksjE0wo
   RmSLu4esIsCTOvI6sgRMgQo32ip/ND6YAwC9sa1CelejAjaaoWIdjJzc7
   RspHEJTgamcg3jDNRyIrvYliLpeAwhEO5raoqBFgb7BwwXg4HqBzmKKdv
   7nKvAguPbcsiJCqn3vxZPRrcJru2T/Pgd9n5NI/Jo6gfwwraGbKiYY5kz
   g==;
X-CSE-ConnectionGUID: NSpxcivDToSJTebKB9llHw==
X-CSE-MsgGUID: keSRIeZSSAipknKRubKGig==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="187212820"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="187212820"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:26 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7172BD4808
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C368BDC92
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D4EC620071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7E41C1A0071;
	Tue, 24 Dec 2024 17:27:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/67] python3-marshmallow: upgrade 3.23.1 -> 3.23.2
Date: Tue, 24 Dec 2024 17:26:33 +0800
Message-Id: <1735032421-13513-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-4.732900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrDAyo2i9/A6hR6SMusLeVMMWC
	LeeL2Ypg4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbiGOq73doEniIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzHNglOQp9yREeyy
	PrIbQwQc5Ck5tK0RkYNdvhjV76cIeU7y+9szWAB3r97vIULL9xgdevWmgN+KPf8kEKR0Gr4zk0K
	zZ/IZOniB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114511

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Improve type hint formatting for Field, Nested, and Function fields to resolve PyCharm warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.23.1.bb => python3-marshmallow_3.23.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.23.1.bb => python3-marshmallow_3.23.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.23.2.bb
index 964e32c10f..334c9f8cef 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "3a8dfda6edd8dcdbf216c0ede1d1e78d230a6dc9c5a088f58c4083b974a0d468"
+SRC_URI[sha256sum] = "c448ac6455ca4d794773f00bae22c2f351d62d739929f761dce5eacb5c468d7f"
 
 inherit python_flit_core pypi ptest
 
-- 
2.43.0


