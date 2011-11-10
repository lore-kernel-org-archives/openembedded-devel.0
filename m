Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROQEl-0002d9-LO
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 09:43:55 +0100
Received: by faat2 with SMTP id t2so2675986faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 00:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8wIiInTcpUz49L9DSiAaSTzJvCVj4v/+9ybBphYo8lk=;
	b=up5I54pOxho/GeU4sgB2jWV+XhD2+wRe8C8X1hhmHhkWRTOx+qdtzT0xN4wpZe6FBV
	W1zvtLxz1AsemA0506NWF5SuL9KlSWfk+Cz3oUppJRtKBuVzDjDMZyWS/L3BEIifzDj0
	+tT0mQVLUEuDtU1YsrNtHHE3Z9f6bGDNQf9w0=
Received: by 10.223.94.143 with SMTP id z15mr10618424fam.32.1320914259513;
	Thu, 10 Nov 2011 00:37:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k26sm10255865fab.8.2011.11.10.00.37.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 00:37:38 -0800 (PST)
Date: Thu, 10 Nov 2011 09:37:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111110083727.GI21022@jama.jama.net>
References: <cover.1320860740.git.Martin.Jansa@gmail.com>
	<31a2761c1b9ca9e31445017b8180474813aecef4.1320860740.git.Martin.Jansa@gmail.com>
	<j9g1t8$4f8$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <j9g1t8$4f8$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe 1/4] mplayer-common: import from OE-classic
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
X-List-Received-Date: Thu, 10 Nov 2011 08:43:56 -0000
X-Groupsio-MsgNum: 35287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CNK/L7dwKXQ4Ub8J"
Content-Disposition: inline

--CNK/L7dwKXQ4Ub8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2011 at 09:27:20AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 09-11-11 18:47, Martin Jansa schreef:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >=20
> > * commit b28081b6039db85f18bf9e722fece59bff6e7b0f
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> > .../recipes-multimedia/mplayer/mplayer-common.bb   |   22
> > ++++++++++++++++++++ .../mplayer/mplayer-common/mplayer.conf           =
 |
> > 15 +++++++++++++ 2 files changed, 37 insertions(+), 0 deletions(-) crea=
te
> > mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer-common.bb create
> > mode 100644
> > meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
> >=20
> > diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb
> > b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb new file mode
> > 100644 index 0000000..889bb95 --- /dev/null +++
> > b/meta-oe/recipes-multimedia/mplayer/mplayer-common.bb @@ -0,0 +1,22 @@=
=20
> > +# Copyright Matthias Hentges <devel@hentges.net> (c) 2006 +# License:
> > MIT (see COPYING.MIT) + +DESCRIPTION =3D "Preconfigured mplayer
> > preferences" + +LICENSE =3D "MIT" +LIC_FILES_CHKSUM =3D
> > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2=
0420"
> >
> >=20
> +
> > +PV =3D "0.0.1" + +SRC_URI =3D "file://mplayer.conf" + +# Yes, really
> > /usr/etc!!! +do_install() { +	install -d "${D}/usr${sysconfdir}/mplayer=
"=20
> > + +	install -m 0644 ${WORKDIR}/mplayer.conf
> > "${D}/usr${sysconfdir}/mplayer" +} + +FILES_${PN} =3D
> > "/usr${sysconfdir}/mplayer" + +inherit allarch diff --git
> > a/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf
> > b/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf new fi=
le
> > mode 100644 index 0000000..92aeb15 --- /dev/null +++
> > b/meta-oe/recipes-multimedia/mplayer/mplayer-common/mplayer.conf @@ -0,0
> > +1,15 @@ + +# You probably shouldn't touch these +ac=3Dmad, +ao=3Doss,
>=20
> Are those still needed? On armv6 and up the builtin ffmpeg decoder is fas=
ter
> than mad and who is using non-alsa emulated oss nowadays?

default
Selected audio codec: [ffmp3float] afm: ffmpeg (FFmpeg MPEG layer-3 audio)
is terribly slow on armv4t without FPU

but you're right ao could have better default

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CNK/L7dwKXQ4Ub8J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk67jUYACgkQN1Ujt2V2gBz7VQCgq6VzIMkHMZVp2LXFDKo5Fm7M
eS0AoJb4ks1JfaZohJJJFtEEJ8dmtOCN
=LxUa
-----END PGP SIGNATURE-----

--CNK/L7dwKXQ4Ub8J--
