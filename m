Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 473 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 15 Jul 2018 15:54:41 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 9E25D744E4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:54:41 +0000 (UTC)
Received: from localhost.localdomain (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 6F7D8F0C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2018 17:46:48 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jul 2018 17:46:43 +0200
Message-Id: <20180715154643.5971-1-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] nanomsg: add recipe
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
X-List-Received-Date: Sun, 15 Jul 2018 15:54:41 -0000

nanomsg is a socket library that provides several common communication
patterns. It is a rewrite of the ZeroMQ library. For differences between
ZeroMQ and nanomsg, consult https://nanomsg.org/documentation-zeromq.html

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../nanomsg/nanomsg_1.1.4.bb                  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.4.bb

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.4.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.4.bb
new file mode 100644
index 000000000..fa6b43ace
--- /dev/null
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.1.4.bb
@@ -0,0 +1,28 @@
+SUMMARY = "nanomsg socket library"
+DESCRIPTION = "nanomsg is a socket library that provides several common \
+communication patterns. It aims to make the networking layer fast, scalable, \
+and easy to use. Implemented in C, it works on a wide range of operating \
+systems with no further dependencies."
+HOMEPAGE = "https://nanomsg.org/"
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
+
+SECTION = "libs/networking"
+
+SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https"
+SRCREV = "e7f8a751316b942d8962cd0232c2d606c1d9a9db"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+# nanomsg documentation generation requires asciidoctor,
+# not asciidoc, and currently there's no asciidoctor-native
+# recipe anywhere in openembedded-core or meta-openembedded
+EXTRA_OECMAKE = " -DNN_ENABLE_DOC=OFF "
+
+# we don't want nanomsg-tools to be renamed to libnanomsg-tools
+DEBIAN_NOAUTONAME_${PN}-tools = "1"
+
+PACKAGES =+ "${PN}-tools"
+FILES_${PN}-tools = "${bindir}/*"
-- 
2.17.1


