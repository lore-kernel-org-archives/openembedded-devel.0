Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC896F7AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 09:48:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Mar 2014 02:44:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,629,1389772800"; d="scan'208";a="470091075"
Received: from sleopold-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.85])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2014 02:48:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2014 09:48:36 +0000
Message-Id: <eb7e8050ccfc99bae656422306251e996e0a399f.1394531274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394531274.git.paul.eggleton@linux.intel.com>
References: <cover.1394531274.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394531274.git.paul.eggleton@linux.intel.com>
References: <cover.1394531274.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/2] modphp: update to 5.5.10
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
X-List-Received-Date: Tue, 11 Mar 2014 09:48:48 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/recipes-php/modphp/modphp_5.5.10.bb | 7 +++++++
 meta-webserver/recipes-php/modphp/modphp_5.5.9.bb  | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
 delete mode 100644 meta-webserver/recipes-php/modphp/modphp_5.5.9.bb

diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
new file mode 100644
index 0000000..fcdb11e
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/modphp_5.5.10.bb
@@ -0,0 +1,7 @@
+include modphp5.inc
+
+EXTRA_OECONF += "--disable-opcache"
+
+SRC_URI[md5sum] = "d608230c7890b6a0cc5b92e66e866226"
+SRC_URI[sha256sum] = "bb34e61f8e6f56c612867bfe85d144d5045cd5e44497539bc126a4e8c6795419"
+
diff --git a/meta-webserver/recipes-php/modphp/modphp_5.5.9.bb b/meta-webserver/recipes-php/modphp/modphp_5.5.9.bb
deleted file mode 100644
index 4243ece..0000000
--- a/meta-webserver/recipes-php/modphp/modphp_5.5.9.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-include modphp5.inc
-
-EXTRA_OECONF += "--disable-opcache"
-
-SRC_URI[md5sum] = "c4a348a07b52f6e177d8fdc75fe507b1"
-SRC_URI[sha256sum] = "9d1dea5195e2bcd928416130a6e19173d02bd36fb76c382522bf145c458fbed3"
-
-- 
1.8.5.3


