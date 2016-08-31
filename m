Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3D5B6FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 16:06:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7VG6Tah021572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 31 Aug 2016 09:06:29 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 09:06:29 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 31 Aug 2016 12:06:27 -0400
Message-ID: <f6abe86d225541cbfa7490b3881e9654f5f308cb.1472659303.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1472659303.git.hongxu.jia@windriver.com>
References: <cover.1472659303.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] thin-provisioning-tools: add version 0.6.3
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
X-List-Received-Date: Wed, 31 Aug 2016 16:06:36 -0000
Content-Type: text/plain

It is required by lvm2, since lvm2 could find modprobe correctly
------
|lvm lvchange -a y --config  devices { preferred_names=["^/dev/mapper/",
"^/dev/md/", "^/dev/sd"] }  wrl/pool00
|/usr/sbin/thin_check: execvp failed: No such file or directory
| Check of pool wrl/pool00 failed (status:2). Manual repair required!
------

The thin-provisioning-tools provides /usr/sbin/thin_check.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |  2 +-
 ...01-do-not-strip-pdata_tools-at-do_install.patch | 33 ++++++++++++++++++++++
 .../thin-provisioning-tools_0.6.3.bb               | 17 +++++++++++
 3 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch
 create mode 100755 meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index e452f11..e2feeb3 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -66,6 +66,6 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
 FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
 
-RDEPENDS_${PN} = "bash"
+RDEPENDS_${PN} = "bash thin-provisioning-tools"
 
 CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch b/meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch
new file mode 100644
index 0000000..b4cdda1
--- /dev/null
+++ b/meta-oe/recipes-support/thin-provisioning-tools/files/0001-do-not-strip-pdata_tools-at-do_install.patch
@@ -0,0 +1,33 @@
+From e8be402e20cbdfbd8192a171ac9904d9362103bf Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 31 Aug 2016 01:35:40 -0400
+Subject: [PATCH] do not strip pdata_tools at do_install
+
+It caused QA Issue:
+--------------
+|ERROR: QA Issue: File '/usr/sbin/pdata_tools' from thin-provisioning-tools
+was already stripped, this will prevent future debugging! [already-stripped]
+--------------
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 4264191..ac22042 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -189,7 +189,6 @@ distclean: clean
+ install: bin/pdata_tools
+ 	$(INSTALL_DIR) $(BINDIR)
+ 	$(INSTALL_PROGRAM) bin/pdata_tools $(BINDIR)
+-	$(STRIP) $(BINDIR)/pdata_tools
+ 	ln -s -f pdata_tools $(BINDIR)/cache_check
+ 	ln -s -f pdata_tools $(BINDIR)/cache_dump
+ 	ln -s -f pdata_tools $(BINDIR)/cache_metadata_size
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb
new file mode 100755
index 0000000..61578af
--- /dev/null
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.6.3.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A suite of tools for manipulating the metadata of the dm-thin device-mapper target."
+HOMEPAGE = "https://github.com/jthornber/thin-provisioning-tools"
+LICENSE = "GPLv3"
+SECTION = "devel"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
+           file://0001-do-not-strip-pdata_tools-at-do_install.patch \
+"
+
+SRCREV = "49bfc12e9c7956c1ac134b24afbe1a6a602ce7d5"
+
+DEPENDS += "expat libaio boost"
+
+inherit autotools-brokensep
-- 
2.8.1


