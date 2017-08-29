Return-Path: <bruce.ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42AFA78075
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 03:38:07 +0000 (UTC)
Received: from yow-bashfiel-d4.wrs.com (yow-bashfiel-d4.wrs.com
	[128.224.56.94])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTP id v7T3c70G012532;
	Mon, 28 Aug 2017 20:38:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Aug 2017 23:38:07 -0400
Message-Id: <1503977887-29630-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
Subject: [meta-networking][PATCH] wireguard: fix kernel 4.12 build issues
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
X-List-Received-Date: Tue, 29 Aug 2017 03:38:08 -0000

We upgrade the module + tools recipes to fix the following build error:

 wireguard-module/0.0.20170517-r0/WireGuard-0.0.20170517/src/device.c:
 In function 'setup':
 |
 wireguard-module/0.0.20170517-r0/WireGuard-0.0.20170517/src/device.c:269:7:
 error: 'struct net_device' has no member named 'destructor'; did you
 mean 'priv_destructor'?
 |   dev->destructor = destruct;
 |        ^~~~~~~~~~
 |        priv_destructor

We also add a RDEPENDS on "bash" to the wireguard-tools recipe to fix
the following QA issue that appeared with the version bump:

  ERROR: wireguard-tools-0.0.20170810-r0 do_package_qa: QA Issue:
  /usr/bin/wg-quick contained in package wireguard-tools requires
  /bin/bash, but no providers found in RDEPENDS_wireguard-tools?
  [file-rdeps]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 ...eguard-module_0.0.20170517.bb => wireguard-module_0.0.20170810.bb} | 0
 ...ireguard-tools_0.0.20170517.bb => wireguard-tools_0.0.20170810.bb} | 2 +-
 meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20170517.bb => wireguard-module_0.0.20170810.bb} (100%)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20170517.bb => wireguard-tools_0.0.20170810.bb} (93%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
similarity index 100%
rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
similarity index 93%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
index 79d420f1a417..c4ddbcb0e90f 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
@@ -24,4 +24,4 @@ FILES_${PN} = " \
     ${bindir} \
 "
 
-RDEPENDS_${PN} = "wireguard-module"
+RDEPENDS_${PN} = "wireguard-module bash"
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
index 9e38c57ffa5b..b26536d3308c 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
+++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "e9969ebbdf525fcbe91a513db8a5c864"
-SRC_URI[sha256sum] = "7303e973654a3585039f4789e89a562f807f0d6010c7787b9b69ca72aa7a6908"
+SRC_URI[md5sum] = "8dd3e080407b8295c25565a847a4ca27"
+SRC_URI[sha256sum] = "ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7"
 
 S = "${WORKDIR}/WireGuard-${PV}/src/"
-- 
2.5.0


