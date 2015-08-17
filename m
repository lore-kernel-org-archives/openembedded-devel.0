Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5D160088
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 21:27:37 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so85170308wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 14:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OTLcpMLaqjLFIVV2IaKAMPGls/Kewd1obiqZhfvWKqI=;
	b=MxVjEv2aPzwFltIdNgXCwYn2UN63m2m0PaXJpffuRdc81ok6UBENJ6f5FfaRPlE/ae
	Dz+D3IJ/2/JGUdoGVz/wOb0bnaT70k9tcmTmJ9bmR2OG7SGzKXIc1Sbg0oA3hm6o9GI7
	7PQrOxqLkfk606710QL6TDpLbsnC726pDpD0khHzMIrV8i1LjE/huHXKP31uJhV14ko5
	ijFX+7hKhaCIfA4gyK+yGwke2XBqBJYF1CWmaMVwy55Vj8LEF+QtUGsdvBekmxqJ+mj3
	nUeMjsGOXkIWZoZZhrsuNBjEiFgPTu3miMXzjVSLd0xiZQXkKd71v25aqzCFS2JMYVOY
	dlSA==
X-Received: by 10.194.203.3 with SMTP id km3mr6329059wjc.114.1439846857718;
	Mon, 17 Aug 2015 14:27:37 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	b13sm18398204wic.15.2015.08.17.14.27.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Aug 2015 14:27:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 17 Aug 2015 23:27:42 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150817212742.GA2451@jama>
References: <1437743901-28008-1-git-send-email-adraszik@digisoft.tv>
	<20150727163405.GE307@jama>
	<93BD997E-308F-455D-AD8D-B414EE9B4200@gmail.com>
MIME-Version: 1.0
In-Reply-To: <93BD997E-308F-455D-AD8D-B414EE9B4200@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] rsnapshot: make this an allarch package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Aug 2015 21:27:42 -0000
X-Groupsio-MsgNum: 56753
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2015 at 03:39:07PM -0700, Khem Raj wrote:
>=20
> > On Jul 27, 2015, at 9:34 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >=20
> > On Fri, Jul 24, 2015 at 02:18:21PM +0100, Andr=E9 Draszik wrote:
> >> From: Andr=E9 Draszik <git@andred.net>
> >>=20
> >> rsnapshot is just some perl script(s), no machine specific binaries.
> >=20
> > NAK
> >=20
> > The recipe has bunch of RDEPENDS on TUNE_PKGARCH recipes so it cannot be
> > allarch.
> >=20
> > Recipe by default is TUNE_PKGARCH not MACHINE_ARCH as commit message may
> > suggest.
>=20
>=20
> I understand the NAK since it has runtime dependencies on binary compiled=
 programs like rsync which are architecture dependent
> due to different ISA and so on. However, from another perspective, its a =
script which is invoking/executing a standard utility
> much like its own interpreter say bash or perl whichever it needs and bas=
h, perl etc. are natively compiled binaries. going by this logic
> we can really not have allarch package at all. So IMO runtime dependencies
> for script based packages should not bar it from being a allarch package.=
 Since, I can still take the same ipk and install it on arm or mips
> and it will work as long as they provide its dependencies like rsync perl=
 etc.

With current sstate checksum generators accepting this will cause all
these "allarch" recipes to be "rebuilt" (from sstate) every time you change
MACHINE to something with different TUNE_PKGARCH.

Keeping it TUNE_PKGARCH means that you'll always get exactly the same
package from feed (not the last one "built" randomly changing when
builder builds different MACHINEs in a loop).

>=20
> >=20
> >> ---
> >> meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>=20
> >> diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb b/meta=
-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> >> index d680511..0593eef 100644
> >> --- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> >> +++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
> >> @@ -29,7 +29,7 @@ SRC_URI =3D "git://github.com/DrHyde/${BPN};branch=
=3Dmaster;protocol=3Dgit \
> >>=20
> >> S =3D "${WORKDIR}/git"
> >>=20
> >> -inherit autotools
> >> +inherit allarch autotools
> >>=20
> >> # Fix rsnapshot.conf.default:
> >> # don't inject the host path into target configs.
> >> --
> >> 2.1.4
> >>=20
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlXSUc0ACgkQN1Ujt2V2gBx3iACYwSecXb+3GzjRuvLlnqjuug4+
HgCguCWo62TK2o7sraFI4NJrl1cZKHY=
=0i4+
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
