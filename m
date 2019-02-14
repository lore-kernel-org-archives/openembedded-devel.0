Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 47D4C6BF3E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 01:52:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.58,367,1544457600"; d="scan'208";a="54295444"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Feb 2019 09:52:44 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8969B4C4A88F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2019 09:52:44 +0800 (CST)
Received: from localhost.localdomain (10.167.225.47) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Thu, 14 Feb 2019 09:52:55 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Feb 2019 09:53:45 +0800
Message-ID: <20190214015345.29167-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.47]
X-yoursite-MailScanner-ID: 8969B4C4A88F.AF4DC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-python][PATCH] python-lxml: upgrade to 4.3.1
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
X-List-Received-Date: Thu, 14 Feb 2019 01:52:45 -0000
Content-Type: text/plain

1.Upgrade python-lxml and python3-lxml from 4.2.4 to 4.3.1

2.Modified some outdated descriptions in iso-schematron.rng

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-python/recipes-devtools/python/python-lxml.inc         | 6 +++---
 .../python/{python-lxml_4.2.4.bb => python-lxml_4.3.1.bb}   | 0
 .../python/{python3-lxml_4.2.4.bb => python3-lxml_4.3.1.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.2.4.bb => python-lxml_4.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.2.4.bb => python3-lxml_4.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 7f355a7bc..14897c06e 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -11,15 +11,15 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
                     file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
                     file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=939e7430ce85e1242ff50c4ee9430752 \
+                    file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10 \
                     file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b \
                     file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53 \
                     "
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "31239400ca4e130b69993bb3c14204b3"
-SRC_URI[sha256sum] = "e2afbe403090f5893e254958d02875e0732975e73c4c0cdd33c1f009a61963ca"
+SRC_URI[md5sum] = "d2b2eb305bfa9ed15aebe61affb3ffa4"
+SRC_URI[sha256sum] = "da5e7e941d6e71c9c9a717c93725cda0708c2474f532e3680ac5e39ec57d224d"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.2.4.bb b/meta-python/recipes-devtools/python/python-lxml_4.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.2.4.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.4.bb b/meta-python/recipes-devtools/python/python3-lxml_4.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.2.4.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.3.1.bb
-- 
2.17.2




