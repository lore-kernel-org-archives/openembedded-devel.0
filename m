Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id E8470736BA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 05:57:42 +0000 (UTC)
Received: by qgep100 with SMTP id p100so13368614qge.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 22:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=XQbuo5wiwwjBHUnS9RIBzNakIWVphTOZoFsM+/B0bwc=;
	b=cpPvWw5mSXRWrwH2ydW3bdkCVD+Orard9r8Kz4CazpwQyK8NX5SPKORfbzgjBC2No8
	K1xnTzGjZ8F03Zs+DLBlzI1eHKNVE/lanWzOamV7hhwjME0FjSLzc2S11Wshqtuuc++R
	dubgba2V0pU/5wybIEiJBv+MgkZGHVrSsZD2m16iDKl2OMBReyDY85FHF/OFrobQdLfo
	lptET8jGce2z1eCEj4mPbgAuLiX4ifTNgskiyScjU4T7Va2xwDzv8NdtwKAPrV2yvsuU
	+QcgY3hzJIxtqR1VJiGcpTUHUFNg4V1Qv7ObRDqD6+YrSPv6Y1ZClulvu+ecBAXmOqgF
	s+CQ==
X-Received: by 10.140.192.10 with SMTP id n10mr43067167qha.1.1433397464168;
	Wed, 03 Jun 2015 22:57:44 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:243b:97d2:82f:b7e8?
	([2601:9:3580:84c:243b:97d2:82f:b7e8])
	by mx.google.com with ESMTPSA id
	f192sm1823892qhc.37.2015.06.03.22.57.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 22:57:42 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
Date: Wed, 3 Jun 2015 22:57:36 -0700
Message-Id: <CBA7280F-81CF-452E-BF7A-BE50AD15FDCE@gmail.com>
References: <1433387388-7660-1-git-send-email-armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-oe][PATCH 1/5] elbow: duplicate i586 over-ride for i686
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
X-List-Received-Date: Thu, 04 Jun 2015 05:57:45 -0000
X-Groupsio-MsgNum: 55758
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C9C02F0F-C560-48B5-95DF-46E8D0339537";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C9C02F0F-C560-48B5-95DF-46E8D0339537
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 3, 2015, at 8:09 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
> meta-efl/recipes-efl/e17/elbow_git.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-efl/recipes-efl/e17/elbow_git.bb =
b/meta-efl/recipes-efl/e17/elbow_git.bb
> index 16664f9..29881ab 100644
> --- a/meta-efl/recipes-efl/e17/elbow_git.bb
> +++ b/meta-efl/recipes-efl/e17/elbow_git.bb
> @@ -9,6 +9,7 @@ SRCREV =3D "b41fd0bc9514ff61bb2a50d957efe4155fa3e6a8"
> # webkit-efl isn't available for < armv7a
> COMPATIBLE_MACHINE =3D "(-)"
> COMPATIBLE_MACHINE_i586 =3D "(.*)"
> +COMPATIBLE_MACHINE_i686 =3D "(.*)"
> COMPATIBLE_MACHINE_x86-64 =3D "(.*)"
> COMPATIBLE_MACHINE_armv7a =3D "(.*)=E2=80=9D

This whole block may use something like

COMPATIBLE_HOST ?=3D =E2=80=9C(-)=E2=80=9D
COMPATIBLE_HOST_x86 =3D =E2=80=9C(.*)"
COMPATIBLE_HOST_x86-64 =3D =E2=80=9C(.*)=E2=80=9D
COMPATIBLE_HOST_armv7a =3D =E2=80=9C(.*)"

>=20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_C9C02F0F-C560-48B5-95DF-46E8D0339537
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVv6NQACgkQuwUzVZGdMxR0swCgjc/ieiScy9H2bpRox9husXWv
vN4An3CBsSPi/MLjOxjYYYcsO1MMhv5W
=UYvp
-----END PGP SIGNATURE-----

--Apple-Mail=_C9C02F0F-C560-48B5-95DF-46E8D0339537--
