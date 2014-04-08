Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9F24965D24
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 21:36:45 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so1195663eek.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 14:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=a2gf6PfSCc/W3aUlriiDdwbceMKdPLf5bnWrYd5pT2I=;
	b=il7oXi4j98F8aCpRT2IDAFdE4i2wB0JjmSAz2nRB6wF4AFt3o0Nzxk5DxqN8mD3VMu
	In+6fURWpfGTXyyKdj5pXZohPOijh4AYyl26vbsDI6idFzgggh7v8jnrxZjWiZFnUXQI
	VqGXX1Ua9mhCfD5aN7+Kqdr0haDhgGBfbYsLQOqnMGGnXyAAuLLBwx+9GDVJiPQN1GVL
	cblrV7XG4o0Ho4piqqQyrrxpWgNaKrrPCBdCsr3q09pN838HjHfSS4tOi/Alv6WxTw85
	la5UkCgxYcqiFq+YUU1vs/aPaiMKZT5EOI8/dH4f6EoTov1fTUgCONQExIPVeW6o0yrm
	jMuQ==
X-Received: by 10.15.10.3 with SMTP id f3mr6973934eet.1.1396993005865;
	Tue, 08 Apr 2014 14:36:45 -0700 (PDT)
Received: from mizar.localdomain
	(host89-230-dynamic.20-79-r.retail.telecomitalia.it. [79.20.230.89])
	by mx.google.com with ESMTPSA id a42sm7145370ees.10.2014.04.08.14.36.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Apr 2014 14:36:45 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Apr 2014 23:36:37 +0200
Message-Id: <1396992997-1493-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] linux-yocto_3.14: tosa: really switch to simpler gpio-charger module
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
X-List-Received-Date: Tue, 08 Apr 2014 21:36:48 -0000

Adjust defconfig to match the gpio-charger patch.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig b/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
index c38bbff..bf7e376 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
@@ -285,9 +285,9 @@ CONFIG_SPI=y
 CONFIG_SPI_PXA2XX=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_SUPPLY=y
-CONFIG_PDA_POWER=y
 CONFIG_APM_POWER=y
 CONFIG_BATTERY_TOSA=m
+CONFIG_CHARGER_GPIO=y
 CONFIG_SENSORS_MAX1111=y
 CONFIG_WATCHDOG=y
 CONFIG_SOFT_WATCHDOG=m
-- 
1.8.1.5


