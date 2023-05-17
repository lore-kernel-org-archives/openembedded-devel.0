Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1392C77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:28:08 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.44596.1684312085692084781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 01:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1 header.b=Chla9Gjy;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684312085; x=1715848085;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Tu85qesp2gqmT/P5uNq5+qORXzXHnYnIS3wblRnywRk=;
  b=Chla9GjyLf0gGoPekZRNqTd+UKpHnpToseJ1tEuEHm43rGEDdcnBL1ES
   qzGkgW7Eo1W7pTxwgg5RMk9AdCR9omeRRtll1SpBuTPB/XCDrViTsQIRM
   eQ8YMIPyHl0gCpnpGX/5JePwIUZ//mrlWsm1IYh4o152A/VuQ2M8p1VT5
   R8Sj65ZMvAoMLd1zKtwGado3jyZfZ1usFG7rgFlpqoVHJtTufWbaJLsiL
   6acVyoSb59GNzfhko8kvY+hjAihgkgfGZ3kVMY6mX8Ee3X5lfOho7pur+
   p5oSG7OkgKdeLmWjT9o2YOdjEj5nhSeps7Ort78X37JcpM/SbNgvFRkwN
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677538800"; 
   d="scan'208";a="30953921"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 17 May 2023 10:28:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 17 May 2023 10:28:03 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 17 May 2023 10:28:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684312083; x=1715848083;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Tu85qesp2gqmT/P5uNq5+qORXzXHnYnIS3wblRnywRk=;
  b=Nud5FhOM6GaSc4uBapYehtDJ5m2ELQijiXIQcvHzkLfEhFSaNIG0oV3f
   23+oJ/u7P9DObt7x/I52/An2P/MP+zF44Dt00GyeiyRGGDa+OGEr7NRDH
   aoiO+YkMPqwv39M1zDzOQ0Ws/PbKCr9wkFQyEqJQC1JT8mi3aZx1ePfMu
   tnb1UHdQms/ihlMVfCVnpgexNW1PHjEdaoZPz6tKEu8ah1be3tbalyQkB
   6pwXyLL2W+xmj8UAjTnRemNqaGirKQR3ars3uYl+AuhTnwiQJ0E+oBT7u
   xJ14XwyXw4Y3OiA2nMjAQVQH7vSV5+P9kvoYaOnvSs0OmFPXdu1QjbxZZ
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677538800"; 
   d="scan'208";a="30953920"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 May 2023 10:28:03 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7245E280087;
	Wed, 17 May 2023 10:28:03 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [[oe] [meta-oe] 1/1] libcamera: Allow overwriting default pipelines and IPA
Date: Wed, 17 May 2023 10:27:59 +0200
Message-Id: <20230517082759.1289294-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 08:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102642

By default only uvcvideo, simple and vimc pipelines as well as vimc IPA
are built. Add new variables for enabling a custom set of enabled
pipelines and IPAs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
An example is the 'rkips1' pipeline and IPA.

 .../recipes-multimedia/libcamera/libcamera_0.0.5.bb        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
index 14a20b431..47da0ec61 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
@@ -26,9 +26,12 @@ PACKAGES =+ "${PN}-gst"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
 
+LIBCAMERA_PIPELINES ??= "uvcvideo,simple,vimc"
+LIBCAMERA_IPAS ??= "vimc"
+
 EXTRA_OEMESON = " \
-    -Dpipelines=uvcvideo,simple,vimc \
-    -Dipas=vimc \
+    -Dpipelines=${LIBCAMERA_PIPELINES} \
+    -Dipas=${LIBCAMERA_IPAS} \
     -Dv4l2=true \
     -Dcam=enabled \
     -Dlc-compliance=disabled \
-- 
2.34.1


