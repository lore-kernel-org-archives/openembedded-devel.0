Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1NysOE-0006Dt-1z
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Apr 2010 21:55:18 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 204B623C49; Mon,  5 Apr 2010 23:48:49 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Apr 2010 23:48:46 +0400
Message-Id: <1270496927-14834-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <hp4781$59h$2@dough.gmane.org>
References: <hp4781$59h$2@dough.gmane.org>
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] gd: build with freetype support
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
X-List-Received-Date: Mon, 05 Apr 2010 19:55:18 -0000

Support for freetype in gd is required for some packages and it looks
like it was disabled previosly just because of build failures. Version
2.0.35+2.0.36rc1 builds fine with it, so enable freetype for it.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/gd/gd_2.0.35+2.0.36rc1.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/gd/gd_2.0.35+2.0.36rc1.bb b/recipes/gd/gd_2.0.35+2.0.36rc1.bb
index efba70e..d1ea7f6 100644
--- a/recipes/gd/gd_2.0.35+2.0.36rc1.bb
+++ b/recipes/gd/gd_2.0.35+2.0.36rc1.bb
@@ -1,8 +1,8 @@
 SECTION = "libs"
 LICENSE = "GD"
 DESCRIPTION = "gd is a library used to create PNG, JPEG, or WBMP images."
-DEPENDS = "libpng jpeg zlib"
-PR = "r2"
+DEPENDS = "freetype libpng jpeg zlib"
+PR = "r3"
 
 SRC_URI = "http://www.libgd.org/releases/gd-2.0.36RC1.tar.gz;name=src"
 SRC_URI[src.md5sum] = "39ac48e6d5e0012a3bd2248a0102f209"
@@ -15,7 +15,7 @@ inherit autotools binconfig gettext
 EXTRA_OECONF += " --with-zlib=${STAGING_LIBDIR}/.. \
                   --with-png=${STAGING_LIBDIR}/.. \
                   --with-jpeg=${STAGING_LIBDIR}/.. \
-                  --without-freetype \
+                  --with-freetype \
                   --without-fontconfig \
                   --without-xpm \
                   --without-x"
-- 
1.6.4.2



