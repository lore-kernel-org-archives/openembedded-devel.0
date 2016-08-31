Return-Path: <philip@balister.org>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Aug 2016 19:55:55 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 4817673243
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:55:55 +0000 (UTC)
Received: (qmail 22385 invoked by uid 1003); 31 Aug 2016 19:49:15 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@71.171.12.218)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	31 Aug 2016 19:49:15 -0000
To: openembedded-devel@lists.openembedded.org
References: <1472062075-18352-1-git-send-email-philip@balister.org>
	<20160831170406.awhqhpy5rcf5ixqi@jama>
From: Philip Balister <philip@balister.org>
Message-ID: <38750bc0-32a1-a577-d1f3-90181a5bd1d2@balister.org>
Date: Wed, 31 Aug 2016 15:49:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160831170406.awhqhpy5rcf5ixqi@jama>
Subject: Re: [meta-oe][PATCH] qwt: Use ${libdir} to install libraries.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2016 19:55:56 -0000
X-Groupsio-MsgNum: 62929
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="KwEVF7ggcdrkhMDTOcFEKrdr5A7KQqMj6"

--KwEVF7ggcdrkhMDTOcFEKrdr5A7KQqMj6
Content-Type: multipart/mixed; boundary="BwnvNh1jW3Rt9gTj00DSckWDhITXW1W6B";
 protected-headers="v1"
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <38750bc0-32a1-a577-d1f3-90181a5bd1d2@balister.org>
Subject: Re: [oe] [meta-oe][PATCH] qwt: Use ${libdir} to install libraries.
References: <1472062075-18352-1-git-send-email-philip@balister.org>
 <20160831170406.awhqhpy5rcf5ixqi@jama>
In-Reply-To: <20160831170406.awhqhpy5rcf5ixqi@jama>

--BwnvNh1jW3Rt9gTj00DSckWDhITXW1W6B
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 08/31/2016 01:04 PM, Martin Jansa wrote:
> On Wed, Aug 24, 2016 at 02:07:55PM -0400, Philip Balister wrote:
>> This lets qwt build and package for systems that use lib64.
>=20
> Which branch you want to apply this?

A pox on people living in the past.

Clearly I need to move this to meta-qt4.

Sorry for the noise.

Philip


>=20
> It was removed 7 months ago!
>=20
> commit 2bd11da4b50f401c9c49975aeedaaafa6a59d08b
> Author:     Martin Jansa <Martin.Jansa@gmail.com>
> AuthorDate: Thu Jan 7 15:57:45 2016 +0100
> Commit:     Martin Jansa <Martin.Jansa@gmail.com>
> CommitDate: Thu Jan 14 11:30:15 2016 +0100
>=20
>     recipes: remove recipes using or depending on qt4 bbclasses or reci=
pes
>=20
>=20
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  meta-oe/recipes-qt/qwt/qwt.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/q=
wt.inc
>> index d3c4ed1..e1b260c 100644
>> --- a/meta-oe/recipes-qt/qwt/qwt.inc
>> +++ b/meta-oe/recipes-qt/qwt/qwt.inc
>> @@ -16,6 +16,7 @@ do_configure_prepend() {
>>      sed -i -e 's:qtAddLibrary(qwt:qtAddLibrary(qwt)${QT_LIBINFIX}:g' =
*.prf
>>      sed -e 's/# QWT_CONFIG     +=3D QwtExamples/QWT_CONFIG     +=3D Q=
wtExamples/g' -i qwtconfig.pri
>>      sed -i -e 's:/usr/local/qwt-$$QWT_VERSION:${D}${prefix}:g' ${S}/*=
=2Epri
>> +    sed -i -e 's:$${QWT_INSTALL_PREFIX}/lib:${D}${libdir}:g' ${S}/*.p=
ri
>>  }
>> =20
>>  do_install() {
>> --=20
>> 2.5.5
>>
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
>=20
>=20


--BwnvNh1jW3Rt9gTj00DSckWDhITXW1W6B--

--KwEVF7ggcdrkhMDTOcFEKrdr5A7KQqMj6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQExBAEBCAAbBQJXxzS6FBxwaGlsaXBAYmFsaXN0ZXIub3JnAAoJEMDJd4rr0mer
ocsIAKBJ8Nbi9bGqt0c3TrfmutwQnSZaOtQg4azAxoFfH8fRhAHxYMoVb+k+XqFz
UacPhiIOeEoTk7+OpzixnpZQYG6B8HgKTqmKQ8IzZ6pOP9X2ORyihtuZs77hXcru
IqVQVpomrQuY4tjME/ss0yYuR3WqecmttejW2+05BjgQed7L5PU49kPhu5riQ4fi
S/vt77nlP7ZMeANEOVtbG/U8lAZQnaAKTyFWZbv9EWLcdYeLyT7IQbjUgSP07d2t
kWzuLledIurfvAY/IxKS9mVhCqwUZXE9ceUZC46Bp9Mw7Ifs8C4qkjLoyLBfIQ9r
5PU6UFjzhwRcvL3ABWMXXgRnTjM=
=gdYh
-----END PGP SIGNATURE-----

--KwEVF7ggcdrkhMDTOcFEKrdr5A7KQqMj6--
