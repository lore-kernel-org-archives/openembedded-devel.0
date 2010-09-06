Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OsjZz-0006iu-ER
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 23:50:28 +0200
Received: (qmail 2038 invoked by uid 503); 6 Sep 2010 21:54:02 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 6 Sep 2010 21:54:02 -0000
Received: (qmail 29217 invoked by uid 503); 6 Sep 2010 21:27:16 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 6 Sep 2010 21:27:15 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Sep 2010 23:42:59 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 6 Sep 2010 23:42:58 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Sep 2010 23:41:49 +0200
Message-Id: <1283809310-29893-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6945113576459840841
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] mercurial-native: add recipe
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
X-List-Received-Date: Mon, 06 Sep 2010 21:50:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* mercurial is a distributed SCM
* having the native recipe inside OpenEmbedded gives the
possibility to fetch code from mercurial's repositories
without the need to have mercurial installed on the host

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/mercurial/mercurial-native_1.6.3.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mercurial/mercurial-native_1.6.3.bb

diff --git a/recipes/mercurial/mercurial-native_1.6.3.bb b/recipes/mercurial/mercurial-native_1.6.3.bb
new file mode 100644
index 0000000..58fcaf1
--- /dev/null
+++ b/recipes/mercurial/mercurial-native_1.6.3.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "The Mercurial distributed SCM"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+
+SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz;name=src"
+
+DEPENDS = "python-native"
+PR = "r0"
+
+S = "${WORKDIR}/mercurial-${PV}"
+EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
+	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${STAGING_DIR_NATIVE}/usr"
+
+do_install () {
+        install -d ${STAGING_DIR_NATIVE}/usr
+        oe_runmake install
+}
+
+inherit native
+
+SRC_URI[src.md5sum] = "fcd61edc488d1b9aa831dde6f14d9a13"
+SRC_URI[src.sha256sum] = "57e5d26d35fbec71206378e3af111193e6eee7bb1dfb6447bbc4b9e03ce937bd"
+
-- 
1.6.3.3



