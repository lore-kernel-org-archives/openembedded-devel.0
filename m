Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.7056.1628159255842648808
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 03:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 09284FF810;
	Thu,  5 Aug 2021 10:27:33 +0000 (UTC)
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 1/2] cve-check: fix comments
Date: Thu,  5 Aug 2021 12:27:28 +0200
Message-Id: <20210805102729.32575-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This implements various fixes in comments in cve-check.bbclass
In particular, the "whitlisted" typo is important as the "whitelisted"
word is going to be replaced in a near future.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index a3fc9c2623..acdf005a72 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -20,7 +20,7 @@
 # the only method to check against CVEs. Running this tool
 # doesn't guarantee your packages are free of CVEs.
 
-# The product name that the CVE database uses.  Defaults to BPN, but may need to
+# The product name that the CVE database uses defaults to BPN, but may need to
 # be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
@@ -56,11 +56,11 @@ CVE_CHECK_WHITELIST ?= ""
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??= ""
 
-# Layers to be included 
+# Layers to be included
 CVE_CHECK_LAYER_INCLUDELIST ??= ""
 
 
-# set to "alphabetical" for version using single alphabetical character as increament release
+# set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
 python cve_save_summary_handler () {
@@ -230,7 +230,7 @@ def check_cves(d, patched_cves):
         return ([], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
-    # If the recipe has been whitlisted we return empty lists
+    # If the recipe has been whitelisted we return empty lists
     if pn in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [], [])
-- 
2.25.1

