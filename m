Received: from [206.46.173.19] (helo=vms173019pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjMJa-00085X-33
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 00:33:52 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGM00BI5HEMB9WS@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	16 Mar 2009 18:32:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 354476B83D7; Mon,
	16 Mar 2009 19:32:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2009 19:32:44 -0400
Message-id: <1237246365-32076-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.0.6
In-reply-to: <1237246365-32076-1-git-send-email-denis@denix.org>
References: <1237246365-32076-1-git-send-email-denis@denix.org>
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50, FM_FAKE_HELO_VERIZON,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] base.bbclass: fix base_get_scmbasepath() to look for recipes/ and fall back to packages/ while parsing BBFILES
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
X-List-Received-Date: Mon, 16 Mar 2009 23:33:52 -0000

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/base.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index 18afc1a..0848870 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -773,7 +773,13 @@ python base_do_unpack() {
 def base_get_scmbasepath(d):
 	import bb
 	path_to_bbfiles = bb.data.getVar( 'BBFILES', d, 1 ).split()
-	return path_to_bbfiles[0][:path_to_bbfiles[0].rindex( "packages" )]
+
+	try:
+		index = path_to_bbfiles[0].rindex( "recipes" )
+	except ValueError:
+		index = path_to_bbfiles[0].rindex( "packages" )
+
+	return path_to_bbfiles[0][:index]
 
 def base_get_metadata_monotone_branch(d):
 	monotone_branch = "<unknown>"
-- 
1.6.0.6



