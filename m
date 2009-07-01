Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MLzxZ-00073a-6e
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 15:34:53 +0200
Received: by ewy21 with SMTP id 21so1037793ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jul 2009 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=7DVAPdUS/68rhMLfLGoyHxOwREPYwAnlEaXR6tHSHxY=;
	b=mJvT7w+MFDPxK+ZHOxcrue9MjZft+F6sK9XRrWRDrwkHzjBa+NECAIa4ktVErJQMas
	nus16EYS+qfs86F0sQnZ6bebWb0atjXsujj3SrNEt4IlFOobaYWVYtMGL7sjCFyCcZ+i
	pQa5qkr2+lQErao0Y8gA0UohKPBVY3so+7ids=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cJua022N8IzUzQRTHB47DnTUGk7OA2240jurhiPvO/cYzJom2h9pp1nu6sarDu+Czg
	rZKQ6L0H/Jpx/1TBb57xuwcqJpQUNXLBtutrQ7tounEADUBfmCFCLAJ4tGI2IVTMNYCn
	G/I0W/WImYqDqU9BEKu4eJRUXjtP+244Fczxo=
Received: by 10.216.71.19 with SMTP id q19mr2793851wed.65.1246454571995;
	Wed, 01 Jul 2009 06:22:51 -0700 (PDT)
Received: from localhost.localdomain
	(host56-7-static.30-87-b.business.telecomitalia.it [87.30.7.56])
	by mx.google.com with ESMTPS id i35sm2890529gve.11.2009.07.01.06.22.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Jul 2009 06:22:50 -0700 (PDT)
From: Marco Cavallini <koansoftware@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jul 2009 15:22:28 +0200
Message-Id: <1246454548-15862-1-git-send-email-m.cavallini@koansoftware.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [PATCH 1/2] New conf/distro/kaeilos.conf with customized include files
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
X-List-Received-Date: Wed, 01 Jul 2009 13:35:02 -0000


Signed-off-by: Marco Cavallini <m.cavallini@koansoftware.com>
---
 .../include/kaeilos-2009-preferred-versions.inc    |   72 ++++++++++++++++++++
 conf/distro/include/kaeilos.inc                    |    6 +-
 conf/distro/kaeilos.conf                           |    9 ++-
 3 files changed, 81 insertions(+), 6 deletions(-)
 create mode 100644 conf/distro/include/kaeilos-2009-preferred-versions.inc

diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/conf/distro/include/kaeilos-2009-preferred-versions.inc
new file mode 100644
index 0000000..ba8d587
--- /dev/null
+++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
@@ -0,0 +1,72 @@
+#@--------------------------------------------------------------------
+#@FILE: conf/distro/include/kaeilos-2009-preferred-versions.inc
+#@TYPE: Distribution
+#@NAME: KaeilOS(R) - http://www.kaeilos.com
+#@DESCRIPTION: KaeilOS Linux Distribution preferred version
+#@MAINTAINER: Marco Cavallini <m.cavallini@koansoftware.com>
+#@VERSION: 01-07-2009
+#
+# KaeilOS is a registered trade mark of KOAN - Bergamo - Italia
+# Product website : http://www.KaeilOS.com 
+#@--------------------------------------------------------------------
+
+PREFERRED_VERSION_autoconf = "2.63"
+PREFERRED_VERSION_autoconf-native = "2.63"
+PREFERRED_VERSION_automake-native = "1.10.2"
+PREFERRED_VERSION_busybox 	= "1.13.2"
+PREFERRED_VERSION_cairo		= "1.8.0"
+PREFERRED_VERSION_dbus 		= "1.2.1"
+PREFERRED_VERSION_dropbear      = "0.51"
+PREFERRED_VERSION_fontconfig	= "2.6.0"
+PREFERRED_VERSION_glib-2.0 	= "2.20.0"
+PREFERRED_VERSION_glib-2.0-native = "2.18.0"
+PREFERRED_VERSION_glibmm = "2.18.0"
+PREFERRED_VERSION_glproto	= "1.4.9"      
+PREFERRED_VERSION_gst-pulse 	= "0.9.7"
+PREFERRED_VERSION_gtk+		= "2.16.0"
+PREFERRED_VERSION_gtkmm		= "2.14.1"
+PREFERRED_VERSION_hal		= "0.5.12"
+PREFERRED_VERSION_libgemwidget	= "1.0"
+PREFERRED_VERSION_libgpephone	= "0.4"
+PREFERRED_VERSION_libsdl-x11	= "1.2.11"
+PREFERRED_VERSION_libtool 	= "2.2.4"
+PREFERRED_VERSION_libtool-native = "2.2.4"
+PREFERRED_VERSION_libtool-cross	= "2.2.4"
+PREFERRED_VERSION_libtool-sdk	= "2.2.4"
+PREFERRED_VERSION_libx11 = "1.2"
+PREFERRED_VERSION_mesa = "7.2"
+PREFERRED_VERSION_pango 	= "1.24.2"
+PREFERRED_VERSION_pixman	= "0.13.2"
+PREFERRED_VERSION_pkgconfig	= "0.23"
+PREFERRED_VERSION_pkgconfig-native = "0.23"
+PREFERRED_VERSION_pulseaudio 	= "0.9.15"
+PREFERRED_VERSION_samba		= "3.3.0"
+PREFERRED_VERSION_tiff 		= "3.8.2+4.0.0beta2"
+
+PREFERRED_VERSION_udev 		= "141"
+UDEV_GE_141 = "1"
+
+PREFERRED_VERSION_usbutils = "0.82"
+PREFERRED_VERSION_util-macros-native = "1.2.1"
+PREFERRED_VERSION_util-macros = "1.2.1"
+PREFERRED_VERSION_wpa-supplicant = "0.6.7"
+PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
+PREFERRED_VERSION_xserver-xorg = "1.6.1"
+
+#
+# meta-moblin package SRCREVs
+#
+SRCREV_pn-bickley ?= "de9431b7c6040bc3731157c05947159ad2c7a0a9"
+SRCREV_pn-json-glib ?= "930fdf4c4dff1f5310a946c2a9f5b6860f7c8ba8"
+SRCREV_pn-libccss ?= "92bc59e1d39302c8be500d53cb5dd8b05c2e4a15"
+SRCREV_pn-libgdbus ?= "aeab6e3c0185b271ca343b439470491b99cc587f"
+SRCREV_pn-librest ?= "14d35103d9649dc1e10c3e9ac2c690b3165c8184"
+SRCREV_pn-moblin-menus ?= "e1d63681739dd16195d005b3cf15752df294bd3c"
+SRCREV_pn-mojito ?= "0542c4b0e26c0e3b69c5ad1fa1898dc276fb9f48"
+SRCREV_pn-mozilla-headless-services ?= "c7873654894af6c7c6c01194d6185db46667b81f"
+SRCREV_pn-mutter ?= "aff4cf110307e149d3497d20543cde27b9699758"
+SRCREV_pn-twitter-glib ?= "849bec29292df88590e0b2898b50b9b8d766817e"
+SRCREV_pn-xf86-video-psb ?= "b6b3bba06fe5a3fe0b1bd6e31a7369dd83812bab"
+
+
+
diff --git a/conf/distro/include/kaeilos.inc b/conf/distro/include/kaeilos.inc
index de7dca7..fc0348d 100644
--- a/conf/distro/include/kaeilos.inc
+++ b/conf/distro/include/kaeilos.inc
@@ -56,15 +56,15 @@ THUMB_INTERWORK = "yes"
 
 
 #Use this variable in feeds and other parts that need a URI
-ANGSTROM_URI ?= "http://www.angstrom-distribution.org"
+ANGSTROM_URI ?= "http://www.kaeilos.com"
 
 #Use this variable to select which recipe you want to use to get feed configs (/etc/ipkg/, /etc/apt/sources.list)
 # usefull for derivative distros and local testing
 # As this is runtime we can't and won't use virtual/feed-configs
 ANGSTROM_FEED_CONFIGS ?= "angstrom-feed-configs"
 
-#Set the default maintainer to angstrom-dev
-MAINTAINER = "KaeilOS Developers <info@koansoftware.com>"
+#Set the default maintainer of kaeilos
+MAINTAINER = "KaeilOS Mantainer <m.cavallini@koansoftware.com>"
 
 #use debian style naming
 INHERIT += "debian"
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index b7add99..5bec2d4 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -3,7 +3,10 @@
 #@NAME: KaeilOS(R) - http://www.kaeilos.com
 #@DESCRIPTION: KaeilOS Linux Distribution for Kernel 2.6 based devices
 #@MAINTAINER: Marco Cavallini <m.cavallini@koansoftware.com>
-#@VERSION: 23-06-2009 - B
+#@VERSION: 01-07-2009
+#
+# KaeilOS is a registered trade mark of KOAN - Bergamo - Italia
+# Product website : http://www.KaeilOS.com
 #
 # Use this at your own risk, we welcome bugreports filed at 
 #    http://bugs.openembedded.net
@@ -12,14 +15,14 @@
 #DISTRO_VERSION = "2009.1"
 DISTRO_VERSION = "2009.1-test-${DATE}"
 DISTRO_REVISION = "1"
-DISTRO_PR = ".2"
+DISTRO_PR = ".3"
 
 #build staging from packages
 INHERIT += "packaged-staging"
 
 require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
-require conf/distro/include/angstrom-2008-preferred-versions.inc
+require conf/distro/include/kaeilos-2009-preferred-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 
 PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
-- 
1.6.3.3



