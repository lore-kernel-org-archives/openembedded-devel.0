Received: from mail.mlbassoc.com ([65.100.170.105] helo=zeus)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@zeus>) id 1TOtVw-0000Vu-2P
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 19:04:08 +0200
Received: by zeus (Postfix, from userid 996)
	id 8A2BC520FAC; Thu, 18 Oct 2012 10:51:30 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2012 10:51:29 -0600
Message-Id: <1350579089-23342-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] [meta-oe] libav: Fix git URI
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
X-List-Received-Date: Thu, 18 Oct 2012 17:04:08 -0000

Specifying SRCREV and branch in the git SRC_URI confuses the bitbake
fetcher.  This ends up with a saved tarball which contains neither
the SRCREV nor the branch, which in turn means the git tree needs
to be fetched every time even though a saved tarball has been created.

Simply removing the branch (which is redundant anyway) from the SRC_URI
makes everything happy.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-multimedia/libav/libav_0.8.3.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
index 66a32c9..f9a2e06 100644
--- a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
+++ b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 PV = "0.8.3+git${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # When bumping SRCREV make sure you bump PR here and in dependant
 # recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
 # changes
 SRCREV = "2fb4be9a99a2c2a9435339830e3d940171cc0d9b"
-SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.8"
+SRC_URI = "git://git.libav.org/libav.git;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5



