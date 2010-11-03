Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PDiEI-0003uy-Rh
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 19:38:39 +0100
Received: (qmail 29626 invoked by uid 503); 3 Nov 2010 18:16:21 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 3 Nov 2010 18:16:21 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 3 Nov 2010 20:37:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 3 Nov 2010 20:37:45 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 19:38:50 +0100
Message-Id: <1288809530-19973-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12391935850804391241
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
Cc: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH] meta-toolchain-qte: fill OE_QMAKE_AR
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
X-List-Received-Date: Wed, 03 Nov 2010 18:38:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

this allows the sdk to be used to compile libraries, else, we get :
make[1]: cqs : command not found

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/meta/meta-toolchain-qte.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/meta/meta-toolchain-qte.bb b/recipes/meta/meta-toolchain-qte.bb
index 708803b..058f0d8 100644
--- a/recipes/meta/meta-toolchain-qte.bb
+++ b/recipes/meta/meta-toolchain-qte.bb
@@ -1,5 +1,5 @@
 # Qt Embedded toolchain
-PR = "r4"
+PR = "r5"
 TOOLCHAIN_HOST_TASK = "task-qte-toolchain-host"
 TOOLCHAIN_TARGET_TASK = "task-qte-toolchain-target"
 
@@ -15,6 +15,7 @@ do_populate_sdk_append() {
        echo 'export OE_QMAKE_CC=${TARGET_SYS}-gcc' >> $script
        echo 'export OE_QMAKE_CXX=${TARGET_SYS}-g++' >> $script
        echo 'export OE_QMAKE_LINK=${TARGET_SYS}-g++' >> $script
+       echo 'export OE_QMAKE_AR=${TARGET_SYS}-ar' >> $script
        echo 'export OE_QMAKE_LIBDIR_QT=${SDKPATH}/${TARGET_SYS}/${libdir}' >> $script
        echo 'export OE_QMAKE_INCDIR_QT=${SDKPATH}/${TARGET_SYS}/${includedir}/${QT_DIR_NAME}' >> $script
        echo 'export OE_QMAKE_MOC=${SDKPATH}/bin/moc4' >> $script
-- 
1.6.3.3



