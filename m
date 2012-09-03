Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T8Zod-0000zR-Gk
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 18:47:59 +0200
Received: by bkcik5 with SMTP id ik5so2748542bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 09:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=Wao5axnw9XbnR7ZasudhmfviOAt20CuEzt4r2StAteo=;
	b=fW+s/8nqIA2/0evfVtDwY+dTgJF7GsM/NEFmWkr+Sn/S88MqNNehsivY6wOZ93H3mG
	cfxQrVVW0ObJA7D0DzuzCh7Fe5HQREgyxUNqZWUvKz27dLYwApG74pfaTSYvhmzb7VOq
	tEFaAa5BngLJEqYzFq+e7s0EGGdMrSzlZ1J8DttvL1wUSes6vAC232ncnLXgDne22Oa9
	Zmsr4EzpmMNRviX1yZWFwXwiIuAmNkvQYe1PLqs+1n22dNoeHjTEoSeZg3fTkEvd1idz
	8YaFvYnBIBazv4JvmKchEkA3t2b/bar8iHTsYYWmEBsjRVD6ZQWeNyt13rBRBrs/JfT0
	fELQ==
Received: by 10.204.154.66 with SMTP id n2mr7151414bkw.138.1346690138871;
	Mon, 03 Sep 2012 09:35:38 -0700 (PDT)
Received: from localhost.localdomain ([91.10.42.126])
	by mx.google.com with ESMTPS id fu8sm8529531bkc.5.2012.09.03.09.35.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 09:35:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Sep 2012 18:43:00 +0200
Message-Id: <1346690580-26040-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] lxdm: initial add 1.22_git
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
X-List-Received-Date: Mon, 03 Sep 2012 16:47:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* use git version since 1.21 missing escape button and bugfixes
* no init-scripts (I am working with systemd -> testing causes huge efforts ->
  subsequent patches)
* run tested on overo/xfce

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...conf.in-blacklist-root-for-release-images.patch |   29 +++++++++++
 ...001-pam-use-common-instead-of-system-auth.patch |   35 +++++++++++++
 meta-oe/recipes-graphics/lxdm/lxdm/lxdm.conf       |    4 ++
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb          |   51 ++++++++++++++++++++
 .../recipes-graphics/lxdm/lxdm/lxdm.service.in     |   10 ++++
 .../recipes-graphics/lxdm/lxdm_git.bbappend        |   16 ++++++
 6 files changed, 145 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-lxdm.conf.in-blacklist-root-for-release-images.patch
 create mode 100644 meta-oe/recipes-graphics/lxdm/lxdm/0001-pam-use-common-instead-of-system-auth.patch
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
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0001-pam-use-common-instead-of-system-auth.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0001-pam-use-common-instead-of-system-auth.patch
new file mode 100644
index 0000000..b128928
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0001-pam-use-common-instead-of-system-auth.patch
@@ -0,0 +1,35 @@
+From 1e40c03c44de9d985c40f103ec3d4e5251d26cb2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 20 Jun 2012 11:51:28 +0200
+Subject: [PATCH] pam: use common-* instead of system-auth
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Inappropriate [build system specific change]
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ pam/lxdm |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/pam/lxdm b/pam/lxdm
+index cffd07b..3e49fc5 100644
+--- a/pam/lxdm
++++ b/pam/lxdm
+@@ -1,9 +1,9 @@
+ #%PAM-1.0
+-auth       substack	system-auth
++auth       substack	common-auth
+ auth       optional	pam_gnome_keyring.so
+-account    include	system-auth
++account    include	common-account
+ session    optional	pam_keyinit.so force revoke
+-session    include	system-auth
++session    include	common-session
+ session    required	pam_loginuid.so
+ session    optional	pam_console.so
+ session    optional	pam_gnome_keyring.so auto_start
+-- 
+1.7.6.5
+
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
index 0000000..a7261fd
--- /dev/null
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "LXDM is the lightweight display manager"
+HOMEPAGE = "http://blog.lxde.org/?p=531"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+SRC_URI = " \
+	git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};protocol=git;branch=master \
+	file://0001-pam-use-common-instead-of-system-auth.patch \
+	${@base_contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
+	file://lxdm.conf \
+"
+
+SRCREV = "4f9ec27acc7f1f92b20a6ec64a50ac86aa7a5fc6"
+PV = "0.4.2+git${SRCPV}"
+
+DEPENDS = "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
+
+DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
+
+inherit autotools gettext
+
+S = "${WORKDIR}/git"
+
+do_compile_append() {
+	# default background configured not available
+	sed -i -e 's,bg=,# bg=,g' ${S}/data/lxdm.conf.in
+	# add default configuration
+	oe_runmake -C ${S}/data lxdm.conf
+}
+
+do_install_append() {
+	install -d ${D}${localstatedir}/lib/lxdm
+	install -m 644 ${WORKDIR}/lxdm.conf ${D}${localstatedir}/lib/lxdm
+}
+
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
1.7.4.4



