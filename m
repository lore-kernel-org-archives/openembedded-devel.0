Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QfLVs-0003aV-Ga
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 02:35:16 +0200
Received: by ywa12 with SMTP id 12so1039624ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2011 17:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=8eO2SKtstKZJq2IlqibHgyHvNdLsD+FDOdJhF6oHcpI=;
	b=eAb5JGQbL3q6/GIPb6tG0nBcoQZDG68Ri5GWwDAmuVvk7Qmj0IJsDcXjlrwbqElIP4
	RuQcjZLsp6v+81WKpAfIC8Gt/WMpP+AZ+JCvMv80BHAyWvvYn/4L6R0Hdtw4v0ONdyyv
	ZXxPJ3wsItzG1+cKIILuK7KCAurtQzY45ncck=
Received: by 10.236.113.164 with SMTP id a24mr521959yhh.130.1310171099371;
	Fri, 08 Jul 2011 17:24:59 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id j65sm5100784yhm.54.2011.07.08.17.24.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jul 2011 17:24:58 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jul 2011 19:21:49 -0500
Message-Id: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, Colin Guthrie <gmane@colin.guthr.ie>,
	beagleboard@googlegroups.com, smcnam@gmail.com,
	Paul Menzel <paulepanter@users.sourceforge.net>,
	Joel A Fernandes <agnel.joel@gmail.com>, k-kooi@ti.com, jdk@ti.com
Subject: [PATCH] pulseaudio: Switch to version version 0.9.22 for Angstrom 2011.03
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
X-List-Received-Date: Sat, 09 Jul 2011 00:35:16 -0000

This fixes all the issues noticed earlier with pulseaudio 0.9.15:
 * Pulseaudio keeping audio devices busy when run as per-user instance
 * Failure of pactl, pacmd etc to connect to the pulseaudio server

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Notes:
* This has to go into the OpenEmbedded 2011.03-maintenance branch as there is no such configration file in the master branch
* Please ignore the earlier patch "pulseaudio: Run as system-wide instance instead of per-user"

Applying this and the patch titled "beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND" will mark the
"Alpha" build of the C5 image. Can this be tagged?

Things to go into "Beta":
* User button fixes (kernel and flashing scripts)
* U-boot fixes for EHCI timeouts when doing a tftpboot

 conf/distro/angstrom-2008.1.conf                   |    3 +++
 .../include/angstrom-2008-preferred-versions.inc   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index ae1ed4c..7b4f25a 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -121,6 +121,9 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
 
+ANGSTROM_PULSEAUDIO_VERSION		= "0.9.15"
+ANGSTROM_PULSEAUDIO_VERSION_armv7a	= "0.9.22"
+
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
 PREFERRED_PROVIDER_opkg                 ?= "opkg"
diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
index b5b524a..e4b8bf1 100644
--- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
@@ -44,7 +44,7 @@ PREFERRED_VERSION_pango-native     = "1.24.4"
 #PREFERRED_VERSION_pixman	= "0.13.2"
 PREFERRED_VERSION_pkgconfig	= "0.23"
 PREFERRED_VERSION_pkgconfig-native = "0.23"
-PREFERRED_VERSION_pulseaudio 	= "0.9.15"
+PREFERRED_VERSION_pulseaudio 	= "${ANGSTROM_PULSEAUDIO_VERSION}"
 PREFERRED_VERSION_python-pycairo = "1.8.0"
 PREFERRED_VERSION_qt4-tools-native = "${ANGSTROM_QT_VERSION}"
 PREFERRED_VERSION_qt4-tools-sdk = "${ANGSTROM_QT_VERSION}"
-- 
1.7.0.4



