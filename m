Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3C81D6C0ED
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 09:02:25 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w14so9311003qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Sep 2019 02:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RMvyxRplJWwN/bkui0FI+UpKh8vFtNBDbXYwj+ebayg=;
	b=aQJtkYGv0x0KYRy928m2+DQFQ4xsHmmcby/m6Jev2cCFlOccihZFII1KxdEOWedxnF
	X8VT3DVSzRfodOeNM5O+jzImeiaqnGNdXCZKgLkhF22wW8LQD+rBZTTi/Ne+Ws/7bZbD
	OzDdmbzhFxUZ3Jk5R4KfdElJp3jjYpuGeoVSqvj9qQnAST98P/I/Wgv0y4+9b8eKHLec
	Inh/pitZJNIXCDizM3WW+1tn+Mi4kAmBk9qndyxjcaUrRpOlHB7vdueEWKgsqgTe+E2q
	08UMBc53taXc5q0ZLMWNByLseHiNVQn4PCFspmrmKL1ewcmr+XFvlL1JOrzSDlfSvzWw
	FSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RMvyxRplJWwN/bkui0FI+UpKh8vFtNBDbXYwj+ebayg=;
	b=iZb4GEgbQ7spazem6zrNp4ZwEdVvWnJhPjH0sZH0Th3TBn088jza4h+6i5EARdZrph
	q0H4okG9gQZgykJrlmwtQS3JOVvRDJvdj00Zmb5GLpee2hc3mIBPj9W/zMR4U95C6/QV
	d50meVOMPtgtHR31b+LQNe1YDoAHd/VKNU01tFFj7i3NleJQA/nK+Wx5UppTeD0h0Awe
	MGbyJp6rtKzHt+gKwJ6dgf/OB3EsLCGgeH0YguGuixCQb0Y21oxtYpkx4dYsFjbWL9Pu
	quO/kj8ZwfvUpd5ic+k1De725U7Bqsz6EPJ7QYesglAfMm7H0dkw7gQvM1Hfhf2Q+qTB
	H6ng==
X-Gm-Message-State: APjAAAX2oTICvh5yHKwL7C5wqZJtpcKh88gjMSVqw3Nz7fmwPLivDRnD
	+IGRyBDsRNEAJK/kPCL0pRsSSuEz2oj7dWzMIz0=
X-Google-Smtp-Source: APXvYqwfNXBl8DoSkEMBERRFOLmTqn1aBR9EQQ0Fc127VHmFd1OlzWj+wRO55c17fWSsNTY1sWtb5qiru7FBd885pG8=
X-Received: by 2002:aed:3576:: with SMTP id b51mr12246763qte.378.1569142945439;
	Sun, 22 Sep 2019 02:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190921164803.57442-1-alex.kiernan@gmail.com>
In-Reply-To: <20190921164803.57442-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Sep 2019 02:01:58 -0700
Message-ID: <CAMKF1srzEmQpOo3__L__6Py_GsDgddaQSFAcUM56N+p0C1CG4g@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] ostree: Add recipe
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
X-List-Received-Date: Sun, 22 Sep 2019 09:02:25 -0000
Content-Type: text/plain; charset="UTF-8"

still some packaging issues when systemd is in distro features

ostree: Files/directories were installed but not shipped in any package:
  /lib/systemd/system/ostree-prepare-root.service
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.

