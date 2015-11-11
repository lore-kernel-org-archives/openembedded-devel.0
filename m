Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E8B14736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 09:09:23 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so46237984wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 01:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=j0gwnLj+4Ab/Ftu7NKXhGp6GIhEFts9U9WY1cdrKnPs=;
	b=YFoeWfHeqTVfjOsYTZjYYFe0s6ab3FbLb1s8CvwpFrOrC7Dv5bOtep5L35uNPxdJA9
	TdJOsfKhOtTAzVawKGT2pLgTn8mwwwmbavGOcmq5kNXsFjSPnHn5vympZ8JDlXkFx5H4
	hCtfYqv7F4VJxlxcOClrNiKrOWigk7suCJvoSmR2/GFqO3JyazBFpnizGcvbIHDlB1QT
	GAXe7CrXBFjlbI5zGiC5NlxjoSeC40Zd3eVx9v/HDR7zp0OuI3tUlIBz31/SE4mLytxD
	2es4WN8FrK5UFdjC+mx+ebPoo97MHS1ApLvJfB1Fa62MqgP2/TZM4IFXVgbZu7+dwgt8
	U9lw==
X-Received: by 10.194.77.174 with SMTP id t14mr8977883wjw.23.1447232963157;
	Wed, 11 Nov 2015 01:09:23 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id hk1sm7927369wjb.6.2015.11.11.01.09.22
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Nov 2015 01:09:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
Date: Wed, 11 Nov 2015 10:09:21 +0100
Message-Id: <4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
	<88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
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
X-List-Received-Date: Wed, 11 Nov 2015 09:09:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 04:22 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
>>=20
>> On Nov 10, 2015, at 2:00 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>>=20
>>=20
>>> Am 10.11.2015 um 22:42 schrieb Christopher Larson =
<clarson@kergoth.com>:
>>>=20
>>> On Tue, Nov 10, 2015 at 2:22 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>=20
>>>> +                   ${@base_contains('DISTRO_FEATURES', 'sysvinit', =
'lsb',
>>>> '', d)} \
>>>>=20
>>>=20
>>> This really requires lsb to able build, for all sysvinit distros? =
That
>>> seems unlikely. Was this intended to be based on the lsb distro =
feature?
>>> Also, why add lsb to rdepends independently of the packageconfig? =
I'd think
>>> using the packageconfig's 4th field for rdepends, if necessary, =
would work
>>> better, unless I'm missing something?
>>=20
>> You do ;)
>>=20
>> It uses the LSB init-script for systemv-init - and lsb doesn't suck =
in that
>> much that it hurts. But the line you quoted just adds an item to =
PACKAGECONFIG :)
>> Do a PACKAGECONFIG_remove-pn-samba =3D "lsb" to avoid the 4 scripts =
=E2=80=A6
>>=20
>=20
> that should be tied to =E2=80=98lsb=E2=80=99 distro feature as it =
exists. Distro=E2=80=99s then automatically get the intended behavior =
based upon the selected distro policy.

I didn't find such a feature - is it intended to be introduced?
I only found a packagegroup for lsb, which is slightly overloaded
for common stuff.

Nevertheless - samba already uses the LSB init-script and so requires
the lsb init-functions. To fix currently broken status, this is
needed to be done - and splitting between rough sysvinit and lsb
init can be done in a following cleanup (and I'm happy to do it
if you insist).

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


