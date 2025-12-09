Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F046D3B7F8
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4129.1765274196656747784
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EgKe8HGt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274197; x=1796810197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XZoadAtGBaNSN4leTIXj+0snvGQxEAZvxV0/ZptBFhg=;
  b=EgKe8HGtG3wnVtaWnWd8FQGhuGrsGH0PNRZIfy0DfnzHOFKnDFSipokg
   1qcGwoQA7wXHDuLtflay3F/i+iy5GIOMIoL9KCYhwD+am5Ivu5QUqvxRF
   i9LWqC5ZYiKQ6CHyyefpWJNRRch03AqEd3qTlKmtW2T1EtKD/6bSBrRoh
   kIT0QCquu8OHBQNdpw/CtJvmTkyfWG8B01TF8KrXCQCPnncO4RmNPiqgi
   drp15Epihd64a0n10xEbXub5amxVPes+dhCYJknsDYy84wH0mUUzTmg2K
   SWehJbOqyMF+mRhEHgvmyVVp3hjxDjH4KttjIcscXokc6ggqIefIskTVM
   Q==;
X-CSE-ConnectionGUID: v9gcQyLyTLab6as/L59+rg==
X-CSE-MsgGUID: FZKixssJR7mk+0YftHph4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209421525"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209421525"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:35 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2377E1C0018D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:35 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BCDE91C002AC
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 6253920002BB;
	Tue,  9 Dec 2025 09:56:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/38] nss: upgrade 3.118.1 -> 3.119
Date: Tue,  9 Dec 2025 17:55:28 +0800
Message-ID: <20251209095552.690-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122418

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.118.1.bb => nss_3.119.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.118.1.bb => nss_3.119.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.118.1.bb b/meta-oe/recipes-support/nss/nss_3.119.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.118.1.bb
rename to meta-oe/recipes-support/nss/nss_3.119.bb
index dad242df2f..a0345eb8aa 100644
--- a/meta-oe/recipes-support/nss/nss_3.118.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.119.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "8c390a676ea37266fcd3d0cd2fb070e2f69f4d78fa4ed88e07ac0c9eb5aab8d3"
+SRC_URI[sha256sum] = "e8412db6c9d6f531e8adfe8a122ec33a8fae920681ff47231a1349bdd399f0e9"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


