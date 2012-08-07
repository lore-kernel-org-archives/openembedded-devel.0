Received: from mail.mlbassoc.com ([65.100.170.105] helo=zeus)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@zeus>) id 1Syhkk-0001OC-He
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 13:15:10 +0200
Received: by zeus (Postfix, from userid 996)
	id 54575520F80; Tue,  7 Aug 2012 05:03:30 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 05:03:29 -0600
Message-Id: <1344337409-22390-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v2] libxml++: New recipe - C++ bindings for libxml
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
X-List-Received-Date: Tue, 07 Aug 2012 11:15:10 -0000

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb b/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
new file mode 100644
index 0000000..9a33baa
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "C++ wrapper for libxml library"
+DESCRIPTION = "C++ wrapper for libxml library"
+HOMEPAGE = "http://libxmlplusplus.sourceforge.net"
+BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml%2B%2B"
+SECTION = "libs"
+LICENSE = "GPLv2"
+
+SHRT_VER = "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',True).split('.')[1]}"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz"
+
+SRC_URI[md5sum] = "196a2dcdc84ab987fe3852b3f29cafd7"
+SRC_URI[sha256sum] = "715a4214bbff90365cc8406a28e427febd90461006d608fbdcdcea7fc9891eaf"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
+
+DEPENDS = "libxml2 glibmm"
+
+inherit autotools pkgconfig
+
-- 
1.7.9.5