On Sat, Sep 21, 2019 at 9:48 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
> Changes in v2:
> - override INTROSPECTION_SCANNER_ENV to allow gobject-introspection to build
> - don't enable rofiles-fuse by default to avoid bringing in meta-filesystems
>
>  ...lways-enable-trivial-httpd-for-tests.patch |  59 +++++++
>  ...cros-Add-TEMP_FAILURE_RETRY-for-musl.patch |  40 +++++
>  ...vial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch |  51 ++++++
>  .../recipes-extended/ostree/ostree_2019.3.bb  | 157 ++++++++++++++++++
>  4 files changed, 307 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
>  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
>  create mode 100644 meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
>  create mode 100644 meta-oe/recipes-extended/ostree/ostree_2019.3.bb
>
> diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch b/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
> new file mode 100644
> index 000000000000..c9e1306afde0
> --- /dev/null
> +++ b/meta-oe/recipes-extended/ostree/ostree/0001-Always-enable-trivial-httpd-for-tests.patch
> @@ -0,0 +1,59 @@
> +From 44e0647230b22cd136ae2fb252ce90eed4751970 Mon Sep 17 00:00:00 2001
> +From: Alex Kiernan <alex.kiernan@gmail.com>
> +Date: Wed, 4 Sep 2019 17:29:15 +0100
> +Subject: [PATCH 1/2] Always enable trivial-httpd for tests
> +
> +When running tests we always need ostree-trivial-httpd, so enable it
> +unconditionally
> +
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/1912]
> +---
> + Makefile.am        | 1 +
> + ci/build.sh        | 5 +++++
> + ci/travis-build.sh | 1 +
> + 3 files changed, 7 insertions(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index cd04a055045a..673dbf88de55 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -39,6 +39,7 @@ AM_DISTCHECK_CONFIGURE_FLAGS += \
> +       --enable-gtk-doc \
> +       --enable-man \
> +       --disable-maintainer-mode \
> ++      --enable-trivial-httpd-cmdline \
> +       $(NULL)
> +
> + GITIGNOREFILES = aclocal.m4 build-aux/ buildutil/*.m4 config.h.in gtk-doc.make
> +diff --git a/ci/build.sh b/ci/build.sh
> +index 0901507498f2..806af050b780 100755
> +--- a/ci/build.sh
> ++++ b/ci/build.sh
> +@@ -22,6 +22,11 @@ case "${CONFIGOPTS:-}" in
> +         fi
> +         ;;
> + esac
> ++# unless libsoup is disabled, enable trivial-httpd for the tests
> ++case "${CONFIGOPTS:-}" in
> ++    *--without-soup*) ;;
> ++    *) CONFIGOPTS="${CONFIGOPTS:-} --enable-trivial-httpd-cmdline" ;;
> ++esac
> +
> + # always fail on warnings; https://github.com/ostreedev/ostree/pull/971
> + # NB: this disables the default set of flags from configure.ac
> +diff --git a/ci/travis-build.sh b/ci/travis-build.sh
> +index 3fd969bdced6..7c85313a2d32 100755
> +--- a/ci/travis-build.sh
> ++++ b/ci/travis-build.sh
> +@@ -85,6 +85,7 @@ make="make -j${ci_parallel} V=1 VERBOSE=1"
> +
> + ../configure \
> +     --enable-always-build-tests \
> ++    --enable-trivial-httpd-cmdline \
> +     ${ci_configopts}
> +     "$@"
> +
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch b/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
> new file mode 100644
> index 000000000000..d8c044cb9224
> --- /dev/null
> +++ b/meta-oe/recipes-extended/ostree/ostree/0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch
> @@ -0,0 +1,40 @@
> +From 5a4f2ddb0a6c656b425a3caa41f5af766ed5f44b Mon Sep 17 00:00:00 2001
> +From: Alex Kiernan <alex.kiernan@gmail.com>
> +Date: Mon, 9 Sep 2019 14:19:18 +0100
> +Subject: [PATCH] macros: Add TEMP_FAILURE_RETRY for musl
> +
> +TEMP_FAILURE_RETRY is glibc specific, add a definition for musl.
> +
> +See https://github.com/ostreedev/ostree/issues/731
> +
> +Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +Upstream-Status: Accepted [https://gitlab.gnome.org/GNOME/libglnx/commit/15c06468804014fc49f6f340132930703f919b19]
> +---
> + glnx-macros.h | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/libglnx.glnx-macros.h b/libglnx/glnx-macros.h
> +index 6d8aca93f8a3..700fc75ceed0 100644
> +--- a/libglnx.glnx-macros.h
> ++++ b/libglnx/glnx-macros.h
> +@@ -31,6 +31,16 @@ G_BEGIN_DECLS
> + /* All of these are for C only. */
> + #ifndef __GI_SCANNER__
> +
> ++/* fixes builds against musl, taken from glibc unistd.h */
> ++#ifndef TEMP_FAILURE_RETRY
> ++#define TEMP_FAILURE_RETRY(expression) \
> ++  (__extension__                                                              \
> ++    ({ long int __result;                                                     \
> ++       do __result = (long int) (expression);                                 \
> ++       while (__result == -1L && errno == EINTR);                             \
> ++       __result; }))
> ++#endif
> ++
> + /* Taken from https://github.com/systemd/systemd/src/basic/string-util.h
> +  * at revision v228-666-gcf6c8c4
> +  */
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch b/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> new file mode 100644
> index 000000000000..362b2f36ab51
> --- /dev/null
> +++ b/meta-oe/recipes-extended/ostree/ostree/0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch
> @@ -0,0 +1,51 @@
> +From 2629328b39ae117876f4854409c2231220a30b9c Mon Sep 17 00:00:00 2001
> +From: Alex Kiernan <alex.kiernan@gmail.com>
> +Date: Thu, 5 Sep 2019 13:22:15 +0100
> +Subject: [PATCH 2/2] Gate ostree-trivial-httpd on BUILDOPT_TRIVIAL_HTTPD
> +
> +When building without --enable-trivial-httpd-cmdline, don't build or install
> +the ostree-trivial-httpd binary.
> +
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/1912]
> +---
> + Makefile-ostree.am | 3 ++-
> + configure.ac       | 3 +++
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/Makefile-ostree.am b/Makefile-ostree.am
> +index 76f39cad4b74..7b53cb148960 100644
> +--- a/Makefile-ostree.am
> ++++ b/Makefile-ostree.am
> +@@ -143,12 +143,13 @@ ostree_SOURCES += src/ostree/ot-builtin-pull.c
> + endif
> +
> + if USE_LIBSOUP
> +-# Eventually once we stop things from using this, we should support disabling this
> ++if BUILDOPT_TRIVIAL_HTTPD
> + ostree_SOURCES += src/ostree/ot-builtin-trivial-httpd.c
> + pkglibexec_PROGRAMS += ostree-trivial-httpd
> + ostree_trivial_httpd_SOURCES = src/ostree/ostree-trivial-httpd.c
> + ostree_trivial_httpd_CFLAGS = $(ostree_bin_shared_cflags) $(OT_INTERNAL_SOUP_CFLAGS)
> + ostree_trivial_httpd_LDADD = $(ostree_bin_shared_ldadd) $(OT_INTERNAL_SOUP_LIBS)
> ++endif
> +
> + if !USE_CURL
> + # This is necessary for the cookie jar bits
> +diff --git a/configure.ac b/configure.ac
> +index 069bab01752e..ffc67980d507 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -192,6 +192,9 @@ AC_ARG_ENABLE(trivial-httpd-cmdline,
> +   [Continue to support "ostree trivial-httpd" [default=no]])],,
> +   enable_trivial_httpd_cmdline=no)
> + AM_CONDITIONAL(BUILDOPT_TRIVIAL_HTTPD, test x$enable_trivial_httpd_cmdline = xyes)
> ++AS_IF([test x$with_soup = xno && test x$enable_trivial_httpd_cmdline = xyes], [
> ++  AC_MSG_ERROR([trivial-httpd enabled, but libsoup is not; libsoup is needed for trivial-httpd])
> ++])
> + AM_COND_IF(BUILDOPT_TRIVIAL_HTTPD,
> +   [AC_DEFINE([BUILDOPT_ENABLE_TRIVIAL_HTTPD_CMDLINE], 1, [Define if we are enabling ostree trivial-httpd entrypoint])]
> + )
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.3.bb b/meta-oe/recipes-extended/ostree/ostree_2019.3.bb
> new file mode 100644
> index 000000000000..52a2f1298d7b
> --- /dev/null
> +++ b/meta-oe/recipes-extended/ostree/ostree_2019.3.bb
> @@ -0,0 +1,157 @@
> +SUMMARY = "Versioned Operating System Repository."
> +DESCRIPTION = "libostree is both a shared library and suite of command line \
> +tools that combines a \"git-like\" model for committing and downloading \
> +bootable filesystem trees, along with a layer for deploying them and managing \
> +the bootloader configuration."
> +HOMEPAGE = "https://ostree.readthedocs.io"
> +LICENSE = "LGPLv2.1"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> +
> +DEPENDS = " \
> +    glib-2.0 \
> +    gpgme \
> +    e2fsprogs \
> +    libcap \
> +    zlib \
> +    xz \
> +    bison-native \
> +"
> +
> +# The Yocto mirror has an old export of ostree:
> +# http://downloads.yoctoproject.org/mirror/sources/git2_github.com.ostreedev.ostree.tar.gz
> +PREMIRRORS = ""
> +
> +SRC_URI = " \
> +    gitsm://github.com/ostreedev/ostree \
> +    file://0001-macros-Add-TEMP_FAILURE_RETRY-for-musl.patch \
> +    file://0001-Always-enable-trivial-httpd-for-tests.patch \
> +    file://0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch \
> +"
> +SRCREV = "5c1697da78ebf6250a7130b8b9e6cbfbeaa34296"
> +
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools bash-completion gobject-introspection gtk-doc pkgconfig systemd
> +
> +# package configuration - match ostree defaults, but without rofiles-fuse
> +# otherwise we introduce a dependendency on meta-filesystems
> +PACKAGECONFIG ??= " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
> +    soup \
> +"
> +
> +# We include soup because ostree can't (currently) be built without
> +# soup or curl - https://github.com/ostreedev/ostree/issues/1897
> +PACKAGECONFIG_class-native ??= " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
> +    soup \
> +"
> +
> +PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
> +PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
> +PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
> +PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls"
> +PACKAGECONFIG[libarchive] = "--with-libarchive, --without-libarchive, libarchive"
> +PACKAGECONFIG[libmount] = "--with-libmount, --without-libmount, util-linux"
> +PACKAGECONFIG[man] = "--enable-man, --disable-man, libxslt-native docbook-xsl-stylesheets-native"
> +PACKAGECONFIG[mkinitcpio] = "--with-mkinitcpio, --without-mkinitcpio"
> +PACKAGECONFIG[no-http2] = "--disable-http2, --enable-http2"
> +PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl"
> +PACKAGECONFIG[rofiles-fuse] = "--enable-rofiles-fuse, --disable-rofiles-fuse, fuse"
> +PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux"
> +PACKAGECONFIG[smack] = "--with-smack, --without-smack, smack"
> +PACKAGECONFIG[soup] = "--with-soup, --without-soup --disable-glibtest, libsoup-2.4"
> +PACKAGECONFIG[static] = ""
> +PACKAGECONFIG[systemd] = "--with-libsystemd --with-systemdsystemunitdir=${systemd_unitdir}/system, --without-libsystemd, systemd"
> +PACKAGECONFIG[trivial-httpd-cmdline] = "--enable-trivial-httpd-cmdline, --disable-trivial-httpd-cmdline"
> +
> +EXTRA_OECONF = " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'static', '--with-static-compiler=\'${CC} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}\'', '', d)} \
> +"
> +
> +# Makefile-libostree.am overrides this to avoid a build problem with clang,
> +# but that fix breaks cross compilation and we don't need it
> +EXTRA_OEMAKE = " \
> +    INTROSPECTION_SCANNER_ENV= \
> +"
> +
> +EXTRA_OECONF_class-native = " \
> +    --with-builtin-grub2-mkconfig \
> +    --enable-wrpseudo-compat \
> +    --disable-otmpfile \
> +"
> +
> +# Path to ${prefix}/lib/ostree/ostree-grub-generator is hardcoded on the
> +# do_configure stage so we do depend on it
> +SYSROOT_DIR = "${STAGING_DIR_TARGET}"
> +SYSROOT_DIR_class-native = "${STAGING_DIR_NATIVE}"
> +do_configure[vardeps] += "SYSROOT_DIR"
> +
> +do_configure_prepend() {
> +    # this reflects what autogen.sh does, but the OE wrappers for autoreconf
> +    # allow it to work without the other gyrations which exist there
> +    cp ${S}/libglnx/Makefile-libglnx.am ${S}/libglnx/Makefile-libglnx.am.inc
> +    cp ${S}/bsdiff/Makefile-bsdiff.am ${S}/bsdiff/Makefile-bsdiff.am.inc
> +}
> +
> +do_install_append_class-native() {
> +    create_wrapper ${D}${bindir}/ostree OSTREE_GRUB2_EXEC="${STAGING_LIBDIR_NATIVE}/ostree/ostree-grub-generator"
> +}
> +
> +PACKAGES += " \
> +    ${PN}-dracut \
> +    ${PN}-grub \
> +    ${PN}-mkinitcpio \
> +    ${PN}-switchroot \
> +"
> +
> +FILES_${PN} = " \
> +    ${bindir}/ostree \
> +    ${bindir}/rofiles-fuse \
> +    ${datadir}/${BPN} \
> +    ${datadir}/gir-1.0 \
> +    ${libdir}/${BPN}/ostree-remount \
> +    ${libdir}/girepository-1.0 \
> +    ${libdir}/lib*${SOLIBS} \
> +    ${libdir}/tmpfiles.d/ostree-tmpfiles.conf \
> +    ${libexecdir}/libostree/ostree-trivial-httpd \
> +    ${sysconfdir}/ostree/remotes.d \
> +    ${systemd_unitdir}/system-generators/ostree-system-generator \
> +    ${systemd_unitdir}/system/ostree-finalize-staged.path \
> +    ${systemd_unitdir}/system/ostree-finalize-staged.service \
> +    ${systemd_unitdir}/system/ostree-remount.service \
> +"
> +FILES_${PN}-dracut = " \
> +    ${sysconfdir}/dracut.conf.d \
> +    ${libdir}/dracut \
> +"
> +FILES_${PN}-grub = " \
> +    ${sysconfdir}/grub.d \
> +    ${libexecdir}/libostree/grub2-15_ostree \
> +"
> +FILES_${PN}-mkinitcpio = " \
> +    ${sysconfdir}/ostree-mkinitcpio.conf \
> +    ${libdir}/initcpio \
> +"
> +FILES_${PN}-switchroot = " \
> +    ${libdir}/ostree/ostree-prepare-root \
> +    ${libdir}/systemd/system/ostree-prepare-root.service \
> +"
> +
> +RDEPENDS_${PN}-dracut = "bash"
> +RDEPENDS_${PN}-mkinitcpio = "bash"
> +RDEPENDS_${PN}_class-target = " \
> +    gnupg \
> +    ${PN}-switchroot \
> +"
> +
> +RRECOMMENDS_${PN} += "kernel-module-overlay"
> +
> +SYSTEMD_SERVICE_${PN} = "ostree-remount.service ostree-finalize-staged.path"
> +SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

