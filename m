Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id CD42A78690
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:41 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id x82so10711693wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=aGItN1BloGQoKSpbU5E7EdiWRRV0Gcm7z2iYmlSnNCA=;
	b=sP0VZ7RF1Q7OpyQqDcLJ1BYS3K0LFW8P4ekb7M2wIuo0/dV2Wna4l0W8Iadb6jdktP
	6nOCodlbwcMHF3lPsYk6FMJVacNsuxiCCTcOGU+X/MkdlQ2nUUkhu62YoTNgyBv1+dpH
	knbvZN0Ye82ENa3mPZ5OmIFVX0ml4PFCteRojkAa0mRxUA+iLxf/tLeog3mv8gUUGjS6
	ZjAmsjzqOj7Ctlj+HhBQ04b3EVG98ESppPC2griA5vDcju99Wb5bdnORwM1SpbIHAsQH
	WX/t+iFDDj+piTOj38AUpZYwFFyJIup0zj5P5mTT5WW1DM06ip3R7yUp82FoiHKlmcwf
	Dvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aGItN1BloGQoKSpbU5E7EdiWRRV0Gcm7z2iYmlSnNCA=;
	b=VMaWHkuba5kMdgSlFdhBz1EuTh/mkDgVUQp80O6d2IwK0CNZBL3oevUmAxEezGZ4rC
	UcbKiNi/Aqi8cK9QngLRm5s17Kdhj3JgPAGCa4adIKjL2Sx1HRhA57IYf/HrgjciI9qD
	u59lFv+l7PLIj93AJlYt/0kS3pwofXSWyC37bRDfg3/bByrF/jtGpo61RTwdTepsD1Ea
	lKty+KA6wLSyybhSET6Kz60Lg5eK6fGKpiV5A4G0gCnIXq+HizHXm6eAOoyI1qvtagsy
	83qU4ZlYa4BwSWPlrCxI5czyCrqYdopLWlINbWMFxSkVZtMIESnucj9YVmdK8zxaCsJc
	h3ng==
X-Gm-Message-State: AElRT7EboRFPKUOSRgkHtA3D/SnUlZ+p4cxXfNJoyHgocHYwDLskVrO5
	DEJg4D4sJ50kWQIasJgNFl/+cg==
X-Google-Smtp-Source: AG47ELvE7IjR1kH2Gky4TQTLZctFPBi42QVShJUrmNedXm7mB3h6TF2kMhmdEuhe7JOEcMNJA5eryA==
X-Received: by 10.28.66.206 with SMTP id k75mr12777872wmi.34.1521981342364;
	Sun, 25 Mar 2018 05:35:42 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:11 +0200
Message-Id: <20180325123520.16452-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/20] udisks2: update 2.1.8 -> 2.7.6
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They moved to github so updates slipped through...

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../udisks2/0001-data-fix-out-of-tree-build.patch  | 35 ++++++++++++++++
 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb    | 39 -----------------
 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb    | 49 ++++++++++++++++++++++
 3 files changed, 84 insertions(+), 39 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
 delete mode 100644 meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
 create mode 100644 meta-oe/recipes-support/udisks/udisks2_2.7.6.bb

diff --git a/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch b/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
new file mode 100644
index 000000000..1cbd87751
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/0001-data-fix-out-of-tree-build.patch
@@ -0,0 +1,35 @@
+From 7fdd4acdf6daf95c5cc74e968f4710513c8ddaea Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Fri, 23 Mar 2018 18:33:52 +0100
+Subject: [PATCH] data: fix out of tree build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| sed: can't read udisks2.service.in: No such file or directory
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/storaged-project/udisks/pull/510
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ data/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/data/Makefile.am b/data/Makefile.am
+index ddf9e3d6..b38928c8 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -22,7 +22,7 @@ systemdservicedir       = $(systemdsystemunitdir)
+ systemdservice_DATA     = $(systemdservice_in_files:.service.in=.service)
+ 
+ $(systemdservice_DATA): udisks2.service.in Makefile
+-	@sed -e "s|\@udisksdprivdir\@|$(libexecdir)/udisks2|" udisks2.service.in > udisks2.service
++	@sed -e "s|\@udisksdprivdir\@|$(libexecdir)/udisks2|" $(srcdir)/udisks2.service.in > udisks2.service
+ endif
+ 
+ udevrulesdir = $(udevdir)/rules.d
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
deleted file mode 100644
index a3efc5160..000000000
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.8.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
-
-DEPENDS = "acl libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native libxslt-native"
-DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-
-RDEPENDS_${PN} = "acl"
-
-SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2 \
-           file://non-gnu-libc.patch \
-"
-SRC_URI[md5sum] = "501d11c243bd8c6c00650474cd2afaab"
-SRC_URI[sha256sum] = "da416914812a77e5f4d82b81deb8c25799fd3228d27d52f7bf89a501b1857dda"
-
-CVE_PRODUCT = "udisks"
-
-inherit autotools systemd gtk-doc gobject-introspection
-
-S = "${WORKDIR}/udisks-${PV}"
-
-EXTRA_OECONF = "--disable-man --disable-gtk-doc"
-
-FILES_${PN} += "${libdir}/polkit-1/extensions/*.so \
-                ${datadir}/dbus-1/ \
-                ${datadir}/polkit-1 \
-                ${nonarch_base_libdir}/udev/* \
-                ${exec_prefix}${nonarch_base_libdir}/udisks2/* \
-"
-
-PACKAGES =+ "${PN}-libs"
-
-FILES_${PN} += "${datadir}/bash-completion"
-FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
-
-FILES_${PN}-dbg += "${exec_prefix}${nonarch_base_libdir}/udisks2/.debug"
-
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb b/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
new file mode 100644
index 000000000..4d22afd0d
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2_2.7.6.bb
@@ -0,0 +1,49 @@
+SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
+
+DEPENDS = " \
+    acl \
+    libatasmart \
+    polkit \
+    libgudev \
+    dbus-glib \
+    glib-2.0 \
+    libblockdev \
+    intltool-native \
+    gnome-common-native \
+    libxslt-native \
+"
+DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+
+RDEPENDS_${PN} = "acl"
+
+SRC_URI = " \
+    git://github.com/storaged-project/udisks.git \
+    file://0001-data-fix-out-of-tree-build.patch \
+    file://non-gnu-libc.patch \
+"
+SRCREV = "b6471f2e99f6aa1133af0de658f1fa05c748932c"
+S = "${WORKDIR}/git"
+
+CVE_PRODUCT = "udisks"
+
+inherit autotools systemd gtk-doc gobject-introspection
+
+EXTRA_OECONF = "--disable-man --disable-gtk-doc"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1/ \
+    ${datadir}/polkit-1 \
+    ${datadir}/bash-completion \
+    ${libdir}/polkit-1/extensions/*.so \
+    ${nonarch_base_libdir}/udev/* \
+    ${exec_prefix}${nonarch_base_libdir}/udisks2/* \
+    ${systemd_system_unitdir} \
+"
+
+PACKAGES =+ "${PN}-libs"
+FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
+
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.14.3


