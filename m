Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f44.google.com (unknown [209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 730C56FA40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 18:55:54 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ld10so7921955pab.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 11:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ROQLnwxWGZvl/ReZ5LiW/TRF2rYc7mU3wK+640vTTpQ=;
	b=Os9cn6qoaQTaL+px6zb4/Xfoob+9BToNBTwvGU0NGs+1UEPCqVC0/VwCXjUL2/ZM1l
	teyjEQmH66ZScZ49ioQeATGbTHmssZpMjZZZUEjjsIj0Vq4vFTjFb88BsP7AIxWlKsvD
	QpmKDJafBhOhv7SCfuRo9ZGW1HkyrHOwCzHJ9hyPqARETNDzcEsq/CDV4/13Ajmd5o+E
	mkzIMMiK/dosIJwYFRJK8ByXTjh6QS0Jhah4VggpbPcvvRjFBR84Wb21rT6OGDoAgr4F
	60D4w6BdhevrNzvPoiliKO0dzauwUKgzpyEMkvhF1iVynmOOKfbNYL3AZAS8D3Hjx9AW
	o2NQ==
X-Received: by 10.66.142.233 with SMTP id rz9mr30452319pab.71.1401130556330;
	Mon, 26 May 2014 11:55:56 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	tg9sm19474308pbc.29.2014.05.26.11.55.55 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 26 May 2014 11:55:55 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 11:58:32 -0700
Message-Id: <1401130712-27776-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] libsdl-image: fix S!=B error
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
X-List-Received-Date: Mon, 26 May 2014 18:55:55 -0000

From: Tim Orling <TicoTimo@gmail.com>

Fixes:
| libtool: Version mismatch error.  This is libtool 2.4.2, but the
| libtool: definition of this LT_INIT comes from libtool 2.2.6.
| libtool: You should recreate aclocal.m4 with macros from libtool 2.4.2
| libtool: and run autoconf again.

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index ef78927..23f2a37 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a8
 
 S = "${WORKDIR}/SDL_image-${PV}"
 
-inherit autotools
+inherit autotools-brokensep
 
 export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
 
-- 
1.8.3.2


