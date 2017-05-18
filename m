Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 79ABF7805E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 20:32:25 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id q125so27871276pgq.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=PIsBF/qvWJuIrwPkGgDgmaUuOMl5059znvG6MN+K2cw=;
	b=V6ViEpXDLCwmbF+B2QhnodfsnY2wjcNs4j4oFgrKUdwSKjDuqW8ENS0+Q2At6FXZ0e
	/X/wbujozLspP7PxAnZhP/z7ebW3E9/LyT/6/SyNE4tYvahqUbETnDfkqTAO9AoQojVL
	SCm96Nad6IVS39nprKHauwvHAJVcsYiakVLJ/R6bauypkMXvo997TrCsaZTiuO9JlXJt
	oiLNRnH8L2NsJBUKApnE21TXErzfUP86yspCygUlE8c9usAhr/iRQ6SreptrmRbOEX1n
	B36eNYp90sSJJtWCyXbBvvCP/Ag38fL7VieNZiZofEbz/W78z7WFgrzC/d21DijXRcv7
	5AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PIsBF/qvWJuIrwPkGgDgmaUuOMl5059znvG6MN+K2cw=;
	b=lKMOjW2sQoc2+xkcAZh88xjL+C0nphxZfObtgieCyA8Baeld7lMSwXnCU//xyAzy46
	yEuhjE3kN8bUVV6vxAPFmaWKCqboWK91t3GOv1Tf9sU6hk2vXt9ueKPeeCZzqaZdfHnt
	VbXNdXjA4do/QHG1K2tx4KPbrLpPdcZwjLOgaiY/cnG3KkaPmFVo+dnmRkjViRWRlQtm
	G1zfzPNdeerMRY9xuwDL34dROwKITO5ULhDW4bacu6lU6fA4lQ3dDSKfvk8n5KyQqt4n
	3T+U6FMwcPtD7QEzfOyWYQJDX15aA1Hreb/xffpy/L4LsC4Ewp4jbgi78Bnia4ZtgSee
	GOJQ==
X-Gm-Message-State: AODbwcDyIaQLN6+hECydXm8FQSk0hn9jQ7bkiWo74Ufy3RqnD9h1/sZ1
	mZkrAqGJfzfmeuZC
X-Received: by 10.98.69.193 with SMTP id n62mr6620797pfi.216.1495139546887;
	Thu, 18 May 2017 13:32:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	n7sm10733593pfk.74.2017.05.18.13.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 May 2017 13:32:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 May 2017 13:32:14 -0700
Message-Id: <20170518203214.34947-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170518203214.34947-1-raj.khem@gmail.com>
References: <20170518203214.34947-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH V2 3/3] rygel: Update to 0.34.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 May 2017 20:32:26 -0000

Fix build without X
Licence is more consistent now see

https://github.com/GNOME/rygel/commit/cdcb6bd55efd0c3b7a2fd4ae5c3d8556f69f8402

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../rygel/{rygel_0.28.2.bb => rygel_0.34.0.bb}     | 24 ++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-connectivity/rygel/{rygel_0.28.2.bb => rygel_0.34.0.bb} (74%)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
similarity index 74%
rename from meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
rename to meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
index 38fac65d5..d2eda6bf9 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.34.0.bb
@@ -5,26 +5,27 @@ Additionally, media player software may use Rygel to become a MediaRenderer \
 that may be controlled remotely by a UPnP or DLNA Controller."
 HOMEPAGE = "http://live.gnome.org/Rygel"
 
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://src/rygel/rygel-main.vala;endline=27;md5=99324118da4c012d25edae2f779ae9b3"
+LICENSE = "LGPL1.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstreamer1.0-plugins-base ossp-uuid libgee libsoup-2.4 libmediaart-2.0 libunistring sqlite3 intltool-native"
 RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
 GNOME_COMPRESS_TYPE = "xz"
-SRC_URI[archive.md5sum] = "9fbe4fb53b6cfa2f3f3723b7649a2215"
-SRC_URI[archive.sha256sum] = "9ea23df7186caac5f1aad3137edf6d507d339b9a469fc3133df4043fa66b61f5"
+SRC_URI[archive.md5sum] = "7d8923324b280cd5452803d61176a34a"
+SRC_URI[archive.sha256sum] = "fbb2d46cbe4e750df6610b4c66b2278f06d1f71a257c7903e676ccb394dad418"
 
-inherit gnomebase vala gobject-introspection
+inherit gnomebase vala gobject-introspection gettext systemd
 
 EXTRA_OECONF = "--disable-tracker-plugin --with-media-engine=gstreamer"
 
-PACKAGECONFIG ?= "external mpris mediathek ruih media-export gst-launch gtk+3"
+PACKAGECONFIG ?= "external mpris ruih media-export gst-launch"
+
+PACKAGECONFIG_append = "${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk+3", "", d)}"
+
 PACKAGECONFIG[external] = "--enable-external-plugin,--disable-external-plugin"
 PACKAGECONFIG[mpris] = "--enable-mpris-plugin,--disable-mpris-plugin"
-PACKAGECONFIG[mediathek] = "--enable-mediathek-plugin,--disable-mediathek-plugin"
 PACKAGECONFIG[ruih] = "--enable-ruih-plugin,--disable-ruih-plugin"
 PACKAGECONFIG[media-export] = "--enable-media-export-plugin,--disable-media-export-plugin"
 PACKAGECONFIG[gst-launch] = "--enable-gst-launch-plugin,--disable-gst-launch-plugin"
@@ -36,6 +37,11 @@ do_install_append() {
        # Remove .la files for loadable modules
        rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
        rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
+       if [ -e ${D}${libdir}/systemd/user/rygel.service ]; then
+               mkdir -p ${D}${systemd_unitdir}/system
+               mv ${D}${libdir}/systemd/user/rygel.service ${D}${systemd_unitdir}/system
+               rmdir ${D}${libdir}/systemd/user ${D}${libdir}/systemd
+       fi
 }
 
 FILES_${PN} += "${libdir}/rygel-${LIBV}/engines ${datadir}/dbus-1 ${datadir}/icons"
@@ -46,6 +52,8 @@ ALLOW_EMPTY_${PN}-meta = "1"
 
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
+SYSTEMD_SERVICE_${PN} = "rygel.service"
+
 python populate_packages_prepend () {
     rygel_libdir = d.expand('${libdir}/rygel-${LIBV}')
     postinst = d.getVar('plugin_postinst')
-- 
2.13.0


