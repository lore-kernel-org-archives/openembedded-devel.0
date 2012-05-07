Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SRHym-0000sb-My
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 09:03:32 +0200
Received: by wgbdr1 with SMTP id dr1so3873992wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 May 2012 23:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=YQnDXgzkLNyWSQPTrUvpNeBLljt+3duFfFRJbjYVVv4=;
	b=OOtkJHepGIM0LP3n+vwCa0+pwQAeeo1ShMn/PV0hfH8pbASM0DS1wJ3rwP+it0pQvX
	Lu+BN+4bLj5CFKzAXwatv5/HVYsY81Mv6gmGijHQX2REYA3pFWX2S4R115TIMj3chGOa
	Xk9yPcm0IHtuX2O+rjxYyNMuJEkOgaOEqRU7aYdw01XPwJNp78OAudvROL7dK1CvxqRO
	zhjRQeBVxr5kKM0v56kG9lFjabFqHuyPCCnnIhYnepoDWFMslnA0VfsAeyyddIDWb+QE
	tBbMru0jf/+baTihffcre4WoqAFLo7C4UlG3sSdHaNzQjrStjStNqdR7opGZ+nr2wwEx
	Ev9w==
Received: by 10.180.24.66 with SMTP id s2mr22772880wif.7.1336373622667;
	Sun, 06 May 2012 23:53:42 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm31035977wiw.5.2012.05.06.23.53.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 May 2012 23:53:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 08:53:30 +0200
Message-Id: <1336373612-18607-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQln3GhOHc1vJ8a8Y4LmG6XrbRqMOx7Sol+fcn9ATL9U0RYtUMab22E+nEL9zgILu3eCCzwo
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/3] gnome-session: add dependency on libxtst6
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
X-List-Received-Date: Mon, 07 May 2012 07:03:32 -0000

It's autodetected and leads to sstate based breakage on autobuilders:

This ends up in the package:

Package: gnome-session
Version: 2.32.1-r1
Depends: libx11-6 (>= 1.4.4), hicolor-icon-theme, libxrender1 (>= 0.9.7), libdbus-1-3 (>= 1.4.16), libdbus-glib-1-2 (>= 0.98), gconf, libxtst6 (>= 1.2.1),

But libxtst hasn't been built.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index fe199a8..6c10156 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Gnome session manager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r1"
+PR = "r2"
 
 SECTION = "x11/gnome"
-DEPENDS = "gtk+ glib-2.0 upower dbus-glib gconf pango gdk-pixbuf-native startup-notification"
+DEPENDS = "libxtst gtk+ glib-2.0 upower dbus-glib gconf pango gdk-pixbuf-native startup-notification"
 
 inherit gnome 
 
-- 
1.7.10



