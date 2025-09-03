Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88022CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8051.1756890208805506403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QvRTKWaw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890210; x=1788426210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qCYrD+LnxPmb2ZqIcMKr33ZoNOmFOK+jHQHsQ7/0w98=;
  b=QvRTKWawxJhn7cvuRALgjnVhUkZyQQz6eRcUbDq1ZOWpNOZ6wiOwi95p
   67mqnDuFzIqVZjbpaZaZvpe14iwT+IUUYCAIOUDN/30DCI/kQjOlvYFhc
   jSXli5NAWmLhbC8cifbywf7nILD3Hc52etXcFVO0DgWC/6ujATtI6nbYT
   YXyU5IGXN+GwBN/OspHRbuykhvBPmTssMAgXWH0yLqY/o+CXmc42zDJIt
   ti1rS3cS/Zj5uLM1izdNPMtkeQLicYRUuyV2ApflI7Z4Cd9XAGnCIM8Fr
   S6YFrEEewghFqmxRXaINfcjJ7Z05Cx63JPrRvLhu6IIHTV/MfGyRlC46B
   A==;
X-CSE-ConnectionGUID: /Dy8NxgHRhatqcDw+c9UvA==
X-CSE-MsgGUID: JJ0dFpN9Qe2TI4Lf9GAt6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455882"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455882"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:27 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B7425C0041B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:26 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6AC978B67AC
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:26 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 44CFD2005D24
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4936B1A0071;
	Wed,  3 Sep 2025 17:03:21 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/56] cryptsetup: upgrade 2.8.0 -> 2.8.1
Date: Wed,  3 Sep 2025 17:02:23 +0800
Message-ID: <20250903090317.2002-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119199

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cryptsetup/{cryptsetup_2.8.0.bb => cryptsetup_2.8.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.0.bb => cryptsetup_2.8.1.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.0.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.0.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
index d69a9e0377..b5be30cbb2 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.0.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "cc9e2d37c25a871cea37520b28d532207b0c1670fb10fc54d68071f63f5243a2"
+SRC_URI[sha256sum] = "2c3379eb76597dcab50911449b013e2697c4bffcc716dbbf0d9b0e8fbbb46fb4"
 
 inherit autotools gettext pkgconfig
 
-- 
2.43.0


