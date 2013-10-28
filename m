Return-Path: <christoph.settgast@methodpark.de>
Received: from mail.methodpark.de (mail.methodpark.de [212.204.89.242])
	by mail.openembedded.org (Postfix) with ESMTP id 43BD461005
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 13:51:06 +0000 (UTC)
Received: from localhost (virusgate [212.204.89.246])
	by mail.methodpark.de (Postfix) with ESMTP id EF16D3A2241
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:51:07 +0100 (CET)
X-Virus-Scanned: by amavisd-new-2.6.6 (20110518) (Debian) at methodpark.de
Received: from mail.methodpark.de ([IPv6:::ffff:212.204.89.242])
	by localhost (virusgate.methodpark.de [::ffff:212.204.89.246])
	(amavisd-new, port 10024)
	with ESMTP id gvjtP6EA4SVy; Mon, 28 Oct 2013 14:51:07 +0100 (CET)
Received: from cl002400.er.methodpark.de (unknown [10.10.101.91])
	by mail.methodpark.de (Postfix) with ESMTP id D6E3E3A223D;
	Mon, 28 Oct 2013 14:51:07 +0100 (CET)
From: Christoph Settgast <christoph.settgast@methodpark.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2013 14:51:03 +0100
Message-Id: <1382968263-15474-1-git-send-email-christoph.settgast@methodpark.de>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] maliit: Follow move to github
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
X-List-Received-Date: Mon, 28 Oct 2013 13:51:06 -0000

The maliit sources are hosted on github now, update the SRC_URI
accordingly.

Signed-off-by: Christoph Settgast <christoph.settgast@methodpark.de>
---
 meta-oe/recipes-support/maliit/maliit-framework_git.bb | 2 +-
 meta-oe/recipes-support/maliit/maliit-plugins_git.bb   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index 15719f4..5e30df1 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=5c917f6ce94ceb8d8d5e16e2fca5b9ad"
 inherit autotools qt4x11 gtk-immodules-cache
 
 
-SRC_URI = "git://gitorious.org/maliit/maliit-framework.git;branch=master \
+SRC_URI = "git://github.com/maliit/framework.git;branch=master \
     file://0001-Fix-MALIIT_INSTALL_PRF-to-allow-the-build-with-opene.patch \
     file://0001-Fix-QT_IM_PLUGIN_PATH-to-allow-openembedded-to-build.patch \
     file://0001-Link-to-libmaliit-1-0-in-inputcontext-plugin.patch \
diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
index 0fc7c68..326c9fa 100644
--- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "maliit-framework"
 
 RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
 
-SRC_URI = "git://gitorious.org/maliit/maliit-plugins.git;branch=master"
+SRC_URI = "git://github.com/maliit/plugins.git;branch=master"
 
 SRCREV = "0760e585df494b394df1b887e5138ffef19c481f"
 PV = "0.92.3+git${SRCPV}"
-- 
1.8.1.2


