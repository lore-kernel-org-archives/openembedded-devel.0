Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F914731F9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 10:04:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 133so7177646wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yvYHljXpHZNYAPfCLClj2UpI5+LRgCgREa5YuksSo1A=;
	b=kXjyKgqHF5w5lr+xkNzQJuRy/KnDxtF9MGfqXHYL5S0ZlmnAKsDsV+pTiS01xnKhiE
	mwgYzj0FR54am+eDQclVbvtjfqul/0nkvKWhGsE9i8hj1xWNFw+IcLty+o0t4Onw9qh+
	tkS+l9BxaBbN7lTrOTMmQuTbrWh2su5rQd7D7Tk4BlreWHc5f9dNTDvSeL5zwFoc7VMQ
	NImEmm5fZiC9ZlJ8fH68bGH4DCHxvrLAQda2sH5VsNFRaQ9en5P9K0P281DuPo5h7/YM
	boGVJWifCyeKYYvAeD4wfMQPOj87/grI/go2uc9/Au0rSIGnGI3eEoJHIH0GCMMM29wi
	LAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yvYHljXpHZNYAPfCLClj2UpI5+LRgCgREa5YuksSo1A=;
	b=nDSwhCdqrPpFMWSJgovSB1Qu9mH7GXlfy7TG8C8MkKZM7vN8B0pJR85Y44S32oqtqG
	RKQWW3SUYYk06s5+7rwOvro/W4/ujsJ4bs3uF4zuBkF/DC/EG2XZJqNxNlUCmH+HMI8t
	6P4z9G1mULgAOVyYcPAW3bLkGC06GkHcjNyDDOeC6gzuG0C+ZMnIx4bjX9OsokQDzVBC
	7L7Sgthyr0zDVgMal/EL82H65hBb/NLa7/0mgi6kkitDRVTlZiAZibx9/HFZsRveAWRQ
	LCD5SPTGilaGjRBuR7yjPyphDWRbZDGYaw5Aqcdh/UCGYe+xxYps5BoarkDC+3cbi2MA
	bMmw==
X-Gm-Message-State: AE9vXwP9/lOgVfbZZ8TNWEl6IQiH9bkqn2pZ9jZmxLQwrlee+Bf6suys4waZkfwUOZpNjQ==
X-Received: by 10.28.198.130 with SMTP id w124mr1380715wmf.63.1474106699561;
	Sat, 17 Sep 2016 03:04:59 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0635.dip0.t-ipconnect.de.
	[79.223.6.53]) by smtp.googlemail.com with ESMTPSA id
	o2sm12473330wjo.3.2016.09.17.03.04.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Sep 2016 03:04:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Sep 2016 12:04:40 +0200
Message-Id: <1474106682-20512-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474106682-20512-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] gvfs: update to 1.28.3
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
X-List-Received-Date: Sat, 17 Sep 2016 10:04:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* patch was applied upstream
* inherit bash-completion instead of reinventing
* add systemd PACKAGECONFIG enabled for systemd in DISTRO_FEATURE
* add gcr PACKAGECONFIG disabled by default
* build tested with all except cdda and none in PACKAGECONFIG

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-Add-support-for-libsystemd.patch    | 49 ----------------------
 .../gvfs/{gvfs_1.24.2.bb => gvfs_1.28.3.bb}        | 18 ++++----
 2 files changed, 7 insertions(+), 60 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gvfs/files/0001-Add-support-for-libsystemd.patch
 rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.24.2.bb => gvfs_1.28.3.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/gvfs/files/0001-Add-support-for-libsystemd.patch b/meta-gnome/recipes-gnome/gvfs/files/0001-Add-support-for-libsystemd.patch
