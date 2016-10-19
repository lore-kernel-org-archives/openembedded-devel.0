Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 384F9719A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:41 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id s8so1421483pfj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=knpHVP+LvbKMWXX9+QgFmxOKlI0qdsu7Qh7Ud6A1P3s=;
	b=luWf7ODmCynRXXnQEVIFeO7dTsHqmi2Y38aUVytT0eBkyhVf87X7wKqM1rfisB+doo
	UidfdTT6nQKKRZ0Tie6LRHVIoNyMUnHGNhVqBJbLMKDnqtd4z6pC/2dzNyuR3kIgOweh
	jRTyLD6EIfvRnLBDxGRcAl8cZQV9IMRED1pDDwRgMafyheh0Gr0US3FYRjrjWY1qdEYq
	SezWgoBmSI9ovhVPCY22mj1o5fUR/tx4wIrnhLrJPDkSKngZpHg/3vSKgiOw58gvOlTV
	Kv/CtUeEptxF4djM59+7wZVknlLSv5YZCVqe1mfO/33PqQs+HAanbCOt1RSsl89j/36L
	w3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=knpHVP+LvbKMWXX9+QgFmxOKlI0qdsu7Qh7Ud6A1P3s=;
	b=RrJsA2ZCTwj994ouohzCoeHt3UM7A2hB1qsYpuN8o+wdHOhpY5pKrvt+WHlaGDIwHt
	HuVyiDkyFMgBjPJHE3r9UlHgn5RLjGGL3yU00oHEEHWUfzqBJNVAJhMN41v9DSQKaaEB
	c0UTJDS6awvBSjPDNBx7O68Ze1yQAQdfhgcc5ySb5XTU02dUU3sS3r28qW1kEFm0llUZ
	uUJKacy+vXEd7hIZRwxXvoDoZhUk/tcHDI05VyDA8dwznzXoJm4U5LLp3G846wM0GVU1
	EEHEcP2Cpxwl7nrOg3Z8hYUJSG/UjzMiv7ISb4GVNKURwPTUqPftjiwFgIRqRoP5GjNp
	sEdw==
X-Gm-Message-State: AA6/9RlmNeowXBUEX3rzr7d+t3Ccnc0UGkSYKQFjrjwKjVrzKuuRrAa/XrxGB5Zda8tvZA==
X-Received: by 10.98.34.7 with SMTP id i7mr7711353pfi.145.1476855523310;
	Tue, 18 Oct 2016 22:38:43 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:20 -0700
Message-Id: <20161019053834.11523-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 02/16] libbonobo: Fix missing dep on orbit2-native and build with clang
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |  2 +-
 .../libbonobo/fix-nonliteral-in-string.patch       | 26 ++++++++++++++++++++++
 .../recipes-gnome/bonobo/libbonobo_2.32.1.bb       |  1 +
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index e0f6168..60a8597 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 SECTION = "x11/gnome/libs"
-DEPENDS = "glib-2.0 orbit2 intltool-native libxml2 dbus dbus-glib"
+DEPENDS = "glib-2.0 orbit2-native orbit2 intltool-native libxml2 dbus dbus-glib"
 
 inherit gnomebase gtk-doc lib_package
 
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
new file mode 100644
index 0000000..20db671
--- /dev/null
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo/fix-nonliteral-in-string.patch
@@ -0,0 +1,26 @@
+This checks whether the format string is a literal on the calling function. As bonobo_debug_print()
+takes already a va_list, we specify the format on the functions that call it
+The second number, which is 0 here, should then be the argument index of the variadic argument
+
+Fixed warning with clang
+
+| ../../libbonobo-2.32.1/bonobo/bonobo-debug.c:58:32: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
+|         vfprintf (_bonobo_debug_file, fmt, args);
+|                                       ^~~
+| 1 error generated.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libbonobo-2.32.1/bonobo/bonobo-debug.c
+===================================================================
+--- libbonobo-2.32.1.orig/bonobo/bonobo-debug.c
++++ libbonobo-2.32.1/bonobo/bonobo-debug.c
+@@ -47,6 +47,7 @@ bonobo_debug_init(void)
+ 	  _bonobo_debug_file = stderr;
+ }
+ 
++__attribute__((__format__ (printf, 2, 0)))
+ void
+ bonobo_debug_print (const char *name, char *fmt, ...)
+ {
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
index fd4d812..8e00eb4 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
@@ -2,6 +2,7 @@ require libbonobo.inc
 
 SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
             file://do-not-use-srcdir-variable.patch \
+            file://fix-nonliteral-in-string.patch \
            "
 SRC_URI[archive.md5sum] = "27fa902d4fdf6762ee010e7053aaf77b"
 SRC_URI[archive.sha256sum] = "9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b"
-- 
2.10.0


