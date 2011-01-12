Received: from 19.77.mail-out.ovh.net ([87.98.169.40] helo=77.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pd9nI-0008NR-0Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 00:07:56 +0100
Received: (qmail 28420 invoked by uid 503); 12 Jan 2011 21:36:19 -0000
Received: from 64.mail-out.ovh.net (91.121.185.65)
	by 77.mail-out.ovh.net with SMTP; 12 Jan 2011 21:36:19 -0000
Received: (qmail 28749 invoked by uid 503); 12 Jan 2011 21:01:59 -0000
Received: from b6.ovh.net (HELO mail30.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 12 Jan 2011 21:01:59 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 Jan 2011 23:20:44 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 Jan 2011 23:20:43 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 22:20:29 +0100
Message-Id: <1294867230-7827-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1294867230-7827-1-git-send-email-eric@eukrea.com>
References: <1294867230-7827-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1957658463811251530
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-Ovh-Tracer-Id: 2221119043085970761
Subject: [PATCH 2/3] busybox 1.18.1: add latest fix
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
X-List-Received-Date: Wed, 12 Jan 2011 23:07:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* httpd: send correct mtime for .gz filesmaster
* patch fetched from git as per blindvt request

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.18.1.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_1.18.1.bb
index a2b4475..f337eef 100644
--- a/recipes/busybox/busybox_1.18.1.bb
+++ b/recipes/busybox/busybox_1.18.1.bb
@@ -1,5 +1,5 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 SRC_URI += " \
 	file://busybox-1.18.1-hush.patch \
@@ -8,9 +8,10 @@ SRC_URI += " \
 	file://busybox-1.18.1-mkswap.patch \
 	file://busybox-1.18.1-warning.patch \
 	file://busybox-1.18.1-modprobe-small.patch \
-	file://busybox-1.18.1-tftp.patch \
+	http://git.busybox.net/busybox/patch/id=8030a1484917d5b71d5ccd1a1d28a29da7a3d7f0;apply=yes;name=bb181-01 \
 	"
 
 SRC_URI[md5sum] = "f15fe752d8b7012aa5e59f83b88ccb1c"
 SRC_URI[sha256sum] = "33eb25ea7b20c727c3af769256b21408a1ac1f927ff9f89a1f1e3767c18c9967"
-
+SRC_URI[bb181-01.md5sum] = "fe58a0e758c2581fdd2554186089b03b"
+SRC_URI[bb181-01.sha256sum] = "f776d0b4ba525c62abe5e91f1432773eca92904cdecbdf48546a9271166cd896"
-- 
1.6.3.3



