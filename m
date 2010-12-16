Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1PTmdB-0001KD-BN
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 03:34:45 +0100
Received: by gwj22 with SMTP id 22so726896gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Dec 2010 18:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=LFkByMBZro9ir17qbms2n9hyRnTA0ZIigHTjVU9FY9k=;
	b=KoPpGrxMbbGknGwUPwqr5ajYkhtXrc0zacCmeE5Jy8Xl3Qbfmj9Phqh16m/wLy6waP
	M1/VkEk5r0Axr3bJpg5AP/pKSjF8RWEm8WOoB8iKGmJhzne67OXELwBXKZbooJFYkyte
	uPFdRVlI6VV9bcWsRf79C7xv5MWQyKaBY5fjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=G8aqQN9Tu4ftgGKLEDuFW43RimmO+5KGfU48KiG10Iqm/O6b2kWRfrZT63Z/eDpmCB
	O0uPC9uwrYuxKwc6lYeo+urxKWS6IeleBu2F2t7F70aU5pM5xMUn36QIt39a1YTMoxHA
	NBv0N7ykUGQrdfIrYOhc6G98aCypANuqCU848=
Received: by 10.236.102.161 with SMTP id d21mr3089594yhg.82.1292521612068;
	Thu, 16 Dec 2010 09:46:52 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id v8sm178511yhg.40.2010.12.16.09.46.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 16 Dec 2010 09:46:51 -0800 (PST)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Dec 2010 11:46:48 -0600
Message-Id: <1292521608-26072-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: naresh <naresh@ti.com>, Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] lftp: add ti LFTB recipe
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
X-List-Received-Date: Sat, 18 Dec 2010 02:34:45 -0000

From: naresh <naresh@ti.com>

* This package contains functional test suites for TI devices
  used to verify the Linux kernel and drivers for the various
  peripherals found on TI devices.

Signed-off-by: naresh <naresh@ti.com>
Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/ti-lftb.inc    |   47 +++++++++++++++++++++++++++++++++++++++++++++
 recipes/ti/ti-lftb_2.0.bb |    9 ++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-lftb.inc
 create mode 100644 recipes/ti/ti-lftb_2.0.bb

diff --git a/recipes/ti/ti-lftb.inc b/recipes/ti/ti-lftb.inc
new file mode 100644
index 0000000..176f983
--- /dev/null
+++ b/recipes/ti/ti-lftb.inc
@@ -0,0 +1,47 @@
+DESCRIPTION = "Linux Functional test bench"
+HOMEPAGE = "http://arago-project.org/git/projects/?p=test-automation/target-code/psp/lftb.git;a=summary"
+LICENSE="BSD"
+
+INC_PR = "r1"
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
+do_compile () {
+    cd ${S}
+    make KERNEL_DIR=${STAGING_KERNEL_DIR} PLATFORM=${PLATFORM} TOOL_PREFIX=${TARGET_PREFIX}
+}
+
+do_install () {
+    install -d ${D}${bindir}/lftb
+    cd ${S}
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



