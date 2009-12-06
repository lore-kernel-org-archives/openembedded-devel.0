Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NHOSV-0001pI-SQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 22:16:03 +0100
Received: by mail-bw0-f217.google.com with SMTP id 9so3028821bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 13:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=N9L+l/ljlN5R8zQ7N68fNP9FFnSqOd13M+93kOIitDo=;
	b=v/xwZtIHCXM981f1SOUYfdQoSKbnAyHVeCVP9DuvgzpU5VB9AiFA+Jsxb9XLECnvZz
	aazESdkLbOrX2pvqC4S3vJXzG7Cq7j0aYEdcfYE2NThk6KhZA6aCl2i1DI8DOe72ywh8
	Yaj3ceYgmf0T0R+3KSIs+QkXqdnLm0j3vBPdg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=h6mqphTZvzA2NRgCtAEbjOo2Vn7mnfPC307odSS0+gu0Dizhihal5Q8V9UHjXzZvz9
	BP4rCrZi08SbGzwfLA8TLPGnD40gZCLY6wVA8MLBLtjmBe3wUIMs27SEeJmFHb0GXrwG
	PeHllwS7YR98Sa/XZC9UAxHyL6yml9F7bHPj0=
Received: by 10.204.143.153 with SMTP id v25mr6188818bku.116.1260134063274;
	Sun, 06 Dec 2009 13:14:23 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm1745374fxm.2.2009.12.06.13.14.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 13:14:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 22:13:50 +0100
Message-Id: <1260134030-3658-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.4
In-Reply-To: <1260134030-3658-6-git-send-email-Martin.Jansa@gmail.com>
References: <20091204090048.GA3233@jama>
	<1260134030-3658-1-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-2-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-3-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-4-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-5-git-send-email-Martin.Jansa@gmail.com>
	<1260134030-3658-6-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 6/6] opkg: add provides for update-alternatives and set opkg as default u-a provider in sane-feed-ipk
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
X-List-Received-Date: Sun, 06 Dec 2009 21:16:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/angstrom-2008.1.conf             |    5 ++++-
 conf/distro/include/angstrom-package-deb.inc |    4 ++--
 conf/distro/include/angstrom-package-ipk.inc |    5 ++---
 conf/distro/include/sane-feed-deb.inc        |    4 ++--
 conf/distro/include/sane-feed-ipk.inc        |    5 ++---
 conf/distro/shr.conf                         |    4 +---
 recipes/opkg/opkg-native_svn.bb              |    1 +
 recipes/opkg/opkg.inc                        |    2 +-
 recipes/opkg/opkg_svn.bb                     |    2 ++
 recipes/tasks/task-boot.bb                   |    2 +-
 10 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index c15dbbd..26614ad 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -127,7 +127,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
-PREFERRED_PROVIDER_opkg                 ?= "opkg-nogpg"
+PREFERRED_PROVIDER_opkg                 ?= "opkg-nogpg-nocurl"
 
 # The default is too old for linux-libc-headers-2.6.31:
 PREFERRED_VERSION_mplayer                = "0.0+1.0rc2+svnr29789"
@@ -145,6 +145,9 @@ require conf/distro/include/angstrom${ARM_ABI}.inc
 # We also take this opportunity to inject angstrom-version and the feed configs into the rootfs
 IPKG_VARIANT = "opkg-nogpg-nocurl angstrom-version ${ANGSTROM_FEED_CONFIGS}"
 
+# we need the same provider for opkg and u-a
+PREFERRED_PROVIDER_virtual/update-alternatives = "opkg-nogpg-nocurl"
+
 # Select xserver-xorg as default, since kdrive has been EOL'ed
 XSERVER ?= "xserver-xorg xf86-input-evdev xf86-input-keyboard xf86-input-mouse xf86-video-fbdev" 
 
diff --git a/conf/distro/include/angstrom-package-deb.inc b/conf/distro/include/angstrom-package-deb.inc
index 3dbb175..e060bb1 100644
--- a/conf/distro/include/angstrom-package-deb.inc
+++ b/conf/distro/include/angstrom-package-deb.inc
@@ -1,4 +1,4 @@
 INHERIT += "package_deb"
 
-PREFERRED_PROVIDER_virtual/update-alternatives-native = "update-alternatives-cworth-native"
-PREFERRED_PROVIDER_virtual/update-alternatives = "update-alternatives-cworth"
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "update-alternatives-cworth-native"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
diff --git a/conf/distro/include/angstrom-package-ipk.inc b/conf/distro/include/angstrom-package-ipk.inc
index a33a4ad..14206bd 100644
--- a/conf/distro/include/angstrom-package-ipk.inc
+++ b/conf/distro/include/angstrom-package-ipk.inc
@@ -1,5 +1,4 @@
 INHERIT += "package_ipk"
 
