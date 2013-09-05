Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9A182615E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 01:31:54 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so1206589pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 18:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1pxj8avElX547ZqOK4AmE9Hx33U4UdJnST5VgXewdFI=;
	b=zok3Zpu+amqa1Pp1a1H4qsoKruqKOl/M4wnMSNJc+vS1HkbZGfJOQkzPJXE5ZhaEF3
	sdAiMvySqSxmaGMlVVv3RKTG9VLPnQ5V0Ndhr9IRhC+hW0kiD0yKgoU74bt3SAFLG6O7
	mRsYf+IhI/37XGaEaCY0UKExrkkB71MaEYccg05zJxcMkQgMCE+oIgcSOKuWMktYXbrb
	zTSMLJrHUaB8c+RhHy8Pjz7TCKMjdPXK5DmGjjpG1ECdu2hPFA/WiKFAqBAptbgcVgFy
	blTEFftpqA9f6Q3LMHjLHDKGXb0ZSme0nq0N1O67NWEM90rGXoUX3d2X7i9VRUc5o/h6
	wqGQ==
X-Received: by 10.66.146.42 with SMTP id sz10mr2451962pab.100.1378344716279;
	Wed, 04 Sep 2013 18:31:56 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id 7sm33945277paf.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 18:31:55 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:28:27 +1000
Message-Id: <1378344507-30904-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH] xf86-video-ati: add missing xserver-xorg-module-exa RDEPENDS
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
X-List-Received-Date: Thu, 05 Sep 2013 01:31:54 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
index 7703a17..a453f90 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.2.0.bb
@@ -8,6 +8,7 @@ DESCRIPTION = "Open-source X.org graphics driver for ATI Radeon graphics"
 
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
             virtual/libgl xineramaproto libpciaccess"
+RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-- 
1.8.4


