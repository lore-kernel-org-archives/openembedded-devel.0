Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Rl5GS-0003KJ-C0
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jan 2012 21:59:21 +0100
Received: from [192.168.2.78] (helo=localhost.localdomain)
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1Rl5gC-0006hW-P1; Wed, 11 Jan 2012 22:25:56 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jan 2012 21:51:03 +0100
Message-Id: <1326315063-5488-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] upower: Depend on gobject-introspection-native
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
X-List-Received-Date: Wed, 11 Jan 2012 20:59:21 -0000

Without the dependecy we get the following error:
libupower-glib/Makefile.am:62: HAVE_INTROSPECTION does not appear in AM_CONDITIONAL

Tested with Jlime distribution, netbookpro

Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
---
 meta-oe/recipes-support/upower/upower_0.9.14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/upower/upower_0.9.14.bb b/meta-oe/recipes-support/upower/upower_0.9.14.bb
index 622d7ac..b95bd74 100644
--- a/meta-oe/recipes-support/upower/upower_0.9.14.bb
+++ b/meta-oe/recipes-support/upower/upower_0.9.14.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "UPower is an abstraction for enumerating power devices, listening
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
-DEPENDS = "libusb1 udev glib-2.0 dbus-glib polkit"
+DEPENDS = "libusb1 udev glib-2.0 dbus-glib polkit gobject-introspection-native" 
 
 SRC_URI = "http://upower.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "18803f82102d56aac90949d1e4251645"
-- 
1.7.2.5



