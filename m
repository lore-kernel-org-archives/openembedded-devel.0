Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1Ltetr-0003I6-49
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 11:26:22 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 3AC8A18935C; Tue, 14 Apr 2009 11:25:30 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Apr 2009 11:25:17 +0200
Message-Id: <1239701117-7033-5-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1239701117-7033-4-git-send-email-k.kooi@student.utwente.nl>
References: <1239701117-7033-1-git-send-email-k.kooi@student.utwente.nl>
	<1239701117-7033-2-git-send-email-k.kooi@student.utwente.nl>
	<1239701117-7033-3-git-send-email-k.kooi@student.utwente.nl>
	<1239701117-7033-4-git-send-email-k.kooi@student.utwente.nl>
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_05,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][STABLE][PATCH 4/4] angstrom 2009.X config file: sync with .dev
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
X-List-Received-Date: Tue, 14 Apr 2009 09:26:30 -0000

From: Koen Kooi <koen@openembedded.org>

---
 conf/distro/angstrom-2008.1.conf |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 57048d6..37cb8f0 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -76,6 +76,15 @@ PREFERRED_VERSION_glibc-initial 	?= "2.6.1"
 PREFERRED_VERSION_uclibc        	?= "0.9.30"
 PREFERRED_VERSION_uclibc-initial	?= "0.9.30"
 
+# Preferred provider for virtual/psplash
+# This enforces a specific brand to be used, in our case the angstrom
+# one. In case you want to change the logo or something like that we
+# suggest you to create another recipe (e.g: psplash-<brand>) for that
+# and add that into your image.
+# You can also opt to change or override this line, but that isn't
+# needed because psplash is using update-alternatives.
+PREFERRED_PROVIDER_virtual/psplash               ?= "psplash-angstrom"
+
 PREFERRED_PROVIDER_avahi = "avahi"
 
 #Small machines prefer kdrive, but we might ship full Xorg in other images
@@ -138,13 +147,12 @@ PREFERRED_PROVIDER_virtual/db           ?= "db"
 PREFERRED_PROVIDER_virtual/db-native    ?= "db-native"
 PREFERRED_PROVIDER_virtual/libsdl       ?= "libsdl-x11"
 PREFERRED_PROVIDER_virtual/libx11       ?= "libx11"
-PREFERRED_PROVIDER_virtual/libxine      ?= "libxine-x11"
 PREFERRED_PROVIDER_virtual/xserver      ?= "xserver-kdrive"
 
 # Others:
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
-PREFERRED_PROVIDER_esound 		?= "pulseaudio"
+PREFERRED_PROVIDER_esound               ?= "pulseaudio"
 PREFERRED_PROVIDER_gconf                ?= "gconf-dbus"
 PREFERRED_PROVIDER_gnome-vfs            ?= "gnome-vfs"
 PREFERRED_PROVIDER_gnome-vfs-plugin-file ?= "gnome-vfs"
@@ -155,6 +163,7 @@ PREFERRED_PROVIDER_ntp                  ?= "ntp"
 PREFERRED_PROVIDER_hotplug               = "udev"
 PREFERRED_PROVIDER_libxss                = "libxss"
 PREFERRED_PROVIDER_bluez-utils-dbus      = "bluez-utils"
+PREFERRED_PROVIDER_bluez-libs            = "bluez4"
 
 # we don't ship gtk-directfb by default
 PREFERRED_PROVIDER_gtk+                   ?= "gtk+"
-- 
1.6.1



