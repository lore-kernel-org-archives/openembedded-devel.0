Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 51C127829E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:35:35 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 83so3179634pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VdD3nSjbje4QS9E+do97VRvOBoZUy1xoiGeoCqXKe/k=;
	b=ApjNq3NIIvY+BT6rXuKlO8KZx0gQi0NZCvB9NnOuEQLeedPDp5+93uaUaHLLCbQt6I
	BeXgRxvStD1qvqoK6hLBq2VRl0fM9sB1KwiWTjsDCQLgYXL9vR/RllDR13RZh1XFs3dm
	sHrzH1wQvUjt7DrbwrbGxvL0u72GABfUFUJtpzexkM0fNXifMCZmmdp+gUW00oBgY2g+
	f7a2ChPygxzdn5Aw6CTXUennHKF3dZDA38L3ts//sNj1K2LDO+ntLwmP6+qVoStDPO9+
	pWcVzyKzN9gGW2t1OF09NFS9l/a/wE6+8rkUnivpZ3MafE8sQMrVfw9O2kvqTBj2eRuH
	Tkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VdD3nSjbje4QS9E+do97VRvOBoZUy1xoiGeoCqXKe/k=;
	b=Jg7O7pfeF5LtyL5gprdukwiFOMddXb1PjtypRfsaKNUc7JcxPzIsH4UpMK8RAg4LdP
	Qv6oMI3pbqfk360Fv580xMgwB6s9uC3tE6m9A5APhPnqeP8YVUYSsS46OMHfP6Dezs5x
	N2mOf8fF5oUnceJjEKVzppiEr5ThceXX/FwKAM4+ZWPpYQKn1BBFZOUSW3P+nd2tDV9N
	KrygxLPUIs1lXUtwCjqY0QSjurlWI9R8p2kD02TfI0VHUlTlL5txB+g2ZVzqPSTgKJYV
	X033im/qqkf1zz/mkgPcqPSYXAWY68wMf/Cxxo84eE3S9jNxn2bwoBrcbHWvazxctLHY
	BZNQ==
X-Gm-Message-State: AHYfb5iF1PZFpuyywQchzyQTOqv6jJUOK6ku2/ptVuhqXki3JP9lvhrw
	eY06B+3UqWwR7eh8
X-Received: by 10.84.214.2 with SMTP id h2mr2681923pli.436.1503772537383;
	Sat, 26 Aug 2017 11:35:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	m2sm15240546pgs.72.2017.08.26.11.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 11:35:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 11:35:21 -0700
Message-Id: <20170826183521.34294-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170826183521.34294-1-raj.khem@gmail.com>
References: <20170826183521.34294-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 7/7] libbonoboui: Fix with with hardening and clang
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
X-List-Received-Date: Sat, 26 Aug 2017 18:35:36 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...node-qualify-functions-with-G_GNUC_PRINTF.patch | 49 ++++++++++++++++++++++
 .../recipes-gnome/bonobo/libbonoboui_2.24.5.bb     |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch

diff --git a/meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch b/meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch
new file mode 100644
index 000000000..e9aebb853
--- /dev/null
+++ b/meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch
@@ -0,0 +1,49 @@
+From b75879e8c3e24d338c0e5843d616bc9b02da4d04 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 09:52:17 -0700
+Subject: [PATCH] bonobo-ui-node: qualify functions with G_GNUC_PRINTF
+
+This helps compiler in doing format checking correctly
+Fixes
+bonobo-ui-node.c:864:38: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
+|         g_logv   ("XML", G_LOG_LEVEL_ERROR, msg, args);
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ bonobo/bonobo-ui-node.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/bonobo/bonobo-ui-node.c b/bonobo/bonobo-ui-node.c
+index 9bab5e5..6ec66e2 100644
+--- a/bonobo/bonobo-ui-node.c
++++ b/bonobo/bonobo-ui-node.c
+@@ -835,7 +835,7 @@ uiCharacters (ParseState *ps, const xmlChar *chars, int len)
+ 	g_string_append_len (ps->content, chars, len);
+ }
+ 
+-static void
++static G_GNUC_PRINTF(2, 3) void
+ uiWarning (ParseState *ps, const char *msg, ...)
+ {
+ 	va_list args;
+@@ -845,7 +845,7 @@ uiWarning (ParseState *ps, const char *msg, ...)
+ 	va_end   (args);
+ }
+ 
+-static void
++static G_GNUC_PRINTF(2, 3) void
+ uiError (ParseState *ps, const char *msg, ...)
+ {
+ 	va_list args;
+@@ -855,7 +855,7 @@ uiError (ParseState *ps, const char *msg, ...)
+ 	va_end   (args);
+ }
+ 
+-static void
++static G_GNUC_PRINTF(2, 3) void
+ uiFatalError (ParseState *ps, const char *msg, ...)
+ {
+ 	va_list args;
+-- 
+2.14.1
+
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
index 627f37ed9..b3ca0a465 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 inherit gnomebase pkgconfig gtk-doc
 
-SRC_URI += "file://gcc5.patch"
+SRC_URI += "file://gcc5.patch \
+            file://0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch \
+            "
 
 SRC_URI[archive.md5sum] = "853be8e28aaa4ce48ba60be7d9046bf4"
 SRC_URI[archive.sha256sum] = "fab5f2ac6c842d949861c07cb520afe5bee3dce55805151ce9cd01be0ec46fcd"
-- 
2.14.1


