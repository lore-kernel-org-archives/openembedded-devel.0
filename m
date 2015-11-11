Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 48FF0771AF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 23:23:01 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so44406714pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 15:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Svcfxx0MaWt5pnC6cLre01HyPs16nmNgWEunKCu4fng=;
	b=tVZRjkXbZGtB489rLlC1nAPOgKbDKHPgooEX7Kz+QU5Wlv1RVinI/1jWGIsRjs4lTa
	GmFOAXnI/5JFGChJcCcujOvkn8H7hu6DVEy/NcXqpKED0raShcpXTzKKgDVQPcOrH6Nv
	ke+t01PpjxRRkd7w8hppLFAp/xK0gyKjbrQjGT733rAmtO0yDEwEApG3/BALJGva2Yuf
	ovD70F3GQ6YEln5HjHUzUYEhoSsXuJnR5lZeHcJWBy8UPuyiOLCKMqmRg10ScxNcBIAF
	HU1ypCFt1X7SliVv0bDgnVDyiojmudfhoCsbgrGAkLR3y9g12Ln+/21nXf9aTzCOJm6l
	HKUg==
X-Received: by 10.68.163.97 with SMTP id yh1mr18325722pbb.36.1447284182099;
	Wed, 11 Nov 2015 15:23:02 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:c5a4:121f:4dc4:c4b1?
	([2601:646:8802:5d5c:c5a4:121f:4dc4:c4b1])
	by smtp.gmail.com with ESMTPSA id
	ju7sm11250108pbc.83.2015.11.11.15.22.58
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Nov 2015 15:22:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3108\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20151111210839.GC2564@jama>
Date: Wed, 11 Nov 2015 15:22:53 -0800
Message-Id: <B927DE5B-8863-419A-8C81-3F847B1F0443@gmail.com>
References: <7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
	<CAMKF1srTimQy2RtDk+=nnA7p+jC80u0eBTd9_v+9_FLfWt0MPA@mail.gmail.com>
	<B3996A75-A243-4E48-9318-C1730ED9141B@gmail.com>
	<CAMKF1sqPitU4ZUXZ--qyefnesyu2SqZQvbRGMCG1RRP+BOmw0w@mail.gmail.com>
	<75C83D4F-AE17-44CC-9523-761A33C7F7D1@gmail.com>
	<CAMKF1soRPp6yxDK+iF_SB0EO=Dvzx9oKDiRgRJqw0WXv2BbbAA@mail.gmail.com>
	<662EEA96-421F-46A1-97F1-F07CE05D08FA@gmail.com>
	<CAMKF1sruZfx4tO+_cwmzrM0XQj39L3mCyXK_WfSOdx8yfWnFvA@mail.gmail.com>
	<6B63E7FC-B65B-450B-871D-182CCAE06796@gmail.com>
	<CAMKF1srbaj5SrkyX_p83GOFbhA4fJrim_qwhmX-hzfs=CKQoOQ@mail.gmail.com>
	<20151111210839.GC2564@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3108)
Cc: =?utf-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 1/3] samba: fix dependencies and QA issues
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
X-List-Received-Date: Wed, 11 Nov 2015 23:23:02 -0000
X-Groupsio-MsgNum: 58528
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2F5B372F-34D7-4BF2-AE58-ED134D81061E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2F5B372F-34D7-4BF2-AE58-ED134D81061E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Nov 11, 2015, at 1:08 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Nov 11, 2015 at 12:53:22PM -0800, Khem Raj wrote:
>> On Wed, Nov 11, 2015 at 12:20 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>=20
>>>> Am 11.11.2015 um 20:48 schrieb Khem Raj <raj.khem@gmail.com>:
>>>>=20
>>>> On Wed, Nov 11, 2015 at 11:22 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>>=20
>>>>>> Am 11.11.2015 um 20:12 schrieb Khem Raj <raj.khem@gmail.com>:
>>>>>>=20
>>>>>> On Wed, Nov 11, 2015 at 10:54 AM, Jens Rehsack =
<rehsack@gmail.com> wrote:
>>>>>>> In this special case I intend to say no, because:
>>>>>>>=20
>>>>>>> The lsb support is limited to startup only - and the distro =
features
>>>>>>> controlling startup are "sysvinit" and "systemd", respectively.
>>>>>>>=20
>>>>>>> Mixing systemd with linuxstdbase in overrides is possible but =
installing
>>>>>>> two init-script not knowing each other is likely asking for =
trouble. Maybe
>>>>>>> I'm wrong with that :)
>>>>>>=20
>>>>>> and only sysvinit is valid for LSB, if you use systemd then lsb =
is
>>>>>> violated anyway
>>>>>> you can encode that logic for completion if you want
>>>>>=20
>>>>> Currently I'd like not to complicate things before jethro :)
>>>>>=20
>>>>> When you have an example somewhere how it can be sanely done, and =
it's easily
>>>>> adopted - I'm happy to send an update for that. Otherwise I intend =
to wait
>>>>> after release and take the patch as it is to fix remaining issues =
before
>>>>> release is done.
>>>>=20
>>>> jethro announcement went out yesterday so ..
>>>>=20
>>>> =
https://lists.yoctoproject.org/pipermail/yocto/2015-November/027342.html
>>>=20
>>> Cool - so it's shipped with a 3 month known bug =
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8127 ... anyway ;)
>>>=20
>>> So, do you have an example around how to reasonable add your =
suggestion to check for lsb override?
>>>=20
>>=20
>> PACKAGECONFIG_linuxstdbase =3D =
"${@bb.utils.contains('DISTRO_FEATURES',
>> 'sysvinit', 'foo', '', d)} "
>>=20
>=20
> You don't want to override default PACKAGECONFIG right?
>=20
> PACKAGECONFIG_append_linuxstdbase =3D " =
${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'foo', '', d)}=E2=80=9D=

>=20

yes right


>> on these line ...
>>=20
>>> Cheers
>>> --
>>> Jens Rehsack - rehsack@gmail.com
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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


--Apple-Mail=_2F5B372F-34D7-4BF2-AE58-ED134D81061E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZDzdEACgkQuwUzVZGdMxSusgCfWLqAKP0hIPfSIwqOXwQNfe1E
JlEAmwTLkrMMmvZh92bg/hdprEyRHidk
=xixG
-----END PGP SIGNATURE-----

--Apple-Mail=_2F5B372F-34D7-4BF2-AE58-ED134D81061E--
