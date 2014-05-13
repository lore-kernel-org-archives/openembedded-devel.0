Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3E7D265EB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:06:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2014 04:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="431437188"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2014 04:06:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 May 2014 12:05:54 +0100
Message-Id: <31e7fb3e150f816036b9c52d0b4abad1c88899df.1399979085.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399979085.git.paul.eggleton@linux.intel.com>
References: <cover.1399979085.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399979085.git.paul.eggleton@linux.intel.com>
References: <cover.1399979085.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/4] modphp: update to 5.5.12
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
X-List-Received-Date: Tue, 13 May 2014 11:06:39 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp_5.5.10.bb | 7 -------
 meta-webserver/recipes-php/modphp/modphp_5.5.12.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.12.bb

diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
deleted file mode 100644
index fcdb11e..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include modphp5.inc
-
-EXTRA_OECONF += "--disable-opcache"
-
-SRC_URI[md5sum] = "d608230c7890b6a0cc5b92e66e866226"
-SRC_URI[sha256sum] = "bb34e61f8e6f56c612867bfe85d144d5045cd5e44497539bc126a4e8c6795419"
-
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.12.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.12.bb
new file mode 100644
index 0000000..3f4e8f2
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.5.12.bb
@@ -0,0 +1,7 @@
+include modphp5.inc
+
+EXTRA_OECONF += "--disable-opcache"
+
+SRC_URI[md5sum] = "943af92c2e67bba29429bdd9acf9cbd4"
+SRC_URI[sha256sum] = "519ee29e28532782676f3d8e31a808ffbfee383e0279ccc8cbd2b12ed53c2335"
+
-- 
1.9.0


