Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1R0aub-0003VS-56
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 17:16:38 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R0aph-0002vu-K7 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Sep 2011 08:11:33 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 5 Sep 2011 17:11:32 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Sep 2011 20:12:40 +0500
Message-Id: <c0474b5644b7bdf87555b5aaba317d4288e0c6fc.1315235172.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 05 Sep 2011 15:11:32.0951 (UTC)
	FILETIME=[18C70670:01CC6BDE]
Subject: [meta-oe][PATCH v2 1/1] python-lxml: Add version 2.2.8 (initial recipe)
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
X-List-Received-Date: Mon, 05 Sep 2011 15:16:38 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported from oe.dev commit id bc6a94559157e6fcc190a22a259c0f757b8664ae.
* Tested with MACHINE = 'qemuppc'

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../recipes-devtools/python/python-lxml_2.2.8.bb   |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb

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



