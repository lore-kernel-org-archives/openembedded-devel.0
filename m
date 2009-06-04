Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MCGnj-00037t-C3
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 19:32:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id E2E944075B4;
	Thu,  4 Jun 2009 13:23:22 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02228-08; Thu,  4 Jun 2009 13:23:22 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id C4F84407B11; Thu,  4 Jun 2009 13:23:22 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 5167F4057D5;
	Thu,  4 Jun 2009 13:23:21 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 44FEA1B471D; Thu,  4 Jun 2009 13:23:21 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2009 13:23:19 -0400
Message-Id: <1244136199-20093-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
In-Reply-To: <h08u4t$oui$1@ger.gmane.org>
References: <h08u4t$oui$1@ger.gmane.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] vim: fix alternative when prefix is /usr
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
X-List-Received-Date: Thu, 04 Jun 2009 17:32:27 -0000

Fix 2d3750e3dae84c89c9c749f95cf6b3b6cca3e8ce.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/vim/vim.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/vim/vim.inc b/recipes/vim/vim.inc
index a766acc..c160448 100644
--- a/recipes/vim/vim.inc
+++ b/recipes/vim/vim.inc
@@ -3,7 +3,7 @@ SECTION = "console/utils"
 DEPENDS = "ncurses"
 LICENSE = "vim"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "ftp://ftp.vim.org/pub/vim/unix/vim-${PV}.tar.bz2 \
 	   file://configure.patch;patch=1"
@@ -32,6 +32,6 @@ FILES_vim-tutor = "${datadir}/vim/vim${VIMVER}/tutor ${bindir}/vimtutor"
 #	       /bin /sbin /lib/*/ /lib/*.so* ${datadir}/vim"
 
 ALTERNATIVE_NAME = "vi"
-ALTERNATIVE_PATH = "vim"
+ALTERNATIVE_PATH = "${bindir}/vim"
 ALTERNATIVE_LINK = "${base_bindir}/vi"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.6.3



