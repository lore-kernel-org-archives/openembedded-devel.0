Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBwS4-0007Ed-3e
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:25:38 +0200
Received: (qmail 2185 invoked by uid 503); 29 Oct 2010 21:03:50 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Oct 2010 21:03:49 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Oct 2010 23:24:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Oct 2010 23:24:46 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 23:25:42 +0200
Message-Id: <1288387543-1277-6-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1288387543-1277-5-git-send-email-eric@eukrea.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
	<1288387543-1277-2-git-send-email-eric@eukrea.com>
	<1288387543-1277-3-git-send-email-eric@eukrea.com>
	<1288387543-1277-4-git-send-email-eric@eukrea.com>
	<1288387543-1277-5-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4295871096254606670
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
Subject: [PATCH 6/7] qt-4.7: rename qtdemo to qtdemoE for qt4-embedded
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
X-List-Received-Date: Fri, 29 Oct 2010 21:25:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

in order to stay consistant with 4.6.x releases.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qt4/qt-4.7.0.inc          |    5 +++++
 recipes/qt4/qt4-embedded_4.7.0.bb |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt-4.7.0.inc b/recipes/qt4/qt-4.7.0.inc
index cf4b0d8..ba2b25a 100644
--- a/recipes/qt4/qt-4.7.0.inc
+++ b/recipes/qt4/qt-4.7.0.inc
@@ -60,6 +60,11 @@ do_install_append() {
 	for i in rcc uic moc ; do
 		install -m 0755 ${S}/bin/$i ${D}${bindir}/
 	done
+
+        #Append an E to the qtdemo file
+        if [ -n "${QT_LIBINFIX}" ] ; then
+                mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
+        fi
 }
 
 SRC_URI[md5sum] = "3a2f25b9b115037277f4fb759194a7a5"
diff --git a/recipes/qt4/qt4-embedded_4.7.0.bb b/recipes/qt4/qt4-embedded_4.7.0.bb
index 1cd43a6..7e3d4b8 100644
--- a/recipes/qt4/qt4-embedded_4.7.0.bb
+++ b/recipes/qt4/qt4-embedded_4.7.0.bb
@@ -2,7 +2,7 @@ DEFAULT_PREFERENCE = "-1"
 
 require qt4-embedded.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
-- 
1.6.3.3