-PREFERRED_PROVIDER_virtual/update-alternatives-native = "update-alternatives-cworth-native"
-PREFERRED_PROVIDER_virtual/update-alternatives = "update-alternatives-cworth"
-
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= ${PREFERRED_PROVIDER_opkg}
diff --git a/conf/distro/include/sane-feed-deb.inc b/conf/distro/include/sane-feed-deb.inc
index 4f38b8f..d953d6e 100644
--- a/conf/distro/include/sane-feed-deb.inc
+++ b/conf/distro/include/sane-feed-deb.inc
@@ -2,5 +2,5 @@
 
 INHERIT += "package_deb"
 
-PREFERRED_PROVIDER_virtual/update-alternatives-native = "update-alternatives-cworth-native"
-PREFERRED_PROVIDER_virtual/update-alternatives = "update-alternatives-cworth"
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "update-alternatives-cworth-native"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
diff --git a/conf/distro/include/sane-feed-ipk.inc b/conf/distro/include/sane-feed-ipk.inc
index a33a4ad..14206bd 100644
--- a/conf/distro/include/sane-feed-ipk.inc
+++ b/conf/distro/include/sane-feed-ipk.inc
@@ -1,5 +1,4 @@
 INHERIT += "package_ipk"
 
-PREFERRED_PROVIDER_virtual/update-alternatives-native = "update-alternatives-cworth-native"
-PREFERRED_PROVIDER_virtual/update-alternatives = "update-alternatives-cworth"
-
+PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
+PREFERRED_PROVIDER_virtual/update-alternatives ?= ${PREFERRED_PROVIDER_opkg}
diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
index 2c1e751..cb63933 100644
--- a/conf/distro/shr.conf
+++ b/conf/distro/shr.conf
@@ -158,10 +158,8 @@ require conf/distro/include/sane-toolchain.inc
 #############################################################################
 PREFERRED_PROVIDER_gpsd = "fso-gpsd"
 PREFERRED_PROVIDER_atd = "atd-over-fso"
-PREFERRED_PROVIDER_opkg= "opkg"
+PREFERRED_PROVIDER_opkg = "opkg"
 PREFERRED_PROVIDER_virtual/libusb0 ?= "libusb"
-PREFERRED_PROVIDER_virtual/update-alternatives-native = "opkg-native"
-PREFERRED_PROVIDER_virtual/update-alternatives = "opkg"
 
 #############################################################################
 # PREFERRED VERSIONS
diff --git a/recipes/opkg/opkg-native_svn.bb b/recipes/opkg/opkg-native_svn.bb
index 1de472e..e5fdfd0 100644
--- a/recipes/opkg/opkg-native_svn.bb
+++ b/recipes/opkg/opkg-native_svn.bb
@@ -2,6 +2,7 @@ require opkg.inc
 
 DEPENDS = "curl-native"
 PR = "${INC_PR}"
+PROVIDES =+ "virtual/update-alternatives-native"
 
 SRC_URI += "file://opkg-libdir.patch;patch=1;maxrev=342"
 
diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
index c973174..1716034 100644
--- a/recipes/opkg/opkg.inc
+++ b/recipes/opkg/opkg.inc
@@ -4,7 +4,7 @@ SECTION = "base"
 LICENSE = "GPL"
 DEPENDS = "curl gpgme"
 PV = "0.1.6+svnr${SRCPV}"
-INC_PR = "r16"
+INC_PR = "r18"
 
 FILESPATHPKG =. "opkg:"
 
diff --git a/recipes/opkg/opkg_svn.bb b/recipes/opkg/opkg_svn.bb
index 57b2774..44c0baf 100644
--- a/recipes/opkg/opkg_svn.bb
+++ b/recipes/opkg/opkg_svn.bb
@@ -4,6 +4,8 @@ DEPENDS_append = " openssl"
 
 PR = "${INC_PR}"
 
+PROVIDES =+ "virtual/update-alternatives"
+RPROVIDES_${PN} = "update-alternatives"
 PACKAGES =+ "libopkg-dev libopkg"
 
 FILES_libopkg-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
diff --git a/recipes/tasks/task-boot.bb b/recipes/tasks/task-boot.bb
index 0ce9ee4..04c5535 100644
--- a/recipes/tasks/task-boot.bb
+++ b/recipes/tasks/task-boot.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Basic task to get a device booting"
-PR = "r50"
+PR = "r51"
 
 inherit task
 
-- 
1.6.5.4



