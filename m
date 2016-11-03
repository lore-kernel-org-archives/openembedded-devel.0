Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A0814607A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 10:16:55 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i88so4440856pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OsVpkBsRSAOcZ5Td2ses+iweiY8V7s0nlBi1tY47wg8=;
	b=b7RbBP0bCVkIKvW6hqBdzYZlvdPKP7BwXN1wwe4+q9Nv2s+22b2/tCwUFp3rfC8rNQ
	vFIh93kKI92HJj6HxXaFgDKX1t/F+1t6lGGgBFwe7giPrLDaCSgaY2zoWwGLRi7erDpg
	9DdFDDC0gKvD2FHBV7CBPE0OyjoxmL6NLGvUnekUHbihbl8PDNYqVJZ/u51Lz7RLGh+E
	IhMAyrh5bpC/Hi0KD6j9ns3nCdiWsloDhFXT5/8dVahYQC36sgxeHrfByUV1BdO6EDeO
	yFQA1tQV7ygEtoPkmz91CJxvy5PadnE0LYwasHbiWC5Py5W9f3FDKqHvUMdUZub1ywWk
	qjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OsVpkBsRSAOcZ5Td2ses+iweiY8V7s0nlBi1tY47wg8=;
	b=SJOmusPB7LIaG6SkI+GL2g+CLHR40AaEqN65FTbl9u1XBGrVyl2k07UTH/yj4N9ve0
	44f49rYA500aVaBaFIos2Z4PH9kN//0squDCYaITM4bWGvdmkX816oLq6Cpjwihb2zTp
	PnBIh+YS7Lr/spBRPsZPU6PDedX6cRM6CETCNbOvuJgyDyyoD+wDxHihcW5BB1xHo1WA
	5VzSI/b6+VLabebmPEGaSczcChu7ajjMmzYohGPYYTN0OnZ3ZrDiQ5eqitoNHcmnFwX5
	pnCdwQGD2T+sYiE42XGzVZqQlo5AaD9jOCMQLUuOxnfC2wbOJZdK5WiuzEeH4jG19UiB
	YEAQ==
X-Gm-Message-State: ABUngvckCz0L/LgQ4fzH3ISeho0h22vdKORXcbQdMWC+G2Qpv21w1zv++Io30AdHOEVYmg==
X-Received: by 10.98.112.195 with SMTP id l186mr15259174pfc.35.1478168216872; 
	Thu, 03 Nov 2016 03:16:56 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m129sm11464125pfm.13.2016.11.03.03.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 03:16:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 03:16:50 -0700
Message-Id: <20161103101650.31105-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] libvdpau: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Nov 2016 10:16:55 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

Needed for x86 machines

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vdpau/libvdpau_git.bb

diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
new file mode 100644
index 0000000..31f4df4
--- /dev/null
+++ b/meta-oe/recipes-graphics/vdpau/libvdpau_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Video Decode and Presentation API for UNIX"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=83af8811a28727a13f04132cc33b7f58"
+
+DEPENDS = "virtual/libx11 libxext dri2proto"
+
+PV = "1.1.1+git${SRCPV}"
+
+SRCREV = "a21bf7aa438f5dd40d0a300a3167aa3d6f26dccc"
+SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+    rm -f ${D}${libdir}/*/*.la
+}
+
+FILES_${PN}-dbg += "${libdir}/vdpau/.debug"
+FILES_${PN}-dev += "${libdir}/vdpau/lib*${SOLIBSDEV}"
+FILES_${PN} += "${libdir}/vdpau/lib*${SOLIBS}"
-- 
2.10.2


