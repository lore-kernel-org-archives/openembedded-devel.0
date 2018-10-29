Return-Path: <brendank310@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 494937965D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:42 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id r71so5328466qkr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=43sfUAgy7fwpW9X6wqcUSgVjUNnQRplEHyxtd8e+8Xw=;
	b=LdMoQ1I48hEfweyXSjJmb2bEcW1ChBWDtOg5G5hHqiLmDPaampk++7v4Mf10I/dcIE
	XjrdUpgCJjy0A5sFJK3iWJp9gf/LthaXTDyY/fN6/YecGP7ioTp5ZZf4DrVRRICASQ3y
	OAp9C+/vLcSX7KwI6sLvjdJ19N6SXWn9iakKZNleU1VZhcSnz5HowVmhmWDhp6fKq8CM
	w08YxL1F1ELd5+xt/m0iUbXxQMDDmXu5oJ+rQoSRLwFrq1/Y2NdGHEDHRvZKHSlNC7QR
	4FlHNk7bTCEd4/Gbjuj6lNjdcZt9ZFs6+YQbN8Ds0suN2wGpYHWkTETFm7IRMXMbJSKJ
	l8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=43sfUAgy7fwpW9X6wqcUSgVjUNnQRplEHyxtd8e+8Xw=;
	b=mY57pTM7P113QLe0ocQt6LC8EbcmbmvJxDmFCw2QySm4W65IReeaNuWea04cZXy45v
	G/ygyKVf4GDH2iDryeXkrjoXm4rzGGlG9s/UiBHJA7l0NTqfkszcBfH7D8o0BYfQivaw
	ueg2cLH3+JCHtxfexA4OxGLEhu0jzOPmFmOKIr1MHwYz38QQsL15wjheTo26OlZkwRfC
	kWdLDDydkUQjW4TBdmz5aCcP3Q1mdHcOMWXxWV9EHw+TD1AxA5ViBvt2l/SgYFf+CXHx
	pLGkO9cc/MvEY0LAn83m9f7kloSqZ/mIez/Ww6fc0CHBnLpwGYBfqgfPbKZh7QfGB9xd
	H/WA==
X-Gm-Message-State: AGRZ1gJmxg4IlOP4pmWXDzJQPqncf7TR+msHXb1f3z5trWhFPXDlmNCX
	t6Img4lcqP3v1lg3Vs81JQZYtTDm
X-Google-Smtp-Source: AJdET5e+6x1+guLwx/waAWkCW0Ib5toBN+atqmueMEzP2Xy0REwELblL424pQibWT2hChA3BrjrCWA==
X-Received: by 2002:a37:268b:: with SMTP id m11mr4559261qkm.131.1540831302911; 
	Mon, 29 Oct 2018 09:41:42 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:41 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:40:59 -0400
Message-Id: <ad2a3fd59975f2af76a55c6c480bbbbc4855f49a.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 02/16] ibus: add recipe for ibus to support gnome-settings-daemon and gnome-shell
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:42 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../ibus/0001-strip-out-dbus-build-dep.patch  | 29 ++++++++++++
 ...0002-decorate-automake-for-valaflags.patch | 46 +++++++++++++++++++
 .../recipes-gnome/gnome3/ibus_1.5.19.bb       | 41 +++++++++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch b/meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch
