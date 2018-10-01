Return-Path: <bunk@stusta.de>
X-Greylist: delayed 387 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 01 Oct 2018 14:35:06 UTC
Received: from mail.stusta.mhn.de (mail.stusta.net [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8A69579F7D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 14:35:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 42P4Qb18zXzwN
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Oct 2018 16:28:39 +0200 (CEST)
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2018 17:28:33 +0300
Message-Id: <20181001142833.5461-1-bunk@stusta.de>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] nano: Depend only on ncurses-terminfo-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2018 14:35:06 -0000

nano is a popular choice for a small user-friendly editor
on embedded systems.

Depending only on ncurses-terminfo-base instead of ncurses-terminfo
saves over 3 MB, and is sufficient in practice.

The vim recipe already depends only on ncurses-terminfo-base.
---
 meta-oe/recipes-support/nano/nano_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nano/nano_3.0.bb b/meta-oe/recipes-support/nano/nano_3.0.bb
index 43ab9343b..2c7fbd549 100644
--- a/meta-oe/recipes-support/nano/nano_3.0.bb
+++ b/meta-oe/recipes-support/nano/nano_3.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SECTION = "console/utils"
 DEPENDS = "ncurses file"
-RDEPENDS_${PN} = "ncurses-terminfo"
+RDEPENDS_${PN} = "ncurses-terminfo-base"
 
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
-- 
2.11.0


