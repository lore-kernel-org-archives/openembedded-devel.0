Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PUh2v-0004OU-Py
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 15:49:05 +0100
Received: by yie16 with SMTP id 16so258283yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 06:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Q7VbAhQsiYl4qIdohlXqklcJFo4KAC4LoXe2uCIEK/c=;
	b=kFgjzm/GRcxBOhfstn75lWgvPG/X6FoZqsSb4lxWONaCU/v3xk6nq7c7sGCIuPtVgo
	HJJbxbV626KJP07yZC7+qbQy+Buc5x4dNGo5Qb6n9HffMaeCw1qsYBw9tuQyr36oujVe
	erfZoh5uvOSnZVVLS9FQDFrynoxBYWJlxJNYI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KnXarlaP1RYaU3yMJo+JiUFmRZ7pXg6rAiESPW2n+FjULOIv9BIwryjAgQzCOfgzb4
	7fVfgcFcZeT943QZFhO3XE9sUfjWjl5MWLVLl7s2sGG0hZ0ww6ws7apIbep8XrykjyQK
	ncTQdv9p14YuwdtnflQLy/uxoxJ9BwRgiLVEU=
Received: by 10.150.12.13 with SMTP id 13mr6730312ybl.289.1292856538617;
	Mon, 20 Dec 2010 06:48:58 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id 26sm2076090yhl.23.2010.12.20.06.48.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 06:48:57 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Dec 2010 08:48:53 -0600
Message-Id: <1292856533-26796-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Naresh Medisetty <naresh@ti.com>, Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCHv2] lftb: add ti LFTB recipe
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
X-List-Received-Date: Mon, 20 Dec 2010 14:49:06 -0000

From: Naresh Medisetty <naresh@ti.com>

* This package contains functional test suites for TI devices
  used to verify the Linux kernel and drivers for the various
  peripherals found on TI devices.

Signed-off-by: Naresh Medisetty <naresh@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
Updated in version 2:
    * Address feedback from Khem Raj
        * Change capitalization in DESCRIPTION field
        * Start recipe at r0
        * Remove unneeded 'cd'
    * Address feedback from Paul Menzel
        * Fixed commit message lftp -> lftb
        * Fixed Naresh's author and signed-off-by lines
        * Removed space before () in functions

---
 recipes/ti/ti-lftb.inc    |   46 +++++++++++++++++++++++++++++++++++++++++++++
 recipes/ti/ti-lftb_2.0.bb |    9 ++++++++
 2 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-lftb.inc
 create mode 100644 recipes/ti/ti-lftb_2.0.bb

diff --git a/recipes/ti/ti-lftb.inc b/recipes/ti/ti-lftb.inc
new file mode 100644
index 0000000..166d2d2
--- /dev/null
+++ b/recipes/ti/ti-lftb.inc
@@ -0,0 +1,46 @@
+DESCRIPTION = "Linux Functional Test Bench"
+HOMEPAGE = "http://arago-project.org/git/projects/?p=test-automation/target-code/psp/lftb.git;a=summary"
+LICENSE="BSD"
+
+INC_PR = "r0"
+
+DEPENDS = "virtual/kernel"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+COMPATIBLE_MACHINE = "(dm365|dm355|dm6446|dm6467|omapl137|omapl138|omap3|ti816x)"
+
+S = "${WORKDIR}/git"
+
+#Machine specific overrides
+PLATFORM_omap3evm="omap35x"
+PLATFORM_am180x-evm="am18x"
+PLATFORM_am3517-evm="am3517"
+PLATFORM_am37x-evm="am37x"
+PLATFORM_beagleboard="beagle"
+PLATFORM_da830-omapl137-evm="am17x"
+PLATFORM_da850-omapl138-evm="am18x"
+PLATFORM_am181x-evm="am18x"
+PLATFORM_dm355-evm="dm355"
+PLATFORM_dm365-evm="dm365"
+PLATFORM_dm37x-evm="am37x"
+PLATFORM_dm6446-evm="dm644x"
+PLATFORM_dm6467-evm="dm646x"
+PLATFORM_ti816x="ti816x"
+
+do_compile() {
+    cd ${S}
+    make KERNEL_DIR=${STAGING_KERNEL_DIR} PLATFORM=${PLATFORM} TOOL_PREFIX=${TARGET_PREFIX}
+}
+
+do_install() {
+    install -d ${D}${bindir}/lftb
+    make INSTALL_DIR=${D}${bindir}/lftb install
+
+    # Remove unneeded tarball placed in bindir by install target
+    rm -rf ${D}${bindir}/lftb.tar.gz
+}
+
+INSANE_SKIP_${PN} = True
+
+FILES_${PN} = "${bindir}/lftb"
diff --git a/recipes/ti/ti-lftb_2.0.bb b/recipes/ti/ti-lftb_2.0.bb
new file mode 100644
index 0000000..62c936c
--- /dev/null
+++ b/recipes/ti/ti-lftb_2.0.bb
@@ -0,0 +1,9 @@
+require ti-lftb.inc
+
+SRCREV = "3d0be58aee659ef7e8eda43e916172bab300235f"
+
+PR = "${MACHINE_KERNEL_PR}+${INC_PR}"
+PR_append = "a"
+
+SRC_URI = "git://arago-project.org/git/projects/test-automation/target-code/psp/lftb.git;protocol=git \
+"
-- 
1.7.0.4



