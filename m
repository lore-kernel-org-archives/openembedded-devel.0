Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Tg9Xn-0002Se-Bb
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 08:37:23 +0100
Received: from mail120-va3-R.bigfish.com (10.7.14.250) by
	VA3EHSOBE013.bigfish.com (10.7.40.63) with Microsoft SMTP Server id
	14.1.225.23; Wed, 5 Dec 2012 06:22:30 +0000
Received: from mail120-va3 (localhost [127.0.0.1])	by
	mail120-va3-R.bigfish.com (Postfix) with ESMTP id 19DB33401DC	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2012 06:22:30 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzd6eahzz1de0h1202h1d1ah1d2ahzz8275ch177df4h17326ah8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1155h)
Received: from mail120-va3 (localhost.localdomain [127.0.0.1]) by mail120-va3
	(MessageSwitch) id 1354688548894877_27407;
	Wed,  5 Dec 2012 06:22:28 +0000 (UTC)
Received: from VA3EHSMHS010.bigfish.com (unknown [10.7.14.242])	by
	mail120-va3.bigfish.com (Postfix) with ESMTP id CCC2B400077	for
	<openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2012 06:22:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS010.bigfish.com
	(10.7.99.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 5 Dec 2012 06:22:27 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Wed, 5 Dec 2012 06:22:26 +0000
Received: from bjsimics-desktop.ap.freescale.net
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id qB56MNBw026726;
	Tue, 4 Dec 2012 23:22:24 -0700
From: Zhenhua Luo <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Dec 2012 14:45:59 +0800
Message-ID: <1354689959-3796-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com
Subject: [meta-oe] cramfs: download source tarball from http server instead of cvs server
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
X-List-Received-Date: Wed, 05 Dec 2012 07:37:23 -0000
Content-Type: text/plain

cvs server is not available sometimes:
ERROR: Fetcher failure: Fetch command failed with exit code 1, output:
cvs [checkout aborted]: reading from server: Connection reset by peer
ERROR: Function failed: Fetcher failure for URL: 'cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;module=linux'. Unable to fetch URL from any source.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-support/cramfs/cramfs_1.1.bb |   27 +++++++++++++++++++++++
 meta-oe/recipes-support/cramfs/cramfs_cvs.bb |   30 --------------------------
 2 files changed, 27 insertions(+), 30 deletions(-)
 create mode 100644 meta-oe/recipes-support/cramfs/cramfs_1.1.bb
 delete mode 100644 meta-oe/recipes-support/cramfs/cramfs_cvs.bb

diff --git a/meta-oe/recipes-support/cramfs/cramfs_1.1.bb b/meta-oe/recipes-support/cramfs/cramfs_1.1.bb
new file mode 100644
index 0000000..78060d8
--- /dev/null
+++ b/meta-oe/recipes-support/cramfs/cramfs_1.1.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Builds cramfs filesystems for embedded systems"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+DEPENDS = "zlib"
+
+SRC_URI = "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f"
+SRC_URI[sha256sum] = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368"
+
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+
+do_compile_prepend() {
+        ln -sf GNUmakefile Makefile
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install mkcramfs ${D}${bindir}
+	install cramfsck ${D}${bindir}
+}
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
deleted file mode 100644
index d9b6c06..0000000
--- a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "Builds cramfs filesystems for embedded systems"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/linux/COPYING;md5=9579385572eb40eded61dcb07e0038a4"
-DEPENDS = "zlib"
-SRCDATE = "20110110"
-PV = "1.1+cvs${SRCDATE}"
-PR = "r1"
-
-SRC_URI = "cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;module=linux"
-S = "${WORKDIR}/linux/scripts/cramfs"
-
-EXTRA_OEMAKE = "\
-    'CC=${CC}' \
-    'CFLAGS=${CFLAGS}' \
-    'LDFLAGS=${LDFLAGS}' \
-"
-
-
-do_compile_prepend() {
-        ln -sf GNUmakefile Makefile
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install mkcramfs ${D}${bindir}
-	install cramfsck ${D}${bindir}
-}
-
-BBCLASSEXTEND = "native"
-
-- 
1.7.9.5




