Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1NrY4Y-0005gC-2A
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 15:48:49 +0100
Received: from localhost.localdomain (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTP id DAA11685D4;
	Tue, 16 Mar 2010 17:44:17 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Mar 2010 17:41:51 +0300
Message-Id: <1268750512-11047-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
X-Altell-MailScanner-ID: DAA11685D4.471A1
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ipsec-tools: convert to INC_PR
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
X-List-Received-Date: Tue, 16 Mar 2010 14:48:49 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/ipsec-tools/ipsec-tools.inc      |    2 ++
 recipes/ipsec-tools/ipsec-tools_0.6.6.bb |    2 +-
 recipes/ipsec-tools/ipsec-tools_0.6.7.bb |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/ipsec-tools/ipsec-tools.inc b/recipes/ipsec-tools/ipsec-tools.inc
index ed265f1..f79210d 100644
--- a/recipes/ipsec-tools/ipsec-tools.inc
+++ b/recipes/ipsec-tools/ipsec-tools.inc
@@ -9,6 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ipsec-tools/ipsec-tools-${PV}.tar.bz2 \
            file://racoon-search-missing.patch;patch=1 \
            file://gcc-4.2.patch;patch=1"
 
+INC_PR = "r1"
+
 inherit autotools
 
 # Options:
diff --git a/recipes/ipsec-tools/ipsec-tools_0.6.6.bb b/recipes/ipsec-tools/ipsec-tools_0.6.6.bb
index 1ccc60c..efac342 100644
--- a/recipes/ipsec-tools/ipsec-tools_0.6.6.bb
+++ b/recipes/ipsec-tools/ipsec-tools_0.6.6.bb
@@ -1,3 +1,3 @@
-PR = "r1"
+PR = "${INC_PR}.0"
 
 require ipsec-tools.inc
diff --git a/recipes/ipsec-tools/ipsec-tools_0.6.7.bb b/recipes/ipsec-tools/ipsec-tools_0.6.7.bb
index 3f23b19..efac342 100644
--- a/recipes/ipsec-tools/ipsec-tools_0.6.7.bb
+++ b/recipes/ipsec-tools/ipsec-tools_0.6.7.bb
@@ -1,3 +1,3 @@
-PR = "r0"
+PR = "${INC_PR}.0"
 
 require ipsec-tools.inc
-- 
1.5.6.5



