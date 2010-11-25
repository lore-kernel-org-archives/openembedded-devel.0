Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLXyN-0006pI-9f
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 10:18:37 +0100
Received: (qmail 17359 invoked by uid 503); 25 Nov 2010 09:21:45 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 09:21:45 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 11:17:21 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 11:17:19 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 10:14:20 +0100
Message-Id: <1290676461-13283-4-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1290676461-13283-3-git-send-email-eric@eukrea.com>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
	<1290676461-13283-2-git-send-email-eric@eukrea.com>
	<1290676461-13283-3-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2999115878566571340
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/5] busybox-static: switch to 1.17.4
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
X-List-Received-Date: Thu, 25 Nov 2010 09:18:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

before removing busybox-1.17.3

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox-static_1.17.3.bb |   11 -----------
 recipes/busybox/busybox-static_1.17.4.bb |   11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 recipes/busybox/busybox-static_1.17.3.bb
 create mode 100644 recipes/busybox/busybox-static_1.17.4.bb

diff --git a/recipes/busybox/busybox-static_1.17.3.bb b/recipes/busybox/busybox-static_1.17.3.bb
deleted file mode 100644
index 325752a..0000000
--- a/recipes/busybox/busybox-static_1.17.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require busybox_${PV}.bb
-PR = "${INC_PR}.0"
-
-FILESPATHPKG =. "busybox-${PV}:"
-S = "${WORKDIR}/busybox-${PV}"
-
-do_configure_append() {
-	sed -i -e '/CONFIG_STATIC/d' .config
-	echo "CONFIG_STATIC=y" >>.config
-}
-
diff --git a/recipes/busybox/busybox-static_1.17.4.bb b/recipes/busybox/busybox-static_1.17.4.bb
new file mode 100644
index 0000000..325752a
--- /dev/null
+++ b/recipes/busybox/busybox-static_1.17.4.bb
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



