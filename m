Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84241EFCBA3
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28884.1773581757481437802
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cJIlUD+Y;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1022; q=dns/txt;
  s=iport01; t=1773581757; x=1774791357;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lp/hBy/yAu/+MuNUQyRW1M1tBFM3joBRlJpPqVYmuFM=;
  b=cJIlUD+Y4j2x7Ovg8o9uv+R8XAlzQeucXrQiPJ7FhmXpivQpHH9ukbkh
   eBYfH/zfg8LKfkJQy3k+e8OBlfjd7ux+qrC6/th9Qne+xRWtaT6T9Df1z
   LOxRnUpwySG1z+MWQKL+SCk/kMlbdB3PvnOlxXUZB6F6ZT72Nu2Q6MbCp
   ziN52R+8JpLdXqxDcd/de3m1qKvUTFauGGiwLKSVsPs39wGUYEZd7uOIz
   L3mmd2KqQ+5yIt6RjKZf5VEREALw2W0slsFdL7TsEwK+5DKE74kFu86XX
   IkrhsC29RW0dG/feaeP/aKMjJyEUjJbqaY5lYClSlMNnC1GUVASw1xY6H
   Q==;
X-CSE-ConnectionGUID: /5aVE4hPSkyagoaF62NhdA==
X-CSE-MsgGUID: 9AaleJJ/TAmwGVXe/UH14g==
X-IPAS-Result: =?us-ascii?q?A0AjBwAatbZp/47/Ja1aglmCSA9xX0JJlCqCIQOeGoF/D?=
 =?us-ascii?q?wEBAQ83GgQBAYUHAo0iAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZchlsCAQMyARgBPSAxKysZgwIBgnMCAbF9giyBAYMoAYFT2?=
 =?us-ascii?q?yYBCxQBgTiFPIgZdIR6JxsbgXKEB3aECoEGhXcEgiKBDpMsSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ELGwcFhRoPiHJ0bYETgy0DCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB416PYIzAT1RgUdoAaYcoQ4KKIN0jB6VOhozqmuZBqRZhGiBaQE6gVlwF?=
 =?us-ascii?q?YMiCUkZD45fzH0jNQI7AQEHAgcNAwuBaJAAgX0BAQ?=
IronPort-Data: A9a23:5LEPr61uQWzgQw2UuvbD5YNwkn2cJEfYwER7XKvMYLTBsI5bp2EOz
 mBND2HTOP+IZmTwf95ybY/jp00OsMLSytJnTAU93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 rsen+WFYAX7g2UtbzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGSxw/A6BE+t5MAnBH+
 vsRBm5XSBCPrrfjqF67YrEEasULNsLnOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiaC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+Oa8aYWNK4LSHK25mG7Jj
 2vC8kbbRS0zMcOw9wqItU+M37PAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:5dpMq6o3/n49T9F/GPV+iMgaV5oqeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT0C7Y+eAa2STSq3BkW6FL+o=
X-Talos-CUID: 9a23:HNdVtWxooQ0tbvNf2EFlBgVTR8kbXyHd9EzTMka3Dm9HFuezSVO5rfY=
X-Talos-MUID: 9a23:MWmcXAs2Z+wpzhoQqc2n1RhrMMpKweOSIUUSvqs2to65FXUsNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="691709601"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id CCCB618000360
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:56 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 306D4CC8C9E; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 07/24] nodejs: extend recipe for nativesdk builds
Date: Sun, 15 Mar 2026 06:34:24 -0700
Message-Id: <20260315133441.3034831-8-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125225

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require nodejs to be available
as SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
nativesdk variant for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
index d08c5d8318..3163ad04fc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
@@ -213,4 +213,4 @@ python __anonymous () {
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


