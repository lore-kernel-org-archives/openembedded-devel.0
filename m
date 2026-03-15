Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CDEEFCBA0
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:36:03 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28710.1773581757445980601
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OCCQwQSu;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1138; q=dns/txt;
  s=iport01; t=1773581758; x=1774791358;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=OnDVoAmbKZFu53SwGsUsgcQCdGn3ykWY0m5u6EaeGqg=;
  b=OCCQwQSu3lTSltbLS/jrwtu61b7OSRScg7U2cSKtm798gOXXWXjypaSA
   FgVTEXdc3lCT6qMC3CqIy8RfckR3wDQO8hO6zKgCILh5VtnmQy0SMbe9q
   zzLnV1FGgD9LO2gXUEGpEo8sNUoCAw/jhfl52J2OZekOO/u72wsdQsaD7
   dnvpM2iio1A5R4RUG80sELV0OyLLFEg3g3yQ4RRif2oLilx8oWutP6hy8
   rVZipMpmdHJ0oLieGhNWiXIHAiwO7VUKQNlEYsrRe9d1F2hIDdrjGV7Cr
   tP01WEnadnxOu70iEo9sA7ZFAMftgd14trY9Y02oexaqeK5FHYrV42K49
   Q==;
X-CSE-ConnectionGUID: idhvAoAvRQuAbdHQ6QG/MQ==
X-CSE-MsgGUID: 1JDqG90MSE+2K5vj+sG1NA==
X-IPAS-Result: =?us-ascii?q?A0DaBQAatbZp/5T/Ja1aHgEBCxIMggULgkgPcV9CSZQqg?=
 =?us-ascii?q?iEDnhqBfw8BAQEPNxoEAQGFBwKNIgImNAkOAQIEAQEBAQMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBCwEBBQEBAQIBBwWBDhOGXIZbAgEDMgEYAT0gJgsrKxmDAgGCcwIBEbFsg?=
 =?us-ascii?q?iyBAYMoAdx5AQsUAYE4hTyIGXSEeicbG4FyhAd2hAqBBoV3BIIigQ6TLEiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBCxsHBYJigjgPh2GBEXRtgRODL?=
 =?us-ascii?q?QMLGA1IESw3FBsEPm4HjXo9gjMBPVGBR2gBphyhDgoog3SMHpU6GjOqa4gwk?=
 =?us-ascii?q?FakWYRogWg8gVlwFYMiCUkZD45fzH0jNQI7AQEHAgcNAwuBaJAAgX0BAQ?=
IronPort-Data: A9a23:tIp7LKmgnzlxBLR7otUBpk3o5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDDrTOvvfYDDwco8lPI7n9h8GuJLUzIVmHQRsriBkRVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+Za31GONgWYubDpPsv/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYwU+vheBkhQz
 8UFAToBTindvs3x5YvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaj/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKLK4TQGZgExBbwS
 mTupkbVGz5LbPmk5Hnf0S+yhKzUsnrdcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:tbK4YKquGbQkhtMbcEVi2VkaV5oqeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT0C7Y+eAa2STSq3BkW6FL+o=
X-Talos-CUID: 9a23:6mfReWOStClvFu5DWSVn6mcTM94fS2D0xnvwGhGBJiFMcejA
X-Talos-MUID: 9a23:eSgqPQYg5KsNHeBT7h3AnR4zbOJTzuf0Kx0Tk9YdlJCiHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="690245928"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:35:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 4102518000269
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:35:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 65774CC8D6D; Sun, 15 Mar 2026 06:35:56 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][master][PATCH 20/24] python3-ordered-set: extend recipe for native/nativesdk builds
Date: Sun, 15 Mar 2026 06:34:37 -0700
Message-Id: <20260315133441.3034831-21-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260315133441.3034831-1-deeratho@cisco.com>
References: <20260315133441.3034831-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125237

From: Deepak Rathore <deeratho@cisco.com>

Some SDK dependency chains require python3-ordered-set to be available
as host/SDK artifacts. The current metadata only partially provides this,
which can lead to dependency resolution failures when this recipe is pulled
into SDK-oriented builds.

This change does not alter target package behavior; it only enables required
native/nativesdk variants for build and SDK integration paths.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../recipes-devtools/python/python3-ordered-set_4.1.0.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
index 1644dc62d5..241c1fbe3f 100644
--- a/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ordered-set_4.1.0.bb
@@ -10,4 +10,4 @@ inherit pypi python_flit_core ptest-python-pytest
 PTEST_PYTEST_DIR = "test"
 
 DEPENDS += "python3-pytest-runner-native"
-
+BBCLASSEXTEND += "native nativesdk"
-- 
2.35.6


