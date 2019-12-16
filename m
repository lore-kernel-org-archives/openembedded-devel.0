Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5412A7F7D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 02:40:23 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id d71so2209280qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OcEpjxhGkRfi0Z7qzJVrVpJ8eg0u5dSMDD8wRlaj85k=;
	b=qjo7tVy3fdf3TjDLK6Xq7bymWRe8eXz0WNpfhm/T0HxZfpZT5Wm+mevHxieOoUXnw2
	Ua3wvrQk9N+qBZOxqOQhxfCW6CvzTa+LVc/jLk5yJRxW3nG3+3BRoRG+sDZzDN5S4Ylu
	XD7WAaupeSmFxdloKR+1RyvM1sAjDqem/FJwhcJTYF9l4onu78Qv2LA3zmajYZYgm4fL
	BqEzpRtXd2wl3Pc7F92uB3CF0OntcuDfWkrNT6Pkb89z/zeqxWfIv9LFF6ua+W99Wj69
	MnHPq3u2OffuSeLaQGgcCZi94pdiu6aEnIJoh0bU1WTZnZjGjOV8eOOzS+LuSS/saM38
	Yidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OcEpjxhGkRfi0Z7qzJVrVpJ8eg0u5dSMDD8wRlaj85k=;
	b=GWTJIGHeagG4YkVTfGRruvwp4iWoZyXzngbktnYImHvSrj9WRhAXheOVKkDySvZ7w5
	tKxIosAl9xkoqHbm/Jvlq75HgzChr7qeOxoiysNxQkmwfbdINBOyXuCfAisKbAEhDjtD
	H+uNE1FqYUKBTjqGay4/T6QQxTYrkdzRKHtVY8cFbdc3eyAgE7WNH7Bm2ddQeWen8Miy
	K+vhOIJ0uakAAPXIjaQOGt7nHx05S1I5BI3jbN/IofvlRoouaTwDPgDwQtKMd+cAF1o4
	P86GBoH14szCZGfVN7fo9qOnGY+7qog0ZZ5mr2Uy7+2mSnhD9Ul0E8tA9AvJeht7DZfI
	sSeQ==
X-Gm-Message-State: APjAAAVKaukBNnCAzFAAVCZNiJGXEqsIgeQTc09OF+LwsLy5wh9vNgGv
	4kIlZxCiyAt5hB5W1JP556l2vtEEklvfu2xpzpo=
X-Google-Smtp-Source: APXvYqwyvzSpAnEqJMnHCjqVKNXgX5upRQLxEGQN0XQNMTOsZpOWF2q8MEpyBfevKh5ljATKZ95ULvc9ivUkXYlPmIk=
X-Received: by 2002:a37:a3c7:: with SMTP id
	m190mr12853289qke.212.1576464023856; 
	Sun, 15 Dec 2019 18:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
	<20191216012047.17312-2-schnitzeltony@gmail.com>
In-Reply-To: <20191216012047.17312-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Dec 2019 18:40:13 -0800
Message-ID: <CAMKF1sovjsr-fNCivV2dNASX8JY24EScTAqRNHKZ2tYunaL2Lw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/6] glade3: remove ancient version of glade
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
X-List-Received-Date: Mon, 16 Dec 2019 02:40:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 5:21 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> * This was suggested already [1] but I complained that there is a use-cas=
e.
>   There are several workarounds possible for this so we don't need to kee=
p
>   it anymore.
> * glade3 popped into focus during preparations for python2 removal. So
> instead
>   of wasting time to keep unmaintained version just drop it
>
> [1]
> http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/19952=
3.html
>

I see forget my comment on previous patch then