deleted file mode 100644
index 7ec9505..0000000
--- a/meta-gnome/recipes-gnome/gvfs/files/0001-Add-support-for-libsystemd.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 39be8b277c666db21965d54d5b72418ce57a450b Mon Sep 17 00:00:00 2001
-From: Michael Biebl <biebl@debian.org>
-Date: Tue, 19 May 2015 23:38:11 +0200
-Subject: [PATCH] Add support for libsystemd
-
-In systemd v209 the various libsystemd-* libraries were merged into a
-single libsystemd library. So first check for this library and fall back
-to libsystemd-login if not found.
-
-Bug: https://bugzilla.gnome.org/show_bug.cgi?id=749603
-Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=779766
-
-Upstream-Status: Applied
----
- configure.ac | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ee3475d..bd5c043 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -264,18 +264,20 @@ dnl **********************************
- dnl *** Check for libsystemd-login ***
- dnl **********************************
- 
--AC_ARG_ENABLE(libsystemd_login, AS_HELP_STRING([--disable-libsystemd-login],[build without liblibsystemd-login]))
-+AC_ARG_ENABLE(libsystemd_login, AS_HELP_STRING([--disable-libsystemd-login],[build without libsystemd-login]))
- msg_libsystemd_login=no
- LIBSYSTEMD_LOGIN_LIBS=
- LIBSYSTEMD_LOGIN_CFLAGS=
- LIBSYSTEMD_LOGIN_REQUIRED=44
- 
- if test "x$enable_libsystemd_login" != "xno"; then
--  PKG_CHECK_EXISTS([libsystemd-login >= $LIBSYSTEMD_LOGIN_REQUIRED], msg_libsystemd_login=yes)
-+  PKG_CHECK_EXISTS([libsystemd], [msg_libsystemd_login=yes],
-+                   [PKG_CHECK_EXISTS([libsystemd-login >= $LIBSYSTEMD_LOGIN_REQUIRED], msg_libsystemd_login=yes)])
- 
-   if test "x$msg_libsystemd_login" = "xyes"; then
--    PKG_CHECK_MODULES([LIBSYSTEMD_LOGIN],[libsystemd-login >= $LIBSYSTEMD_LOGIN_REQUIRED])
--    AC_DEFINE(HAVE_LIBSYSTEMD_LOGIN, 1, [Define to 1 if liblibsystemd_login is available])
-+    PKG_CHECK_MODULES([LIBSYSTEMD_LOGIN],[libsystemd],,
-+                      [PKG_CHECK_MODULES([LIBSYSTEMD_LOGIN],[libsystemd-login >= $LIBSYSTEMD_LOGIN_REQUIRED])])
-+    AC_DEFINE(HAVE_LIBSYSTEMD_LOGIN, 1, [Define to 1 if libsystemd_login is available])
-   fi
- fi
- 
--- 
-2.5.0
-
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb
rename to meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
index aa62070..fde57c1 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.24.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.28.3.bb
@@ -2,15 +2,12 @@ DESCRIPTION = "gvfs is a userspace virtual filesystem"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
-inherit gnome
+inherit gnome bash-completion
 
 DEPENDS += "libsecret glib-2.0 gconf intltool-native libgudev udisks2"
 
-SRC_URI[archive.md5sum] = "83ed317eb2a5264715d4273e90a5cfd8"
-SRC_URI[archive.sha256sum] = "0949eaedd1df7175f8d7ee2700df8210d1f854b8ee37d963bc32ee7091eeb228"
-SRC_URI += " \
-    file://0001-Add-support-for-libsystemd.patch \
-"
+SRC_URI[archive.md5sum] = "d2399a1a217dd5030e8830c7e7c813c2"
+SRC_URI[archive.sha256sum] = "458c4cb68570f6ef4a9e152995c62d0057c3e0a07ed64d84c7200cdd22f0bd17"
 
 EXTRA_OECONF = " \
     --disable-gdu \
@@ -28,6 +25,7 @@ FILES_${PN} += " \
     ${datadir}/dbus-1/services \
     ${libdir}/gio/modules/*.so \
     ${libdir}/tmpfiles.d \
+    ${systemd_user_unitdir} \
 "
 RDEPENDS_${PN} = "udisks2"
 
@@ -40,20 +38,18 @@ FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${datadir}/gvfs/mounts/trash.moun
 
 RRECOMMENDS_gvfsd-ftp += "openssh-sftp openssh-ssh"
 
-PACKAGES += "${PN}-bash-completion"
-FILES_${PN}-bash-completion = "${datadir}/bash-completion"
-RDEPENDS_${PN}-bash-completion = "bash-completion"
-
-PACKAGECONFIG ?= "libgphoto2"
+PACKAGECONFIG ?= "libgphoto2 ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 PACKAGECONFIG[afc] = "--enable-afc, --disable-afc, libimobiledevice libplist"
 PACKAGECONFIG[archive] = "--enable-archive, --disable-archive, libarchive"
 PACKAGECONFIG[avahi] = "--enable-avahi, --disable-avahi, avahi"
+PACKAGECONFIG[gcr] = "--enable-gcr, --disable-gcr, gcr"
 PACKAGECONFIG[gtk] = "--enable-gtk, --disable-gtk, gtk+3"
 PACKAGECONFIG[http] = "--enable-http, --disable-http, libsoup-2.4"
 PACKAGECONFIG[libmtp] = "--enable-libmtp, --disable-libmtp, libmtp"
 PACKAGECONFIG[libgphoto2] = "--enable-gphoto2, --disable-gphoto2, libgphoto2"
 PACKAGECONFIG[samba] = "--enable-samba, --disable-samba, samba"
+PACKAGECONFIG[systemd] = "--with-systemduserunitdir=${systemd_user_unitdir},--without-systemduserunitdir,systemd"
 
 # needs meta-filesystems
 PACKAGECONFIG[fuse] = "--enable-fuse, --disable-fuse, fuse"
-- 
2.5.5


