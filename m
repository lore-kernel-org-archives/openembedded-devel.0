Return-Path: <thstead@steadtechnology.co.uk>
X-Greylist: delayed 414 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 May 2019 16:59:48 UTC
Received: from bradley.thecyberweb.co.uk (bradley.thecyberweb.co.uk
	[35.176.52.35])
	by mail.openembedded.org (Postfix) with ESMTP id C69EC79CCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 16:59:48 +0000 (UTC)
Received: by bradley.thecyberweb.co.uk (Postfix, from userid 2223)
	id A0B1B63010; Mon, 20 May 2019 17:53:04 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	bradley.thecyberweb.co.uk
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from quietthinker.steadtechnology
	(baculaserver.steadtechnology.co.uk [90.254.76.244])
	by bradley.thecyberweb.co.uk (Postfix) with ESMTPA id 450316300E;
	Mon, 20 May 2019 17:53:04 +0100 (BST)
From: thstead <thstead@steadtechnology.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 17:52:16 +0100
Message-Id: <20190520165216.12220-1-thstead@steadtechnology.co.uk>
X-Mailer: git-send-email 2.11.0
Subject: [meta-python][PATCH] Upgraded python-pysnmp from version 4.3.5. to 4.4.9. This upgrade was required to correct an issue with the Integer32.clone method taking vairable parameters as opposed to the 4 defined in v4.3.5. The error was occurs within __SNMP-FRAMEWORK-MIB.py
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
X-List-Received-Date: Mon, 20 May 2019 16:59:49 -0000

Signed-off-by: thstead <thstead@steadtechnology.co.uk>
---
 .../python/{python-pysnmp_4.3.5.bb => python-pysnmp_4.4.9.bb}      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pysnmp_4.3.5.bb => python-pysnmp_4.4.9.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb
rename to meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
index 0b38d58e4..9ff4df2c9 100644
--- a/meta-python/recipes-devtools/python/python-pysnmp_4.3.5.bb
+++ b/meta-python/recipes-devtools/python/python-pysnmp_4.4.9.bb
@@ -6,14 +6,15 @@ DESCRIPTION = "SNMP v1/v2c/v3 engine and apps written in pure-Python. \
 HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=280606d9c18f200e03e0c247ac61475a"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b15d29f500f748d1c2a15709769090a8"
 
 SRCNAME = "pysnmp"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "387aaa23c168ccc0b59775cfdf519fc0"
-SRC_URI[sha256sum] = "38253fe95cea33f352fb36e85f3c2874043401724300c4888df74835161169d2"
+SRC_URI[md5sum] = "6d1b514997326bed18f1ae1510f6b1c9"
+SRC_URI[sha256sum] = "d5d1e59780126e963dd92e25993b783295734e71bef181f602e51f7393260441"
+
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.11.0


