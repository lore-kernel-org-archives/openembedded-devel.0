Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784DDCCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12602.1762847736651348381
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=a0EOA/L3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847736; x=1794383736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iLO4xfhvPJU61IHpbPFRSJbx8yE9uXrocKMXGE9IdcU=;
  b=a0EOA/L3Og2JKWKYbD7Y545gXCGv93DXtUHG2qTNUUn94nVbQnaoiULK
   Q/D4vYUau3JytJfG1pkSeF/D/svmTAztCBayCa0PumQErlmGO5eQ1Yn+P
   uKcAQO9ssl6Yxm0vZlolJ2boQjNlC6QgNK+C0k1+Lv4AO3Wre90OSJjg1
   HYHA+wFbensJqnCT9U6vOUZEj1sR1yYFsQLrYKVjlj6qr3KJqBvTA6/7I
   zdmlTtoyfyny1h9g6yhxQPjh5YG4Sb8w7vdKCBs03beDFtP29CRYf44nM
   rJOTFjx3O3qSgPWy9aoKYzOmHMuGrxxhLRg+YzsK/mo3wc9Hx9+YK6HtC
   g==;
X-CSE-ConnectionGUID: yEPEMWt8Rniv9+5Trl2LSg==
X-CSE-MsgGUID: WnNiT62oQFi89/dlMDrseA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="206769919"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="206769919"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:35 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 0A9C71C00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:35 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B11ED1C0015D
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5A9191800D78;
	Tue, 11 Nov 2025 07:55:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/23] kernel-hardening-checker: upgrade 0.6.10.2 -> 0.6.17.1
Date: Tue, 11 Nov 2025 15:55:00 +0800
Message-ID: <20251111075517.1650-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121485

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ecker_0.6.10.2.bb => kernel-hardening-checker_0.6.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-security/kernel-hardening-checker/{kernel-hardening-checker_0.6.10.2.bb => kernel-hardening-checker_0.6.17.1.bb} (93%)

diff --git a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.17.1.bb
similarity index 93%
rename from meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb
rename to meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.17.1.bb
index 559a15a009..54dc7d5966 100644
--- a/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.10.2.bb
+++ b/meta-oe/recipes-security/kernel-hardening-checker/kernel-hardening-checker_0.6.17.1.bb
@@ -12,8 +12,8 @@ BUGTRACKER = "https://github.com/a13xp0p0v/kernel-hardening-checker/issues"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "git://github.com/a13xp0p0v/kernel-hardening-checker;protocol=https;branch=master"
-SRCREV = "0ebece346f187e7d3589883cc1d194fcd1c3cda8"
+SRC_URI = "git://github.com/a13xp0p0v/kernel-hardening-checker;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "afc376f2a935994793343cfeb05953583cc30191"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.43.0


