Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8590E6EBA2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 09:32:07 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id jx11so6728220veb.31
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=XqkDS2JkQBnHw6sLiPB3an82z2OVNWRCCMnpFDW+HUQ=;
	b=itFQfR62U5ePSbDt8MDogJZ9IRFkzlpDiQ/XEw3wbC17fCU8zDMSbn6RhrrKzdkw8f
	U6mVcI4LrpbQxiklF5yjCJBC6VLUI3ob7qVv4McrEPOLbMRkd9xhLDci7/I9MzJ/4MtU
	vrpFn3CjckEuLRb+FMrH7Nbhoou1h6uFkvxAVuU3BTqiVmllUIZZye6IgXUx+nTBA5R4
	p18+kdJeliALSVXvFqIXZv4kKc6KNIbssBldrDDHzO8jkHox64/r93ymqaiFjVTkJWmW
	mlATCpKK2yCKFFWVKtjX+SV7mhzuIakmUuur+g732uxEG4l0b7b+Vi/dIGbWU4NEBqJ+
	A0rQ==
MIME-Version: 1.0
X-Received: by 10.221.61.210 with SMTP id wx18mr5018267vcb.27.1395135128538;
	Tue, 18 Mar 2014 02:32:08 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Tue, 18 Mar 2014 02:32:08 -0700 (PDT)
In-Reply-To: <1395133748-1211-1-git-send-email-stephen.arnold42@gmail.com>
References: <1395133748-1211-1-git-send-email-stephen.arnold42@gmail.com>
Date: Tue, 18 Mar 2014 10:32:08 +0100
Message-ID: <CALbNGRSynkvxFUPNDCoQhPMnK7HHgNuM1sBOh8gPnJZXaW4r+Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-graphics][PATCH v3] recipes-graphics/lxdm: autotools and config updates
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Mar 2014 09:32:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 18, 2014 at 10:09 AM, Stephen Arnold
<stephen.arnold42@gmail.com> wrote:
> lxdm_git.bb: Upstream changes required autotools and gettext (intl) updates;
> the package autogen script doesn't create the makefile in po, but autotools
> by itself is missing the input file (thus, the configure_prepend). There
> were also missing depends (from upstream docs and configure checks) and
> some configure options were added to ensure the desired X/gtk2 config and
> enable (optional) auto-login.
For my interest since I have autologin working as expected (with
oe-core updated last in january -> autotools not updated). What is
this --enable-password for?
>
> Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>
>
> ---
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> index c12eddf..c602ad3 100644
> --- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> @@ -16,17 +16,24 @@ SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
>  PV = "0.5.0+git${SRCPV}"
>  PE = "1"
>
> -DEPENDS = "cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
> +DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
>  DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "", "consolekit", d)}"
>
>  # combine oe-core way with angstrom DISTRO_TYPE
>  DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
>
> -inherit autotools gettext systemd
> +inherit autotools pkgconfig gettext systemd
>
>  S = "${WORKDIR}/git"
>
> -EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
> +CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
Why these extra flags - I found no hint in commit message.
> +
> +EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb \
> +    ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/ --disable-consolekit', '--without-systemdsystemunitdir', d)}"
> +
> +do_configure_prepend() {
> +    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
> +}
>
>  do_compile_append() {
>      # default background configured not available / no password field available / no default screensaver
> --
regards

Andreas

