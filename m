Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA8EE75432
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:13:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117292.1766567611269813911
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cTicGDSg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567613; x=1798103613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BWNL8oceb82HLDNXshsIg7wdvkm4wZrrYNQ1r2KNdrk=;
  b=cTicGDSgrVYKwARmA/vWEmwYVXPhSNr6gQsiLrlxotZTDlxHXVAh32SP
   7GirZS3V9oxzbm5qMTH2wCoO0O57sFPcCJo2icfeiT6cTJzLSj5/hKcna
   9f9Kx2z6x9Gq2ea4CINuoJqvGgVuvAz3vASqiwEwUzW36GqKq4zoepAK1
   KZHJZA4l2yyg4qd+AERFd7OesV1KzpnN/Puq7ZmKf4rMrOfaxYHkuqxxU
   ZsoFtCMa4NhQNnGxBUiNimbcMKktgWCitYuebjlRsIiw6ZjeaDTI2y6y3
   Oy9ky4D8xCn+MNyDN+/pver8N+HBFPe1fVayEkjsdIoeMSrZpS3kkdMcw
   w==;
X-CSE-ConnectionGUID: FvNlsXffRDaSntYn69xyVw==
X-CSE-MsgGUID: APevL1IGQJa+GkmZCvHR8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223750056"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223750056"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:13:32 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id AAB83C000A1
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:31 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6288714003D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 98AA9200076B;
	Wed, 24 Dec 2025 09:13:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/28] gpsd: upgrade 3.27 -> 3.27.1
Date: Wed, 24 Dec 2025 17:12:40 +0800
Message-ID: <20251224091304.974-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122854

From: Wang Mingyu <wangmy@fujitsu.com>

Fixes for two CVE.  Parsing failures on malicious packets.
    CVE-2025-67268 - Heap-based Out-of-bounds Write, NMEA2000
    CVE-2025-67269 - Integer Underflow, NovAtel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-navigation/gpsd/{gpsd_3.27.bb => gpsd_3.27.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.27.bb => gpsd_3.27.1.bb} (98%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.1.bb
similarity index 98%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.27.1.bb
index 41a3231069..22e4d2f0ea 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.1.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://gpsd.io/"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "6195292dd7910be68cb7018d45166283eaefd3f9db9773fcd6e9a78d49eac999"
+SRC_URI[sha256sum] = "3baa03b8fd922982950593665fa4d86fe9ecde8b3d2ed5c2d0320c7dcecc2937"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.43.0


