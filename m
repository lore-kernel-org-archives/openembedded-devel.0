Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Qu10a-00066r-8F
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 13:43:36 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Qu0Ta-0003iP-G4 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 04:09:30 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 18 Aug 2011 13:09:29 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2011 16:09:20 +0500
Message-Id: <1313665760-21930-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 18 Aug 2011 11:09:29.0461 (UTC)
	FILETIME=[4CAAD250:01CC5D97]
Subject: [PATCH][meta-oe] python-lxml: Added new recipe in meta-oe for 2.2.8 version
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
X-List-Received-Date: Thu, 18 Aug 2011 11:43:36 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Added new recipe in meta-oe for 2.2.8 version

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../recipes-devtools/python/python-lxml_2.2.8.bb   |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
new file mode 100644
index 0000000..b1aac3f
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Powerful and Pythonic XML processing library combining \
+libxml2/libxslt with the ElementTree API."
+HOMEPAGE = "http://codespeak.net/lxml"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=7de92baeb3b7bfaebe72404155fdb346"
+SRCNAME = "lxml"
+
+DEPENDS = "libxml2 libxslt"
+RDEPENDS_${PN} += "libxml2 libxslt python-compression"
+
+SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=lxml"
+SRC_URI[lxml.md5sum] = "d6c612d63a84d79440912a1b29d3b981"
+SRC_URI[lxml.sha256sum] = "89b73925b5e3295dcf4675cb948007a20eb029fe35c9a162ae19ec11f1abafe5"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+DISTUTILS_BUILD_ARGS += " \
+                     --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
+                     --with-xml2-config='${STAGING_BINDIR_NATIVE}/xml2-config' \
+"
+
+DISTUTILS_INSTALL_ARGS += " \
+                     --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
+                     --with-xml2-config='${STAGING_BINDIR_NATIVE}/xml2-config' \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+RDEPENDS_${PN}_virtclass-native = "libxml2-native libxslt-native"
+
+
-- 
1.7.0.4



