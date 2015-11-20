Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 742FF60112
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 11:25:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKBPMLG004630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 03:25:23 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 20 Nov 2015 03:24:17 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 19:24:22 +0800
Message-ID: <1448018662-16386-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] netmap-modules: make deterministic builds for drivers
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
X-List-Received-Date: Fri, 20 Nov 2015 11:25:22 -0000
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
---
 .../recipes-kernel/netmap/netmap-modules_git.bb    | 53 +++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 6365fee..c6da691 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -15,7 +15,58 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --driver-suffix="-netmap" \
                 "
 
-EXTRA_OECONF += "--no-drivers=ixgbe --no-drivers=virtio_net.c"
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
+# Add "dri_" prefix for easy distinguishing from other configure
+# options.
+PACKAGECONFIG[dri_ixgbe] = ",,,"
+PACKAGECONFIG[dri_igb] = ",,,"
+PACKAGECONFIG[dri_e1000e] = ",,,"
+PACKAGECONFIG[dri_e1000] = ",,,"
+PACKAGECONFIG[dri_veth.c] = ",,,"
+PACKAGECONFIG[dri_forcedeth.c] = ",,,"
+PACKAGECONFIG[dri_virtio_net.c] = ",,,"
+PACKAGECONFIG[dri_r8169.c] = ",,,"
+
+python __anonymous () {
+    pkgconfigs = d.getVar("PACKAGECONFIG", True).split()
+    pkgconfigflags = d.getVarFlags("PACKAGECONFIG").keys()
+
+    # This is needed since there may be non-driver flags in PACKAGECONFIG
+    all_drivers_list = []
+    for f in pkgconfigflags:
+        if f.startswith('dri_'):
+            all_drivers_list.append(f)
+    drivers_list = []
+    for i in pkgconfigs:
+        if i in all_drivers_list:
+            drivers_list.append(i[len('dri_'):])
+
+    config_drivers = "--drivers=" + ",".join(drivers_list)
+    extra_oeconf_drivers = bb.utils.contains_any('PACKAGECONFIG', all_drivers_list, config_drivers, '--no-drivers', d)
+    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
+
+    # skip the arch test for kernel modules
+    if drivers_list:
+        for driver in drivers_list:
+            d.setVar("INSANE_SKIP_kernel-module-%s-netmap" % bb.utils.prune_suffix(driver, ['.c'], d), "arch")
+}
 
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
-- 
1.9.1


