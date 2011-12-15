Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitperov@gmail.com>) id 1RbEb2-0002l3-Us
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 17:55:53 +0100
Received: by eekb15 with SMTP id b15so2002789eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 08:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CxaroN+GLChtIIvIJypEELY0lFumL5RjiD6MSfTMXPg=;
	b=ZpuM4pHrokVV5CVy4TrMUa6g/RLzVYI6tKnv3pE+N/EaXr6NPgJVFeytT/c11xsct9
	0c/TC4T0/rF8QYHSNxzlYE8PYJz7WDc4YZeZHYvmxDqWfjjdR0jSM0v5tOjzi+zzrFLy
	jauoqUpfrEbc+qy10y296xchd6lE9oHtDpaWE=
Received: by 10.14.120.79 with SMTP id o55mr1742202eeh.77.1323967734586;
	Thu, 15 Dec 2011 08:48:54 -0800 (PST)
Received: from localhost.localdomain
	(pppoe-188-187-39-181.volgograd.ertelecom.ru. [188.187.39.181])
	by mx.google.com with ESMTPS id 58sm26069247eet.11.2011.12.15.08.48.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 08:48:53 -0800 (PST)
From: Vitaly Perov <vitperov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 20:48:40 +0400
Message-Id: <1323967720-6899-1-git-send-email-vitperov@gmail.com>
X-Mailer: git-send-email 1.7.6
Cc: Vitaly Perov <vit@vt-tech.eu>
Subject: [PATCH v3] ftplib: add initial recipe with version 3.1
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
X-List-Received-Date: Thu, 15 Dec 2011 16:55:53 -0000

From: Vitaly Perov <vit@vt-tech.eu>

fplib provides a set of routines that implement the FTP protocol.

Build tested with 'angstrom v2011.12' and Angstrom-console-image for machine AT91SAM9260

Signed-off-by: Vitaly Perov <vitperov@gmail.com>
---
 recipes/ftplib/ftplib_3.1.bb |   38 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ftplib/ftplib_3.1.bb

diff --git a/recipes/ftplib/ftplib_3.1.bb b/recipes/ftplib/ftplib_3.1.bb
new file mode 100644
index 0000000..00a49bc
--- /dev/null
+++ b/recipes/ftplib/ftplib_3.1.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "A set of routines that implement the FTP protocol"
+HOMEPAGE = "http://nbpfaus.net/~pfau/ftplib/"
+LICENSE = "LGPLv2"
+
+PR = "r0"
+
+# LDFLAGS are missing in Makefile build section
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+# Use current directory for linking qftp with just-build ftplib
+EXTRA_OEMAKE = "LDFLAGS='${LDFLAGS} -L.'"
+
+SRC_URI = "http://nbpfaus.net/~pfau/ftplib/ftplib-${PV}-src.tar.gz"
+
+S = "${WORKDIR}/ftplib-${PV}"
+
+SRC_URI[md5sum] = "c6af758ccbf806b28f022a587a41d9c5"
+SRC_URI[sha256sum] = "be524e1086cfe9d86afa832e1413dde79a4e88ee8ea5325a87ffaaf6620a0a2b"
+
+do_compile() {
+    cd linux && oe_runmake
+}
+
+do_install() {
+    install -d ${D}/${libdir}
+    install -d ${D}/${includedir}
+    install -d ${D}/${bindir}
+    oe_libinstall -so -C linux libftp ${D}/${libdir}
+    install -m 755 ${S}/linux/libftp.a ${D}/${libdir}
+    install -m 644 ${S}/linux/ftplib.h ${D}/${includedir}
+    install -m 755 ${S}/linux/qftp ${D}/${bindir}
+    (cd  ${D}/${bindir} && \
+     ln -sf qftp ftpdir && \
+     ln -sf qftp ftpget && \
+     ln -sf qftp ftplist && \
+     ln -sf qftp fptrm && \
+     ln -sf qftp ftpsend)
+}
-- 
1.7.6



