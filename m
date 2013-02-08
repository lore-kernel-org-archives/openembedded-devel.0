Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3qCh-0000ri-1z
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 16:49:31 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 07:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="284541585"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 07:33:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 15:33:13 +0000
Message-Id: <ab9fb8df8805f81235411f047def79d5f181f750.1360337212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 6/6] python-lxml: update to 3.0.2 and tweak
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
X-List-Received-Date: Fri, 08 Feb 2013 15:49:31 -0000

* Update to version 3.0.2
* Update LIC_FILES_CHKSUM - substance of the license did not change, but
  some copyright/origin notes for specific parts were added.
* Add SUMMARY
* Move packaging definitions to the end

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/{python-lxml_2.2.8.bb => python-lxml_3.0.2.bb} |   13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-lxml_2.2.8.bb => python-lxml_3.0.2.bb} (76%)

diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
similarity index 76%
rename from meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
rename to meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
index a175609..5ab7b4a 100644
--- a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
+++ b/meta-oe/recipes-devtools/python/python-lxml_3.0.2.bb
@@ -1,17 +1,16 @@
+SUMMARY = "Python XML bindings for libxml2 and libxslt"
 DESCRIPTION = "Powerful and Pythonic XML processing library combining \
 libxml2/libxslt with the ElementTree API."
 HOMEPAGE = "http://codespeak.net/lxml"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=7de92baeb3b7bfaebe72404155fdb346"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b"
 SRCNAME = "lxml"
-PR = "r2"
 
 DEPENDS = "libxml2 libxslt"
-RDEPENDS_${PN} += "libxml2 libxslt python-compression"
 
 SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=lxml"
-SRC_URI[lxml.md5sum] = "d6c612d63a84d79440912a1b29d3b981"
-SRC_URI[lxml.sha256sum] = "89b73925b5e3295dcf4675cb948007a20eb029fe35c9a162ae19ec11f1abafe5"
+SRC_URI[lxml.md5sum] = "38b15b0dd5e9292cf98be800e84a3ce4"
+SRC_URI[lxml.sha256sum] = "cadba4cf0e235127795f76a6f7092cb035da23a6e9ec4c93f8af43a6784cd101"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -28,7 +27,7 @@ DISTUTILS_INSTALL_ARGS += " \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-RDEPENDS_${PN}_virtclass-native = "libxml2-native libxslt-native"
-
 
+RDEPENDS_${PN} += "libxml2 libxslt python-compression"
+RDEPENDS_${PN}_virtclass-native = "libxml2-native libxslt-native"
 
-- 
1.7.10.4



