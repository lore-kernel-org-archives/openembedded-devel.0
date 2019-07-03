Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BF5937E7DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 06:24:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45drfT4QlYz2C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2019 08:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562135041;
	bh=uRUEbiUB2Wx+Tfjzew5uEXg1Jhrn6d+RIr5IOgYHX6M=;
	h=From:To:Subject:Date:From;
	b=oKL+OYU/4+eWHhTYCuG2EbgFErAaO/JbQ1Zn9JS4U83O8T47aP/Y8NBFNfvAw+Jt4
	XQI0cXfu8IrQfbYSukyI5HikkImrfnJPB2SOAZOmG23ecjCwP5lECTNur9/pfI/t9V
	p9pk/mPlZGL152ExSww4u79VTuVpAjXZHV3aVZJeVxQEoVYashz+78m5zvqRTPddUH
	8a0JGbxzFWAaokqdKbNUu2DeyXR2JQwulKbgVH6J2aHSNiP5NFu4a14zaJuHxkjpEu
	aVvBE3jer4gAYQPEvJKzsEPjxnNiuj8xpjP0++28ZChoQsieJZPiMLTzPLqcr8n+Uq
	ax5FvVe/DK1zg2JF/GR+SMnp05zd/4hoxcvUcb2swnQXWU2qn82SZFGkLAe5wXGxk6
	W87I4FpnLzBx1oLHmry9NA4rSgE0Lp+ZYrtjLa0lslpn32XDAugpisqpq1lcDR807p
	l17gnAJI7WI3fx1Pxj2wFSt2QHpSp5iG5Xy3iXwVjgzhnDWox9G2UiN8RmjrrdCd/l
	jyIOsU9osFVxux42EPKXA8pBv8whoJv8xJJ+wE+kdNtoAJL4osXoQlaZO4YzBUzGfA
	4QdREgBdnHchfc2h7KzOPSj6/KKfOKVYEhPA33oJSMGvG1lx3K1Cn+VI4B2onJzxS2
	m4wOFa2bFW7f3fFRMd6BX3d0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jul 2019 09:23:58 +0300
Message-Id: <20190703062359.12400-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] packagegroup-basic: Remove bluez4 support
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
X-List-Received-Date: Wed, 03 Jul 2019 06:24:02 -0000

bluez4 was removed from meta-oe 2 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-core/packagegroups/packagegroup-basic.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
index b12183b3a..54b59ccb7 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
@@ -9,7 +9,6 @@ PR = "r13"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
-inherit bluetooth
 
 # Poke extra recomendations into the list using your machine.conf
 #
@@ -46,7 +45,7 @@ RRECOMMENDS_${PN} = "\
     ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "alsa-utils-alsamixer", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "kernel-module-g-ether kernel-module-g-serial kernel-module-g-mass-storage", "", d)} \
     \
-    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "${BLUEZ}", "", d)} \
+    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "bluez5", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "wifi", "iw wpa-supplicant", "", d)} \
     \
     tzdata \
-- 
2.17.1


