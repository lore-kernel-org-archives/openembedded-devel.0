Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SOrBM-00078o-Ly
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 16:02:28 +0200
Received: by wibhj13 with SMTP id hj13so2329294wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 06:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=SqOQ31blgUCgeor37UIuGiq6snOKiOYSr58/3tl+77I=;
	b=Qvi5Yr/vV0fgx070dHlFtM54XiZ+ACWjg0cCLy8Bj1Y+HN55CY4eRcxr4L7Id4CBUt
	BCdx74rG1iM4cJdSybTw+yGuQyH948PGZFVGIsmsaFv+PEolJW2kl0z1Fp4O8QNdilyE
	o6csezw29ZXwXWAtYBZE0HtCrbE4roRqQvnOI69VnJAPH1f+WPzua7Mzx3+8AU0kyOKq
	f39VdVzLGta+qboTqE/NMgwdy1ZhIrlJk8gorKHxc3crTP0mfO5M2GuTT0VNgbAj5zr0
	OkwoJR6Fi/4PfEIufGEI1NYabM78DacrtkWe1a/S5k1nOamBHPs6Q7KChBdMesSXWUAm
	epsA==
Received: by 10.180.102.129 with SMTP id fo1mr29204782wib.6.1335793966901;
	Mon, 30 Apr 2012 06:52:46 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id b3sm28574291wib.4.2012.04.30.06.52.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 06:52:46 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 15:52:39 +0200
Message-Id: <1335793959-28130-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335793959-28130-1-git-send-email-koen@dominion.thruhere.net>
References: <1335793959-28130-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnchbIXh55DsekrLBRgr7uDZMzBI+49wNXYodCTw9HDKgTEbK25kw+Ru612U0+qeXpZ5B6b
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 3/3] media-ctl: update to latest git
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
X-List-Received-Date: Mon, 30 Apr 2012 14:02:28 -0000

* split out libs
* media-ctl has been relicensed to LGPLv2.1+

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
index 99ec8e2..76d811b 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
@@ -1,16 +1,20 @@
 DESCRIPTION = "Media controller control application"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
 SRC_URI = "git://git.ideasonboard.org/media-ctl.git;protocol=git"
-SRCREV = "a183835abdefb8e40650fc9eb22e2d291aac9883"
+SRCREV = "46bec667b675573cf1ce698c68112e3dbd31930e"
 
 PV = "0.0.1"
+PR = "r1"
 S = "${WORKDIR}/git"
 
 inherit autotools
 
-# It needs some kernel definitions for v4l2, so it isn't machine specific
+# It needs some kernel definitions only for v4l2, so it isn't machine specific
 EXTRA_OECONF = "--with-kernel-headers=${STAGING_KERNEL_DIR}"
 
+PACKAGES =+ "libmediactl libv4l2subdev"
+FILES_libmediactl = "${libdir}/libmediactl${SOLIBS}"
+FILES_libv4l2subdev = "${libdir}/libv4l2subdev${SOLIBS}"
 
-- 
1.7.10



