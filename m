Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6X-0006Vo-8m
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:05 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=xj5tE5Q+1IKDf4pR/QZb9+ZROUayvGaXJOy/ADqJFl0=;
	b=i7UxQlwEx387nN9VT+1CcUGexUoAGMQi/QAxesnyHONjTlAH8q5bnqcvio7DTgxfoZ
	hDXyYErhhQxI3843+7ZxS95dHxwF9e3bo/C1Q4xaXf2cjnlTtci2XPORr6DoW+YDIgq+
	pKDc1qK1tCiWiDv3DpQQXb83lNFRESkYbTSmx78BoNAFn0jiY0Vnn5e33dnnVQntXyKG
	Xd2GLckOX+gR8wIBahMKdHldU2EhS2ln7bXz8o+GgUdXc2Ud481mmBdF0rowOmenh+TX
	g9tfkcemO3CQ1jCaV7xWE0RyOajXxwMLUXV2gbsybSCv0hAnMm7vmHCYssThTO0eoCsc
	84Eg==
Received: by 10.14.27.136 with SMTP id e8mr74680eea.156.1342170773071;
	Fri, 13 Jul 2012 02:12:53 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id x52sm23162259eea.11.2012.07.13.02.12.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:56 +0200
Message-Id: <1342170730-14982-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnOcQiEAChqHGvuVcvKgs1CdSotTC7MsCHyX/AOxWY9wom8WURmpZtB2y5MoWR8npRLvwC7
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>, eric@eukrea.com
Subject: [for-denzil][meta-oe 10/24] owfs: update to 2.8p15
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:05 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-extended/owfs/owfs_2.8p14.bb |   65 --------------------------
 meta-oe/recipes-extended/owfs/owfs_2.8p15.bb |   65 ++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/owfs/owfs_2.8p14.bb
 create mode 100644 meta-oe/recipes-extended/owfs/owfs_2.8p15.bb

