Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 015B57F82E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 06:08:34 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id g50so9830436qtb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 23:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8l83pTUsYogoOftiSJuhpfF/NhNqmytEWXbmvioLUEY=;
	b=cl1xml3lZYZYl2jKMxnHj3OSF4hp4pA+ev7hHzQKoLZjQXuGtvWUS5lgVpQ9nIN53s
	MVz8EFx3rrnhLV5IOjPckCNqksaY8MFBqq1BWnHhLlaPJWa9oYdmYYaomAqnVwSL+alm
	Swalt3yAevJCuI6empQ8xIe0UjgVO/iUQ4FWXv+9H1AlsuVoTGfaJGGtIJjnSeGvAq+s
	z9HlNvPCwhWiwNr3WNgfdElgH9eUrfucnwFVBQRUfWmswHF6XGwtbwDcnF807TVABs1m
	RtHSS9af3XVTsJ6ANo/YvID6g1ODoYDlX3gjrWiLNifg+Hmh0oRfNdb9EU81GqKiaj/n
	WRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8l83pTUsYogoOftiSJuhpfF/NhNqmytEWXbmvioLUEY=;
	b=UdQaM7HY2TzUUMcl6c0gQVrVlS9ptl+HXxLKp9fjuhWHZ7psRdpZcxM1JastBsGrLg
	obI+nUTvjtvMU4Nx6P7s045GGPG56P55Sq6cJYBsr4FpFoZ0X75uuuYEtIExVjl5bHgu
	9hkMdhr68XNKXpWJSvF7bTOh2vlu8ZjO4RXdnrH+Ex+2Kn339GMDiJZIKt17L+ClD2PN
	tGebTkQjaKhFa0kETKwHIUSWpah75wSeZcv9UbiDrY2KL8rxIDionUhhafwg8MAdbPVO
	fAtYvzPBfbip5Y3VF9+rn/eFbJplRjJQwA10I3GsVjVM5m0OhcR0IzgYemxUH8eweLug
	9j/Q==
X-Gm-Message-State: APjAAAU7q2NCnymguyXspGkywIEM9drp0rKVnZvL5WDHVoqxmutQFoBT
	Gw8WQ00viwQzdIsUvx5zQI/B2LTYodQJRjay+x8=
X-Google-Smtp-Source: APXvYqyWiqH7QVXJBqtJsGDPNB5oSBJW6NOtzDNypMbKoepqIBbFN5QfrC5/Cwark7xjIc/EhA9ZcPg1um3L7ktrQQU=
X-Received: by 2002:ad4:45b1:: with SMTP id y17mr9664954qvu.55.1572156515577; 
	Sat, 26 Oct 2019 23:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-3-schnitzeltony@gmail.com>
