Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q7kC5-0006qZ-Oo
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 10:03:57 +0200
Received: by mail-yx0-f175.google.com with SMTP id 22so911579yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=xR1PB0nAi8pBvNNnsKy9Ew6X5yad/WJ5GzGcmvmc0fc=;
	b=tvRQDvAn1ldTa2ZLGRgknlZZUo2MuBGkTNIXMlnZwfP+kOjdGSNYH6ZArjn6SFAHsW
	1p1KuBcphyV6Rnawj+uL/ZIppLiQAlbITKIQvCQPjOZqMbgJQnepAIDp05rrdoqeGX14
	nPB22vMEJvX70dAjazPTyKt3kFWNcHdB4J0Os=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=EH983u/5YhIdUWBSWpc4z6Nb9WHkryqP1Cw3V4XNF8wZBwm7GUzeaWYyhyGGGQE+XG
	9dWkpizi9MMVLr3ZxR8Al20zfDx09j1/mQcPJW+mCItNpOImpubtTgAVjkjRpAqzLFUI
	mPmG264IXNkGnAEDuANWjFXsThQSjl2NOHoHw=
Received: by 10.90.139.17 with SMTP id m17mr499806agd.51.1302163311686;
	Thu, 07 Apr 2011 01:01:51 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c4sm1593468ana.23.2011.04.07.01.01.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 01:01:51 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:31:34 +0530
Message-Id: <1302163296-16002-3-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302163296-16002-1-git-send-email-heroor@gmail.com>
References: <1302163296-16002-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv2 3/5] ti-syslink: Add include file for Syslink Libraries.
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
X-List-Received-Date: Thu, 07 Apr 2011 08:03:57 -0000

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



