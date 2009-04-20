Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LvvR1-0006ge-Nl
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:29:27 +0200
Received: (qmail 21678 invoked by uid 813007); 20 Apr 2009 15:25:08 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Apr 2009 15:25:08 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Apr 2009 17:24:58 +0200
Message-Id: <1240241104-21935-6-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
In-Reply-To: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 1/1] e2fsprogs 1.41.4: depends on gettext-native, due to the removal of do_configure
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
X-List-Received-Date: Mon, 20 Apr 2009 15:29:28 -0000

From: Denys Dmytriyenko <denis@denix.org>

---
 recipes/e2fsprogs/e2fsprogs_1.41.4.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
index 177d9af..c2b9232 100644
--- a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
+++ b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
@@ -2,7 +2,9 @@ require e2fsprogs.inc
 
 SRC_URI += "file://mkinstalldirs.patch;patch=1"
 
-PR = "r2"
+DEPENDS += "gettext-native"
+
+PR = "r3"
 
 do_compile_prepend () {
 	find ./ -print|xargs chmod u=rwX
-- 
1.6.2.3





