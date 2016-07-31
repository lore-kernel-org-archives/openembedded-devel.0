Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3C13160132
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 02:15:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so21136647wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jul 2016 19:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sAVa88PKcJ2ak4/0/yvQNIqUm+Hk/oQFU6zqCFFqKPs=;
	b=HDxQy+5sffTbAHu/0g28rkvKHc8+Gy4ci5gLx5JVF7DNcKBJbBYMV/8E4+vFDjkc3E
	Dka6m674yuQTTAKRvUmyjwERcoGWnh/X20swRPqYuPT/UvA1Tmmhpw80+QZT/Mj3sLTX
	rzyns66qUVTVuB6EJaRGJi8uXqwWWx0p6fVx73Y39Y0JmV8GBT9SuHbmU3cuGU0XHPJF
	rwgwKgTz0CFqTeqYR59jCHe6l1JKRZ+qwFUMJyNKzMiIh5O6c9Zw5h8zvrofNGOb+FT5
	B4owQZ/4oyMiirgRo3ivmwTvsPdlBadbvs2Nm8SC9I7mJJ4k9TgjpK0wDKXBdTRuM3Rg
	IIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sAVa88PKcJ2ak4/0/yvQNIqUm+Hk/oQFU6zqCFFqKPs=;
	b=AlhSWTcAHmKEhitZ/SxeOsbzLpBzY1llH/nPTu7H79EZaUHtyNdQC7hdnmiXbwPlyP
	IbjupD8ElseRM4YQ69pYr4CQIqOhTvJxfn62c1Nl+8HBr+oPPTQQaEMxbb7JpjD8juos
	d+U5TfCLMn5rT5rM7OJ7RSNSeU0mkhskxX+ltyvDKo5TMDbTxxOphGKlFiLmOm9pRZ9i
	JAL+ufywrRVqZOqsAOp7rUEZX1vtFL/g4P1Yuk53VRa3qkcOQZ9GkRi7BGpRTbtPMeVg
	XnMotaKQMlwDzN1ry19L9jQ2Z4r24pb4I0+sxL5m8YMu4r/Vz+gj7TTYGyu/d96fTbtE
	oMzQ==
X-Gm-Message-State: AEkooutsEY53oXKjSajwE2Gfb5JOWI7oN4Pei/PxVlJnqYDnLTK6+VsJ8CtsNyyLCsn1vA==
X-Received: by 10.194.242.228 with SMTP id wt4mr18999333wjc.127.1469931325885; 
	Sat, 30 Jul 2016 19:15:25 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0B1C.dip0.t-ipconnect.de.
	[91.10.11.28]) by smtp.googlemail.com with ESMTPSA id
	r16sm10078788wme.16.2016.07.30.19.15.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jul 2016 19:15:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jul 2016 04:15:00 +0200
