Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pakzd-0008AQ-6j
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 09:15:18 +0100
Received: by fxm17 with SMTP id 17so15062655fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 00:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=wRzdJotx+iNXWZnBYthuY0gsCyqZjObclfqJwKhaLt4=;
	b=T72mALqvBK6pD6qm8p4quSYu0p6XSNHqzMPJT+i/omoxulYhJd2LnzJPBff/TVh/LZ
	w79y6QGJGfudMvflAfonz3Iy3fkqviLrYnt88JZ/YCPNfGrTw53bjAUgLQvJZhvj2Kaz
	OHzbG88FmZ92hCl/WI6+GLSdxX3/dBPCccX+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qRuNsmWF5g4vIT12OVd9xkIVN1ppgIN6K2TdQ052lp8Adu8+c+izIY4RdXlkRB9gUK
	UAylc+JTQD2ejXnBRiItYKV2wAE9CGk1FP1/DVUBidwX5m2VBrhj5lSznT/f6gAql0g9
	7dU9eX+yLq2Gp0zPQ3S/m6ahjoBsX6gB7IlM8=
Received: by 10.223.75.194 with SMTP id z2mr1190544faj.38.1294301660696;
	Thu, 06 Jan 2011 00:14:20 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n1sm5751106fam.16.2011.01.06.00.14.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 06 Jan 2011 00:14:20 -0800 (PST)
Date: Thu, 6 Jan 2011 09:14:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110106081431.GC3205@jama>
References: <1294241612-28405-1-git-send-email-Martin.Jansa@gmail.com>
	<1294241612-28405-2-git-send-email-Martin.Jansa@gmail.com>
	<ig3svu$g6s$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ig3svu$g6s$2@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] mysql5-native: put make install to do_install after autotools_stage_all was removed with do_stage in eaf0fc03acfb262bcd614a14086a1b28ec850f46
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
X-List-Received-Date: Thu, 06 Jan 2011 08:15:19 -0000
X-Groupsio-MsgNum: 27759
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xesSdrSSBC0PokLI"
Content-Disposition: inline

--xesSdrSSBC0PokLI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2011 at 09:03:10AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 05-01-11 16:33, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes/mysql/mysql5-native_5.1.40.bb |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >=20
> > diff --git a/recipes/mysql/mysql5-native_5.1.40.bb b/recipes/mysql/mysq=
l5-native_5.1.40.bb
> > index 40d07ec..8001783 100644
> > --- a/recipes/mysql/mysql5-native_5.1.40.bb
> > +++ b/recipes/mysql/mysql5-native_5.1.40.bb
> > @@ -12,6 +12,10 @@ EXTRA_OEMAKE =3D ""
> >  EXTRA_OECONF =3D " --with-embedded-server "
> > =20
> >  do_install() {
> > +        oe_runmake 'DESTDIR=3D${D}' install
> > +        mv -f ${D}${libdir}/mysql/* ${D}${libdir}
> > +        rmdir ${D}${libdir}/mysql
> > +
> >          install -d ${D}${bindir}
> >          install -m 0755 sql/gen_lex_hash ${D}${bindir}/
> >  }
>=20
> Weird, I saw no build errors with my builds from scratch, but I guess my
> builds only needed gen_lex_hash and target headers.
>=20
> Which recipes actually need the native libs and headers?

I've noticed it in azy-native (see 1st patch).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xesSdrSSBC0PokLI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEUEARECAAYFAk0leecACgkQN1Ujt2V2gBwswACYqNJ/f2CeaGT7UM/oAjF54Tet
ogCfa3OKreh7uCYn1Eut8r8JVPfe1cw=
=jtsO
-----END PGP SIGNATURE-----

--xesSdrSSBC0PokLI--
