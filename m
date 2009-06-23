Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1zc-0006Fd-5I
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:08:40 +0200
Received: (qmail 2902 invoked by uid 813007); 23 Jun 2009 08:57:37 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:57:37 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:56:53 +0200
Message-Id: <1245747417-11163-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230940.05121.marcin@juszkiewicz.com.pl>
References: <200906230940.05121.marcin@juszkiewicz.com.pl>
Subject: [STABLE][PATCH 052/125] evtest: Fixed GNU_HASH QA error.
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
X-List-Received-Date: Tue, 23 Jun 2009 09:08:40 -0000

From: Theodore A. Roth <taroth@gmail.com>

Signed-off-by: Theodore A. Roth <taroth@gmail.com>
Acked-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/evtest/evtest_1.23.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/evtest/evtest_1.23.bb b/recipes/evtest/evtest_1.23.bb
index 4c5d195..6cf87be 100644
--- a/recipes/evtest/evtest_1.23.bb
+++ b/recipes/evtest/evtest_1.23.bb
@@ -11,6 +11,8 @@ PR = "r0"
 SRC_URI = "http://beagleboard.googlecode.com/files/evtest.c"
 S = "${WORKDIR}"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_compile() {
     ${CC} evtest.c -o evtest -I${STAGING_INCDIR} -L${STAGING_LIBDIR}
 }
-- 
1.6.3.1





