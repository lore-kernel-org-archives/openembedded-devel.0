Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58U-0003AQ-OW
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:26 +0200
Received: (qmail 30557 invoked by uid 813007); 1 Jul 2009 18:54:30 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:30 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:20 +0200
Message-Id: <1246474461-16671-14-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011817.02564.marcin@juszkiewicz.com.pl>
References: <200907011817.02564.marcin@juszkiewicz.com.pl>
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH 019/125] glibc 2.6.1: bump PR for oldest-kernel change
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:27 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/glibc/glibc-initial_2.6.1.bb |    2 +-
 recipes/glibc/glibc_2.6.1.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/glibc/glibc-initial_2.6.1.bb b/recipes/glibc/glibc-initial_2.6.1.bb
index 3ad9656..d662970 100644
--- a/recipes/glibc/glibc-initial_2.6.1.bb
+++ b/recipes/glibc/glibc-initial_2.6.1.bb
@@ -3,4 +3,4 @@ require glibc-initial.inc
 
 do_configure_prepend () {
 	unset CFLAGS
-}
\ No newline at end of file
+}
diff --git a/recipes/glibc/glibc_2.6.1.bb b/recipes/glibc/glibc_2.6.1.bb
index ab343ea..c1ca7c0 100644
--- a/recipes/glibc/glibc_2.6.1.bb
+++ b/recipes/glibc/glibc_2.6.1.bb
@@ -1,5 +1,5 @@
 require glibc.inc
-PR = "r15"
+PR = "r16"
 
 PACKAGES_DYNAMIC = "libc6*"
 RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
-- 
1.6.3.1





