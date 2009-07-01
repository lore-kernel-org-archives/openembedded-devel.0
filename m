Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MM58s-0003As-11
	for openembedded-devel@openembedded.org; Wed, 01 Jul 2009 21:06:50 +0200
Received: (qmail 31136 invoked by uid 813007); 1 Jul 2009 18:54:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jul 2009 18:54:53 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 20:54:51 +0200
Message-Id: <1246474496-16704-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <200907011818.18407.marcin@juszkiewicz.com.pl>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 036/125] u-boot_git.bb : Update FILESPATHPKG to include u-boot-git directory.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:06:50 -0000

From: Philip Balister <philip@balister.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/u-boot/u-boot_git.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index e5a8d5d..eee6d97 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,6 +1,8 @@
 require u-boot.inc
 PR ="r22"
 
+FILESPATHPKG =. "u-boot-git:"
+
 SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git "
 SRCREV_davinci-sffsdr = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
 SRCREV_davinci-dvevm = "4b50cd12a3b3c644153c4cf393f4a4c12289e5aa"
-- 
1.6.3.1





