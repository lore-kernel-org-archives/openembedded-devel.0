Received: from 27.mail-out.ovh.net ([91.121.30.210])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PevSf-0007aw-FG
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 21:13:57 +0100
Received: (qmail 28991 invoked by uid 503); 17 Jan 2011 20:15:49 -0000
Received: from b9.ovh.net (HELO mail623.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 17 Jan 2011 20:15:43 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Jan 2011 22:14:13 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Jan 2011 22:14:11 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 21:12:37 +0100
Message-Id: <1295295157-20506-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11750735854407036233
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] busybox-1.18.2: add fix
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
X-List-Received-Date: Mon, 17 Jan 2011 20:13:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

- insmod: check for module read errors
bb's commit id : 094cc51e50bdb877fa4c245dbde47e4dfbf94387

- following Bernhard Reutner-Fisher's request, busybox patches
don't have anymore timestamp inside which should make them fetchable
instead of integrating them in OE so I try this way.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.18.2.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes/busybox/busybox_1.18.2.bb b/recipes/busybox/busybox_1.18.2.bb
index ca36a52..71b50c8 100644
--- a/recipes/busybox/busybox_1.18.2.bb
+++ b/recipes/busybox/busybox_1.18.2.bb
@@ -1,6 +1,11 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+SRC_URI += " \
+	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-modprobe-small.patch;name=patch01 \
+	"
 
 SRC_URI[md5sum] = "69a82091e5710b72db5ce0e14e7c0cd7"
 SRC_URI[sha256sum] = "aa7e1cec8cd9c7f4e56098b9e4bb2ab5d593d5a35f766ad9e6a312289bf57080"
-
+SRC_URI[patch01.md5sum] = "dda72eaf33d19d6a0ac78e46e9411cfd"
+SRC_URI[patch01.sha256sum] = "ed5d83040414d035138bf484ccd514817342b143baff43ffff6ba556952de7ed"
-- 
1.6.3.3



