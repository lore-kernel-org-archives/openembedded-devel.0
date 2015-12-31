Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id D5EA765CBA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 08:39:55 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id 78so153691050pfw.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qmbO0ZXToSxVq2rHvBIT6wndJf4MfZeYQgDWcQtxyIY=;
	b=IcOOuLWJ3glaBN/tc40pOibCdJOt8wRMVf1uvjyJR4xkm+OxCzR/RbLW0d2TQpUiNO
	AeE+icLquf4o6+q2zVPXrXxL48AMQcK7XaGF0q7pzVD6HU9hvgeyoKQa9I7FKC/ye26t
	Y39hsFegW9d7qK7FKcM7IRSj+rggRVIg43/zokXZ1SQTg4nM1q3kobzPIzhl8zniIVYs
	I2pFjXlibr2TQ2J0shJdPKTIw+/5koEu9CsgovbAhxyS7a2bBBip7B+LbddLNo3dTjnp
	2BAtLy1wCPntB4tzyMlOPOtf4Tsa821AFLxqCSUa79YYgi7py/ocbp0n5s1H7ulLpmGc
	tlSQ==
X-Received: by 10.98.71.78 with SMTP id u75mr51267600pfa.65.1451551195771;
	Thu, 31 Dec 2015 00:39:55 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:859a:bd94:9969:6d02?
	([2601:646:8802:5d5c:859a:bd94:9969:6d02])
	by smtp.gmail.com with ESMTPSA id
	q87sm57486091pfa.45.2015.12.31.00.39.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Dec 2015 00:39:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <FF00A155-5A85-4DE2-9A2B-0CE288BACF1B@dominion.thruhere.net>
Date: Thu, 31 Dec 2015 00:39:49 -0800
Message-Id: <BC20C458-F96B-4DE9-93CD-FB8CA9C341E0@gmail.com>
References: <1451483875-2370-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1sqWtAXeVqRvVNOarUr9VupQpk5zANC6HR-tVXrOoeQ27g@mail.gmail.com>
	<FF00A155-5A85-4DE2-9A2B-0CE288BACF1B@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.3112)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mariadb: -native also needs gold workaround
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
X-List-Received-Date: Thu, 31 Dec 2015 08:39:56 -0000
X-Groupsio-MsgNum: 59252
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4C8570E1-7154-4129-A7E7-753AD37E330A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4C8570E1-7154-4129-A7E7-753AD37E330A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 31, 2015, at 12:14 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>=20
>=20
>> Op 30 dec. 2015, om 19:34 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:
>>=20
>> On Wed, Dec 30, 2015 at 5:57 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>> When the host distro uses gold mariadb-native fails to build.
>>>=20
>>=20
>> what is the failure ?
>=20
> The same one as in =
http://lists.openembedded.org/pipermail/openembedded-devel/2014-August/097=
495.html

OK. So it seems that a linker script is being used by without specifying =
linker option -T to denote that
which will actually make ld.bfd to treat it as add-on to default linker =
script. however gold will fail
to generate same behavior in current form. If you added -T then gold =
will do it same as ld.bfd but same won=E2=80=99t
work for ld.bfd since -T will override the implicit/internal linker =
script that ld.bfd uses. I don=E2=80=99t see an easy common
solution :(

>=20
>>=20
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> ---
>>> meta-oe/recipes-support/mysql/mariadb.inc | 3 +++
>>> 1 file changed, 3 insertions(+)
>>>=20
>>> diff --git a/meta-oe/recipes-support/mysql/mariadb.inc =
b/meta-oe/recipes-support/mysql/mariadb.inc
>>> index a6826c3..6a55476 100644
>>> --- a/meta-oe/recipes-support/mysql/mariadb.inc
>>> +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>>> @@ -60,6 +60,9 @@ PACKAGECONFIG[setupdb] =3D ", ,,${PN}-setupdb"
>>> # https://mariadb.atlassian.net/browse/MDEV-5982
>>> TARGET_CFLAGS +=3D "-fuse-ld=3Dbfd"
>>>=20
>>> +BUILD_CFLAGS +=3D "-fuse-ld=3Dbfd"
>>> +BUILD_CXXFLAGS +=3D "-fuse-ld=3Dbfd"
>>> +
>>> EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>>>                 -DWITH_JEMALLOC=3Dno \
>>>                 -DWITHOUT_TOKUDB=3DTRUE \
>>> --
>>> 2.0.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20


--Apple-Mail=_4C8570E1-7154-4129-A7E7-753AD37E330A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaE6dkACgkQuwUzVZGdMxSxrgCgg/mGGAJSNcz6/l0iLL8K+FDA
QN0AnAkWPdO6T3RZxjMls1oIIah1R2fM
=/69O
-----END PGP SIGNATURE-----

--Apple-Mail=_4C8570E1-7154-4129-A7E7-753AD37E330A--
