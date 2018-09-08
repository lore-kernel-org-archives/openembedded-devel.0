Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70A5678C8A
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 14:34:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w88EYqUY022466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Sep 2018 07:34:52 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 8 Sep 2018 07:34:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Sat, 8 Sep 2018 10:33:34 -0400
Message-ID: <1536417214-146096-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] sanlock: add version 3.6.0
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
X-List-Received-Date: Sat, 08 Sep 2018 14:34:52 -0000
Content-Type: text/plain

A shared storage lock manager.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
new file mode 100644
index 0000000..e9a5792
--- /dev/null
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "A shared storage lock manager"
+DESCRIPTION = "sanlock  is  a lock manager built on shared storage.  Hosts with access \
+to the storage can perform locking.   An  application  running  on  the \
+hosts  is  given  a small amount of space on the shared block device or \
+file, and uses sanlock for its  own  application-specific  synchronization. \
+Internally,  the  sanlock  daemon manages locks using two disk-based \
+lease algorithms: delta leases and paxos leases."
+HOMEPAGE = "https://pagure.io/sanlock"
+SECTION = "utils"
+
+LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
+LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
+
+SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
+          "
+SRCREV = "90b2ffa77edd46bea007b7bb39bfd4d2db2ff7af"
+S = "${WORKDIR}/git"
+
+DEPENDS = "libaio util-linux"
+
+inherit distutils
+
+do_configure[noexec] = "1"
+
+do_compile_prepend () {
+    oe_runmake -C wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
+    oe_runmake -C src CMD_LDFLAGS="${LDFLAGS}" LIB_ENTIRE_LDFLAGS="${LDFLAGS}" LIB_CLIENT_LDFLAGS="${LDFLAGS}"
+    cd ${S}/python
+}
+
+do_install_prepend () {
+    oe_runmake -C wdmd DESTDIR=${D} install
+    oe_runmake -C src DESTDIR=${D} install
+    cd ${S}/python
+}
-- 
2.8.1


