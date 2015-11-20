Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 585E560107
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 17:32:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAKHWfKJ008019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2015 09:32:41 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 20 Nov 2015 09:32:40 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Nov 2015 11:32:39 -0600
Message-ID: <1448040759-137627-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1448040759-137627-1-git-send-email-mark.hatle@windriver.com>
References: <1448040759-137627-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2 v4] netmap-modules: Modules may not have the same arch as userspace
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
X-List-Received-Date: Fri, 20 Nov 2015 17:32:44 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Kernel modules may not have the same architecture as user space.  So we
tell INSANE_SKIP to skip checking the arch for the modules.  This is
consistent with other kernel modules and the kernel recipe.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index c4f54e9..8930285 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -66,6 +66,11 @@ python __anonymous () {
     config_drivers = "--drivers=" + ",".join(drivers_list)
     extra_oeconf_drivers = bb.utils.contains_any('PACKAGECONFIG', all_drivers_list, config_drivers, '--no-drivers', d)
     d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
+
+    # skip the arch test for kernel modules
+    if drivers_list:
+        for driver in drivers_list:
+            d.setVar("INSANE_SKIP_kernel-module-%s-netmap" % bb.utils.prune_suffix(driver, ['.c'], d), "arch")
 }
 
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
-- 
1.9.3


