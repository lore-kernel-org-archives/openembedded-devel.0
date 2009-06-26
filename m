Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MKAUq-0005BE-9y
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 14:25:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id A4D5B4EE261;
	Fri, 26 Jun 2009 08:14:13 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25940-07; Fri, 26 Jun 2009 08:14:13 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 83E0A4EE2CC; Fri, 26 Jun 2009 08:14:13 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id A2F634EE257;
	Fri, 26 Jun 2009 08:14:12 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 7F14F4147E; Fri, 26 Jun 2009 08:14:12 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jun 2009 08:14:10 -0400
Message-Id: <1246018450-23097-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH][resend] glibc-initial.inc: remove FILESPATHPKG setting to fix glibc-initial_2.3.2
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
X-List-Received-Date: Fri, 26 Jun 2009 12:25:36 -0000

All v2.5+ recipes add glibc-2.4 as a FILESDIR or FILESPATHPKG if they
need it, so it's not required in the inc anymore.

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
1.6.3



