Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9D679567
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:56:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8HFtmq8006587
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 08:55:58 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Sep 2018 08:55:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 18 Sep 2018 00:05:10 +0800
Message-ID: <834ccb2e89f7f797d32d7cd4a4888bc9fe56717e.1537199591.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1537199591.git.hongxu.jia@windriver.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/19] fuse: split one dpg package only
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
X-List-Received-Date: Mon, 17 Sep 2018 15:56:23 -0000
Content-Type: text/plain

Multiple -dbg packages per recipe is not encouraged, and only one is
recommended and the code only works properly in some cases for one.

Add RPROVIDES_${PN}-dbg to be compatiable with previous dbg packages
requiring.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
index 1815aa5..caa75c7 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
@@ -31,7 +31,9 @@ SYSTEMD_SERVICE_${PN} = ""
 
 DEPENDS = "gettext-native"
 
-PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev libulockmgr-dbg"
+PACKAGES =+ "fuse-utils libulockmgr libulockmgr-dev"
+
+RPROVIDES_${PN}-dbg += "fuse-utils-dbg libulockmgr-dbg"
 
 RRECOMMENDS_${PN}_class-target = "kernel-module-fuse libulockmgr fuse-utils"
 
@@ -40,13 +42,11 @@ FILES_${PN}-dev += "${libdir}/libfuse*.la"
 
 FILES_libulockmgr = "${libdir}/libulockmgr.so.*"
 FILES_libulockmgr-dev += "${libdir}/libulock*.la"
-FILES_libulockmgr-dbg += "${libdir}/.debug/libulock*"
 
 # Forbid auto-renaming to libfuse-utils
 FILES_fuse-utils = "${bindir} ${base_sbindir}"
-FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
 DEBIAN_NOAUTONAME_fuse-utils = "1"
-DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-dbg = "1"
 
 do_configure_prepend() {
     # Make this explicit so overriding base_sbindir propagates properly.
-- 
2.7.4


