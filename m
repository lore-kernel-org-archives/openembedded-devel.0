Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78103CCF9F4
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.27238.1761696931758885274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V9pRdl1W;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696931; x=1793232931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WU0XG/a1HX9BRaN5eQOo/sE+J9Sbed3YsaMIoyprdH8=;
  b=V9pRdl1W24uV7OIzJltTiSbVQe/kmII2YtzS+PmUDbS2t0P60mI1y0xU
   3BmC3oIz7uFve1e1uz0Oxu6g84w2aDWfgTmYs3w8btpziylQWU7py+xHV
   NnS4ZkjnnzHOcnvk1UiIpPs+t8oQmk8wg7HVkFp02x4WSvXBY5rFT6zcb
   kcEWeksxRn/n66l+4GZ8jADISsUTsn5ILgFO5+ddHSCOzEDYUxaGQVSiK
   Hz4t/iTi8PchMwfvcKlZw5Si8gC7KS5ikwQFhKkBtlb/70G4pRGDdvR+/
   JRVAXi+spKoK9GVQmCv7ba9cbEEBRXPXl4w+R55d9ld/OV1Lsvw65C3g4
   Q==;
X-CSE-ConnectionGUID: y7alRbYPSzmK3lCKfpqFbQ==
X-CSE-MsgGUID: LCp+RYwGTCWpaiBtZFxk4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="196354323"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="196354323"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:30 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3E861100035B
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:30 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 037FD1801998
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4FEAD82C0FC;
	Wed, 29 Oct 2025 00:15:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/32] libdecor: upgrade 0.2.3 -> 0.2.4
Date: Wed, 29 Oct 2025 08:14:41 +0800
Message-ID: <20251029001505.528-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121114

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdecor/{libdecor_0.2.3.bb => libdecor_0.2.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.2.3.bb => libdecor_0.2.4.bb} (94%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb
similarity index 94%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb
index 35deb8d2aa..8264b5b7ab 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
     wayland-protocols \
 "
 
-SRCREV = "15afd30a6e23e949d022ff18f17dd7fdbd3361e4"
+SRCREV = "4d026d59edbf8e2e876c3f2c07c480f8840aa922"
 
 PACKAGECONFIG ?= "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', d)}"
 
-- 
2.43.0