new file mode 100644
index 000000000..43197615d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/ibus/0001-strip-out-dbus-build-dep.patch
@@ -0,0 +1,29 @@
+ibus: Don't run dbus tests within the build.
+
+  Prevent a test requiring spawning a dbus session from running
+  during the build.
+
+  Upstream-status: Inappropriate [disable-feature]
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>   
+
+diff --git a/data/dconf/make-dconf-override-db.sh b/data/dconf/make-dconf-override-db.sh
+index 9c650e9..d7320c3 100755
+--- a/data/dconf/make-dconf-override-db.sh
++++ b/data/dconf/make-dconf-override-db.sh
+@@ -12,10 +12,6 @@ export XDG_CACHE_HOME="$TMPDIR/cache"
+ export GSETTINGS_SCHEMA_DIR="$TMPDIR/schemas"
+ mkdir -p $XDG_CONFIG_HOME $XDG_CACHE_HOME $GSETTINGS_SCHEMA_DIR
+ 
+-eval `dbus-launch --sh-syntax`
+-
+-trap 'rm -rf $TMPDIR; kill $DBUS_SESSION_BUS_PID' ERR
+-
+ # in case that schema is not installed on the system
+ glib-compile-schemas --targetdir "$GSETTINGS_SCHEMA_DIR" "$PWD"
+ 
+@@ -47,4 +43,3 @@ done
+ 
+ rm -rf $TMPDIR
+ 
+-kill $DBUS_SESSION_BUS_PID
diff --git a/meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch b/meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch
new file mode 100644
index 000000000..b15fec1d4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/ibus/0002-decorate-automake-for-valaflags.patch
@@ -0,0 +1,46 @@
+ibus: Add automake decorations to sed in appropriate paths
+
+  Multiple vapidir paths are required to build ibus correctly,
+  so decorations are added to the automake files to allow for
+  sed'ing the appropriate path during do_configure_prepend.
+
+  Upstream-status: Inappropriate [configuration]
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
+diff --git a/engine/Makefile.am b/engine/Makefile.am
+index 86f0e2b..7e922b5 100644
+--- a/engine/Makefile.am
++++ b/engine/Makefile.am
+@@ -53,6 +53,7 @@ AM_VALAFLAGS = \
+ 	--vapidir=$(top_builddir)/bindings/vala \
+ 	--pkg=ibus-1.0 \
+ 	--target-glib="$(VALA_TARGET_GLIB_VERSION)" \
++	@EXTRA_AM_VALAFLAGS@ \
+ 	$(NULL)
+ 
+ libexec_PROGRAMS = \
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 5c18d3d..fe727c1 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -61,6 +61,7 @@ AM_VALAFLAGS = \
+ 	--pkg=posix \
+ 	--pkg=config \
+ 	--target-glib="$(VALA_TARGET_GLIB_VERSION)" \
++	@EXTRA_AM_VALAFLAGS@ \
+ 	$(NULL)
+ 
+ bin_PROGRAMS = ibus
+diff --git a/ui/gtk3/Makefile.am b/ui/gtk3/Makefile.am
+index aaba7a4..ba48175 100644
+--- a/ui/gtk3/Makefile.am
++++ b/ui/gtk3/Makefile.am
+@@ -80,6 +80,7 @@ AM_VALAFLAGS = \
+ 	--pkg=xi \
+ 	--pkg=gdk-wayland \
+ 	--target-glib="$(VALA_TARGET_GLIB_VERSION)" \
++	@EXTRA_AM_VALAFLAGS@ \
+ 	$(NULL)
+ 
+ if ENABLE_LIBNOTIFY
diff --git a/meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb b/meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb
new file mode 100644
index 000000000..ce609fda0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/ibus_1.5.19.bb
@@ -0,0 +1,41 @@
+DESCRIPTION = "Intelligent Input Bus for Linux/Unix"
+LICENSE = "LGPLv2.1"
+DEPENDS = "prelink \
+           glib-2.0 \
+           gsettings-desktop-schemas \
+           json-glib \
+           gnome-desktop3 \
+           gettext-native \
+           intltool-native \
+           dconf \
+           libnotify \
+           gconf-native \
+           gtk+ \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+
+SRC_URI = " \
+           https://github.com/ibus/ibus/releases/download/${PV}/${PN}-${PV}.tar.gz \
+           file://0001-strip-out-dbus-build-dep.patch \
+           file://0002-decorate-automake-for-valaflags.patch \
+          "
+
+SRC_URI[md5sum] = "a2be6f200dd9ada2501474a6877a73ef"
+SRC_URI[sha256sum] = "4b66c798dab093f0fa738e5c10688d395a463287d13678c208a81051af5d2429"
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools pkgconfig gtk-doc distro_features_check vala gobject-introspection 
+
+FILES_${PN} += "${datadir}"
+FILES_${PN} += "${libdir}"
+
+EXTRA_OECONF += " --disable-emoji-dict --disable-unicode-dict --disable-tests "
+
+do_configure_prepend() {
+	touch ${S}/ChangeLog
+	sed -i "s^@EXTRA_AM_VALAFLAGS@^--vapidir=${RECIPE_SYSROOT_NATIVE}${datadir}/vala-0.38/vapi --vapidir=${B}/bindings/vala --pkg gio-2.0^g" ${S}/tools/Makefile.am
+	sed -i "s^@EXTRA_AM_VALAFLAGS@^--vapidir=${RECIPE_SYSROOT_NATIVE}${datadir}/vala-0.38/vapi --vapidir=${B}/bindings/vala --pkg gio-2.0^g" ${S}/engine/Makefile.am
+	sed -i "s^@EXTRA_AM_VALAFLAGS@^--vapidir=${RECIPE_SYSROOT_NATIVE}${datadir}/vala-0.38/vapi --vapidir=${B}/bindings/vala --pkg gio-2.0^g" ${S}/ui/gtk3/Makefile.am
+}
+
-- 
2.17.1


