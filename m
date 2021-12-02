Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78874C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 02:06:40 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2989.1638410799273517302
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Dec 2021 18:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B226a3S003501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Dec 2021 18:06:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 1 Dec 2021 18:06:35 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 1 Dec 2021 18:06:34 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] ostree: add nativesdk support
Date: Thu, 2 Dec 2021 10:06:33 +0800
Message-ID: <20211202020633.859679-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 02:06:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94166

Refer the impment of native, use the same PACKAGECONFIG, EXTRA_OECONF
and similar create_wrapper for ostree

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-extended/ostree/ostree_2021.6.bb   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
index 8f37a7f86..188d934cf 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2021.6.bb
@@ -52,6 +52,13 @@ PACKAGECONFIG:class-native ??= " \
     soup \
 "
 
+PACKAGECONFIG:class-nativesdk ??= " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
+    builtin-grub2-mkconfig \
+    gpgme \
+    soup \
+"
+
 PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
 PACKAGECONFIG[builtin-grub2-mkconfig] = "--with-builtin-grub2-mkconfig, --without-builtin-grub2-mkconfig"
 PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
@@ -89,6 +96,11 @@ EXTRA_OECONF:class-native = " \
     --disable-otmpfile \
 "
 
+EXTRA_OECONF:class-nativesdk = " \
+    --enable-wrpseudo-compat \
+    --disable-otmpfile \
+"
+
 # Path to ${prefix}/lib/ostree/ostree-grub-generator is hardcoded on the
 # do_configure stage so we do depend on it
 SYSROOT_DIR = "${STAGING_DIR_TARGET}"
@@ -106,6 +118,10 @@ do_install:append:class-native() {
     create_wrapper ${D}${bindir}/ostree OSTREE_GRUB2_EXEC="${STAGING_LIBDIR_NATIVE}/ostree/ostree-grub-generator"
 }
 
+do_install:append:class-nativesdk() {
+    create_wrapper ${D}${bindir}/ostree OSTREE_GRUB2_EXEC="$OECORE_NATIVE_SYSROOT/usr/lib/ostree/ostree-grub-generator"
+}
+
 PACKAGE_BEFORE_PN = " \
     ${PN}-dracut \
     ${PN}-grub \
@@ -186,4 +202,4 @@ RRECOMMENDS:${PN} += "kernel-module-overlay"
 SYSTEMD_SERVICE:${PN} = "ostree-remount.service ostree-finalize-staged.path"
 SYSTEMD_SERVICE:${PN}-switchroot = "ostree-prepare-root.service"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0


