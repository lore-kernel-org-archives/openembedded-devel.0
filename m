Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LoxW6-0006em-8I
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 12:17:54 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 97EE868377;
	Wed,  1 Apr 2009 14:15:28 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Apr 2009 14:15:28 +0400
Message-Id: <1238580928-1072-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH] package.bbclass: fix globbing for mask-like files
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
X-List-Received-Date: Wed, 01 Apr 2009 10:17:54 -0000

When a package contains two files like "name*" and "name*smth" OE can't
properly package those, looping infinetely trying to build file list. The
reason is that first file name globs to two files and OE adds them both
into the list, then globs the first one again and gets two same files, etc.

Fix that.
---
 classes/package.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 7a61c5a..8a77369 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -384,8 +384,12 @@ python populate_packages () {
 			globbed = glob.glob(file)
 			if globbed:
 				if [ file ] != globbed:
-					files += globbed
-					continue
+					if not file in globbed:
+						files += globbed
+						continue
+					else:
+						globbed.remove(file)
+						files += globbed
 			if (not os.path.islink(file)) and (not os.path.exists(file)):
 				continue
 			if file in seen:
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



