Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C129F72221
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 08:00:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44335339"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2014 15:57:04 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sB2798Ga011775
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Dec 2014 15:09:09 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 2 Dec 2014 15:09:33 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Dec 2014 15:09:15 +0800
Message-ID: <1417504155-8453-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [meta-oe][PATCH] lockfile-progs: Add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Dec 2014 08:00:31 -0000
Content-Type: text/plain

lockfile-progs provide a method to lock and unlock mailboxes and files
safely (via liblockfile).

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 .../lockfile-progs/lockfile-progs_0.1.17.bb        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.17.bb

diff --git a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.17.bb b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.17.bb
new file mode 100644
index 0000000..4354fff
--- /dev/null
+++ b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.17.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Command-line programs to safely lock and unlock files and mailboxes"
+DESCRIPTION = "\
+lockfile-progs provide a method to lock and unlock mailboxes and files \
+safely (via liblockfile)."
+HOMEPAGE = "http://packages.qa.debian.org/l/lockfile-progs.html"
+SECTION = "Applications/System"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+DEPENDS = "liblockfile"
+
+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/l/${BPN}/${BPN}_${PV}.tar.gz"
+SRC_URI[md5sum] = "64424a766fbc8cf6d613fcc14a096e14"
+SRC_URI[sha256sum] = "03fb05d25499532f497775b1747b61fa6beebf12d3bcc951e125349ae166c511"
+
+do_compile() {
+    oe_runmake CFLAGS=' -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables'
+}
+
+do_install() {
+    install -m 755 -d ${D}${bindir}
+    install bin/* ${D}${bindir}
+    install -m 755 -d ${D}${mandir}/man1
+    install man/* ${D}${mandir}/man1
+}
-- 
1.8.3.1