Message-Id: <1469931304-13906-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/5] libgnomeui: update to 2.24.5 / fix build on gcc6 / cleanup
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
X-List-Received-Date: Sun, 31 Jul 2016 02:15:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ring-format-literal-warning-to-fix-build-.patch | 78 ++++++++++++++++++++++
 .../recipes-gnome/libgnome/libgnomeui_2.24.3.bb    | 10 ---
 .../{libgnomeui.inc => libgnomeui_2.24.5.bb}       | 11 ++-
 3 files changed, 86 insertions(+), 13 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-literal-warning-to-fix-build-.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
 rename meta-gnome/recipes-gnome/libgnome/{libgnomeui.inc => libgnomeui_2.24.5.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-literal-warning-to-fix-build-.patch b/meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-literal-warning-to-fix-build-.patch
new file mode 100644
index 0000000..abc9bdf
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui/0001-suppress-string-format-literal-warning-to-fix-build-.patch
@@ -0,0 +1,78 @@
+From 6697fcf9d7f53126b442bf19890640b5f88c8aa4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 29 Jul 2016 21:24:20 +0200
+Subject: [PATCH] suppress string format literal warning to fix build with gcc6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+works around:
+| ../../libgnomeui-2.24.5/libgnomeui/gnome-dateedit.c: In function 'day_selected':
+| ../../libgnomeui-2.24.5/libgnomeui/gnome-dateedit.c:156:9: error: format not a string literal, format string not checked [-Werror=format-nonliteral]
+|          strftime_date_format, &mtm) == 0)
+|          ^~~~~~~~~~~~~~~~~~~~
+| ../../libgnomeui-2.24.5/libgnomeui/gnome-dateedit.c: In function 'gnome_date_edit_set_time':
+| ../../libgnomeui-2.24.5/libgnomeui/gnome-dateedit.c:704:2: error: format not a string literal, format string not checked [-Werror=format-nonliteral]
+|   if (strftime (buffer, sizeof (buffer), strftime_date_format, mytm) == 0)
+|   ^~
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ libgnomeui/gnome-dateedit.c | 6 ++++++
+ libgnomeui/gnome-gconf-ui.c | 3 +++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/libgnomeui/gnome-dateedit.c b/libgnomeui/gnome-dateedit.c
+index 69ab699..41541c3 100644
+--- a/libgnomeui/gnome-dateedit.c
++++ b/libgnomeui/gnome-dateedit.c
+@@ -152,9 +152,12 @@ day_selected (GtkCalendar *calendar, GnomeDateEdit *gde)
+ 	else
+ 		mtm.tm_year = year;
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	if (strftime (buffer, sizeof (buffer),
+ 		      strftime_date_format, &mtm) == 0)
+ 		strcpy (buffer, "???");
++#pragma GCC diagnostic pop
+ 	buffer[sizeof(buffer)-1] = '\0';
+ 
+ 	/* FIXME: what about set time */
+@@ -701,8 +704,11 @@ gnome_date_edit_set_time (GnomeDateEdit *gde, time_t the_time)
+ 	mytm = localtime (&the_time);
+ 
+ 	/* Set the date */
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ 	if (strftime (buffer, sizeof (buffer), strftime_date_format, mytm) == 0)
+ 		strcpy (buffer, "???");
++#pragma GCC diagnostic pop
+ 	buffer[sizeof(buffer)-1] = '\0';
+ 
+ 	str_utf8 = g_locale_to_utf8 (buffer, -1, NULL, NULL, NULL);
+diff --git a/libgnomeui/gnome-gconf-ui.c b/libgnomeui/gnome-gconf-ui.c
+index 43c0f44..a84b2c0 100644
+--- a/libgnomeui/gnome-gconf-ui.c
++++ b/libgnomeui/gnome-gconf-ui.c
+@@ -180,12 +180,15 @@ error_idle_func (gpointer data)
+                                 "configuration settings may not work properly.");
+                 }
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+                 dialog = gtk_message_dialog_new (NULL /* parent */,
+                                                  0 /* flags */,
+                                                  GTK_MESSAGE_ERROR,
+                                                  GTK_BUTTONS_OK,
+                                                  fmt,
+                                                  gnome_program_get_human_readable_name(gnome_program_get()));
++#pragma GCC diagnostic pop
+                 gtk_dialog_set_default_response (GTK_DIALOG (dialog), GTK_RESPONSE_OK);
+                 g_signal_connect (dialog, "response",
+                                   G_CALLBACK (gtk_widget_destroy),
+-- 
+2.5.5
+
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
deleted file mode 100644
index 3208a81..0000000
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require libgnomeui.inc
-
-PR = "r1"
-
-SRC_URI[archive.md5sum] = "ceab6f4370581d1a03c09f15cc103099"
-SRC_URI[archive.sha256sum] = "04c81f3bb5a337cdf3ed1230916f82d29857ee95eb884f58dd2f5c6860efe803"
-GNOME_COMPRESS_TYPE="bz2"
-
-# http://errors.yoctoproject.org/Errors/Details/68607/
-PNBLACKLIST[libgnomeui] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
rename to meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
index 26997b8..b94f3da 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui.inc
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb
@@ -12,13 +12,18 @@ FILES_${PN} += "${libdir}/gtk-2.0/*/filesystems/lib*.so \
                 ${datadir}/pixmaps/gnome-about-logo.png"
 FILES_${PN}-dev += "${libdir}/gtk-2.0/*/filesystems/*.la ${libdir}/gtk-2.0/*/filesystems/*.a ${libdir}/libglade/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/libglade/*/*.a"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/filesystems/.debug/ ${libdir}/libglade/*/.debug/"
 
-SRC_URI += "file://gnome-stock-pixbufs.h file://no-pixbuf-csource.patch"
+SRC_URI += " \
+    file://0001-suppress-string-format-literal-warning-to-fix-build-.patch \
+    file://gnome-stock-pixbufs.h \
+    file://no-pixbuf-csource.patch \
+"
+SRC_URI[archive.md5sum] = "d4bb506b1916015323928faab5aa708b"
+SRC_URI[archive.sha256sum] = "ae352f2495889e65524c979932c909f4629a58e64290fb0c95333373225d3c0f"
+GNOME_COMPRESS_TYPE="bz2"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
 do_configure_prepend() {
     install -m 0644 ${WORKDIR}/gnome-stock-pixbufs.h ${S}/libgnomeui/pixmaps/gnome-stock-pixbufs.h
 }
-
-- 
2.5.5


