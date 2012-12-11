Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TiNdM-00018o-QF
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 12:04:21 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1466142eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 02:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=a2v2nAsPPsmxl0+DEJFswcWBu0t2azcHUvhXmByV8Uk=;
	b=gfa3FGX+H0YISpiXeMdIlMqeakz2Aw3Iw8vC5tZp2od79dd3WmrwaygG48nVPeKww0
	fjG4b5FPHl8j5lDy3fh3fkO12/4LMQQ/QBhOdgl/KCXyI6TofRK2y+rNEG3PMK+0cXyl
	d+YSPSaPufkLKBn70uz2BwVIpiV5kjO0wJSQWtYD70/osKq1Y8rixmD5iavaf8091m4i
	3hefTtgMmdhy5G/iLnauZek5ebM6DyQy92OilUlgLiDv2JfyOlB+ADjlzgmWJwpScXL3
	Zm/3uE73DpdneSJpJbAdFebSA8G4VjcyUsfoo+YHfNzUJLsE9JqFxNeDrTGPE0Ugfq4i
	5eZA==
Received: by 10.14.225.72 with SMTP id y48mr59125325eep.46.1355222986606;
	Tue, 11 Dec 2012 02:49:46 -0800 (PST)
Received: from s-stirtzel-linux.zera.local
	(ip-178-200-247-119.unitymediagroup.de. [178.200.247.119])
	by mx.google.com with ESMTPS id f6sm27322631eeo.7.2012.12.11.02.49.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 02:49:45 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 11:49:36 +0100
Message-Id: <1355222976-14461-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-xfce] xfce4-session: Add depends to iceauth-native
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
X-List-Received-Date: Tue, 11 Dec 2012 11:04:22 -0000

xfce4-session depends on iceauth for do_configure

This fixes:
checking for iceauth... /usr/bin/iceauth

And it fixes for X-less systems:
checking for iceauth... no
configure: error: iceauth missing, please check your X11 installation

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 .../xfce4-session/xfce4-session_4.10.0.bb          |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
index 4df9894..136e928 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
@@ -2,9 +2,11 @@ DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf gnome-keyring"
+DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf gnome-keyring iceauth-native"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit upower"
 
+PR = "r1"
+
 inherit xfce
 
 SRC_URI[md5sum] = "4768e1a41a0287af6aad18b329a0f230"
-- 
1.7.9.5