>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...NTF-on-functions-with-format-strings.patch | 62 -------------------
>  ...-doc-utils.make-sysrooted-pkg-config.patch | 51 ---------------
>  .../glade/glade3/0002-fix-gcc-6-build.patch   | 39 ------------
>  .../recipes-devtools/glade/glade3_3.8.5.bb    | 23 -------
>  4 files changed, 175 deletions(-)
>  delete mode 100644
> meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functio=
ns-with-format-strings.patch
>  delete mode 100644
> meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysroot=
ed-pkg-config.patch
>  delete mode 100644
> meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
>  delete mode 100644 meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
>
> diff --git
> a/meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-funct=
ions-with-format-strings.patch
> b/meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-funct=
ions-with-format-strings.patch
> deleted file mode 100644
> index 03cb762ce..000000000
> ---
> a/meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-funct=
ions-with-format-strings.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From fcf29abe59607b5791f9de18ddb86b9ae3c9b7cc Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 26 Aug 2017 23:50:05 -0700
> -Subject: [PATCH] Add G_GNUC_PRINTF on functions with format strings
> -
> -This allows compilation with clang without errors, even when
> --Wformat-nonliteral is active (as long as there are no real cases of
> -non literal formatting).
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gladeui/glade-command.c | 4 ++--
> - gladeui/glade-utils.c   | 4 ++--
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/gladeui/glade-command.c b/gladeui/glade-command.c
> -index 9819766..4ac40ee 100644
> ---- a/gladeui/glade-command.c
> -+++ b/gladeui/glade-command.c
> -@@ -266,7 +266,7 @@ glade_command_collapse (GladeCommand  *command,
> -  *
> -  * Marks the begining of a group.
> -  */
> --void
> -+G_GNUC_PRINTF(1, 2) void
> - glade_command_push_group (const gchar *fmt, ...)
> - {
> -       va_list         args;
> -@@ -655,7 +655,7 @@ glade_command_set_properties_list (GladeProject
> *project, GList *props)
> -
> -       multiple =3D g_list_length (me->sdata) > 1;
> -       if (multiple)
> --              glade_command_push_group (cmd->description);
> -+              glade_command_push_group ("%s", cmd->description);
> -
> -
> -       glade_command_check_group (GLADE_COMMAND (me));
> -diff --git a/gladeui/glade-utils.c b/gladeui/glade-utils.c
> -index ae52501..c51ae59 100644
> ---- a/gladeui/glade-utils.c
> -+++ b/gladeui/glade-utils.c
> -@@ -197,7 +197,7 @@ glade_utils_get_pspec_from_funcname (const gchar
> *funcname)
> -  *          selected "OK", True if the @type was GLADE_UI_YES_OR_NO and
> -  *          the user selected "YES"; False otherwise.
> -  */
> --gint
> -+G_GNUC_PRINTF(4, 5) gint
> - glade_util_ui_message (GtkWidget           *parent,
> -                      GladeUIMessageType   type,
> -                      GtkWidget           *widget,
> -@@ -320,7 +320,7 @@ remove_message_timeout (FlashInfo * fi)
> -  *
> -  * Flash a temporary message on the statusbar.
> -  */
> --void
> -+G_GNUC_PRINTF(3, 4) void
> - glade_util_flash_message (GtkWidget *statusbar, guint context_id, gchar
> *format, ...)
> - {
> -       va_list args;
> ---
> -2.14.1
> -
> diff --git
> a/meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysro=
oted-pkg-config.patch
> b/meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysro=
oted-pkg-config.patch
> deleted file mode 100644
> index 1b24c39ce..000000000
> ---
> a/meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysro=
oted-pkg-config.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From aed002cd9ff9e8f972120fbac33b4a65aba952e1 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Tue, 25 Sep 2012 10:28:33 +0200
> -Subject: [PATCH] gnome-doc-utils.make: sysrooted pkg-config
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -same approach as used used in gnome-disk-utility:
> -
> -In cross environment we have to prepend the sysroot to the path found by
> -pkgconfig since the path returned from pkgconfig does not have sysroot
> prefixed
> -it ends up using the files from host system. Now usually people have
> gnome installed
> -so the build succeeds but if you dont have gnome installed on build host
> then
> -it wont find the files on host system and packages using gnome-doc-utils
> wont
> -compile.
> -
> -This should work ok with non sysrooted builds too since in those cases
> PKG_CONFIG_SYSROOT_DIR
> -will be empty
> -
> -Upstream-Status: pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - gnome-doc-utils.make |   10 +++++-----
> - 1 files changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/gnome-doc-utils.make b/gnome-doc-utils.make
> -index 42d9df3..f71bbfa 100644
> ---- a/gnome-doc-utils.make
> -+++ b/gnome-doc-utils.make
> -@@ -133,11 +133,11 @@ _DOC_ABS_SRCDIR =3D @abs_srcdir@
> - _xml2po ?=3D `which xml2po`
> - _xml2po_mode =3D $(if $(DOC_ID),mallard,docbook)
> -
> --_db2html ?=3D `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
> --_db2omf  ?=3D `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
> --_chunks  ?=3D `$(PKG_CONFIG) --variable xmldir
> gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
> --_credits ?=3D `$(PKG_CONFIG) --variable xmldir
> gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
> --_ids ?=3D $(shell $(PKG_CONFIG) --variable xmldir
> gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
> -+_db2html ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2htm=
l
> gnome-doc-utils`
> -+_db2omf  ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf
> gnome-doc-utils`
> -+_chunks  ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir
> gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
> -+_credits ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir
> gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
> -+_ids ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir
> gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
> -
> - if ENABLE_SK
> - _ENABLE_SK =3D true
> ---
> -1.7.6.5
> -
> diff --git
> a/meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
> b/meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
> deleted file mode 100644
> index f735ff819..000000000
> --- a/meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 5aa3d2abb905fa8594f6c6572a87809da54c9342 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Mon, 5 Sep 2016 11:25:27 +0200
> -Subject: [PATCH] fix gcc-6 build
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ----
> - gladeui/glade-editor-property.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/gladeui/glade-editor-property.c
> b/gladeui/glade-editor-property.c
> -index a0c1039..5e9ac38 100644
> ---- a/gladeui/glade-editor-property.c
> -+++ b/gladeui/glade-editor-property.c
> -@@ -2703,6 +2703,8 @@ glade_eprop_object_view (gboolean             radi=
o)
> - }
> -
> -
> -+#pragma GCC diagnostic push
> -+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
> - static gchar *
> - glade_eprop_object_dialog_title (GladeEditorProperty *eprop)
> - {
> -@@ -2731,6 +2733,7 @@ glade_eprop_object_dialog_title
> (GladeEditorProperty *eprop)
> -       return g_strdup_printf (format, g_type_name
> -                               (eprop->klass->pspec->value_type));
> - }
> -+#pragma GCC diagnostic pop
> -
> -
> - gboolean
> ---
> -2.5.5
> -
> diff --git a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
> b/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
> deleted file mode 100644
> index 24d0d901f..000000000
> --- a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "Glade - A User Interface Designer"
> -HOMEPAGE =3D "http://www.gnu.org/software/gnash"
> -LICENSE =3D "GPLv2 & LGPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabe87591cb8ae0f3c68be6977bb5=
522 \
> -
> file://COPYING.GPL;md5=3D9ac2e7cff1ddaf48b6eab6028f23ef88 \
> -
> file://COPYING.LGPL;md5=3D252890d9eee26aab7b432e8b8a616475"
> -DEPENDS =3D "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
> -
> -inherit features_check autotools pkgconfig pythonnative gtk-icon-cache
> -
> -REQUIRED_DISTRO_FEATURES =3D "x11"
> -
> -SRC_URI =3D "
> http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
> -           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
> -           file://0002-fix-gcc-6-build.patch \
> -
>  file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch \
> -           "
> -SRC_URI[md5sum] =3D "4e4b4f5ee34a03e017e4cef97d796c1f"
> -SRC_URI[sha256sum] =3D
> "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b6b2735"
> -
> -EXTRA_OECONF +=3D "--disable-scrollkeeper"
> -
> -FILES_${PN} +=3D "${datadir}/icons"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

