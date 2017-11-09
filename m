Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECE8978520
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:06:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA9B6TG2015567
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Nov 2017 03:06:29 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 9 Nov 2017 03:06:28 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Nov 2017 19:04:50 +0800
Message-ID: <323038dad742b8f7a04d629e877a5ad2177afbbb.1510225386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1510225386.git.jackie.huang@windriver.com>
References: <cover.1510225386.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] open-isns: add sysvinit support
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
X-List-Received-Date: Thu, 09 Nov 2017 11:06:29 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

It's not mandatory to depend on systemd for open-isns,
the sysvinit script is also provided in open-isns source
code, so add it to support sysvinit and remove the
distro_features_check.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/open-isns/open-isns_0.97.bb | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
index 420ef5be0..9ee1f87c8 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=321bf41f280cf805086dd5a720b37785"
 SECTION = "net"
 
-DEPENDS = "openssl systemd"
+DEPENDS = "openssl"
 
 SRC_URI = " \
     git://github.com/open-iscsi/open-isns \
@@ -21,9 +21,7 @@ SRCREV ?= "09954404e948e41eb0fce8e28836018b4ce3d20d"
 
 S = "${WORKDIR}/git"
 
-inherit systemd autotools-brokensep distro_features_check
-# depends on systemd
-REQUIRED_DISTRO_FEATURES = "systemd"
+inherit systemd autotools-brokensep update-rc.d
 
 EXTRA_OECONF = " --prefix=${prefix} --enable-shared"
 EXTRA_OEMAKE += "SYSTEMDDIR=${D}${systemd_unitdir}/system"
@@ -31,6 +29,12 @@ EXTRA_OEMAKE += "SYSTEMDDIR=${D}${systemd_unitdir}/system"
 do_install_append () {
     oe_runmake INCDIR=${D}${includedir}/libisns/ install_hdrs
     oe_runmake LIBDIR=${D}${libdir} install_lib
+
+    install -D -m 755 ${S}/etc/openisns.init ${D}${sysconfdir}/init.d/openisns
+    sed -i 's|daemon isnsd|start-stop-daemon --start --quiet --oknodo --exec ${sbindir}/isnsd --|' \
+        ${D}${sysconfdir}/init.d/openisns
 }
 
 FILES_${PN} += "${libdir} ${systemd_unitdir}"
+
+INITSCRIPT_NAME = "openisns"
-- 
2.11.0


