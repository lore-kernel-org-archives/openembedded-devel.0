Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6DEB571A39
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 02:05:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 03 Nov 2016 19:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,589,1473145200"; d="scan'208";a="27594958"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga004.jf.intel.com with ESMTP; 03 Nov 2016 19:05:36 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 19:08:02 -0700
Message-Id: <1478225282-27345-1-git-send-email-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] mariadb: use faster download URL
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Nov 2016 02:05:36 -0000

The current URL takes about 2 hours to download.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-oe/recipes-support/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index edef40b..689b8ab 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "http://archive.mariadb.org/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
+SRC_URI = "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${PV}.tar.gz \
            file://fix-cmake-module-path.patch \
            file://remove-bad-path.patch \
            file://fix-mysqlclient-r-version.patch \
-- 
2.7.4


