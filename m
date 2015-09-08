Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5CABF7422C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:42 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so125431730wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=WrOa9hobLuqrrsoBO1CPCnCgNnVRlG0Ke0yamJ1282Q=;
	b=sTO2f1m9YTMU7h7zIPNleyMHZR5z+D1puaY1O3mnO8EleCgjMk0P9d9yOkFZG1BLKh
	j99u7y5uwpau7OX4VfZS4qcApCwkLUV3LGBPL7wMiYPykVJdL/68ipvcOY2wKJ/TcO7X
	E9UvhBa55UqPutBauvKsk0KIFKlfy/vEE4wO7qRWW52B4CTumyqP3BQvSc8JBW8/T6kW
	wI6FPRmsoAY21sw8YyErLpWmMMESOgwgYPssk4ZWLRnqJ804jcrI5KTXj0o7yCvIPrO/
	uUc+SPcvACVK+wE2yn1OeNwZc/JsWDizxCgyc3z5pHHgINw5MB0mihveFD5BZ/3aYPIb
	1GyQ==
X-Received: by 10.180.182.7 with SMTP id ea7mr47100318wic.58.1441727022412;
	Tue, 08 Sep 2015 08:43:42 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:55 +0200
Message-Id: <1441726980-32656-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] evolution-data-server: fix locale installation path
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:

WARNING: QA Issue: evolution-data-server: Files/directories were installed but not shipped in any package:
  /usr/locale
  /usr/locale/xh
  /usr/locale/hu
  /usr/locale/nn
  /usr/locale/fi
...

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...6-configure.ac-do-not-overwrite-localedir.patch | 34 ++++++++++++++++++++++
 .../recipes-gnome/eds/evolution-data-server_git.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch
new file mode 100644
index 0000000..741e5e9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0006-configure.ac-do-not-overwrite-localedir.patch
@@ -0,0 +1,34 @@
+From 3feaea8e84b3ad8dc2d551e42224f3b4a9413e7d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 3 Sep 2015 11:14:24 +0200
+Subject: [PATCH] configure.ac: do not overwrite localedir
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [1]
+
+[1] https://git.gnome.org/browse/evolution-data-server/tree/configure.ac#n298
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f1d4ce8..cee847f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -257,9 +257,6 @@ GETTEXT_PACKAGE=evolution-data-server-$BASE_VERSION
+ AC_SUBST(GETTEXT_PACKAGE)
+ AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE, "$GETTEXT_PACKAGE", [Package name for gettext])
+ 
+-localedir='$(prefix)/$(DATADIRNAME)/locale'
+-AC_SUBST(localedir)
+-
+ dnl ******************************
+ dnl Initialize libtool
+ dnl ******************************
+-- 
+2.1.0
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index 7c935a3..426076f 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0003-Disable-Werror-for-automake.patch \
     file://0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch \
     file://0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch \
+    file://0006-configure.ac-do-not-overwrite-localedir.patch \
     file://iconv-detect.h \
 "
 
-- 
2.1.0


