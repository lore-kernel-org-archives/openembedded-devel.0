Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C783472F4D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 05:58:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3R5wQC5012175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 22:58:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 26 Apr 2017 22:58:26 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Apr 2017 14:00:25 +0800
Message-ID: <1493272825-7711-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] evince: fix do_install problem
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
X-List-Received-Date: Thu, 27 Apr 2017 05:58:27 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

When building evince for multilib, we would meet the following do_install
error.

  mv: cannot stat [snip]/usr/lib64/systemd/user/evince.service: No such file or directory

Fix to use the correct directory related to systemd in do_install function.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-gnome/recipes-gnome/evince/evince_3.24.0.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb b/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
index 2b75244..aae8e71 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
@@ -30,12 +30,13 @@ do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
     then
         install -d ${D}${systemd_unitdir}/system
-        mv ${D}${libdir}/systemd/user/evince.service ${D}${systemd_unitdir}/system/evince.service
+        mv ${D}${systemd_user_unitdir}/evince.service ${D}${systemd_system_unitdir}/evince.service
     else
         rm -rf ${D}${libdir}/systemd/user/evince.service
     fi
-    rmdir --ignore-fail-on-non-empty ${D}${libdir}/systemd/user
-    rmdir --ignore-fail-on-non-empty ${D}${libdir}/systemd
+    rmdir --ignore-fail-on-non-empty ${D}${systemd_user_unitdir}
+    rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd
+    rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}
 }
 
 PACKAGECONFIG ??= ""
-- 
1.9.1


