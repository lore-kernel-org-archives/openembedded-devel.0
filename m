Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Long8-0005Ei-K7
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 01:47:36 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Apr 2009 01:45:19 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Wed, 1 Apr 2009 01:45:19 +0200
Received: from localhost.localdomain ([87.5.74.246]) by FBCMCL01B03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Apr 2009 01:45:18 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed,  1 Apr 2009 01:45:17 +0200
Message-Id: <05187d8f9a873df8504511279c44af7c02b4facf.1238542568.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <gqqq0q$or5$1@ger.gmane.org>
References: <gqqq0q$or5$1@ger.gmane.org>
X-OriginalArrivalTime: 31 Mar 2009 23:45:18.0951 (UTC)
	FILETIME=[BFAF5770:01C9B25A]
Subject: [PATCH] angstrom-2008.1.conf: add PREFERRED_VERSION_psplash
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
X-List-Received-Date: Tue, 31 Mar 2009 23:47:36 -0000


 -second try
---
 conf/distro/angstrom-2008.1.conf |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
index 57048d6..6c2c1bd 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -76,6 +76,15 @@ PREFERRED_VERSION_glibc-initial 	?= "2.6.1"
 PREFERRED_VERSION_uclibc        	?= "0.9.30"
 PREFERRED_VERSION_uclibc-initial	?= "0.9.30"
 
+# Preferred version for psplash
+# This enforces a specific brand to be used, in our case the angstrom
+# one. In case you want to change the logo or something like that we
+# suggest you to create another recipe (e.g: psplash-<brand>) for that
+# and add that into your image.
+# You can also opt to change or override this line, but that isn't
+# needed because psplash is using update-alternatives.
+PREFERRED_VERSION_psplash               ?= "psplash-angstrom"
+
 PREFERRED_PROVIDER_avahi = "avahi"
 
 #Small machines prefer kdrive, but we might ship full Xorg in other images
@@ -144,7 +153,7 @@ PREFERRED_PROVIDER_virtual/xserver      ?= "xserver-kdrive"
 # Others:
 PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
-PREFERRED_PROVIDER_esound 		?= "pulseaudio"
+PREFERRED_PROVIDER_esound               ?= "pulseaudio"
 PREFERRED_PROVIDER_gconf                ?= "gconf-dbus"
 PREFERRED_PROVIDER_gnome-vfs            ?= "gnome-vfs"
 PREFERRED_PROVIDER_gnome-vfs-plugin-file ?= "gnome-vfs"
-- 
1.6.0.6



