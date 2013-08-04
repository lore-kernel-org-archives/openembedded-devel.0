Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 881D16AF58
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:25 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so1279085eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=VA/382/lXXDRP2lOmMb+ocLIH8G8e2tvcgUcIyT+WIc=;
	b=LDhRNC7xJQ7Rfmi1Y85CZjkvq6B5DSwD2sl6GcWwkKdjxxadsz8EHU+V6wZ7+ay5+p
	U3uqqLoPiksEXhdloMVLthuQca5/YP8q33WbDtMsWZLoU6u8aNzXoyUi6L+8Q+4NYBZb
	fUHInjTx10lKf6WNae/lFOs/pzbUxeGTbXIePdGxQhHy7kibxeoVKsgybKllQ9+eRceQ
	Oru5s0oYVpJl+jXMWGUdTLHJesgZHty5gL48cSRFtRk3n733Twi0oN4ZCmJ4zFW+fCoJ
	T7MTg4TwaM1m6AHbqaoc4La4tyH17ng4iYSrqDEZn1t7GO4d78mB2BbQhRzfcLyIMxFm
	0JmA==
X-Received: by 10.14.200.132 with SMTP id z4mr9762960een.14.1375652845587;
	Sun, 04 Aug 2013 14:47:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm28772458eeo.14.2013.08.04.14.47.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:44 +0200
Message-Id: <1375652867-10498-12-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/15] gnome-control-center: add libgtop dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Aug 2013 21:47:26 -0000

* it fails without it:
  | make[3]: *** [libcommon.la] Error 1
  | make[3]: Leaving directory `work/armv5te-oe-linux-gnueabi/gnome-control-center/2.32.1-r1/gnome-control-center-2.32.1/capplets/common'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index ef04c8d..85b3386 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME control center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "desktop-file-utils-native gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra"
+DEPENDS = "desktop-file-utils-native gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra libgtop"
 
 PR = "r1"
 
-- 
1.8.3.2


