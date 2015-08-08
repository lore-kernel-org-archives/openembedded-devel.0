Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id AE6E5767FA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 22:39:12 +0000 (UTC)
Received: by pawu10 with SMTP id u10so113024217paw.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 15:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=IwvG0MMFUqkPcRjym9lETaIQFpTzMBc/reV0/cStulI=;
	b=bz1ZDuUneUwm/InayRGx5pMXZXXD4e8SZ6Iw+sgNDLy0BgBuzPf2dfpKTikV6vZ1Ih
	nbGUcM/wd2h6+oNDpExJvgBTWBOUsx8O7eVpkmF3GTY88/xZaebrn6XtAvyLaHZANz/3
	lnMNJCxyx2WJij8AQ7iUy2M8rvjmksUWZcuxJOv04qUdMe3tKmfyrIBZYQUwpvUUHUzK
	+SMf1EG8epDnOCabZehUfuBeU+bqsnNt8dGu4IWE+Vb3Rn5DtVPbSfZnqyh2mAR8YWg4
	NVRtAxq/hXDKzTNEeJI9YZscIXGadcbucS+xqOFs+2CZenGK8sBdGcWMJLLKPttW915A
	ISRQ==
X-Received: by 10.67.5.103 with SMTP id cl7mr29137009pad.75.1439073553111;
	Sat, 08 Aug 2015 15:39:13 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id
	fg5sm8802460pdb.33.2015.08.08.15.39.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 15:39:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150727163405.GE307@jama>
Date: Sat, 8 Aug 2015 15:39:07 -0700
Message-Id: <93BD997E-308F-455D-AD8D-B414EE9B4200@gmail.com>
References: <1437743901-28008-1-git-send-email-adraszik@digisoft.tv>
	<20150727163405.GE307@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
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
X-List-Received-Date: Sat, 08 Aug 2015 22:39:16 -0000
X-Groupsio-MsgNum: 56611
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CDDC32B6-EADF-4EF2-BE1F-3919E1490561";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CDDC32B6-EADF-4EF2-BE1F-3919E1490561
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


> On Jul 27, 2015, at 9:34 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Fri, Jul 24, 2015 at 02:18:21PM +0100, Andr=E9 Draszik wrote:
>> From: Andr=E9 Draszik <git@andred.net>
>>=20
>> rsnapshot is just some perl script(s), no machine specific binaries.
>=20
> NAK
>=20
> The recipe has bunch of RDEPENDS on TUNE_PKGARCH recipes so it cannot =
be
> allarch.
>=20
> Recipe by default is TUNE_PKGARCH not MACHINE_ARCH as commit message =
may
> suggest.


I understand the NAK since it has runtime dependencies on binary =
compiled programs like rsync which are architecture dependent
due to different ISA and so on. However, from another perspective, its a =
script which is invoking/executing a standard utility
much like its own interpreter say bash or perl whichever it needs and =
bash, perl etc. are natively compiled binaries. going by this logic
we can really not have allarch package at all. So IMO runtime =
dependencies
for script based packages should not bar it from being a allarch =
package. Since, I can still take the same ipk and install it on arm or =
mips
and it will work as long as they provide its dependencies like rsync =
perl etc.

>=20
>> ---
>> meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb =
b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
>> index d680511..0593eef 100644
>> --- a/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
>> +++ b/meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb
>> @@ -29,7 +29,7 @@ SRC_URI =3D =
"git://github.com/DrHyde/${BPN};branch=3Dmaster;protocol=3Dgit \
>>=20
>> S =3D "${WORKDIR}/git"
>>=20
>> -inherit autotools
>> +inherit allarch autotools
>>=20
>> # Fix rsnapshot.conf.default:
>> # don't inject the host path into target configs.
>> --
>> 2.1.4
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_CDDC32B6-EADF-4EF2-BE1F-3919E1490561
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGhQ8ACgkQuwUzVZGdMxSszgCgj2/WP+ipXxGqx3UOosWVedM2
K+wAn1CYLc2Is9WlvfQnmFzRqfANjNTJ
=U/rl
-----END PGP SIGNATURE-----

--Apple-Mail=_CDDC32B6-EADF-4EF2-BE1F-3919E1490561--
