Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1Nx3KQ-0008HE-T1
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 21:11:51 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id B7EEA2DBED; Wed, 31 Mar 2010 22:59:38 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Mar 2010 22:59:30 +0400
Message-Id: <1270061972-5564-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE,UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] bitbake.conf: add STAGING_SBINDIR_NATIVE
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
X-List-Received-Date: Wed, 31 Mar 2010 19:11:51 -0000

Makes referencing it easier.

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 conf/bitbake.conf |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index b941b90..2193553 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -300,6 +300,7 @@ STAGING_DIR = "${TMPDIR}/staging"
 STAGING_DIR_JAVA = "${STAGING_DIR}/java"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
+STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
 STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
 STAGING_BINDIR_CROSS_BASEPKG = "${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
@@ -414,7 +415,7 @@ EXTRA_IMAGEDEPENDS = ""
 
 CROSS_DIR = "${TMPDIR}/cross/${BASE_PACKAGE_ARCH}"
 CROSS_DATADIR = "${CROSS_DIR}/share"
-PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/${bindir_cross}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
+PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_SBINDIR_NATIVE}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/${bindir_cross}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
 export PATH
 
 ##################################################################
-- 
1.6.4.2



