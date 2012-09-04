Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91ih-00056S-71
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:35:43 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so4450016wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7vRXqQlTgZB/DidxvuXjHhO79wlNd4KFG0ntBtAtNWQ=;
	b=Qp2/YriNDqcqHrE59PzYM4+liXgVNw6I2TGWxYzqvfH2rtX9jK3nmn22eaqBN2jbXJ
	0PMLfuEt2AG0QueTwG8WqALgtaqLSorKOd/gIccQGlpB4+kB7Qnzx9yj0wjBetk6lqKM
	mDV++xU+PHCiPpqhCRRNnx/JUAu2PfbtvXPKLWOqn47ujyh6bFyOXW9e68bpMQMWmsvp
	y+cIZaOEx4w/qHgv0h0wNLEI0cGSgo6WjpwZpeu76r+2KeVNdcv7OcxjBh0RgXyW8m/C
	GCVozL+PXnxIiPioYu/n3tdv4roVUdxTYizbdRCbU/4cGigLrfgnaq5IukLGo6/LRp/R
	4nQg==
Received: by 10.180.8.40 with SMTP id o8mr33432202wia.9.1346797403160;
	Tue, 04 Sep 2012 15:23:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm40138690wix.5.2012.09.04.15.23.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:23:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:20 +0200
Message-Id: <12fc1308af35012798bddd8df2960eb165c59d4c.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 08/10] xf86-video-glamo: add xserver-xorg-module-exa to RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 22:35:43 -0000

* it was separated from xserver-xorg package and glamo fails in runtime without that
  http://git.openembedded.org/openembedded-core/commit/?id=1a666ee1cda3c0b74daba5881fc5f62e13deec66

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 6fb78ab..10120b1 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -1,12 +1,13 @@
 require recipes-graphics/xorg-driver/xorg-driver-video.inc
 DESCRIPTION = "X.Org X server -- Glamo display driver with KMS support"
 DEPENDS += "libdrm"
+RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 
 PE = "2"
 PV = "1.0.0+gitr${SRCPV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=master \
            file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
-- 
1.7.12



