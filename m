Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C49871E30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:39 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 34so154284pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tgC0+fXrIshHJJ2E8c1uaX7Dh5jW7U72KQTz8SDvkto=;
	b=TislW9VMLPgSROW/2nkQpqR94LjW74tOBj9wBH417vhQR9VqfZCINEtUMuJE6GEzIS
	UXcKKn7JqLJ9BvDqfdvMsatFLQ9oOMGGdjeAzutRbLibz2p4FPfcOUTgUNZXE4bvSp7g
	4sN0I3aaky5TX8Uu407YJ74dlpDQGdNsc7DeeTSV8GYYUz3yTuJCSgUdVAVl0nBFPe+5
	dOalCOcBtoyMGgihY0FHTnxehpL8JVwJ8wbyBMiMhRKgdv8ZbElP2EeIf9hDTpF48HmH
	pyUxV6Z3aV47k2CtBC3dBG6MhjHlt1hfJtaYwGZp5z1zRqTTRiCvp3dgjDLPHVs8jAOd
	qDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tgC0+fXrIshHJJ2E8c1uaX7Dh5jW7U72KQTz8SDvkto=;
	b=aKxLAyrPqs5a3OeH575V/vgNVqunZ9IUS1wYq2P+4H33UW8vV9oWulVudiQcbH3X/j
	3B0FLhryh17w+cFSkSKZ1pLmkAoWJfUqGWQkinl6JpXGzZCmcTHQyeXdr/DZoOUsZcyX
	kbTQvyfzFe8PLpS0C2uur/ZeSjiY8M1TgsYjC60ij0iNbbIe+cPx+UZBXMhCllcAcjYH
	Hwyt5vpq4naOyYmdCQOGOMQtZvRfpAXdEsLaRqigaptzMl93++J/tAEpZ8uOVT7J5OcD
	iKNiNRFndU45qLVkd5bBxfbC6GU/dMzHf9kprs0ufWki8LqthalB0D2Ojli7oQcDKY5u
	jMfA==
X-Gm-Message-State: AN3rC/5W26RxZUMN8La8P3eTYm0Kr0/nk5qqQSoVPTbuQYvHNxTbUJuu
	GodCltjod5YIAA==
X-Received: by 10.98.110.195 with SMTP id j186mr18736969pfc.25.1492539761338; 
	Tue, 18 Apr 2017 11:22:41 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:41 -0700
Message-Id: <20170418182142.27253-31-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-gnome][ 31/32] gtksourceview2: Fix build with clang
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...et.c-fix-non-literal-format-string-issues.patch | 31 ++++++++++++++++++++++
 .../gtksourceview/gtksourceview2_2.10.5.bb         |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/0001-test-widget.c-fix-non-literal-format-string-issues.patch

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/0001-test-widget.c-fix-non-literal-format-string-issues.patch b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/0001-test-widget.c-fix-non-literal-format-string-issues.patch
new file mode 100644
index 000000000..6118b679a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2/0001-test-widget.c-fix-non-literal-format-string-issues.patch
@@ -0,0 +1,31 @@
+From 0781b218beb8ba160ea223ff3d74a4fa2abf86fa Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Apr 2017 16:21:14 -0700
+Subject: [PATCH] test-widget.c: fix non-literal format string issues
+
+clang errors out when using -Werror=format-nonliteral
+since the definition of g_strdup_vprintf() from glib-2.0
+is using va_list and clang seems to still warn where as
+gcc doesn't do that for va_list arguments
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test-widget.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/test-widget.c b/tests/test-widget.c
+index 46f5f4e..3f2e60f 100644
+--- a/tests/test-widget.c
++++ b/tests/test-widget.c
+@@ -260,7 +260,7 @@ static const gchar *buffer_ui_description =
+ 
+ /* File loading code ----------------------------------------------------------------- */
+ 
+-static void
++static void G_GNUC_PRINTF (2, 0)
+ error_dialog (GtkWindow *parent, const gchar *msg, ...)
+ {
+ 	va_list ap;
+-- 
+2.12.2
+
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index e3bf551eb..012f8e3bc 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -18,7 +18,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2;name=archive \
            file://gtk-doc.make \
            file://suppress-string-format-literal-warning.patch \
-"
+           file://0001-test-widget.c-fix-non-literal-format-string-issues.patch \
+           "
 SRC_URI[archive.md5sum] = "1219ad1694df136f126507466aeb41aa"
 SRC_URI[archive.sha256sum] = "c585773743b1df8a04b1be7f7d90eecdf22681490d6810be54c81a7ae152191e"
 
-- 
2.12.2


