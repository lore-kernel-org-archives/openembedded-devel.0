Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBDDEFCBB1
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:04 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28710.1773581757445980601
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Tofh3RKc;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1053; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PJdapcYSkFqCUGkVJZJIZq7Dqx10bE7rU0cT6Gc6rK4=;
  b=Tofh3RKcqBu3+ZzNbbnJk/hUztTqKgVSJSdFnLWTTYLCBnvAkum0Kuge
   QLP89plwzYRNYpKUm9SaUfK8jY2mIkH4Hrv2zZI6jbt/Drzek7ejf6yyt
   OpN8pm0QDOlgyJuGo7FBYIyrgnKd/JKLO1Xs+f4iqxKymcCTnkUxv3arR
   w3lQ0QS0E9m6r/+KWZ4aqujlA6aysEpThUc3FKr6oqEcpjectjwcqGT2b
   E59nbfvC2qsZW1sY/KoCFhG0eYwLkpK2E8L8TfAw84Ux/UPCugDqqngBa
   qSSCV4xPRYXsWkGaqkFOHQ3qwQFBULF2ZaNLLmCwIZ3JEq3iSzb72oS7W
   A==;
X-CSE-ConnectionGUID: UeiQniJPRVOGoc9m+XcGsA==
X-CSE-MsgGUID: X5K/wuI4Q/aVznW6M2YuyQ==
X-IPAS-Result: =?us-ascii?q?A0AgBwAatbZp/4//Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyAVYgMSsrGYMCAYJzAgGxfYIsgQGEfNsmAQsUA?=
 =?us-ascii?q?YE4hTyIGXSEeicbG4FyhAd2hRCFdwSCIoEOgX+FPAaLa0iBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWYDNRIqFW4yHYEjPheBCxsHBYUaD4hydG2BE4MtAwsYDUgRLDcUGwQ+b?=
 =?us-ascii?q?geNej2CMwE9UQGBPApoATmlY6EOCiiDdIwelToaM6prmQakWYRogWkBOoFZc?=
 =?us-ascii?q?BWDIglJGQ+OX8x9IzU9AQEHAgcNAwuBaJF9AQE?=
IronPort-Data: A9a23:yyChsqzSfD13Z7Pw3xJ6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUOz
 GtOCjiCbPmOYmP9etAiPI/kpEMHusPXztNlHVM6+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHw7PLQe+8RPO19p2
 vsTeTVOXhusnMvjldpXSsE07igiBNPgMIVavjRryivUSK54B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOHWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCzYYKPJoHbH5k9ckCwl
 j/luHvkI00jc9Wh2zy6rFf2t/LepHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjZCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:dBrjWaOxxD+xL8BcTsCjsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3DHio379
 YHT0C4Y+eAamRHsQ==
X-Talos-CUID: 9a23:Yn0rlW517i+4R6Q0W9ssyUMVI8YkUEXn8lD/JETpDCVZQ5KOYArF
X-Talos-MUID: 9a23:DVQyWwSXMyjVG18BRXTc2RIlK9pJv53pAX4fl6pYnpO1KD1JbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690245924"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:56 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 7F0C618000267
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 28763CC4D0D; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 05/24] open-isns: extend recipe for native builds
Date: Sun, 15 Mar 2026 06:34:22 -0700
Message-Id: <20260315133441.3034831-6-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125222

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require open-isns to be available
as host artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-networking/recipes-support/open-isns/open-isns_0.102.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
index 5c38f6b5dc..33847a32a9 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.102.bb
@@ -37,3 +37,4 @@ do_install:append () {
 FILES:${PN} += "${libdir} ${systemd_unitdir}"
 
 INITSCRIPT_NAME = "openisns"
+BBCLASSEXTEND += "native "
-- 
2.35.6


