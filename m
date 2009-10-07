Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MvZCf-0003wB-Bm
	for openembedded-devel@openembedded.org; Wed, 07 Oct 2009 18:17:28 +0200
Received: (qmail 26014 invoked by uid 813007); 7 Oct 2009 16:16:37 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Oct 2009 16:16:37 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2009 18:10:19 +0200
Message-Id: <1254931819-14007-2-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.4.3
In-Reply-To: <1254931819-14007-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1254931819-14007-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [STABLE][PATCH 2/2] glibc-initial.inc: remove FILESPATHPKG setting to fix glibc-initial_2.3.2
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
X-List-Received-Date: Wed, 07 Oct 2009 16:17:28 -0000

From: Michael Smith <msmith@cbnco.com>

All v2.5+ recipes add glibc-2.4 as a FILESDIR or FILESPATHPKG if they
need it, so it's not required in the inc anymore.

Ref:
http://projects.linuxtogo.org/pipermail/openembedded-devel/2009-June/011692.html

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/glibc/glibc-initial.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/glibc/glibc-initial.inc b/recipes/glibc/glibc-initial.inc
index cd65924..6468f0d 100644
--- a/recipes/glibc/glibc-initial.inc
+++ b/recipes/glibc/glibc-initial.inc
@@ -1,7 +1,6 @@
 SECTION = "libs"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
-FILESPATHPKG =. "glibc-2.4:"
 
 PACKAGES = ""
 PACKAGES_DYNAMIC = ""
-- 
1.6.4.3





