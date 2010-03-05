Received: from [148.204.65.238] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NnLyl-0002Cq-4t
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 02:05:33 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o251ACoI017227; 
	Thu, 4 Mar 2010 19:10:12 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o251ACmW017226;
	Thu, 4 Mar 2010 19:10:12 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Mar 2010 19:09:33 -0600
Message-Id: <1267751376-17182-2-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1267751376-17182-1-git-send-email-aalonso00@gmail.com>
References: <1267751376-17182-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.65.238
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/5] tune-ppc440.inc: add base arch to package extra archs
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
X-List-Received-Date: Fri, 05 Mar 2010 01:05:33 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/include/tune-ppc440.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
index 0c41db4..1c94a34 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -1,4 +1,4 @@
 TARGET_CC_ARCH = "-mcpu=440"
 BASE_PACKAGE_ARCH = "ppc440"
 FEED_ARCH = "ppc440"
-PACKAGE_EXTRA_ARCHS += "ppc440 ppc440e"
+PACKAGE_EXTRA_ARCHS += "${BASE_PACKAGE_ARCH} ppc440e"
-- 
1.6.6.1



