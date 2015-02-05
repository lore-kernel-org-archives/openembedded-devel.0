Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 282C760169
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:54:33 +0000 (UTC)
Received: from svr-orw-fem-03.mgc.mentorg.com ([147.34.97.39])
	by relay1.mentorg.com with esmtp 
	id 1YJPhK-0000PV-7c from Joe_MacDonald@mentor.com ;
	Thu, 05 Feb 2015 08:54:34 -0800
Received: from burninator (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.3.224.2; Thu, 5 Feb 2015
	08:54:33 -0800
Received: by burninator (Postfix, from userid 1000)	id 390CA58031C; Thu,  5
	Feb 2015 11:54:31 -0500 (EST)
Date: Thu, 5 Feb 2015 11:54:31 -0500
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150205165430.GH5273@mentor.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org, "Viguera,
	Javier" <Javier.Viguera@digi.com>
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
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
X-List-Received-Date: Thu, 05 Feb 2015 16:54:39 -0000
X-Groupsio-MsgNum: 54114
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IJFRpmOek+ZRSQoz"
Content-Disposition: inline

--IJFRpmOek+ZRSQoz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and diz=
zy] On 15.02.05 (Thu 16:49) Paul Eggleton wrote:

> On Tuesday 03 February 2015 09:05:54 Viguera, Javier wrote:
> > > -----Original Message-----
> > > From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> > >=20
> > > I agree, #2 is the best option to take care of the older branches.
> > >=20
> > > Tom, can you please fetch the following files and add them to the OE
> > > source
> > >=20
> > > mirror:
> > >   http://distfiles.lesslinux.org/crda-1.1.3.tar.bz2
> > >   http://distfiles.lesslinux.org/2013.01.11-regulatory.bin
> > >=20
> > > I've verified the md5sums match the recipe:
> > >   29579185e06a75675507527243d28e5c  crda-1.1.3.tar.bz2
> > >   e0c8a5ca63fb8bf803213f9a0c90b50b  2013.01.11-regulatory.bin
> >=20
> > Good to know we agree on the best option.
> >=20
> > Could I make a humble request to speed up the copy of the packages to OE
> > source mirror?
> >=20
> > We have a BSP layer that depends on this and currently our build is bro=
ken
> > fetching crda.
>=20
> I've been thinking about this, and this is getting ridiculous. Instead of=
=20
> manually adding files to the OE source mirror, I think it's time we simpl=
y had=20
> a populated fallback source mirror that has all the sources for at least =
the=20
> recipes in layers hosted on openembedded.org (if not other commonly used=
=20
> layers) aside from OE-Core which is already handled by the yoctoproject.o=
rg=20
> mirrors. This issue keeps coming up far too often.
>=20
> Is there a possibility we can set this up?

That would be hugely helpful.

-J.

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
--=20
-Joe MacDonald.
:wq

--IJFRpmOek+ZRSQoz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJU06BGAAoJEEn8ffcsOfaWT1gIAIeavz8mqC/Y/YfYisL1j6kD
IZoTBI6KKTzmbYN7nWS8s1fbxceOlR9j5cmYZeELQ+t+cZYYc9f2EC53vjMUr5KD
R/tqjiQYRHtLWjws74v+KI2iRrc/T58V2oroRPbGHHOBkH73e+iol2/FP0Iwm1+z
5Bs8aQ+oe4ZME0O/2fIa74Tl0I1tx44bK6G/A6+8iBVFD59JuP8/ZRbL+qN+NnoK
DfDgyCbfTcnPq6gd8RLxsjx1Fkgqtv+o/8zJCG2CU3cVDXnsF4M2ZkcdzT2feBUE
rjf3v+OCHH3/okFzQ6IYN3jZswNDbDNvrlvQ3NWP7BJdo4GuLk8cKJdUMf/Rstk=
=rCsF
-----END PGP SIGNATURE-----

--IJFRpmOek+ZRSQoz--
