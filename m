Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6A37E73D16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 22:55:32 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so29787444pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 15:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=wWQ32p0ftQyLpqVeo8A9NE/tv4RBxxSpJO2+FG3U9DQ=;
	b=n3/jnJ/1ifS5kmOECaEm3am5B2aDAtDdiiRra0ZQyVd/9GiLbzsDs+ofPkb/fgGQDi
	JYgydtflzS3Dq63jcJ/4Xes5/9SznWNNvqLKeGS7Rj61luw0vvbdCl/7kj5wHp1MNqJs
	27BOyJAMyu6QXURePPXmyXykDiJR6RgcIqOut+jdbJy8v7yy7ewlYyhFEOl6f4zW2zv8
	D5Uyndq3kj8JgAtRLUxTx/AiXjVAgTn82fPXqHkCNRTf1IxZTzEARMREUIthshlnPB1f
	feNXg9wKtPvZzcmHD4/Oc98qmG3iQ6ha4Q6PhA/kir8i7gnTlQ58VJifsWfIa6rZd8ks
	yYhg==
X-Received: by 10.70.46.161 with SMTP id w1mr32624870pdm.16.1431471333909;
	Tue, 12 May 2015 15:55:33 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ccd0:4222:99ed:8bcf?
	([2601:9:3580:84c:ccd0:4222:99ed:8bcf])
	by mx.google.com with ESMTPSA id
	nq2sm17264960pdb.70.2015.05.12.15.55.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 15:55:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1431458743-25856-1-git-send-email-picmaster@mail.bg>
Date: Tue, 12 May 2015 15:55:18 -0700
Message-Id: <99E5B291-EE3A-42A8-8F69-C0A905CE0626@gmail.com>
References: <1431458743-25856-1-git-send-email-picmaster@mail.bg>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-browser][PATCH] chromium: Use bitbake variable instead of shell variable
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
X-List-Received-Date: Tue, 12 May 2015 22:55:35 -0000
X-Groupsio-MsgNum: 55483
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3B7936EF-B196-4B16-AD74-EBB60A6E68E1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3B7936EF-B196-4B16-AD74-EBB60A6E68E1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 12, 2015, at 12:25 PM, Nikolay Dimitrov <picmaster@mail.bg> =
wrote:
>=20
> Change CHROMIUM_BUILD_TYPE to Bitbake variable, otherwise Chromium =
files are
> not installed in the holding area, and Chromium fails to start on the =
target.
>=20
> Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>

this is ok.

> ---
> recipes-browser/chromium/chromium.inc |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-browser/chromium/chromium.inc =
b/recipes-browser/chromium/chromium.inc
> index a9e9b8a..72a649d 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -7,7 +7,7 @@ COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
> COMPATIBLE_MACHINE_armv6 =3D "(.*)"
> COMPATIBLE_MACHINE_armv7a =3D "(.*)"
>=20
> -export CHROMIUM_BUILD_TYPE=3D"Release"
> +CHROMIUM_BUILD_TYPE =3D "Release"
>=20
> inherit gettext
>=20
> --
> 1.7.10.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_3B7936EF-B196-4B16-AD74-EBB60A6E68E1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVShOQACgkQuwUzVZGdMxQu1ACfSyQ6y6s9WEisbW0c71q2o4ol
gcwAnRqh2+bCj0snDs4ekGydaZGemAuI
=lK52
-----END PGP SIGNATURE-----

--Apple-Mail=_3B7936EF-B196-4B16-AD74-EBB60A6E68E1--
