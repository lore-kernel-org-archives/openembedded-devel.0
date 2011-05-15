Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QLeqQ-0007fE-2z
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 May 2011 19:11:06 +0200
Received: (qmail 15401 invoked by uid 503); 15 May 2011 16:37:34 -0000
Received: from b9.ovh.net (HELO mail413.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 15 May 2011 16:37:34 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 May 2011 19:08:16 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 15 May 2011 19:08:13 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 May 2011 18:58:46 +0200
Message-Id: <1305478726-19795-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 611645125539114313
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox-1.18.4: add latest fix
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
X-List-Received-Date: Sun, 15 May 2011 17:11:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hush: fix misparsing of "... do eval a= ...". Closes 3721

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.18.4.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/busybox/busybox_1.18.4.bb b/recipes/busybox/busybox_1.18.4.bb
index 0a62d33..68a023a 100644
--- a/recipes/busybox/busybox_1.18.4.bb
+++ b/recipes/busybox/busybox_1.18.4.bb
@@ -1,8 +1,11 @@
 require busybox_1.1x.inc
 
-SRC_URI += "file://fix-iptunnel-location.patch"
+SRC_URI += "file://fix-iptunnel-location.patch \
+	http://busybox.net/downloads/fixes-1.18.4/busybox-1.18.4-hush.patch;name=patch01"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI[md5sum] = "b03c5b46ced732679e525a920a1a62f5"
 SRC_URI[sha256sum] = "4d24d37bd6f1bd153e8cf9a984ec2f32f18464f73ca535e2cc2e8be9694097fa"
+SRC_URI[patch01.md5sum] = "a81f2d7d3bdf1a35ab77c4414a530d38"
+SRC_URI[patch01.sha256sum] = "c87e73ad942d53c8a2a5ffe6037c1cdf52d4b20d3f29caae5fffc7a99009b7cb"
-- 
1.7.0.4



