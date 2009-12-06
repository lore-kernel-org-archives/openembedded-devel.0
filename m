Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHOST-0001pb-7v
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:16:00 +0100
Received: by mail-bw0-f217.google.com with SMTP id 9so3028873bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 13:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4eZRZA9slf1DroD1a2KkwBPfQmqXI+/GGF9+v1aNbBE=;
	b=xuVPay6qxwQqMGiIQmPo2uJygwxUjDePotXs43EvHxu/wSPYFuKfsSOLyZu0lP8DpL
	8FkXLEb9WWc3eLjYl33ONfsmFCDWVgRQsLgMvvXrJm8EIWY17t74gLH2i7fiIHNGA05o
	TOqRAdYC1iUE/OX/lxyhuPelnHG+kiJdHPjt0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=osxpZFxMbruV6Yf4s/aBGSjmdxroNZUBcLFOnwu1oXZf+Gopr6vFH8+BABGHPCwPa4
	jlKwh/Dr2OPaBc264LvaR65Q+pqIqInzarHZQpy7Rx0iB4GO0B62rNGd8o7u7uP2Chm0
	qLyX2FvVoedDGyGc24XX5lD6340ysikx5y0LQ=
Received: by 10.204.20.143 with SMTP id f15mr6156598bkb.49.1260134058808;
	Sun, 06 Dec 2009 13:14:18 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 14sm1746017fxm.11.2009.12.06.13.14.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 13:14:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 22:13:48 +0100
Message-Id: <1260134030-3658-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.4
In-Reply-To: <1260134030-3658-4-git-send-email-Martin.Jansa@gmail.com>
References: <20091204090048.GA3233@jama>
	<1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-3-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-4-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 4/6] angstrom-2008.1.conf: remove preferred providers set already in compatibility-providers.conf
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
X-List-Received-Date: Sun, 06 Dec 2009 21:16:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/angstrom-2008.1.conf |   67 +-------------------------------------
 1 files changed, 1 insertions(+), 66 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index abc9a93..c15dbbd 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -87,21 +87,6 @@ PREFERRED_VERSION_glibc-initial 	?= "2.9"
 PREFERRED_VERSION_uclibc        	?= "0.9.30.1"
 PREFERRED_VERSION_uclibc-initial	?= "0.9.30.1"
 
-# Preferred provider for virtual/psplash
-# This enforces a specific brand to be used, in our case the angstrom
-# one. In case you want to change the logo or something like that we
-# suggest you to create another recipe (e.g: psplash-<brand>) for that
-# and add that into your image.
-# You can also opt to change or override this line, but that isn't
-# needed because psplash is using update-alternatives.
-PREFERRED_PROVIDER_virtual/psplash               ?= "psplash-angstrom"
-
-PREFERRED_PROVIDER_avahi = "avahi"
-PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb-compat"
-PREFERRED_PROVIDER_virtual/gail    ?= "gtk+"
-
-PREFERRED_PROVIDER_libfribidi = "fribidi"
-
 #powerpc needs additional patches to gcc
 ANGSTROM_GCC_VERSION_ppc405 		?= "4.1.1"
 ANGSTROM_GCC_VERSION_xilinx-ml403	?= "4.1.1"
@@ -140,33 +125,10 @@ PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 # Toolchain virtuals:
 require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 
-# hostap stuff, we prefer the in-kernel modules, but those don't work for all machines
-PREFERRED_PROVIDER_hostap-conf                      ?= "hostap-conf"
-PREFERRED_PROVIDER_hostap-modules_h2200             ?= "hostap-modules"
-PREFERRED_PROVIDER_hostap-modules_hx4700            ?= "hostap-modules"
-
-PREFERRED_PROVIDER_virtual/db           ?= "db"
-PREFERRED_PROVIDER_virtual/db-native    ?= "db-native"
-PREFERRED_PROVIDER_virtual/libsdl       ?= "libsdl-x11"
-PREFERRED_PROVIDER_virtual/libx11       ?= "libx11"
-
-# Others:
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
-PREFERRED_PROVIDER_esound               ?= "pulseaudio"
-PREFERRED_PROVIDER_gconf                ?= "gconf"
-PREFERRED_PROVIDER_gnome-vfs            ?= "gnome-vfs"
-PREFERRED_PROVIDER_gnome-vfs-plugin-file ?= "gnome-vfs"
-PREFERRED_PROVIDER_tslib                ?= "tslib"
-PREFERRED_PROVIDER_tslib-conf           ?= "tslib"
-PREFERRED_PROVIDER_libgpewidget         ?= "libgpewidget"
-PREFERRED_PROVIDER_ntp                  ?= "ntp"
 PREFERRED_PROVIDER_hotplug               = "udev"
 PREFERRED_PROVIDER_opkg                 ?= "opkg-nogpg"
-PREFERRED_PROVIDER_libxss                = "libxss"
-PREFERRED_PROVIDER_bluez-utils-dbus      = "bluez-utils"
-PREFERRED_PROVIDER_bluez-libs            = "bluez4"
-PREFERRED_PROVIDER_bluez-utils           = "bluez4"
-PREFERRED_PROVIDER_util-linux            = "util-linux-ng"
+
 # The default is too old for linux-libc-headers-2.6.31:
 PREFERRED_VERSION_mplayer                = "0.0+1.0rc2+svnr29789"
 
@@ -175,43 +137,16 @@ ANGSTROM_BLACKLIST_pn-bluez-utils	= "bluez-utils 3.x has been replaced by bluez4
 
 ANGSTROM_BLACKLIST_pn-fso-apm       = "regular apmd is good enough"
 
-# we don't ship gtk-directfb by default
-PREFERRED_PROVIDER_gtk+                   ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-ani  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-bmpg ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-gif  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-ico  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-jpeg ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-pcx  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-png  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-pnm  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-ras  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-tga  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-wbmp ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-xbm  ?= "gtk+"
-PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm  ?= "gtk+"
-
-# QT stuff:
-# There are several flavours of qt4x11 in OE, so lets pick one that is buildable for everyone
-PREFERRED_PROVIDER_qt4x11 ?= "qt4-x11-free"
-
-#Silence a warning during parsing
-PREFERRED_PROVIDER_task-bootstrap = "task-bootstrap"
-
 #This is needed to get a correct PACKAGE_ARCH for packages that have PACKAGE_ARCH = ${MACHINE_ARCH}
 ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 require conf/distro/include/angstrom${ARM_ABI}.inc
 
-
-
 # If we're using an .ipk based rootfs, we want to have opkg-nogpg installed so postinst script can run
 # We also take this opportunity to inject angstrom-version and the feed configs into the rootfs
 IPKG_VARIANT = "opkg-nogpg-nocurl angstrom-version ${ANGSTROM_FEED_CONFIGS}"
 
 # Select xserver-xorg as default, since kdrive has been EOL'ed
 XSERVER ?= "xserver-xorg xf86-input-evdev xf86-input-keyboard xf86-input-mouse xf86-video-fbdev" 
-PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
-PREFERRED_PROVIDER_xserver ?= "xserver-xorg"
 
 # do some task-base stuff here
 
-- 
1.6.5.4



