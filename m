Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkIoe-0007hy-3m
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 19:19:56 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2707821eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 10:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YYZhtaDCxS2RIXrdnbEjEZALjWeC5uQlXxkvezXJUTA=;
	b=Cumc8o1rEXrLqWw8mpbpyrkrMHwJs1CC+j8VZytcBwdoKhC4STVQUA8GDa1hgve2cW
	UueNJHlcFprW56zpozUVhZdIK9gUnfyzBG1DnsfO17X+8D6GOSfkdScv9vJz70MuCj52
	FrZZXHKRD7T9Sk7y9EBtjQAxmf2OmFHSaXX7pEAZuV1y8GD9AKYAeYs6/7kKo3zYJtXw
	gmykhndgqguxZxC0JMHgqKMORguVYpfUoL674OksgJp1kdT09dWNYsSwlRPQqsbEf5+Y
	DV9DCk0hdkQayfyxhpqMFbv/kCml9m7TYUcMfuqokp7tMZJ8ZW4kcN0WAkvQTOrL5If9
	W9lw==
Received: by 10.14.221.65 with SMTP id q41mr33741202eep.30.1355680724131;
	Sun, 16 Dec 2012 09:58:44 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r1sm23882090eeo.2.2012.12.16.09.58.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:58:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Dec 2012 18:58:08 +0100
Message-Id: <ec8961cf51e39933b6b3ef5b8240181744cc9691.1355680285.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1355680285.git.Martin.Jansa@gmail.com>
References: <cover.1355680285.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 25/26] libsdl-image: update to upstream version 1.2.12
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
X-List-Received-Date: Sun, 16 Dec 2012 18:19:56 -0000

From: Marko Lindqvist <cazfi74@gmail.com>

Now uses zlib license.
Works with libpng15.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{libsdl-image_1.2.10.bb => libsdl-image_1.2.12.bb}        | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-multimedia/libsdl-image/{libsdl-image_1.2.10.bb => libsdl-image_1.2.12.bb} (75%)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
similarity index 75%
rename from meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
rename to meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index 12a3abd..ccc3d40 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.10.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "Simple DirectMedia Layer image library."
 SECTION = "libs"
 
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
+LICENSE = "zlib"
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
1.8.0.2



