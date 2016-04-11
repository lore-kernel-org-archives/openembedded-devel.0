Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8B7CD73185
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 08:34:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5470996"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Apr 2016 16:34:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 1893B42B55EC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2016 16:34:16 +0800 (CST)
Received: from localhost.localdomain (10.167.226.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Mon, 11 Apr 2016 16:34:15 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Apr 2016 01:34:02 -0700
Message-ID: <1460363642-2233-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20160127145110.GH2574@jama>
References: <20160127145110.GH2574@jama>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.27]
X-yoursite-MailScanner-ID: 1893B42B55EC.AC556
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] hwdata: add new recipe
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
X-List-Received-Date: Mon, 11 Apr 2016 08:34:24 -0000
Content-Type: text/plain

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/hwdata/hwdata_0.284.bb | 67 ++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-support/hwdata/hwdata_0.284.bb

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.284.bb b/meta-oe/recipes-support/hwdata/hwdata_0.284.bb
new file mode 100644
index 0000000..91013b6
--- /dev/null
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.284.bb
@@ -0,0 +1,67 @@
+DESCRIPTION = "Hardware identification and configuration data"
+HOMEPAGE = "http://git.fedorahosted.org/git/hwdata.git"
+SECTION = "System/Base"
+
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
+SRC_URI = "https://git.fedorahosted.org/cgit/hwdata.git/snapshot/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "30ba61f058d2c2295fd6b3ab575eb5ce"
+SRC_URI[sha256sum] = "bf08c8e6200467669ffc5919141f7a47cc70756c97b819427e60b6c1a0cdcfa6"
+
+inherit autotools-brokensep
+
+#PROVIDES by hwdata
+#the PROVIDES rules is ignore "pciutils-ids"
+
+PROVIDES += "pciutils-ids"
+
+#PROVIDES by hwdata-ivi
+PROVIDES += "hwdata-ivi"
+
+do_prep() {
+    cd ${S}
+    chmod -Rf a+rX,u+w,g-w,o-w ${S}
+}
+
+do_patch_append() {
+    bb.build.exec_func('do_prep',d)
+}
+
+do_compile() {
+    cd ${S}
+    LANG=C
+    export LANG
+    unset DISPLAY
+    LD_AS_NEEDED=1; export LD_AS_NEEDED ;
+    autotools_do_configure
+}
+
+do_install() {
+    export RPM_BUILD_ROOT=${D}
+    cd ${S}
+    LANG=C
+    export LANG
+    unset DISPLAY
+    rm -rf ${D}
+    mkdir -p ${D}
+
+    oe_runmake \
+        DESTDIR=${D} \
+        INSTALL_ROOT=${D} \
+        BINDIR=${prefix}/bin \
+        install
+        rm -f ${D}${infodir}/dir
+        find ${D} -regex ".*\.la$" | xargs rm -f --
+        find ${D} -regex ".*\.a$" | xargs rm -f --
+        mkdir -p ${D}${sysconfdir}/modprobe.d
+        mv ${D}${prefix}/lib/modprobe.d/dist-blacklist.conf \
+        ${D}${sysconfdir}/modprobe.d/blacklist.conf
+        rm -rf ${D}${prefix}/lib
+        install -m644 blacklist.conf ${D}/${sysconfdir}/modprobe.d
+}
+
+RDEPENDS_${PN}-ivi += "hwdata"
+INSANE_SKIP_${PN}-ivi += "build-deps"
+
+PACKAGES = "${PN} ${PN}-dbg ${PN}-doc ${PN}-locale ${PN}-ivi"
-- 
1.9.1




