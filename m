Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@build2.altell.local>) id 1Nu5BV-0001Hv-4T
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 15:34:26 +0100
Received: from build2.altell.local (build2.altell.local [192.168.1.26])
	by mail.altell.local (Postfix) with ESMTPS id 18EC368801;
	Tue, 23 Mar 2010 17:31:04 +0300 (MSK)
Received: from rik by build2.altell.local with local (Exim 4.69)
	(envelope-from <rik@build2.altell.local>)
	id 1Nu53Y-0005Rm-Dm; Tue, 23 Mar 2010 17:26:08 +0300
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 17:26:08 +0300
Message-Id: <1269354368-20910-4-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1269354368-20910-3-git-send-email-khimov@altell.ru>
References: <1269346975-842-2-git-send-email-khimov@altell.ru>
	<1269354368-20910-1-git-send-email-khimov@altell.ru>
	<1269354368-20910-2-git-send-email-khimov@altell.ru>
	<1269354368-20910-3-git-send-email-khimov@altell.ru>
X-Altell-MailScanner-ID: 18EC368801.A6C74
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: rik@build2.altell.local
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: rik@build2.altell.local
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] sphyrna-python: fix missing python-native build dependency
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
X-List-Received-Date: Tue, 23 Mar 2010 14:34:26 -0000

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 recipes/sphyrna/sphyrna-python_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/sphyrna/sphyrna-python_svn.bb b/recipes/sphyrna/sphyrna-python_svn.bb
index 1e3c412..5b4ee8a 100644
--- a/recipes/sphyrna/sphyrna-python_svn.bb
+++ b/recipes/sphyrna/sphyrna-python_svn.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Sphyrna - Hammerhead Reverse Engineering"
 HOMEPAGE = "http://projects.linuxtogo.org/projects/sphyrna"
 LICENSE = "GPLv2"
-DEPENDS = "readline"
+DEPENDS = "readline python-native"
 PV = "0.0+svnr${SRCPV}"
 PR = "r1"
 
-- 
1.5.6.5



