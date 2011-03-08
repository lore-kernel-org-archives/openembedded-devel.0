Received: from 7.27.mail-out.ovh.net ([46.105.34.120] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Px553-0000RR-Ds
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 23:08:37 +0100
Received: (qmail 1606 invoked by uid 503); 8 Mar 2011 22:33:48 -0000
Received: from b6.ovh.net (HELO mail195.ha.ovh.net) (213.186.33.56)
	by 27.mail-out.ovh.net with SMTP; 8 Mar 2011 22:33:42 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 8 Mar 2011 23:40:18 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 8 Mar 2011 23:40:16 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Mar 2011 22:41:34 +0100
Message-Id: <1299620494-25930-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11691344633463549257
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox: add latest fix
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
X-List-Received-Date: Tue, 08 Mar 2011 22:08:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

klogd: fix the problem of delayed handling of ^C and SIGTERM

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.18.3.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox_1.18.3.bb b/recipes/busybox/busybox_1.18.3.bb
index 59e817d..55b7de2 100644
--- a/recipes/busybox/busybox_1.18.3.bb
+++ b/recipes/busybox/busybox_1.18.3.bb
@@ -1,11 +1,12 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI += " \
 	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-buildsys.patch;name=patch01 \
 	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-modutils24.patch;name=patch02 \
 	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-wget.patch;name=patch03 \
         http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-menuconfig.patch;name=patch04 \
+	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-klogd.patch;name=patch05 \
 	"
 
 SRC_URI[md5sum] = "660af4d44661d32b22025a66f4f78df2"
@@ -18,3 +19,5 @@ SRC_URI[patch03.md5sum] = "abe065069fed8458eedbdad48c115e1f"
 SRC_URI[patch03.sha256sum] = "22538ebee96f66916104b8143cfd16e21568da4c5a89128b9daa60d83a59120b"
 SRC_URI[patch04.md5sum] = "d12d997b66669451bd8c4cc494162a80"
 SRC_URI[patch04.sha256sum] = "f3f8466432088248492fc44631a765ed0a95a8b7d14e37483fae25158d07dc68"
+SRC_URI[patch05.md5sum] = "f2277e7a31d04295bd9d56a98ff1535b"
+SRC_URI[patch05.sha256sum] = "4c7ab0e7d940a4aaf54a0b6fd21f00ab025eaf025d47f2e085a6269e1842016c"
-- 
1.7.0.4



