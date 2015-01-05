Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E06D160232
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:33:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2015 02:33:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646373637"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 02:33:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:33:23 +0000
Message-Id: <e3b6159c3eb04be57cd81e7d34c0aa57f9a004b9.1420453688.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v2 10/12] xdebug: fix DEPENDS and un-blacklist
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
X-List-Received-Date: Mon, 05 Jan 2015 10:33:43 -0000

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


