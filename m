Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PnsUZ-0001HR-Le
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:52:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 6D484314D9FA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 13:51:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Jwhr2NycHhuV
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 13:51:45 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id A6F1B314D9F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 13:51:44 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 12:51:44 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:51:41 +0000
Message-Id: <1297428703-2330-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
References: <1297428703-2330-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/4] package.bbclass: remove superfluous whitespace characters from RDEPENDS
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
X-List-Received-Date: Fri, 11 Feb 2011 12:52:55 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/package.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 678ffa9..ce7ff86 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -517,7 +517,7 @@ python populate_packages () {
 						break
 			if found == False:
 				bb.note("%s contains dangling symlink to %s" % (pkg, l))
-		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+		bb.data.setVar('RDEPENDS_' + pkg, " ".join(rdepends), d)
 }
 populate_packages[dirs] = "${D}"
 
@@ -897,7 +897,7 @@ python read_shlibdeps () {
 				fd.close()
 				for l in lines:
 					rdepends.append(l.rstrip())
-		bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+		bb.data.setVar('RDEPENDS_' + pkg, " ".join(rdepends), d)
 }
 
 python package_depchains() {
-- 
1.7.2.3



