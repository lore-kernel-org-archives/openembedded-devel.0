Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8OrX-00079V-70
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 05:29:27 +0200
Received: by gwb11 with SMTP id 11so1481935gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 20:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Z+sepqvktDPtx0bwgiRDJoIONVvjmBE7hvs/W1RCfzc=;
	b=MpIx0YJyyF5VoE4PLqwi5dxj7RxvskmJRt063oWywnOD9reS/SEPTCVzlwcTZ/0Zgi
	kd/T8GfeQNbZ4Cnihv/BxjFM2uEbY47YVMcLpHltJzWMPag1V70d9s+wc4qqEUXGIlk0
	n+YBAKw6Gs4yGxxEf5Kxo/RRJoT7nHNJ6WMh0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jORqr8U/9wgaLkLEVY02ZQdglqqEBljkBFUKBWbLsRDjR0wywl/mGeBtyM/SdDXATy
	qS8sw0cW/pvv4sAqkLJxcDcfngDKmaQE69LxzXXxmxHdiiKXbwcbYC2LWEqXGypE3Unl
	ChLpgDVuEOYz2GQfRutyKHq0VdSi0LgFnuIRc=
Received: by 10.151.63.38 with SMTP id q38mr2738407ybk.423.1302319631830;
	Fri, 08 Apr 2011 20:27:11 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t16sm1767800ybe.19.2011.04.08.20.27.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 20:27:10 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2011 08:56:57 +0530
Message-Id: <1302319620-18223-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302319620-18223-1-git-send-email-heroor@gmail.com>
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv3 2/5] ti-syslink: Add include file for Syslink Module.
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
X-List-Received-Date: Sat, 09 Apr 2011 03:29:27 -0000

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



