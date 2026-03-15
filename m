Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8C9D58B35
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:02 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28712.1773581757723641044
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Zo7TIX6z;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1085; q=dns/txt;
  s=iport01; t=1773581758; x=1774791358;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Y0u2TOhhDpnISvIZ4MmJItVOw+FZusHZEkWtCcXMPcs=;
  b=Zo7TIX6znP7GjJGjxXUSgmz9FeU2vmwSefICRbzJR2ZKItJLVlpwL6Pv
   NRQQDkzUOa3/InnBIF8wNd4/hMUo5UMAobhKbIPOEbfDTPtALUUWC7qoa
   /XSKxOG63YuS9g/glZKzGqlusKM9krY/SpgJVF4Z8C+TYcFNbzm1FZI0j
   kPKYj8QsKpXyAcrjwCYNNMZ4avoN8UH1x3DZb3e01BHZ1c27cffdPQwol
   ALqYnmMI+WKJIDZYT1LXtPMFTzjOZmZ5iFL0uRipAOhr+dH7auF/Lt4sA
   oN/Z2LKV9ROwtNAVKzxjZK6B8ltv8x7RPy1EN8l1Vqtl+kFTXUWgB/sG2
   A==;
X-CSE-ConnectionGUID: qZzxrA+fRCeYU9fgWx8xLQ==
X-CSE-MsgGUID: uX2rqyLJQxq3JSLlA88JvA==
X-IPAS-Result: =?us-ascii?q?A0DbBQCjtLZp/5P/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ89FAQBAYUHAo0iAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAmCysrGYMCAYJzAgERsWuCLIEBgygB3?=
 =?us-ascii?q?HkBCxQBgTiFPIgZdIR6JxsbgXKEB3aFEIV3BIIigQ6Bf5EtSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB416PYIzAT1RgQJFaAGmHKEOCiiDdIwelToaM6prg1eHPo1xpFmEaIFoP?=
 =?us-ascii?q?IFZcBWDIglJGQ+OX8x9IzUCOwEBBwIHDQMLgWiRfQEB?=
IronPort-Data: A9a23://W/AaMNzsOM5MrvrR31lsFynXyQoLVcMsEvi/4bfWQNrUp03zYDn
 GcYC2GBaarfY2PwLdB3b9iz8U4Ou8fSzN5rSXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+xcHlEsFM4WwM16MFwf+
 /MnOGAdSinW0opawJrjIgVtrt4oIM+uOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzM3wsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQvgea0b4SMKoTiqcN9g3bCv
 HvX20bAEghBFue7zRPVolCyr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul7fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:fAZi2arnNmqDWbJA1RbiNZQaV5oqeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT0C7Y+eAa2STSq3BkW6FL+o=
X-Talos-CUID: 9a23:tXmylmDeC5odEhL6EzBV5l4OM4MrSFbQ/UqBLUCHGTZ5bITAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AKy34LQ4eScEMIgYJCHShMrrHxox10/60EVEps6w?=
 =?us-ascii?q?WopKmDgh0EmfNriqeF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="696176180"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 45DFA1800089E
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 768B9CC8D71; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 24/24] python3-websocket-client: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:41 -0700
Message-Id: <20260315133441.3034831-25-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125236

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-websocket-client to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../recipes-devtools/python/python3-websocket-client_1.7.0.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
index fc73f1b0a5..fc01eb5a11 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
@@ -15,3 +15,4 @@ RDEPENDS:${PN} = "\
     python3-six \
     python3-logging \
 "
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


