Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2D51179C7F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:42:32 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id l9-v6so11916447qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 20:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a828FHpm64Ep+BgHF3mUMN33bfok+JWL6trHZuG3K88=;
	b=X/H3FZvDunWeKUP/fTN1BGwxP8GW2Ts6dovPgpZ7THvSt3X9Xtu6nf9fHepYFKHGiD
	SaGGr0DQAVj7hxlAnZ/98SuQoGdEJ0OUwdj3FwiPqQzXbn96Z5FF6pYMxGNgD1mFZ5yr
	rGwxmOHCva+ivT3ayoqhpu/uwEjSg3SCsvJoBP8vXBmNGUCwnLdqREu0kqXdECRMt5zn
	tYMX2gttyreXR1tofiFMeA7swiQOaFVYwSj0TNCO/fLDfH0VH6lrtWV/UAO5nbD8Bisg
	aw2OEBKDOoQ0/lKyTKnbn0IqgmVasXM2fza1sh4fRfpYi+w+wtSq/UMAM237OqzUun0R
	Ja0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a828FHpm64Ep+BgHF3mUMN33bfok+JWL6trHZuG3K88=;
	b=kb6eTKqnVywhwzLokxRJSECpEom97Ov299GNDFfp6qmB1/PvNYPexjY8lYPR65YamZ
	1CaaX3tSJIneAUQrdg9yMmb6c3788/T4jaNhGiu2/RkuoBIigq/h6gYkulOBPo+2/84O
	bEEGa92wZ0DOz2+Rji7+d7fEewaTNtU7AxalreJOiZPwHuPhNQkCdJ9ya2RS7NWt4GcD
	M5LEnu/8ju5SaYNF44Bc+giPNhFkg6j7CZWC/I0uhwM7YcDBmR9IuirlB7vG9WnxjpOM
	YISIPWJl4rQs4lth7Gr/cHucdw2JjzfZfsgJmWNrUXTjyWRCDlBZB/Sni0LfH6EwZfRj
	9bLQ==
X-Gm-Message-State: AGRZ1gI5QyP3rZmHlOUXs0y+4ZkiAZAs7ustN7Y+ogJw0RImDDqeM03K
	H+lez1aeEley6pmHDxm7aS6hdZH177srXgW/NII=
X-Google-Smtp-Source: AJdET5dqH0Awir5prMrgD0ge+U9lqD1/5pIZcvkTluoFoMvIZ9t34MsUJ0qclcFbWmnHGNaBLp6KLSvCQVM67j6MVBM=
X-Received: by 2002:a0c:ad47:: with SMTP id v7mr15520218qvc.228.1540870952814; 
	Mon, 29 Oct 2018 20:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
In-Reply-To: <ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 19:38:59 -0700
Message-ID: <CAMKF1sodEaHcBapn86KNMuVL6kauhC=NYNmDN0rQCb4LF3MgEg@mail.gmail.com>
To: brendank310 <brendank310@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: schnitzeltony@googlemail.com, openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 02/16] ibus: add recipe for ibus to support gnome-settings-daemon and gnome-shell
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
X-List-Received-Date: Tue, 30 Oct 2018 03:42:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 9:41 AM brendank310 <brendank310@gmail.com> wrote:

> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../ibus/0001-strip-out-dbus-build-dep.patch  | 29 ++++++++++++
>  ...0002-decorate-automake-for-valaflags.patch | 46 +++++++++++++++++++
>  .../recipes-gnome/gnome3/ibus_1.5.19.bb       | 41 +++++++++++++++++
>  3 files changed, 116 insertions(+)
>  create mode 100644
> meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch
>  create mode 100644
> meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb
>
> diff --git
> a/meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch
> b/meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch
> new file mode 100644
> index 000000000..43197615d
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch
> @@ -0,0 +1,29 @@
> +ibus: Don't run dbus tests within the build.
> +
> +  Prevent a test requiring spawning a dbus session from running
> +  during the build.
> +
> +  Upstream-status: Inappropriate [disable-feature]
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/data/dconf/make-dconf-override-db.sh
> b/data/dconf/make-dconf-override-db.sh
> +index 9c650e9..d7320c3 100755
> +--- a/data/dconf/make-dconf-override-db.sh
> ++++ b/data/dconf/make-dconf-override-db.sh
> +@@ -12,10 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
> + export GSETTINGS_SCHEMA_DIR="$TMPDIR/schemas"
> + mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
> +
> +-eval `dbus-launch --sh-syntax`
> +-
> +-trap 'rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID' ERR
> +-
> + # in case that schema is not installed on the system
> + glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
> +
> +@@ -47,4 +43,3 @@ done
> +
> + rm -rf $TMPDIR
> +
> +-kill $DBUS_SESSION_BUS_PID
> diff --git
> a/meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch
> b/meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch
> new file mode 100644
> index 000000000..b15fec1d4
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch
> @@ -0,0 +1,46 @@
> +ibus: Add automake decorations to sed in appropriate paths
> +
> +  Multiple vapidir paths are required to build ibus correctly,
> +  so decorations are added to the automake files to allow for
> +  sed'ing the appropriate path during do_configure_prepend.
> +
> +  Upstream-status: Inappropriate [configuration]
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/engine/Makefile.am b/engine/Makefile.am
> +index 86f0e2b..7e922b5 100644
> +--- a/engine/Makefile.am
> ++++ b/engine/Makefile.am
> +@@ -53,6 +53,7 @@ AM_VALAFLAGS = \
> +       --vapidir=$(top_builddir)/bindings/vala \
> +       --pkg=ibus-1.0 \
> +       --target-glib="$(VALA_TARGET_GLIB_VERSION)" \
> ++      @EXTRA_AM_VALAFLAGS@ \
> +       $(NULL)
> +
> + libexec_PROGRAMS = \
> +diff --git a/tools/Makefile.am b/tools/Makefile.am
> +index 5c18d3d..fe727c1 100644
> +--- a/tools/Makefile.am
> ++++ b/tools/Makefile.am
> +@@ -61,6 +61,7 @@ AM_VALAFLAGS = \
> +       --pkg=posix \
> +       --pkg=config \
> +       --target-glib="$(VALA_TARGET_GLIB_VERSION)" \
> ++      @EXTRA_AM_VALAFLAGS@ \
> +       $(NULL)
> +
> + bin_PROGRAMS = ibus
> +diff --git a/ui/gtk3/Makefile.am b/ui/gtk3/Makefile.am
> +index aaba7a4..ba48175 100644
> +--- a/ui/gtk3/Makefile.am
> ++++ b/ui/gtk3/Makefile.am
> +@@ -80,6 +80,7 @@ AM_VALAFLAGS = \
> +       --pkg=xi \
> +       --pkg=gdk-wayland \
> +       --target-glib="$(VALA_TARGET_GLIB_VERSION)" \
> ++      @EXTRA_AM_VALAFLAGS@ \
> +       $(NULL)
> +
> + if ENABLE_LIBNOTIFY
> diff --git a/meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb
> b/meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb
> new file mode 100644
> index 000000000..ce609fda0
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb
> @@ -0,0 +1,41 @@
> +DESCRIPTION = "Intelligent Input Bus for Linux/Unix"
> +LICENSE = "LGPLv2.1"
> +DEPENDS = "

prelink \
> +           glib-2.0 \


Depndending on prelink seems interesting
Can you describe what does it do here since prelink is a distro feature I
would prefer this to be controlled by that knob

>
> +           gsettings-desktop-schemas \
> +           json-glib \
> +           gnome-desktop3 \
> +           gettext-native \


Can we inherit gettext for this ?

>
> +           intltool-native \
> +           dconf \
> +           libnotify \
> +           gconf-native \
> +           gtk+ \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> +
> +SRC_URI = " \
> +
> https://github.com/ibus/ibus/releases/download/${PV}/${PN}-${PV}.tar.gz \
> +           file://0001-strip-out-dbus-build-dep.patch \
> +           file://0002-decorate-automake-for-valaflags.patch \
> +          "
> +
> +SRC_URI[md5sum] = "a2be6f200dd9ada2501474a6877a73ef"
> +SRC_URI[sha256sum] =
> "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429"
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools pkgconfig gtk-doc distro_features_check vala
> gobject-introspection
> +
> +FILES_${PN} += "${datadir}"
> +FILES_${PN} += "${libdir}"
> +
> +EXTRA_OECONF += " --disable-emoji-dict --disable-unicode-dict
> --disable-tests "
> +
> +do_configure_prepend() {
> +       touch ${S}/ChangeLog
> +       sed -i "s^@EXTRA_AM_VALAFLAGS@^--vapidir=${RECIPE_SYSROOT_NATIVE}${datadir}/vala-0.38/vapi
> --vapidir=${B}/bindings/vala --pkg gio-2.0^g" ${S}/tools/Makefile.am
> +       sed -i "s^@EXTRA_AM_VALAFLAGS@^--vapidir=${RECIPE_SYSROOT_NATIVE}${datadir}/vala-0.38/vapi
> --vapidir=${B}/bindings/vala --pkg gio-2.0^g" ${S}/engine/Makefile.am
> +       sed -i "s^@EXTRA_AM_VALAFLAGS@^--vapidir=${RECIPE_SYSROOT_NATIVE}${datadir}/vala-0.38/vapi
> --vapidir=${B}/bindings/vala --pkg gio-2.0^g" ${S}/ui/gtk3/Makefile.am
> +}
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

