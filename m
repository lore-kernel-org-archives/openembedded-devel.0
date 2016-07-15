Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED23B6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 05:52:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6F5qrE6023997
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jul 2016 22:52:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 22:52:52 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jul 2016 13:50:41 +0800
Message-ID: <1468561844-10190-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
References: <1468561844-10190-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] grubby: add grubby bb
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
X-List-Received-Date: Fri, 15 Jul 2016 05:52:56 -0000
Content-Type: text/plain

* Add grubby bb

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/grubby/grubby_8.40.bb | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/grubby/grubby_8.40.bb

diff --git a/meta-oe/recipes-support/grubby/grubby_8.40.bb b/meta-oe/recipes-support/grubby/grubby_8.40.bb
new file mode 100644
index 0000000..dc6cc62
--- /dev/null
+++ b/meta-oe/recipes-support/grubby/grubby_8.40.bb
@@ -0,0 +1,38 @@
+SUMMARY = "A command line tool for updating and displaying info about boot loaders"
+DESCRIPTION = "grubby is a command line tool for updating and displaying information \
+about the configuration files for the grub, lilo, elilo (ia64), yaboot (powerpc) and \
+zipl (s390) boot loaders. It is primarily designed to be used from scripts which install \
+new kernels and need to find information about the current boot environment. \
+"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
+
+DEPENDS = "popt util-linux"
+
+SRC_URI = "https://github.com/rhinstaller/${BPN}/archive/${PV}-1.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
+           file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
+           file://run-ptest \
+           file://grubby-remove-bashisms-in-test.sh.patch \
+"
+
+SRC_URI[md5sum] = "1005907b275d6d93368d045274537d86"
+SRC_URI[sha256sum] = "85f1c678484f74c8978e8643451594967defce463a86c35cb1ee56d12767a9df"
+
+S = "${WORKDIR}/${BPN}-${PV}-1"
+
+RDEPENDS_${PN} += "dracut"
+
+inherit autotools-brokensep ptest
+
+EXTRA_OEMAKE = "'CC=${CC}'"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}
+	cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}
+	sed -i 's|./grubby|grubby|' ${D}${PTEST_PATH}/test.sh
+}
+
+RDEPENDS_${PN}-ptest = "util-linux-getopt"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-- 
2.8.1


