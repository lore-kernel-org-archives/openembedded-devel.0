Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PD2yE-0004OO-2M
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 23:35:22 +0100
Received: (qmail 20552 invoked by uid 503); 1 Nov 2010 21:13:14 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 1 Nov 2010 21:13:14 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Nov 2010 23:34:30 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 1 Nov 2010 23:34:28 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Nov 2010 22:35:30 +0100
Message-Id: <1288647332-20685-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3631027200721268041
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] busybox-static: add the latest version
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
X-List-Received-Date: Mon, 01 Nov 2010 22:35:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

tested using initramfs-image

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox-static_1.17.3.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/busybox/busybox-static_1.17.3.bb

diff --git a/recipes/busybox/busybox-static_1.17.3.bb b/recipes/busybox/busybox-static_1.17.3.bb
new file mode 100644
index 0000000..325752a
--- /dev/null
+++ b/recipes/busybox/busybox-static_1.17.3.bb
@@ -0,0 +1,11 @@
+require busybox_${PV}.bb
+PR = "${INC_PR}.0"
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



