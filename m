Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SZImC-0004vw-SY
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 May 2012 11:31:40 +0200
Received: by bkcjm2 with SMTP id jm2so2946658bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2012 02:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=AA7NjlnAeOb6QHZ8zZweMC5s0Kx7ggbK/WWzPl0g6iQ=;
	b=GMNgBUo6o+1EP5cCg0Tz2mAUA0RhtylqLEyBEPRQYw0JEGxRuQs3IbrR30CEnTHXbc
	S4QHPGtBb+iB/L7pi2MPrfpXl9ZdKdgtCYBtCCJnxl9nmDp59hG/yl3ulmI/YWAahUrT
	LnZekxDyqvg0gx+1+4vOLpdUsUWlyVo1qXVGJpSp5UWu8NiWyGIFbkGQ5KnDwwuHu9eL
	sdFrdZKA6lnfR81UqmiUMW6qjWfQzvZFolkVrsNk9daUQY9H9VOXKUwtaniJ3354Cylh
	IF80hzrKAjxX6THXkEHAvdr6IMEBXOcmGBIa8rwWLSI5+n8XkVcqUVwA59mTEZbpgzE0
	3oFA==
Received: by 10.204.156.155 with SMTP id x27mr5291433bkw.84.1338283283816;
	Tue, 29 May 2012 02:21:23 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id 9sm16984673bku.9.2012.05.29.02.21.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 02:21:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 May 2012 11:21:12 +0200
Message-Id: <1338283272-13778-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] xfce4-session: add consolekit to RDEPENDS
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
X-List-Received-Date: Tue, 29 May 2012 09:31:41 -0000
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
1.7.6.5



