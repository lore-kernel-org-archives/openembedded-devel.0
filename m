Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B92CCD1A5
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:24:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.4780.1761099850212101039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DeW0F/HR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099851; x=1792635851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+6DBviPq8rWa3LOZi5wAWABWPBYD8T8xNi8oXJpyliQ=;
  b=DeW0F/HRiBxbwomwfaTRjlWdc8jdA/NSv3AVm7MZONvRQMA0BVUK7xej
   FLUgLV24N0Ua4gp8me1udqr0jczr+75TiwZqTj0aaNKU4CwetUBPeqQLG
   frqWWmmQuAtOa1tkT+5RbxVgV7dZRG45ROUH6UUWeCl0uYYrdhFI6XavA
   Hx7emizggm7rwv7r4jgoUt+Cy3aFp/Nb8mxXaPQqnosBXZoXBuRM/06nl
   4SWqHk9vpq70zV4GSY9O8enifYC41O+OhbTu9Imc3O+cf/6MLbLuC6KDv
   qaR7K4WoHkrsMyBFdwQDLnyNHiw5fFvfM4koMBrXydkRVOUbVCw3K1PoQ
   A==;
X-CSE-ConnectionGUID: paK8B61rSz283TCfFGqAgg==
X-CSE-MsgGUID: 9B+4TrGORaKl8YyBpU/0rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="220332156"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="220332156"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:24:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id AEB7782071C
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:08 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6AC261400628
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B5E5182C0E6;
	Wed, 22 Oct 2025 02:24:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 26/29] stunnel: upgrade 5.75 -> 5.76
Date: Wed, 22 Oct 2025 10:22:22 +0800
Message-ID: <20251022022227.226-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120873

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/{stunnel_5.75.bb => stunnel_5.76.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.75.bb => stunnel_5.76.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.75.bb b/meta-networking/recipes-support/stunnel/stunnel_5.76.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.75.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.76.bb
index e13872abcd..4121044560 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.75.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.76.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "0c1ef0ed85240974dccb94fe74fb92d6383474c7c0d10e8796d1f781a3ba5683"
+SRC_URI[sha256sum] = "cda37eb4d0fb1e129718ed27ad77b5735e899394ce040bb2be28bbb937fd79e1"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.43.0


