Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MPVNo-0000y1-Hg
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jul 2009 07:44:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 31973505C36;
	Sat, 11 Jul 2009 01:31:28 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16888-09; Sat, 11 Jul 2009 01:31:28 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id CC04E505C73; Sat, 11 Jul 2009 01:31:27 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 9E86F30D861;
	Sat, 11 Jul 2009 01:31:26 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 9D54DA26471; Sat, 11 Jul 2009 01:31:26 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jul 2009 01:31:07 -0400
Message-Id: <1247290267-16928-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <1247290267-16928-1-git-send-email-msmith@cbnco.com>
References: <1247290267-16928-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/2] package.bbclass: preserve modes for non-empty dirs
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
X-List-Received-Date: Sat, 11 Jul 2009 05:44:24 -0000

Extend commit b1cbbae1 by setting the mode for all dirs, not just
empty dirs.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 classes/package.bbclass |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index f6bd7c5..fc12932 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -377,10 +377,14 @@ python populate_packages () {
 				file = '.' + file
 			if not os.path.islink(file):
 				if os.path.isdir(file):
+					bb.mkdirhier(os.path.join(root,file))
+					os.chmod(os.path.join(root,file),
+							os.stat(file).st_mode)
 					newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]
 					if newfiles:
 						files += newfiles
-						continue
+					continue
+
 			globbed = glob.glob(file)
 			if globbed:
 				if [ file ] != globbed:
@@ -395,10 +399,6 @@ python populate_packages () {
 			if file in seen:
 				continue
 			seen.append(file)
-			if os.path.isdir(file) and not os.path.islink(file):
-				bb.mkdirhier(os.path.join(root,file))
-				os.chmod(os.path.join(root,file), os.stat(file).st_mode)
-				continue
 			fpath = os.path.join(root,file)
 			dpath = os.path.dirname(fpath)
 			bb.mkdirhier(dpath)
-- 
1.6.3



