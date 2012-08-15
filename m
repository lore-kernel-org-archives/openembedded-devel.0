Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T1cP0-0000q5-3e
	for openembedded-devel@lists.linuxtogo.org;
	Wed, 15 Aug 2012 14:08:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Aug 2012 04:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,772,1336374000"; d="scan'208";a="201584369"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.76])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2012 04:55:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.linuxtogo.org
Date: Wed, 15 Aug 2012 12:55:39 +0100
Message-Id: <1345031739-8374-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] freerdp-extension-xpunlimited: inherit gitpkgv
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
X-List-Received-Date: Wed, 15 Aug 2012 12:08:46 -0000

If you refer to GITPKGVTAG you need to inherit gitpkgv or the result is
a parsing error.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
index c9721f4..ed7fc4d 100644
--- a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
@@ -12,7 +12,7 @@ PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 PR = "r0"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake gitpkgv
 
 SRCREV = "e952627ff4c116b4ce8541c91cb96bd5422c4a0d"
 SRC_URI = "git://github.com/OSSystems/FreeRDP-Extension-XPUnlimited.git;protocol=git"
-- 
1.7.9.5



