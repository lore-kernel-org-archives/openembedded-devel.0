Return-Path: <stefan.wiehler@missinglinkelectronics.com>
X-Greylist: delayed 526 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Oct 2019 13:53:25 UTC
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [94.130.14.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5B41B7D58A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 13:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id 27B77E0186
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:44:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id I_XyREyfgXNa; Mon,  7 Oct 2019 15:44:39 +0200 (CEST)
Received: from pfanne-bionic1.mle (p578c5bfe.dip0.t-ipconnect.de
	[87.140.91.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id CB6E4E011C;
	Mon,  7 Oct 2019 15:44:39 +0200 (CEST)
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Oct 2019 15:42:49 +0200
Message-Id: <20191007134249.44689-1-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nvme-cli: upgrade 1.6 -> 1.9
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
X-List-Received-Date: Mon, 07 Oct 2019 13:53:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 ...ile-fix-bash-completion-install-path.patch | 33 -------------------
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.6.bb  | 21 ------------
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb  | 29 ++++++++++++++++
 3 files changed, 29 insertions(+), 54 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
 delete mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.6.bb
 create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb

diff --git a/meta-oe/recipes-bsp/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch b/meta-oe/recipes-bsp/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
deleted file mode 100644
index 154e1401a..000000000
--- a/meta-oe/recipes-bsp/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ef64032b34190079aab591c64a25f7535a977390 Mon Sep 17 00:00:00 2001
-From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
-Date: Tue, 9 Oct 2018 11:26:34 +0200
-Subject: [PATCH] Makefile: fix bash completion install path
-
-Change path to bash-completion upstream recommendation used by most
-distributions.
-
-Upstream-Status: Accepted
-
-Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index fa587dd..433bc41 100644
---- a/Makefile
-+++ b/Makefile
-@@ -69,8 +69,8 @@ install-bin: default
- 	$(INSTALL) -m 755 nvme $(DESTDIR)$(SBINDIR)
- 
- install-bash-completion:
--	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/bash_completion.d
--	$(INSTALL) -m 644 -T ./completions/bash-nvme-completion.sh $(DESTDIR)$(PREFIX)/share/bash_completion.d/nvme
-+	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/bash-completion/completions
-+	$(INSTALL) -m 644 -T ./completions/bash-nvme-completion.sh $(DESTDIR)$(PREFIX)/share/bash-completion/completions/nvme
- 
- install: install-bin install-man install-bash-completion
- 
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.6.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.6.bb
deleted file mode 100644
index 9b7e6cd4d..000000000
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.6.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "NVMe management command line interface"
-AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
-HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
-DEPENDS = "util-linux"
-PV .= "+git${SRCPV}"
-
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git \
-           file://0001-Makefile-fix-bash-completion-install-path.patch \
-           "
-SRCREV = "642d426faf8a67ed01e90f7c35c0d967f8cc52a3"
-
-S = "${WORKDIR}/git"
-
-inherit bash-completion
-
-do_install() {
-    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-}
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
new file mode 100644
index 000000000..256d83f03
--- /dev/null
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
@@ -0,0 +1,29 @@
+SUMMARY = "NVMe management command line interface"
+AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
+HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
+DEPENDS = "util-linux util-linux-native"
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
+SRCREV = "977e7d4cf59c3c7f89e9c093c91f991b07292e45"
+
+S = "${WORKDIR}/git"
+
+inherit bash-completion systemd
+
+do_install() {
+    oe_runmake install DESTDIR=${D} PREFIX=${prefix} \
+        UDEVDIR=${nonarch_base_libdir}/udev SYSTEMDDIR=${systemd_unitdir}
+}
+
+pkg_postinst_ontarget_${PN}() {
+    ${sbindir}/nvme gen-hostnqn > ${sysconfdir}/nvme/hostnqn
+}
+
+PACKAGES =+ "${PN}-dracut ${PN}-zsh-completion"
+
+FILES_${PN}-dracut = "${libdir}/dracut/dracut.conf.d"
+FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
-- 
2.19.2


