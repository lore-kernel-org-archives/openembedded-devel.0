Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATXy-0003G6-9X
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Mar 2012 22:58:22 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so1348298wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=KBFXRkLfKjufuaaUDxTup+A1YrS5e1PM0hjKafICx8c=;
	b=gNiwNuLD/Vpv/oCMXIcVeK81zlUfRA6G/noR4HEHK/44o5Aupy5zTPmGvRJh1D24xV
	3QhxCgGxP1S9egxfvlxFywItLqODJlY5yFC/TT6YfSAwuiwI5TwvyqVen/xNj4rTK3Jv
	qBy/w/4bTs3mJrb0e6oeHL9D+Q+jtes0xcmvil7paxlp/2nCVKbve5TegkKOPN3Cs+sD
	85qqFB6ei2E2QEEMYM3QV+eV0Ese2cMukd9ltBX1Yi/5I7NZvAzPXzQbO9QvWFN0FKwz
	Q1RXij/5qJwSeP0JvYGQY15FOKQwCXq8kR4YPjhprGrYASJij1lcq3XgwJRnRJLUcBdK
	lXNw==
Received: by 10.180.107.162 with SMTP id hd2mr41490952wib.8.1332366570010;
	Wed, 21 Mar 2012 14:49:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm7768769wib.4.2012.03.21.14.49.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:49:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:49:02 +0100
Message-Id: <3e021b4a64d691edde6218c713a34bbc2b5f524d.1332366214.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <f155e80f9a8c90337e79928293daa7f807328b45.1332366214.git.Martin.Jansa@gmail.com>
References: <f155e80f9a8c90337e79928293daa7f807328b45.1332366214.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332366214.git.Martin.Jansa@gmail.com>
References: <cover.1332366214.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/4] pango: native support and --disable-introspection moved to oe-core pango.inc
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
X-List-Received-Date: Wed, 21 Mar 2012 21:58:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/pango/pango_1.29.4.bb |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
index b14430f..ea79a63 100644
--- a/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
+++ b/meta-oe/recipes-graphics/pango/pango_1.29.4.bb
@@ -1,8 +1,5 @@
 require recipes-graphics/pango/pango.inc
 
-BBCLASSEXTEND = "native"
-DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SRC_URI[archive.md5sum] = "a5ee785f4f31d6bdd8625a09ea3f8b4b"
@@ -11,5 +8,3 @@ SRC_URI[archive.sha256sum] = "f15deecaecf1e9dcb7db0e4947d12b5bcff112586434f8d30a
 SRC_URI += "file://no-tests.patch"
 
 PR = "r4"
-
-EXTRA_OECONF += "--disable-introspection"
-- 
1.7.8.5



