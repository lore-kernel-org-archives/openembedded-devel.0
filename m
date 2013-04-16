Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3nZ-0006dN-7P
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:12:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811884"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:53:56 +0100
Message-Id: <92b84593e5fe2d781bd9784a072dce0b59a8941c.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking, meta-oe][PATCH 2/9] iw: move to meta-networking and update
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
X-List-Received-Date: Tue, 16 Apr 2013 11:12:51 -0000
X-List-Received-Date: Tue, 16 Apr 2013 11:12:51 -0000
X-List-Received-Date: Tue, 16 Apr 2013 11:12:51 -0000
X-List-Received-Date: Tue, 16 Apr 2013 11:12:51 -0000

* Update to 3.8
* Use working SRC_URI

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...001-iw-version.sh-don-t-use-git-describe-for-versioning.patch |    0
 .../iw/iw_3.6.bb => meta-networking/recipes-support/iw/iw_3.8.bb |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch (100%)
 rename meta-oe/recipes-connectivity/iw/iw_3.6.bb => meta-networking/recipes-support/iw/iw_3.8.bb (74%)

diff --git a/meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta-networking/recipes-support/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
rename to meta-networking/recipes-support/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
diff --git a/meta-oe/recipes-connectivity/iw/iw_3.6.bb b/meta-networking/recipes-support/iw/iw_3.8.bb
similarity index 74%
rename from meta-oe/recipes-connectivity/iw/iw_3.6.bb
rename to meta-networking/recipes-support/iw/iw_3.8.bb
index a09339c..2f31d9c 100644
--- a/meta-oe/recipes-connectivity/iw/iw_3.6.bb
+++ b/meta-networking/recipes-support/iw/iw_3.8.bb
@@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 
 DEPENDS = "libnl pkgconfig"
 
-SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
+SRC_URI = "http://kernel.org/pub/software/network/iw/${P}.tar.gz \
            file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
 "
 
-SRC_URI[md5sum] = "1c18bfbbc8773629e5e8ac733a39540c"
-SRC_URI[sha256sum] = "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cdb6c857"
+SRC_URI[md5sum] = "fff10217a0b0ca088a1eba6413394280"
+SRC_URI[sha256sum] = "a73b81e6fb1a9a7cad7aae584bee16f1029ddb6a1c3c08e8b7f22e301690cbfc"
 
 EXTRA_OEMAKE = ""
 
-- 
1.7.10.4



