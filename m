Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 43DF665C90
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jan 2017 12:52:46 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cOOa6-0005ND-J7 from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jan 2017 04:52:46 -0800
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 3 Jan 2017 12:52:44 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jan 2017 17:52:35 +0500
Message-ID: <1483447955-29580-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] xf86-video-ati: upgrade to 7.8.0
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
X-List-Received-Date: Tue, 03 Jan 2017 12:52:47 -0000
Content-Type: text/plain

This updates the package version from 7.6.1 to 7.8.0
which fixes the current do_compile failures as well.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../xorg-driver/{xf86-video-ati_7.6.1.bb => xf86-video-ati_7.8.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-ati_7.6.1.bb => xf86-video-ati_7.8.0.bb} (79%)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
similarity index 79%
rename from meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb
rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
index bffa7b0..a101008 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.6.1.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_7.8.0.bb
@@ -11,8 +11,8 @@ DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "ede86cd3d1b1d8882f0aea61d9e924ed"
-SRC_URI[sha256sum] = "2516d9eeb8da8bcd3a01365ed1314919777910fa904ab268af342b5693e1d34c"
+SRC_URI[md5sum] = "f34d04a755e761e03b459155fa3ddcbb"
+SRC_URI[sha256sum] = "401f5de772928f3dc4ce43a885adb0a47a2f61aa4a9e45d2ab3d184136a9d6fa"
 
 EXTRA_OECONF += "--disable-glamor"
 
-- 
1.9.1


