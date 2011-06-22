Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QZJZM-0003EF-6v
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 11:17:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2011 02:13:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,405,1304319600"; d="scan'208";a="21341675"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.16])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2011 02:13:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2011 10:13:14 +0100
Message-Id: <1308733994-3571-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] classes/native*.bbclass: fix error during parse with bitbake master
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
X-List-Received-Date: Wed, 22 Jun 2011 09:17:56 -0000

Fixes "AttributeError: 'NoneType' object has no attribute 'split'" during
parsing with bitbake master. We should not be calling explode_deps with
None as the argument, so check for that before calling it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 classes/native.bbclass    |    5 ++++-
 classes/nativesdk.bbclass |    5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/classes/native.bbclass b/classes/native.bbclass
index 1e7a6ec..e9d48a3 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -116,7 +116,10 @@ python __anonymous () {
     if "native" in (bb.data.getVar('BBCLASSEXTEND', d, True) or ""):
         pn = bb.data.getVar("PN", d, True)
         depends = bb.data.getVar("DEPENDS_virtclass-native", d, True)
-        deps = bb.utils.explode_deps(depends)
+        if depends:
+            deps = bb.utils.explode_deps(depends)
+        else:
+            deps = []
         newdeps = []
         for dep in deps:
             if dep.endswith("-cross"):
diff --git a/classes/nativesdk.bbclass b/classes/nativesdk.bbclass
index 6689399..7a8f385 100644
--- a/classes/nativesdk.bbclass
+++ b/classes/nativesdk.bbclass
@@ -59,7 +59,10 @@ OVERRIDES =. "virtclass-nativesdk:"
 python __anonymous () {
     pn = bb.data.getVar("PN", d, True)
     depends = bb.data.getVar("DEPENDS_virtclass-nativesdk", d, True)
-    deps = bb.utils.explode_deps(depends)
+    if depends:
+        deps = bb.utils.explode_deps(depends)
+    else:
+        deps = []
     newdeps = []
     for dep in deps:
         if dep.endswith("-native") or dep.endswith("-cross"):
-- 
1.7.4.1



