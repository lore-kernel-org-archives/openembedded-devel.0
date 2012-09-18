Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDylJ-0001lE-GJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:26:53 +0200
Received: by bkcik5 with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=m94yUW1yjonG6OtZOJPk4g7GO60PVWaxN5kka4TS24M=;
	b=UI6vjUJkk2Ehy8Blulg5++eyOukb8aETIWVpeSY75g8iTSyrR1cH/U7lLTCb3dCXPv
	8uqYz/Z3dInUHHeGqKbu/YwvH6w3Ovt1tjdQ9N2TS4AYzXyguSjyKrLJNVMj6ZKwSHbH
	IlRmnj2ydv3B9/UDqPnMH4hLRO6qqkruQNb1Myvd7QrSdk1ZE5uDGD58sMwMsq3jUtna
	/XpahmVF2IIydaokYvu9x3tKDludpCWFsXdAUw7zw+2GNPUv2wixudc6Lv8kVA/4JIgc
	xl4sZGkVEjUsSdA+oVcN0EhikxQb6tLLe+jVptk/b5DmfiFabo6x093po6w/w7M74gbL
	AuDg==
Received: by 10.204.10.92 with SMTP id o28mr3369bko.39.1347977653656;
	Tue, 18 Sep 2012 07:14:13 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:12:42 +0200
Message-Id: <1347977601-28665-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 01/40] lxdm: initial add 1.22_git
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
X-List-Received-Date: Tue, 18 Sep 2012 14:26:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* use git version since 1.21 missing escape button and bugfixes
* no init-scripts (I am working with systemd -> testing causes huge efforts ->
  subsequent patches)
* run tested on overo/xfce

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...conf.in-blacklist-root-for-release-images.patch |   29 +++++++++
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam        |   13 ++++
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug  |   13 ++++
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf       |    4 +
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |   62 ++++++++++++++++++++
 .../recipes-graphics/lxdm/lxdm/lxdm.service.in     |   10 +++
 .../recipes-graphics/lxdm/lxdm_git.bbappend        |   16 +++++
 7 files changed, 147 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root-for-release-images.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm_git.bb
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
 create mode 100644 meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root-for-release-images.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root-for-release-images.patch
new file mode 100644
index 0000000..49ecdb8
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root-for-release-images.patch
@@ -0,0 +1,29 @@
+From 5038c49c0b61e057dec44c932f02c4bf99cee96e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 3 Sep 2012 10:02:51 +0200
+Subject: [PATCH] lxdm.conf.in: blacklist root for release images
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ data/lxdm.conf.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/data/lxdm.conf.in b/data/lxdm.conf.in
+index defc082..759e6e5 100644
+--- a/data/lxdm.conf.in
++++ b/data/lxdm.conf.in
+@@ -58,5 +58,5 @@ disable=0
+ white=
+ 
+ ## blacklist user
+-black=
++black=root
+ 
+-- 
+1.7.4.4
+
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam b/meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam
new file mode 100644
index 0000000..486621f
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam
@@ -0,0 +1,13 @@
+#%PAM-1.0
+# taken from http://aur.archlinux.org/packages/lx/lxdm-git/lxdm-git.tar.gz
+# further info https://wiki.archlinux.org/index.php/LXDM
+auth            requisite       pam_nologin.so
+auth            required        pam_env.so
+auth            required        pam_unix.so
+# To allow passwordless login comment previous line and uncomment next line
+#auth            required        pam_unix.so nullok
+account         required        pam_unix.so
+session         required        pam_limits.so
+session         required        pam_unix.so
+password        required        pam_unix.so
+-session optional pam_systemd.so
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug b/meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug
new file mode 100644
index 0000000..734949f
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/lxdm-pam-debug
@@ -0,0 +1,13 @@
+#%PAM-1.0
+# taken from http://aur.archlinux.org/packages/lx/lxdm-git/lxdm-git.tar.gz
+# further info https://wiki.archlinux.org/index.php/LXDM
+auth            requisite       pam_nologin.so
+auth            required        pam_env.so
+#auth            required        pam_unix.so
+# To deny passwordless login comment next line and uncomment previous line
+auth            required        pam_unix.so nullok
+account         required        pam_unix.so
+session         required        pam_limits.so
+session         required        pam_unix.so
+password        required        pam_unix.so
+-session optional pam_systemd.so
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf b/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf
new file mode 100644
index 0000000..0a6e672
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf
@@ -0,0 +1,4 @@
+[base]
+last_session=
+last_lang=
+last_langs=
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
new file mode 100644
index 0000000..fd28c41
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -0,0 +1,62 @@
+DESCRIPTION = "LXDM is the lightweight display manager"
+HOMEPAGE = "http://blog.lxde.org/?p=531"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SRC_URI = " \
+	git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};protocol=git;branch=master \
+	file://lxdm.conf \
+	file://lxdm-pam \
+	file://lxdm-pam-debug \
+	${@base_contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
+"
+
+LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam",d)}"
+
+SRCREV = "d681bc90b62ec2e13ed62fc30cdaf5dbbba23cdc"
+PV = "0.4.2+git${SRCPV}"
+
+DEPENDS = "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
+
+# combine oe-core way with angstrom DISTRO_TYPE
+DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
+
+inherit autotools gettext
+
+S = "${WORKDIR}/git"
+
+do_compile_append() {
+	# default background configured not available / no password field available
+	sed -i 	-e 's,bg=,# bg=,g' \
+		-e 's,# skip_password=,skip_password=,g' \
+		${S}/data/lxdm.conf.in
+	# add default configuration
+	oe_runmake -C ${S}/data lxdm.conf
+}
+
+do_install_append() {
+	install -d ${D}${localstatedir}/lib/lxdm
+	install -m 644 ${WORKDIR}/lxdm.conf ${D}${localstatedir}/lib/lxdm
+	# ArchLinux version of pam config has the following advantages:
+	# * simple setup of passwordless login
+	# * in XFCE powerdown/restart enabled in logoff dialog
+	install -m 644 ${WORKDIR}/${LXDM_PAM} ${D}${sysconfdir}/pam.d/lxdm
+}
+
+# make installed languages choosable
+pkg_postinst_${PN} () {
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+langs=""
+for lang in `find ${libdir}/locale -maxdepth 1 | grep _ | sort`; do
+    lang=`basename $lang`
+    if [ "x$langs" = "x" ]; then
+        langs="$lang"
+    else
+        langs="$langs $lang"
+    fi
+done
+sed -i "s:last_langs=.*$:last_langs=$langs:g" ${localstatedir}/lib/lxdm/lxdm.conf
+}
+
+RDEPENDS_${PN} = "pam-plugin-loginuid"
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
new file mode 100644
index 0000000..0bc6774
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm/lxdm.service.in
@@ -0,0 +1,10 @@
+[Unit]
+Description=LXDE Display Manager
+After=systemd-user-sessions.service
+
+[Service]
+ExecStart=%sbindir%/lxdm
+StandardOutput=syslog
+
+[Install]
+Alias=display-manager.service
diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
new file mode 100644
index 0000000..e4cf44d
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
@@ -0,0 +1,16 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://lxdm.service.in"
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	sed -e 's,%sbindir%,${sbindir},g' \
+		< ${WORKDIR}/lxdm.service.in \
+		> ${D}${systemd_unitdir}/system/lxdm.service
+}
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "lxdm.service"
-- 
1.7.6.5



