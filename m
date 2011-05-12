Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QKdeY-0005dP-CJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 23:42:38 +0200
Received: (qmail 10084 invoked by uid 503); 12 May 2011 21:09:27 -0000
Received: from b9.ovh.net (HELO mail411.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 12 May 2011 21:09:27 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 May 2011 23:39:52 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 May 2011 23:39:51 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 May 2011 23:31:01 +0200
Message-Id: <1305235863-16025-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1305235863-16025-1-git-send-email-eric@eukrea.com>
References: <1305235863-16025-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6027786626366680394
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 1/3] qt4-native: also build lrelease
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
X-List-Received-Date: Thu, 12 May 2011 21:42:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

as this is nedded to build translations files

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qt4/qt4-native.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4-native.inc b/recipes/qt4/qt4-native.inc
index ee702e9..d99d9de 100644
--- a/recipes/qt4/qt4-native.inc
+++ b/recipes/qt4/qt4-native.inc
@@ -6,7 +6,7 @@ PRIORITY = "optional"
 LICENSE = "GPL"
 PROVIDES = "qt4-tools-native"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit native
 
@@ -51,6 +51,7 @@ TOBUILD = "\
   src/gui \
   src/testlib \
   src/qt3support \
+  tools/linguist/lrelease \
 "
 
 do_compile() {
-- 
1.7.0.4



