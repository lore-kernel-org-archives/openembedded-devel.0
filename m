Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6390DCCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:36 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12747.1762847728533028339
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TENz1ZGk;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847728; x=1794383728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lnE9MiSCtHcX+RI4Dr/SWIYyIsTXTqT4gWWqYhyTzzM=;
  b=TENz1ZGkC6TKcvvedtykrgbwGDID7wD6p8pGXha8aaqsFI3p12zdTeVE
   G3w5nipdiL6XtqNtDyYAltKG833g2v8taefNCGc2ubyy4S55QRsju0dKt
   1u6qtPZ2ddFoXBk8pS1yXgIINCdobFyL2t/o0tvgXZeoYddieR8qlZf+B
   2zjqsxEUiCC05SngIF4K0x4k7n3vMJoxPtJsZ0L1m/0mopJfIxJ7eGHM2
   XjsvBp3Wr79LtxvpX2+m/rTMdBd88cA61xzAL1+WPtVAeJPQq6shHWphe
   t7LnkRkOtrG4PTvPPv/GGJWlIcPWXYiqggJPolSBxOVmdVjVswvmtetKH
   w==;
X-CSE-ConnectionGUID: K93s4MkvRUWjWUTTzv362Q==
X-CSE-MsgGUID: lvH9WPWGQgqEAR87P/nyTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="207370125"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="207370125"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9717F1C00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:26 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 501BBC006C9
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id CEA0E1800D76;
	Tue, 11 Nov 2025 07:55:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/23] botan: upgrade 3.9.0 -> 3.10.0
Date: Tue, 11 Nov 2025 15:54:56 +0800
Message-ID: <20251111075517.1650-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121481

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-crypto/botan/{botan_3.9.0.bb => botan_3.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/botan/{botan_3.9.0.bb => botan_3.10.0.bb} (95%)

diff --git a/meta-oe/recipes-crypto/botan/botan_3.9.0.bb b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
similarity index 95%
rename from meta-oe/recipes-crypto/botan/botan_3.9.0.bb
rename to meta-oe/recipes-crypto/botan/botan_3.10.0.bb
index 77bd0d007f..e079dd73de 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.9.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.10.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=3f911cecfc74a2d9f1ead9a07bd92a6e"
 SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
-SRC_URI[sha256sum] = "8c3f284b58ddd42e8e43e9fa86a7129d87ea7c3f776a80d3da63ec20722b0883"
+SRC_URI[sha256sum] = "fde194236f6d5434f136ea0a0627f6cc9d26af8b96e9f1e1c7d8c82cd90f4f24"
 
 S = "${UNPACKDIR}/Botan-${PV}"
 
-- 
2.43.0


