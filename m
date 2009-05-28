Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M9kOT-00009P-Tf
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 20:31:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 406E44C67DD;
	Thu, 28 May 2009 14:23:37 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10955-04; Thu, 28 May 2009 14:23:37 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id DD3D64C67DA; Thu, 28 May 2009 14:23:36 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 4AF104C678A;
	Thu, 28 May 2009 14:23:33 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 271A91B48AD; Thu, 28 May 2009 14:23:33 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2009 14:23:32 -0400
Message-Id: <1243535013-10090-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/2] tcpdump: fix mix of tabs and spaces in do_configure()
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
X-List-Received-Date: Thu, 28 May 2009 18:32:01 -0000

I randomly picked tabs.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/tcpdump/tcpdump_3.9.7.bb |    4 ++--
 recipes/tcpdump/tcpdump_4.0.0.bb |    6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/tcpdump/tcpdump_3.9.7.bb b/recipes/tcpdump/tcpdump_3.9.7.bb
index ba9710d..962663f 100644
--- a/recipes/tcpdump/tcpdump_3.9.7.bb
+++ b/recipes/tcpdump/tcpdump_3.9.7.bb
@@ -15,6 +15,6 @@ EXTRA_OECONF = "--without-crypto"
 do_configure() {
 	gnu-configize
 	oe_runconf
-        sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
-        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
+	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
+	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
 }
diff --git a/recipes/tcpdump/tcpdump_4.0.0.bb b/recipes/tcpdump/tcpdump_4.0.0.bb
index 537cb36..c807fb1 100644
--- a/recipes/tcpdump/tcpdump_4.0.0.bb
+++ b/recipes/tcpdump/tcpdump_4.0.0.bb
@@ -18,8 +18,8 @@ EXTRA_OECONF = "--without-crypto"
 
 do_configure() {
 	gnu-configize
-    autoconf
+	autoconf
 	oe_runconf
-        sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
-        sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
+	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
+	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
 }
-- 
1.5.6.5



