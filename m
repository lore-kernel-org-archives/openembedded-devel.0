Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638A4CAC59F
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:24 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.15429.1758015739814763187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TbcIsh2v;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015740; x=1789551740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CYQtzSiYuhiEtjT/jEfEZ+L0GWPURPBrzlSQIOh+1p8=;
  b=TbcIsh2vbOyq3RV5R1OtjMzcryZaiezQdEMMOFIbf1ak5NmYoKt5lbNH
   2Ywzajj//SS/dRp3rxdVzc4IXP7oWtKXbitXMC1Vi+4gzi6s1stXhGyX8
   veaAocZUB1ugtG0VHO4UItfggEXadYktenaOMvpmJTBiMCgJdCGhMcUjA
   1AviUblrhcmop6a/ptXZ1eDBmuSydqNUJyp2WoIgxn2dfPWmwK1hcfEnc
   uzl6QnuNx4yyaDByWyfLyFuWyGEyXDn7m/VH5xnU9MmcgjKjDNgptlceb
   JkQpLFcEv2ZDMoFqiHifzNLro6MYDqX8ahsi5K0snB9AXT6j9tmTwTpz2
   Q==;
X-CSE-ConnectionGUID: t+PE4EjsTD6ZMwh/ZmxYpQ==
X-CSE-MsgGUID: rX4JLJfXRQyAGRJlHkpq6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200384967"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200384967"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:18 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 64CC91000343
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:18 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1A8C1C01288
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 749001806DBC;
	Tue, 16 Sep 2025 09:42:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E77BA1A0086;
	Tue, 16 Sep 2025 17:42:12 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/42] python3-zeroconf: upgrade 0.147.0 -> 0.147.2
Date: Tue, 16 Sep 2025 17:41:47 +0800
Message-ID: <20250916094152.1479-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119459

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.147.0.bb => python3-zeroconf_0.147.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.147.0.bb => python3-zeroconf_0.147.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.147.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
index d2ce53905f..31d671ceca 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.147.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.147.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "f517375de6bf2041df826130da41dc7a3e8772176d3076a5da58854c7d2e8d7a"
+SRC_URI[sha256sum] = "2f91e2544433acfa928c8dbaea7af8bf0644e06904610799d6b762fd599d81bd"
 
 inherit pypi python_poetry_core cython
 
-- 
2.43.0


