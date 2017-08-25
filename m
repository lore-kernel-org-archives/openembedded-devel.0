Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C28D77D11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 07:14:30 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id q16so2570856pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Aug 2017 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F+eCQ5XoQB1vANx8e6sdrySnWTHysH6OsYSkX42hMLQ=;
	b=GvXNs46aFsjDlxeJfW0VS+p9exH5XXZ8r5vZB43R/pGcA6+PVxf2wle1uEPG9FEZVa
	REqV7Q2nfEGGecie0XoCvdcWC0MYUgk9IOODNzky/8vF6NNXNuEi4/CwnTBvP5hUsuDc
	4okLlLnBEhR6WQOXxJeOfHLx8zItpSdV9kNTA9ZsduE3cMPc3cMBESldNwhvL8nO4cZz
	fOomYprwZW8K4JGw3XRQ+l8s3/CGxfJ4Y1IvdHPEOIqwJ+R5se+z+9z20HbZZ57lPyEX
	FlOL43J0uCDBuaun+JIXpLYg7Jqjd2Y9U+F/ChRnxr3hSkEhwLRYDt5TrY2GtFQ5fWDM
	IUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F+eCQ5XoQB1vANx8e6sdrySnWTHysH6OsYSkX42hMLQ=;
	b=lOD3MvO0643L22XEva7wtFqSyGJ6uWIzboMu6rVuCqD36o/u6iFzw3ilBKZrbMDz5v
	5Q0AjGUyxnUcvPlF+emHrFdw2evUnkAIyjr7qZdJtNxWNGZsD1GA1OYWOzWP1R5irBoC
	mvjIABphd2rMFcOFAIZTolC6tvcQFZASYSudYJK4iC505MAY/cxdjzsZ0uIXxa7wLqo7
	RH2y7XNZz9ZTNvXLIB3YKVEYZppKEoqCOk35tImUkQDkOktsmSysrZvep3SL9VRe1eez
	lEPX4lkF4kwVqYi2QFV4OkIBV6lEBVAPosvA0hEcY1CBp71/WaonMfh1saxEunvwCjl4
	xRfA==
X-Gm-Message-State: AHYfb5gr5j924Oajtu5Q3uETN6ogZwUQI2gFjUcWsbu1mNMua1h8fj2l
	ZjA7dOTI8RZ0Cgi7
X-Received: by 10.84.136.135 with SMTP id 7mr9895383pll.356.1503645271941;
	Fri, 25 Aug 2017 00:14:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	x11sm11730377pfk.43.2017.08.25.00.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Aug 2017 00:14:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Aug 2017 00:14:19 -0700
Message-Id: <20170825071422.3969-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-gnome][PATCH 1/4] evolution-data-server: Fix build with clang
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
X-List-Received-Date: Fri, 25 Aug 2017 07:14:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-Fix-signature-for-imapx_tokenise_struct.patch | 33 ++++++++++++++++++++++
 .../recipes-gnome/eds/evolution-data-server_git.bb | 20 ++++++-------
 2 files changed, 43 insertions(+), 10 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch
new file mode 100644
index 000000000..f82a76df3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch
@@ -0,0 +1,33 @@
+From 0e10e976025b21d12df099e82951f759024ad649 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 24 Aug 2017 22:04:56 -0700
+Subject: [PATCH] imapx: Fix signature for imapx_tokenise_struct()
+
+clang complains about different signature for this patch
+
+Fixes
+camel/providers/imapx/camel-imapx-tokens.txt:56:1: error: conflicting types for 'imapx_tokenise_struct'
+| imapx_tokenise_struct (register const char *str, register size_t len)
+| ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ camel/providers/imapx/camel-imapx-tokens.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/camel/providers/imapx/camel-imapx-tokens.txt b/camel/providers/imapx/camel-imapx-tokens.txt
+index d48501865..994c368c0 100644
+--- a/camel/providers/imapx/camel-imapx-tokens.txt
++++ b/camel/providers/imapx/camel-imapx-tokens.txt
+@@ -1,7 +1,7 @@
+ /* This contains all of the keywords we care about.  These
+    can be converted to an id very efficiently */
+ struct _imapx_keyword {const gchar *name; camel_imapx_id_t id; };
+-struct _imapx_keyword *imapx_tokenise_struct (register const char *str, register unsigned int len);
++struct _imapx_keyword *imapx_tokenise_struct (register const char *str, register size_t len);
+ %%
+ ALERT,          IMAPX_ALERT
+ APPENDUID,	IMAPX_APPENDUID
+-- 
+2.14.1
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index ff3365bc9..aadc4b5e3 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -15,16 +15,16 @@ SRCREV = "a9e4e74ec4473a4fd09e56b690bd4fa72f686687"
 # 3.4 series needs libgdata-0.10*, 3.8 series needs also libsecret instead of gnome-keyring
 PV = "3.2.3+git${SRCPV}"
 
-SRC_URI = " \
-    git://git.gnome.org/evolution-data-server;branch=gnome-3-2 \
-    file://0001-contact-Replace-the-Novell-sample-contact-with-somet.patch \
-    file://0002-Fix-for-automake-1.12.x.patch \
-    file://0003-Disable-Werror-for-automake.patch \
-    file://0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch \
-    file://0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch \
-    file://0006-configure.ac-do-not-overwrite-localedir.patch \
-    file://iconv-detect.h \
-"
+SRC_URI = "git://git.gnome.org/evolution-data-server;branch=gnome-3-2 \
+           file://0001-contact-Replace-the-Novell-sample-contact-with-somet.patch \
+           file://0002-Fix-for-automake-1.12.x.patch \
+           file://0003-Disable-Werror-for-automake.patch \
+           file://0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch \
+           file://0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch \
+           file://0006-configure.ac-do-not-overwrite-localedir.patch \
+           file://iconv-detect.h \
+           file://0001-imapx-Fix-signature-for-imapx_tokenise_struct.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


