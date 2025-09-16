Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5411CAC5B0
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.15058.1758015726070597579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XlgNzKsb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015726; x=1789551726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D1qGwtEP+++IHddHgrGMpskAjf1gcOV96uF8szSU8bU=;
  b=XlgNzKsb943c/6pGbNceUFD58ulYbtVvepPQPX4BUW7vuucluniY5qL5
   8E3yfrWU3OciwR6k9ZvDydbWyh7f2GGsvZTC9b8UKyhMaslEhMYl/Kr3d
   6eoX6fbS7AKbu0ttXZrBnjqmt5p0RX/wI1l7Q9Vww713ETAHgYOvFQyP2
   K/RIciGFLsZT9RT0+w0zXmuu35W9RA9J3nmuXz4JsJKsg8ECaMfEVyCRW
   Z7vfC/qiPv1d1Tpt8zV2xDp7OjnHNkTV8SXtdhrLlvIZ3s9R4szKa4XYY
   DOxBHT6B7TdcpnRoXG+cidU4aLteKYUl8+8confo82zHu+8v3ViMh2aTa
   w==;
X-CSE-ConnectionGUID: fH+lgJtiRQ2FhGRzoDxRSQ==
X-CSE-MsgGUID: KbIjDZAIS5CU9WaBNu3asQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="191834339"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="191834339"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 47D668203E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 069B318000CF
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 6D9AA1003119;
	Tue, 16 Sep 2025 09:42:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF9211A0097;
	Tue, 16 Sep 2025 17:41:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/42] libxpresent: upgrade 1.0.1 -> 1.0.2
Date: Tue, 16 Sep 2025 17:41:22 +0800
Message-ID: <20250916094152.1479-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119434

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxpresent_1.0.1.bb => libxpresent_1.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxpresent_1.0.1.bb => libxpresent_1.0.2.bb} (79%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb b/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.2.bb
similarity index 79%
rename from meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.2.bb
index 3b15153b6b..257173ecee 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.1.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.2.bb
@@ -7,6 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
 XORG_EXT = "tar.bz2"
 
 SRC_URI = "http://xorg.freedesktop.org/archive/individual/lib/libXpresent-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b964df9e5a066daa5e08d2dc82692c57ca27d00b8cc257e8e960c9f1cf26231b"
+SRC_URI[sha256sum] = "4e5b21b4812206a4b223013606ae31170502c1043038777a1ef8f70c09d37602"
 
 XORG_PN = "libXpresent"
-- 
2.43.0


