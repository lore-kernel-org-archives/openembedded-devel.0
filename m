Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33449D6ACC9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:33 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37583.1766048662544602151
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hn3G7hAf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048664; x=1797584664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tb0wdZs4ykB6xYw6cS6pdcDpwGoChYT1UFuttxgOjyE=;
  b=Hn3G7hAfYp3NE0nlxOK85MiqzL5HHf4WmzuD3uLmlNyTImrrTMPwiBsd
   WNyNs+pKvDCqZn/oh1uVGCzw91tRpQDbNTY7bufoSSMXP08FVbCpcG6xw
   T9vbUqh8Po31neI2IpvoFIDbLKWTN6Z+JLrYb7PQiFWxnwMsZ3UEtjX1J
   YcwuWm9xSb6nONNErrSfv51BodueNf/I8WL/hRCrw/Y3+oo8fuc7/AK8e
   ZKVSM3btRCPvfxyCron9OiAUSf1C44qw5LrFuBcAyTKPqEUhCUbcZGv3Z
   FxrWzq1Ivy6SUuLgALOo3Tus1MV71nTvo4MXWu6EFfJfOD8oi9CI88JDa
   A==;
X-CSE-ConnectionGUID: 530+dHx1QhugLbd25P3XRA==
X-CSE-MsgGUID: xmO52Oi1TZKVX0/0cK0XBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223120223"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223120223"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:24 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A0DB83D5
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5AA5CC00D7A
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id EFE65101A427;
	Thu, 18 Dec 2025 09:04:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 18/20] strongswan: upgrade 6.0.3 -> 6.0.4
Date: Thu, 18 Dec 2025 17:03:44 +0800
Message-ID: <20251218090346.735-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122752

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed a vulnerability in the NetworkManager plugin charon-nm that potentially
  allows using credentials of other local users.
- Concurrent requests to fetch the same CRL URI by multiple threads are now
  combined.
- Increased the max. supported length for section names in swanctl.conf to 256.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../strongswan/{strongswan_6.0.3.bb => strongswan_6.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.3.bb => strongswan_6.0.4.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb
index 438b5d5331..2587722b6d 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb
@@ -10,7 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "288f2111f5c9f6ec85fc08fa835bf39232f5c4044969bb4de7b4335163b1efa9"
+SRC_URI[sha256sum] = "79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0


