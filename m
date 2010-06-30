Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OToxH-0006Te-Mg
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 06:31:26 +0200
Received: by pzk4 with SMTP id 4so66926pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 21:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=9jThF8wR7go1Fwd/EnhCNV4ZcLafsx8Mfz34EEJaZNs=;
	b=SzyG0LBX84totkqnlSvF26r/K1UXzx3YEXFmNC0Bdg9YpVt9zoZUB7/nw3c4CAWWtd
	6oQtWGPm56GyrcZj7f60umJqC/HXzRM6V9ge8ZmsPOuO4IV9bmYR1VeEIW4goLlI2Nw4
	NXmowVX8mJ4kLuQtyC7QV8UmXCv9u5CBLXcWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=sfVSnYHOPvCjeDX//wpb/bxqEr5z+A7/MOyOuEomzeuwf8LarHkNSp8C29z24LcROY
	n/Q5osfV7uQrGgMFj3Rlb0/S+4q7XbunvfI2DaIQMRg8pPerBigpmWhhg/VqHfwSv5dy
	owpPNohNEYw5ceoj+hHPd7ppqIEBeqQqNpSy0=
Received: by 10.143.153.4 with SMTP id f4mr9324447wfo.253.1277871999178;
	Tue, 29 Jun 2010 21:26:39 -0700 (PDT)
Received: from [10.0.0.4] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	r23sm5134214rvq.14.2010.06.29.21.26.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 21:26:38 -0700 (PDT)
Message-ID: <4C2AC77A.70102@gmail.com>
Date: Wed, 30 Jun 2010 13:56:34 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100401 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] opkg recipe overhaul - removal of opkg-nogpg and opkg-nogpg-nocurl.
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
X-List-Received-Date: Wed, 30 Jun 2010 04:31:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

None of the distros in OE appear to want/need gpg or curl support in opkg;
so have opkg.inc remove them by default. This diff makes things more consistent
across all distros/tasks/images.

The slugos recipe is kept intact and further divided from the more modern
recipes. The opkg-native recipe is the sane-srcrev version even when building
slugos, which should allow for changes to opkg related bbclasses without
breaking the slugos build.

Build tested for qemumipsel/minimal-image and nslu2/slugos-image.
minimal-image builds 10% quicker in my setup and is 1mb smaller.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 conf/compatibility-providers.conf                 |    1 -
 conf/distro/angstrom-2008.1.conf                  |    8 +-
 conf/distro/include/preferred-slugos-versions.inc |   10 ---
 conf/distro/jlime-2010.1.conf                     |    2 +-
 conf/distro/kaeilos-2010.conf                     |   10 ++--
 conf/distro/kaeilos.conf                          |   10 ++--
 conf/distro/micro.conf                            |    2 +-
 conf/distro/minimal.conf                          |    8 +-
 conf/distro/nylon.conf                            |    2 +-
 recipes/angstrom/angstrom-feed-configs.bb         |    2 +-
 recipes/images/minimal-gpe-image.bb               |    2 +-
 recipes/images/nas-server-image.bb                |    2 +-
 recipes/images/x11-sato-image.bb                  |    2 +-
 recipes/meta/meta-toolchain-arago.bb              |    2 +-
 recipes/opkg/files/fix_endianness.patch           |   12 ----
 recipes/opkg/files/isatty.patch                   |   64 +++++++++++++++++++++
 recipes/opkg/files/opkg-intercept-cleanup.patch   |   47 +++++++++++++++
 recipes/opkg/files/opkg-libdir.patch              |   11 ----
 recipes/opkg/opkg-native_svn.bb                   |   11 +---
 recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb      |   29 +++++++---
 recipes/opkg/opkg-nogpg-nocurl_svn.bb             |   15 -----
 recipes/opkg/opkg-nogpg_svn.bb                    |   25 --------
 recipes/opkg/opkg-sdk_svn.bb                      |    2 +-
 recipes/opkg/opkg.inc                             |   16 ++---
 recipes/opkg/opkg/isatty.patch                    |   64 ---------------------
 recipes/opkg/opkg/opkg-intercept-cleanup.patch    |   47 ---------------
 recipes/opkg/opkg_svn.bb                          |    6 --
 recipes/tasks/task-arago-toolchain-target.bb      |    2 +-
 recipes/tasks/task-sdk-sbox.bb                    |    2 +-
 29 files changed, 168 insertions(+), 248 deletions(-)
 delete mode 100644 recipes/opkg/files/fix_endianness.patch
 create mode 100644 recipes/opkg/files/isatty.patch
 create mode 100644 recipes/opkg/files/opkg-intercept-cleanup.patch
 delete mode 100644 recipes/opkg/files/opkg-libdir.patch
 delete mode 100644 recipes/opkg/opkg-nogpg-nocurl_svn.bb
 delete mode 100644 recipes/opkg/opkg-nogpg_svn.bb
 delete mode 100644 recipes/opkg/opkg/isatty.patch
 delete mode 100644 recipes/opkg/opkg/opkg-intercept-cleanup.patch

