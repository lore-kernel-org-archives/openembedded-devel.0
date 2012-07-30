Received: from mail.mlbassoc.com ([65.100.170.105] helo=zeus)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@zeus>) id 1SvrqI-0002ij-3Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 17:25:10 +0200
Received: by zeus (Postfix, from userid 996)
	id 9E2C3520F7A; Mon, 30 Jul 2012 09:04:12 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2012 09:04:08 -0600
Message-Id: <1343660648-20358-2-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343660648-20358-1-git-send-email-gary@mlbassoc.com>
References: <1343660648-20358-1-git-send-email-gary@mlbassoc.com>
Subject: [PATCH] [meta-oe] libxml++: New recipe
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
X-List-Received-Date: Mon, 30 Jul 2012 15:25:10 -0000

Library for C++ bindings to libxml

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb b/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
new file mode 100644
index 0000000..ca9388c
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
@@ -0,0 +1,16 @@
+SUMMARY = "C++ wrapper for libxml library"
+DESCRIPTION = "C++ wrapper for libxml library"
+HOMEPAGE = "http://libxmlplusplus.sourceforge.net"
+BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml%2B%2B"
+SECTION = "libs"
+LICENSE = "GPLv2"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libxml++/2.35/libxml++-2.35.3.tar.xz"
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



