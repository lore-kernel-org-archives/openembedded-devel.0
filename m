Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpx-0006ms-IE
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:41:54 +0200
Received: by mail-ee0-f53.google.com with SMTP id c1so809569eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=K/boicdFbTSG4jWo5uwR+PII7PxeTP0t2a2AhnGWCcg=;
	b=w84mektjsYqhu/HHggkMW8SsmzwBETuZLr7b2Wq7ffJ29COEuCiCyRrAiUHUQvUsX8
	JVx9s9ylV7TA+UnwwuP+BxFmX4IiYiQFFLYfTOjFvNiOeG/+7q5MBy4CNDyl60o4YBvp
	mNat5IVTmUN6n8akvbyHfcXHSUISwIi52Sz8Q7MXNpppPJVbFp+GOFRE8zf5/hIJZJZ9
	0wtaV8cIMnz5mvLr0GAeDk6spr999j/fXlSpNeV9eU5vmwMgiFxBNL9UY6bj9Z9iavEE
	C8FWBQh4ngySZEDB78Xd2iZPrQpbbJZmmlf3D8oQbKH6ksnvIEnnpuIDMFyOToMdzTS1
	8fLA==
X-Received: by 10.14.3.137 with SMTP id 9mr105248904eeh.0.1368631420993;
	Wed, 15 May 2013 08:23:40 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:56 +0200
Message-Id: <1368631259-13401-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 11/14] garcon: do not display settings in menu which are in settings-manager
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
X-List-Received-Date: Wed, 15 May 2013 15:42:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ations.menu-don-t-bloat-settings-menu-by-.patch |   35 ++++++++++++++++++++
 meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb      |    2 +
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/garcon/files/0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch

diff --git a/meta-xfce/recipes-xfce/garcon/files/0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch b/meta-xfce/recipes-xfce/garcon/files/0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch
new file mode 100644
index 0000000..e5ad4e1
--- /dev/null
+++ b/meta-xfce/recipes-xfce/garcon/files/0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch
@@ -0,0 +1,35 @@
+From f5398b49cc6fd7a53562aae2abbac0d9c656559c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 15 May 2013 14:17:49 +0200
+Subject: [garcon] xfce-applications.menu: don't bloat settings menu by
+ entries found in settings manager
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [1]
+
+[1] https://bugzilla.xfce.org/show_bug.cgi?id=10092
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ data/xfce/xfce-applications.menu |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/data/xfce/xfce-applications.menu b/data/xfce/xfce-applications.menu
+index dc3056b..c2aa0bb 100644
+--- a/data/xfce/xfce-applications.menu
++++ b/data/xfce/xfce-applications.menu
+@@ -34,6 +34,9 @@
+         <Include>
+             <Category>Settings</Category>
+         </Include>
++        <Exclude>
++            <Category>X-XFCE-SettingsDialog</Category>
++        </Exclude>
+ 
+         <Layout>
+             <Filename>xfce-settings-manager.desktop</Filename>
+-- 
+1.7.6.5
+
diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
index 44a0e68..cfc1131 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.2.1.bb
@@ -3,9 +3,11 @@ SECTION = "x11/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
 DEPENDS = "glib-2.0 xfce4-dev-tools-native libxfce4util"
+PR = "r1"
 
 inherit xfce
 
+SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
 SRC_URI[md5sum] = "c3cf89c836be0ddb281c81e4808fb68b"
 SRC_URI[sha256sum] = "48b644b8b2ffe597974e2526ca1a5d2d7da6a09c2d434f008dec80e9152701f7"
 
-- 
1.7.6.5



