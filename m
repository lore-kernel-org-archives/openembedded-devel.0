Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OsuZK-0006QM-BW
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 11:34:26 +0200
Received: (qmail 22262 invoked by uid 503); 7 Sep 2010 09:44:50 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 7 Sep 2010 09:44:50 -0000
Received: (qmail 4232 invoked by uid 503); 7 Sep 2010 09:17:56 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 7 Sep 2010 09:17:54 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Sep 2010 11:33:40 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Sep 2010 11:33:40 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 11:32:29 +0200
Message-Id: <1283851949-24255-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <AANLkTi=LswfyrP_t-5G2iipd6umjkAmdwFiECLmZXMXW@mail.gmail.com>
References: <AANLkTi=LswfyrP_t-5G2iipd6umjkAmdwFiECLmZXMXW@mail.gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 501025458820590921
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
Subject: [PATCH v2] mercurial-native: add recipe
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
X-List-Received-Date: Tue, 07 Sep 2010 09:34:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* mercurial is a distributed SCM
* having the native recipe inside OpenEmbedded gives the
possibility to fetch code from mercurial's repositories
without the need to have mercurial installed on the host

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
v2: improve recipe + ostylize it

 recipes/mercurial/mercurial-native_1.6.3.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mercurial/mercurial-native_1.6.3.bb

diff --git a/recipes/mercurial/mercurial-native_1.6.3.bb b/recipes/mercurial/mercurial-native_1.6.3.bb
new file mode 100644
index 0000000..717f8f6
--- /dev/null
+++ b/recipes/mercurial/mercurial-native_1.6.3.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "The Mercurial distributed SCM"
+HOMEPAGE = "http://mercurial.selenic.com/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+DEPENDS = "python-native"
+PR = "r0"
+
+SRC_URI = "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz;name=src"
+SRC_URI[src.md5sum] = "fcd61edc488d1b9aa831dde6f14d9a13"
+SRC_URI[src.sha256sum] = "57e5d26d35fbec71206378e3af111193e6eee7bb1dfb6447bbc4b9e03ce937bd"
+
+S = "${WORKDIR}/mercurial-${PV}"
+
+inherit native
+
+EXTRA_OEMAKE = "STAGING_LIBDIR=${STAGING_LIBDIR} STAGING_INCDIR=${STAGING_INCDIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} PREFIX=${prefix}"
+
+do_install () {
+        oe_runmake -e install DESTDIR=${D} PREFIX=${prefix}
+}
-- 
1.6.3.3



