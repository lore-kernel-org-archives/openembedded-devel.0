Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 088C77264F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:51:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2015 02:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="664505024"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2015 02:51:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:51:30 +0000
Message-Id: <7c840d17931cc5f611df7b8ce2f3fc59fbc8ad4b.1420454954.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 5/5] dnsmasq: update to 2.72
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
X-List-Received-Date: Mon, 05 Jan 2015 10:51:57 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb | 10 ----------
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb
deleted file mode 100644
index ccc567e..0000000
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.71.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require dnsmasq.inc
-
-SRC_URI += "\
-    file://parallel-make.patch \
-    file://lua.patch \
-"
-
-SRC_URI[dnsmasq-2.71.md5sum] = "15a68f7f6cc0119e843f67d2f79598f1"
-SRC_URI[dnsmasq-2.71.sha256sum] = "7d8c64f66a396442e01b639df3ea6b4e02ba88cbe206c80be8de68b6841634c4"
-
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
new file mode 100644
index 0000000..bd59194
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.72.bb
@@ -0,0 +1,10 @@
+require dnsmasq.inc
+
+SRC_URI += "\
+    file://parallel-make.patch \
+    file://lua.patch \
+"
+
+SRC_URI[dnsmasq-2.72.md5sum] = "cf82f81cf09ad3d47612985012240483"
+SRC_URI[dnsmasq-2.72.sha256sum] = "635f1b47417d17cf32e45cfcfd0213ac39fd09918479a25373ba9b2ce4adc05d"
+
-- 
1.9.3


