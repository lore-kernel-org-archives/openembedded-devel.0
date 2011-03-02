Received: from 2.27.mail-out.ovh.net ([46.105.37.238] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PuuVq-0006ax-OD
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 23:27:18 +0100
Received: (qmail 9907 invoked by uid 503); 2 Mar 2011 22:19:02 -0000
Received: from b9.ovh.net (HELO mail629.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 2 Mar 2011 22:18:57 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Mar 2011 23:27:08 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 Mar 2011 23:27:07 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 22:26:42 +0100
Message-Id: <1299101202-1735-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 13126585540464389449
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox-1.18.3: add last fix
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
X-List-Received-Date: Wed, 02 Mar 2011 22:27:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.18.3.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox_1.18.3.bb b/recipes/busybox/busybox_1.18.3.bb
index f85de86..59e817d 100644
--- a/recipes/busybox/busybox_1.18.3.bb
+++ b/recipes/busybox/busybox_1.18.3.bb
@@ -1,10 +1,11 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += " \
 	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-buildsys.patch;name=patch01 \
 	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-modutils24.patch;name=patch02 \
 	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-wget.patch;name=patch03 \
+        http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-menuconfig.patch;name=patch04 \
 	"
 
 SRC_URI[md5sum] = "660af4d44661d32b22025a66f4f78df2"
@@ -15,3 +16,5 @@ SRC_URI[patch02.md5sum] = "ce7c3421c87088a7f779278680563bff"
 SRC_URI[patch02.sha256sum] = "134ed86867784348f484810464df5bc97589e7aa41079c90e35b8d12b9284df8"
 SRC_URI[patch03.md5sum] = "abe065069fed8458eedbdad48c115e1f"
 SRC_URI[patch03.sha256sum] = "22538ebee96f66916104b8143cfd16e21568da4c5a89128b9daa60d83a59120b"
+SRC_URI[patch04.md5sum] = "d12d997b66669451bd8c4cc494162a80"
+SRC_URI[patch04.sha256sum] = "f3f8466432088248492fc44631a765ed0a95a8b7d14e37483fae25158d07dc68"
-- 
1.7.0.4



