Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 01E696F4E5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 23:00:56 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x13so3901639wgg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 16:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=vvvd+rlsNcm8H3iTqZvgsAedWZxOTAGkYEkFQ0kgX9A=;
	b=L32KSbD7SXky7PGCG6czMwNxcr7Eoz5BgTk/fxnYi3ZbGzfoW764VgPeldu09NM8QL
	d0g4oZ1NGjja0EwzQs1BaXV7OtHXtzzm/ghQEfuXQCdEGYdIIqwYzdupt7LrMWTQF/3x
	Syrx5isPCHkrWhXwLuJ3VvOU/BxkfiE9yokgZeB/Xg4d4GbtzE4SWgcwbISmMjM9467T
	lsxuKH8wdEQ5LxL4SKyNgYTWNMY2Fy7bWAofYRcUuMY0jd7w9unO7MjEARN4Mu55XE3G
	EFRe+Qr9uOlz5kEJAS3QIiPyopac/uNxzbhzaTNdbSYEaLeN9RFkOuB+2dJ6TrjAmLGx
	yokw==
MIME-Version: 1.0
X-Received: by 10.180.20.71 with SMTP id l7mr6752099wie.35.1395010856960; Sun,
	16 Mar 2014 16:00:56 -0700 (PDT)
Received: by 10.194.59.228 with HTTP; Sun, 16 Mar 2014 16:00:56 -0700 (PDT)
In-Reply-To: <1395010717-15721-1-git-send-email-stephen.arnold42@gmail.com>
References: <1395010717-15721-1-git-send-email-stephen.arnold42@gmail.com>
Date: Sun, 16 Mar 2014 16:00:56 -0700
Message-ID: <CAOLEWZVrMoMSNESP4pm1wmdhSLCruRa6Fd-V5joF-fY2sf+kGw@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] updated lxdm recipe depends and build config
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
X-List-Received-Date: Sun, 16 Mar 2014 23:00:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Okay, apparently git-send-email doesn't suck any from info from the file in
outgoing/.  Good to know...


On Sun, Mar 16, 2014 at 3:58 PM, stephen.arnold42 <
stephen.arnold42@gmail.com> wrote:

> ---
>  meta-oe/recipes-graphics/lxdm/lxdm_git.bb | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bbb/meta-oe/recipes-graphics/lxdm/
> lxdm_git.bb
> index c12eddf..6ef014f 100644
> --- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
> @@ -16,18 +16,27 @@ SRCREV = "07fb151a99ef99318b71f3de0afbba977b1e6267"
>  PV = "0.5.0+git${SRCPV}"
>  PE = "1"
>
> -DEPENDS = "cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb
> pango"
> +DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0
> gtk+ virtual/libx11 libxcb pango iso-codes"
>  DEPENDS += "${@base_contains("DISTRO_FEATURES", "systemd", "",
> "consolekit", d)}"
>
>  # combine oe-core way with angstrom DISTRO_TYPE
>  DISTRO_TYPE ?= "${@base_contains("IMAGE_FEATURES", "debug-tweaks",
> "debug", "",d)}"
>
> -inherit autotools gettext systemd
> +inherit autotools pkgconfig gettext systemd
>
>  S = "${WORKDIR}/git"
>
> +CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset
> -fno-builtin-strstr "
> +
> +EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x
> -with-xconn=xcb"
>  EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=${systemd_unitdir}/system/
> --disable-consolekit', '--without-systemdsystemunitdir', d)}"
>
> +do_patch_extra() {
> +    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
> +}
> +
> +addtask do_patch_extra before do_configure after do_patch
> +
>  do_compile_append() {
>      # default background configured not available / no password field
> available / no default screensaver
>      sed -i     -e 's,bg=,# bg=,g' \
> --
> 1.8.5.3
>
>

