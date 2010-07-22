Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <zlo@zlo.nu>)
	id 1Obs2w-0000ah-1o for openembedded-devel@lists.openembedded.org;
	Thu, 22 Jul 2010 11:27:19 +0200
Received: from localhost.localdomain (seven.iphion.nl [80.255.245.169])
	by mzh.zlo.nu (Postfix) with ESMTP id 8D2531402C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 11:26:18 +0200 (CEST)
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Jul 2010 11:26:18 +0200
Message-Id: <1279790778-32476-1-git-send-email-zlo@zlo.nu>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: zlo@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] coreutils: LICENSE for versions after 6.9 is GPLv3.
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
X-List-Received-Date: Thu, 22 Jul 2010 09:27:42 -0000

From: Marc Olzheim <marc@iphion.nl>

---
 recipes/coreutils/coreutils-6.0.inc |    2 ++
 recipes/coreutils/coreutils.inc     |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/coreutils/coreutils-6.0.inc b/recipes/coreutils/coreutils-6.0.inc
index 41f26cf..fb5abbc 100644
--- a/recipes/coreutils/coreutils-6.0.inc
+++ b/recipes/coreutils/coreutils-6.0.inc
@@ -1,5 +1,7 @@
 require coreutils.inc
 
+LICENSE = GPLv2
+
 SRC_URI = "\
   ftp://alpha.gnu.org/gnu/coreutils/coreutils-${PV}.tar.bz2 \
   file://futimens.patch \
diff --git a/recipes/coreutils/coreutils.inc b/recipes/coreutils/coreutils.inc
index 9242c51..e10896c 100644
--- a/recipes/coreutils/coreutils.inc
+++ b/recipes/coreutils/coreutils.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "A collection of core GNU utilities."
 HOMEPAGE = "http://www.gnu.org/software/coreutils"
-LICENSE = "GPL"
+LICENSE = "GPLv3"
 SECTION = "base"
 RREPLACES_${PN} = "textutils shellutils fileutils"
 RPROVIDES_${PN} = "textutils shellutils fileutils"
-- 
1.7.0.4



