Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OvYmP-0006SA-SG
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 18:54:56 +0200
Received: (qmail 30199 invoked by uid 503); 14 Sep 2010 17:06:13 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 14 Sep 2010 17:06:13 -0000
Received: (qmail 32709 invoked by uid 503); 14 Sep 2010 16:37:26 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 14 Sep 2010 16:37:26 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 14 Sep 2010 18:53:56 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 14 Sep 2010 18:53:55 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Sep 2010 18:53:46 +0200
Message-Id: <1284483226-27527-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12151556221217713481
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
Subject: [PATCH] task-qte-toolchain-target: add libqt-embeddedmultimedia4-dev
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
X-List-Received-Date: Tue, 14 Sep 2010 16:54:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/tasks/task-qte-toolchain-target.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/tasks/task-qte-toolchain-target.bb b/recipes/tasks/task-qte-toolchain-target.bb
index f72c788..919af92 100644
--- a/recipes/tasks/task-qte-toolchain-target.bb
+++ b/recipes/tasks/task-qte-toolchain-target.bb
@@ -2,11 +2,12 @@ DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} += " \
         task-sdk-bare \
         qt4-embedded-mkspecs \
+        libqt-embeddedmultimedia4-dev \
         libqt-embeddedphonon4-dev \
         libqt-embedded3support4-dev \
         libqt-embeddedassistantclient4-dev \
@@ -32,4 +33,3 @@ RDEPENDS_${PN} += " \
         libts-dev \
         expat-dev \
         "
-
-- 
1.6.3.3