diff --git a/conf/compatibility-providers.conf b/conf/compatibility-providers.conf
index 350521a..58a0ad1 100644
--- a/conf/compatibility-providers.conf
+++ b/conf/compatibility-providers.conf
@@ -46,7 +46,6 @@ PREFERRED_PROVIDER_libxss ?= "libxss"
 PREFERRED_PROVIDER_ntp ?= "ntp"
 PREFERRED_PROVIDER_openmoko-alsa-scenarios ?= "fsodeviced"
 PREFERRED_PROVIDER_opkg ?= "opkg"
-#PREFERRED_PROVIDER_opkg ?= "opkg-nogpg"
 PREFERRED_PROVIDER_qemu-native ?= "qemu-native"
 PREFERRED_PROVIDER_qt4-embedded ?= "qt4-embedded"
 PREFERRED_PROVIDER_qt4-x11-free ?= "qt4-x11-free"
diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 7c70c84..e86ced3 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -139,7 +139,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
-PREFERRED_PROVIDER_opkg                 ?= "opkg-nogpg-nocurl"
+PREFERRED_PROVIDER_opkg                 ?= "opkg"
 
 ANGSTROM_BLACKLIST_pn-bluez-libs	= "bluez-libs 3.x has been replaced by bluez4"
 ANGSTROM_BLACKLIST_pn-bluez-utils	= "bluez-utils 3.x has been replaced by bluez4"
@@ -151,12 +151,12 @@ require conf/distro/include/angstrom.inc
 # Set DISTRO_FEED_CONFIGS to our config var, assigned in the above .inc
 DISTRO_FEED_CONFIGS = "${ANGSTROM_FEED_CONFIGS}"
 
-# If we're using an .ipk based rootfs, we want to have opkg-nogpg installed so postinst script can run
+# If we're using an .ipk based rootfs, we want to have opkg installed so postinst script can run
 # We also take this opportunity to inject angstrom-version and the feed configs into the rootfs
-IPKG_VARIANT = "opkg-nogpg-nocurl angstrom-version ${ANGSTROM_FEED_CONFIGS}"
+IPKG_VARIANT = "opkg angstrom-version ${ANGSTROM_FEED_CONFIGS}"
 
 # we need the same provider for opkg and u-a
-PREFERRED_PROVIDER_virtual/update-alternatives = "opkg-nogpg-nocurl"
+PREFERRED_PROVIDER_virtual/update-alternatives = "opkg"
 
 # Select xserver-xorg as default, since kdrive has been EOL'ed
 XSERVER ?= "xserver-xorg xf86-input-evdev xf86-input-keyboard xf86-input-mouse xf86-video-fbdev" 
diff --git a/conf/distro/include/preferred-slugos-versions.inc b/conf/distro/include/preferred-slugos-versions.inc
index 84b1381..a8909d0 100644
--- a/conf/distro/include/preferred-slugos-versions.inc
+++ b/conf/distro/include/preferred-slugos-versions.inc
@@ -15,16 +15,6 @@ PREFERRED_VERSION_linux-ixp4xx = "2.6.27.8+svnr${SRCREV_pn-linux-ixp4xx}"
 #
 #===============================================================================#
 #===============================================================================#
-#                              NOTE NOTE NOTE
-#
-# Override the sane-srcrev file with regard to the opkg versions - this should
-# be removed as soon as opkg starts to work correctly again as newer opkg
-# versions fix a number of bugs and add some desireable features.
-#
-OPKG_SRCREV = "160"
-#
-#===============================================================================#
-#===============================================================================#
 
 ### Standard package preferred versions go here, sorted
 ### alphabetically.  Note that the main slugos.inc file
diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.conf
index 3ec3e86..f62ca99 100644
--- a/conf/distro/jlime-2010.1.conf
+++ b/conf/distro/jlime-2010.1.conf
@@ -40,7 +40,7 @@ SPLASH = "psplash"
 INHERIT += "debian package_tar package_ipk src_distribute_local"
 SRC_DIST_LOCAL ?= "symlink"
 IMAGE_FSTYPES = "tar.gz tar.bz2 jffs2"
-PREFERRED_PROVIDER_virtual/update-alternatives = "opkg-nogpg-nocurl"
+PREFERRED_PROVIDER_virtual/update-alternatives = "opkg"
 
 #
 # Kernel
