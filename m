Return-Path: <stefan.wiehler@missinglinkelectronics.com>
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [94.130.14.54])
	by mail.openembedded.org (Postfix) with ESMTP id D438476068
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 08:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id A83CDE0184
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 10:18:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6p08gERoAgxp; Mon,  8 Oct 2018 10:18:48 +0200 (CEST)
Received: from napf-xenial1.mle (p578c5bfe.dip0.t-ipconnect.de [87.140.91.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 593F0E010D;
	Mon,  8 Oct 2018 10:18:48 +0200 (CEST)
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Oct 2018 10:18:37 +0200
Message-Id: <1538986717-13998-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] nvme-cli: add recipe
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
X-List-Received-Date: Mon, 08 Oct 2018 08:18:48 -0000

NVMe management command line interface.

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb

diff --git a/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
new file mode 100644
index 0000000..68c73ca
--- /dev/null
+++ b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "NVMe management command line interface"
+AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
+HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
+DEPENDS = "util-linux"
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
+SRCREV = "642d426faf8a67ed01e90f7c35c0d967f8cc52a3"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
+
+FILES_${PN} += "${datadir}/bash_completion.d"
-- 
2.7.4


