Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8OrW-000797-LW
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 05:29:26 +0200
Received: by gwb11 with SMTP id 11so1481942gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 20:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=xR1PB0nAi8pBvNNnsKy9Ew6X5yad/WJ5GzGcmvmc0fc=;
	b=bEwFbOM6KXuVxEPJJPrxKhk5WuIi8jBYNWuGLOZCFjUsZGAN8UkHNyJPb1auKAToyR
	kegIjBkiSNP17JWE7Rs7hNK22P7X0W24FhmTsmezJGqOtI19BuJwTRXrBFrmM8Fn71kX
	P9Qy8QKnBeSjy2LyZsDDX2dyinQBjMDOxfe2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JPEat0aZjY8X7pgp0DANpGnW1OnJcRBykK2+SndmgvbROVluN3fKymZMFSF3oLG8Ba
	3JtaWdrCEV6b3FdyY16tITDqf7EDxP2y8KHRcL4kS1F+k7sKtHxLLQfpwkz2zZbG541h
	Yt1wEA7fsO7Pv70I1TgT+hRmrsU1QGbgpuiaw=
Received: by 10.151.144.19 with SMTP id w19mr2516094ybn.357.1302319635245;
	Fri, 08 Apr 2011 20:27:15 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t16sm1767800ybe.19.2011.04.08.20.27.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 20:27:14 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2011 08:56:58 +0530
Message-Id: <1302319620-18223-3-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302319620-18223-1-git-send-email-heroor@gmail.com>
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv3 3/5] ti-syslink: Add include file for Syslink Libraries.
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
X-List-Received-Date: Sat, 09 Apr 2011 03:29:26 -0000

From: Siddharth Heroor <heroor@ti.com>

* Add Syslink libraries for TI816x and TI814x device families.
* Build and stage both Linux and DSP side library files.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-syslink-libs.inc |   45 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink-libs.inc

diff --git a/recipes/ti/ti-syslink-libs.inc b/recipes/ti/ti-syslink-libs.inc
new file mode 100644
index 0000000..fff36b6
--- /dev/null
+++ b/recipes/ti/ti-syslink-libs.inc
@@ -0,0 +1,45 @@
+DESCRIPTION = "SYSLINK Inter-Processor Communications (IPC) libraries for TI ARM/DSP processors"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/syslink/index.html"
+SECTION = "devel"
+LICENSE = "BSD"
+
+COMPATIBLE_MACHINE = "(ti816x|ti814x)"
+
+require ti-paths.inc
+require ti-staging.inc
+require ti-syslink-common.inc
+
+S = "${WORKDIR}/syslink_${PV}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}/exports/syslink_${PV}.tar.gz;name=syslinktarball"
+
+DEPENDS = "ti-sysbios ti-xdctools ti-cgt6x ti-ipc"
+
+EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
+    CROSS_COMPILE='${TARGET_PREFIX}' \
+    SYSLINK_PLATFORM='${SYSLINKPLATFORM}' \
+    SYSLINK_VARIANT='${SYSLINKVARIANT}' \
+    SYSLINK_LOADER='${SYSLINKLOADER}' \
+    SYSLINK_PKGPATH='${IPC_INSTALL_DIR}/packages' \
+    KDIR='${STAGING_KERNEL_DIR}'"
+
+do_compilexdc() {
+    cd ${S}/ti/syslink 
+    ${XDC_INSTALL_DIR}/xdc .make -PR .
+    ${XDC_INSTALL_DIR}/xdc clean -PR .
+    ${XDC_INSTALL_DIR}/xdc .interfaces -PR .
+    ${XDC_INSTALL_DIR}/xdc -PR . 
+}
+
+addtask compilexdc after do_configure before do_compile
+
+do_compile() {
+    cd ${S}/ti/syslink/utils/hlos/usr/Linux
+    oe_runmake
+}
+
+do_install () {
+    # Install/Stage the Source Tree
+    install -d ${D}${SYSLINK_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${SYSLINK_INSTALL_DIR_RECIPE}
+}
-- 
1.7.0.4



