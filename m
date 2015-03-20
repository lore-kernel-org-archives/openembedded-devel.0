Return-Path: <funman@videolan.org>
X-Greylist: delayed 451 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Mar 2015 14:22:36 UTC
Received: from smtp21.services.sfr.fr (smtp21.services.sfr.fr [93.17.128.2])
	by mail.openembedded.org (Postfix) with ESMTP id 5282773A17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 14:22:36 +0000 (UTC)
Received: from filter.sfr.fr (localhost [62.147.165.143])
	by msfrf2112.sfr.fr (SMTP Server) with ESMTP id 0C8367000148
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 15:15:05 +0100 (CET)
Authentication-Results: sfrmc.priv.atos.fr; dkim=none (no signature);
	dkim-adsp=none (no policy) header.from=funman@videolan.org
Received: from localhost.localdomain
	(lns-bzn-49f-62-147-165-143.adsl.proxad.net [62.147.165.143])
	by msfrf2112.sfr.fr (SMTP Server) with ESMTP id A360970000BD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2015 15:15:04 +0100 (CET)
X-SFR-UUID: 20150320141504669.A360970000BD@msfrf2112.sfr.fr
From: =?iso-8859-1?q?Rafa=EBl_Carr=E9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2015 15:15:03 +0100
Message-Id: <1426860903-30149-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] vim: add checksum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2015 14:22:36 -0000

---
 meta-oe/recipes-support/vim/vim_7.4.481.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recipes-support/vim/vim_7.4.481.bb
index afdea84..ac59077 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
@@ -10,6 +10,10 @@ SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
            file://disable_acl_header_check.patch;patchdir=.. \
            file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
 "
+
+SRC_URI[md5sum] = "5fd5d754581a673a25733c12367cf9d2"
+SRC_URI[sha256sum] = "e2cc416dabea503e9e5631afc21bb00dcbfb9d05481641b75f247fd89ff4d7e8"
+
 SRCREV = "v7-4-481"
 
 S = "${WORKDIR}/vim/src"
-- 
2.1.0

