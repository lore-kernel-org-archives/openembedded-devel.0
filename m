Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRROo-0002dp-1l
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 18:02:33 +0200
Received: by fxm19 with SMTP id 19so3671356fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WJ3xvSLNLxbmX7lHzT9sRQnp07tJkfKNw5B3dokJwYY=;
	b=TvYDxnrGhMb5I8/370k1SfnpaYR2pQnh0Y+07tdmLPTcZZDqU15htDh6lKvf/4K6ay
	Iboe5XtbWT1aG32e9fi911wntrCqJATh+SjSTuOm/1c1+8ywb3JXV/XBIUjDmbvGvRi1
	RJcgWvSthJ7c3Dw2IDyDHVqG4163jBC4/gRs4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Aimy+iKzAsKx2y+cBPyA+FY98CNiDavGo/OVJU/JBCNG76fYdDXhU2jEYjIJL/5nMC
	uF7JB14rNfbRpdT6Nrfle8AtVRRUgn0Q4dnybVWafzLkLbqnXEVF8DyzJsddJUy0lDNB
	NkaycLljveby6Buiv/KNNyseUkUlZ94jZZ9PQ=
Received: by 10.223.145.78 with SMTP id c14mr160183fav.75.1306857456085;
	Tue, 31 May 2011 08:57:36 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id h1sm92028fag.11.2011.05.31.08.57.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 08:57:35 -0700 (PDT)
Date: Tue, 31 May 2011 17:57:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110531155728.GA23647@jama.jama.net>
References: <cover.1306856963.git.Martin.Jansa@gmail.com>
	<b2a70421756ef2cc7d59c82fb4cd02141e99a52c.1306856963.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b2a70421756ef2cc7d59c82fb4cd02141e99a52c.1306856963.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/3] xserver-xorg: upgrade from 1.10.1.902 to 1.10.2 and replace part of randr-support.patch with upstream patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 16:02:33 -0000
X-Groupsio-MsgNum: 32431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline

--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 05:49:53PM +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---

> -EXTRA_OECONF +=3D " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-kdriv=
e --disable-xephyr --disable-xsdl --disable-xfake --disable-xfbdev --disabl=
e-dmx"
> +EXTRA_OECONF +=3D " ${CONFIG_MANAGER_OPTION} ${XINERAMA} --disable-xsdl =
--disable-xfake --disable-xfbdev --disable-dmx"
>  EXTRA_OECONF +=3D " --enable-dri2 --disable-unit-tests --disable-docs --=
disable-devel-docs"
> =20
>  export LDFLAGS +=3D " -ldl "

I forgot to update commit message, but I've also enabled kdrive/xephyr
per otavio request from oe.dev where it did ICE with gcc-4.5

With gcc-4.6 from meta-oe it builds fine, would be great if someone with
gcc-4.5 from meta-oe or gcc-4.6.0/gcc-4.5.0 from oe-core test it before
merging it.

If it still fails to build then we can disable it again or fix toolchain
if it's worth it..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3lD+gACgkQN1Ujt2V2gByRVwCfYotwOch2UgsVoB4xUqOM/Quv
qjgAn3xUyKj4BjOJHYIMT6mwmhGUckx4
=9Cm2
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
