Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PqlTE-0000HP-0l
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Feb 2011 12:59:28 +0100
Received: (qmail invoked by alias); 19 Feb 2011 11:58:12 -0000
Received: from p4FE0EDBB.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [79.224.237.187]
	by mail.gmx.net (mp033) with SMTP; 19 Feb 2011 12:58:12 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18tVvVmQ4MtulECgZxNj9nvVZ0nH5kyvyIJ4GD1Na
	SB+5QGLPhfMSRa
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Feb 2011 12:53:39 +0100
Message-Id: <1298116419-18277-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH] cross.bbclass: Fix many QA RPATH errors for distros preferring libtool-2.2
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
X-List-Received-Date: Sat, 19 Feb 2011 11:59:28 -0000

* This patch removes the absolute path in sysroots/<arch>/usr/lib/libstdc++.la
*
* It was build tested wih clean tmp for xfce46-image. Additional known
* QA-RPATH-error-candidates were checked for successful build:
*
* aspell-0.60.6-r0
* curl-7.21.2-r4.0
* clutter-box2d-0.10.0-r2.0+git4e72b9c135a9439b82d801c62422531db611f98b
* enchant-1.6.0-r2
* gnome-vfs-2.24.1-r3
* libcdio-0.82-r3.0
* libsoup-2.2.100-r1:
* neon-0.25.5-r4
* schroedinger-1.0.9-r0
* tiff-3.9.4+4.0.0beta6-r0
*
* Build environment was (RPATH QA errors treated as fatal / acl fixed manually)
*
* BB_VERSION        = "1.10.2"
* METADATA_BRANCH   = "cross-bbclass-test"
* METADATA_REVISION = "a44300e"
* TARGET_ARCH       = "arm"
* TARGET_OS         = "linux-gnueabi"
* MACHINE           = "overo"
* DISTRO            = "angstrom"
* DISTRO_VERSION    = "2010.7-test-20110219"
* TARGET_FPU        = "hard"
*
* Notes:
* - To have effect, gcc-cross has to be rebuild (changing all gcc packed
*   was not an option)
* - This patch does not affect libtool-2.4 distos
* - The story is found at
*   http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-February/030115.html

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 classes/cross.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 1a6d906..50c0f63 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -75,6 +75,6 @@ sysroot_stage_all() {
 
 #
 # Cross .la files have more path issues we have to correct only for libtool < 2.4
-SYSROOTEXTRALIBDIRSED_OLD = " -e \"/^libdir=/s,.*,libdir=${STAGING_DIR_TARGET}${target_libdir},g\" -e \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\""
+SYSROOTEXTRALIBDIRSED_OLD = " -e \"/^libdir=/s,.*,libdir=${target_libdir},g\" -e \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\""
 
 SYSROOTEXTRALIBDIRSED = "${@["${SYSROOTEXTRALIBDIRSED_OLD}",""][("${LIBTOOL_HAS_SYSROOT}" == "yes")]}"
-- 
1.7.2.3



