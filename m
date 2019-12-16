Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id E8EAB7F36E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 05:04:16 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k40so1050841qtk.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 21:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fQBkExi6eJwVGjwtvcxwO3GSvcTk6wiiTnAruQiFa1E=;
	b=TbjgWPpzIpbgnzCKkScQyI4EGmaigsR+w8NYyzGypmUyoxDMmmSQyzsV4SkjHIX+d0
	UL4a9r9bwOxy+WBKhLQ2O2khMzs8RbY4EaNZ/LnRAGpsmckYiMvNp30Ds+h0pa18SLZ6
	HYzDiEWzm2QnUUgjXSsupDCDsol+5jpf94yH/YR0ZCn7Tmzmm5M8OmLiD0njHnmOvuLI
	mhQxzfJhJwHGL9590dYAvaRg1w7F5Ah9r7PMPF6HnGRRy0vL0ZvUskyUfQYdMOyHaygj
	Ye0mHVyDGRLM+m0QkOsc03ZWsoT+2nkMJjg2ki5RBfaFHHXbI45lLU/Tjb0V+bCVPF3u
	1IeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fQBkExi6eJwVGjwtvcxwO3GSvcTk6wiiTnAruQiFa1E=;
	b=fds8PPBaY/RcEr+KMfIcVo6sDUNyWvyUq+JiClQElulU8RwuMXrm/oxQC54epSJ5Sz
	ehUFzyj2MUmVp7Hw7CUpqiGrs79jtDT0xkBavpTsiheQK3RJ2CC+9xhpFlsBmIqJi8hY
	E8kfL01qnXMZhMU0vVQ8c7yJ1/mzvshE2tuM4J86qe//PT5XJxwlUNi2+bEWh1EsnMNp
	VczncKSwcYvJclUScoo6xwOQ06GjUp9tg4vgeXmMlXL4qHDmHynxLAB8uRFQkFfnYdRW
	whmK4frCd3edkyz+rZm32KpDGbPyWNbYIZ0hoRnb4kQw/cyianDb560cs9ryorHdhlVP
	FwuA==
X-Gm-Message-State: APjAAAW83sppRZdYueaSpImJzAiRJiVSxROGCyKcyCetm/cLc3XjH7hm
	8PXiJPRfhAVaP0pxHn3g7+22lSaWRsn9YG2KgPg=
X-Google-Smtp-Source: APXvYqxQQoJcuxTMcsHWua5ZBQutBdMRZLQdXQ8pBrttpmxbUf52uZs7Xr05mn7tckqaSUOujGGcqumJHgSWZF+hkto=
X-Received: by 2002:ac8:6ca:: with SMTP id j10mr19614046qth.378.1576472657557; 
	Sun, 15 Dec 2019 21:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
	<20191216012047.17312-5-schnitzeltony@gmail.com>
In-Reply-To: <20191216012047.17312-5-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Dec 2019 21:03:51 -0800
Message-ID: <CAMKF1spwVcF1tiY7bf3FUGSdsLb7nLBtfSzLYxsARq1kDy7veQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/6] libhandy: initial add 0.0.12
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
X-List-Received-Date: Mon, 16 Dec 2019 05:04:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 5:22 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> libhandy is required by upcoming gnome-tweaks
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-support/libhandy/libhandy_git.bb  | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/libhandy/libhandy_git.bb
>
> diff --git a/meta-gnome/recipes-support/libhandy/libhandy_git.bb b/meta-g=
nome/recipes-support/libhandy/libhandy_git.bb
> new file mode 100644
> index 000000000..0fbbfdc5d
> --- /dev/null
> +++ b/meta-gnome/recipes-support/libhandy/libhandy_git.bb
> @@ -0,0 +1,21 @@
> +SUMMARY =3D "A library full of GTK+ widgets for mobile phones"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +SRC_URI =3D "git://source.puri.sm/Librem5/${BPN}.git"

I am seeing this

WARNING: libhandy-0.0.12-r0 do_fetch: Failed to fetch URL
git://source.puri.sm/Librem5/libhandy.git, attempting MIRRORS if
available

I think we need to use https protocol in fetcher.

SRC_URI =3D "git://source.puri.sm/Librem5/${BPN}.git;protocol=3Dhttps"

might work.

> +SRCREV =3D "ef7c4bf75ae239495141ada83d2fbaf034315563"
> +S =3D "${WORKDIR}/git"
> +PV =3D "0.0.12"
> +
> +GIR_MESON_ENABLE_FLAG =3D 'enabled'
> +GIR_MESON_DISABLE_FLAG =3D 'disabled'
> +GTKDOC_MESON_OPTION =3D 'gtk_doc'
> +
> +inherit meson gobject-introspection vala gettext gtk-doc features_check
> +
> +ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
> +
> +DEPENDS +=3D "gtk+3"
> +
> +PACKAGES =3D+ "${PN}-examples"
> +FILES_${PN}-examples =3D "${bindir}"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

