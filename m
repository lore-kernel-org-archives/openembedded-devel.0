Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi7f-0002oS-JV
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:20:36 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=M4aIYgK/+WVpdMkL7rPvDQhZ3cV9APWbSm9zV9LEcPU=;
	b=StQs1qIm7BHY51yVVAIlqHanbeK1AxYZ2vCrLlxyhJ7hf6m6nF0lN4N2GillXO6ASC
	+ouSfY9e/S5pn3w/lOoFqb9SdaeBJcdNzvnmea8SPXvyRHEHz1rpA61AqJ7ujazF7Gln
	k6qLhpJhaxR3L+Z8Pd33KsEI2lmfCdjRc/KrVLUPBUpDmNFtUilXMPBPAWFrosrJrLtZ
	JdHqMvHPCYsSiDFCjnJFN0wG8py0vT07YPMyc9vpZkImflLmxZyz+IRdg2htD6oJh1xm
	WiLZNWH6HQfH8BSAhjmZxxA6Sqdd3Owrk/mJIQJ7G+hHHg2kn+6b3Nhto9ud3x11QM3i
	1Y3Q==
Received: by 10.14.207.6 with SMTP id m6mr42848826eeo.10.1354586776007;
	Mon, 03 Dec 2012 18:06:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 43sm34812480eed.10.2012.12.03.18.06.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:06:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:21 +0100
Message-Id: <1df5fcffb04232d43a19ece644680836f3920db0.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 48/58] systemd: reenable python and add python-systemd-journald
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
X-List-Received-Date: Tue, 04 Dec 2012 02:40:23 -0000

* we need inherit pythonnative to find right python-native

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 51d3371..341e85d 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,9 +19,15 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r10"
+PR = "r11"
 
-inherit useradd pkgconfig autotools perlnative
+# need to export these variables for python-config to work
+export BUILD_SYS
+export HOST_SYS
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+inherit useradd pkgconfig autotools perlnative pythonnative python-dir
 
 SRCREV = "4d92e078e9d7e9a9d346065ea5e4afbafbdadb48"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
@@ -67,7 +73,7 @@ EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
                  --disable-tcpwrap \
                  --enable-split-usr \
                  --disable-microhttpd \
-                 --without-python \
+                 --with-python \
                "
 
 # There's no docbook-xsl-native, so for the xsltproc check to false
@@ -107,7 +113,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze python-${PN}-journal"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock"
@@ -116,6 +122,9 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 RDEPENDS_${PN}-analyze = "python-dbus"
 RRECOMMENDS_${PN}-analyze = "python-pycairo"
 
+FILES_python-${PN}-journal = "${PYTHON_SITEPACKAGES_DIR}/systemd/*.py* ${PYTHON_SITEPACKAGES_DIR}/systemd/*.so"
+RDEPENDS_python-${PN}-journal = "python-core"
+
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
@@ -168,9 +177,8 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${base_libdir}/udev/rules.d/73-seat-late.rules \
                 ${base_libdir}/udev/rules.d/99-systemd.rules \
                "
-
-FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
-FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
+FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/ ${PYTHON_SITEPACKAGES_DIR}/systemd/.debug/"
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd ${PYTHON_SITEPACKAGES_DIR}/systemd/*.la"
 
 RDEPENDS_${PN} += "dbus-systemd udev-systemd"
 
-- 
1.8.0



