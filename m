Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 49CE26D049
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 22:29:53 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so2196112ead.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Xq06emfNGKZadj/nHyJGExhfq5SsIXkoDOOwD3Ey2/g=;
	b=s2k2tIc0mJgZLUVOnWB7JU9UW/XcX2o+HhM5CoxgFy3dmWwK7KyWK095woo//Xb3iv
	ZMAC/WENBTezOjAMcfCU/nrMGhRQZ2RUyoqmLGcu9kR5XFneF5zmD4CM+KlBv5U09Yhj
	6h7mEDuxtkAk+tB34dmbDd8RR2dtbNx7AM3Yc0tN8RquiJk8NwmwaRIhem1No0yVhx4U
	bJq8viVoymmBR2+iuCeKVmPvKOK29e0DJ6DERdyeUuTylZURFObonaS+A10IiegliOFT
	n/Kt+El6NM5jNPi5wmsjaFRSnUXtYy0ucJj9J72VFR7Z1SS8hCKBKz8b4iLsuB8VAPiQ
	6Ayw==
X-Received: by 10.14.246.11 with SMTP id p11mr32984799eer.9.1381530594754;
	Fri, 11 Oct 2013 15:29:54 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	l49sm35660600eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 15:29:54 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2013 00:29:48 +0200
Message-Id: <1381530590-25182-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 1/3] hx4700.conf: update config and prefer linux-yocto
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2013 22:29:53 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/hx4700.conf | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/conf/machine/hx4700.conf b/conf/machine/hx4700.conf
index 3300089..b0c60c3 100644
--- a/conf/machine/hx4700.conf
+++ b/conf/machine/hx4700.conf
@@ -20,16 +20,14 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "480"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "200"
-MACHINE_FEATURES = "alsa apm bluetooth irda kernel26 pcmcia screen touchscreen usbgadget wifi vfat"
+MACHINE_FEATURES = "alsa apm bluetooth irda pcmcia screen touchscreen usbgadget wifi vfat"
 MACHINE_FEATURES += "iwmmxt"
 
 #
 # Software/packages selection
 #
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-MODUTILS = "26"	
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
            xf86-input-evdev \
            xf86-video-fbdev"
-- 
1.8.1.5


