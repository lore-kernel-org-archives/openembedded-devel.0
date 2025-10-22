Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198C5CCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:24:20 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4853.1761099855989372879
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pm2V27fb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099855; x=1792635855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=opV1NZ/acxW2SmO5z0E/uTnOT4AyRl7WHjFKfS8O4dk=;
  b=Pm2V27fbxMUM2DtNEYHYri3NE303i7bSkocdVKSFkbx8/iQe1WXmrUyU
   5ebI8rbDlqhuWUjTs7HePAg3hIawUf/7s42wK3gbDwMUntBfj4ur/wAW7
   VzKWpdnhTTGDQeyEx7xn1uoUcw94mNw2Pkyrv49FY3Yel/0vNseUjT0r2
   uIBOZnoFmhKyJjKfn5aDxNVvuYw6gi4lVfBEWN+Jq/2XWCm/EqbDzuUkE
   29wO5edRngZ9rIsXsgF9sx4EZGX8gg8Ib3jOBzovv12o+hkOee0v2pIfY
   SFQi2y/gGEotX7QknwlJvu9WTxEGs+GA8pUzGhqsVHf9RukO0vFIhsFUO
   Q==;
X-CSE-ConnectionGUID: qpVbgzN1R8eA5y9eaXncXA==
X-CSE-MsgGUID: MTMwtwaFS2eZLwB+j07pvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="204646755"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="204646755"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:24:14 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 66A26C02F77
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:14 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 240641400625
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 744F882C0DB;
	Wed, 22 Oct 2025 02:24:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 29/29] toybox: upgrade 0.8.12 -> 0.8.13
Date: Wed, 22 Oct 2025 10:22:25 +0800
Message-ID: <20251022022227.226-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120876

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-core/toybox/{toybox_0.8.12.bb => toybox_0.8.13.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/toybox/{toybox_0.8.12.bb => toybox_0.8.13.bb} (97%)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.12.bb b/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
similarity index 97%
rename from meta-oe/recipes-core/toybox/toybox_0.8.12.bb
rename to meta-oe/recipes-core/toybox/toybox_0.8.13.bb
index 7281bb5684..919743135b 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.12.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 inherit cml1 update-alternatives
 
 SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "ad88a921133ae2231d9f2df875ec0bd42af4429145caea7d7db9e02208a6fd2e"
+SRC_URI[sha256sum] = "9d4c124d7d731a2db399f6278baa2b42c2e3511f610c6ad30cc3f1a52581334b"
 
 SECTION = "base"
 
-- 
2.43.0


