Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHOSI-0001pI-Si
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:15:49 +0100
Received: by mail-bw0-f217.google.com with SMTP id 9so3028821bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 13:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=a3dHZ8VCyTXG83BsXS+1Vubo16RNSOU/BwhjiknQlKk=;
	b=WC2Ea/xj0cAgdrK0rNyxMJpgXV7zRbfSCT5XVYJwaZSdeyNz4Hne1t1JX+LQxOAvsX
	+AuBmQtvNb911aUiGYovBBUueHInyGbE8DdahqBb5BC7ICFojDbHcqWFSbDHbHA+8/pC
	GbC2lkEBgPkKZDcO1MkcEFJg/mQi0NApgl/sc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RBOrXR0ZudTIqLMmMdqrpGtR6sPKKmEgmGnB6WdWqYOkxgA/4W6+R7rmcVWk6ROGzT
	CIFbDgWdvs52zoR+2ZcEyMOjHoQle9xKFa4kclYjXjSOxDZKDaH5z3A0cuDgbBuhxDH8
	J7ovS7VDImk+eX+Fs7b+xHqZ6HZ5Pb7r87YUE=
Received: by 10.204.24.83 with SMTP id u19mr2438197bkb.22.1260134050000;
	Sun, 06 Dec 2009 13:14:10 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 13sm1744230fxm.5.2009.12.06.13.14.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 13:14:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 22:13:45 +0100
Message-Id: <1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.4
In-Reply-To: <1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
References: <20091204090048.GA3233@jama>
	<1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 1/6] bitbake.conf: create compatibility-providers.conf from micro, minimal, angstrom, shr preferred providers
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
X-List-Received-Date: Sun, 06 Dec 2009 21:15:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/bitbake.conf                 |    1 +
 conf/compatibility-providers.conf |   70 +++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 conf/compatibility-providers.conf

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index b69b675..48e098d 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -688,6 +688,7 @@ include conf/documentation.conf
 require conf/sanity.conf
 require conf/abi_version.conf
 require conf/enterprise.conf
+require conf/compatibility-providers.conf
 
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
diff --git a/conf/compatibility-providers.conf b/conf/compatibility-providers.conf
new file mode 100644
index 0000000..d530524
--- /dev/null
+++ b/conf/compatibility-providers.conf
@@ -0,0 +1,70 @@
+#############################################################################
+# DEFAULT PREFERRED PROVIDERS
+# Every distribution should include this file.
+# It will make adding new providers easier.
+PREFERRED_PROVIDER_atd ?= "atd-over-fso"
+PREFERRED_PROVIDER_atd ?= "atd"
+PREFERRED_PROVIDER_avahi ?= "avahi"
+PREFERRED_PROVIDER_bluez-libs ?= "bluez4"
+PREFERRED_PROVIDER_bluez-utils ?= "bluez4"
+PREFERRED_PROVIDER_bluez-utils-dbus ?= "bluez-utils"
+PREFERRED_PROVIDER_classpath ?= "classpath"
+PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
+PREFERRED_PROVIDER_esound ?= "pulseaudio"
+PREFERRED_PROVIDER_e-wm-menu ?= "e-wm-menu-shr"
+PREFERRED_PROVIDER_frameworkd-config ?= "frameworkd-config-shr"
+PREFERRED_PROVIDER_gconf ?= "gconf"
+#PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-ani ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-bmpg ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-gif ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-ico ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-jpeg ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-pcx ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-png ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-pnm ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-ras ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-tga ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-wbmp ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-xbm ?= "gtk+"
+PREFERRED_PROVIDER_gdk-pixbuf-loader-xpm ?= "gtk+"
+PREFERRED_PROVIDER_gnome-vfs ?= "gnome-vfs"
+PREFERRED_PROVIDER_gnome-vfs-plugin-file ?= "gnome-vfs"
+#PREFERRED_PROVIDER_gpsd ?= "fso-gpsd"
+PREFERRED_PROVIDER_gpsd ?= "gpsd"
+PREFERRED_PROVIDER_gtk+ ?= "gtk+"
+PREFERRED_PROVIDER_hostap-conf ?= "hostap-conf"
+PREFERRED_PROVIDER_hostap-modules_hx4700 ?= "hostap-modules"
+PREFERRED_PROVIDER_hostap-modules_h2200 ?= "hostap-modules"
+PREFERRED_PROVIDER_hotplug ?= "udev"
+PREFERRED_PROVIDER_libfribidi ?= "fribidi"
+PREFERRED_PROVIDER_libgpewidget ?= "libgpewidget"
+PREFERRED_PROVIDER_libxss ?= "libxss"
+PREFERRED_PROVIDER_ntp ?= "ntp"
+PREFERRED_PROVIDER_openmoko-alsa-scenarios ?= "alsa-scenarii-shr"
+PREFERRED_PROVIDER_opkg ?= "opkg"
+#PREFERRED_PROVIDER_opkg ?= "opkg-nogpg"
+PREFERRED_PROVIDER_qemu-native ?= "qemu-native"
+PREFERRED_PROVIDER_qt4x11 ?= "qt4-x11-free"
+PREFERRED_PROVIDER_task-bootstrap ?= "task-bootstrap"
+PREFERRED_PROVIDER_tslib-conf ?= "tslib"
+PREFERRED_PROVIDER_tslib ?= "tslib"
+PREFERRED_PROVIDER_util-linux ?= "util-linux-ng"
+PREFERRED_PROVIDER_virtual/alsa-scenarios ?= "alsa-scenarii-shr"
+PREFERRED_PROVIDER_virtual/db ?= "db"
+#PREFERRED_PROVIDER_virtual/db ?= "db3"
+PREFERRED_PROVIDER_virtual/db-native ?= "db-native"
+#PREFERRED_PROVIDER_virtual/db-native ?= "db3-native"
+PREFERRED_PROVIDER_virtual/gail ?= "gtk+"
+PREFERRED_PROVIDER_virtual/javac-native ?= "ecj-bootstrap-native"
+PREFERRED_PROVIDER_virtual/java-initial ?= "jamvm-initial"
+PREFERRED_PROVIDER_virtual/java-native ?= "jamvm-native"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
+PREFERRED_PROVIDER_virtual/libsdl ?= "libsdl-x11"
+#PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb"
+PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb-compat"
+PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
+PREFERRED_PROVIDER_virtual/psplash ?= "psplash-angstrom"
+PREFERRED_PROVIDER_virtual/shr-splash-theme ?= "shr-splash-theme-logo"
+PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
+PREFERRED_PROVIDER_xserver ?= "xserver-xorg"
-- 
1.6.5.4



