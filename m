Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8736AC6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 14:46:46 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so2660370wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Pgo9aqN1GbNDpubie2tXjpzQAFv0ZuBwsfotz0md2uI=;
	b=msCh66egKm7kw+XWRi/VWwx3N0pHJt4VTYulZ6Q8j2gYEhMiofV9n7AM1fHQ7xQPSS
	yzS2vRbliQBct+U+ABn15OqgBLI9DgMgA7ByxlH36Bpjy4LEmzJF1CGMpI5t5L19GIlV
	MFHIqCYHuDOxV1dCxGq+z4QZV9uP5VQ8rh69EGxpt0oqjbYahqE3Px8fcZgwkv7kJrrW
	ZIYhCnaUpUYdxFXTPBGFG/E04RcjMiU1Ktj69KruOBMHyxLyDgEoCUc2vyU/oPgR/SCD
	y1NwWNkniaA2vcbjph/4vFKa8DyLgVQXAzydRkcSbKO/z1ytU79AgbZUDs1zH2heDCtA
	z6PQ==
X-Received: by 10.180.212.78 with SMTP id ni14mr16130163wic.44.1408978007396; 
	Mon, 25 Aug 2014 07:46:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	v16sm1328597wia.14.2014.08.25.07.46.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 07:46:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Aug 2014 16:46:49 +0200
Message-Id: <1408978009-16769-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-efl][PATCH] e-wm: add git recipe with latest revision
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
X-List-Received-Date: Mon, 25 Aug 2014 14:46:49 -0000

* E19 is still in alpha stage, but I was told that many things work
  there better than old(ish) E18
* last announcement:
  https://phab.enlightenment.org/phame/live/3/post/e19_alpha2_now_with_50_more_explosions/
* but be aware that illume2 modules are gone and config mobile
  doesn't work without them
* there is new tiling config

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm.inc                  |  5 ++++
 .../e17/e-wm/0001-configure.ac-add-foreign.patch   | 29 ++++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-wm_0.18.8.bb            |  6 -----
 meta-efl/recipes-efl/e17/e-wm_git.bb               | 14 +++++++++++
 4 files changed, 48 insertions(+), 6 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_git.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm.inc b/meta-efl/recipes-efl/e17/e-wm.inc
index 122a60e..0ff26ef 100644
--- a/meta-efl/recipes-efl/e17/e-wm.inc
+++ b/meta-efl/recipes-efl/e17/e-wm.inc
@@ -10,6 +10,8 @@ S = "${WORKDIR}/${SRCNAME}"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+
 
 EXTRA_OECONF = "\
     --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
@@ -21,6 +23,7 @@ EXTRA_OECONF = "\
 
 do_configure_prepend() {
     autopoint || true
+    sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
 }
 
 do_install_append() {
@@ -70,6 +73,7 @@ PACKAGES =+ "\
     ${PN}-config-netbook \
     ${PN}-config-scaleable \
     ${PN}-config-standard \
+    ${PN}-config-tiling \
     ${PN}-theme-default \
     ${PN}-background-dark-gradient \
     ${PN}-background-light-gradient \
@@ -126,6 +130,7 @@ FILES_${PN}-config-minimalist = "${datadir}/enlightenment/data/config/minimalist
 FILES_${PN}-config-netbook = "${datadir}/enlightenment/data/config/netbook"
 FILES_${PN}-config-scaleable = "${datadir}/enlightenment/data/config/scaleable"
 FILES_${PN}-config-standard = "${datadir}/enlightenment/data/config/standard"
+FILES_${PN}-config-tiling = "${datadir}/enlightenment/data/config/tiling"
 FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
 FILES_${PN}-theme-default = "${datadir}/enlightenment/data/themes/default.edj"
 FILES_${PN}-background-dark-gradient = "${datadir}/enlightenment/data/backgrounds/Dark_Gradient.edj"
diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch b/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
new file mode 100644
index 0000000..14899d5
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm/0001-configure.ac-add-foreign.patch
@@ -0,0 +1,29 @@
+From 8526270c418a5dc3d737a8eaff315209433f69d2 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 25 Aug 2014 16:06:03 +0200
+Subject: [PATCH] configure.ac: add foreign
+
+* fixes:
+  | configure.ac:312: error: required file './ABOUT-NLS' not found
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 62c0f6d..49b290b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ AH_BOTTOM([
+ #endif /* EFL_CONFIG_H__ */
+ ])
+ 
+-AM_INIT_AUTOMAKE([1.11 dist-bzip2 -Wno-portability])
++AM_INIT_AUTOMAKE([1.11 dist-bzip2 -Wno-portability foreign])
+ AM_SILENT_RULES([yes])
+ 
+ AC_USE_SYSTEM_EXTENSIONS
+-- 
+2.0.4
+
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
index 0d65ca0..6b4c9fc 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
@@ -13,9 +13,3 @@ SRC_URI = "\
 
 SRC_URI[md5sum] = "79c9f524e1d0510061c62c4b038a8ece"
 SRC_URI[sha256sum] = "14c9bde4334d2f8b0776c6113d02b923ab159eea1cbf7013489e4f3bf37a51bb"
-
-do_configure_prepend() {
-    sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
-}
-
-PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
diff --git a/meta-efl/recipes-efl/e17/e-wm_git.bb b/meta-efl/recipes-efl/e17/e-wm_git.bb
new file mode 100644
index 0000000..4bf1b96
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm_git.bb
@@ -0,0 +1,14 @@
+require ${BPN}.inc
+
+PV = "0.18.999+0.19-alpha2+git${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = " \
+    git://git.enlightenment.org/core/enlightenment.git \
+    file://0001-configure.ac-add-foreign.patch \
+    file://enlightenment_start.oe \
+    file://applications.menu \
+"
+S = "${WORKDIR}/git"
+
+SRCREV = "525b963133d7168226b8e07ba26730212a8b7e82"
-- 
2.0.4


