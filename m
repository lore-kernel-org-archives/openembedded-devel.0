Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q7kC4-0006qf-IH
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 10:03:57 +0200
Received: by gxk3 with SMTP id 3so363922gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Z+sepqvktDPtx0bwgiRDJoIONVvjmBE7hvs/W1RCfzc=;
	b=rjhz/HJlAupBIrCjTLvoZmClrFDX1QD7U8sF4Mf+QhJIJGazNOIL4cSVn8ZxkVVgqq
	q764fKjO5onB8xS47S78LOA3ZtFjS7Jf68wydAO+se96t7cwP55Z7il5PgsxaMtZU09F
	rzxD9skEcAyEudijnox1RQkFxl8SPJRoVN+kQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wv3BhghIvBx0uC2vW5DJ43pdPgfvpOVKbPe8ilof5C16HxLqQRK30QHc2bTU2QPw1d
	/w90+dwlDmiQ3DO+59AbyGY7frpbRauoDwgtBel9JozkAUmaFdGSIWQ9sDPzGBPG6aKL
	7sOucM9cEudWCryJflaKyJvdrJ/vTWvv/cnmQ=
Received: by 10.101.87.5 with SMTP id p5mr365485anl.94.1302163308351;
	Thu, 07 Apr 2011 01:01:48 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c4sm1593468ana.23.2011.04.07.01.01.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 01:01:47 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:31:33 +0530
Message-Id: <1302163296-16002-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302163296-16002-1-git-send-email-heroor@gmail.com>
References: <1302163296-16002-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv2 2/5] ti-syslink: Add include file for Syslink Module.
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

* Add Syslink Kernel Module include file for TI816x and TI814x
  device families.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-syslink-module.inc |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink-module.inc

diff --git a/recipes/ti/ti-syslink-module.inc b/recipes/ti/ti-syslink-module.inc
new file mode 100644
index 0000000..10c2d6e
--- /dev/null
+++ b/recipes/ti/ti-syslink-module.inc
@@ -0,0 +1,31 @@
+DESCRIPTION = "SYSLINK Inter-Processor Communications (IPC) Kernel module for TI ARM/DSP processors"
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
+inherit module
+
+S = "${WORKDIR}/syslink_${PV}/ti/syslink/utils/hlos/knl/Linux"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}/exports/syslink_${PV}.tar.gz;name=syslinktarball"
+
+DEPENDS =+ "ti-ipc"
+
+EXTRA_OEMAKE = "ARCH='${TARGET_ARCH}' \
+    CROSS_COMPILE='${TARGET_PREFIX}' \
+    SYSLINK_PLATFORM='${SYSLINKPLATFORM}' \
+    SYSLINK_VARIANT='${SYSLINKVARIANT}' \
+    SYSLINK_LOADER='${SYSLINKLOADER}' \
+    SYSLINK_PKGPATH='${IPC_INSTALL_DIR}/packages' \
+    KDIR='${STAGING_KERNEL_DIR}'"
+
+do_install () {
+    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
+    install -m 0755 ${SYSLINK_ROOT}/ti/syslink/bin/${SYSLINKVARIANT}/syslink.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/
+}
-- 
1.7.0.4



