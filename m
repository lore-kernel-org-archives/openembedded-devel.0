Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31FDAC71143
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78431.1749526425058059186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kTueX9R8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526425; x=1781062425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r3x9pWQCOJp+9eVGa21FNde2eyxcdB6Fc5+C8R3NpA4=;
  b=kTueX9R8p11PvrJRPNO2QEi+CPpy2PsxWw9Zi72FF2OmeUP58Phktt7u
   cISq6QSmuKkRycFC0lKfurBWtwPcENahBWiApm5kc1Ju+tI5SUvs2GhKP
   7hdw/gJRz/8y0Q8oJ3KMb92ukjrAIXeZkm5YNmWgwN2gtLkBAupXD8Qiw
   OEegFwOU2u1lkoNyD2ArxLLTVDqaQl1CFzFqP7qihPSPX99D93rtmwuGx
   ONZ0r9jX8/0V1Ofmod8OLqrnIUCwYeSyjQFy4Za3+W6HzO39xG/CJV/Bo
   yxFQCdOi7Em0mk0uNumTvuO28qCwgvs+8d0mzuuz0va8TfyPm/rc4ANMW
   A==;
X-CSE-ConnectionGUID: xHR4I8eyR6ynG+jpjZiPOg==
X-CSE-MsgGUID: rx9+2G3sRVytDe3qTypfxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189594993"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189594993"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:43 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA98CE0ABD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 82AB5BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:40 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 105CC1A0071;
	Tue, 10 Jun 2025 11:33:40 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 17/64] libmozilla-ca-perl: upgrade 20250202 -> 20250602
Date: Tue, 10 Jun 2025 11:32:43 +0800
Message-ID: <20250610033330.924-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117807

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Update from Mozilla repository to 2025-06-02
- Added certificates:
  - D-TRUST BR Root CA 2 2023
  - D-TRUST EV Root CA 2 2023
- Removed certificates:
  - Baltimore CyberTrust Root
  - Comodo AAA Services root
  - Entrust.net Premium 2048 Secure Server CA
  - GlobalSign Root CA
  - Go Daddy Class 2 CA
  - Starfield Class 2 CA
  - SwissSign Silver CA - G2
  - XRamp Global CA Root

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...zilla-ca-perl_20250202.bb => libmozilla-ca-perl_20250602.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20250202.bb => libmozilla-ca-perl_20250602.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250202.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250202.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
index 0c12b46519..b5f980e646 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250202.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20250602.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "32d43ce8cb3b201813898f0c4c593a08df350c1e47484e043fc8adebbda60dbf"
+SRC_URI[sha256sum] = "adeac0752440b2da094e8036bab6c857e22172457658868f5ac364f0c7b35481"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


