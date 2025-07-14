Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BCDC83F2D
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 11:27:01 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web10.75971.1752492418323878178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 04:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=WH2Nhkj7;
 spf=pass (domain: bmw.de, ip: 207.54.68.119, mailfrom: prvs=2837bfe52=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752492418; x=1784028418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3JwAUMK0rvZxDK5Y7ivJb2HL9OCzEE9CYBltlNMx1VU=;
  b=WH2Nhkj7PXMBIC3NekonbCwmdz7Ma6woNwRj38jG38fWGi7BUOor6fq/
   WqlA5dW/XMnnvafKewVx121a3g81VsYVD7xiqX6cpwtW/9UfVtDKYlmyP
   U6VVic87ILOM+WXykBl1RXkfZyqXfg7qtqTf3l+PyQcwwlOOW3k1Gv6ms
   c=;
X-CSE-ConnectionGUID: J0Z0YQz4ROq2kCaKliaI/g==
X-CSE-MsgGUID: lD9HFbEqSYa2OEtiE+zeFg==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw6.muc with
 ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 14 Jul 2025 13:26:56 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.204) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 14 Jul 2025 13:26:56 +0200
X-CSE-ConnectionGUID: GDCjPQfbRGOW1LVbNFZejA==
X-CSE-MsgGUID: q0F6dRaZRHOVN0Y2aE4X6Q==
X-CSE-ConnectionGUID: DP2Z7u+SS6WdPWuACbkXJw==
X-CSE-MsgGUID: 4aR3CyjCSiips+JOi3Ssdg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 06/10] freerdp: Allow to build with CMake 4+
Date: Mon, 14 Jul 2025 13:26:31 +0200
Message-ID: <20250714112642.121146-6-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714112642.121146-1-Moritz.Haase@bmw.de>
References: <20250714112642.121146-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15a.europe.bmw.corp (2a03:1e80:a15:58f::1:68) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 11:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118520

The 2.x branch of freerdp is in maintenance mode and upstream has ruled out
changes to officially support builds with CMake 4+ (see [0]). Thus, apply the
'minimum policy version' override.

[0]: https://github.com/FreeRDP/FreeRDP/issues/11707

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 18af3229d7..a78724b925 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
 
 
 EXTRA_OECMAKE += " \
+    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
     -DWITH_FFMPEG=OFF \
     -DWITH_CUNIT=OFF \
     -DWITH_NEON=OFF \

