Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F14CAC58D
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7934.1756890228119352621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NeFc2Vd2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890233; x=1788426233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eAFOtkl4B8IHcC7DPu+dPMkJlBOfRrd8CaEa4BvdDTs=;
  b=NeFc2Vd2vti95TYTuP8PTqxvSv68raUZzVSXNhXk5eC25m1itKM5AGvO
   MJWgXnbIzKdhoA+bLzs2xvGti5dvDC4REmTXapPdDaHz7NxTxmRtcK0U+
   EpBPP8FXESLntz34gpNcwCEPKYIIs6qU5GmIrJR9IwaGRYEOhibtifgMo
   nEoXedazuqE/l6sXgFmwu2iG/Y5ZVG6DXx8e2ZRnWOawS/vvGzScYS/vO
   45fwyNlO/EZRSFgZS71OAtwI/FDHeJH98fPpotHDZxtC+kPXvg5vitOV/
   q12XKji6PNXQg+Jzs7MoBYZmV/d3BBjKhJocrI3cMHAuzMng8cU1Icfce
   g==;
X-CSE-ConnectionGUID: +yoyTM+mQk+2bwsfHHLlEQ==
X-CSE-MsgGUID: BORL0Z88ShWs/e3HLNSXnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199446298"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199446298"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:52 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 81264145C
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:52 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 358C4C0C862
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:52 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 14F041003107
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F20D31A008F;
	Wed,  3 Sep 2025 17:03:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/56] python3-humanize: upgrade 4.12.3 -> 4.13.0
Date: Wed,  3 Sep 2025 17:02:54 +0800
Message-ID: <20250903090317.2002-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119229

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.12.3.bb => python3-humanize_4.13.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.12.3.bb => python3-humanize_4.13.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.12.3.bb b/meta-python/recipes-devtools/python/python3-humanize_4.13.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.12.3.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.13.0.bb
index 7b32cfba56..7bcb0f62a7 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.13.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "8430be3a615106fdfceb0b2c1b41c4c98c6b0fc5cc59663a5539b111dd325fb0"
+SRC_URI[sha256sum] = "78f79e68f76f0b04d711c4e55d32bebef5be387148862cb1ef83d2b58e7935a0"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


