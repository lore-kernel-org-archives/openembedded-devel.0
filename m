Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9729B65D59
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 13:21:34 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2014 06:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,804,1400050800"; d="scan'208";a="465149435"
Received: from tskannan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.122])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2014 06:21:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:20:45 +0100
Message-Id: <e23cb68f3f356fe64a8374f7089569b196883779.1407244194.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407244194.git.paul.eggleton@linux.intel.com>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407244194.git.paul.eggleton@linux.intel.com>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 4/5] phpmyadmin: update to 4.2.7
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

Note that this now requires MariaDB/MySQL 5.5+.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../phpmyadmin/{phpmyadmin_4.2.0.bb => phpmyadmin_4.2.7.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.2.0.bb => phpmyadmin_4.2.7.bb} (87%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.0.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
similarity index 87%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.0.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
index 0298f6b..8054c35 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.0.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://apache.conf"
 
-SRC_URI[md5sum] = "f787bcf5c98a1702d9c8c653e72eb689"
-SRC_URI[sha256sum] = "fef460aa493f696b8536c273ef126bb142b88dd15c7ef584aca90d2ea07d3bbc"
+SRC_URI[md5sum] = "0dcd755450dac819f33502590c88ad29"
+SRC_URI[sha256sum] = "5d101dd88a99a869bc0c684a7f687cf290abc4bf306daac73337cbde2d7743e4"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.9.3


