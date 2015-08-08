Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8A0767FA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 22:14:25 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so79307353pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=in8BIQTa17ID5xr1QxWea25dkRSZ6qkYAk/KHezb2+k=;
	b=CMeVL/eCCBga3ayk0ckSgVskJjJbydBDs0OJzJOjTSVG/KE+piTPABuDKIDYJcHETx
	IsFFGJeht87+xz9w7rG37lQDOWeCPbi/89ojcwZ/W2R78ePVyWY/oyeaPrPSzw3wg+or
	aPOianGig9mTZJ62UJBv6DUUx4Aezp+S/g1Ug0wT5I+xiI2kpwrMGqSRkCndz6Eq/Enz
	0+Itpew+hRdlnmGuM54K6XpuCWOhkBtqbciM1D5dYaJjRZf4gMoDAb9vUSd4cRwbwRvE
	CpSy6rZhyHmeqgIckR1GybwKRTzaTSFd7ltUJyzY9H9Lw4DmiXOgrAQxAX7A2GimLiBR
	eCNg==
X-Received: by 10.66.159.68 with SMTP id xa4mr30237094pab.105.1439072065886;
	Sat, 08 Aug 2015 15:14:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id
	ow5sm14644581pdb.30.2015.08.08.15.14.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 15:14:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55B8D485.7080207@pr.hu>
Date: Sat, 8 Aug 2015 15:14:20 -0700
Message-Id: <27501214-4FE0-4D4B-8E0F-797B153B9988@gmail.com>
References: <55B8D485.7080207@pr.hu>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: Trying to resolve build-time cyclic dependency between packages
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
X-List-Received-Date: Sat, 08 Aug 2015 22:14:30 -0000
X-Groupsio-MsgNum: 56608
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1395D07F-5358-4AA8-9F78-BDE44238DC6D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1395D07F-5358-4AA8-9F78-BDE44238DC6D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 29, 2015, at 6:26 AM, Boszormenyi Zoltan <zboszor@pr.hu> wrote:
>=20
> Hi,
>=20
> I have a customized Mesa 10.6.3 package recipe which depends on libva
> to be able to build its mesa-va-driver subpackage, but libva also =
depends
> on Mesa to support GLX.
>=20
> Previously, I simply created a libva-noglx package that builds libva
> with --disable-glx that Mesa depend on and the "real" libva package =
can
> depend on Mesa.
>=20
> But since I also have to produce an SDK image with all the *-dev =
packages,
> creating such an initial image with bitbake fails because of a =
conflict
> in the dependency chain: libva-dev -> mesa-dev -> libva-noglx-dev.
>=20

since libva-noglx is sort of a bootstrap package, you could empty/delete =
out the content
its puts into -dev packages and conflict will be gone. Other option is =
that you share
the content of -dev package in exclusive manner between libva and =
libva-noglx such
that they don=E2=80=99t package duplicate files

> I have come up with the attached bbclass (based on Yocto 1.6) that
> now Mesa can inherit and that patches the RDEPENDS / RRECOMMENDS
> variables according to externally set variables. The comment at
> the beginning of the file explains how to use it.
>=20
> This pushes the cyclic dependency to opkg which happily breaks it and
> installs both libva* and *mesa* packages properly. Creating the =
initial
> image via bitbake works now.
>=20
> Comments?
>=20
> Best regards,
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>=20
> <cyclic-deps.bbclass>--
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_1395D07F-5358-4AA8-9F78-BDE44238DC6D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGfz8ACgkQuwUzVZGdMxSW9ACgjbBnRqCkHcVNwQOcSSoSpfmr
dyMAn1UL94JufyAN1RPEJRQvMSZobxI/
=zF/E
-----END PGP SIGNATURE-----

--Apple-Mail=_1395D07F-5358-4AA8-9F78-BDE44238DC6D--
