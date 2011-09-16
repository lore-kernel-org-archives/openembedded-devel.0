Received: from mail-ew0-f42.google.com ([209.85.215.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4ZEd-0004dQ-56
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:17:43 +0200
Received: by ewy2 with SMTP id 2so2556476ewy.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 07:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ryh9x1fxCLQVKegYBeLZozQzQtDYwSjHdRqhnlEOchs=;
	b=ufKPtDjtDwk/3JXPGMUVSbuEKfMI2sU+RkTyFI/v8vrp7SJCrFaCkZxXuvwuLS1pWy
	HtTy/xd5KWTaVuay7db8LtSvAgHlxVSNDzUglV4TBszFE38DIhMiIrL0ERPyQmLufqSc
	ZF1uzOeMLtoPDReqJEYiRIAKwJ6NN8WpyBPxY=
Received: by 10.223.11.23 with SMTP id r23mr1414099far.38.1316182350091;
	Fri, 16 Sep 2011 07:12:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l20sm10682558fad.12.2011.09.16.07.12.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 07:12:28 -0700 (PDT)
Date: Fri, 16 Sep 2011 16:12:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20110916141221.GM7445@jama.jama.net>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
	<e18a18842f027546d0a38396d498246513d338fa.1316181283.git.Martin.Jansa@gmail.com>
	<4E7357DD.60004@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4E7357DD.60004@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Joel A Fernandes <joelagnel@ti.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 02/10] vlc: drop depends not yet in meta-oe
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
X-List-Received-Date: Fri, 16 Sep 2011 14:17:43 -0000
X-Groupsio-MsgNum: 34306
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RXc6EO4W1yUvSQ0X"
Content-Disposition: inline

--RXc6EO4W1yUvSQ0X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2011 at 08:06:21AM -0600, Gary Thomas wrote:
> On 2011-09-16 07:56, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   meta-oe/recipes-multimedia/vlc/vlc.inc |    3 ++-
> >   1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-m=
ultimedia/vlc/vlc.inc
> > index ce608dc..aecfb3a 100644
> > --- a/meta-oe/recipes-multimedia/vlc/vlc.inc
> > +++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
> > @@ -4,7 +4,8 @@ LICENSE =3D "GPLv2"
> >   SECTION =3D "multimedia"
> >
> >   DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad virtual/lib=
sdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
> > -           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad l=
ibid3tag liba52 mpeg2dec', d)}"
> > +"
> > +#           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad =
libid3tag liba52 mpeg2dec', d)}"
> >
> >   SRC_URI =3D "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-=
${PV}.tar.bz2"
> >
>=20
> Is this such a good idea, given that bitbake support for commented contin=
uation lines is deprecated?

This isn't comment in multiline variable and it doesn't even end with
backslash..

so such line is pretty safe and I hope that Joel will reply to my issues
with vlc.inc:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/0349=
54.html
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/0349=
57.html

and fix it properly later..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RXc6EO4W1yUvSQ0X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5zWUUACgkQN1Ujt2V2gBwx8gCfbrw61bmYDGEZIS6YLRimRAkQ
XzIAoJ7pGoERSj3B9Syw3VY+3UesNZex
=i3EN
-----END PGP SIGNATURE-----

--RXc6EO4W1yUvSQ0X--
