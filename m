Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 416A36CEE2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 23:28:25 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c1so2618807eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 16:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tWtNjeXhlqXsmxAetCEJg4ErQbJPrLi0okgTb2Kdgoo=;
	b=O4A/+V5xQKW+M6fZAlas6MdaPb5Q3hLLkSa4sViG+2BpuN6htGcJN5oeE5uX36kE8W
	aWtGZ95F69HvRX3o/qz4jXWkIwxRd4YsX0TU5dfqM626Ilv2aQwKsCHl/yd37AdnS9kT
	Swn9uPudyf4rhE225JMrHmCHKDlwI3UmBOFpQsCgQCDU+/2fuBiNfuVNrZ/FKNYspRww
	3FMvyxuDOKW8p+qHvUOSidD1cnm8q1oh6r8QMMvyEXXFuVwS7Tzx8wgVF3KJxN8EcTpG
	gJPAojufNcozN75T629APlFYlr0ECR006RKCOWrYV4zzjjdca6nciEGoNf4MRE5jeD0t
	yXJQ==
X-Received: by 10.14.241.74 with SMTP id f50mr42364059eer.29.1381620505967;
	Sat, 12 Oct 2013 16:28:25 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	j7sm133331466eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 16:28:25 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:28:21 +0200
Message-Id: <1381620502-19278-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] hx4700.conf: standardize the iwmmxt extra packaging
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
X-List-Received-Date: Sat, 12 Oct 2013 23:28:25 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/hx4700.conf | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/conf/machine/hx4700.conf b/conf/machine/hx4700.conf
index b0c60c3..f8f5c7c 100644
--- a/conf/machine/hx4700.conf
+++ b/conf/machine/hx4700.conf
@@ -5,13 +5,10 @@
 #
 # Hardware-based properties
 #
-
-# Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
 require conf/machine/include/tune-xscale.inc
-PACKAGE_EXTRA_ARCHS = "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}} iwmmxt"
 
-# Uncomment this to use iwmmxt optimizations. Remove the above xscale stuff first
-#require conf/machine/include/tune-iwmmxt.inc
+MACHINE_FEATURES += "iwmmxt"
+PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
 ROOT_FLASH_SIZE = "80"
 VOLATILE_STORAGE_SIZE = "64"
@@ -21,7 +18,6 @@ MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "200"
 MACHINE_FEATURES = "alsa apm bluetooth irda pcmcia screen touchscreen usbgadget wifi vfat"
-MACHINE_FEATURES += "iwmmxt"
 
 #
 # Software/packages selection
-- 
1.8.1.5


