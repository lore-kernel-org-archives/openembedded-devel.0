Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RYCPx-0002Tg-V0
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Dec 2011 08:59:54 +0100
Received: by eekb15 with SMTP id b15so164346eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 23:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Ir22wyJMfqkqspaVJH1C2+S7na8EeY7vP0fsu+rp2Wg=;
	b=PBwudhRqNEJZP/DVUJYTa8Go4y4uYOrc4lz2EOcvQS++mG1X5RL7AtDss8s2azDK8a
	xowfB1lAT5KvhijOi1KTFTN+QAziRmzV9pTTAb6NMv6APgS9iR/eP4oSgLDtIYsPCfai
	alfj8E5bjj9K/Z+CJglp+ifik1Ie/eJqgudnM=
Received: by 10.213.20.145 with SMTP id f17mr1579593ebb.147.1323244385903;
	Tue, 06 Dec 2011 23:53:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm2841687eea.6.2011.12.06.23.53.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 23:53:04 -0800 (PST)
Date: Wed, 7 Dec 2011 08:52:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111207075252.GC3897@jama.jama.net>
References: <1323207144-440-1-git-send-email-Martin.Jansa@gmail.com>
	<1323207144-440-2-git-send-email-Martin.Jansa@gmail.com>
	<jbn5n9$ia9$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jbn5n9$ia9$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][meta-oe][meta-efl 2/2] mplayer2: fix DSO issue with new binutils
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
X-List-Received-Date: Wed, 07 Dec 2011 07:59:54 -0000
X-Groupsio-MsgNum: 35950
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2011 at 08:47:58AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 06-12-11 22:32, Martin Jansa schreef:
> > *
> > /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-lin=
ux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
> >
> >=20
> libmpdemux/demux_ogg.o: undefined reference to symbol '_ilog'
> > /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv4t-oe-lin=
ux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.3/ld:
> >
> >=20
> note: '_ilog' is defined in DSO
> > /OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/libvorbis.so.0 so try
> > adding it to the linker command line=20
> > /OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/libvorbis.so.0: could
> > not read symbols: Invalid operation
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> This one doesn't apply when I get it from patchwork :(

Ah sorry, looks like I've unintentionally sent version which does apply
after
http://patchwork.openembedded.org/patch/15773/
I'll resend later (after finish of image build)

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk7fGiwACgkQMkyGM64RGpFnPQCgq7c5zNJgq/zHo7xECShzVqQD
> tJEAoKWFWrQqgsX2LYKrnm6b3feIYl2x
> =3Djw30
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7fG1MACgkQN1Ujt2V2gBwMvACggnbCNIQQ7trP+NneqvdWpCMQ
vqoAoJNpQiUAi740Yn8BwqD/HkmCkz45
=Aylw
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
