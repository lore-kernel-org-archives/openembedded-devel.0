Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 413857E53A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:36:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8P9ZqTn019805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:36:08 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:36:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:35:36 +0800
Message-ID: <afc2928a9d44cbc743600bbbb18f02b9f73a3e18.1569403988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569403988.git.liezhi.yang@windriver.com>
References: <cover.1569403988.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] fuse: Fix installed-vs-shipped for nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:36:22 -0000
Content-Type: text/plain

There are two problems:
* The /dev is installed to '${D}/dev', not '${D}${base_prefix}'
* The /etc is installed ${D}, but should be ${D}${sysconfdir}

It works for target is because target's base_prefix is NULL, but it isn't work
for native or nativesdk.

Fixed:
$ bitbake nativesdk-fuse
ERROR: nativesdk-fuse-2.9.9-r0 do_package: QA Issue: nativesdk-fuse: Files/directories were installed but not shipped in any package:
  /dev
  /etc
  /etc/init.d
  /etc/udev
  /etc/init.d/fuse
  /etc/udev/rules.d
  /etc/udev/rules.d/99-fuse.rules

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index c83e7f6..95e8706 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -54,7 +54,7 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-    rm -rf ${D}${base_prefix}/dev
+    rm -rf ${D}/dev
 
     # systemd class remove the sysv_initddir only if systemd_system_unitdir
     # contains anything, but it's not needed if sysvinit is not in DISTRO_FEATURES
@@ -69,4 +69,10 @@ do_install_append() {
     fi
 }
 
+do_install_append_class-nativesdk() {
+    install -d ${D}${sysconfdir}
+    mv ${D}/etc/* ${D}${sysconfdir}/
+    rmdir ${D}/etc
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


