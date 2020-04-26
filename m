Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4416.1587863932664103426
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 18:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 03Q1IK5Y029560
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Apr 2020 18:18:41 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sat, 25 Apr 2020 18:18:23 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] kea: improve reproducibility
Date: Sun, 26 Apr 2020 09:18:22 +0800
Message-ID: <1587863902-59384-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

There are some shell scripts such as kea-admin,
upgrade_4.0_to_5.0.sh, wipe_data.sh and etc contain
build path.

Actually the build path is meanlingless on the target,
so replace abs_top_builddir to abs_top_builddir_placeholder
to avoid expanding abs_top_builddir which introduces
build path.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-connectivity/kea/kea_1.7.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb b/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
index 51e361c..4e221c3 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.7.6.bb
@@ -35,6 +35,10 @@ BUILD_OPTIMIZATION_append_mipsel = " -O"
 do_configure_prepend_class-target() {
     mkdir -p ${B}/src/lib/log/compiler/
     ln -sf ${STAGING_BINDIR_NATIVE}/kea-msg-compiler ${B}/src/lib/log/compiler/kea-msg-compiler
+    # replace abs_top_builddir to avoid introducing the build path
+    # don't expand the abs_top_builddir on the target as the abs_top_builddir is meanlingless on the target
+    find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g"
+    sed -i "s:@abs_top_srcdir@:@abs_top_srcdir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
 }
 
 do_install_append_class-target() {
-- 
2.7.4

