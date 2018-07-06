Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id C16C071985
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 21:22:54 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 125-v6so7552440vke.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zi3wqlrNoQUgNi9k3tGkgcUOteVl5Vv3ioYP/bgriB4=;
	b=MO3s7PmomUDN8vVkHGJYzpMHDMCPT0N2uD1Gxn4HIsdQl0q7MV04kduzBRv8Zg6biB
	rEVzRHOj4ydVn2ckjjvHoBmdOg3L6kpfqfkQlOOfrepCtVZG7hnBELFYIstLHOBuDbNN
	b7R4rKTfmqQIrMedDIn72LCYC3Tr++kW6ur8UYcmhMkwwqI1qc+iqZBjbGbiCszj9T8s
	NekaCDXhsojHjHaPfg9KVK/g1cLsu51yKv5wWtaowMUmtxecZLUl5QEUZ/6Qy0ONfNJT
	3xf+a8CHpkzf+QK9+JjvlkvLfumeAeMCcBs8lHQecyhD7+Mk9jeAZ0+0P1kwAAqXoeD/
	rLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zi3wqlrNoQUgNi9k3tGkgcUOteVl5Vv3ioYP/bgriB4=;
	b=gQ20lcYgChDzwvrkXqcQgGgbsZihwVnj2ZvbFv7X7eCmrhRQsfSLJaEtE619oA/VZg
	OYXLnzOl408X92XhbwdBi/IKjrpVhUEtd8eWYsvcBLOPi3pT3diy/c610Z4XxVhu6bZ9
	UxaYw1CML7ckPOPeYQYmYriuIiMDHIjSz1iodJ8+hwLt0PbtBLH5p/BEQaubuWBMWIXd
	940fHGuFpSUld/XN2BpDtLy1dsPywl1hmK/SZ85cEU89XvRKGqAFU6A1zcTQz3pWm9r3
	HXoyrYtBhgTkF6hFUaHWJmycNBEcOpGt9U+A5UIs9M1avjsGyva3FJRff033gOOsXGo8
	q4JQ==
X-Gm-Message-State: APt69E2BLaiWiddoV8G5ul/3yvSa7JLlYsfHDzc4FfnEmDE1SQFtW238
	XPMDOMEnxGUzPa1uQjPndYSHP4Ivp4ycIpXHiUQ=
X-Google-Smtp-Source: AAOMgpe0kdGNNfC8Vp4k3npHGHD9hDOPyG+2wIsyQRrVZRcKerf5emFncefIGrJTlNbMLfmrF5xg09dxjR7hTTG9Vok=
X-Received: by 2002:a1f:a2cc:: with SMTP id
	l195-v6mr1495183vke.95.1530912175342; 
	Fri, 06 Jul 2018 14:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <1530868443-19241-1-git-send-email-leon.anavi@konsulko.com>
In-Reply-To: <1530868443-19241-1-git-send-email-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2018 14:21:53 -0700
Message-ID: <CAMKF1soVBU+OSVc=iUnfNcTR9jnKdA6tnQOg3oefgwgcS_r40Q@mail.gmail.com>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] vim: update to 8.1.0155
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
X-List-Received-Date: Fri, 06 Jul 2018 21:22:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 6, 2018 at 2:14 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Update vim to the latest version 8.1.0155.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb |  13 ---
>  meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb  |  13 +++
>  meta-oe/recipes-support/vim/vim_8.1.0.116.bb      | 113 ----------------------
>  meta-oe/recipes-support/vim/vim_8.1.0155.bb       | 113 ++++++++++++++++++++++
>  4 files changed, 126 insertions(+), 126 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
>  create mode 100644 meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
>  delete mode 100644 meta-oe/recipes-support/vim/vim_8.1.0.116.bb
>  create mode 100644 meta-oe/recipes-support/vim/vim_8.1.0155.bb
>

this patch is ok however I would suggest that you add

[diff]
        renames = copies

to your ~/.gitconfig this will help git detect renames and make
patches easier to review.

> diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
> deleted file mode 100644
> index bb8f2b7..0000000
> --- a/meta-oe/recipes-support/vim/vim-tiny_8.1.0.116.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require vim_${PV}.bb
> -
> -SUMMARY += " (with tiny features)"
> -
> -PACKAGECONFIG += "tiny"
> -
> -do_install() {
> -    install -d ${D}/${bindir}
> -    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
> -}
> -
> -ALTERNATIVE_PRIORITY = "90"
> -ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
> diff --git a/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb b/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
> new file mode 100644
> index 0000000..bb8f2b7
> --- /dev/null
> +++ b/meta-oe/recipes-support/vim/vim-tiny_8.1.0155.bb
> @@ -0,0 +1,13 @@
> +require vim_${PV}.bb
> +
> +SUMMARY += " (with tiny features)"
> +
> +PACKAGECONFIG += "tiny"
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny
> +}

This could just be made a single liner with

install -D -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny

> +
> +ALTERNATIVE_PRIORITY = "90"
> +ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
> diff --git a/meta-oe/recipes-support/vim/vim_8.1.0.116.bb b/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
> deleted file mode 100644
> index f669dfe..0000000
> --- a/meta-oe/recipes-support/vim/vim_8.1.0.116.bb
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -SUMMARY = "Vi IMproved - enhanced vi editor"
> -SECTION = "console/utils"
> -DEPENDS = "ncurses gettext-native"
> -# vimdiff doesn't like busybox diff
> -RSUGGESTS_${PN} = "diffutils"
> -LICENSE = "vim"
> -LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
> -
> -SRC_URI = "git://github.com/vim/vim.git \
> -           file://disable_acl_header_check.patch;patchdir=.. \
> -           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
> -"
> -SRCREV = "a87b72cc316e065d66dcbcf7ec1cde330adef3a3"
> -
> -S = "${WORKDIR}/git/src"
> -
> -VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
> -
> -inherit autotools-brokensep update-alternatives
> -
> -CLEANBROKEN = "1"
> -
> -# vim configure.in contains functions which got 'dropped' by autotools.bbclass
> -do_configure () {
> -    rm -f auto/*
> -    touch auto/config.mk
> -    aclocal
> -    autoconf
> -    oe_runconf
> -    touch auto/configure
> -    touch auto/config.mk auto/config.h
> -}
> -
> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
> -
> -PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
> -PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> -PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
> -PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
> -PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> -
> -EXTRA_OECONF = " \
> -    --disable-gpm \
> -    --disable-gtktest \
> -    --disable-xim \
> -    --disable-netbeans \
> -    --with-tlib=ncurses \
> -    ac_cv_small_wchar_t=no \
> -    vim_cv_getcwd_broken=no \
> -    vim_cv_memmove_handles_overlap=yes \
> -    vim_cv_stat_ignores_slash=no \
> -    vim_cv_terminfo=yes \
> -    vim_cv_tgetent=non-zero \
> -    vim_cv_toupper_broken=no \
> -    vim_cv_tty_group=world \
> -    STRIP=/bin/true \
> -"
> -
> -do_install() {
> -    autotools_do_install
> -
> -    # Work around file-rdeps picking up csh, awk, perl or python as a dep
> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> -    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> -
> -    # Install example vimrc from runtime files
> -    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
> -
> -    # we use --with-features=big as default
> -    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> -}
> -
> -PARALLEL_MAKEINST = ""
> -
> -PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
> -FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
> -FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
> -FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
> -FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
> -FILES_${PN}-data = "${datadir}/${BPN}"
> -FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
> -FILES_${PN}-common = " \
> -    ${datadir}/${BPN}/${VIMDIR}/*.vim \
> -    ${datadir}/${BPN}/${VIMDIR}/autoload \
> -    ${datadir}/${BPN}/${VIMDIR}/colors \
> -    ${datadir}/${BPN}/${VIMDIR}/compiler \
> -    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
> -    ${datadir}/${BPN}/${VIMDIR}/indent \
> -    ${datadir}/${BPN}/${VIMDIR}/keymap \
> -    ${datadir}/${BPN}/${VIMDIR}/lang \
> -    ${datadir}/${BPN}/${VIMDIR}/macros \
> -    ${datadir}/${BPN}/${VIMDIR}/plugin \
> -    ${datadir}/${BPN}/${VIMDIR}/print \
> -    ${datadir}/${BPN}/${VIMDIR}/spell \
> -    ${datadir}/icons \
> -"
> -
> -RDEPENDS_${BPN} = "ncurses-terminfo-base"
> -# Recommend that runtime data is installed along with vim
> -RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
> -
> -ALTERNATIVE_${PN} = "vi vim"
> -ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
> -ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
> -ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
> -ALTERNATIVE_PRIORITY = "100"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta-oe/recipes-support/vim/vim_8.1.0155.bb b/meta-oe/recipes-support/vim/vim_8.1.0155.bb
> new file mode 100644
> index 0000000..532b50c
> --- /dev/null
> +++ b/meta-oe/recipes-support/vim/vim_8.1.0155.bb
> @@ -0,0 +1,113 @@
> +SUMMARY = "Vi IMproved - enhanced vi editor"
> +SECTION = "console/utils"
> +DEPENDS = "ncurses gettext-native"
> +# vimdiff doesn't like busybox diff
> +RSUGGESTS_${PN} = "diffutils"
> +LICENSE = "vim"
> +LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b6eb9d541de3933cc8f48125ae0335fe"
> +
> +SRC_URI = "git://github.com/vim/vim.git \
> +           file://disable_acl_header_check.patch;patchdir=.. \
> +           file://vim-add-knob-whether-elf.h-are-checked.patch;patchdir=.. \
> +"
> +SRCREV = "ae728edc93fe5a2f8c39fa75b1ae9ed71526858c"
> +
> +S = "${WORKDIR}/git/src"
> +
> +VIMDIR = "vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
> +
> +inherit autotools-brokensep update-alternatives
> +
> +CLEANBROKEN = "1"
> +
> +# vim configure.in contains functions which got 'dropped' by autotools.bbclass
> +do_configure () {
> +    rm -f auto/*
> +    touch auto/config.mk
> +    aclocal
> +    autoconf
> +    oe_runconf
> +    touch auto/configure
> +    touch auto/config.mk auto/config.h
> +}
> +
> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
> +
> +PACKAGECONFIG[gtkgui] = "--enable-gtk2-test --enable-gui=gtk2,--enable-gui=no,gtk+,"
> +PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> +PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
> +PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
> +PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> +
> +EXTRA_OECONF = " \
> +    --disable-gpm \
> +    --disable-gtktest \
> +    --disable-xim \
> +    --disable-netbeans \
> +    --with-tlib=ncurses \
> +    ac_cv_small_wchar_t=no \
> +    vim_cv_getcwd_broken=no \
> +    vim_cv_memmove_handles_overlap=yes \
> +    vim_cv_stat_ignores_slash=no \
> +    vim_cv_terminfo=yes \
> +    vim_cv_tgetent=non-zero \
> +    vim_cv_toupper_broken=no \
> +    vim_cv_tty_group=world \
> +    STRIP=/bin/true \
> +"
> +
> +do_install() {
> +    autotools_do_install
> +
> +    # Work around file-rdeps picking up csh, awk, perl or python as a dep
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.pl
> +    chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/*.py
> +
> +    # Install example vimrc from runtime files
> +    install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${BPN}/vimrc
> +
> +    # we use --with-features=big as default
> +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> +}
> +
> +PARALLEL_MAKEINST = ""
> +
> +PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
> +FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
> +FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
> +FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
> +FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
> +FILES_${PN}-data = "${datadir}/${BPN}"
> +FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
> +FILES_${PN}-common = " \
> +    ${datadir}/${BPN}/${VIMDIR}/*.vim \
> +    ${datadir}/${BPN}/${VIMDIR}/autoload \
> +    ${datadir}/${BPN}/${VIMDIR}/colors \
> +    ${datadir}/${BPN}/${VIMDIR}/compiler \
> +    ${datadir}/${BPN}/${VIMDIR}/ftplugin \
> +    ${datadir}/${BPN}/${VIMDIR}/indent \
> +    ${datadir}/${BPN}/${VIMDIR}/keymap \
> +    ${datadir}/${BPN}/${VIMDIR}/lang \
> +    ${datadir}/${BPN}/${VIMDIR}/macros \
> +    ${datadir}/${BPN}/${VIMDIR}/plugin \
> +    ${datadir}/${BPN}/${VIMDIR}/print \
> +    ${datadir}/${BPN}/${VIMDIR}/spell \
> +    ${datadir}/icons \
> +"
> +
> +RDEPENDS_${BPN} = "ncurses-terminfo-base"
> +# Recommend that runtime data is installed along with vim
> +RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
> +
> +ALTERNATIVE_${PN} = "vi vim"
> +ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
> +ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
> +ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
> +ALTERNATIVE_PRIORITY = "100"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

