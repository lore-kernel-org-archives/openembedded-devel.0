Return-Path: <diego.ml@zoho.com>
X-Greylist: delayed 1304 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 15:51:55 UTC
Received: from sender1.zohomail.com (unknown [72.5.230.103])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0AE60196
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 May 2014 15:51:55 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=mS7XCS8ppvVKbTkIMgJGK0hECl197D0RfMS1sMxOccP3s83sYNs0oDoH0Eu0FuJ+5W7QPlrQnVKv
	FbE3jxQsdvl84vXjWaa0OWuax+v72V9YNCanZDiuO8htPt0OmbM5  
Received: from localhost.localdomain
	(host65-246-static.10-188-b.business.telecomitalia.it
	[188.10.246.65]) by mx.zohomail.com
	with SMTPS id 1399563011168441.4114897728168;
	Thu, 8 May 2014 08:30:11 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 May 2014 17:28:45 +0200
Message-Id: <1399562925-8628-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
X-ZohoMail: Ss SS_10 UW UB ZCF-710TPL UW UB ZSF-HLOLL_2 SF_TD_EXT
	SGR3_1_03044_283
X-ZohoMail-Owner: <1399562925-8628-1-git-send-email-diego.ml@zoho.com>+zmo_0_<diego.ml@zoho.com>
X-ZohoMail-Sender: 188.10.246.65
X-Zoho-Virus-Status: 2
X-ZohoMailClient: External
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [meta-oe][PATCH] glmark2: update to version 2014.03
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
X-List-Received-Date: Thu, 08 May 2014 15:51:58 -0000

Update glmark2 receipe to upstream version 2014.03.

The configure step has changed and instead of using "--enable-stuff" syntax, now the syntax is "--with-flavors=flavor1,flavor2".
Thanks to Paul Eggleton for the help on how to deal with that:
https://lists.yoctoproject.org/pipermail/yocto/2014-April/019328.html

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 .../{glmark2_2012.12.bb => glmark2_2014.03.bb}     |   19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-benchmark/glmark2/{glmark2_2012.12.bb => glmark2_2014.03.bb} (52%)

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
similarity index 52%
rename from meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
rename to meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
index 031e3b3..3ff0449 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_2012.12.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_2014.03.bb
@@ -12,12 +12,23 @@ DEPENDS = "libpng12 jpeg"
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "4f306664aa3886fa0cf93853603603f8"
-SRC_URI[sha256sum] = "bea6f9de2cdce376195bd91e4a2fdfdf80bf3e480abff8e05b90a6458c1deb47"
+SRC_URI[md5sum] = "739859cf57d4c8a23452c43e84f66e56"
+SRC_URI[sha256sum] = "bded41aaf918ce062d9b81e42cc5be943e6a80bc4ff9d046983b96102c3df6b5"
 
 inherit waf pkgconfig
 
 PACKAGECONFIG ?= "gl gles2"
 
-PACKAGECONFIG[gl] = "--enable-gl,,virtual/libgl"
-PACKAGECONFIG[gles2] = "--enable-glesv2,,virtual/libgles2"
+PACKAGECONFIG[gl] = ",,virtual/libgl"
+PACKAGECONFIG[gles2] = ",,virtual/libgles2"
+
+python __anonymous() {
+    packageconfig = (d.getVar("PACKAGECONFIG", True) or "").split()
+    flavors = []
+    if "gles2" in packageconfig:
+        flavors.append("x11-glesv2")
+    if "gl" in packageconfig:
+        flavors.append("x11-gl")
+    if flavors:
+        d.appendVar("EXTRA_OECONF", " --with-flavors=%s" % ",".join(flavors))
+}
-- 
1.7.9.5



