Received: from [148.204.65.238] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NhQGt-0007Hy-Rg
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 17:27:39 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o1GGWWFo002477; 
	Tue, 16 Feb 2010 10:32:32 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o1GGWV8l002475;
	Tue, 16 Feb 2010 10:32:31 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Feb 2010 10:32:07 -0600
Message-Id: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6
X-SA-Exim-Connect-IP: 148.204.65.238
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/4] tune-ppc440.inc: add ppc440 to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Tue, 16 Feb 2010 16:27:39 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/include/tune-ppc440.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
index feca186..0c41db4 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -1,4 +1,4 @@
 TARGET_CC_ARCH = "-mcpu=440"
 BASE_PACKAGE_ARCH = "ppc440"
 FEED_ARCH = "ppc440"
-PACKAGE_EXTRA_ARCHS += "ppc440e"
+PACKAGE_EXTRA_ARCHS += "ppc440 ppc440e"
-- 
1.6.6



