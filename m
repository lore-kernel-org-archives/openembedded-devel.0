Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA226C106
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 22:13:48 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m125so6467736qkd.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1wJJvn0tCaluEqvgHd+bc/I1BzjBFXB/YxNva3Q1p2c=;
	b=e3x+Ue/u73fRCveLN19VjvTEmE4aRXEi1QFAw5Fy8PSMQBsNoAzRqxrLztNsyT0Lca
	k53aB2v+fJQ+pOBHzv9SlVvbXA+pKhawreIpUORkS0uUphuA2WKm2a2KN/8h61+4UZje
	toHsv9fH+O6T07fvlxF9kV5Q/DUzmyCbjCvAc2jHibZ7JsDSGjHacOpN+6glb5stlAZz
	Ig1eyy5B4P4I7tNXrpmzWLj1QQGPC6BmXp06FFKlm5mG3woR1+PXQ/T8AtlyR62eHt16
	QC6U9X4xDOPoJvNi9FkWXKKFD2Bhs6gUfq1OQFyKFcBLquLYxI6gM/f13Bu+dtDrnozT
	b39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1wJJvn0tCaluEqvgHd+bc/I1BzjBFXB/YxNva3Q1p2c=;
	b=k0dOtSnXL/8M5h7D6WxJh/I141WZEQPFtnvItmuLDw5ax/+pJioMs9PXzXREFWxQOC
	MS9yik93tVBBtX1qyKCEQVZRKHeTR6VDxD/qcYrl3uwvgiRwbQ7a0xRWxos4pk0Ua5j9
	0XZLElezEVV1XLb0wFFO7yFgUmGvnfIsoh2VQC/ihJfFvRj498oWL59bg7FyCPrlG7G+
	zn3xI6n6qhrdsoq6HyGXW5+z3n+LhN7iJ9DVn4IyncxxIpZ8KMCGi+UhdLXUNaO0idFe
	6cLgxYPjgFibqKMyU9IzwNbmrqSwl7ktbcclBqAI+yC7KoPNlJ7BSCgMeVncjiUnKU+8
	jesg==
X-Gm-Message-State: APjAAAVpSoLcahHx2xHUtizo27BvDpkZwZBez+ZR2nyAE5sbUo/oBO6R
	zZLSSdtEvEM/xvaoVZ9wbt5NZ5iTfQy3kEGn08E=
X-Google-Smtp-Source: APXvYqxZfdKFyGWLcSloGWQsHmxTMLkvoKT9EAccou+Y3aXVVe9fTy0ZedGxTvj/AVwe+JkDv/98LoiRglJoXVYM6YY=
X-Received: by 2002:a37:8805:: with SMTP id k5mr3179534qkd.212.1573769628858; 
	Thu, 14 Nov 2019 14:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-14-schnitzeltony@gmail.com>
In-Reply-To: <20191114194930.2786-14-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 14:13:22 -0800
Message-ID: <CAMKF1sru3JvSpMvHHzrL1+D1Qkm4Orec8r0FcwrrKn=38gm5sg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 13/16] geocode-glib: initial add 3.26.1
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
X-List-Received-Date: Thu, 14 Nov 2019 22:13:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 11:51 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> It is a dependency for upcoming gnome-settings-daemon
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../geocode-glib/geocode-glib_3.26.1.bb       | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.=
26.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb=
 b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
> new file mode 100644
> index 000000000..dc218f3a3
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.1.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "A convenience library for the geocoding"
> +
> +LICENSE =3D "LGPLv2"

still at 2.0 and not 2.1 interesting.

> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D55ca817ccb7d5b5b66355690e=
9abc605"
> +
> +GNOMEBASEBUILDCLASS =3D "meson"
> +GIR_MESON_OPTION =3D "enable-introspection"
> +GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
> +
> +inherit gnomebase gobject-introspection gettext gtk-doc upstream-version=
-is-even
> +
> +DEPENDS =3D " \
> +    json-glib \
> +    libsoup-2.4 \
> +"
> +
> +SRC_URI[archive.md5sum] =3D "21094494e66c86368add6a55bf480049"
> +SRC_URI[archive.sha256sum] =3D "5baa6ab76a76c9fc567e4c32c3af2cd1d1784934=
c255bc5a62c512e6af6bde1c"
> +
> +EXTRA_OEMESON =3D "-Denable-installed-tests=3Dfalse"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