diff --git a/conf/distro/kaeilos-2010.conf b/conf/distro/kaeilos-2010.conf
index 4bb637c..58d7a57 100644
--- a/conf/distro/kaeilos-2010.conf
+++ b/conf/distro/kaeilos-2010.conf
@@ -64,7 +64,7 @@ require conf/distro/include/kaeilos-2010.inc
 # Select packaging system
 IMAGE_FSTYPES ?= "tar.gz jffs2"
 PREFERRED_PKG_FORMAT = "ipk"
-IPKG_VARIANT = "opkg-nogpg"
+IPKG_VARIANT = "opkg"
 
 
 
@@ -99,11 +99,11 @@ require conf/distro/include/sane-toolchain.inc
 
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
-PREFERRED_PROVIDER_opkg                 ?= "opkg-nogpg-nocurl"
+PREFERRED_PROVIDER_opkg                 ?= "opkg"
 
 # PREFERRED VERSIONS
-PREFERRED_PROVIDER_opkg ?= "opkg-nogpg"
-PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg"
+PREFERRED_PROVIDER_opkg ?= "opkg"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 
 
 # Select xserver-xorg as default, since kdrive has been EOL'ed
@@ -128,7 +128,7 @@ DEBUG_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "strace procps"
 DISTRO_EXTRA_RDEPENDS += "\
     update-modules \
     kaeilos-version \
-    opkg-nogpg opkg-collateral \
+    opkg opkg-collateral \
     util-linux-ng-mount util-linux-ng-umount \
     ${DEBUG_APPS} \
     "
diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index eb12d2e..c1c2e36 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -127,7 +127,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
-PREFERRED_PROVIDER_opkg                 ?= "opkg-nogpg-nocurl"
+PREFERRED_PROVIDER_opkg                 ?= "opkg"
 
 # see recipes/bluez/bluez4*.bb for further dependencies of this setting 
 ANGSTROM_BLACKLIST_pn-bluez-libs	= "bluez-libs 3.x has been replaced by bluez4"
@@ -137,12 +137,12 @@ ANGSTROM_BLACKLIST_pn-fso-apm       = "regular apmd is good enough"
 
 require conf/distro/include/kaeilos.inc
 
-# If we're using an .ipk based rootfs, we want to have opkg-nogpg installed so postinst script can run
+# If we're using an .ipk based rootfs, we want to have opkg installed so postinst script can run
 # We also take this opportunity to inject angstrom-version and the feed configs into the rootfs
-IPKG_VARIANT = "opkg-nogpg-nocurl angstrom-version ${ANGSTROM_FEED_CONFIGS}"
+IPKG_VARIANT = "opkg angstrom-version ${ANGSTROM_FEED_CONFIGS}"
 
 # we need the same provider for opkg and u-a
-PREFERRED_PROVIDER_virtual/update-alternatives = "opkg-nogpg-nocurl"
+PREFERRED_PROVIDER_virtual/update-alternatives = "opkg"
 
 # Select xserver-xorg as default, since kdrive has been EOL'ed
 XSERVER ?= "xserver-xorg xf86-input-evdev xf86-input-keyboard xf86-input-mouse xf86-video-fbdev" 
@@ -167,7 +167,7 @@ DEBUG_APPS += '${@base_conditional("DISTRO_TYPE", "release", "", "strace procps"
 DISTRO_EXTRA_RDEPENDS += "\
     update-modules \
     kaeilos-version \
-    opkg-nogpg opkg-collateral ${ANGSTROM_FEED_CONFIGS} \
+    opkg opkg-collateral ${ANGSTROM_FEED_CONFIGS} \
     util-linux-ng-mount util-linux-ng-umount \
     ${DEBUG_APPS} angstrom-libc-fixup-hack \
     "
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 9885425..5c58ce2 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -32,7 +32,7 @@ INHERIT += "debian"
 #############################################################################
 # Select packaging system
 PREFERRED_PKG_FORMAT = "ipk"
-IPKG_VARIANT = "opkg-nogpg"
+IPKG_VARIANT = "opkg"
 
 require conf/distro/include/sane-feed.inc
 require conf/distro/include/sane-feed-${PREFERRED_PKG_FORMAT}.inc
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 1e72efd..64333c3 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -58,8 +58,8 @@ PREFERRED_PKG_FORMAT ?= "ipk"
 INHERIT += "src_distribute_local"
 SRC_DIST_LOCAL ?= "symlink"
 
-# If we're using an .ipk based rootfs, we want to have opkg-nogpg installed so postinst script can run
-IPKG_VARIANT = "opkg-nogpg"
+# If we're using an .ipk based rootfs, we want to have opkg installed so postinst script can run
+IPKG_VARIANT = "opkg
 
 #############################################################################
 # IMAGES
@@ -101,8 +101,8 @@ require conf/distro/include/preferred-e-versions.inc
 require conf/distro/include/preferred-opie-versions-1.2.4.inc
 require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
 
