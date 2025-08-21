Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F42CA0FEF
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.4678.1755766813635282172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q60A5AS8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766814; x=1787302814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SoUnTnWLdTKnR6regRH81oM5LnBfJcnjh6/ptMyPxs0=;
  b=q60A5AS8aZmQvq6PP+wn7hN/uuHOdkESTkw93bFyOFPlCc57wnwQK4/P
   a+ydJNkdgDinvsVidyF8em3Rx6ClK8k0mAAw6BB+s+HxfIjNcgjbRW/Pn
   bgl6TB7pTPkfXQDAdcek3gzEg4V3DXLsNFSYqncFHUhOv+nXizuEez2QF
   tRNEW5E1y3AWmR1yA5PiwiV6HSer4T89l17PcEmzIg8jbwTTfbNsZNl55
   mEc+8QtomR3hCS+5qwzIwXEEBLmFwBYRgU/0hjCHemcFPCsaS8vVFLOdW
   zG9sPTtXS0EwG/keMsRrrMoNTfffIlYdEBBrYHP6hRXYBJI94CUQTViac
   w==;
X-CSE-ConnectionGUID: 0qMMbgrgQnyMXjC6NQu1HA==
X-CSE-MsgGUID: 5eghO+DHQqOTAbStK4llKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="210706586"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="210706586"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:13 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 36D6A1C1C720
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:13 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E12C8C08A76
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:12 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id A04C610023C7
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6CCEA1A008A;
	Thu, 21 Aug 2025 17:00:06 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/21] python3-pyais: upgrade 2.12.0 -> 2.13.0
Date: Thu, 21 Aug 2025 16:59:41 +0800
Message-ID: <20250821085954.2056-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119058

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 added a TCP server capable of handling multiple concurrent client connections

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyais_2.12.0.bb => python3-pyais_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyais_2.12.0.bb => python3-pyais_2.13.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb b/meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb
rename to meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb
index b31ca80096..321b37162a 100644
--- a/meta-python/recipes-devtools/python/python3-pyais_2.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyais_2.13.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79d9e278b76e3e5b3358cd70b328173c"
 SRC_URI = "git://github.com/M0r13n/pyais;protocol=https;branch=master"
 
 PV .= "+git"
-SRCREV = "4ec68378f76c49825b5662a052e6834d7b44b96c"
+SRCREV = "2c50d58c4776a4ca7560bf9d70587a9acf523d1c"
 
 
 inherit python_setuptools_build_meta ptest-python-pytest
-- 
2.43.0


