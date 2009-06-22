Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MIhcJ-0005OA-Nw
	for openembedded-devel@openembedded.org; Mon, 22 Jun 2009 13:23:15 +0200
Received: (qmail 26793 invoked by uid 813007); 22 Jun 2009 11:12:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jun 2009 11:12:18 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jun 2009 13:11:36 +0200
Message-Id: <1245669099-30990-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906221206.37496.marcin@juszkiewicz.com.pl>
References: <200906221206.37496.marcin@juszkiewicz.com.pl>
Cc: Martin Dietze <martin@the-little-red-haired-girl.org>
Subject: [STABLE][PATCH 079/125] Fixed broken download URL for elvis
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
X-List-Received-Date: Mon, 22 Jun 2009 11:23:16 -0000

From: Martin Dietze <martin@the-little-red-haired-girl.org>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 recipes/elvis/elvis_2.2.0.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/recipes/elvis/elvis_2.2.0.bb b/recipes/elvis/elvis_2.2.0.bb
index c0f9262..f038c6b 100644
--- a/recipes/elvis/elvis_2.2.0.bb
+++ b/recipes/elvis/elvis_2.2.0.bb
@@ -4,8 +4,7 @@ PRIORITY = "optional"
 LICENSE = "Perl Clarified Artistic License"
 DEPENDS = "ncurses"
 
-#SRC_URI = "ftp://ftp.cs.pdx.edu/pub/elvis/elvis-2.2_0.tar.gz"
-SRC_URI = "http://www.fh-wedel.de/pub/elvis/elvis-2.2_0.tar.gz"
+SRC_URI = "ftp://ftp.cs.pdx.edu/pub/elvis/elvis-2.2_0.tar.gz"
 S = "${WORKDIR}/elvis-2.2_0"
 
 CFLAGS_prepend = " -I. -Iosunix -L${STAGING_LIBDIR} "
-- 
1.6.3.1





