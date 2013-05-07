Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihai.prica@intel.com>) id 1UZflD-0002qQ-IE
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 May 2013 13:08:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 May 2013 03:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,627,1363158000"; d="scan'208";a="298792861"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by azsmga001.ch.intel.com with ESMTP; 07 May 2013 03:50:24 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 May 2013 13:50:18 +0300
Message-Id: <1367923819-5612-2-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1367923819-5612-1-git-send-email-mihai.prica@intel.com>
References: <1367923819-5612-1-git-send-email-mihai.prica@intel.com>
Subject: [meta-oe][PATCH 2/3] python-sqlalchemy: update to 0.7.9
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
X-List-Received-Date: Tue, 07 May 2013 11:09:05 -0000
X-List-Received-Date: Tue, 07 May 2013 11:09:05 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 ...alchemy_0.7.1.bb => python-sqlalchemy_0.7.9.bb} |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-sqlalchemy_0.7.1.bb => python-sqlalchemy_0.7.9.bb} (59%)

diff --git a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
similarity index 59%
rename from meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
rename to meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
index 9c7bd37..09c9312 100644
--- a/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.1.bb
+++ b/meta-oe/recipes-devtools/python/python-sqlalchemy_0.7.9.bb
@@ -1,16 +1,15 @@
 DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
-LICENSE = "MIT"         
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e88f48967a8bd1fe88f5425f7e659dbf"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=baffc5e5f4804c92fc9be155fed70d41"
 RDEPENDS_${PN} += "python-numbers"
-PR = "r2"
+PR = "r0"
 
 SRCNAME = "SQLAlchemy"
 SRC_URI = "${SOURCEFORGE_MIRROR}/sqlalchemy/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "76e2e1e48b8047f1ca7023f143374aef"
-SRC_URI[sha256sum] = "eedd2d63d6404d9bbe3c4c6a63a5442d2c2650b862f9c10f721cfae4a735d05a"
-
+SRC_URI[md5sum] = "c4852d586d95a59fbc9358f4467875d5"
+SRC_URI[sha256sum] = "f7a305ad122144f364ce09a2d9ed5159d5f46ec43650653593e7dfa05d3294a1"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
-- 
1.7.9.5



