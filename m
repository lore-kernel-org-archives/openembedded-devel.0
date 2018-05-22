Return-Path: <prvs=673fc8d93=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id CCD4E74A13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 May 2018 22:11:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,430,1520895600"; d="scan'208";a="10436789"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 May 2018 00:11:29 +0200
Message-ID: <20180522221129.9021-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: dev@g0hl1n.net
Subject: [meta-oe][PATCH v2] uhubctl: add recipe
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
X-List-Received-Date: Tue, 22 May 2018 22:11:47 -0000
Content-Type: text/plain

Add recipe for uhubctl v2.0.0, an utility to control USB power per-port
on "smart" USB hubs.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
Changes v2:
  + applied suggestions by Khem Raj:
    - replace version fix patch with sed line
    - remove redundant ${S} assignment
    - remove redundant FILES assignmet
---
 meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb

diff --git a/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
new file mode 100644
index 000000000..6306ddb55
--- /dev/null
+++ b/meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "USB hub per-port power control"
+HOMEPAGE = "https://github.com/mvp/uhubctl"
+BUGTRACKER = "https://github.com/mvp/uhubctl/issues"
+DEPENDS = "libusb1"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "https://github.com/mvp/${PN}/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "5c711911d766d76813333c3812277574"
+SRC_URI[sha256sum] = "4c31278b2c03e5be5a696c3088bc86cf2557a70e00f697799c163aba18e3c40e"
+
+# uhubctl gets its program version from "git describe". As we use the source
+# archive do reduce download size replace the call with our hardcoded version.
+do_configure_append() {
+    sed -i "s/^\(GIT_VERSION :=\).*$/\1 ${PV}/g" ${S}/Makefile
+}
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
-- 
2.11.0


