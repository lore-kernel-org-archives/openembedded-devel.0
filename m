Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihai.prica@intel.com>) id 1UZfkv-0002qQ-2z
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 13:08:29 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 May 2013 03:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="298792853"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2013 03:50:22 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2013 13:50:17 +0300
Message-Id: <1367923819-5612-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH 1/3] python-feedparser: Changed from distutils to setuptools
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
X-List-Received-Date: Tue, 07 May 2013 11:08:38 -0000

This package uses setuptools not distutils.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../python/python-feedparser_5.1.3.bb              |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
index 38cd53f..92d5568 100644
--- a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
+++ b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
@@ -10,5 +10,5 @@ SRC_URI[sha256sum] = "7f6507d400d07edfd1ea8205da36808009b0c539f5b8a6e0ab54337b95
 
 S = "${WORKDIR}/feedparser-${PV}"
 
-inherit distutils
+inherit setuptools
 
-- 
1.7.9.5



