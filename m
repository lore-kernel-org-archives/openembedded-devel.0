Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QZKZC-0004eA-H5
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 12:21:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2011 03:18:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,405,1304319600"; d="scan'208";a="16773374"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.16])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2011 03:18:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2011 11:18:14 +0100
Message-Id: <1308737894-5494-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1308736132.21613.68.camel@phil-desktop>
References: <1308736132.21613.68.camel@phil-desktop>
Subject: [PATCH v2] classes/native*.bbclass: fix error during parse with bitbake master
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jun 2011 10:21:51 -0000

Fixes "AttributeError: 'NoneType' object has no attribute 'split'" during
parsing with bitbake master. We should not be calling explode_deps with
None as the argument, so ensure the value isn't None.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 classes/native.bbclass    |    2 +-
 classes/nativesdk.bbclass |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/native.bbclass b/classes/native.bbclass
index 1e7a6ec..6f30471 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -115,7 +115,7 @@ python __anonymous () {
 
     if "native" in (bb.data.getVar('BBCLASSEXTEND', d, True) or ""):
         pn = bb.data.getVar("PN", d, True)
-        depends = bb.data.getVar("DEPENDS_virtclass-native", d, True)
+        depends = bb.data.getVar("DEPENDS_virtclass-native", d, True) or ""
         deps = bb.utils.explode_deps(depends)
         newdeps = []
         for dep in deps:
diff --git a/classes/nativesdk.bbclass b/classes/nativesdk.bbclass
index 6689399..6607abf 100644
--- a/classes/nativesdk.bbclass
+++ b/classes/nativesdk.bbclass
@@ -58,7 +58,7 @@ OVERRIDES =. "virtclass-nativesdk:"
 
 python __anonymous () {
     pn = bb.data.getVar("PN", d, True)
-    depends = bb.data.getVar("DEPENDS_virtclass-nativesdk", d, True)
+    depends = bb.data.getVar("DEPENDS_virtclass-nativesdk", d, True) or ""
     deps = bb.utils.explode_deps(depends)
     newdeps = []
     for dep in deps:
-- 
1.7.4.1



