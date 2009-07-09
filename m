Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MOuda-00043g-Ko
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 16:30:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id B139A5013BC;
	Thu,  9 Jul 2009 10:17:28 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06976-05; Thu,  9 Jul 2009 10:17:28 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 8C9F95013BB; Thu,  9 Jul 2009 10:17:28 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 5B96844AC1F;
	Thu,  9 Jul 2009 10:17:27 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 52DFA40151; Thu,  9 Jul 2009 10:17:27 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jul 2009 10:16:56 -0400
Message-Id: <1247149017-23395-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1247149017-23395-1-git-send-email-msmith@cbnco.com>
References: <1247149017-23395-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/3] glibc-stage.inc: don't overwrite gnu/stubs.h
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
X-List-Received-Date: Thu, 09 Jul 2009 14:30:17 -0000

"make install" installs the full version. do_stage() was overwriting
it with an empty file that tricked openssh into calling setlogin()
and logging benign errors.

Also removing a couple of lines not required anymore, I think because
"make install-headers install-lib" was switched to "make install"
in e96e82cd.

Tested with 2.6.1 on x86.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/glibc/glibc-stage.inc |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/recipes/glibc/glibc-stage.inc b/recipes/glibc/glibc-stage.inc
index 2b7b303..cb9ab04 100644
--- a/recipes/glibc/glibc-stage.inc
+++ b/recipes/glibc/glibc-stage.inc
@@ -5,12 +5,10 @@ do_stage() {
 		   '${STAGING_DIR_HOST}${layout_base_libdir}/libc.so.6' \
 		   install
 
-	install -d ${STAGING_INCDIR}/gnu \
-		   ${STAGING_INCDIR}/bits \
-		   ${STAGING_INCDIR}/rpcsvc
-	install -m 0644 ${S}/include/gnu/stubs.h ${STAGING_INCDIR}/gnu/
-	install -m 0644 ${B}/bits/stdio_lim.h ${STAGING_INCDIR}/bits/
-	install -m 0644 misc/syscall-list.h ${STAGING_INCDIR}/bits/syscall.h
+	# "make install" omits some (not all) RPC headers that other distros
+	# ship.
+	install -d ${STAGING_INCDIR}/rpcsvc
+
 	for r in ${rpcsvc}; do
 		h=`echo $r|sed -e's,\.x$,.h,'`
 		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${STAGING_INCDIR}/rpcsvc/
-- 
1.6.3



