Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1DS5-0003lY-RE
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 10:25:51 +0200
Received: by eyb7 with SMTP id 7so5023252eyb.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OZNG5jl4m/8JWKj3xKajJj/LJDmTLjX0i+EdzlBD8nI=;
	b=N9duAg/nyHBJFPwj95KEmq+huVRp6QkaJ84DxnDsTN+UvJMnFQkEzJ0FuKQR/fKfK0
	Q7yy2KdUulMGNvrvEKxmGMZIDhBLW6soJMnetyTQFCMXbF9ZLhYmyTzdcz+qiX5hN54/
	rERWamlpFDh9vNZewl/64G/8rG9jHx3aqHcLw=
Received: by 10.213.33.135 with SMTP id h7mr1847921ebd.73.1315383643008;
	Wed, 07 Sep 2011 01:20:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e4sm5108851eec.10.2011.09.07.01.20.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Sep 2011 01:20:41 -0700 (PDT)
Date: Wed, 7 Sep 2011 10:20:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110907082035.GA19221@jama.jama.net>
References: <1315341136-25548-1-git-send-email-eric@eukrea.com>
	<CA+chaQdYjN2tEhr6NXa0Qvix-1MoRPrG3iVMnD6ueLsSvXL+9g@mail.gmail.com>
	<1315382772.3553.33.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1315382772.3553.33.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] bianutils-2.20.1: fix checksums
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
X-List-Received-Date: Wed, 07 Sep 2011 08:25:51 -0000
X-Groupsio-MsgNum: 34110
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2011 at 10:06:11AM +0200, Paul Menzel wrote:
> Dear Martin, dear Eric,
>=20
>=20
> Eric, there is a typo in the commit summary: An =C2=BBa=C2=AB slipped in =
binutils.
>=20
>=20
> Am Mittwoch, den 07.09.2011, 09:58 +0200 schrieb Martin Jansa:
>=20
> > This is probably caused by replacing 2.20.1 tarballs with links to 2.20=
=2E1a.
>=20
> the archives were replaced because of the =E2=80=9CGPL violation=E2=80=9D=
 I think.
>=20
> http://nickclifton.livejournal.com/9067.html
>=20
> > IMHO would be better to change recipes to say 2.20.1a and force
> > everybody to redownload it with new name (otherwise breaks checksums
> > for everybody with old 2.20.1 in downloads dir)
>=20
> Good point.
>=20
> > Also please provide at least "diff -rq" when sending fix checksums
> > patches, otherwise checksums are quite useless.
>=20
> Do you mean of the archives? To see the differences in the source?
>=20
> This is the first time I heard of that, but it is a reasonable
> suggestion.

Yes, if you're able to find "old" tarball then "diff -rq" on unpacked
new and old tarball gives good idea what was changed, if it was just
some formality or something fishy..

You can find it at least in my "fix checksum" commits, ie:
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D79d295c31e64=
e972608d5dde5d57e6250d7ca77c
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3De341fb2ca67e=
a7670ca15379050992e81efa5697
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D31fa1970ca30=
5ff72afd3cf193b85550c6f3aa88

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5nKVMACgkQN1Ujt2V2gBxwnACcDuKEJWR/Tbk8HnH3Y2WtZKbm
ljwAn1qxAPlOtYjDU+P6lXFlJcUSgjQs
=aXMs
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