-PREFERRED_PROVIDER_opkg ?= "opkg-nogpg"
-PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-nogpg"
+PREFERRED_PROVIDER_opkg ?= "opkg"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
 
 #############################################################################
 # CONTENTS
diff --git a/conf/distro/nylon.conf b/conf/distro/nylon.conf
index 7ab7b35..ae8d064 100644
--- a/conf/distro/nylon.conf
+++ b/conf/distro/nylon.conf
@@ -86,4 +86,4 @@ PREFERRED_VERSION_e2fsprogs-libs = "1.41.8"
 PREFERRED_VERSION_dbus = "1.2.1"
 
 PREFERRED_PROVIDER_hotplug = "linux-hotplug"
-PREFERRED_PROVIDER_opkg = "opkg-nogpg"
+PREFERRED_PROVIDER_opkg = "opkg"
diff --git a/recipes/angstrom/angstrom-feed-configs.bb b/recipes/angstrom/angstrom-feed-configs.bb
index d25cba7..cad2b8b 100644
--- a/recipes/angstrom/angstrom-feed-configs.bb
+++ b/recipes/angstrom/angstrom-feed-configs.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Configuration files for online package repositories aka feeds"
 
-RRECOMMENDS_${PN} += "opkg-nogpg-nocurl"
+RRECOMMENDS_${PN} += "opkg"
 
 #PV = "${DISTRO_VERSION}"
 PR = "r11"
diff --git a/recipes/images/minimal-gpe-image.bb b/recipes/images/minimal-gpe-image.bb
index c37225d..0c5c863 100644
--- a/recipes/images/minimal-gpe-image.bb
+++ b/recipes/images/minimal-gpe-image.bb
@@ -17,7 +17,7 @@ IMAGE_INSTALL = "\
     matchbox-wm \
     gpe-terminal \
     angstrom-feed-configs \
-    opkg-nogpg opkg-collateral \
+    opkg opkg-collateral \
     ${SPLASH} \
     "
 
diff --git a/recipes/images/nas-server-image.bb b/recipes/images/nas-server-image.bb
index 85b2bae..61e8296 100644
--- a/recipes/images/nas-server-image.bb
+++ b/recipes/images/nas-server-image.bb
@@ -20,7 +20,7 @@
 # intended to be distro-agnostic.
 
 DISTRO_SSH_DAEMON ?= "dropbear"
-DISTRO_PACKAGE_MANAGER ?= "opkg-nogpg opkg-collateral"
+DISTRO_PACKAGE_MANAGER ?= "opkg opkg-collateral"
 
 DEPENDS = "\
 	task-boot \
diff --git a/recipes/images/x11-sato-image.bb b/recipes/images/x11-sato-image.bb
index 0a127f8..c2ed50e 100644
--- a/recipes/images/x11-sato-image.bb
+++ b/recipes/images/x11-sato-image.bb
@@ -1,5 +1,5 @@
 DISTRO_SSH_DAEMON ?= "dropbear"
-DISTRO_PACKAGE_MANAGER ?= "opkg-nogpg opkg-collateral"
+DISTRO_PACKAGE_MANAGER ?= "opkg opkg-collateral"
 
 XSERVER ?= "xserver-kdrive-fbdev"
 
