Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SRHyq-0000sv-QH
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 09:03:37 +0200
Received: by wibhj13 with SMTP id hj13so2790406wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 May 2012 23:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=QtXUZlvqx3FrZKmJGwk++8nAZqSBASAz9PQ7Z2tErPQ=;
	b=UXzO0CCBlYtLkTPZv225NRZjBb8XI69mAa+5vGhxVi9ldNjUdqoZmaVj3lLv6UEWqf
	LEADuQTwr7oxqfEI2fpCfHWeRSCnaIFrc++XOo62afMbFnl6UPrGpSBa7Nzqb7RrhU12
	n4uI/1eIKJYfUtQ35tfP3526oeUikh5r8ou5P9j3YTXbWlXTpsIUNh2o8eJxWOydyOCW
	hOaHR7Xcqxo/Crg/OMkQorklOwy+TwD77pIPcaELdIcZZGLWiIsDG8Td93dHut3XabS1
	xCrJnyNn4rq+ixJ3ko0S9flFdoIockMQFvJs0dDJ7M+iBXHoJQGCfm5I3M7GcPav3Ue2
	rcjA==
Received: by 10.180.78.105 with SMTP id a9mr2397449wix.20.1336373626318;
	Sun, 06 May 2012 23:53:46 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id r2sm13045425wif.7.2012.05.06.23.53.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 May 2012 23:53:45 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 08:53:32 +0200
Message-Id: <1336373612-18607-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336373612-18607-1-git-send-email-koen@dominion.thruhere.net>
References: <1336373612-18607-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnK+Xm35KlQPdC3x8LGM8M0Lnfja2x2DJi3VWpqQOIy9swM5gPKG8Rmmk2y4RF6gjs9zrJG
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 3/3] gnome-settings-daemon: add dependency on libsndfile
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
X-List-Received-Date: Mon, 07 May 2012 07:03:37 -0000

It's autodetected and leads to sstate based breakage on autobuilders:

This ends up in the package:

Package: gnome-settings-daemon
Version: 2.32.1-r3
Depends: [..] libdbus-1-3 (>= 1.4.16), libx11-6 (>= 1.4.4), libogg0 (>= 1.3.0), libsndfile1 (>= 1.0.25),

But libsndfile hasn't been built.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb          |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index fc678b9..20bb65d 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "GNOME settings daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "r4"
+PR = "r5"
 
-DEPENDS = "libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
+DEPENDS = "libsndfile libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
 
 inherit gtk-doc gnome
 
-- 
1.7.10



