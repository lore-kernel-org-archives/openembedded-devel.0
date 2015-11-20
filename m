Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA3F60107
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 17:32:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKHWedP015630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:32:40 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 09:32:39 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 11:32:38 -0600
Message-ID: <1448040759-137627-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2 v4] netmap-modules: make deterministic builds for drivers
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
X-List-Received-Date: Fri, 20 Nov 2015 17:32:45 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The driver builds are optional, but for deterministic builds,
we should should be able to explicitly enable/disable the
builds for them in a proper place (maybe in BSP).

We use PACKAGECONFIG for listing enabled drivers but can't use
it's arguments since there is no option for each driver, and
the options for drivers are:
 --no-drivers    do not compile any driver
 --no-drivers=   do not compile the given drivers (comma sep.)
 --drivers=      only compile the given drivers (comma sep.)

So add additional logic to add proper configs to EXTRA_OECONF

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-kernel/netmap/netmap-modules_git.bb    | 48 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 7405d51..c4f54e9 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -20,7 +20,53 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --driver-suffix="-netmap" \
                 "
 
-EXTRA_OECONF += "--no-drivers=ixgbe,virtio_net.c"
+# The driver builds are optional, but for deterministic builds,
+# we should be able to explicitly enable/disable the builds
+# for them in a proper place (maybe in BSP).
+# We use PACKAGECONFIG for listing enabled drivers but can't use
+# it's arguments since there is no option for each driver, and
+# the options for drivers are:
+#  --no-drivers    do not compile any driver
+#  --no-drivers=   do not compile the given drivers (comma sep.)
+#  --drivers=      only compile the given drivers (comma sep.)
+#
+# So use the following python code to add proper configs to
+# EXTRA_OECONF and skip arch test for kernel modules.
+#
+# The default is no-drivers, and all supported drivers are listed
+# as PACKAGECONFIG flags.
+PACKAGECONFIG ??= ""
+
+# List all supported drivers, get from "./configure --show-drivers",
+# Add "driver_" prefix for easy distinguishing from other configure
+# options.
+PACKAGECONFIG[driver_ixgbe] = ",,,"
+PACKAGECONFIG[driver_igb] = ",,,"
+PACKAGECONFIG[driver_e1000e] = ",,,"
+PACKAGECONFIG[driver_e1000] = ",,,"
+PACKAGECONFIG[driver_veth.c] = ",,,"
+PACKAGECONFIG[driver_forcedeth.c] = ",,,"
+PACKAGECONFIG[driver_virtio_net.c] = ",,,"
+PACKAGECONFIG[driver_r8169.c] = ",,,"
+
+python __anonymous () {
+    pkgconfigs = d.getVar("PACKAGECONFIG", True).split()
+    pkgconfigflags = d.getVarFlags("PACKAGECONFIG").keys()
+
+    # This is needed since there may be non-driver flags in PACKAGECONFIG
+    all_drivers_list = []
+    for f in pkgconfigflags:
+        if f.startswith('driver_'):
+            all_drivers_list.append(f)
+    drivers_list = []
+    for i in pkgconfigs:
+        if i in all_drivers_list:
+            drivers_list.append(i[len('driver_'):])
+
+    config_drivers = "--drivers=" + ",".join(drivers_list)
+    extra_oeconf_drivers = bb.utils.contains_any('PACKAGECONFIG', all_drivers_list, config_drivers, '--no-drivers', d)
+    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
+}
 
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
-- 
1.9.3


