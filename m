Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLO-00027z-HR
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:10 +0200
Received: by wibhn14 with SMTP id hn14so1164669wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CaOoFnLdAkKiCY+ooP5inK7uzjE/V4f12hHkuSDkVyI=;
	b=dGqUgrSruPK3Upb+UiC/Bn9vLAVwzaFcbdUp/mYPQJ7Fxo6X+c+UtogBzJP/LuLhYz
	4Z4cI5ZklkB/EhPWYH6DUzBBr8YvgcdKLnvyE0SqlYJhQuXlC7XLeY6XJ8Wy16+9pY2z
	yJ68Wj1AyXvxWIQ7CEX+Ohlx84B6QhSFs8aQz8so/+UhU5/ESAwyRkD1ERA+WvRuz0aT
	rhyvEyZep5v4S8J8/Q0lrI1oeyOV1DijYhsaeGeFyYV86CtLNHHIwg3/AT+SlHh6z8Sx
	KLoHjmomlVnSOa3ej8fYFFXJRqr5SiYWe6hGZN73V+0kZn4WtY5i7kFGlzRrY3IJkdk4
	Wutg==
Received: by 10.216.213.79 with SMTP id z57mr5028958weo.27.1338639108391;
	Sat, 02 Jun 2012 05:11:48 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:47 +0200
Message-Id: <1338639361-23775-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 01/15] xfce4-session: add consolekit to RDEPENDS
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This error was hidden for years by my test image containing consolekit.

One result of missing consolekit are greyed 'Restart' and 'Shut Down' in XFCE's
logout-dialog and the log message:

** (xfce4-session:4125): WARNING **: 'CanStop' method failed : The name org.freedesktop.ConsoleKit was not provided by any .service files

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-session/xfce4-session_4.8.3.bb           |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
index 2db465b..3c84a72 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.3.bb
@@ -3,7 +3,8 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf xfce4-panel gconf gnome-keyring"
-RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth"
+RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit"
+PR = "r1"
 
 inherit xfce
 
-- 
1.7.4.4



