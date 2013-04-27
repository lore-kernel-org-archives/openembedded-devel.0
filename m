Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWAE2-0004Yh-CJ
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Apr 2013 20:52:02 +0200
Received: by mail-ee0-f41.google.com with SMTP id c50so1845529eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Apr 2013 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=NAmUndzUgoG5T1bDypigXGtBjJKjdvc43qIgvNuF3nQ=;
	b=fGkpmwkeDaVA+7AEKpKQ+MKx9SbH6+frll9qzl2h1ntMin4mwI/vJVACcQl9S+E2n0
	HPnR4lS2bTyRb7N6cV5HE61JsROTL/dZst5/kJcxm8mkm70/E/hlfWGB9dxxaSdL1OKu
	8CpzDjgPvd6uDmMbhoRGvG4BgAnIuESQrq1b7miZm+f5cAiRCZU6UqgxpJHUfm3J4oVh
	uT+DrD5jyL/b+Gt7IXCck9C0vuNpjkfxqbaE5eR9byLSuWfX+UBsz875UADgtBUUTCtg
	5kPIm6hilA6qs1PddD3p8Pp+ap2kNnppDddA6fzobX1A+Et+E6+1zfUN9hcc1PRXCyCL
	4Txw==
X-Received: by 10.15.22.199 with SMTP id f47mr102565916eeu.11.1367087652045;
	Sat, 27 Apr 2013 11:34:12 -0700 (PDT)
Received: from localhost.localdomain (p5B0A212D.dip0.t-ipconnect.de.
	[91.10.33.45])
	by mx.google.com with ESMTPSA id f9sm23175879eeu.11.2013.04.27.11.34.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 11:34:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Apr 2013 20:33:58 +0200
Message-Id: <1367087640-4264-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367087640-4264-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome/meta-xfce 2/4] gdm: avoid displaying system users in greeter's list
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
X-List-Received-Date: Sat, 27 Apr 2013 18:52:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...nager.c-avoid-displaying-system-users-in-.patch |   34 ++++++++++++++++++++
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    3 +-
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gdm/gdm/0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch b/meta-gnome/recipes-gnome/gdm/gdm/0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch
new file mode 100644
index 0000000..ad21073
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gdm/gdm/0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch
@@ -0,0 +1,34 @@
+From 43e59f3deadb3914a1cc931ae18d4023874cdeca Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 26 Apr 2013 17:15:48 +0200
+Subject: [PATCH] gdm-user-manager.c: avoid displaying system users in
+ greeter's list
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+yocto environment system users have UID below 1000
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ gui/simple-greeter/gdm-user-manager.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/gui/simple-greeter/gdm-user-manager.c b/gui/simple-greeter/gdm-user-manager.c
+index c631989..f18e478 100644
+--- a/gui/simple-greeter/gdm-user-manager.c
++++ b/gui/simple-greeter/gdm-user-manager.c
+@@ -63,7 +63,7 @@
+ #ifdef __sun
+ #define FALLBACK_MINIMAL_UID     100
+ #else
+-#define FALLBACK_MINIMAL_UID     500
++#define FALLBACK_MINIMAL_UID     1000
+ #endif
+ 
+ #ifndef _PATH_SHELLS
+-- 
+1.7.4.4
+
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 87efc28..09a6f93 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,13 +4,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r16"
+PR = "r17"
 
 inherit gnome update-rc.d systemd useradd
 
 SRC_URI += " \
             file://cross-xdetection.diff \
             file://0001-Remove-user-switch-applet.patch \
+            file://0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch \
             file://sysrooted-pkg-config.patch \
             file://%gconf-tree.xml \
             file://gdm \
-- 
1.7.4.4



