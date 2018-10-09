Return-Path: <stefan.wiehler@missinglinkelectronics.com>
Received: from smtp.missinglinkelectronics.com
	(smtp.missinglinkelectronics.com [94.130.14.54])
	by mail.openembedded.org (Postfix) with ESMTP id 235F765CC7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 13:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id B35A6E0175
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Oct 2018 15:40:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ngsQSLuwjsdI; Tue,  9 Oct 2018 15:40:55 +0200 (CEST)
Received: from amphore.mle (p578c5bfe.dip0.t-ipconnect.de [87.140.91.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested) (Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 52459E010D;
	Tue,  9 Oct 2018 15:40:55 +0200 (CEST)
From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Oct 2018 15:40:29 +0200
Message-Id: <1539092429-3587-1-git-send-email-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAMKF1sqm2-6+mKtpLfk6jTwugc+vTy2U6mWrrKB8-iL-zV95qw@mail.gmail.com>
References: <CAMKF1sqm2-6+mKtpLfk6jTwugc+vTy2U6mWrrKB8-iL-zV95qw@mail.gmail.com>
Subject: [meta-oe][PATCH v2] nvme-cli: add recipe
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
X-List-Received-Date: Tue, 09 Oct 2018 13:40:55 -0000

NVMe management command line interface.

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---

Change: Use bash-completion class and patch bash completion install path

 ...Makefile-fix-bash-completion-install-path.patch | 33 ++++++++++++++++++++++
 meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb  | 21 ++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
 create mode 100644 meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb

diff --git a/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch b/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
new file mode 100644
index 0000000..ecd4f03
--- /dev/null
+++ b/meta-oe/recipes-extended/nvme-cli/files/0001-Makefile-fix-bash-completion-install-path.patch
@@ -0,0 +1,33 @@
+From ef64032b34190079aab591c64a25f7535a977390 Mon Sep 17 00:00:00 2001
+From: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
+Date: Tue, 9 Oct 2018 11:26:34 +0200
+Subject: [PATCH] Makefile: fix bash completion install path
+
+Change path to bash-completion upstream recommendation used by most
+distributions.
+
+Upstream-Status: Submitted [https://github.com/linux-nvme/nvme-cli/pull/418]
+
+Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fa587dd..433bc41 100644
+--- a/Makefile
++++ b/Makefile
+@@ -69,8 +69,8 @@ install-bin: default
+ 	$(INSTALL) -m 755 nvme $(DESTDIR)$(SBINDIR)
+ 
+ install-bash-completion:
+-	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/bash_completion.d
+-	$(INSTALL) -m 644 -T ./completions/bash-nvme-completion.sh $(DESTDIR)$(PREFIX)/share/bash_completion.d/nvme
++	$(INSTALL) -d $(DESTDIR)$(PREFIX)/share/bash-completion/completions
++	$(INSTALL) -m 644 -T ./completions/bash-nvme-completion.sh $(DESTDIR)$(PREFIX)/share/bash-completion/completions/nvme
+ 
+ install: install-bin install-man install-bash-completion
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
new file mode 100644
index 0000000..9b7e6cd
--- /dev/null
+++ b/meta-oe/recipes-extended/nvme-cli/nvme-cli_1.6.bb
@@ -0,0 +1,21 @@
+SUMMARY = "NVMe management command line interface"
+AUTHOR = "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
+HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
+DEPENDS = "util-linux"
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git \
+           file://0001-Makefile-fix-bash-completion-install-path.patch \
+           "
+SRCREV = "642d426faf8a67ed01e90f7c35c0d967f8cc52a3"
+
+S = "${WORKDIR}/git"
+
+inherit bash-completion
+
+do_install() {
+    oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+}
-- 
1.9.1


