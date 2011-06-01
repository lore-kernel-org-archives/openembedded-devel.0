Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pprakash@ti.com>) id 1QRvc4-0003zY-M9
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 02:18:12 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p520DuZC011824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Jun 2011 19:13:56 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p520DtvZ020905
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Jun 2011 19:13:56 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p520DtjI029143
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Jun 2011 19:13:55 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE73.ent.ti.com
	(157.170.170.88) with Microsoft SMTP Server id 8.3.106.1;
	Wed, 1 Jun 2011 19:13:55 -0500
Received: from localhost.localdomain (armmpuhw.am.dhcp.ti.com
	[128.247.107.103])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p520Dtqc016441;	Wed, 1 Jun 2011 19:13:55 -0500
From: Punya Prakash <pprakash@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Jun 2011 14:40:45 -0500
Message-ID: <1306957245-7248-1-git-send-email-pprakash@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] mcf-camera-app: Add new recipe for matrix camera streaming application
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jun 2011 00:18:13 -0000
Content-Type: text/plain

* Support for media controller framework
	* Create and set-up link
 	* Configuration of format for each pad
 	* Streaming for specified duration

Signed-off-by Punya Prakash <pprakash@ti.com>
---
 recipes/ti/mcf-camera-app_1.0.bb |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/mcf-camera-app_1.0.bb

diff --git a/recipes/ti/mcf-camera-app_1.0.bb b/recipes/ti/mcf-camera-app_1.0.bb
new file mode 100644
index 0000000..e2f9e60
--- /dev/null
+++ b/recipes/ti/mcf-camera-app_1.0.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "MCF Camera Application"
+HOMEPAGE = "https://gforge.ti.com/gf/project/mcf_camera_app/"
+LICENSE = "BSD"
+SECTION = "system"
+PRIORITY = "optional"
+
+SRCREV = "3"
+PR = "r0"
+
+DEPENDS += "virtual/kernel"
+
+PLATFORM_am37x-evm = "am3715"
+PLATFORM_beagleboard = "am3715"
+
+INSANE_SKIP_${PN} = "True"
+
+SRC_URI = "svn://gforge.ti.com/svn/mcf_camera_app/;module=trunk;proto=https;user=anonymous;pswd=''"
+
+S = "${WORKDIR}/trunk"
+
+do_compile() {
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	make LINUXKERNEL_INSTALL_DIR="${STAGING_KERNEL_DIR}" PLATFORM="${PLATFORM}"
+}
+
+do_install() {
+	make DESTDIR=${D} install
+}
-- 
1.7.0.4



