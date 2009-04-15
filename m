Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lu4Q7-0008HR-Cq
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 14:41:20 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 04F10683D4;
	Wed, 15 Apr 2009 16:36:01 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Apr 2009 16:36:00 +0400
Message-Id: <1239798960-3586-11-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
In-Reply-To: <1239798960-3586-10-git-send-email-khimov@altell.ru>
References: <200904151633.49146.khimov@altell.ru>
	<1239798960-3586-1-git-send-email-khimov@altell.ru>
	<1239798960-3586-2-git-send-email-khimov@altell.ru>
	<1239798960-3586-3-git-send-email-khimov@altell.ru>
	<1239798960-3586-4-git-send-email-khimov@altell.ru>
	<1239798960-3586-5-git-send-email-khimov@altell.ru>
	<1239798960-3586-6-git-send-email-khimov@altell.ru>
	<1239798960-3586-7-git-send-email-khimov@altell.ru>
	<1239798960-3586-8-git-send-email-khimov@altell.ru>
	<1239798960-3586-9-git-send-email-khimov@altell.ru>
	<1239798960-3586-10-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 11/11] package.bbclass: add multilib libdir to search path
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
X-List-Received-Date: Wed, 15 Apr 2009 12:41:48 -0000

---
 classes/package.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 7a61c5a..e251e73 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -564,7 +564,11 @@ python package_do_shlibs() {
 		return
 		
 	lib_re = re.compile("^lib.*\.so")
-	libdir_re = re.compile(".*/lib$")
+	multilibdir = bb.data.getVar('LIB_MULTILIB', d, 1)
+	if not multilibdir:
+		libdir_re = re.compile(".*/lib$")
+	else:
+		libdir_re = re.compile(".*/(lib|%s)$" % (multilibdir))
 
 	packages = bb.data.getVar('PACKAGES', d, 1)
 
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



