Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4C36D6B446
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:38:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Jan 2014 02:38:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,652,1384329600"; d="scan'208";a="457835851"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.149])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2014 02:38:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2014 10:38:27 +0000
Message-Id: <4ea0304c47adcbe6a13c6d564b709aae418aa5af.1389609476.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389609476.git.paul.eggleton@linux.intel.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1389609476.git.paul.eggleton@linux.intel.com>
References: <cover.1389609476.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/3] modphp: upgrade to 5.5.8
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
X-List-Received-Date: Mon, 13 Jan 2014 10:38:37 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb | 7 -------
 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.8.bb

diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
deleted file mode 100644
index 3c23242..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.5.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include modphp5.inc
-
-EXTRA_OECONF += "--disable-opcache"
-
-SRC_URI[md5sum] = "caf7f4d86514a568fb3c8021b096a9f0"
-SRC_URI[sha256sum] = "e72aaf1fa96eac0bff127bfc74c174d1de50cd3f66d7e0e1ee919674ab463bb7"
-
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.8.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.8.bb
new file mode 100644
index 0000000..04925fb
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.5.8.bb
@@ -0,0 +1,7 @@
+include modphp5.inc
+
+EXTRA_OECONF += "--disable-opcache"
+
+SRC_URI[md5sum] = "42fe814a3cbbf34b21a2c39f66ee0001"
+SRC_URI[sha256sum] = "6d5f45659d13383fc8429f185cc9da0b30c7bb72dcae9baf568f0511eb7f8b68"
+
-- 
1.8.1.2


