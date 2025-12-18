Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53A7D68BFB
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37572.1766048641326001787
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fWoXJBBw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048641; x=1797584641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qRsXLnRh/MEKVeM6lIvBmYMrTpWppuYNRiOTVjlOlfw=;
  b=fWoXJBBwfmtF9pv7iGrhfLJ33h79lnJ4DDvr3B9454AMRqOZeGqqPksd
   M/W+UKT70+e5S/vhC92y2dcCxDrai223m82yzaj16X+TUISs2n4+CtQfC
   Er0fGf3mE/qlxfTS0qlYEpnUNEMKgI0TTwqKrJrOBh9uegQ72wGMlDqx2
   d3x4nGneKmMtqtqMTAzEuuXDzYl1THSwP4d7dY93rwBMgTrmCWQns5VJf
   JsPUj48JtzVCual5EyaLH8FzH1eo2pVj0t2PNEOf2BNd6/IzV0+xjMI0F
   KIp3MoHtPSbpa3hH8AXBq6za3i00TLn+80hc4HJTzBO+RgAyg+5AvTT/Y
   A==;
X-CSE-ConnectionGUID: 9hEDizl7QGuODroHXWzEcQ==
X-CSE-MsgGUID: ey16kfQiTfmRHD0OvRkvDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="202052068"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="202052068"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:03:59 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 78BCD10029A3
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:03:59 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 2A1658D9FCA
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:03:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id A26AF101E516;
	Thu, 18 Dec 2025 09:03:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/20] freerdp3: upgrade 3.19.0 -> 3.19.1
Date: Thu, 18 Dec 2025 17:03:29 +0800
Message-ID: <20251218090346.735-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122737

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- [core,transport] improve SSL error logging
- [utils,helpers] fix freerdp_settings_get_legacy_config_path
- From stdin and sdl-creds improve
- [crypto,certificate] sanitize hostnames
- [channels,drdynvc] propagate error in dynamic channel
- [CMake] make Mbed-TLS and LibreSSL experimental
- Json fix
- rdpecam: send sample only if it's available
- [channels,rdpecam] allow MJPEG frame skip and direct passthrough
- [winpr,utils] explicit NULL checks in jansson WINPR_JSON_ParseWithLength
- [packaging,flatpak] remove xprop

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp3_3.19.0.bb => freerdp3_3.19.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.19.0.bb => freerdp3_3.19.1.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.19.1.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.19.1.bb
index 9b6df4e0cb..055e757907 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.19.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.19.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
 
 inherit pkgconfig cmake
 
-SRCREV = "300a4e6d60aa072cb7201b6d32c0dc925092fb9a"
+SRCREV = "f848367ffa82b43c52705b637cfc9cdfd594f7c5"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
 
 
-- 
2.43.0


