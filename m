Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id D3E0E6B064
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:48:57 +0000 (UTC)
Received: (qmail 5877 invoked by uid 89); 5 Sep 2013 09:48:47 -0000
Received: from unknown (HELO sabrina.webspeed.dk)
	(erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 5 Sep 2013 09:48:47 -0000
From: Emil Petersen <erp@movis.dk>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 11:48:25 +0200
Message-Id: <1378374505-10065-1-git-send-email-erp@movis.dk>
X-Mailer: git-send-email 1.8.4.rc3
Subject: [meta-perl][PATCH] libdevice-serialport-perl_1.04: added
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 09:48:58 -0000

Device::Serialport recipe

Signed-off-by: Emil Petersen <erp@movis.dk>
---
 .../libdevice-serialport-perl_1.04.bb              | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libdevice-serialport-perl/libdevice-serialport-perl_1.04.bb

diff --git a/meta-perl/recipes-perl/libdevice-serialport-perl/libdevice-serialport-perl_1.04.bb b/meta-perl/recipes-perl/libdevice-serialport-perl/libdevice-serialport-perl_1.04.bb
new file mode 100644
index 0000000..0fbb61b
--- /dev/null
+++ b/meta-perl/recipes-perl/libdevice-serialport-perl/libdevice-serialport-perl_1.04.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Device::SerialPort - Linux/POSIX emulation of Win32::SerialPort functions."
+AUTHOR = "Kees Cook <pause.cpan1@outflux.net>"
+HOMEPAGE = "https://metacpan.org/release/Device-SerialPort"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+LIC_FILES_CHKSUM = "file://README;md5=34e53f81e654ff1fb3e5f6c5735bd1f9"
+
+SRC_URI = "http://cpan.metacpan.org/authors/id/C/CO/COOK/Device-SerialPort-${PV}.tar.gz"
+SRC_URI[md5sum] = "82c698151f934eb28c65d1838cee7d9e"
+SRC_URI[sha256sum] = "d392567cb39b4ea606c0e0acafd8ed72320311b995336ece5fcefcf9b150e9d7"
+
+S = "${WORKDIR}/Device-SerialPort-${PV}"
+
+inherit cpan
+
+do_configure_prepend () {
+	mkdir -p m4
+	autoreconf -Wcross --verbose --install --force || oefatal "autoreconf execution failed."
+	sed -i 's:\./configure\(.[^-]\):./configure --build=${BUILD_SYS} --host=${HOST_SYS} --target=${TARGET_SYS} --prefix=${prefix} --exec_prefix=${exec_prefix} --bindir=${bindir} --sbindir=${sbindir} --libexecdir=${libexecdir} --datadir=${datadir} --sysconfdir=${sysconfdir} --sharedstatedir=${sharedstatedir} --localstatedir=${localstatedir} --libdir=${libdir} --includedir=${includedir} --oldincludedir=${oldincludedir} --infodir=${infodir} --mandir=${mandir}\1:' Makefile.PL
+}
+
+BBCLASSEXTEND="native"
-- 
1.8.4.rc3


