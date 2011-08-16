Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtDtR-0007Ja-Fq
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 09:16:57 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Tue, 16 Aug 2011
	09:12:20 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Aug 2011 09:12:15 +0200
Message-ID: <2acdd12f7e62c4cb1f392cc2f5ed21d48f71c481.1313478102.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1313478102.git.anders@chargestorm.se>
References: <cover.1313478102.git.anders@chargestorm.se>
MIME-Version: 1.0
Subject: [PATCH 1/1] libx11: skip self if x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 16 Aug 2011 07:16:57 -0000
Content-Type: text/plain

This stops (most) x11 packages leaking into a non-x11 distro by mistake.

Signed-off-by: Phil Blundell <philb@gnu.org>

The patch was imported from the oe-core git server
(git://git.openembedded.org/openembedded-core) as of commit id
2f94ff4fdb66755ba2448794baea19315ff96273.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-graphics/xorg-lib/libx11.inc |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11.inc b/meta-oe/recipes-graphics/xorg-lib/libx11.inc
index 2aa9700..9f7e990 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libx11.inc
+++ b/meta-oe/recipes-graphics/xorg-lib/libx11.inc
@@ -45,3 +45,8 @@ do_compile_prepend() {
 		cd ../../
 	) || exit 1
 }
+
+python () {
+       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
+       	  raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
+}
-- 
1.7.5.4



