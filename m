Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA6F37F7CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 07:00:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00F70FcR024386
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 23:00:25 -0800
Received: from localhost (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 14 Jan 2020 23:00:03 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 15 Jan 2020 15:00:01 +0800
Message-ID: <20200115070001.9745-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.174]
Subject: [meta-oe][PATCH] multipath-tools: fix libudevdir
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
X-List-Received-Date: Wed, 15 Jan 2020 07:00:35 -0000
Content-Type: text/plain

Specify libudevdir explicitly because it is expanded to /usr/lib/udev
rather than /lib/udev by default.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../multipath-tools/multipath-tools_0.8.3.bb                | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb
index 358f0cb60..9e2d86b9a 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.3.bb
@@ -73,6 +73,7 @@ EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
                 bindir=${base_sbindir} \
                 LIB=${base_libdir} libdir=${base_libdir}/multipath \
                 unitdir=${systemd_system_unitdir} \
+                libudevdir=${nonarch_base_libdir}/udev \
                 ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
                '
 
@@ -86,6 +87,9 @@ do_install() {
         cp ${WORKDIR}/multipathd.oe ${D}${sysconfdir}/init.d/multipathd
     fi
 
+    sed -i "s:/usr/lib/udev/kpartx_id:${nonarch_base_libdir}/udev/kpartx_id:g" \
+        ${D}${nonarch_base_libdir}/udev/rules.d/11-dm-mpath.rules
+
     install -d ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/multipath.conf.example \
     ${D}${sysconfdir}/multipath.conf.example
@@ -106,7 +110,7 @@ FILES_${PN}-dev += "${base_libdir}/pkgconfig"
 
 PACKAGES =+ "kpartx"
 FILES_kpartx = "${base_sbindir}/kpartx \
-                ${nonarch_libdir}/udev/kpartx_id \
+                ${nonarch_base_libdir}/udev/kpartx_id \
                "
 
 RDEPENDS_${PN} += "kpartx"
-- 
2.17.1


