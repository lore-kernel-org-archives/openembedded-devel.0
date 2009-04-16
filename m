Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LuRvM-0000Cp-R4
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 15:46:45 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id 61598683CA;
	Thu, 16 Apr 2009 17:42:39 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2009 17:42:39 +0400
Message-Id: <1239889359-13953-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be 0
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
X-List-Received-Date: Thu, 16 Apr 2009 13:46:45 -0000

By default cmake guesses whether install shared libaries with exec
permissions or not based on host distribution, so this behaviour
changes from host to host. OpenEmbedded assumes shared libraries to
be with exec permissions (reverse way brakes stripping, for example),
so let's force this in cmake configure invocation.
---
 classes/cmake.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index b5b7b86..b45ba78 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -21,6 +21,7 @@ cmake_do_configure() {
   cmake ${OECMAKE_SOURCEPATH} \
     -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
     -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
+    -DCMAKE_INSTALL_SO_NO_EXE=0 \
     ${EXTRA_OECMAKE} \
     -Wno-dev
 }
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



