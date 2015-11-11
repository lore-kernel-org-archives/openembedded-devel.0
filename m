Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 956FE76B7C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 16:25:43 +0000 (UTC)
Received: by igvg19 with SMTP id g19so73636955igv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 08:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=DwMScLCzYq8EOWV5BrF0pvHXFq/CMHdRPmvQO/lFqow=;
	b=0HP7fRcb8vNqOUiB2EwVBy6EVQhHbNkO+0PkisnQP9tW9eU5i3vBZHL3U5mW/ILupr
	cfSQ010REf1dPl/URT8pMoUh7Q+/+csYOG/Yq2BGBhPxaksv2kBMdm6ffWDecUOXQmik
	8pdQSdCvbihGZKqyGITo13wbDZY6D6du5TOc/lT5ieRUdy5+FPNr1TkQsPZQi46yJ8uv
	YyxOl2lZvrPzEYwqaGl66FibSPGsQrABbGcNq/UG/GXGKq1xItaFtqZix4YimCi4F98w
	U7fOBDK1OxKBEzC7sVEvk029wGnqdkac6DHODJcoP1akLcmJySD1rZFYU/MMwGDl7As5
	lDjA==
X-Received: by 10.50.20.67 with SMTP id l3mr29449062ige.75.1447259143415; Wed,
	11 Nov 2015 08:25:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Wed, 11 Nov 2015 08:25:14 -0800 (PST)
In-Reply-To: <4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
	<CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
	<B2ABFB12-3EF3-4008-94A1-A6390986AAFB@gmail.com>
	<88DAE25B-BAA9-4F99-B404-71D2D2973BBD@gmail.com>
	<4E8196B8-4770-41B9-B80A-3A9A911087D3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Nov 2015 08:25:14 -0800
Message-ID: <CAMKF1sp8SrFpqeY4iD-juwPv6y2y5f4ZDisPU9LiCUuUXDWhqA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: =?UTF-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
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
X-List-Received-Date: Wed, 11 Nov 2015 16:25:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2015 at 1:09 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> Am 11.11.2015 um 04:22 schrieb Khem Raj <raj.khem@gmail.com>:
>>
>>>
>>> On Nov 10, 2015, at 2:00 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>>
>>>> Am 10.11.2015 um 22:42 schrieb Christopher Larson <clarson@kergoth.com=
>:
>>>>
>>>> On Tue, Nov 10, 2015 at 2:22 PM, Jens Rehsack <rehsack@gmail.com> wrot=
e:
>>>>
>>>>> +                   ${@base_contains('DISTRO_FEATURES', 'sysvinit', '=
lsb',
>>>>> '', d)} \
>>>>>
>>>>
>>>> This really requires lsb to able build, for all sysvinit distros? That
>>>> seems unlikely. Was this intended to be based on the lsb distro featur=
e?
>>>> Also, why add lsb to rdepends independently of the packageconfig? I'd =
think
>>>> using the packageconfig's 4th field for rdepends, if necessary, would =
work
>>>> better, unless I'm missing something?
>>>
>>> You do ;)
>>>
>>> It uses the LSB init-script for systemv-init - and lsb doesn't suck in =
that
>>> much that it hurts. But the line you quoted just adds an item to PACKAG=
ECONFIG :)
>>> Do a PACKAGECONFIG_remove-pn-samba =3D "lsb" to avoid the 4 scripts =E2=
=80=A6
>>>
>>
>> that should be tied to =E2=80=98lsb=E2=80=99 distro feature as it exists=
. Distro=E2=80=99s then automatically get the intended behavior based upon =
the selected distro policy.
>
> I didn't find such a feature - is it intended to be introduced?
'
its called 'inuxstdbase' IIRC

> I only found a packagegroup for lsb, which is slightly overloaded
> for common stuff.
>
> Nevertheless - samba already uses the LSB init-script and so requires
> the lsb init-functions. To fix currently broken status, this is
> needed to be done - and splitting between rough sysvinit and lsb
> init can be done in a following cleanup (and I'm happy to do it
> if you insist).
>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

