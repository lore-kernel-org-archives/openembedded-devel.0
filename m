Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrO-0004PX-WD
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:52:03 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so982280eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=xj5tE5Q+1IKDf4pR/QZb9+ZROUayvGaXJOy/ADqJFl0=;
	b=jbhPDSMQ2RVb4+T/X1rrRL9D5IJh+JDJzVs98HyVuvYXv7bU29pZ0VmfiZdWnWGdcx
	FYShzRqwN0u3PGNnx0POdXB9FFBURBL3d4d8cg3PIi+zszqYjaj4EdEMVY+PzX72IW2f
	PJZv948FnY9FKgAXiLMBSzftLUDHBGRuj93kc9fOEECoscwg/80IadO9xs7T9HawitRe
	PIw0OJ4jro5B/xq6l4vR8+3LB608rVo3LuRc0vDKuwVpOYkKcDzWGqjHFkmxd47afElw
	jyu9C1Mw0nrfH4oAPUPQ26J7+m8gZ3U33Bm1/p+2tQ751sQaAvqlpzUrQE4MzEcbxMio
	oZuQ==
Received: by 10.14.95.67 with SMTP id o43mr3266342eef.13.1339148495660;
	Fri, 08 Jun 2012 02:41:35 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id n52sm20223989eeh.9.2012.06.08.02.41.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:39 +0200
Message-Id: <1339148443-9467-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk8fyE5kma/iS1mRnIN7Yyq+YxLMbX6TV03ppOIFgqHMXEVJks0jgPUEthgZE4ecOfuOaZx
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 10/14] owfs: update to 2.8p15
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
X-List-Received-Date: Fri, 08 Jun 2012 09:52:03 -0000

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



