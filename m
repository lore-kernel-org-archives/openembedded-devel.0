Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32014C71144
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.78433.1749526426091719447
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZaEIjfr8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526426; x=1781062426;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LA9WiBqBIsSugrSzKXk/h4eX+TiA6W3zITYt2Kbp1iU=;
  b=ZaEIjfr8wpFZKMZ00fz9wJYMg/kOgEzj1afz6tJmyGoCF9NZ7NnfH4x8
   wtPCsVwJ+cpQrvE7eCUQ9dAAGs3l421BnkBQtzz+hfqJsynk8gGLzxvx5
   qL19y5a1LbF4Q3snlM6Khew3ya50io6h2p/28FxnOhYTpCpjSVk4T0KAI
   dL2LpNL8Dc+1Ie1qRDcxFn9SsM9krAcP3I2KKAnbMBv/4sn29DVBF94wF
   BeCqF+1s1Fc8EN+nVHVFnKtB3OaZ8XPr1kz/BA3auetXLwo1GgFQwhqzw
   ElRmRwAjo3T5NHUP6nBoFmFMAHzSb/1RsgQNZk38qHM6NGAsKDNgq1Egu
   g==;
X-CSE-ConnectionGUID: uKSbd6BmT5qZuwWEftW+1Q==
X-CSE-MsgGUID: stOVjGFxSruGNaleMbb3GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181714972"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181714972"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4406F14753
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E197BD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:40 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6784A1A009A;
	Tue, 10 Jun 2025 11:33:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/64] libsdl3: upgrade 3.2.14 -> 3.2.16
Date: Tue, 10 Jun 2025 11:32:44 +0800
Message-ID: <20250610033330.924-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117810

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.14.bb => libsdl3_3.2.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.14.bb => libsdl3_3.2.16.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.14.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.14.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
index 9073a3c276..7a2a37f69a 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.14.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "b7e7dc05011b88c69170fe18935487b2559276955e49113f8c1b6b72c9b79c1f"
+SRC_URI[sha256sum] = "6340e58879b2d15830c8460d2f589a385c444d1faa2a4828a9626c7322562be8"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


