Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFD56CBA4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 20:51:28 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so4262020ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 13:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=t/gueUlJGOBMc1eoYRHBVX7zSoVCWLSix8G4BiJpdk4=;
	b=gUeimPLfHSXf2Gi2r0n1WEvKdTO2mz9Stp6ow7SFGI6wGs3tczWyWi4cfTLrOvL0TR
	uE1rAX2rw6ZiDoCw1fFHcxGrnLwGMLpWorTs65lCEWFK9TEX8Kn43g0csr5EyrX5TV3Q
	2KDIDnSxGAbjD7beWYJC8EkVJPuz1GkBXHwvMsGA7gPSXSV2FZgy3A1SX9Lk539TuzAj
	11LH+0ztG9jJ3r7JbspwVqyPiwuU7aoWY+8bx65ozJY7+vYDXyUHMd7b8MibRHwPVlFs
	1UBYLcDhDQKgKBJNRWFmxynHkXdq76nVdDL1eIVzLxVCo7yxPI5irP5XEDUnBfrn7VsH
	UWDA==
X-Received: by 10.14.203.70 with SMTP id e46mr3601291eeo.33.1381870290712;
	Tue, 15 Oct 2013 13:51:30 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	r48sm170975139eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Oct 2013 13:51:30 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2013 22:51:27 +0200
Message-Id: <1381870287-2775-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] motorola-ezx-base.inc: reorder and remove old comments about iwmmxt
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
X-List-Received-Date: Tue, 15 Oct 2013 20:51:30 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/motorola-ezx-base.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index cbc871e..d6bb42d 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -2,12 +2,12 @@
 # Hardware-based properties
 #
 
-# Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
 require conf/machine/include/tune-xscale.inc
-PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
-# Uncomment this to use iwmmxt optimizations. Remove the above xscale stuff first
-#require conf/machine/include/tune-iwmmxt.inc
+MACHINE_FEATURES = "alsa apm bluetooth keyboard phone screen touchscreen usbgadget usbhost vfat qvga"
+MACHINE_FEATURES += " iwmmxt"
+
+PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
 #cat /proc/mtd
 #dev:    size   erasesize  name
@@ -16,8 +16,6 @@ PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 #mtd2: 00580000 00020000 "VFM_Filesystem"
 #mtd3: 00020000 00020000 "Logo"
 
-MACHINE_FEATURES = "alsa apm bluetooth keyboard phone screen touchscreen usbgadget usbhost vfat qvga"
-MACHINE_FEATURES += " iwmmxt"
 
 #
 # Software/packages selection
-- 
1.8.1.5


