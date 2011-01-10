Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PcKuZ-0000La-7W
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 17:48:03 +0100
Received: (qmail 27379 invoked by uid 503); 10 Jan 2011 17:25:41 -0000
Received: from b6.ovh.net (HELO mail610.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 10 Jan 2011 17:25:41 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Jan 2011 18:47:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 10 Jan 2011 18:47:32 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 17:47:24 +0100
Message-Id: <1294678044-11675-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4045358366247595337
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] linux-libc-headers_2.6.37: fix SRC_URI
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
X-List-Received-Date: Mon, 10 Jan 2011 16:48:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

actual SRC_URI can't work because :
- linux-libc-headers-2.6.37.tar.bz2 or linux-libc-headers-native-2.6.37.tar.bz2
don't exist on kernel.org's FTP
- there is no file://defconfig

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../linux-libc-headers_2.6.37.bb                   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb b/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb
index c8b3871..67bc5f0 100644
--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.37.bb
@@ -7,8 +7,8 @@ DEPENDS += "unifdef-native"
 PR = "r0"
 
 COMPATIBLE_TARGET_SYS = "."
-SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=kernel \
-           file://defconfig "
+SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=kernel \
+          "
 
 SRC_URI[kernel.md5sum] = "c8ee37b4fdccdb651e0603d35350b434"
 SRC_URI[kernel.sha256sum] = "edbf091805414739cf57a3bbfeba9e87f5e74f97e38f04d12060e9e0c71e383a"
-- 
1.6.3.3



