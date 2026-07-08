Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F1BC44506
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4906.1783503934081651491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j8LIEcYf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503935; x=1815039935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aXABY0GFak2c05Z4OucwErW2kRONzlqo4uCJSEnnVFg=;
  b=j8LIEcYfG7q/biU1qYVSDCj1wJAQWO/9w6sa+3RwMrvDL1R8DbTkgHYz
   fLOnzJN0GtAyZo1f8aEcXMF5w6Rf1EAyBQVIc1SZG7i/MvJl9xAVLfgi3
   ItxapkfBA8KgWRERB4duKrpW6UASYIMEVbuxBESkbu55tExZnt2n6P/xm
   AhlWFBCNo4oh23OXRHV/Q110Z+usCogwz+P5utvk1r9uin6c9lIz0E/I3
   ly9Kki7kIOCmNbk2+QXB1w8q6SuCPxK/tNyAKJZG0fD8q7EWVKpWW5F/f
   ASLJ14z1DxRsc7GsSSPcQXHP6AyaN8puUP/zvTFagwq3cfAEZpuQlJIJi
   w==;
X-CSE-ConnectionGUID: zAsnr3vKQrGFT5ntBbraJA==
X-CSE-MsgGUID: 2wM5o3WBQFy5LW0TwL1Aag==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246699871"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246699871"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:33 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BDB501002812
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:33 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 741A318594B0
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9B673180113C;
	Wed,  8 Jul 2026 09:45:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 12/37] openvpn: upgrade 2.7.4 -> 2.7.5
Date: Wed,  8 Jul 2026 17:44:22 +0800
Message-ID: <20260708094508.2060-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128083

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openvpn/{openvpn_2.7.4.bb => openvpn_2.7.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.4.bb => openvpn_2.7.5.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.4.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.7.4.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb
index 6349b62638..0aea6b7e74 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.4.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "18db05f3d5eee3663db1914590044e5f96ff5cd47b6e7846c6a350806c23dbce"
+SRC_URI[sha256sum] = "c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.43.0


