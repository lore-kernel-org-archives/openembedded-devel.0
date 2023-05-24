Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A536C77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 06:55:43 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.3012.1684911340523143263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 23:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1 header.b=gIQKJHO9;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684911340; x=1716447340;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MYfqZxxIbINITRoG40S3ROIYA2pcHaBsx0Lg5M+RtTA=;
  b=gIQKJHO9KPZYKlWY/rBEbCC/+/WI6nDmioODiG6oA7yUd9vbwVqzeaeg
   KcZ01ju9pTVx/jUUcNXfjTNZwbptkBpEdFc4Rn5ZFDPWdC6cijAUONkvv
   BwwMpT2LUyeJ9gFFD+RUb0XCPZCEHgq1jtWiGgYhTaAbdF95usKOwewS/
   HqR+P2D7jjZUP0rEMUlADLitkcI13WYdHTecxmL1Rx3gnqJK+UezKqUys
   O2fv0vFDVQDxpLOv70ouNqOz6/LaLS8y4b5dI0KBW8XA+K5G2VakO6Qj1
   vfYd274I9AXb3FaCXfVUES5rE147Qe6gE84VOXLVM1J4C9kli9ZBNpt5m
   g==;
X-IronPort-AV: E=Sophos;i="6.00,188,1681164000"; 
   d="scan'208";a="31061892"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 24 May 2023 08:55:38 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 24 May 2023 08:55:38 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 24 May 2023 08:55:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1684911338; x=1716447338;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MYfqZxxIbINITRoG40S3ROIYA2pcHaBsx0Lg5M+RtTA=;
  b=Hd6hx/IDrYaW5WGYXfvwtOMsdLXfNYyfKw8y4Y90bPCnLAAENRVYJoMd
   RJ0vsLZj3dVHA9QtdU0d4czHIQaN9kIGiszfbCoYP/vKo209+XiGOn4RQ
   a1rhj3uDVmhdySrCRfSwPsfZbv+zzAm1Jd89ylBYv2f/wCZ5OU0Yz0YA1
   UlxNME2syKOtdDjux/oUpDNkXVRCetNJibpjLzgLXfIannU9gbGKFGeL+
   iEj6ZIOXwISuciroT/6Af0IYL2QNpTIRBSIIhQkzIlwKhGF/uz4VJkCQv
   WcqRfxUhR0LAlWQrGnD75QPUmIpet0pJzbo13Y8fpotW91cQr7YhXrLa+
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,188,1681164000"; 
   d="scan'208";a="31061891"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 May 2023 08:55:38 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7FFFC280082;
	Wed, 24 May 2023 08:55:38 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [oe] [meta-oe][PATCH 1/1] libcamera: Simplify pipeline configuration
Date: Wed, 24 May 2023 08:55:34 +0200
Message-Id: <20230524065534.2977672-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 06:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102754

Default to 'auto' which enables all target architecture pipelines (+UVC).
IPAs are also automatically enabled if the corresponding required pipeline
is enabled as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../recipes-multimedia/libcamera/libcamera_0.0.5.bb           | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
index 47da0ec61..6ad376f29 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.5.bb
@@ -26,12 +26,10 @@ PACKAGES =+ "${PN}-gst"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
 
-LIBCAMERA_PIPELINES ??= "uvcvideo,simple,vimc"
-LIBCAMERA_IPAS ??= "vimc"
+LIBCAMERA_PIPELINES ??= "auto"
 
 EXTRA_OEMESON = " \
     -Dpipelines=${LIBCAMERA_PIPELINES} \
-    -Dipas=${LIBCAMERA_IPAS} \
     -Dv4l2=true \
     -Dcam=enabled \
     -Dlc-compliance=disabled \
-- 
2.34.1


