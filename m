Return-Path: <adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4928D77E24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 08:15:20 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	v8R8BCY9026370 for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 03:15:22 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2d67v31ttj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 03:15:22 -0500
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod2.natinst.com (8.16.0.21/8.16.0.21) with ESMTPS id
	v8R8FLTp020801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 03:15:21 -0500
Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 27 Sep 2017 03:15:21 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 27 Sep 2017 03:15:20 -0500
Received: from ionel-work.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 27 Sep 2017 03:15:19 -0500
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Sep 2017 11:15:22 +0300
Message-ID: <20170927081522.32576-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1707230000 definitions=main-1709270112
Cc: haris.okanovic@ni.com, brad.mouring@ni.com
Subject: [meta-oe][meta-initramfs][PATCH] mkinitcpio: add new recipe
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
X-List-Received-Date: Wed, 27 Sep 2017 08:15:21 -0000
Content-Type: text/plain

This recipe provides a very flexible and useful tool for building
initfamfs'es from custom directories, having the ability to
auto-detect kernel module dependencies (for kernels built outside OE),
add custom build/runtime hooks, etc.

It can also be used on deployed systems (installed images on targets)
to re-generate the initramfs when a new kernel is installed from a
package feed.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 ...0001-Makefile-don-t-check-asciidoc-output.patch | 35 ++++++++++++++++++++++
 ...efile-don-t-preserve-ownership-on-install.patch | 28 +++++++++++++++++
 .../recipes-devtools/mkinitcpio/mkinitcpio_git.bb  | 30 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch
 create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/files/0002-Makefile-don-t-preserve-ownership-on-install.patch
 create mode 100644 meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb

diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch b/meta-initramfs/recipes-devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch
new file mode 100644
index 000000000..30ce60b6f
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mkinitcpio/files/0001-Makefile-don-t-check-asciidoc-output.patch
@@ -0,0 +1,35 @@
+From 6388c79f5d9458c58451c231eb6163184d6801bc Mon Sep 17 00:00:00 2001
+From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+Date: Tue, 26 Sep 2017 15:28:19 +0300
+Subject: [PATCH 1/2] Makefile: don't check asciidoc output
+
+Don't use xmllint to validate the doc xsl schema because mkinitcpio's
+use of docbook is broken in a cross-compile environment (docbookx.dtd
+can't be found even though it's present in the recipe's sysroot).
+
+Investigating this is time consuming and this check is 99.9% benign
+anyway so it's safe to disable it.
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 264f077..dbbf0a8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -72,7 +72,7 @@ install: all
+ 
+ doc: $(MANPAGES)
+ man/%: man/%.txt Makefile
+-	a2x -d manpage \
++	a2x -L -d manpage \
+ 		-f manpage \
+ 		-a manversion=$(VERSION) \
+ 		-a manmanual="mkinitcpio manual" $<
+-- 
+2.14.1
+
diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/files/0002-Makefile-don-t-preserve-ownership-on-install.patch b/meta-initramfs/recipes-devtools/mkinitcpio/files/0002-Makefile-don-t-preserve-ownership-on-install.patch
new file mode 100644
index 000000000..a22b0631c
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mkinitcpio/files/0002-Makefile-don-t-preserve-ownership-on-install.patch
@@ -0,0 +1,28 @@
+From ed9ce55000e26801b69a38be7c53c8c529313492 Mon Sep 17 00:00:00 2001
+From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+Date: Tue, 26 Sep 2017 18:03:05 +0300
+Subject: [PATCH 2/2] Makefile: don't preserve ownership on install
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index dbbf0a8..db31313 100644
+--- a/Makefile
++++ b/Makefile
+@@ -53,7 +53,7 @@ install: all
+ 	install -m644 -t $(DESTDIR)/usr/lib/initcpio init_functions functions
+ 	install -m644 udev/01-memdisk.rules $(DESTDIR)/usr/lib/initcpio/udev/01-memdisk.rules
+ 
+-	cp -at $(DESTDIR)/usr/lib/initcpio hooks install
++	cp -rt $(DESTDIR)/usr/lib/initcpio hooks install
+ 	install -m644 -t $(DESTDIR)/usr/share/mkinitcpio mkinitcpio.d/*
+ 	install -m644 systemd/mkinitcpio-generate-shutdown-ramfs.service \
+ 			$(DESTDIR)/usr/lib/systemd/system/mkinitcpio-generate-shutdown-ramfs.service
+-- 
+2.14.1
+
diff --git a/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb b/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb
new file mode 100644
index 000000000..2ecbf0bf4
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mkinitcpio/mkinitcpio_git.bb
@@ -0,0 +1,30 @@
+SUMMARY = "mkinitcpio is the next generation of initramfs creation."
+DESCRIPTION = "mkinitcpio is a modular tool for building an initramfs CPIO image, offering many advantages over alternative methods."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
+
+PV = "v23+git${SRCPV}"
+
+# v23 tag
+SRCREV = "12e44319725517b869796bd71dbfd8db6521343a"
+
+SRC_URI = "\
+	git://git.archlinux.org/mkinitcpio.git \
+	file://0001-Makefile-don-t-check-asciidoc-output.patch \
+	file://0002-Makefile-don-t-preserve-ownership-on-install.patch \
+"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += "bash"
+
+DEPENDS += "asciidoc-native libxml2-native xmlto-native"
+
+inherit autotools-brokensep systemd
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "mkinitcpio-generate-shutdown-ramfs.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+FILES_${PN} = "${bindir} ${sysconfdir} ${libdir} /usr/share"
-- 
2.14.1


