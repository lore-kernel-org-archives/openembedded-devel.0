Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B25CF45DF
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:30 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56068.1768299866802466534
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cg5xVgeq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299865; x=1799835865;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f57djRvuF4GcwV5R4OwW3fCNwWOEvcjENyKmEdloowg=;
  b=cg5xVgeqtzETVHIQR6sHx+9vVQXi0NYVEEkorivVcpUAJ2GfPB6Yh3R4
   tcgYemrshpJDupHRjJ9cNbmjhUjoyqbNb3QvjERiuyrfatnw824mHL89T
   dUJH7d6xFuC0qy/uantLE8YY5msoL4bkHmpzSwnQ6I7FwXMqiGFEpaQwx
   1qH08qVyI5PJuB4g8aAtxnuZjsmuhstKrNU8QR+C7BmmYNMlGxNOMmlHB
   Vqd0MicbvjnPrC1zVFP2jueEgzUdVDrNLjbyX8e3lTZEbkX4JmfXEwRzv
   o0lrDRaKJ0Irgq6BBNdsYgYgBwadX2H2Gx4u4o7zyuWm3UeXgRJBoxAuZ
   A==;
X-CSE-ConnectionGUID: MRgCh+fHR/a4cAEtYZue3Q==
X-CSE-MsgGUID: QuapjTX5TIa5VIUhBclX8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225654361"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225654361"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:24 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2FA861C1C703
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D6DA41800099
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0AC1E1019041;
	Tue, 13 Jan 2026 10:24:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/22] openfortivpn: upgrade 1.24.0 -> 1.24.1
Date: Tue, 13 Jan 2026 18:23:20 +0800
Message-ID: <20260113102334.605-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123414

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fix regression where the 'plugin' was not passed to pppd

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{openfortivpn_1.24.0.bb => openfortivpn_1.24.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.24.0.bb => openfortivpn_1.24.1.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.0.bb b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.1.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.0.bb
rename to meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.1.bb
index eb5599ab07..0ff2a31f1a 100644
--- a/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.0.bb
+++ b/meta-networking/recipes-connectivity/openfortivpn/openfortivpn_1.24.1.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d575262a651a6f1a17210ce41bf907d"
 
 SRC_URI = "git://github.com/adrienverge/openfortivpn.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "9230413f47de40fbf0dc8ba18eff42e943e27ca7"
+SRCREV = "a40a2d588733d48534eb78cd17b90142e5ba039b"
 
 DEPENDS = "openssl"
 
-- 
2.43.0


