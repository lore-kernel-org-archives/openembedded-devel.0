Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rw0gU-0006Y1-T4
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Feb 2012 01:19:22 +0100
Received: by eaal10 with SMTP id l10so891470eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Feb 2012 16:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=gpnlGPtAzRgxFC6+yJy+HkA3zUJlKJhL1BmjaXYdEtk=;
	b=JIxuhOnGES2lVLyf4T09XFI6nuPyfaGd3yXa1Oh0j8Z2u/4wVf/DS6KupXozIzLg43
	YY/OIrePiGpqvf3TRsBQHMfKtV/pmbXPYzXAvqZMx3EKB3ZVJJS6L1lAtGPWAMXdhUMj
	KK7ki3DhRRMQ/JErMG2GiOF3qUefkPl1uinW8=
Received: by 10.213.9.74 with SMTP id k10mr647193ebk.52.1328919076351;
	Fri, 10 Feb 2012 16:11:16 -0800 (PST)
Received: from localhost.localdomain (p5B0A16A6.dip.t-dialin.net.
	[91.10.22.166])
	by mx.google.com with ESMTPS id z47sm28132227eeh.9.2012.02.10.16.11.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 16:11:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Feb 2012 01:14:05 +0100
Message-Id: <1328919245-27394-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-xfce] xfce4-session: move static libraries to ${PN}-staticdev to avoid QA warnings
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
X-List-Received-Date: Sat, 11 Feb 2012 00:19:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-session/xfce4-session_4.8.2.bb           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
index 6c23c68..86a2363 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf xfce4-panel gconf gnome-keyring"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth"
 
-PR = "r1"
+PR = "r2"
 
 inherit xfce
 
@@ -21,7 +21,7 @@ FILES_${PN} += "${libdir}/xfce4/*/*/*.so \
 
 FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
 
-FILES_${PN}-dev += "${libdir}/xfce4/*/*/*.*a"
+FILES_${PN}-staticdev += "${libdir}/xfce4/*/*/*.*a"
 
 SRC_URI[md5sum] = "48780cbcf784ab64debc9312f17765f2"
 SRC_URI[sha256sum] = "31bca2a559e05a8a859f150394a901517e5842414ef171a85c5da234e344c0d0"
-- 
1.7.4.4



