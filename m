Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pl5bP-0004hu-Lg
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Feb 2011 21:16:27 +0100
Received: (qmail 16816 invoked by uid 503); 3 Feb 2011 20:18:48 -0000
Received: from b6.ovh.net (HELO mail195.ha.ovh.net) (213.186.33.56)
	by 27.mail-out.ovh.net with SMTP; 3 Feb 2011 20:18:43 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 3 Feb 2011 22:15:26 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 3 Feb 2011 22:15:25 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Feb 2011 21:15:50 +0100
Message-Id: <1296764150-19666-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 926897100434091337
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox-1.18.2: add latest fixes
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
X-List-Received-Date: Thu, 03 Feb 2011 20:16:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

modprobe : revert commit 1396221d5a741ef8e1e8abca88836b341a3cab84
	bb git commit : 8ae386bf195c6ea53232bacd2eb8cf26676962e4
libbb: spawn should remove child which failed to exec
	bb git commit : c5d0f15dbd8087f60b377fa9fc18d08698429189

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.18.2.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox_1.18.2.bb b/recipes/busybox/busybox_1.18.2.bb
index 6356f6c..6c45919 100644
--- a/recipes/busybox/busybox_1.18.2.bb
+++ b/recipes/busybox/busybox_1.18.2.bb
@@ -1,11 +1,13 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI += " \
 	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-modprobe-small.patch;name=patch01 \
 	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-buildsys.patch;name=patch02 \
 	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-hush.patch;name=patch03 \
 	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-wc.patch;name=patch04 \
+	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-libbb.patch;name=patch05 \
+	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-modprobe.patch;name=patch06 \
 	"
 
 SRC_URI[md5sum] = "69a82091e5710b72db5ce0e14e7c0cd7"
@@ -18,3 +20,7 @@ SRC_URI[patch03.md5sum] = "854045f4b713df759b49945550843acf"
 SRC_URI[patch03.sha256sum] = "b70c4406307942f38b2c8d94675b7ca7db8ba0351ae916f838d04856b5aad33f"
 SRC_URI[patch04.md5sum] = "4414f080287c22c9bbc42d1d70f488d4"
 SRC_URI[patch04.sha256sum] = "e2abd861538b586ef4a3439b68a2ef41db99b65e4a37c7442ffc8edfe67ae549"
+SRC_URI[patch05.md5sum] = "354b36a75808e3a477d48d1c582d2265"
+SRC_URI[patch05.sha256sum] = "71e3e1884869e2ee84714874f4792574ae905e83a64b3508c6c16d6661909401"
+SRC_URI[patch06.md5sum] = "bd525ff4850e104a8571bad57b299fc3"
+SRC_URI[patch06.sha256sum] = "624dd02e1cf76dc755e8b9fd1a18f0bb579976793a07e632b0dba061d0d4b79d"
-- 
1.7.0.4



