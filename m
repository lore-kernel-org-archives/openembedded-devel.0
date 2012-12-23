Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlR4-0004by-Mz
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:17:47 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2504675eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PUSQ5kll9DdPXggb6VEPZVGVR0dVMf0khtixn6BHmuY=;
	b=TwRL8wOnwpityfuQUZgn+FK/yRS9jWvMXoFoLpA52VX3uyMa3P5kU/D+B4kSnEkRmm
	7xFMBcEvh/q4WNCV9Al6/dQP78aKsS43/x2COLEvRR1UQpqCiOyB6LyerdWdfOzzp0Dw
	rlvfyZh3dk5QzozoJvG9H9Ym56hq1T6MaPQdaKXRqP0RrndciIlOO9ID5rzAFpNQ5Kn1
	/4MGjZvR+QzthNSQ8Iy4Lcuc1CFrA0B3avUSOmBtR754ejM8fvEmo6S4NCLmyr5Wv492
	HhEeIuuaMd17QrDKpiX51zRCYvL6XMkRRYyPogu6V6K0AfEwZlfwQDy5OLicc9i1Qd1L
	UIng==
X-Received: by 10.14.0.71 with SMTP id 47mr47598268eea.19.1356267778162;
	Sun, 23 Dec 2012 05:02:58 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.02.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:02:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:33 +0100
Message-Id: <1356267761-15152-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 04/12] xfce4-settings: add garcon to DEPENDS
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
X-List-Received-Date: Sun, 23 Dec 2012 13:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:
checking for garcon-1 >= 0.1.10... not found
*** The required package garcon-1 was not found on your system.
*** Please install garcon-1 (atleast version 0.1.10) or adjust
*** the PKG_CONFIG_PATH environment variable if you
*** installed the package in a nonstandard prefix so that
*** pkg-config is able to find it.
Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-settings/xfce4-settings_4.10.0.bb        |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
index fb9083d..7075e2a 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
@@ -2,7 +2,8 @@ DESCRIPTION = "Xfce4 settings"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
+DEPENDS = "exo garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
+PR = "r1"
 
 inherit xfce
 
-- 
1.7.4.4



