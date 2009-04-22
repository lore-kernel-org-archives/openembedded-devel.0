Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LwdGT-0002Lk-PA
	for openembedded-devel@openembedded.org; Wed, 22 Apr 2009 16:17:29 +0200
Received: (qmail 22878 invoked by uid 813007); 22 Apr 2009 14:12:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Apr 2009 14:12:58 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 16:12:57 +0200
Message-Id: <1240409577-12275-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
Subject: [PATCH 1/1] linux.inc: unset CONFIG_LOCALVERSION_AUTO to not get 2.6.27.2-svn8826-dirty26 like names
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
X-List-Received-Date: Wed, 22 Apr 2009 14:17:30 -0000

Year ago we removed CONFIG_LOCALVERSION from .config to get more sane names of
kernels. Today with 2.6.27.2 I got 2.6.27.2-svn8826-dirty26 kernel which was
2.6.27.2-svn8826-dirty9 on device so no modules ;(

This patch changes this by unsetting CONFIG_LOCALVERSION_AUTO variable.

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Acked-by: Koen Kooi <koen@openembedded.org>
---
 recipes/linux/linux.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
index 984efac..5a4a11f 100644
--- a/recipes/linux/linux.inc
+++ b/recipes/linux/linux.inc
@@ -98,8 +98,11 @@ do_configure_prepend() {
             -e '/CONFIG_LOGO=/d' \
             -e '/CONFIG_LOGO_LINUX_CLUT224=/d' \
             -e '/CONFIG_LOCALVERSION/d' \
+            -e '/CONFIG_LOCALVERSION_AUTO/d' \
 	    < '${WORKDIR}/defconfig' >>'${S}/.config'
 
+        echo 'CONFIG_LOCALVERSION=""' >>${S}/.config
+        echo '# CONFIG_LOCALVERSION_AUTO is not set' >>${S}/.config
         #
         # root-over-nfs-over-usb-eth support. Limited, but should cover some cases.
         # Enable this by setting a proper CMDLINE_NFSROOT_USB.
-- 
1.6.3.rc0





