Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5567213F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:33:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jan 2015 02:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646373622"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 02:33:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:33:19 +0000
Message-Id: <abe6dfa80ddb0403c0b9129616ac0f25bb99027d.1420453688.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420453688.git.paul.eggleton@linux.intel.com>
References: <cover.1420453688.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH v2 06/12] README: update for modphp merging into php
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
X-List-Received-Date: Mon, 05 Jan 2015 10:33:39 -0000

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


