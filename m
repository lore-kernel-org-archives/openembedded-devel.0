Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id EE44A77141
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 16:37:05 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so120067830wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 08:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=J3vEc3bPsUfdwR4h69EyXjmy4sgamQ+xbpmbFu4bXBM=;
	b=a9anemPM21n7BHf16i1F22HAWlE6+q0+50r9PATRvJhclwgjBO+Y9SNWG9MylzWMBs
	UsG5ZYAjpqsYXCYCO8Y+b3ngPGyusq+39f5n6nYgvamDbKiIP86jiHmYIDbxja3laD0C
	LmPLhtPhMQRZnOamz+8mwaE4z2FvpOBp25XhiSQq58meHAryTiNmh27TrUrQp1EttiCS
	qBxmHknHA+TpF/53UHYmY+cJ6FlTcoxdSEBxUvijmdARMjvOGhC9UmSis1zW4ejLvNd+
	Iyxs0EtewH8QGR0eJJgXbzHuAWI9eKYCWh9BPd+XmAp16ITX0kdV5QZXI5cn+DV4xRUr
	jMCw==
X-Received: by 10.28.51.78 with SMTP id z75mr11500081wmz.51.1447259825571;
	Wed, 11 Nov 2015 08:37:05 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	l128sm18059558wmf.10.2015.11.11.08.37.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Nov 2015 08:37:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAMKF1sp8SrFpqeY4iD-juwPv6y2y5f4ZDisPU9LiCUuUXDWhqA@mail.gmail.com>
Date: Wed, 11 Nov 2015 17:37:03 +0100
Message-Id: <7F78FF81-F48C-45D0-9F1A-2D719A20CC48@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
	<88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
	<4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
	<CAMKF1sp8SrFpqeY4iD-juwPv6y2y5f4ZDisPU9LiCUuUXDWhqA@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Nov 2015 16:37:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Am 11.11.2015 um 17:25 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> On Wed, Nov 11, 2015 at 1:09 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>=20
>>> Am 11.11.2015 um 04:22 schrieb Khem Raj <raj.khem@gmail.com>:
>>>=20
>>>>=20
>>>> On Nov 10, 2015, at 2:00 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>=20
>>>>=20
>>>>> Am 10.11.2015 um 22:42 schrieb Christopher Larson =
<clarson@kergoth.com>:
>>>>>=20
>>>>> On Tue, Nov 10, 2015 at 2:22 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>>=20
>>>>>> +                   ${@base_contains('DISTRO_FEATURES', =
'sysvinit', 'lsb',
>>>>>> '', d)} \
>>>>>>=20
>>>>>=20
>>>>> This really requires lsb to able build, for all sysvinit distros? =
That
>>>>> seems unlikely. Was this intended to be based on the lsb distro =
feature?
>>>>> Also, why add lsb to rdepends independently of the packageconfig? =
I'd think
>>>>> using the packageconfig's 4th field for rdepends, if necessary, =
would work
>>>>> better, unless I'm missing something?
>>>>=20
>>>> You do ;)
>>>>=20
>>>> It uses the LSB init-script for systemv-init - and lsb doesn't suck =
in that
>>>> much that it hurts. But the line you quoted just adds an item to =
PACKAGECONFIG :)
>>>> Do a PACKAGECONFIG_remove-pn-samba =3D "lsb" to avoid the 4 scripts =
=E2=80=A6
>>>>=20
>>>=20
>>> that should be tied to =E2=80=98lsb=E2=80=99 distro feature as it =
exists. Distro=E2=80=99s then automatically get the intended behavior =
based upon the selected distro policy.
>>=20
>> I didn't find such a feature - is it intended to be introduced?
> '
> its called 'inuxstdbase' IIRC

grep remains silent regarding DISTRO_FEATURES and linuxstdbase :(

For the while, please make a suggestion for 2.0 how to ensure =
samba_4.1.12.bb:112
"install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d" can =
work without that.

The PACKAGECONFIG lsb is absolutely correct for the behavior - it can be =
discussed
whether sysvinit shall automatically enable it or not. Since it's tiny =
... why not?

When there is a sane linuxstdbase or lsb feature there, cleaning samba =
up distingishing
between lsb and pure sysv script is fine for me.

Question is: now? Or 2.1 / 2.0.1?

>> I only found a packagegroup for lsb, which is slightly overloaded
>> for common stuff.
>>=20
>> Nevertheless - samba already uses the LSB init-script and so requires
>> the lsb init-functions. To fix currently broken status, this is
>> needed to be done - and splitting between rough sysvinit and lsb
>> init can be done in a following cleanup (and I'm happy to do it
>> if you insist).
>>=20
>> Cheers

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


