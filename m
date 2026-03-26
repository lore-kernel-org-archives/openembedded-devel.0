Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F59710A1E8C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46401.1774526208188616669
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gnFMyC3h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526208; x=1806062208;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aNJjEOBLaL736f1Y6EW+3TbNAETtsrOJz8T8tlswPq0=;
  b=gnFMyC3hJu9/hkwTQa76eK6hO3VJYYWlvL054lBH+e4K9zccgRZLLA2m
   FnC060xCxdLWnowurpK7Fskj6OxxxTpvWovF7TW66EaiccNm7JBiO4rZr
   IXRYr4z06sdvcRjpf3J6b8vrIpMi0swEuvObpL46/Id7+MzSwyn/kICeX
   ZROJsOQ1Go2ng7U6vJg9k+wayL+9wosN1seWtAJ3//goCxxBni7nEe/7w
   orb0ueyOiAZ/ZaIlI4gYC43IXFHEaPgd5yTdU04YEY0sFbeDpUTKQ+TjW
   uPKsvmbM/fke9zfdLMBG10scG0YI5vwhnmMA5bNjfN7pza3LfbcH8ZlXu
   g==;
X-CSE-ConnectionGUID: jMdp4iFtTIqleRMO7zqHzw==
X-CSE-MsgGUID: K1nZzvJtSAapX38iiB2yLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718814"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718814"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:47 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 874B11C001BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:46 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3685A1C28511
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id B8339180714B;
	Thu, 26 Mar 2026 11:56:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/63] botan: upgrade 3.10.0 -> 3.11.0
Date: Thu, 26 Mar 2026 19:55:34 +0800
Message-ID: <20260326115634.1199-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125659

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_3.10.0.bb => botan_3.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.10.0.bb => botan_3.11.0.bb} (91%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb b/meta-oe/recipes-crypto/botan/botan_3.11.0.bb
similarity index 91%
rename from meta-oe/recipes-crypto/botan/botan_3.10.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.11.0.bb
index dcc0e6aa77..e60d826459 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.11.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "Crypto and TLS for C++11"
 HOMEPAGE = "https://botan.randombit.net"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=3f911cecfc74a2d9f1ead9a07bd92a6e"
+LIC_FILES_CHKSUM = "file://license.txt;md5=ed13158b71912fb101b89310b23b921f"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "fde194236f6d5434f136ea0a0627f6cc9d26af8b96e9f1e1c7d8c82cd90f4f24"
+SRC_URI[sha256sum] = "e8dd48556818da2c03a9a30932ad05db9e50b12fec90809301ecc64ea51bd11e"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 
-- 
2.43.0


