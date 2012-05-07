Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SRKSx-0003YP-1W
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 11:42:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q479X0Nn009167
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 May 2012 02:33:00 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 7 May 2012 02:33:00 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 May 2012 17:37:20 +0800
Message-ID: <1336383440-20489-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] lm_sensors: added recipe for v3.3.2
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
X-List-Received-Date: Mon, 07 May 2012 09:42:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

lm_sensors: added recipe for v3.3.2

* Adapted from the recipe for v3.2.0
* Added MANDIR in EXTRA_OEMAKE instead of the moving operation for
  manuals in do_install
* put .a files in _staticdev package

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes/lm_sensors/lmsensors-apps_3.3.2.bb |   48 ++++++++++++++++++++++++++++
 1 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 recipes/lm_sensors/lmsensors-apps_3.3.2.bb

diff --git a/recipes/lm_sensors/lmsensors-apps_3.3.2.bb b/recipes/lm_sensors/lmsensors-apps_3.3.2.bb
new file mode 100644
index 0000000..57a6f3e
--- /dev/null
+++ b/recipes/lm_sensors/lmsensors-apps_3.3.2.bb
@@ -0,0 +1,48 @@
+SUMMARY = "A hardware health monitoring package for Linux"
+DESCRIPTION = "Lm-sensors is a hardware health monitoring package for Linux. \
+               It allows you to access information from temperature, voltage, \
+               and fan speed sensors."
+HOMEPAGE = "http://www.lm-sensors.org/"
+DEPENDS = "sysfsutils virtual/libiconv \
+           bison-native flex-native"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
+
+PR = "r1"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRC_URI = "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "f357ba00b080ab102a170f7bf8bb2578"
+SRC_URI[sha256sum] = "f13dd885406841a7352ccfb8b9ccb23c4c057abe3de4258da5444c149a9e3ae1"
+
+S = "${WORKDIR}/lm_sensors-${PV}"
+
+EXTRA_OEMAKE = 'LINUX=${STAGING_KERNEL_DIR} EXLDFLAGS="${LDFLAGS}" \
+		MACHINE=${TARGET_ARCH} PREFIX=${prefix} CC="${CC}" \
+		AR="${AR}" MANDIR=${mandir}'
+
+do_compile() {
+	oe_runmake user PROG_EXTRA=sensors
+}
+
+do_install() {
+	oe_runmake user_install DESTDIR=${D}
+}
+
+PACKAGES =+ "libsensors libsensors-dev libsensors-staticdev libsensors-dbg libsensors-doc"
+PACKAGES =+ "lmsensors-sensors lmsensors-sensors-dbg lmsensors-sensors-doc"
+PACKAGES =+ "lmsensors-scripts"
+
+FILES_lmsensors-scripts = "${bindir}/*.pl ${bindir}/ddcmon ${sbindir}/fancontrol* ${sbindir}/pwmconfig ${sbindir}/sensors-detect"
+RDEPENDS_lmsensors-scripts += "lmsensors-sensors perl bash"
+
+FILES_lmsensors-sensors = "${bindir}/sensors ${sysconfdir}"
+FILES_lmsensors-sensors-dbg += "${bindir}/.debug/sensors"
+FILES_lmsensors-sensors-doc = "${mandir}/man1 ${mandir}/man5"
+FILES_libsensors = "${libdir}/libsensors.so.*"
+FILES_libsensors-dbg += "${libdir}/.debug"
+FILES_libsensors-dev = "${libdir}/libsensors.so ${includedir}"
+FILES_libsensors-staticdev = "${libdir}/libsensors.a"
+FILES_libsensors-doc = "${mandir}/man3"
-- 
1.7.0.4



