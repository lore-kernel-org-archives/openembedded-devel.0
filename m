Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5C3AD65D19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 21:18:12 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so28519pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 14:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=qHGBHpXKCY2tXyVghsi+QT8jYLIqR+JLFsXNFP+VywE=;
	b=WLS3Ce8JV73ijj+oLeM6Ty6kIiptT/hgla9h5rtgBrrvOMKMICOvThe602DSr8fsbW
	dEV4kWgBOwdT1CRjeLKFkt9jGEvcYiiMwDvKoVwZauwgIpSTWo83dPJknf4KIj9y2jzu
	SoNm0K2H9uapvBfaHBegwLiGRA0cpNWk5OcmcENot9uQ+WHiVlyIGrYT+oyKJMxXsddW
	9a8MWF1a5W+L70UBf0dOa7sNbJD1otRW5+igSrr7vaS9PkiJ+aV3fFMs3SLXs1ubl++b
	ZrLNMiB/XOni/orGQqL5sI3/p/a35p+YEZY7u4Nk23+O4ZD0TNUhgcjknFdvhxqJX488
	kv2Q==
X-Received: by 10.68.57.239 with SMTP id l15mr9281580pbq.93.1432243094138;
	Thu, 21 May 2015 14:18:14 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:52c:79de:9f7f:c3b?
	([2601:9:3580:84c:52c:79de:9f7f:c3b])
	by mx.google.com with ESMTPSA id mb4sm18925pdb.63.2015.05.21.14.18.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 21 May 2015 14:18:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <555E2359.3080509@gmail.com>
Date: Thu, 21 May 2015 14:18:07 -0700
Message-Id: <8824256D-28B9-48F4-8155-2185F236B4F2@gmail.com>
References: <5548E485.6080505@gmail.com> <555E2359.3080509@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: ODROID-C1 support
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
X-List-Received-Date: Thu, 21 May 2015 21:18:17 -0000
X-Groupsio-MsgNum: 55589
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C7152669-11F7-40F5-935E-DD8C9C3D4AD5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C7152669-11F7-40F5-935E-DD8C9C3D4AD5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 21, 2015, at 11:26 AM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
> Hi Christian,
>=20
> On 05/05/15 11:40, Christian Ege wrote:
>> I've created a BSP Layer for the ODROID-C1 and other Amlogic based
>> devices like the Wetek.Play
>>=20
>> https://github.com/linux-meson/meta-amlogic
>=20
> Thanks! I've been playing with your layer. For the most part it's =
going
> well. I've noticed a small glitch, however, and I'm not 100% sure how =
to
> fix it (otherwise I would have just sent you a github pull request).
>=20
> If I have your layer added to the BBLAYERS mix but I'm _not_ building
> for "odroidc1" (or "wetekplay", I assume) then I get an error because
> the build system can't find the amlsetfb.sh file. You have two
> "amlsetfb.sh" files, one for the odroidc1 and one for the wetekplay
> which you've added to recipes-core/initscripts/odroidc1 and
> recipes-core/initscripts/wetekplay. If the MACHINE is odroidc1 then =
the
> recipes-core/initscripts/odroidc1/amsetfb.sh file is found, otherwise =
it
> is not.
>=20
> I can work around this issue by adding a MACHINE-specific override to
> your initscripts_1.%.bbappend:
>=20
> -SRC_URI_append =3D " file://amlsetfb.sh \
> +SRC_URI_append_odroidc1 =3D " file://amlsetfb.sh \
>=20
> but I'm guessing another override would be required for the wetekplay =
as
> well.
>=20
> Why would someone include your layer and not build for odroidc1 or
> wetekplay? Sometimes that's what people do ;-) (look at Angstrom, for
> example). Besides, a BSP layer should be able to play nicely with =
other
> layers even when its machines aren't being used :-)

This is very much desirable, in todays times. In angstrom e.g. we want =
to generalize feeds across
many machines for arm especially, so we can share common feeds across =
multiple armv7a machines
so BSP maintainers have to start thinking that their BSP layer will be =
put along with other BSP layers
and they not change common components mindlessly to fit for just one =
given machine.

secondly more and more end users especially big companies have more than =
1 machine tied into their useless
so its desirable for them to use one distro across all the product lines =
and hence a requirement to have
BSP layers play well with each others.

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_C7152669-11F7-40F5-935E-DD8C9C3D4AD5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVeS5MACgkQuwUzVZGdMxQ1EwCeM7v6WcRdkp58teTopfrgnaJ7
ToIAn1vHmgc8ouQyLAqMmsESkJ8Zu8K9
=BxE3
-----END PGP SIGNATURE-----

--Apple-Mail=_C7152669-11F7-40F5-935E-DD8C9C3D4AD5--