diff --git a/recipes/meta/meta-toolchain-arago.bb b/recipes/meta/meta-toolchain-arago.bb
index 0478e97..425af6d 100644
--- a/recipes/meta/meta-toolchain-arago.bb
+++ b/recipes/meta/meta-toolchain-arago.bb
@@ -15,7 +15,7 @@ TOOLCHAIN_TARGET_EXCLUDE += "\
     libthread-db1 \
     sln \
     curl \
-    opkg-nogpg \
+    opkg \
     alsa-conf-base \
     update-rc.d \
     update-rc.d-dev \
diff --git a/recipes/opkg/files/fix_endianness.patch b/recipes/opkg/files/fix_endianness.patch
deleted file mode 100644
index 8632ce5..0000000
--- a/recipes/opkg/files/fix_endianness.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -urN opkg.orig/configure.ac opkg/configure.ac
---- opkg.orig/configure.ac	2008-03-20 13:29:09.000000000 +0100
-+++ opkg/configure.ac	2008-03-25 09:39:52.000000000 +0100
-@@ -94,7 +94,7 @@
- AC_CHECK_MEMBERS([struct stat.st_rdev])
- 
- # Checks endianness
--AC_C_BIGENDIAN(ENDIAN_CFLAGS="-DWORDS_BIGENDIAN=1",)
-+AC_C_BIGENDIAN(BIGENDIAN_CFLAGS="-DWORDS_BIGENDIAN=1",)
- AC_SUBST(BIGENDIAN_CFLAGS)
- 
- # Don't do annoying tests that don't work when cross-compiling, just trust them.
diff --git a/recipes/opkg/files/isatty.patch b/recipes/opkg/files/isatty.patch
new file mode 100644
index 0000000..c935f15
--- /dev/null
+++ b/recipes/opkg/files/isatty.patch
@@ -0,0 +1,64 @@
+Copyright (c) 2009 MontaVista Software, Inc.  All rights reserved.
+
+Don't prompt for user input from stdin if it's not a tty.  Fixes a minor
+memory leak while we're at it, as the code was strdup'ing the malloc'd string
+read from stdin without ever freeing the original.
+---
+ libopkg/libopkg.c      |   13 ++++++++-----
+ libopkg/opkg_install.c |    3 +++
+ libopkg/user.c         |   10 +++++++---
+ 3 files changed, 18 insertions(+), 8 deletions(-)
+
+--- trunk.orig/libopkg/libopkg.c
++++ trunk/libopkg/libopkg.c
+@@ -71,11 +71,14 @@ int default_opkg_status_callback(char *n
+ char* default_opkg_response_callback(char *question)
+ {
+      char *response = NULL;
+-     printf("%s",question);
+-     fflush(stdout);
+-     do {
+-	  response = (char *)file_read_line_alloc(stdin);
+-     } while (response == NULL);
++     if (isatty(fileno(stdin)))
++     {
++	  printf("%s",question);
++	  fflush(stdout);
++	  do {
++	       response = (char *)file_read_line_alloc(stdin);
++	  } while (response == NULL);
++     }
+      return response;
+ }
+ 
+--- trunk.orig/libopkg/user.c
++++ trunk/libopkg/user.c
+@@ -44,9 +44,13 @@ char *get_user_response(const char *form
+ 	  len = vsnprintf(question,question_len,format,ap);
+           va_end(ap);
+      } while (len > question_len);
+-     response = strdup(opkg_cb_response(question));
+-     str_chomp(response);
+-     str_tolower(response);
++
++     response = opkg_cb_response(question);
++     if (response)
++     {
++         str_chomp(response);
++         str_tolower(response);
++     }
+ 
+      return response;
+ }
+--- trunk.orig/libopkg/opkg_install.c
++++ trunk/libopkg/opkg_install.c
+@@ -1613,6 +1613,9 @@ static int user_prefers_old_conffile(con
+ 				       "          D     : show the differences between the versions (if diff is installed)\n"
+ 				       "     The default action is to keep your current version.\n"
+ 				       "    *** %s (Y/I/N/O/D) [default=N] ? ", file_name, short_file_name);
++	  if (!response)
++	       return 1;
++
+ 	  if (strcmp(response, "y") == 0
+ 	      || strcmp(response, "i") == 0
+ 	      || strcmp(response, "yes") == 0) {
diff --git a/recipes/opkg/files/opkg-intercept-cleanup.patch b/recipes/opkg/files/opkg-intercept-cleanup.patch
new file mode 100644
index 0000000..12893e3
--- /dev/null
+++ b/recipes/opkg/files/opkg-intercept-cleanup.patch
@@ -0,0 +1,47 @@
+---
+ libopkg/opkg_cmd.c |   13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+--- trunk.orig/libopkg/opkg_cmd.c
++++ trunk/libopkg/opkg_cmd.c
+@@ -19,6 +19,7 @@
+ #include "includes.h"
+ #include <dirent.h>
+ #include <glob.h>
++#include <unistd.h>
+ 
+ #include "opkg_conf.h"
+ #include "opkg_cmd.h"
+@@ -350,7 +351,6 @@ static opkg_intercept_t opkg_prep_interc
+ 
+ static int opkg_finalize_intercepts(opkg_intercept_t ctx)
+ {
+-    char *cmd;
+     DIR *dir;
+     int err = 0;
+ 
+@@ -376,6 +376,10 @@ static int opkg_finalize_intercepts(opkg
+ 		    err = errno;
+ 		    perror (de->d_name);
+ 		}
++		if (unlink (path)) {
++		    err = errno;
++		    perror (path);
++		}
+ 	    }
+ 	    free (path);
+ 	}
+@@ -383,9 +387,10 @@ static int opkg_finalize_intercepts(opkg
+     } else
+ 	perror (ctx->statedir);
+ 	
+-    sprintf_alloc (&cmd, "rm -rf %s", ctx->statedir);
+-    err = system (cmd);
+-    free (cmd);
++    if (rmdir (ctx->statedir)) {
++	err = errno;
++	perror (ctx->statedir);
++    }
+ 
+     free (ctx->statedir);
+     free (ctx);
diff --git a/recipes/opkg/files/opkg-libdir.patch b/recipes/opkg/files/opkg-libdir.patch
deleted file mode 100644
index 1d48b9a..0000000
--- a/recipes/opkg/files/opkg-libdir.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- trunk/utils/update-alternatives.orig	2009-06-23 15:33:56.000000000 -0300
-+++ trunk/utils/update-alternatives	2009-06-23 15:34:10.000000000 -0300
-@@ -21,7 +21,7 @@
- set -e
- 
- # admin dir
--ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"
-+ad="$OPKG_OFFLINE_ROOT/${libdir}/opkg/alternatives"
- 
- usage() {
- 	echo "update-alternatives: $*
diff --git a/recipes/opkg/opkg-native_svn.bb b/recipes/opkg/opkg-native_svn.bb
index fe3ed4e..33d84ff 100644
--- a/recipes/opkg/opkg-native_svn.bb
+++ b/recipes/opkg/opkg-native_svn.bb
@@ -1,19 +1,10 @@
 require opkg.inc
 
-DEPENDS = "curl-native openssl-native"
 PR = "${INC_PR}"
 PROVIDES =+ "virtual/update-alternatives-native"
 
-SRC_URI += "file://opkg-libdir.patch;maxrev=342"
-
 target_libdir := "${libdir}"
 
 inherit native
 
-# The nogpg version isn't getting much love and has an unused variable which trips up -Werror
-do_configure_prepend() {
-        sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
-}
-
-
-EXTRA_OECONF += "--with-opkglibdir=${target_libdir} --disable-gpg"
+EXTRA_OECONF += "--with-opkglibdir=${target_libdir}"
diff --git a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb b/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
index 4d49dff..cda5115 100644
--- a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
+++ b/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
@@ -2,7 +2,7 @@
 # recipe, intended for temporary use by the SlugOS distro.
 
 # DO NOT USE this recipe for anything other than SlugOS and svn version 160
-# of the opkg sources.  Also note that This recipe will be removed without
+# of the opkg sources.  Also note that this recipe will be removed without
 # notice when the unfortunate commits to the original opkg-nogpg-nocurl_svn.bb
 # recipe are repaired, the small-memory patches updated to a newer opkg svn
 # version, and appropriate testing confirms that the resulting binary actually
@@ -10,12 +10,23 @@
 
 # DO NOT CHANGE THIS RECIPE!
 
-require opkg.inc
+DESCRIPTION = "Opkg Package Manager"
+DESCRIPTION_libopkg = "Opkg Package Manager Library"
+SECTION = "base"
+LICENSE = "GPLv2"
+SRCREV = "160"
+PV = "0.1.6+svnr${SRCPV}"
+PR = "r22"
 
-DEPENDS = ""
 PROVIDES += "opkg"
+S = "${WORKDIR}/trunk"
+
+inherit autotools pkgconfig
 
 SRC_URI += " \
+	    svn://opkg.googlecode.com/svn;module=trunk;proto=http \
+	    file://opkg_unarchive.patch;maxrev=201 \
+	    file://opkg-intercept-cleanup.patch;maxrev=241 \
 	    file://isatty.patch \
 	    file://opkg_wget.patch;maxrev=180 \
 	    file://reduce-nogpg-noise.patch;maxrev=180 \
@@ -23,11 +34,16 @@ SRC_URI += " \
 	    file://opkg_wget_nogpg_02_use_vfork_system.patch \
 	    file://opkg_wget_nogpg_03_fix_tmpdirs.patch \
 	    file://opkg_wget_nogpg_04_default_tmpdir.patch \
+	    file://configure \
 	   "
-PR = "${INC_PR}"
 
 EXTRA_OECONF += "--disable-gpg --enable-static --disable-shared"
 
+do_install_prepend() {
+  install -d ${D}${sysconfdir}/rcS.d
+  install -m 0755 ${WORKDIR}/configure ${D}${sysconfdir}/rcS.d/S98configure
+}
+
 # Not sure this is needed; needs to be investigated and removed if not
 do_stage() {
 	autotools_stage_all
@@ -44,11 +60,6 @@ FILES_libopkg-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
 # not happens automatically for opkg-nogpg:
 FILES_${PN} += "${datadir}/opkg/intercept"
 
-# Define a variable to allow distros to run configure earlier.
-# (for example, to enable loading of ethernet kernel modules before networking starts)
-OPKG_INIT_POSITION = "98"
-OPKG_INIT_POSITION_slugos = "41"
-
 pkg_postinst_${PN} () {
   update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
 }
diff --git a/recipes/opkg/opkg-nogpg-nocurl_svn.bb b/recipes/opkg/opkg-nogpg-nocurl_svn.bb
deleted file mode 100644
index 66e8dbc..0000000
--- a/recipes/opkg/opkg-nogpg-nocurl_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require opkg-nogpg_svn.bb
-
-DEPENDS = ""
-PROVIDES += "opkg"
-
-PR = "${INC_PR}"
-
-EXTRA_OECONF += " --disable-curl --enable-static --disable-shared"
-
-# The nogpg version isn't getting much love and has an unused variable which trips up -Werror
-do_configure_prepend() {
-	sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
-}
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/opkg/opkg-nogpg_svn.bb b/recipes/opkg/opkg-nogpg_svn.bb
deleted file mode 100644
index bee639f..0000000
--- a/recipes/opkg/opkg-nogpg_svn.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require opkg_svn.bb
-
-DEPENDS = "curl"
-PROVIDES += "opkg"
-
-PR = "${INC_PR}.1"
-
-EXTRA_OECONF += " --disable-gpg \ 
-                  --disable-openssl \ 
-                  --disable-ssl-curl \
-                  --enable-gpg=no \
-                  --enable-ssl-curl=no \
-                  --enable-openssl=no"
-
-LDFLAGS_append = " -Wl,--as-needed"
-
-# The nogpg version isn't getting much love and has an unused variable which trips up -Werror
-do_configure_prepend() {
-	sed -i -e s:-Werror::g ${S}/libopkg/Makefile.am
-}
-do_configure_prepend_nylon() {
-	LDFLAGS="`echo "$LDFLAGS" | sed "s/ -Wl,--as-needed//"`"
-}
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/opkg/opkg-sdk_svn.bb b/recipes/opkg/opkg-sdk_svn.bb
index f7f9c9e..5970f8e 100644
--- a/recipes/opkg/opkg-sdk_svn.bb
+++ b/recipes/opkg/opkg-sdk_svn.bb
@@ -5,4 +5,4 @@ PR = "${INC_PR}"
 target_libdir := "${libdir}"
 inherit sdk
 
-EXTRA_OECONF += "--with-opkglibdir=${target_libdir} --disable-gpg"
+EXTRA_OECONF += "--with-opkglibdir=${target_libdir}"
diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index 1149b72..b88ae4b 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -2,20 +2,14 @@ DESCRIPTION = "Opkg Package Manager"
 DESCRIPTION_libopkg = "Opkg Package Manager Library"
 SECTION = "base"
 LICENSE = "GPLv2"
-DEPENDS = "curl gpgme openssl"
 SRCREV = ${OPKG_SRCREV}
-PV = "0.1.6+svnr${SRCPV}"
-INC_PR = "r21"
-
-FILESPATHPKG =. "opkg:"
+PV = "0.1.8+svnr${SRCPV}"
+INC_PR = "r0"
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
-	file://opkg_unarchive.patch;maxrev=201 \
-	file://opkg-intercept-cleanup.patch;maxrev=241 \
+	   file://configure \
 "
 
-SRC_URI += "file://configure"
-
 S = "${WORKDIR}/trunk"
 
 inherit autotools pkgconfig
@@ -25,3 +19,7 @@ do_install_prepend() {
   install -m 0755 ${WORKDIR}/configure ${D}${sysconfdir}/rcS.d/S98configure
 }
 
+EXTRA_OECONF += " --disable-gpg \ 
+                  --disable-openssl \ 
+                  --disable-ssl-curl \
+                  --disable-curl"
diff --git a/recipes/opkg/opkg/isatty.patch b/recipes/opkg/opkg/isatty.patch
deleted file mode 100644
index c935f15..0000000
--- a/recipes/opkg/opkg/isatty.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Copyright (c) 2009 MontaVista Software, Inc.  All rights reserved.
-
-Don't prompt for user input from stdin if it's not a tty.  Fixes a minor
-memory leak while we're at it, as the code was strdup'ing the malloc'd string
-read from stdin without ever freeing the original.
----
- libopkg/libopkg.c      |   13 ++++++++-----
- libopkg/opkg_install.c |    3 +++
- libopkg/user.c         |   10 +++++++---
- 3 files changed, 18 insertions(+), 8 deletions(-)
-
---- trunk.orig/libopkg/libopkg.c
-+++ trunk/libopkg/libopkg.c
-@@ -71,11 +71,14 @@ int default_opkg_status_callback(char *n
- char* default_opkg_response_callback(char *question)
- {
-      char *response = NULL;
--     printf("%s",question);
--     fflush(stdout);
--     do {
--	  response = (char *)file_read_line_alloc(stdin);
--     } while (response == NULL);
-+     if (isatty(fileno(stdin)))
-+     {
-+	  printf("%s",question);
-+	  fflush(stdout);
-+	  do {
-+	       response = (char *)file_read_line_alloc(stdin);
-+	  } while (response == NULL);
-+     }
-      return response;
- }
- 
---- trunk.orig/libopkg/user.c
-+++ trunk/libopkg/user.c
-@@ -44,9 +44,13 @@ char *get_user_response(const char *form
- 	  len = vsnprintf(question,question_len,format,ap);
-           va_end(ap);
-      } while (len > question_len);
--     response = strdup(opkg_cb_response(question));
--     str_chomp(response);
--     str_tolower(response);
-+
-+     response = opkg_cb_response(question);
-+     if (response)
-+     {
-+         str_chomp(response);
-+         str_tolower(response);
-+     }
- 
-      return response;
- }
---- trunk.orig/libopkg/opkg_install.c
-+++ trunk/libopkg/opkg_install.c
-@@ -1613,6 +1613,9 @@ static int user_prefers_old_conffile(con
- 				       "          D     : show the differences between the versions (if diff is installed)\n"
- 				       "     The default action is to keep your current version.\n"
- 				       "    *** %s (Y/I/N/O/D) [default=N] ? ", file_name, short_file_name);
-+	  if (!response)
-+	       return 1;
-+
- 	  if (strcmp(response, "y") == 0
- 	      || strcmp(response, "i") == 0
- 	      || strcmp(response, "yes") == 0) {
diff --git a/recipes/opkg/opkg/opkg-intercept-cleanup.patch b/recipes/opkg/opkg/opkg-intercept-cleanup.patch
deleted file mode 100644
index 12893e3..0000000
--- a/recipes/opkg/opkg/opkg-intercept-cleanup.patch
+++ /dev/null
@@ -1,47 +0,0 @@
----
- libopkg/opkg_cmd.c |   13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
---- trunk.orig/libopkg/opkg_cmd.c
-+++ trunk/libopkg/opkg_cmd.c
-@@ -19,6 +19,7 @@
- #include "includes.h"
- #include <dirent.h>
- #include <glob.h>
-+#include <unistd.h>
- 
- #include "opkg_conf.h"
- #include "opkg_cmd.h"
-@@ -350,7 +351,6 @@ static opkg_intercept_t opkg_prep_interc
- 
- static int opkg_finalize_intercepts(opkg_intercept_t ctx)
- {
--    char *cmd;
-     DIR *dir;
-     int err = 0;
- 
-@@ -376,6 +376,10 @@ static int opkg_finalize_intercepts(opkg
- 		    err = errno;
- 		    perror (de->d_name);
- 		}
-+		if (unlink (path)) {
-+		    err = errno;
-+		    perror (path);
-+		}
- 	    }
- 	    free (path);
- 	}
-@@ -383,9 +387,10 @@ static int opkg_finalize_intercepts(opkg
-     } else
- 	perror (ctx->statedir);
- 	
--    sprintf_alloc (&cmd, "rm -rf %s", ctx->statedir);
--    err = system (cmd);
--    free (cmd);
-+    if (rmdir (ctx->statedir)) {
-+	err = errno;
-+	perror (ctx->statedir);
-+    }
- 
-     free (ctx->statedir);
-     free (ctx);
diff --git a/recipes/opkg/opkg_svn.bb b/recipes/opkg/opkg_svn.bb
index 5138458..b193d7c 100644
--- a/recipes/opkg/opkg_svn.bb
+++ b/recipes/opkg/opkg_svn.bb
@@ -8,14 +8,8 @@ PACKAGES =+ "libopkg-dev libopkg"
 
 FILES_libopkg-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
 FILES_libopkg = "${libdir}/*.so.*"
-# not happens automatically for opkg-nogpg:
 FILES_${PN} += "${datadir}/opkg/intercept"
 
-# Define a variable to allow distros to run configure earlier.
-# (for example, to enable loading of ethernet kernel modules before networking starts)
-OPKG_INIT_POSITION = "98"
-OPKG_INIT_POSITION_slugos = "41"
-
 pkg_postinst_${PN} () {
   update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
 }
diff --git a/recipes/tasks/task-arago-toolchain-target.bb b/recipes/tasks/task-arago-toolchain-target.bb
index e22ac2b..8f85a89 100644
--- a/recipes/tasks/task-arago-toolchain-target.bb
+++ b/recipes/tasks/task-arago-toolchain-target.bb
@@ -30,6 +30,6 @@ RDEPENDS_${PN} = "\
     zlib-dev \
     mtd-utils-dev \
     ncurses-dev \
-    opkg-nogpg-dev \
+    opkg-dev \
     sysvinit-dev \
     "
diff --git a/recipes/tasks/task-sdk-sbox.bb b/recipes/tasks/task-sdk-sbox.bb
index bf75402..25829cc 100644
--- a/recipes/tasks/task-sdk-sbox.bb
+++ b/recipes/tasks/task-sdk-sbox.bb
@@ -8,6 +8,6 @@ RDEPENDS_${PN} = "\
     gdb \
     sbrsh \
     fakeroot \
-    opkg-nogpg \
+    opkg \
     opkg-utils \
     "
-- 
1.7.1



