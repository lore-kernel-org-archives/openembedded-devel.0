Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NUjdT-0002LH-Ky
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 17:30:30 +0100
Received: (qmail 27700 invoked by uid 813007); 12 Jan 2010 16:28:20 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 Jan 2010 16:28:20 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jan 2010 17:28:02 +0100
Message-Id: <1263313682-14996-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [STABLE][PATCH] jamvm-initial: add libffi-native dependency
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
X-List-Received-Date: Tue, 12 Jan 2010 16:30:31 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/jamvm/jamvm-initial_1.5.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/jamvm/jamvm-initial_1.5.0.bb b/recipes/jamvm/jamvm-initial_1.5.0.bb
index 1566deb..4ef56c1 100644
--- a/recipes/jamvm/jamvm-initial_1.5.0.bb
+++ b/recipes/jamvm/jamvm-initial_1.5.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "A compact Java Virtual Machine which conforms to the JVM specificatio
 HOMEPAGE = "http://jamvm.sourceforge.net/"
 LICENSE = "GPL"
 
-DEPENDS = "zlib-native classpath-initial jikes-initial"
+DEPENDS = "zlib-native classpath-initial jikes-initial libffi-native"
 
 PR = "r1"
 
-- 
1.6.6





