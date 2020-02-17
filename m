Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id EC17160BD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 05:55:51 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id t26so3889333ioi.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 21:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=e6UUdefE3vwbOGC8ohB3y376h3QsMA1zRE68lLbqAZ0=;
	b=vBn9rokAqfGIh8/HDQkNb+eytqvpSLC/6S90/TAa79zIiyetCa78H6TqNjXUzbc8dC
	jIHsvDKoIORI4aYX/7HiouA3q9s4b5jtjAz2P3MLPHzRX9ilfQ5DSQX0cHYYYvmFh1au
	TV9kF72ZVX6r4qtHIHLOrs9KlisG4g6eFFtIaYlhGwK58vCRP/m0r2MkVCU62b3tWpDD
	omp+wnWY5AvRh8UgFI+ueBB+FhNiNuj8DYrKxAAxPS0QLLeSax/gOOQWVDB/Cb39B7Yx
	+bshC7CyGHAHAb6AhOPk/T85YC+802YkEY4HtydK3GWmXpZ4OOV8+CkGsagOnjO2l9mP
	nEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=e6UUdefE3vwbOGC8ohB3y376h3QsMA1zRE68lLbqAZ0=;
	b=I/7+KBZSs1aHGaHGvNrIwZIBGzpU22amAmiOTvWAFtaZ8AQoVJj1cUQZ2S73gQPCCx
	UEJazLdjCAZvFMxxS4+i1IGDrWBMO09nEBqQi1LGwV6OueJxG0XeRT2vR1nYdIBuJ7eI
	NES6QdiVPJVe7wxEk+KdfSS5NtS/rM8hQp6pjq+R7xcQnla/n3N96x0L4IzPcTyJ/35s
	XOkvF6tnEmYpa1sNK07Fdc4NAGDKn+MB7Pf62YD8SIgcuC8DIRHaycQLrwYjze7/AH6R
	Q6xS1hEMRFmDFeSScPTe+8GkTdwOpSUHctFKcRx/I3/omBYQ4qMp0+XWRvyvZwFErdiM
	VnDw==
X-Gm-Message-State: APjAAAV2EwojiTi5htFbyzgXC+DKj8hkZ2cQV1QuUcu+yOQFpmep1Fqx
	7MpRL3mD3c1FaGJUtcnvcJM+AP3GgLHeVqFT574=
X-Google-Smtp-Source: APXvYqzD52wsI578LbwjMwhlVIlYrsWn9dlojHPU0tVFWrzp7WDRHeX4yMTkcKDgN2cr5wWwqSkn49ZXBfHySnXdmD8=
X-Received: by 2002:a02:cf2e:: with SMTP id s14mr10925467jar.124.1581918952832;
	Sun, 16 Feb 2020 21:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20200217024304.1131392-1-raj.khem@gmail.com>
	<20200217024304.1131392-7-raj.khem@gmail.com>
In-Reply-To: <20200217024304.1131392-7-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 17 Feb 2020 06:55:41 +0100
Message-ID: <CALbNGRSzRB6zjQO0NBTU5D85+t-BEQuYL27CmHJFJtzGt_sGsg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH 7/7] gimp: Depend on libexecinfo for musl
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
X-List-Received-Date: Mon, 17 Feb 2020 05:55:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 3:43 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> musl does not have internal backtrace implementation like glibc
> but we can use external library

Sound reasonable and does not affect non musl.

BTW: Old email address still works but the email address changed form
'googlemail' to 'gmail'.

Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb b/meta-gnome/re=
cipes-gimp/gimp/gimp_2.10.14.bb
> index 045958d0a6..30f0579e2d 100644
> --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
> +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
> @@ -29,6 +29,7 @@ DEPENDS =3D " \
>      libmng \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', =
d)} \
>  "
> +DEPENDS_append_libc-musl =3D " libexecinfo"
>
>  inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
>
> --
> 2.25.0
>

