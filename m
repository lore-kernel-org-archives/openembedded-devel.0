Return-Path: <fsnow@phoenixcontact.com>
X-Greylist: delayed 318 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Mar 2019 16:12:13 UTC
Received: from mail2.phoenixcontact.com (mail2.phoenixcontact.com
	[62.157.123.121])
	by mail.openembedded.org (Postfix) with ESMTP id AA3007CD78
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 16:12:13 +0000 (UTC)
Received: from home.innominate.com ([149.208.95.240])
	by de-nice01.europe.phoenixcontact.com
	with ESMTP id 2019030117065548-486284 ;
	Fri, 1 Mar 2019 17:06:55 +0100 
Received: from localhost (localhost.localdomain [127.0.0.1])
	by home.innominate.com (Postfix) with ESMTP id 4B13722D3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:06:55 +0100 (CET)
Received: from home.innominate.com ([127.0.0.1])
	by localhost (innominate.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZvExZjkUbIQN
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:06:55 +0100 (CET)
Received: from pc-10467.de.innominate.com (mdickopp1.de.innominate.com
	[10.1.47.1]) by home.innominate.com (Postfix) with ESMTP id 2D59721F4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:06:55 +0100 (CET)
Received: by pc-10467.de.innominate.com (Postfix, from userid 1001)
	id 1D5CB2019E; Fri,  1 Mar 2019 17:06:54 +0100 (CET)
From: Felix Snow <fsnow@phoenixcontact.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
X-TNEFEvaluated: 1
Message-ID: <20190301160653.d4rqgalu6rquukds@pc-10467.de.innominate.com>
Date: Fri, 1 Mar 2019 17:06:54 +0100
Subject: [meta-oe][PATCH] upgrade python-click from 6.7 to 7.0
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
X-List-Received-Date: Fri, 01 Mar 2019 16:12:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Signed-off-by: Felix Snow <fsnow@phoenixcontact.com>
---
 meta-python/recipes-devtools/python/python-click.inc              | 8 +++++---
 .../python/{python-click_6.7.bb => python-click_7.0.bb}           | 0
 .../python/{python3-click_6.7.bb => python3-click_7.0.bb}         | 0
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-click_6.7.bb => python-click_7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-click_6.7.bb => python3-click_7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-click.inc b/meta-python/recipes-devtools/python/python-click.inc
index c81545b15..60bc46f82 100644
--- a/meta-python/recipes-devtools/python/python-click.inc
+++ b/meta-python/recipes-devtools/python/python-click.inc
@@ -6,10 +6,10 @@ Line Interface Creation Kit". It's highly configurable but comes with \
 sensible defaults out of the box."
 HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=09e8b7869f94ba9e9a7b260d53c65dab"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c13ed890b210a882c1778216694c98c7"
 
-SRC_URI[md5sum] = "fc4cc00c4863833230d3af92af48abd4"
-SRC_URI[sha256sum] = "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"
+SRC_URI[md5sum] = "7f53d50f7b7373ebc7963f9ff697450a"
+SRC_URI[sha256sum] = "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"
 
 UPSTREAM_CHECK_REGEX = "click/(?P<pver>\d+(\.\d+)+)/"
 
@@ -21,3 +21,5 @@ RDEPENDS_${PN} += "\
     "
 
 BBCLASSEXTEND = "native nativesdk"
+
+PYPI_PACKAGE = "Click"
diff --git a/meta-python/recipes-devtools/python/python-click_6.7.bb b/meta-python/recipes-devtools/python/python-click_7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-click_6.7.bb
rename to meta-python/recipes-devtools/python/python-click_7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-click_6.7.bb b/meta-python/recipes-devtools/python/python3-click_7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-click_6.7.bb
rename to meta-python/recipes-devtools/python/python3-click_7.0.bb
-- 
2.11.0


