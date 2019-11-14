Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 29F3E7F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b18so6548987wrj.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=q5kTkOB4seuVk3tcQJG290SIFIUtSU7on+nLLOkx6wQ=;
	b=km4Sf1kpyCBvRjYGUIKFi6ABy/1Q4LEFIipx6TqZQUkJpkkyY4BP9+3F50FLcBIpdC
	5wY2p3W+uiFZweePevzcS4mKbQgmGO94TlJhepI6zLZ4dVuXDfgPSnlAxJIODyiobPfT
	JrEDt9fj/Rz9+cf+zGgWQ0uGczjc4BbMyhIiI4BcXnAh3mXclNjrwAgDIFIO+mhrRXze
	b5snbuVNYcYVAGEBgGvx+S+w2EPqEp0TlBtOYLYj+sav8TR9xEIbEmABlOrINYASRxSI
	UVUCZhHvK5k5ia4CDeB4sj9NFvwfiAmFZFya6ld9d45ptWcaLEzwj+18+PDs5nqXv+Ci
	IzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=q5kTkOB4seuVk3tcQJG290SIFIUtSU7on+nLLOkx6wQ=;
	b=DGs4MKNQvcRFJHXflGFn/AvwxPPt63GxjX4syf6U8xeyD4uFrQGq+xdE3dFCwQhO9f
	4Ozdtt1sfee8aKl7D4ghjH33BZJo6pQqFrT6dJedZ9xWblYFhEcIRkW1cXZbh7+nx3bP
	ZLOJQSb142/r1SZ1TrtDJbvpwDvOqINDWee0gfDCUZOuK5Tp0ISzj+dCmzDK2tvBc4me
	Pi6APOKgXDr3+I18clluoWkpGieShKeQvYYiC0jj2mQM+aQrPsSqqocpH5RMPWApW0TT
	A02PTShhXx+ZwRkz7Ay5nA4gyVVDQW0yYO+XfNc5Y2UMpbkp4dgmWBOdp0MzIRpNoJ/l
	n0/A==
X-Gm-Message-State: APjAAAV6fDAxwI6o78V3Jk54evIK7rNUrFnSp/rhynPXw5dMDErXrbpq
	v75pmIfxcHT9tENsRLEX3S1xxaSh
X-Google-Smtp-Source: APXvYqxSEJJlTY57Eyrvj4LC8yr24FNe3rO1RDY9PeuGNpRAsYeHD/q/jQ3FQzvCEMWC0j1PvaCcNQ==
X-Received: by 2002:a5d:448a:: with SMTP id j10mr415559wrq.79.1573760980112;
	Thu, 14 Nov 2019 11:49:40 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:15 +0100
Message-Id: <20191114194930.2786-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/16] gedit: upgrade 2.30.4 -> 3.34.0
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* rewrite from scratch and get rid of this dinosaur
* for those (like me) not happy with immediate search on weak machines: check
xfce's mousepad
* first use-case for gnome-help.bbclass
* add upstream-version-is-even

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...001-Remove-help-directory-from-build.patch | 29 ----------
 ...ify-handle_builder_error-with-format.patch | 31 ----------
 ...aver.c-Define-ACCESSPERMS-if-not-def.patch | 31 ----------
 ...1-workaround-void-pointer-arithmetic.patch | 57 -------------------
 ...format-literal-warning-to-fix-build-.patch | 38 -------------
 .../recipes-gnome/gedit/gedit_2.30.4.bb       | 33 -----------
 .../recipes-gnome/gedit/gedit_3.34.0.bb       | 44 ++++++++++++++
 7 files changed, 44 insertions(+), 219 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch
 delete mode 100644 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
 create mode 100644 meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb

