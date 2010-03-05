Received: from [148.204.64.197] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1NnhRI-00061f-0Y
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 01:00:16 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o25NFTE3014773; 
	Fri, 5 Mar 2010 17:15:29 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o25NFTU2014772;
	Fri, 5 Mar 2010 17:15:29 -0600
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Mar 2010 17:15:18 -0600
Message-Id: <1267830919-14718-6-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1267830919-14718-5-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-2-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-3-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-4-git-send-email-aalonso00@gmail.com>
	<1267830919-14718-5-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.64.197
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,BAYES_00,HELO_LH_LD,
	NO_DNS_FOR_FROM,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 6/7] tune-ppc440.inc: add base to extra archs
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
X-List-Received-Date: Sat, 06 Mar 2010 00:00:16 -0000

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 conf/machine/include/tune-ppc440.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
index feca186..1c94a34 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -1,4 +1,4 @@
 TARGET_CC_ARCH = "-mcpu=440"
 BASE_PACKAGE_ARCH = "ppc440"
 FEED_ARCH = "ppc440"
-PACKAGE_EXTRA_ARCHS += "ppc440e"
+PACKAGE_EXTRA_ARCHS += "${BASE_PACKAGE_ARCH} ppc440e"
-- 
1.6.6.1



