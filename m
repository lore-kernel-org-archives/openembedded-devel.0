Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5F33565D5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 13:21:34 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2014 06:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,804,1400050800"; d="scan'208";a="465149424"
Received: from tskannan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.122])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2014 06:21:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:20:44 +0100
Message-Id: <ca84dcafa3e67812e6915c266ff5867b9c5da2ae.1407244194.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407244194.git.paul.eggleton@linux.intel.com>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407244194.git.paul.eggleton@linux.intel.com>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 3/5] modphp: update to 5.5.15
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Aug 2014 13:21:34 -0000

LIC_FILES_CHKSUM changed since the copyright year changed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp5.inc      | 2 +-
 meta-webserver/recipes-php/modphp/modphp_5.5.12.bb | 7 -------
 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb | 7 +++++++
 3 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.12.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.15.bb

diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index a1d550d..6932429 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -12,7 +12,7 @@ SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/php-${PV}"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5bb09683f8f09b15b7076f4b4c31d61f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
 
 inherit autotools
 
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.12.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.12.bb
deleted file mode 100644
index 3f4e8f2..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.5.12.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include modphp5.inc
-
-EXTRA_OECONF += "--disable-opcache"
-
-SRC_URI[md5sum] = "943af92c2e67bba29429bdd9acf9cbd4"
-SRC_URI[sha256sum] = "519ee29e28532782676f3d8e31a808ffbfee383e0279ccc8cbd2b12ed53c2335"
-
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.15.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
new file mode 100644
index 0000000..aed620f
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.5.15.bb
@@ -0,0 +1,7 @@
+include modphp5.inc
+
+EXTRA_OECONF += "--disable-opcache"
+
+SRC_URI[md5sum] = "5cb5f2ed9099299f8a4c952d59d93812"
+SRC_URI[sha256sum] = "00f24226b12fee27e332383b6304f1b9ed3f4d9173dd728a68c5c3f5a59b8ba7"
+
-- 
1.9.3


