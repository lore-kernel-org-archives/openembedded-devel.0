Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1C40365D59
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Aug 2014 13:21:34 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Aug 2014 06:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,804,1400050800"; d="scan'208";a="465149418"
Received: from tskannan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.122])
	by azsmga001.ch.intel.com with ESMTP; 05 Aug 2014 06:21:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:20:43 +0100
Message-Id: <35bf1e07cdb5cd02cd3106692c3c1b9f0180e7cc.1407244194.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1407244194.git.paul.eggleton@linux.intel.com>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1407244194.git.paul.eggleton@linux.intel.com>
References: <cover.1407244194.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/5] apache2: update to 2.4.10
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

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../apache2/{apache2-native_2.4.9.bb => apache2-native_2.4.10.bb}     | 4 ++--
 .../recipes-httpd/apache2/{apache2_2.4.9.bb => apache2_2.4.10.bb}     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2-native_2.4.9.bb => apache2-native_2.4.10.bb} (91%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.9.bb => apache2_2.4.10.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.10.bb
similarity index 91%
rename from meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
rename to meta-webserver/recipes-httpd/apache2/apache2-native_2.4.10.bb
index 107480e..5963b79 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.9.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.10.bb
@@ -15,8 +15,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
 S = "${WORKDIR}/httpd-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "2ef4e65353497606b24fa9bb3e5a3c40"
-SRC_URI[sha256sum] = "f78cc90dfa47caf3d83ad18fd6b4e85f237777c1733fc9088594b70ce2847603"
+SRC_URI[md5sum] = "44543dff14a4ebc1e9e2d86780507156"
+SRC_URI[sha256sum] = "176c4dac1a745f07b7b91e7f4fd48f9c48049fa6f088efe758d61d9738669c6a"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
                 --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
index fd8ed92..614dd4e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.9.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
@@ -21,8 +21,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://apache2-volatile.conf"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
-SRC_URI[md5sum] = "2ef4e65353497606b24fa9bb3e5a3c40"
-SRC_URI[sha256sum] = "f78cc90dfa47caf3d83ad18fd6b4e85f237777c1733fc9088594b70ce2847603"
+SRC_URI[md5sum] = "44543dff14a4ebc1e9e2d86780507156"
+SRC_URI[sha256sum] = "176c4dac1a745f07b7b91e7f4fd48f9c48049fa6f088efe758d61d9738669c6a"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
1.9.3


