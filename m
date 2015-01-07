Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8873D729E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:50:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 07 Jan 2015 06:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,714,1413270000"; d="scan'208";a="665825758"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2015 06:50:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 14:50:22 +0000
Message-Id: <79e3812e3df36499cb67b24c899ba39c47402536.1420641979.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420641979.git.paul.eggleton@linux.intel.com>
References: <cover.1420641979.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v4 07/13] README: update for modphp merging into php
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
X-List-Received-Date: Wed, 07 Jan 2015 14:50:46 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/README | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/README b/meta-webserver/README
index f3fe735..379b54a 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -29,10 +29,24 @@ Layout
 ------
 
 recipes-httpd/      Web servers
-recipes-php/        PHP and PHP applications
+recipes-php/        PHP applications
+recipes-support/    Miscellaneous support recipes
 recipes-webadmin/   Standalone web administration interfaces
 
 
+Notes
+-----
+
+* This layer used to provide a modphp recipe that built mod_php, but
+  this is now built as part of the php recipe in meta-oe. However, since
+  apache2 is required to build mod_php, and apache2 recipe is in this
+  layer and recipes in meta-oe can't depend on it, mod_php is not built
+  by default. If you do wish to use mod_php, you need to add "apache2"
+  to the PACKAGECONFIG value for the php recipe in order to enable it.
+  See here for info on how to do that:
+
+  http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-PACKAGECONFIG
+
 
 Maintenance
 -----------
-- 
1.9.3


