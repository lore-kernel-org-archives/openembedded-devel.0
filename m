Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TbBix-0001Lh-A3
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2012 15:56:26 +0100
Received: by mail-wi0-f169.google.com with SMTP id hq12so2874274wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2012 06:42:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=LIGyYaO+D3niekC1KeB/eCrEzqnZwxZ6tdA/EQ9APqw=;
	b=OHt0mhaViqkeJT++CFPlaWdoEodTO+rM3WBBNRm916XMLvcO3xqHl0zOH/Lf7gua+j
	7ylcwS98nYvL1DGcQZc4YWJCQ7ffUpIqMzwenG7MeUluVl0vxUo/6e2xlbh2J3B0oSml
	A9hZ9Ltzi11xwFSDZTIBkxCz3v7+eY3C+aKuARqw9FS4GW6BmE4RU6gei3S89Igmwmfy
	bQBGWo/WSfxjC4osiXloMMOb9kpqiiXsjxK86LER38xoUx45zvbOITm2O7CpUTBFzuS3
	ufLYIdze0GM6KdPoTU7R5IY3zOu3DV+nSMx8C4lc86xmPD5YO4UtnKnGwTbWwfheyGgM
	BYXw==
Received: by 10.216.135.24 with SMTP id t24mr812961wei.147.1353508938370;
	Wed, 21 Nov 2012 06:42:18 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id i6sm22266179wix.5.2012.11.21.06.42.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 06:42:17 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2012 15:42:02 +0100
Message-Id: <1353508922-12820-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQkEjkkhdfrU2TeX0PKRdWkbwTObGIAFISzEAKDMNJLG1MsZcDax9zqcgRfXkZFILOe4HVdi
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] gphoto2: fix gettext build error
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
X-List-Received-Date: Wed, 21 Nov 2012 14:56:27 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-graphics/gphoto2/libgphoto2_2.4.11.bb  |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index d7f6ac0..27f660b 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0448d3676bc0de00406af227d341a4d1"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "libtool jpeg virtual/libusb0 libexif"
 
@@ -26,7 +26,6 @@ inherit autotools pkgconfig gettext lib_package
 EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
 
 do_configure_append() {
-	cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
 	cd ${S}/libgphoto2_port/
 	autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
 	cd ${S}
-- 
1.7.7.6



