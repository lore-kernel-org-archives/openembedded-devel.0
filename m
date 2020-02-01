Return-Path: <alex.kiernan@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 91CE960ACB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2020 15:25:52 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id v13so8873056iln.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Feb 2020 07:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G0bYAaBhBAzvv/i2qaX3mKD7PjL05cHdE0fwQwZC0yQ=;
	b=qNUfkorOmryLDEzVitCZA9d7DraciXbONIj44YG6yxGup34ElDI9oGLbcRUZ2fEuMv
	4bJFQwEylO4DHwsrdyy5e3K1whu3ul9XD7fi3wQFmNdEuJaFGnr4VDSj8P7ujDcB/8Qt
	az2+gq+gnWjzBfjEQXTNvPdQaXBK1H7K+8L/jNjCIWwsYcXhQRZMcm2h6fYX3MbhZjCr
	1Vdp5vGJo8noOvfdEY8aIFQ5Vf5gsv45lPJO5YF98rA3TSmDKAjaEb2Nuz+1th0X4Yyi
	O74QohQuURVGwdejAvuuD78Ci6tRSnQzFYEspRkSkaLWluBMl6AashpPiLpa4eVXCBR5
	gDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G0bYAaBhBAzvv/i2qaX3mKD7PjL05cHdE0fwQwZC0yQ=;
	b=LYS7mFmPgCLjqlzSwmPd5P1BCQ1xt132SrESv8FRbN9XxevwkmD3pT8/kpXlDMfi/f
	uwRqDc13yPBU+J94/8MGp+UZAuydYbU9l10OxWfk0NCadDWyoOUZ/OwBsno23Ylw2OMa
	XPYH6hRB9iIOZ5hFGWKJ8OSYxxiGpUO0vwvs+SE8PJmDN5frKZVvL1l5338Yu2+kbNkm
	riz3h8yUcagWlV4VmAXhzwDU4HSGGalM0IEUQCra1b47vwut3VcmTr15Fns9FRnjYh1z
	YeD7n89Yx9Qz3nCY3JL1bxeQOnbhkT/ajsi+Zeh/sbn5KDvL59ObWFH40t99TkhfNGFO
	eJpg==
X-Gm-Message-State: APjAAAXF1+4u6yN1JzRf+lczEHALCH1Lp/8WdOotVWG5wfGrI2tnJxWY
	NTWFTQDbj+2Q/xUIHb86YWFfoEK1NxaoX5CiLJWi3KD8
X-Google-Smtp-Source: APXvYqxbxff5IeFuYfBBv/omdeEWOPZo65CqzFfcENLKvrACJeYUYBWZ2iQxa4mx4a8IR5LvwVY8C1yQieDs6XpeFUU=
X-Received: by 2002:a92:8f44:: with SMTP id j65mr14098079ild.144.1580570753302;
	Sat, 01 Feb 2020 07:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20200131212057.1856967-1-robert.joslyn@redrectangle.org>
	<20200131212057.1856967-2-robert.joslyn@redrectangle.org>
In-Reply-To: <20200131212057.1856967-2-robert.joslyn@redrectangle.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 1 Feb 2020 15:25:42 +0000
Message-ID: <CAO5Uq5S5R92jtdgWoFDJ_2P1egc=VXAs=MzPy3xoEi4d3jS_7w@mail.gmail.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] iwd: Add PACKAGECONFIG options
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
X-List-Received-Date: Sat, 01 Feb 2020 15:25:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 31, 2020 at 9:45 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> Make it easier to disable optional client, monitor, and man page
> components and their dependencies. A user may want to disable the client
> to avoid the use of GPLv3 readline.
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  meta-oe/recipes-connectivity/iwd/iwd_1.4.bb | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
> index 49fc45a74..a023c0d28 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
>
>  inherit autotools pkgconfig systemd python3native
>
> -DEPENDS = "ell readline python3-docutils-native"
> +DEPENDS = "ell"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
>             file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
> @@ -12,7 +12,15 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
>  SRCREV = "860fa4697f349da7791ecf22ca76f9ac0e5de261"
>  S = "${WORKDIR}/git"
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +PACKAGECONFIG ??= " \
> +    client \
> +    monitor \
> +    manual-pages \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +"
> +PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
> +PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor"
> +PACKAGECONFIG[manual-pages] = "--enable-manual-pages,--disable-manual-pages,python3-docutils-native"

If you make this PACKAGECONFIG[manpages], inherit manpages and drop it
from the default PACKAGECONFIG you'll automatically get documentation
driven by the api-documentation distro feature. Though at that
possibly it should be a separate commit.

Maybe just /manual-pages/manpages/ as that's a common name?

>  PACKAGECONFIG[wired] = "--enable-wired,--disable-wired"
>  PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono"
>  PACKAGECONFIG[systemd] = "--with-systemd-unitdir=${systemd_system_unitdir},--disable-systemd-service,systemd"
> @@ -26,6 +34,8 @@ do_configure_prepend () {
>  do_install_append() {
>      mkdir --parents ${D}${docdir}/${BPN}
>      install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
> +    # If client and monitor are disabled, bindir is empty, causing a QA error
> +    rmdir --ignore-fail-on-non-empty ${D}/${bindir}
>  }
>
>  FILES_${PN} += "${datadir}/dbus-1 ${nonarch_libdir}/modules-load.d ${systemd_unitdir}/network/"
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
Alex Kiernan

