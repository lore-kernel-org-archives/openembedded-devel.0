Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P1JyC-00006I-2i
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 16:18:49 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id B36FA491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 16:18:36 +0200 (CEST)
Received: from localhost.localdomain ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 30 Sep 2010 16:18:36 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 16:18:08 +0200
Message-Id: <1285856288-31061-1-git-send-email-t.fromm@dresearch.de>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 30 Sep 2010 14:18:36.0350 (UTC)
	FILETIME=[5EED2DE0:01CB60AA]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] vim-7.2: provide correct VIMGUI option (unbreaks build)
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
X-List-Received-Date: Thu, 30 Sep 2010 14:18:49 -0000

vim-7.2.bb sports VIMGUI="none", resulting in "--enable-gui=none". Vim
configure, however, does not know about this option, does not understand
that we don't want any X support, and tries to link libSM and possibly
libXpm when building. This breaks the build for systems without X.

The patch changes VIMGUI to VIMGUI="no", as "--enable-gui=no" is
understood by Vim configure, and behaves as expected.

Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
---
 recipes/vim/vim_7.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/vim/vim_7.2.bb b/recipes/vim/vim_7.2.bb
index eafbeef..7d74d08 100644
--- a/recipes/vim/vim_7.2.bb
+++ b/recipes/vim/vim_7.2.bb
@@ -4,14 +4,14 @@ VIMVER = "72"
 VIMFEATURES ?= "big"
 
 # GUI type - gvim recipe sets "gtk2"
-VIMGUI ?= "none"
+VIMGUI ?= "no"
 
 # gvim recipes uses "--with-x"
 VIMX ?= "--without-x"
 
 require vim.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 # 001-411.diff contains 411 patches fetched from upstream
 SRC_URI += "file://001-411.diff;apply=no"
-- 
1.7.0.4