In-Reply-To: <20191026093404.19659-3-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Oct 2019 07:08:09 +0100
Message-ID: <CAMKF1sqoAUa_Fs1LeLK0U2N=U2nS4cGwVWvYJ3xQNqq8_sJj5Q@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gnome-help.bbclass: Handle gnome-help files with new distro feature 'helpfiles'
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
X-List-Received-Date: Sun, 27 Oct 2019 06:08:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 26, 2019 at 11:34 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> Now that we can build gnome help files, let our users decide what to do w=
ith
> them:
>
> if 'helpfiles' not in DISTRO_FEATURES
>     delete all help contents during install
> else
>   if PACKAGE_NO_HELP_SPLIT =3D=3D 1
>       pack all help files to ${PN}-help
>   else
>       pack help files to ${PN}-help-<lingua>
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-gnome/classes/gnome-help.bbclass | 69 +++++++++++++++++++++++++++
>  meta-gnome/conf/layer.conf            |  3 ++
>  2 files changed, 72 insertions(+)
>  create mode 100644 meta-gnome/classes/gnome-help.bbclass
>
> diff --git a/meta-gnome/classes/gnome-help.bbclass b/meta-gnome/classes/g=
nome-help.bbclass
> new file mode 100644
> index 000000000..967091ba4
> --- /dev/null
> +++ b/meta-gnome/classes/gnome-help.bbclass
> @@ -0,0 +1,69 @@
> +# Class to pack gnome help files or delete them during install
> +# There are the following cases:
> +#
> +# if 'helpfiles' not in DISTRO_FEATURES
> +#     delete all help contants during install
> +# else
> +#   if PACKAGE_NO_HELP_SPLIT =3D=3D 1
> +#       pack all help files to ${PN}-help
> +#   else
> +#       pack all help files to ${PN}-help-<lingua>
> +
> +FILES_${PN}-help =3D "${datadir}/*/translations"
> +
> +# Dummy to get yelp build & PACKAGE_NO_HELP_SPLIT set 1
> +PACKAGES_append =3D " ${PN}-help"
> +FILES_${PN}-help =3D "${datadir}/help"
> +RRECOMMENDS_${PN}-help =3D "${@bb.utils.contains('DISTRO_FEATURES','help=
files','yelp','',d)}"
> +
> +do_install_append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES','helpfiles','false','true'=
,d)}; then
> +        rm -rf ${D}${datadir}/help/*
> +    fi
> +}
> +
> +python gnome_do_split_help() {
> +    if bb.utils.contains('DISTRO_FEATURES', 'helpfiles', False, True, d)=
:
> +        return
> +
> +    if (d.getVar('PACKAGE_NO_HELP_SPLIT') =3D=3D '1'):
> +        # all help files go to ${
> +        bb.debug(1, "package requested not splitting help-files")
> +        return
> +
> +    packages =3D (d.getVar('PACKAGES') or "").split()
> +    datadir =3D d.getVar('datadir')
> +    dvar =3D d.getVar('PKGD')
> +    pn =3D d.getVar('PN')
> +
> +    if pn + '-help' in packages:
> +        packages.remove(pn + '-help')
> +
> +    helpdir =3D os.path.join(dvar + datadir, 'help')
> +
> +    if not cpath.isdir(helpdir):
> +        bb.warn("No help files in this package - remove gnome-help from =
inherit?")
> +        return
> +
> +    helps =3D os.listdir(helpdir)
> +
> +    summary =3D d.getVar('SUMMARY') or pn
> +    description =3D d.getVar('DESCRIPTION') or ""
> +    locale_section =3D d.getVar('LOCALE_SECTION')
> +    mlprefix =3D d.getVar('MLPREFIX') or ""
> +    for l in sorted(helps):
> +        ln =3D legitimize_package_name(l)
> +        pkg =3D pn + '-help-' + ln
> +        packages.append(pkg)
> +        d.setVar('FILES_' + pkg, os.path.join(datadir, 'help', l))
> +        d.setVar('RRECOMMENDS_' + pkg, '%syelp' % mlprefix)
> +        d.setVar('SUMMARY_' + pkg, '%s - %s help' % (summary, l))
> +        d.setVar('DESCRIPTION_' + pkg, '%s  This package contains langua=
ge help files for the %s locale.' % (description, l))
> +        if locale_section:
> +            d.setVar('SECTION_' + pkg, locale_section)
> +
> +    d.setVar('PACKAGES', ' '.join(packages))
> +}
> +
> +PACKAGESPLITFUNCS_prepend =3D "gnome_do_split_help "
> +
> diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
> index 862d622ee..c4d4574bc 100644
> --- a/meta-gnome/conf/layer.conf
> +++ b/meta-gnome/conf/layer.conf
> @@ -15,3 +15,6 @@ LAYERVERSION_gnome-layer =3D "1"
>  LAYERDEPENDS_gnome-layer =3D "core openembedded-layer networking-layer"
>
>  LAYERSERIES_COMPAT_gnome-layer =3D "thud warrior zeus"
> +
> +# GNOME Help files
> +PACKAGES_DYNAMIC_append =3D " ^${PN}-help-.*"

if we put this in layer.conf it will appear at global config meta
data, since it remains pertinent to gnome
perhaps its best to add it in gnome related bbclass maybe

> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

