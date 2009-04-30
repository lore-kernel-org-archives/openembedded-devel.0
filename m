Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LzRaZ-0007h4-0F
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 10:25:51 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id C50046842B;
	Thu, 30 Apr 2009 12:20:09 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Apr 2009 12:20:08 +0400
Message-Id: <1241079609-5912-3-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.4
In-Reply-To: <1241079609-5912-2-git-send-email-khimov@altell.ru>
References: <be7a9f3d0904270832j4832bc6fqcf058fdfc3d8479@mail.gmail.com>
	<1241079609-5912-1-git-send-email-khimov@altell.ru>
	<1241079609-5912-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-Spam-Status: No
Subject: [PATCH 3/4] coreutils-native: make mandatory dep for all packages
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
X-List-Received-Date: Thu, 30 Apr 2009 08:25:51 -0000

Gives us guaranteed sane GNU coreutils on any host. Should greatly ease
support for various non-GNU host systems and allow to safely remove some other
native packages like 'install-native'.
---
 classes/base.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/base.bbclass b/classes/base.bbclass
index e5fd814..270b05d 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -125,9 +125,11 @@ def base_dep_prepend(d):
 	# the case where host == build == target, for now we don't work in
 	# that case though.
 	#
-	deps = "shasum-native "
-	if bb.data.getVar('PN', d, True) == "shasum-native":
+	deps = "shasum-native coreutils-native"
+	if bb.data.getVar('PN', d, True) == "shasum-native" or bb.data.getVar('PN', d, True) == "stagemanager-native":
 		deps = ""
+	if bb.data.getVar('PN', d, True) == "coreutils-native":
+		deps = "shasum-native"
 
 	# INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
 	# we need that built is the responsibility of the patch function / class, not
-- 
1.6.2.4


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



