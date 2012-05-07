Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SRHyo-0000sc-C6
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 09:03:34 +0200
Received: by werb13 with SMTP id b13so533211wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 May 2012 23:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=cjMA3zCx4fXega4wqLC9DUv9VO0cDaHYJY78V4Wh67Y=;
	b=a83amsFBvkv7LWhLmwJSVNKwbvkghCOI/e9hO1pfMpvtsJ4CzEIlnsIZ3ZINef94nW
	tCXRf5Si5u4hVvUbLyLKrHM6WDyD9aVtgNnwcgFh/IXWnCJXkJyoHp52ULFgYEYXO9Gl
	5SrJ3OpxcHUwRbq2/TeLHTwc+YOtuNvHn9eThkAd0Up0dXDssQPbCc1cw17empz551os
	SarWS3rX4VHwNuX17yXnC/Lv9TFfh3rM8ykqDEZiDW6X4K4Zm7oQjFX5NNQt68iP/AFl
	N4cnDWx1ibpuCQrHFdxXjU3Df3rbs9kH2OBrl6OXLICYra6LYFtfvDI69yt6uOPeutW7
	mnSA==
Received: by 10.216.213.219 with SMTP id a69mr8604685wep.16.1336373624519;
	Sun, 06 May 2012 23:53:44 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fn2sm31060672wib.0.2012.05.06.23.53.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 May 2012 23:53:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 May 2012 08:53:31 +0200
Message-Id: <1336373612-18607-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336373612-18607-1-git-send-email-koen@dominion.thruhere.net>
References: <1336373612-18607-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkMCBe0S3wq6CN5GVoYOvuludScjgbyUbJXT96qzjhX2iUkeOE6dq/k7PhoQqmiqVnjFFE9
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/3] gnome-settings-daemon: add dependency on libxtst6
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
X-List-Received-Date: Mon, 07 May 2012 07:03:34 -0000

It's autodetected and leads to sstate based breakage on autobuilders:

This ends up in the package:

Package: gnome-settings-daemon
Version: 2.32.1-r3
Depends: libltdl7 (>= 2.4.2), hicolor-icon-theme, libjson0 (>= 0.9), libxcb1 (>= 1.8.1), libxrender1 (>= 0.9.7), libpixman-1-0 (>= 0.25.2), libxml2 (>= 2.7.8), libxext6 (>= 1.3.1), libz1 (>= 1.2.6), libxtst6 (>= 1.2.1),

But libxtst hasn't been built.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb          |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 31ee373..fc678b9 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "GNOME settings daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "r3"
+PR = "r4"
 
-DEPENDS = "glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
+DEPENDS = "libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
 
 inherit gtk-doc gnome
 
-- 
1.7.10



