Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8E15F78978
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:26 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id h21so17504192wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TR7H9rMXSoSu2VnQaIFI5euqvxAXcNLoc+s7Jpf+tUU=;
	b=eWU/U79eCCctgjtnkzj++BM8nfikr9Pk/hgKCcoCJTz36A5yoPSp+ERYGiyEppXPTA
	ZG5V9v3QVnxliQW9wBYw/oaFjTkTIOQ5nxQpjYekbhkzM2m4Y2afGkqDShLTwIAzo48Q
	jfdQGUMPTj6PSeNyQlvBWxgVRlv5cfkqKi4Dk+8xIgTdtOEkVoRpN3HZWdQXq3Juxldl
	feJ0XL3xwnMl4zTOnVDkVz51VRbErm4fKWd1xGeMCqgEMxPStJVaOtRK4E0lNmjt6lv1
	CoNZpBmOyqqpcBX9l4VLol77D5EqNkpmPxY7WYzrFgyj6e6pVIuQ81qg1TjaTKS4y3n0
	QYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TR7H9rMXSoSu2VnQaIFI5euqvxAXcNLoc+s7Jpf+tUU=;
	b=buJFMhV5pUi+B9tWlIckkBV7XreeShv4sYX+ONzSIR0KYVlM2M/dMipkig5m28pMct
	DnsASrsb+0yJbYcaxyYz0XIYWdGP/hFmXvbbzdLEg6Ip4dDDxNR7ydEj8kkdffFTx+y7
	V0wtbmvVXfeBhsLTTFlET/JB05pEGb0IdRtPa+/sUDkQIYKfVcwJ9M8ejszZP4RT5oM3
	t/dvg1ViAxipqTtnuahxz9l2XK4fFakWCirj5IJZP7sESaDT74IqBfJdDzyzJ8s2t7OW
	oSQpKNIl1QKYzm+Odz/kH6aGZ+xerUxQKpCW0ZtwTyBmIdZWXnFt+Is1z02526fW3gKB
	HLoA==
X-Gm-Message-State: AElRT7HkGNF/2EbMxd3ZNlp/5b1Rcit2bd90+llCtCveOp4gGoLX5LVU
	dpNCW2Vg/pd3iJCg3pUbWqgEGw==
X-Google-Smtp-Source: AG47ELtWNVJg5ZDTXJovr06QauWX54P0QdBZTikbec7ISfv7JCvl9Df6pViZ2dFg3D/AcgR53xn7Ew==
X-Received: by 10.28.45.209 with SMTP id t200mr83249wmt.90.1521491367022;
	Mon, 19 Mar 2018 13:29:27 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:28:58 +0100
Message-Id: <20180319202911.30760-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/17] libbonoboui: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it depends on removed libglade
* project is dead - last release in 2011

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...node-qualify-functions-with-G_GNUC_PRINTF.patch | 49 ----------------------
 meta-gnome/recipes-gnome/bonobo/files/gcc5.patch   | 12 ------
 .../recipes-gnome/bonobo/libbonoboui_2.24.5.bb     | 25 -----------
 3 files changed, 86 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/files/gcc5.patch
 delete mode 100644 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb

diff --git a/meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch b/meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch
deleted file mode 100644
index e9aebb853..000000000
--- a/meta-gnome/recipes-gnome/bonobo/files/0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From b75879e8c3e24d338c0e5843d616bc9b02da4d04 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Aug 2017 09:52:17 -0700
-Subject: [PATCH] bonobo-ui-node: qualify functions with G_GNUC_PRINTF
-
-This helps compiler in doing format checking correctly
-Fixes
-bonobo-ui-node.c:864:38: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
-|         g_logv   ("XML", G_LOG_LEVEL_ERROR, msg, args);
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- bonobo/bonobo-ui-node.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/bonobo/bonobo-ui-node.c b/bonobo/bonobo-ui-node.c
-index 9bab5e5..6ec66e2 100644
---- a/bonobo/bonobo-ui-node.c
-+++ b/bonobo/bonobo-ui-node.c
-@@ -835,7 +835,7 @@ uiCharacters (ParseState *ps, const xmlChar *chars, int len)
- 	g_string_append_len (ps->content, chars, len);
- }
- 
--static void
-+static G_GNUC_PRINTF(2, 3) void
- uiWarning (ParseState *ps, const char *msg, ...)
- {
- 	va_list args;
-@@ -845,7 +845,7 @@ uiWarning (ParseState *ps, const char *msg, ...)
- 	va_end   (args);
- }
- 
--static void
-+static G_GNUC_PRINTF(2, 3) void
- uiError (ParseState *ps, const char *msg, ...)
- {
- 	va_list args;
-@@ -855,7 +855,7 @@ uiError (ParseState *ps, const char *msg, ...)
- 	va_end   (args);
- }
- 
--static void
-+static G_GNUC_PRINTF(2, 3) void
- uiFatalError (ParseState *ps, const char *msg, ...)
- {
- 	va_list args;
--- 
-2.14.1
-
diff --git a/meta-gnome/recipes-gnome/bonobo/files/gcc5.patch b/meta-gnome/recipes-gnome/bonobo/files/gcc5.patch
deleted file mode 100644
index f7528adad..000000000
--- a/meta-gnome/recipes-gnome/bonobo/files/gcc5.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: libbonoboui-2.24.5/tools/browser/Makefile.am
-===================================================================
---- libbonoboui-2.24.5.orig/tools/browser/Makefile.am
-+++ libbonoboui-2.24.5/tools/browser/Makefile.am
-@@ -2,7 +2,6 @@ INCLUDES =	\
- 	-DBONOBO_BROWSER_DATADIR=\""$(datadir)"\"	\
-         -DBONOBO_SUPPORT_LOCALEDIR=\""$(datadir)/locale"\"        \
- 	-I$(srcdir) -I$(top_srcdir) 			\
--	-I$(top_srcdir)/bonobo-browser			\
- 	$(BONOBOUI_CFLAGS)				\
- 	$(WARN_CFLAGS)
- 
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
deleted file mode 100644
index 8e3169e34..000000000
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SECTION = "x11/gnome/libs"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-inherit distro_features_check gnomebase pkgconfig gtk-doc
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI += "file://gcc5.patch \
-            file://0001-bonobo-ui-node-qualify-functions-with-G_GNUC_PRINTF.patch \
-            "
-
-SRC_URI[archive.md5sum] = "853be8e28aaa4ce48ba60be7d9046bf4"
-SRC_URI[archive.sha256sum] = "fab5f2ac6c842d949861c07cb520afe5bee3dce55805151ce9cd01be0ec46fcd"
-GNOME_COMPRESS_TYPE="bz2"
-
-DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gconf libxml2 libglade gnome-common intltool-native"
-
-FILES_${PN} += "${libdir}/libglade/2.0/*.so"
-FILES_${PN}-dev += "${libdir}/libglade/2.0/*.la ${datadir}/gnome-2.0/ui \
-                    ${libdir}/bonobo-2.0/samples"
-FILES_${PN}-staticdev += "${libdir}/libglade/2.0/*.a"
-FILES_${PN}-dbg += "${libdir}/bonobo-2.0/samples/.debug \
-                    ${libdir}/libglade/2.0/.debug"
-- 
2.14.3


