Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B49667213F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:50:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jan 2015 06:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,714,1413270000"; d="scan'208";a="665825817"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 06:50:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 14:50:26 +0000
Message-Id: <46774adb02dd3d85522c287d3f079535d2dd5c00.1420641979.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v4 11/13] xdebug: fix DEPENDS and un-blacklist
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
X-List-Received-Date: Wed, 07 Jan 2015 14:50:51 -0000

Now we use a single php recipe there is no conflict.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
index 66aff5e..6f472fb 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.5.bb
@@ -2,9 +2,7 @@ SUMMARY = "Debugging and profiling extension for PHP"
 LICENSE = "Xdebug"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16"
 
-DEPENDS = "modphp"
-
-PNBLACKLIST[xdebug] ?= "CONFLICT: depends on blocked modphp"
+DEPENDS = "php"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-- 
1.9.3


