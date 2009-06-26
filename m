Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MKAVS-0005CF-ND
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 14:26:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 016354EC47C;
	Fri, 26 Jun 2009 08:14:52 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26402-05-2; Fri, 26 Jun 2009 08:14:51 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id BB7AD4EE3A7; Fri, 26 Jun 2009 08:14:51 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id D3FF64EE2BB;
	Fri, 26 Jun 2009 08:14:45 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id C7DBC4147E; Fri, 26 Jun 2009 08:14:45 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jun 2009 08:14:41 -0400
Message-Id: <1246018481-24033-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH][resend] iputils 20071127: add docbook dependency to fix build
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
X-List-Received-Date: Fri, 26 Jun 2009 12:26:14 -0000

Looks like the newer snapshots don't include manpages, so
docbook-utils-native is required to build them.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/iputils/iputils_20071127.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/iputils/iputils_20071127.bb b/recipes/iputils/iputils_20071127.bb
index 821d6c9..3d0c8dc 100644
--- a/recipes/iputils/iputils_20071127.bb
+++ b/recipes/iputils/iputils_20071127.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "Utilities for the IP protocol, including traceroute6, \
 tracepath, tracepath6, ping, ping6 and arping."
 SECTION = "console/network"
 LICENSE ="BSD"
+DEPENDS = "docbook-utils-native"
 
 PR = "r1"
 
@@ -40,7 +41,7 @@ FILES_${PN}-doc		= "${mandir}/man8"
 do_compile () {
 	oe_runmake 'CC=${CC}' \
 		   KERNEL_INCLUDE="${STAGING_INCDIR}" \
-		   LIBC_INCLUDE="${STAGING_INCDIR}"
+		   LIBC_INCLUDE="${STAGING_INCDIR}" all man
 }
 
 do_install () {
-- 
1.6.3



