Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TgLJU-0000tA-Bm
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 21:11:25 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so4308672lbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 11:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IgbrmW9jfTHu8K+gkoa12RJTzU5iDQJR/fgnx+YhTqE=;
	b=FlB1td+QWk4FLauPFvs3EQRFV5cRgB+/18pnyYz03wRFnBaSlK7HIxGXKqcrxdpwIL
	eQc51YgOjrzL2EadRz7voQbgPIcIbEOYZKJXHOe//r8KwdYx5iBIrOg4vH3LwVhS8oOc
	DrMdiTJ/xpmxLVUUYo3Hjita44qCzxexayfDGxj/N1fxH23kUSbID1Eerzd2jQz65M4g
	Oj+cVvxcVDysmqx7FLRf5Kmk/CA6nMGWgyB7aEpPN/imLraqYrKNR4g1BstRNIle+LfL
	7GLbuWCEQ79G/p0t0EOustBm1RWHEQH6zjsuqvSuo52018CRoX+6n/oRS6GUSaVubEr2
	euQA==
Received: by 10.152.108.37 with SMTP id hh5mr17954497lab.52.1354737420102;
	Wed, 05 Dec 2012 11:57:00 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id ts2sm2541260lab.10.2012.12.05.11.56.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 11:56:58 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TgL5U-0002q9-7w; Wed, 05 Dec 2012 21:56:56 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 21:56:54 +0200
Message-Id: <1354737414-8266-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libsdl-image: update to upstream version 1.2.12
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
X-List-Received-Date: Wed, 05 Dec 2012 20:11:31 -0000

SDL_image now has license of its own.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../{libsdl-image_1.2.10.bb => libsdl-image_1.2.12.bb}      |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-multimedia/libsdl-image/{libsdl-image_1.2.10.bb => libsdl-image_1.2.12.bb} (75%)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
similarity index 75%
rename from meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
rename to meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index 12a3abd..fd80d67 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Simple DirectMedia Layer image library."
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+LICENSE = "SDL_image"
+LIC_FILES_CHKSUM = "file://COPYING;md5=613734b7586e1580ef944961c6d62227"
 
-PR = "r3"
+PR = "r0"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz"
-SRC_URI[md5sum] = "6c06584b31559e2b59f2b982d0d1f628"
-SRC_URI[sha256sum] = "75e05d1e95f6277b44797157d9e25a908ba8d08a393216ffb019b0d74de11876"
+SRC_URI[md5sum] = "a0f9098ebe5400f0bdc9b62e60797ecb"
+SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
 
 S = "${WORKDIR}/SDL_image-${PV}"
 
@@ -31,4 +31,3 @@ do_configure_prepend() {
 	rm -f acinclude/ltsugar.m4
 	rm -f acinclude/ltversion.m4
 }
-
-- 
1.7.10.4



