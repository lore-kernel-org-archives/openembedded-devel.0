Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8F86E26B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 10:03:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAIA2KKl012976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:02:55 -0800
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 18 Nov 2015 02:02:17 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Nov 2015 18:02:21 +0800
Message-ID: <1447840941-29496-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] netmap-modules: make deterministic builds for drivers
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
X-List-Received-Date: Wed, 18 Nov 2015 10:03:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The driver builds are optional, but for deterministic builds,
we should should be able to explicitly enable/disable the
builds for them in a proper place (maybe in BSP).
But we can't use PACKAGECONFIG since there is no option for
each driver, and the options are:
 --no-drivers    do not compile any driver
 --no-drivers=   do not compile the given drivers (comma sep.)
 --drivers=      only compile the given drivers (comma sep.)

So use NETMAP_DRIVERS to list the needed drivers and add proper
configs to EXTRA_OECONF, the default is no drivers, and all
supported drivers are listed in NETMAP_ALL_DRIVERS.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-kernel/netmap/netmap-modules_git.bb    | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 6365fee..cfe5ce9 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -15,7 +15,36 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --driver-suffix="-netmap" \
                 "
 
-EXTRA_OECONF += "--no-drivers=ixgbe --no-drivers=virtio_net.c"
+# The driver builds are optional, but for deterministic builds,
+# we should be able to explicitly enable/disable the builds
+# for them in a proper place (maybe in BSP).
+# But we can't use PACKAGECONFIG since there is no option for
+# each driver, and the options are:
+#  --no-drivers    do not compile any driver
+#  --no-drivers=   do not compile the given drivers (comma sep.)
+#  --drivers=      only compile the given drivers (comma sep.)
+#
+# So use NETMAP_DRIVERS and the following python code to add proper
+# configs to EXTRA_OECONF and skip arch test for kernel modules.
+#
+# The default is no-drivers, and all supported drivers are listed
+# in NETMAP_ALL_DRIVERS.
+NETMAP_DRIVERS ??= ""
+NETMAP_ALL_DRIVERS = "ixgbe igb e1000e e1000 veth.c forcedeth.c virtio_net.c r8169.c"
+
+python __anonymous () {
+    drivers_list = d.getVar("NETMAP_DRIVERS", True).split()
+    all_drivers_list = d.getVar("NETMAP_ALL_DRIVERS", True).split()
+    config_drivers = "--drivers=" + ",".join(drivers_list)
+
+    extra_oeconf_drivers = bb.utils.contains_any('NETMAP_DRIVERS', all_drivers_list, config_drivers, '--no-drivers', d)
+    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
+
+    # skip the arch test for kernel modules
+    if drivers_list:
+        for driver in drivers_list:
+            d.setVar("INSANE_SKIP_kernel-module-%s-netmap" % driver, "arch")
+}
 
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
-- 
1.9.1


