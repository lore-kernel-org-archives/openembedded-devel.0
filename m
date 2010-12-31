Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PYnrv-0003Sw-42
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 23:54:43 +0100
Received: (qmail 4718 invoked by uid 503); 31 Dec 2010 22:36:50 -0000
Received: from b9.ovh.net (HELO mail27.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 31 Dec 2010 22:36:50 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Jan 2011 00:54:26 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 1 Jan 2011 00:54:25 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Dec 2010 23:49:04 +0100
Message-Id: <1293835744-10837-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1293835744-10837-2-git-send-email-eric@eukrea.com>
References: <1293835744-10837-1-git-send-email-eric@eukrea.com>
	<1293835744-10837-2-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6854760108376108363
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 3/3] busybox-static: add 1.18.1
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
X-List-Received-Date: Fri, 31 Dec 2010 22:54:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox-static_1.18.1.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/busybox/busybox-static_1.18.1.bb

diff --git a/recipes/busybox/busybox-static_1.18.1.bb b/recipes/busybox/busybox-static_1.18.1.bb
new file mode 100644
index 0000000..58aca93
--- /dev/null
+++ b/recipes/busybox/busybox-static_1.18.1.bb
@@ -0,0 +1,10 @@
+require busybox_${PV}.bb
+
+FILESPATHPKG =. "busybox-${PV}:"
+S = "${WORKDIR}/busybox-${PV}"
+
+do_configure_append() {
+	sed -i -e '/CONFIG_STATIC/d' .config
+	echo "CONFIG_STATIC=y" >>.config
+}
+
-- 
1.6.3.3



