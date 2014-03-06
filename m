Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 591A26F5A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Mar 2014 16:48:15 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id r15so1788110ead.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Sd+EcOo5yVDx5Tzjrx3Ia+2NQviEVd0diLeCA27Xyfk=;
	b=YaYtgdNiVoDxWkNi6scdM53S1THEx5s4qP6xJPGdg6lPBa2CHV2fkV+v9Kjgem9EHY
	AU9PleW24KCIT7U9yvlRjSWpYKsiRQIbf5CrTLENRfVqCUPN4wml86JhevSjoD2aRkto
	i96whW1FSUmCnyxFqaEjEbyKDSifY0VZU+GRkTEBW4j8lxHbANSKIP1fnPb9lQWi4qst
	SI8RxeZFbiDsFgeaQrY2mKQKUhSZ+D+Et0hcBD8TCVzXE12/b3E/T3DzuY77MDKBzSpi
	nPE9HA/9ZxXoSprgVgyUribrt4y/MhHuo86CohXnw5oLjLwKbzl546W90mapQZnbnIhs
	pA6A==
X-Received: by 10.14.100.197 with SMTP id z45mr3655719eef.112.1394124496498;
	Thu, 06 Mar 2014 08:48:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm23623155eeu.0.2014.03.06.08.48.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 08:48:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Mar 2014 17:48:13 +0100
Message-Id: <251e229091e2c4229a7180f4523656f7eb805778.1394124356.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1394124356.git.Martin.Jansa@gmail.com>
References: <cover.1394124356.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 3/6] e-wm: upgrade to 0.18.4 and drop old 0.17.5
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
X-List-Received-Date: Thu, 06 Mar 2014 16:48:17 -0000

* fix building e17 modules with elementary-1.9
* remove 0.17 version, because that one isn't going to be tested enough

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-remove-another-elm-1.8-requirement.patch  | 25 +++++++++++++++++++++
 meta-efl/recipes-efl/e17/e-wm_0.17.5.bb            | 26 ----------------------
 .../e17/{e-wm_0.18.3.bb => e-wm_0.18.4.bb}         |  5 +++--
 3 files changed, 28 insertions(+), 28 deletions(-)
 create mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
 rename meta-efl/recipes-efl/e17/{e-wm_0.18.3.bb => e-wm_0.18.4.bb} (68%)

diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch b/meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch
new file mode 100644
index 0000000..f4f034a
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch
@@ -0,0 +1,25 @@
+From dd1406e40700df60a055db24d7358480b1fbc5bf Mon Sep 17 00:00:00 2001
+From: Mike Blumenkrantz <zmike@samsung.com>
+Date: Mon, 3 Mar 2014 17:38:55 -0500
+Subject: [PATCH] remove another elm 1.8 requirement
+
+Upstream-Status: backport dd1406e40700df60a055db24d7358480b1fbc5bf
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 999df79..26f6775 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -579,7 +579,6 @@ eina >= ${efl_version} \
+ eldbus >= ${efl_version} \
+ eio >= ${efl_version} \
+ elementary >= ${elm_version} \
+-elementary < 1.8.99 \
+ emotion >= ${efl_version} \
+ $udisks_mount \
+ $eeze_mount \
+-- 
+1.9.0
+
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb b/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
deleted file mode 100644
index d374680..0000000
--- a/meta-efl/recipes-efl/e17/e-wm_0.17.5.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require ${BPN}.inc
-
-SRCNAME = "enlightenment"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://enlightenment_start.oe \
-    file://applications.menu \
-"
-
-SRC_URI[md5sum] = "5aefb55df0b1a0a0ae0cf9d0610cf7c7"
-SRC_URI[sha256sum] = "25d4967277cf27d4efb474a9b8eceb1200aa813a51c248b61cc23f69291bff0f"
-
-do_install_append() {
-    install -d ${D}/${datadir}/applications/
-    install -m 644 ${S}/src/modules/fileman/module.desktop ${D}/${datadir}/applications/efm.desktop
-    sed "s#Type=Link#Type=Application#g" -i ${D}/${datadir}/applications/efm.desktop
-    echo "Exec=enlightenment_remote -efm-open-dir" >> ${D}/${datadir}/applications/efm.desktop
-    echo "Terminal=false" >> ${D}/${datadir}/applications/efm.desktop
-    echo "Categories=Application;" >> ${D}/${datadir}/applications/efm.desktop
-    echo "StartupNotify=true" >> ${D}/${datadir}/applications/efm.desktop
-    install -d ${D}/${datadir}/icons/
-    install -m 644 ${S}/data/themes/img/O/icon_icon_theme.png ${D}/${datadir}/icons/e-module-fileman.png
-}
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.3.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.4.bb
similarity index 68%
rename from meta-efl/recipes-efl/e17/e-wm_0.18.3.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.18.4.bb
index ae21cc1..0122cad 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.3.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.4.bb
@@ -6,12 +6,13 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 SRC_URI = "\
     ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://0001-remove-another-elm-1.8-requirement.patch \
     file://enlightenment_start.oe \
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "9f6e6c296b88b038ac05415006c678fd"
-SRC_URI[sha256sum] = "17d207246bf10dec5a5fa854da5763e0e6dd61decde3474ff5fedffbb9dc8629"
+SRC_URI[md5sum] = "d3534c765d562524c63852f2f40932c3"
+SRC_URI[sha256sum] = "273afe860b65e1e39323bab80ab51e44845bcddcd25063b47eadab1c925a77c9"
 
 do_configure_prepend() {
     sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
-- 
1.9.0


