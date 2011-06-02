Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QS9BU-0000px-WD
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 16:47:41 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 7BE48799015; Thu,  2 Jun 2011 16:44:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from localhost (p5489A9CE.dip.t-dialin.net [84.137.169.206])
	by gravedo.de (Postfix) with ESMTPSA id B6E77798D74;
	Thu,  2 Jun 2011 16:44:30 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jun 2011 16:44:27 +0200
Message-Id: <1307025867-12077-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] minimal: add weak assigned DISTRO_FEED_CONFIGS variable
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
X-List-Received-Date: Thu, 02 Jun 2011 14:47:41 -0000

Some distros are based on the minimal distro but want to supply another feed configuration.
As minimal uses DISTRO_EXTRA_RDEPENDS to pull distro-feed-configs into the builded image
the new weak assigned variable DISTRO_FEED_CONFIGS makes it possible to specify another
feed configuration.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 conf/distro/minimal.conf |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 18bcfae..edac24f 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -53,6 +53,8 @@ INHERIT += "package_ipk"
 IMAGE_FSTYPES ?= "tar.gz jffs2"
 PREFERRED_PKG_FORMAT ?= "ipk"
 
+DISTRO_FEED_CONFIGS ?= "distro-feed-configs"
+
 # Put links to sources in deploy/sources to make it easier for people to be GPL compliant
 INHERIT += "src_distribute_local"
 SRC_DIST_LOCAL ?= "symlink"
@@ -135,7 +137,7 @@ DISTRO_EXTRA_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "task-cl
 # util-linux-ng-mount util-linux-ng-umount: busybox mount is broken
 # angstrom-libc-fixup-hack: fixes an obscure bug with libc.so symlink
 DISTRO_EXTRA_RDEPENDS += "\
-  distro-feed-configs \
+  ${DISTRO_FEED_CONFIGS} \
   util-linux-ng-mount util-linux-ng-umount \
   angstrom-libc-fixup-hack \
   ${DISTRO_EXTRA_APPS} \
-- 
1.7.4.1



