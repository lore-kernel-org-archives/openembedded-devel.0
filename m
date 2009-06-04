Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MCGVs-0005Zx-Kg
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 19:14:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 28BEB4CE8EE;
	Thu,  4 Jun 2009 13:04:56 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31705-09; Thu,  4 Jun 2009 13:04:56 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 0829C4D0C9A; Thu,  4 Jun 2009 13:04:55 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 452DA4BA33B;
	Thu,  4 Jun 2009 13:04:55 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 2BE081B4700; Thu,  4 Jun 2009 13:04:55 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2009 13:04:48 -0400
Message-Id: <1244135088-14240-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] iputils 20071127: add docbook dependency to fix build
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
X-List-Received-Date: Thu, 04 Jun 2009 17:14:00 -0000

Looks like the newer snapshots don't include manpages, so
docbook-utils-native is required to build them.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/iputils/iputils_20071127.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/iputils/iputils_20071127.bb b/recipes/iputils/iputils_20071127.bb
index 9235a65..9bd47d8 100644
--- a/recipes/iputils/iputils_20071127.bb
+++ b/recipes/iputils/iputils_20071127.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
 tracepath, tracepath6, ping, ping6 and arping."
 SECTION = "console/network"
 LICENSE ="BSD"
+DEPENDS = "docbook-utils-native"
 
 #Need more testing
 DEFAULT_PREFERENCE = "-1"
@@ -37,7 +38,7 @@ FILES_${PN}-doc		= "${mandir}/man8"
 do_compile () {
 	oe_runmake 'CC=${CC}' \
 		   KERNEL_INCLUDE="${STAGING_INCDIR}" \
-		   LIBC_INCLUDE="${STAGING_INCDIR}"
+		   LIBC_INCLUDE="${STAGING_INCDIR}" all man
 }
 
 do_install () {
-- 
1.6.3



