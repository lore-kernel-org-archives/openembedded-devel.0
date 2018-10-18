Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BAEE746E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 07:20:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9I7JmmQ025159
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 00:20:35 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 18 Oct 2018 00:20:22 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Oct 2018 15:20:20 +0800
Message-ID: <1539847220-31624-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH] radvd: remove update-rc.d settings
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
X-List-Received-Date: Thu, 18 Oct 2018 07:20:44 -0000
Content-Type: text/plain

We don't offer /etc/radvd.conf but only radvd.conf.example which would
cause a startup error:
  Starting radvd:
  * /etc/radvd.conf does not exist or is empty.

Remove update-rc.d settings to make it doesn't start by default.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/radvd/radvd.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 06d16a4..59a07d7 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -20,7 +20,7 @@ SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
            file://volatiles.03_radvd \
            file://radvd.default"
 
-inherit autotools update-rc.d useradd pkgconfig systemd
+inherit autotools useradd pkgconfig systemd
 
 SYSTEMD_SERVICE_${PN} = "radvd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
@@ -36,7 +36,7 @@ do_install_append () {
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/radvd
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/radvd
 
-    install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd
+    install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/03_radvd
 
     # Install systemd service files
     install -d ${D}${systemd_unitdir}/system
@@ -54,9 +54,6 @@ do_install_append () {
     done
 }
 
-INITSCRIPT_NAME = "radvd"
-INITSCRIPT_PARAMS = "defaults 20 80"
-
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/radvd/ -M -g nogroup radvd"
 
-- 
2.7.4


