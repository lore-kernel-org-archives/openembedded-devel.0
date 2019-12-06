Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id A7BF97F37D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 15:17:27 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a10so6733602qko.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 07:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PTSOOOZqDqyMOzy6pxPNukOfBY3erYHOKewSc7M6Gsw=;
	b=tFvZBgEJYMbps1nUneFbyEesyaojd6bpRsD91rk1gLSpJFFGA5O2VUJqn/veFMb0Mr
	zWiY479+zX5ERjoqnpa/H2l/FvQDk9YNsmL/cKveST8p7J8tsyFClhgwfsn00IY/xBdh
	105ebBiD5nbox722gr8EYDf1wixWIkXUN15Hpa8oAfZLeuYu7/+hYosuIi5znaQqEbRk
	tP/E+Gn46aWjR55XS5tYAGjql86Vu40zEft7eMYr7M03uN3amf08Le9wIjYMA0ouYtXF
	SM6BPAosAxIrBIbfDtor2gy8Ao8ZgsclKWvlJ1E549xynEsY8BIAIM7OfJNgVGNZMcr7
	dehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PTSOOOZqDqyMOzy6pxPNukOfBY3erYHOKewSc7M6Gsw=;
	b=ircHInntZwlKAvVO3WKmBCJG/W/lf2Uscv/8sQUY9YqfhCcTwJeSpvuJVd2euXrs/S
	cN3pnBmBP2szPfFEgrbiRM/TfvIlXtM0YVZ5utTFOTuQv/OdaAaLVNDMSmCZnkkq92AF
	a8kaD5ruqb4K3ZMkgXEKx/j/7PAOIsY6aAFxNInTG5bEqAkwzovfgf+zgDrxqKZp/vCE
	uaI1U2pElt2rEDLevIVhZ8gQTG4qwnGadNbulyfFw7HwlO68Zcbllx8BdYJEB2UZ9ldb
	wgZXRoYJhXo9TNMje5oSshTo9hpBUCUvIggCLYNHINcvuuyeXcU2TbGUGSGLyrZQAUq9
	jyUw==
X-Gm-Message-State: APjAAAX7m5obDk7AZfWL+jWzy1CtCxCoahkdZoViBuyZQPKexTQQdTz0
	3pwzGAFC6Sz8CjsKBVrOmW4yIPkriA3fGvbDc9I=
X-Google-Smtp-Source: APXvYqz3ZFBihd0r2fAWz21PFjNFUlzEEIJ+TDKEnD7uPVnhBjWtbmJYi1fVVisncLnFqRPiE9DyjWxHsXoIdJsvIsk=
X-Received: by 2002:a37:a348:: with SMTP id m69mr14868785qke.474.1575645448146;
	Fri, 06 Dec 2019 07:17:28 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-11-schnitzeltony@gmail.com>
In-Reply-To: <20191206000912.19841-11-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Dec 2019 07:17:02 -0800
Message-ID: <CAMKF1soqrjdjLMipGuumZAAouowsrK4RvNn+65Pv69yvYsmMUQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 10/21] rest: initial add 0.8.1
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
X-List-Received-Date: Fri, 06 Dec 2019 15:17:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

http://errors.yoctoproject.org/Errors/Details/290481/

On Thu, Dec 5, 2019 at 4:10 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> It is an optional dependency for upcoming gnome-online-accounts
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-gnome/recipes-gnome/rest/rest_0.8.1.bb | 28 +++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
>
> diff --git a/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.8.1.bb
> new file mode 100644
> index 000000000..acbc23f21
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/rest/rest_0.8.1.bb
> @@ -0,0 +1,28 @@
> +SUMMARY =3D "library to access web services that claim to be "RESTful""
> +HOMPAGE =3D "https://wiki.gnome.org/Projects/Librest"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
> +
> +GNOMEBASEBUILDCLASS =3D "autotools"
> +
> +DEPENDS =3D " \
> +    libxml2-native \
> +    glib-2.0-native \
> +    glib-2.0 \
> +    libsoup-2.4 \
> +"
> +
> +inherit gnomebase gobject-introspection gtk-doc vala
> +
> +SRC_URI[archive.md5sum] =3D "ece4547298a81105f307369d73c21b9d"
> +SRC_URI[archive.sha256sum] =3D "0513aad38e5d3cedd4ae3c551634e3be1b9baaa7=
9775e53b2dba9456f15b01c9"
> +
> +do_configure_prepend() {
> +    # rest expects introspection.m4 at custom location (see aclocal.m4).
> +    cp -f ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S}=
/build
> +}
> +
> +do_compile_prepend() {
> +    export GIR_EXTRA_LIBS_PATH=3D"${B}/rest/.libs"
> +}
> +
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

