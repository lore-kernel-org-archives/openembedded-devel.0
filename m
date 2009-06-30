Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MLRtF-0001an-Sh
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 03:12:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id D2BE24DCA22;
	Mon, 29 Jun 2009 21:00:20 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11692-02; Mon, 29 Jun 2009 21:00:20 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id B1CDC4EAA56; Mon, 29 Jun 2009 21:00:20 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id EF3C63740AB;
	Mon, 29 Jun 2009 21:00:19 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id ECD384147E; Mon, 29 Jun 2009 21:00:19 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jun 2009 20:58:46 -0400
Message-Id: <1246323526-16557-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1246323526-16557-1-git-send-email-msmith@cbnco.com>
References: <Pine.LNX.4.64.0906292052420.3731@juice.ott.cti.com>
	<1246323526-16557-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH v2 2/2] oe-checksums-sorter.py: speed up about 4X using a hash
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
X-List-Received-Date: Tue, 30 Jun 2009 01:12:06 -0000

OK, this saves a grand total of one second a few times a week, but it
was bugging me...

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 contrib/source-checker/oe-checksums-sorter.py |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/contrib/source-checker/oe-checksums-sorter.py b/contrib/source-checker/oe-checksums-sorter.py
index ccf76d4..a72b202 100755
--- a/contrib/source-checker/oe-checksums-sorter.py
+++ b/contrib/source-checker/oe-checksums-sorter.py
@@ -87,18 +87,18 @@ if inplace:
 checksums_parser = ConfigParser.ConfigParser()
 checksums_parser.readfp(infp)
 
-item = 1;
-files_total   = len(checksums_parser.sections())
-
 new_list = []
+seen = {}
 
 for source in checksums_parser.sections():
     archive = source.split("/")[-1]
     md5 = checksums_parser.get(source, "md5")
     sha = checksums_parser.get(source, "sha256")
 
-    if new_list.count([archive, source, md5, sha]) < 1:
-        new_list += [[archive, source, md5, sha]]
+    tup = (archive, source, md5, sha)
+    if not seen.has_key(tup):
+        new_list.append(tup)
+        seen[tup] = 1
 
 new_list.sort()
 
-- 
1.6.3



