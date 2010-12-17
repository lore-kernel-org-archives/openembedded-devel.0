Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PTnhw-0003ZN-IX
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 04:43:44 +0100
Received: (qmail 28231 invoked by uid 503); 17 Dec 2010 14:00:47 -0000
Received: from b9.ovh.net (HELO mail411.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 17 Dec 2010 14:00:46 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Dec 2010 16:16:59 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Dec 2010 16:16:58 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Dec 2010 15:14:38 +0100
Message-Id: <1292595278-13654-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8131812077531147593
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] fontconfig: update SRC_URI
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
X-List-Received-Date: Sat, 18 Dec 2010 03:43:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

fontconfig's website's configuration actually prevents to fetch the
source archives so use gentoo's mirror until the website is fixed.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/fontconfig/fontconfig_2.6.0.bb |    2 +-
 recipes/fontconfig/fontconfig_2.8.0.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/fontconfig/fontconfig_2.6.0.bb b/recipes/fontconfig/fontconfig_2.6.0.bb
index fd46235..84eaa4d 100644
--- a/recipes/fontconfig/fontconfig_2.6.0.bb
+++ b/recipes/fontconfig/fontconfig_2.6.0.bb
@@ -5,7 +5,7 @@ DEPENDS = "expat freetype zlib"
 
 PR = "r4"
 
-SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
+SRC_URI = "${GENTOO_MIRROR}/fontconfig-${PV}.tar.gz \
            file://fix-pkgconfig.patch"
 
 PACKAGES =+ "fontconfig-utils-dbg fontconfig-utils "
diff --git a/recipes/fontconfig/fontconfig_2.8.0.bb b/recipes/fontconfig/fontconfig_2.8.0.bb
index 5c6f854..64d7ee5 100644
--- a/recipes/fontconfig/fontconfig_2.8.0.bb
+++ b/recipes/fontconfig/fontconfig_2.8.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "expat freetype zlib"
 RPROVIDES_fontconfig-utils = "libfontconfig-utils"
 RCONFLICTS_fontconfig-utils = "libfontconfig-utils"
 
-SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz;name=fontconfig"
+SRC_URI = "${GENTOO_MIRROR}/fontconfig-${PV}.tar.gz;name=fontconfig"
 SRC_URI[fontconfig.md5sum] = "77e15a92006ddc2adbb06f840d591c0e"
 SRC_URI[fontconfig.sha256sum] = "fa2a1c6eea654d9fce7a4b1220f10c99cdec848dccaf1625c01f076b31382335"
 
-- 
1.6.3.3



