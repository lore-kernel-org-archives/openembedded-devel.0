Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D6FC5472D
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8718.1724833538730307556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YQDmzJP+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833539; x=1756369539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f28somN+zf3hzsRe+Zbsl8oNp9T6aT0xyddIW/1iKwU=;
  b=YQDmzJP+tcX2f0c+LvEXwhCxO75G7GC813kKM55eJBR9+y1USYcdHdFz
   9FsivYGifkOztUTHTsAWX9vNL0znhD83/+tc0vOXFP7sTxSPC+ThWckkz
   7DS17XBEzv+niVTYeIWobV/ugBgIWHvg45McgIWTr/gXLWq0MYoc+XIPm
   FSHqUFUhCUMiAwVrjKVfZVj350r2zoKkmrg8Ec/yZ7vzkyGwPAsUf7aNa
   at4Bng6af6EWE9H1CaLLGfDK9R3jk37jVkMhmWIcrQpL5EjD5rUc7AIje
   Pv35T5D2RCN+9sGYRCtqMZtmRE0ujZhlnZzChogHz+L2FHmuGF/svWg33
   Q==;
X-CSE-ConnectionGUID: mZ8ZsACUQcq2xCh8DBi1dA==
X-CSE-MsgGUID: aRXAqUJGRneRcK/oOWn81w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913170"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913170"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:37 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 64844D7AC5
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F7B430D89
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3959320079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D9A921A0002;
	Wed, 28 Aug 2024 16:25:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/46] libei: upgrade 1.2.1 -> 1.3.0
Date: Wed, 28 Aug 2024 16:24:46 +0800
Message-Id: <1724833525-2162-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.302200-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmLHBvqhRdA8sja7IBuOPthEngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDV/0EXtpjS5G9iwoNc8Rkg0kcHqhd6bfunNL99c5qTliOMZW614fFE8z/lxp+CSMOpxKX
	1rGqzYxv/OtNxK3P5d/H5nBidnxhSOIN/Y0IxYTVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111985

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/wayland/{libei_1.2.1.bb => libei_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/wayland/{libei_1.2.1.bb => libei_1.3.0.bb} (92%)

diff --git a/meta-oe/recipes-graphics/wayland/libei_1.2.1.bb b/meta-oe/recipes-graphics/wayland/libei_1.3.0.bb
similarity index 92%
rename from meta-oe/recipes-graphics/wayland/libei_1.2.1.bb
rename to meta-oe/recipes-graphics/wayland/libei_1.3.0.bb
index 807dcea1e..ee3ee01c7 100644
--- a/meta-oe/recipes-graphics/wayland/libei_1.2.1.bb
+++ b/meta-oe/recipes-graphics/wayland/libei_1.3.0.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "08f1d41085a6ae4bac7bc52abe2955d3354342cb"
+SRCREV = "997b7c0f37faea4f8bae59613c8f27370925d5b0"
 
 inherit meson pkgconfig
 
-- 
2.34.1


