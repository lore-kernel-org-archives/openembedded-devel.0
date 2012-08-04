Received: from mail.mlbassoc.com ([65.100.170.105] helo=zeus)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@zeus>) id 1Sxepp-0003VH-Gt
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 15:56:05 +0200
Received: by zeus (Postfix, from userid 996)
	id 85E3E520F7B; Sat,  4 Aug 2012 07:44:32 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Aug 2012 07:44:31 -0600
Message-Id: <1344087871-24898-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] media-ctl: Fix build with latest automake
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
X-List-Received-Date: Sat, 04 Aug 2012 13:56:05 -0000

Update to latest upstream version to fix build with automake >= 1.12

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../recipes-multimedia/v4l2apps/media-ctl_git.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
index 76d811b..1034d8c 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/media-ctl_git.bb
@@ -3,10 +3,10 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d749e86a105281d7a44c2328acebc4b0"
 
 SRC_URI = "git://git.ideasonboard.org/media-ctl.git;protocol=git"
-SRCREV = "46bec667b675573cf1ce698c68112e3dbd31930e"
+SRCREV = "f2f1e160ce411a08836e31c36a09c9dd55ec9784"
 
 PV = "0.0.1"
-PR = "r1"
+PR = "r2"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
1.7.9.5



