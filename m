Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPWHf-0007am-RZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 11:55:43 +0200
Received: by wera1 with SMTP id a1so281052wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 02:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=SqOQ31blgUCgeor37UIuGiq6snOKiOYSr58/3tl+77I=;
	b=LLKvXUo/jjvrm+v9U71UhWAZMWwIp9p63YtHIcCCkT6IpkcX3xqgY1i23fE0pt2+nx
	MKqoYbIKSxT7olhpYm96Fn5lRQQPqLkcmSG1U/YIZrkEHTSmZ40ZkeikGBKK4ce3vuh0
	ZP5vQd43/W7dwWBoKhh5ItOxItwTeYjwHRW1iXvBRa0w1DAXKi1PzmLqdKCA62eMjrd8
	P4dU30n25rCNxXpc1cWvWsaomEUNyhg6qwVdax6t2+5relfALLZp2/FpsiD8u4FXBMSl
	UUPaMHZR9D1SkTHccqtfaHD4tdZywcNKt3dc1LcawHqCBAul7crQGFeeLb1IR2okaob7
	jouQ==
Received: by 10.180.103.35 with SMTP id ft3mr12532457wib.0.1335951959810;
	Wed, 02 May 2012 02:45:59 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id o2sm4976884wiv.11.2012.05.02.02.45.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 02:45:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 May 2012 11:45:29 +0200
Message-Id: <1335951932-6143-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
References: <1335951932-6143-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmwGyUvsl3126om+mNwTenX8/haO8JJI25M0iruuGw8KQBnTWdAKrDTnhNZwA+BL4TQXp2f
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe/denzil][PATCH 3/6] media-ctl: update to latest git
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
X-List-Received-Date: Wed, 02 May 2012 09:55:43 -0000

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



