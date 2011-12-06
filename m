Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXsUg-0006nq-PM
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:43:26 +0100
Received: by mail-ey0-f175.google.com with SMTP id c1so1404220eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 02:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=c24PbDdpzJWr/xHLx9VzxU5SiQMHf+cjERLpV7wkP9M=;
	b=jAWNVWbQLhVNfeATL8OnqMn1RjiN2hTumVsQ/T1sy0ewhbJmRoMBWJCitqpB8qo5+G
	cud9sj8gojLlsdp6jMvqwOg0qzOekJ/N9kGkvnLxLDm5IiXWQ9/WhbCUSd4Mxe1uPxGE
	yq8nHDHpxTzEkYALBLXqcUzXhYXEoTOPYuLhU=
Received: by 10.213.29.130 with SMTP id q2mr2137115ebc.85.1323167801742;
	Tue, 06 Dec 2011 02:36:41 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm69632347eec.10.2011.12.06.02.36.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:36:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 11:36:08 +0100
Message-Id: <af50ba2d39e55bbf3e603353e73d19953415c267.1323167378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <78add3cb4853a6c50ac4f8b41f92b85d6c31a6b3.1323167378.git.Martin.Jansa@gmail.com>
References: <78add3cb4853a6c50ac4f8b41f92b85d6c31a6b3.1323167378.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323167378.git.Martin.Jansa@gmail.com>
References: <cover.1323167378.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/5] syslog-ng: upgrade to latest version from 3.2 series and rework modules.conf fix
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
X-List-Received-Date: Tue, 06 Dec 2011 10:43:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   12 ++++++------
 .../recipes-support/syslog-ng/syslog-ng_3.2.2.bb   |   10 ----------
 .../recipes-support/syslog-ng/syslog-ng_3.2.5.bb   |   10 ++++++++++
 3 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 073b6d6..c57c5ab 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -28,17 +28,20 @@ EXTRA_OECONF = " \
 "
 
 do_configure_prepend() {
-	eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
+        eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
 }
 
+# rename modules.conf because it breaks update-modules 
+# see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
 do_install_append() {
+        mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf
+        sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D}/${sysconfdir}/scl.conf
         install -d ${D}/${sysconfdir}/${PN}
         install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
 }
 
-PACKAGES =+ "${PN}-config"
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
@@ -46,10 +49,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
             ${datadir}/include/scl/ ${datadir}/xsd"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
-# moved intentionaly to ${PN}-config without RDEPENDing on it, because it breaks update-modules 
-# see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
-FILES_${PN}-config += "${syconfdir}/modules.conf"
-CONFFILES_${PN} = "${sysconfdir}/${PN}.conf"
+CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
 
 pkg_postinst_${PN} () {
         /etc/init.d/syslog stop
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
deleted file mode 100644
index c8b5ac8..0000000
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require syslog-ng.inc
-PR = "${INC_PR}.2"
-
-SRC_URI += " \
-  file://syslog-ng.conf \
-  file://initscript \
-"
-
-SRC_URI[md5sum] = "ed8ebe559d52a63fb61e3e2db566643f"
-SRC_URI[sha256sum] = "fa5abd4d99acee8fff8217061fb2407698a5bc89804d69f3ae97bffc72fcce48"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
new file mode 100644
index 0000000..ff1e247
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
@@ -0,0 +1,10 @@
+require syslog-ng.inc
+PR = "${INC_PR}.0"
+
+SRC_URI += " \
+  file://syslog-ng.conf \
+  file://initscript \
+"
+
+SRC_URI[md5sum] = "60737452ce898f9dc7170dfdc9bfd732"
+SRC_URI[sha256sum] = "ffc9f3a0ebea836c1c737b1ff49efe731d885af1d8aacf9eca79d9144eeefa89"
-- 
1.7.8



