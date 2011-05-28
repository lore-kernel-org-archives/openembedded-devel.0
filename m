Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQKEs-000717-7n
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 16:11:38 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so2120968fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=eUQmjt4s1e4dvtHGNM4QMyUHNGecxTnngyUCH/aZi/w=;
	b=pYonj/tuKuzwy4Mg+M22PVQoS7V370/p7xRlYEETl4ZDc+wsRn+uDSrISGe4zAMM0l
	t/1ya9i81J0H0DASS8GIP/30m8sC/MsbwoiBEwVmLuu1Kkf2ZBruRcEkwsGUMIbgBIK2
	dMbi9AAD5tHY/52XoB2tj5b2j33fgRK7IYYls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qP5XmTvCAk3w+y5nwrjlDrh06Iy9abtsVsqL3BsGvpFZdoSyDlwDIMXLOY33tUG9cE
	2YSu5FEsQ3hVe95DMcTTBt2jBBJsyYdylcxccoOduyR78HKuZSQk83+kiA04Wb8zfm+z
	quUNHHuUQHjJrVOy5DW1JyMMjuUdRGgAsITOM=
Received: by 10.223.40.85 with SMTP id j21mr3571265fae.22.1306591714254;
	Sat, 28 May 2011 07:08:34 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id l26sm171135fam.21.2011.05.28.07.08.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 07:08:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 May 2011 16:08:20 +0200
Message-Id: <c6290d1127c677c4fd652804e7c2d78438b5a9c3.1306591578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <923ec41843a1fb2a1de239afbe1a3c4844f0e2ae.1306591578.git.Martin.Jansa@gmail.com>
References: <923ec41843a1fb2a1de239afbe1a3c4844f0e2ae.1306591578.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306591578.git.Martin.Jansa@gmail.com>
References: <cover.1306591578.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] policykit: drop recipes, oe-core has newer versions named right polkit
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
X-List-Received-Date: Sat, 28 May 2011 14:11:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../policykit/policykit-gnome_0.96.bb              |   25 -------
 meta-oe/recipes-gnome/policykit/policykit_0.96.bb  |   67 --------------------
 2 files changed, 0 insertions(+), 92 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/policykit/policykit-gnome_0.96.bb
 delete mode 100644 meta-oe/recipes-gnome/policykit/policykit_0.96.bb

diff --git a/meta-oe/recipes-gnome/policykit/policykit-gnome_0.96.bb b/meta-oe/recipes-gnome/policykit/policykit-gnome_0.96.bb
deleted file mode 100644
index 8720ea9..0000000
--- a/meta-oe/recipes-gnome/policykit/policykit-gnome_0.96.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-HOMEPAGE = "http://www.packagekit.org/"
-DEPENDS = "policykit libgnome"
-LICENSE = "LGPLv2"
-
-PR = "r1"
-
-SRC_URI = "http://hal.freedesktop.org/releases/polkit-gnome-${PV}.tar.bz2;name=polkitgnome"
-SRC_URI[polkitgnome.md5sum] = "611cf39fba2945320fc7a9ec49087e69"
-SRC_URI[polkitgnome.sha256sum] = "0d96c8032d658a2e1eef8adfbeafff0f569ef0cf68b35915423acc00873c8a92"
-
-EXTRA_OECONF = " --disable-scrollkeeper \
-                 --disable-man-pages \
-                 --disable-examples \
-                 --disable-gtk-doc \
-                 --enable-introspection=no \
-"
-
-S = "${WORKDIR}/polkit-gnome-${PV}"
-
-inherit autotools pkgconfig
-
-FILES_${PN} += " ${datadir}/dbus-1 \
-                 ${datadir}/PolicyKit \
-               "
-
diff --git a/meta-oe/recipes-gnome/policykit/policykit_0.96.bb b/meta-oe/recipes-gnome/policykit/policykit_0.96.bb
deleted file mode 100644
index 98c0dd0..0000000
--- a/meta-oe/recipes-gnome/policykit/policykit_0.96.bb
+++ /dev/null
@@ -1,67 +0,0 @@
-HOMEPAGE = "http://www.packagekit.org/"
-DEPENDS = "eggdbus libpam expat dbus-glib intltool-native"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb"
-
-PR = "r2"
-
-SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz;name=polkit \
-          "
-
-SRC_URI[polkit.md5sum] = "e0a06da501b04ed3bab986a9df5b5aa2"
-SRC_URI[polkit.sha256sum] = "3426ca917210b2a5525732559368c18f983a4c39a6a55c5dddba26071bd8054a"
-
-EXTRA_OECONF = "--with-authfw=pam \
-                --with-os-type=${DISTRO} \
-                --disable-man-pages \
-                --disable-gtk-doc \
-                --enable-introspection=no \
-"
-
-S = "${WORKDIR}/polkit-${PV}"
-
-inherit autotools pkgconfig
-
-do_install_append () {
-	install -d ${D}${localstatedir}/run/PolicyKit
-	sed -i -e s:system:common:g ${D}${sysconfdir}/pam.d/*
-}
-
-FILES_${PN} += " ${datadir}/dbus-1 \
-                 ${datadir}/PolicyKit ${datadir}/polkit-1\
-                 ${localstatedir}/run/PolicyKit \
-                 ${libdir}/polkit-1/extensions/*.so \
-"
-
-FILES_${PN}-dev += " ${libdir}/polkit-1/extensions/*a"
-
-pkg_postinst_${PN} () {
-    # can't do this offline
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-    grep "^polkituser:" /etc/group > /dev/null || addgroup polkituser
-    grep "^polkituser:" /etc/passwd > /dev/null || adduser --disabled-password --system --home /var/run/polkit polkituser --ingroup polkituser -g polkituser 
-
-	# Fix owners
-	for i in /etc/polkit-1/localauthority /var/lib/polkit-1 ; do
-		mkdir -p $i
-		chown root $i
-		chmod 700 $i
-	done
-
-	for i in /usr/libexec/polkit-agent-helper-1 /usr/bin/pkexec ; do
-		chown root $i
-		chmod 4755 $i
-	done
-
-	DBUSPID=`pidof dbus-daemon`
-    if [ "x$DBUSPID" != "x" ]; then
-        /etc/init.d/dbus-1 force-reload
-    fi
-}
-
-pkg_postrm_${PN} () {
-    deluser polkituser || true
-    delgroup polkituser || true
-}
-- 
1.7.5.rc3



