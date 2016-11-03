Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B24860720
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 09:06:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA3967FQ022244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Nov 2016 02:06:07 -0700 (PDT)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 3 Nov 2016 02:06:07 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 3 Nov 2016 17:06:05 +0800
Message-ID: <1478163965-116209-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] fix QA Issue for opensaf
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
X-List-Received-Date: Thu, 03 Nov 2016 09:06:09 -0000
Content-Type: text/plain

Move the do_sysvinit_install contents to do_install_append.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
index da9c105..6ceb225 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
@@ -53,6 +53,11 @@ do_install_append() {
     install -m 0644 ${B}/osaf/services/infrastructure/nid/config/opensafd.service \
         ${D}${systemd_unitdir}/system
     install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_unitdir}/system
+
+    if [ ! -d "${D}${sysconfdir}/init.d" ]; then
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
+    fi
 }
 
 FILES_${PN} += "${localstatedir}/run ${systemd_unitdir}/system/*.service"
@@ -62,12 +67,3 @@ INSANE_SKIP_${PN} = "dev-so"
 
 RDEPENDS_${PN} += "bash python"
 
-do_sysvinit_install() {
-    if [ ! -d "${D}${sysconfdir}/init.d" ]; then
-       install -d ${D}${sysconfdir}/init.d
-       install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
-    fi
-}
-
-addtask sysvinit_install after do_install before do_package
-
-- 
2.7.4


