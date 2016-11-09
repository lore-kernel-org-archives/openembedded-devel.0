Return-Path: <bradleyb@fuzziesquirrel.com>
X-Greylist: delayed 528 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 09 Nov 2016 00:23:20 UTC
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id B528070178
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 00:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2016 19:14:15 -0500
Message-Id: <1478650455-6564-1-git-send-email-bradleyb@fuzziesquirrel.com>
Subject: [meta-python][PATCH] pyyaml: Enable nativesdk bake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Nov 2016 00:23:22 -0000

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-python/recipes-devtools/python/python-pyyaml_3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb b/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
index 61b1d2c..0899a2e 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
+++ b/meta-python/recipes-devtools/python/python-pyyaml_3.12.bb
@@ -21,4 +21,4 @@ do_configure_prepend() {
     install -m 0644 ${WORKDIR}/setup.py ${S}
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.1