diff --git a/meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch b/meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch
deleted file mode 100644
index 4ad57effe..000000000
--- a/meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 1d2e6165e3154e27ecde329a40c05f0880afb9e0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 17 May 2016 14:14:03 +0300
-Subject: [PATCH] Remove help directory from build
-
-It hardcodes the use of xml2po utility, which is provided by obsolete gnome-doc-utils
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Makefile.am | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e57b203..a88152d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,9 +3,6 @@ ACLOCAL_AMFLAGS = -I m4
- 
- SUBDIRS = gedit pixmaps po data plugin-loaders plugins docs tests win32 osx
- 
--if !OS_OSX
--SUBDIRS += help
--endif
- 
- distuninstallcheck_listfiles = find . -type f -print | grep -v scrollkeeper
- 
--- 
-2.8.1
-
diff --git a/meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch b/meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch
deleted file mode 100644
index 4885c4511..000000000
--- a/meta-gnome/recipes-gnome/gedit/files/0001-gedit-utils-qualify-handle_builder_error-with-format.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 623ffac1f6e7725041b386e0f2933fe36809b5a9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Aug 2017 09:04:30 -0700
-Subject: [PATCH] gedit-utils: qualify handle_builder_error() with format
- string parameters
-
-gedit-utils.c:1063:32: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
-        msg_plain = g_strdup_vprintf (message, args);
-                                      ^~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gedit/gedit-utils.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gedit/gedit-utils.c b/gedit/gedit-utils.c
-index 41a5afd..c800828 100644
---- a/gedit/gedit-utils.c
-+++ b/gedit/gedit-utils.c
-@@ -1051,7 +1051,7 @@ gedit_utils_is_valid_uri (const gchar *uri)
- 	return TRUE;
- }
- 
--static GtkWidget *
-+static G_GNUC_PRINTF(1, 2) GtkWidget *
- handle_builder_error (const gchar *message, ...)
- {
- 	GtkWidget *label;
--- 
-2.14.1
-
diff --git a/meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch b/meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch
deleted file mode 100644
index 11afe75ce..000000000
--- a/meta-gnome/recipes-gnome/gedit/files/0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ee43bcc3c8d69fe56a64c3487e2d3c780ea5d25e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 06:53:35 -0700
-Subject: [PATCH] tests/document-saver.c: Define ACCESSPERMS if not defined
- already
-
-Helps compile with musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/document-saver.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/tests/document-saver.c b/tests/document-saver.c
-index 9f44d5a..811ade6 100644
---- a/tests/document-saver.c
-+++ b/tests/document-saver.c
-@@ -41,6 +41,10 @@
- #define UNOWNED_GROUP_LOCAL_URI "/tmp/gedit-document-saver-unowned-group.txt"
- #define UNOWNED_GROUP_REMOTE_URI "sftp://localhost/tmp/gedit-document-saver-unowned-group.txt"
- 
-+#if !defined(ACCESSPERMS)
-+#define ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO) /* 0777 */
-+#endif
-+
- static gboolean test_completed;
- static gboolean mount_completed;
- static gboolean mount_success;
--- 
-2.13.2
-
diff --git a/meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch b/meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch
deleted file mode 100644
index a28808b8d..000000000
--- a/meta-gnome/recipes-gnome/gedit/files/0001-workaround-void-pointer-arithmetic.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 8e0cbfac142d38320dd02416601e14c65585cd17 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sat, 9 Mar 2013 12:47:06 +0100
-Subject: [PATCH] workaround void pointer arithmetic
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fixes errors like:
-error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- gedit/gedit-document-input-stream.c   |    4 ++--
- gedit/gedit-smart-charset-converter.c |    2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/gedit/gedit-document-input-stream.c b/gedit/gedit-document-input-stream.c
-index 5a1f961..38316e7 100644
---- a/gedit/gedit-document-input-stream.c
-+++ b/gedit/gedit-document-input-stream.c
-@@ -426,7 +426,7 @@ gedit_document_input_stream_read (GInputStream  *stream,
- 
- 	do
- 	{
--		n = read_line (dstream, buffer + read, space_left);
-+		n = read_line (dstream, ((char*)buffer) + read, space_left);
- 		read += n;
- 		space_left -= n;
- 	} while (space_left > 0 && n != 0 && dstream->priv->bytes_partial == 0);
-@@ -451,7 +451,7 @@ gedit_document_input_stream_read (GInputStream  *stream,
- 
- 			newline = get_new_line (dstream);
- 
--			memcpy (buffer + read, newline, newline_size);
-+			memcpy (((char*)buffer) + read, newline, newline_size);
- 
- 			read += newline_size;
- 			dstream->priv->newline_added = TRUE;
-diff --git a/gedit/gedit-smart-charset-converter.c b/gedit/gedit-smart-charset-converter.c
-index e32b0b1..6745ce3 100644
---- a/gedit/gedit-smart-charset-converter.c
-+++ b/gedit/gedit-smart-charset-converter.c
-@@ -153,7 +153,7 @@ try_convert (GCharsetConverter *converter,
- 	do
- 	{
- 		res = g_converter_convert (G_CONVERTER (converter),
--		                           inbuf + nread,
-+		                           ((const char*)inbuf) + nread,
- 		                           inbuf_size - nread,
- 		                           out + nwritten,
- 		                           out_size - nwritten,
--- 
-1.7.4.4
-
diff --git a/meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch b/meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch
deleted file mode 100644
index a5d231012..000000000
--- a/meta-gnome/recipes-gnome/gedit/files/0002-suppress-string-format-literal-warning-to-fix-build-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4ebdf8023f763f75a7e1b548894de2e8b784f4a8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 29 Jul 2016 23:19:40 +0200
-Subject: [PATCH] suppress string format literal warning to fix build with gcc6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- plugins/time/gedit-time-plugin.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/plugins/time/gedit-time-plugin.c b/plugins/time/gedit-time-plugin.c
-index d2ffdb9..441d9f9 100644
---- a/plugins/time/gedit-time-plugin.c
-+++ b/plugins/time/gedit-time-plugin.c
-@@ -473,12 +473,15 @@ get_time (const gchar* format)
-   	clock = time (NULL);
-   	now = localtime (&clock);
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- 	do
- 	{
- 		out_length += 255;
- 		out = g_realloc (out, out_length);
- 	}
-   	while (strftime (out, out_length, locale_format, now) == 0);
-+#pragma GCC diagnostic pop
- 
- 	g_free (locale_format);
- 
--- 
-2.5.5
-
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
deleted file mode 100644
index 6e0720888..000000000
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "GNOME editor"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2+"
-PR = "r2"
-
-DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 glib-2.0-native gtk+ \
-           gtksourceview2 iso-codes intltool-native gnome-common-native \
-           libice python3-six-native"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit distro_features_check gnomebase gconf gettext python3native
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-           file://0001-workaround-void-pointer-arithmetic.patch \
-           file://0001-Remove-help-directory-from-build.patch \
-           file://0002-suppress-string-format-literal-warning-to-fix-build-.patch \
-           file://0001-tests-document-saver.c-Define-ACCESSPERMS-if-not-def.patch \
-           file://0001-gedit-utils-qualify-handle_builder_error-with-format.patch \
-           "
-SRC_URI[archive.md5sum] = "e1eecb0a92a1a363b3d375ec5ac0fb3b"
-SRC_URI[archive.sha256sum] = "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
-GNOME_COMPRESS_TYPE="bz2"
-
-EXTRA_OECONF = "--disable-scrollkeeper \
-                --enable-gvfs-metadata"
-
-LDFLAGS += "-lgmodule-2.0 -lICE"
-
-FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
-FILES_${PN}-dbg += "${libdir}/gedit-2/plugin-loaders/.debug ${libdir}/gedit-2/plugins/.debug"
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb
new file mode 100644
index 000000000..9679a1ce6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb
@@ -0,0 +1,44 @@
+SUMMARY = "GNOME editor"
+SECTION = "x11/gnome"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+DEPENDS = " \
+    yelp-tools-native \
+    libxml2-native \
+    gdk-pixbuf-native \
+    iso-codes \
+    gtk+3 \
+    gsettings-desktop-schemas \
+    gtksourceview4 \
+    libpeas \
+    libsoup-2.4 \
+    gspell \
+    gtksourceview4 \
+"
+
+inherit gnomebase itstool gnome-help gobject-introspection gtk-doc vala gettext distro_features_check upstream-version-is-even
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "ec6632fa73d9ea6c817e74a98d16eab6"
+SRC_URI[archive.sha256sum] = "3e95e51d3ccb495a9ac95aa3ed7fe8fe37ccde7c678f37fa3cea684bc71d507e"
+
+GTKDOC_MESON_OPTION = "documentation"
+
+PACKAGECONFIG ??= "gvfs"
+PACKAGECONFIG[gvfs] = "-Denable-gvfs-metadata=yes,-Denable-gvfs-metadata=no,,gvfs"
+
+PACKAGES += "${PN}-python"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+"
+
+FILES_${PN}-python += " \
+    ${PYTHON_SITEPACKAGES_DIR} \
+"
+
-- 
2.21.0


