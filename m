Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3qCh-0000ra-86
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 16:49:31 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 07:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="284541575"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 07:33:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 15:33:12 +0000
Message-Id: <0f84ab6c0614259a7576747fcd391f15d5a8bddb.1360337212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 5/6] python-pyopenssl: tweak recipe
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
X-List-Received-Date: Fri, 08 Feb 2013 15:49:32 -0000

* Set SUMMARY instead of DESCRIPTION
* Make LICENSE more specific

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb b/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb
index 181879f..01f43da 100644
--- a/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb
+++ b/meta-oe/recipes-devtools/python/python-pyopenssl_0.13.bb
@@ -1,7 +1,7 @@
-DESCRIPTION = "Simple Python wrapper around the OpenSSL library"
+SUMMARY = "Simple Python wrapper around the OpenSSL library"
 SECTION = "devel/python"
 
-LICENSE = "Apache"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCNAME = "pyOpenSSL"
-- 
1.7.10.4



