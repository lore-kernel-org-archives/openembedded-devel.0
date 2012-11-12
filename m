Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TXspp-0002gS-D0
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Nov 2012 13:09:59 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so476062eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Nov 2012 03:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=p/UbNe1gRGuOL83uHopPmrzHeocLdK9FmkfRpya5RiY=;
	b=ACoR9iA1jpMhljnwbk/Yuw6BcN5NMZcsOQ0EWpP0sHni9x0v4sxoproYxOPxMUVkRp
	P9hI7BnRgV2l3bsWMxoA8Tq5+53UVtQK9fwJNxdbm9Y9BL96v95O4aR80+0G1or/ktRo
	WGCcCvPdHtW5CIEGjZjLFvhSZCnhmLSzUI3Zv1sFgZj5iLRwavnFB4RtXMg7D4A3Oibw
	er6tM2yRiNi9MnYJPAcmOOCSJ4vSlDXXKNtapa70hzBNQez6XqFEL8LPZLjHHNW5PQKv
	ZPsyeXF2OBqVbTL7EZfd+B+L1sBk0/FFbcXl9X9DghEzskjWujo40wWAiCjPPPgDiBat
	LXug==
Received: by 10.14.220.71 with SMTP id n47mr62227939eep.26.1352721356964;
	Mon, 12 Nov 2012 03:55:56 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-94.unitymediagroup.de.
	[109.91.251.94])
	by mx.google.com with ESMTPS id f2sm15646402eep.2.2012.11.12.03.55.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 03:55:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Nov 2012 12:54:27 +0100
Message-Id: <1352721267-367-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
References: <1352721267-367-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-oe/meta-xfce 6/6] thunar: add xfce4-panel to dependencies to ensure trash-plugin (tpa) is build
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
X-List-Received-Date: Mon, 12 Nov 2012 12:10:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb
index 39b1254..2d5b767 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.4.0.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "File manager for the Xfce Desktop Environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify"
+DEPENDS = "exo glib-2.0 gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify xfce4-panel"
+PR = "r1"
 
 inherit xfce
 
-- 
1.7.6.5



