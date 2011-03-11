Received: from 7.27.mail-out.ovh.net ([46.105.34.120] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyAo1-0001JO-8y
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 23:27:33 +0100
Received: (qmail 6499 invoked by uid 503); 11 Mar 2011 23:12:45 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 11 Mar 2011 23:12:39 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 Mar 2011 00:19:09 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 Mar 2011 00:19:07 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 23:20:34 +0100
Message-Id: <1299882034-23172-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11518800472976829769
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] nodejs: update to 0.4.2
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
X-List-Received-Date: Fri, 11 Mar 2011 22:27:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 ...s-cc_0.4.0.patch => libev-cross-cc_0.4.2.patch} |    0
 .../nodejs/{nodejs_0.4.0.bb => nodejs_0.4.2.bb}    |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes/nodejs/files/{libev-cross-cc_0.4.0.patch => libev-cross-cc_0.4.2.patch} (100%)
 rename recipes/nodejs/{nodejs_0.4.0.bb => nodejs_0.4.2.bb} (77%)

diff --git a/recipes/nodejs/files/libev-cross-cc_0.4.0.patch b/recipes/nodejs/files/libev-cross-cc_0.4.2.patch
similarity index 100%
rename from recipes/nodejs/files/libev-cross-cc_0.4.0.patch
rename to recipes/nodejs/files/libev-cross-cc_0.4.2.patch
diff --git a/recipes/nodejs/nodejs_0.4.0.bb b/recipes/nodejs/nodejs_0.4.2.bb
similarity index 77%
rename from recipes/nodejs/nodejs_0.4.0.bb
rename to recipes/nodejs/nodejs_0.4.2.bb
index be3d23e..912eb5d 100644
--- a/recipes/nodejs/nodejs_0.4.0.bb
+++ b/recipes/nodejs/nodejs_0.4.2.bb
@@ -9,8 +9,8 @@ SRC_URI = " \
   file://libev-cross-cc_${PV}.patch \
 "
 
-SRC_URI[md5sum] = "18f89256751f9b8e27dee8494f508171"
-SRC_URI[sha256sum] = "4a30bd9963373cb86a994479bdd451ab3b6f2124f0089493366315da79d3408e"
+SRC_URI[md5sum] = "9e9e791e125f6a601ebc663dc99c72a8"
+SRC_URI[sha256sum] = "09b1100ca6828eedbe52418fbeb3352d71c0b1ff3344c44a5af3efb80c5b908c"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.7.0.4