diff --git a/meta-oe/recipes-extended/owfs/owfs_2.8p14.bb b/meta-oe/recipes-extended/owfs/owfs_2.8p14.bb
deleted file mode 100644
index 1acdcf9..0000000
--- a/meta-oe/recipes-extended/owfs/owfs_2.8p14.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-DESCRIPTION = "1-Wire file system"
-HOMEPAGE = "http://www.owfs.org/"
-SECTION = "console/network"
-
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-DEPENDS = "fuse virtual/libusb0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
-           file://owhttpd \
-           file://owserver "
-SRC_URI[md5sum] = "cd213fd9bbfed95cca2c833c0f14dd72"
-SRC_URI[sha256sum] = "88b6ee5e7e4d3fe6f4faf021948236162219cf5d1ff4bf3844e62e6ae2635b23"
-
-inherit autotools update-rc.d
-
-EXTRA_OECONF = " \
-                 --with-fuseinclude=${STAGING_INCDIR} \
-                 --with-fuselib=${STAGING_LIBDIR} \
-                 --enable-owhttpd \
-                 --enable-cache \
-                 --enable-mt \
-                 --disable-swig \
-                 --disable-owtcl \
-                 "
-
-do_install_prepend() {
-        install -d ${D}${sysconfdir}/default/
-        install -d ${D}${sysconfdir}/init.d/
-        install -m 0755 ${WORKDIR}/owhttpd ${D}${sysconfdir}/init.d/owhttpd
-        install -m 0755 ${WORKDIR}/owserver ${D}${sysconfdir}/init.d/owserver
-}
-
-PACKAGES =+ "owftpd owhttpd owserver owshell libowcapi libow libownet owmon owtap"
-
-DESCRIPTION_owftpd = "Anoymous FTP server for 1-wire access"
-DESCRIPTION_owhttpd = "Tiny webserver for 1-wire control"
-DESCRIPTION_owserver = "Backend server (daemon) for 1-wire control"
-DESCRIPTION_owshell = "owdir owread owwrite owpresent owget - lightweight owserver access"
-DESCRIPTION_libowcapi = "easy C-language 1-wire interface "
-DESCRIPTION_libow = "easy C-language 1-wire interface to the owserver protocol"
-DESCRIPTION_libownet = "easy C-language 1-wire interface to the owserver protocol"
-DESCRIPTION_owmon = "Monitor for owserver settings and statistics"
-DESCRIPTION_owtap = "Packet sniffer for the owserver protocol"
-
-FILES_owftpd = "${bindir}/owftpd"
-FILES_owhttpd = "${bindir}/owhttpd ${sysconfdir}/init.d/owhttpd"
-FILES_owserver = "${bindir}/owserver ${sysconfdir}/init.d/owserver"
-FILES_owshell = "${bindir}/owread ${bindir}/owwrite \
-                 ${bindir}/owdir ${bindir}/owpresent \
-                 ${bindir}/owget ${bindir}/owside"
-FILES_owmon = "${bindir}/owmon"
-FILES_owtap = "${bindir}/owtap"
-FILES_libowcapi = "${libdir}/libowcapi-*"
-FILES_libow = "${libdir}/libow-*"
-FILES_libownet = "${libdir}/libownet-*"
-
-INITSCRIPT_PACKAGES = "owhttpd owserver"
-INITSCRIPT_NAME_owserver = "owserver"
-INITSCRIPT_NAME_owhttpd = "owhttpd"
-INITSCRIPT_PARAMS_owserver = "defaults 20"
-INITSCRIPT_PARAMS_owhttpd = "defaults 21"
-
diff --git a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
new file mode 100644
index 0000000..451aaae
--- /dev/null
+++ b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
@@ -0,0 +1,65 @@
+DESCRIPTION = "1-Wire file system"
+HOMEPAGE = "http://www.owfs.org/"
+SECTION = "console/network"
+
+LICENSE = "GPLv2 & LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
+
+DEPENDS = "fuse virtual/libusb0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \
+           file://owhttpd \
+           file://owserver "
+SRC_URI[md5sum] = "24ec3d04ded1b199831f03e70d9e2f1f"
+SRC_URI[sha256sum] = "5bbc4ff01865e114f52ef75fd7dd3a5ee52b9ad6841504cc6155a353c516ed87"
+
+inherit autotools update-rc.d
+
+EXTRA_OECONF = " \
+                 --with-fuseinclude=${STAGING_INCDIR} \
+                 --with-fuselib=${STAGING_LIBDIR} \
+                 --enable-owhttpd \
+                 --enable-cache \
+                 --enable-mt \
+                 --disable-swig \
+                 --disable-owtcl \
+                 "
+
+do_install_prepend() {
+        install -d ${D}${sysconfdir}/default/
+        install -d ${D}${sysconfdir}/init.d/
+        install -m 0755 ${WORKDIR}/owhttpd ${D}${sysconfdir}/init.d/owhttpd
+        install -m 0755 ${WORKDIR}/owserver ${D}${sysconfdir}/init.d/owserver
+}
+
+PACKAGES =+ "owftpd owhttpd owserver owshell libowcapi libow libownet owmon owtap"
+
+DESCRIPTION_owftpd = "Anoymous FTP server for 1-wire access"
+DESCRIPTION_owhttpd = "Tiny webserver for 1-wire control"
+DESCRIPTION_owserver = "Backend server (daemon) for 1-wire control"
+DESCRIPTION_owshell = "owdir owread owwrite owpresent owget - lightweight owserver access"
+DESCRIPTION_libowcapi = "easy C-language 1-wire interface "
+DESCRIPTION_libow = "easy C-language 1-wire interface to the owserver protocol"
+DESCRIPTION_libownet = "easy C-language 1-wire interface to the owserver protocol"
+DESCRIPTION_owmon = "Monitor for owserver settings and statistics"
+DESCRIPTION_owtap = "Packet sniffer for the owserver protocol"
+
+FILES_owftpd = "${bindir}/owftpd"
+FILES_owhttpd = "${bindir}/owhttpd ${sysconfdir}/init.d/owhttpd"
+FILES_owserver = "${bindir}/owserver ${sysconfdir}/init.d/owserver"
+FILES_owshell = "${bindir}/owread ${bindir}/owwrite \
+                 ${bindir}/owdir ${bindir}/owpresent \
+                 ${bindir}/owget ${bindir}/owside"
+FILES_owmon = "${bindir}/owmon"
+FILES_owtap = "${bindir}/owtap"
+FILES_libowcapi = "${libdir}/libowcapi-*"
+FILES_libow = "${libdir}/libow-*"
+FILES_libownet = "${libdir}/libownet-*"
+
+INITSCRIPT_PACKAGES = "owhttpd owserver"
+INITSCRIPT_NAME_owserver = "owserver"
+INITSCRIPT_NAME_owhttpd = "owhttpd"
+INITSCRIPT_PARAMS_owserver = "defaults 20"
+INITSCRIPT_PARAMS_owhttpd = "defaults 21"
+
-- 
1.7.10



