Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 97DCC6103C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 10:38:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 May 2014 03:38:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,964,1389772800"; d="scan'208";a="426307845"
Received: from abamaras-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.26])
	by azsmga001.ch.intel.com with ESMTP; 01 May 2014 03:38:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 May 2014 11:38:18 +0100
Message-Id: <3baee63934d5d5aa9f4fb88b9024e91899d51d1e.1398940635.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398940635.git.paul.eggleton@linux.intel.com>
References: <cover.1398940635.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398940635.git.paul.eggleton@linux.intel.com>
References: <cover.1398940635.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/2] xdebug: fix for S != B
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
X-List-Received-Date: Thu, 01 May 2014 10:38:31 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
index e57783b..3c4d8e4 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.2.3.bb
@@ -15,7 +15,9 @@ inherit autotools
 EXTRA_OECONF += "--enable-xdebug -with-php-config=${STAGING_BINDIR_CROSS}/php-config"
 
 do_configure() {
+    cd ${S}
     ${STAGING_BINDIR_CROSS}/phpize
+    cd ${B}
 
     # Running autoreconf as autotools_do_configure would do here
     # breaks the libtool configuration resulting in a failure later
-- 
1.9.0


