Received: from 1.26.mail-out.ovh.net ([46.105.43.121] helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLwfs-0004ns-T6
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 14:13:24 +0200
Received: (qmail 13126 invoked by uid 503); 16 May 2011 11:30:20 -0000
Received: from b6.ovh.net (HELO mail94.ha.ovh.net) (213.186.33.56)
	by 26.mail-out.ovh.net with SMTP; 16 May 2011 11:30:19 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 May 2011 14:03:54 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 May 2011 14:03:53 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 May 2011 13:54:13 +0200
Message-Id: <1305546853-12477-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1344605965279276361
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] sip-native: update to 4.12.2
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
X-List-Received-Date: Mon, 16 May 2011 12:13:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

4.12.1 is no more fetchable from the original source

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../{sip-native_4.12.1.bb => sip-native_4.12.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes/sip/{sip-native_4.12.1.bb => sip-native_4.12.2.bb} (86%)

diff --git a/recipes/sip/sip-native_4.12.1.bb b/recipes/sip/sip-native_4.12.2.bb
similarity index 86%
rename from recipes/sip/sip-native_4.12.1.bb
rename to recipes/sip/sip-native_4.12.2.bb
index cd43292..ff8f799 100644
--- a/recipes/sip/sip-native_4.12.1.bb
+++ b/recipes/sip/sip-native_4.12.2.bb
@@ -7,8 +7,8 @@ LICENSE = "GPL"
 PR = "r0"
 
 SRC_URI = "http://www.riverbankcomputing.co.uk/static/Downloads/sip4/sip-${PV}.tar.gz"
-SRC_URI[md5sum] = "0f8e8305b14c1812191de2e0ee22fea9"
-SRC_URI[sha256sum] = "e9d66e8830c2a58e6c17b9952710f67d495ddb84ce6f3d89400c8b52913381b5"
+SRC_URI[md5sum] = "9df80f88e0e4022cdd8a8891c6c38048"
+SRC_URI[sha256sum] = "3e42bea028a1713558b5b8a317af4195d3b0feaa6c179d99401a7048f1a3cec4"
 S = "${WORKDIR}/sip-${PV}/sipgen"
 
 inherit qt4x11 native python-dir
-- 
1.7.0.4



