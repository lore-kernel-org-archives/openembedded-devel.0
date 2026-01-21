Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDDEC44501
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:29:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9490.1768994982838325974
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NTqFY6kH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768994983; x=1800530983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mWxaLEddHbaroomdNuTFGOu5Yaf6IaERniipxT4t2JI=;
  b=NTqFY6kHrZ28v852Mc1aH9rekIvZdHMsuXvYthpsuDd1mHLaQX2Pf5yE
   27ON4uYGbj0TiZiyAtYJn8z4uHdYcSmtRnsAFku0friA58chbg4DEiooc
   Aeruf0qqW1/hAuAyUwm1WCt3+1o7w47ji3Qy/eB4XWvrW1jKYlnB2n41N
   KfkEXxdHzKtjmfkXCZxnU8lMOu3f7cYfwhLp7HYY+D2KmcDk6Y0Rqcslb
   po4Ajs+aq36WLbC+95q1LQHcKAPZw4PqqcYgMVm5+7nsmIC32p9OtMCi8
   Fw3jEviwRyVTJrQJmsTUiRtCrtKwbrixcZXBBl5SmOhLS9aw82v/px0mM
   w==;
X-CSE-ConnectionGUID: St4lf7l3RsehmsWdpAonWg==
X-CSE-MsgGUID: LWar1um/Siu7LGqmXS5gGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="226522872"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="226522872"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:29:42 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 10C7D1C1C70F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:41 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BC069C0075B
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 396A61404868;
	Wed, 21 Jan 2026 11:29:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/30] plocate: upgrade 1.1.23 -> 1.1.24
Date: Wed, 21 Jan 2026 19:28:56 +0800
Message-ID: <20260121112921.857-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123696

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../plocate/{plocate_1.1.23.bb => plocate_1.1.24.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/plocate/{plocate_1.1.23.bb => plocate_1.1.24.bb} (86%)

diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.23.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.24.bb
similarity index 86%
rename from meta-oe/recipes-extended/plocate/plocate_1.1.23.bb
rename to meta-oe/recipes-extended/plocate/plocate_1.1.24.bb
index c9502db16a..b33c339d14 100644
--- a/meta-oe/recipes-extended/plocate/plocate_1.1.23.bb
+++ b/meta-oe/recipes-extended/plocate/plocate_1.1.24.bb
@@ -12,4 +12,4 @@ DEPENDS = "zstd liburing"
 SRC_URI = "https://plocate.sesse.net/download/${BP}.tar.gz \
            file://0001-Include-linux-stat.h-only-when-sys-stat.h-is-not-inc.patch"
 
-SRC_URI[sha256sum] = "06bd3b284d5d077b441bef74edb0cc6f8e3f0a6f58b4c15ef865d3c460733783"
+SRC_URI[sha256sum] = "e55a757af1d7efb15ea674993224da4f0258479f8f720bd3dae0925d27dc04a2"
-- 
2.43.0


