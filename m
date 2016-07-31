Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6470160132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 02:15:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so21109811wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2016 19:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AhaVEaMvmHW81Euak9vTstX+POvLbWg5HSWJYWcQOYI=;
	b=yBGvUjJZnE3cZBxg9sdb69G84I+X4wtKaGhUoz1cUK6gF3gqnqx1U7r61VOcFHxS74
	Dtng0GHX8Xm2DSxtoCOXfYTrdu01WYKOkZ6hGmXc+uFWALcQMTw1hsuUEkaOEJNmcOPX
	WHGraYyseFwPOdf18Fbe0tABWWKePPVEj3gMcNw6/aQ9/jWnoCzKAfoZtLT5dzZmXpDb
	yc+1mYRpAc1bsHJYO1qkBXA7d42GxJ3av/fXVxkRq54TOX9+oFh8VsRMTT+ZRB6+4ows
	XJe6dmqeOq1ykWeHGBoP2hK304XiCltP19v1ukmaOVFQl5BfOtL8iwGGSY3YsIZBwYSr
	Pbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AhaVEaMvmHW81Euak9vTstX+POvLbWg5HSWJYWcQOYI=;
	b=JHxElwP8FDf6/3IhBgmswQjnI3+pSVYvBKjfMOU4BXiQKKOUk7TDvOlmYHzYGKHcLR
	J6s+vdFEtkhFlO2Kl0qOijNL7jax7Zn7in+HzsOOaqkM3elN1nFxnC4eLYAHagFQ3/dK
	D0vWkhQ4+8MHeUZgwOOyXXiPZv8G5jHJlYo+O/f5K7d+rGj1fWfjfBtpyXEWUhY4JPUJ
	WF28Ich/OXIPnr90mWYq4tCHvvI8+61uqa1BY3SIMY5mWDhtTFpPq+vs9KWgst8i7RA7
	9YnZjXhmp2MspJ+2uTKTRGVu4yrmFZSA1kHSocZXZE3ffJbdfFeWncTZJqwKPO1SVQro
	UTIg==
X-Gm-Message-State: AEkooutUw1HpLyieDPqS+v/FL7VFiJgWCy7MAAFDqIyZoM9hHNO5vY3aK/X2Ol32wW2Xvw==
X-Received: by 10.28.46.204 with SMTP id u195mr7128840wmu.57.1469931329493;
	Sat, 30 Jul 2016 19:15:29 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0B1C.dip0.t-ipconnect.de.
	[91.10.11.28]) by smtp.googlemail.com with ESMTPSA id
	r16sm10078788wme.16.2016.07.30.19.15.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jul 2016 19:15:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jul 2016 04:15:04 +0200
Message-Id: <1469931304-13906-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
References: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] gedit: remove blacklist caused by gtksourceview2 / fix/cleanup build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 31 Jul 2016 02:15:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ring-format-literal-warning-to-fix-build-.patch | 38 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     | 11 ++++---
 2 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch

diff --git a/meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch b/meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch
new file mode 100644
index 0000000..a5d2310
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch
@@ -0,0 +1,38 @@
+From 4ebdf8023f763f75a7e1b548894de2e8b784f4a8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 29 Jul 2016 23:19:40 +0200
+Subject: [PATCH] suppress string format literal warning to fix build with gcc6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ plugins/time/gedit-time-plugin.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/plugins/time/gedit-time-plugin.c b/plugins/time/gedit-time-plugin.c
+index d2ffdb9..441d9f9 100644
+--- a/plugins/time/gedit-time-plugin.c
++++ b/plugins/time/gedit-time-plugin.c
+@@ -473,12 +473,15 @@ get_time (const gchar* format)
+   	clock = time (NULL);
+   	now = localtime (&clock);
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	do
+ 	{
+ 		out_length += 255;
+ 		out = g_realloc (out, out_length);
+ 	}
+   	while (strftime (out, out_length, locale_format, now) == 0);
++#pragma GCC diagnostic pop
+ 
+ 	g_free (locale_format);
+ 
+-- 
+2.5.5
+
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 7e6b343..a6c68d3 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -3,13 +3,16 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
 PR = "r2"
 
-DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes"
+DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes intltool-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit gnome gettext pythonnative
-SRC_URI+= "file://0001-workaround-void-pointer-arithmetic.patch \
-           file://0001-Remove-help-directory-from-build.patch"
+SRC_URI+= " \
+    file://0001-workaround-void-pointer-arithmetic.patch \
+    file://0001-Remove-help-directory-from-build.patch \
+    file://0002-suppress-string-format-literal-warning-to-fix-build-.patch \
+"
 SRC_URI[archive.md5sum] = "e1eecb0a92a1a363b3d375ec5ac0fb3b"
 SRC_URI[archive.sha256sum] = "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
 GNOME_COMPRESS_TYPE="bz2"
@@ -19,5 +22,3 @@ EXTRA_OECONF = "--disable-scrollkeeper \
 
 FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
 FILES_${PN}-dbg += "${libdir}/gedit-2/plugin-loaders/.debug ${libdir}/gedit-2/plugins/.debug"
-
-PNBLACKLIST[gedit] ?= "Depends on broken gtksourceview2"
-- 
2.5.5


