Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhOVm-0004aE-VG
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 16:39:24 +0100
Received: by iwn8 with SMTP id 8so4590917iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=rhehKycLbHbmcOfenIhBg+n2KktOAyoIWrhbQD+YIic=;
	b=DcR4nwXCtuu48V+AEddKNZzaFqTlhbZhzkWdTZ7Y+rXc8PAEzEywIZYqdvPYzuZh7Z
	nWCB2GN9G7/6Cbj/F+mFnbp08PB7zL9XzM+c5gmpDt0Gaubf8oiPpRONzrYClK0O5Rpd
	GphZac56GUX04BOX2aEkxY5wrqRq0AaUvzS6Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=FycBnQnMV2be+xB+USZPUwOX7TrI7VAqhMqgTv/FrS0fd2cH+K/kJOWXVYYE8lLmsm
	aTQfW7HkYraNFRRhr3hXMIMqPisPwBHg95Ngv/pAjM5sdkXERYV8apCs9FDJCxQA5rW1
	bVoGx5o1SNUnPP/lV/FdiDvhQcj6R0QY6c3Cg=
Received: by 10.42.240.66 with SMTP id kz2mr4966816icb.340.1295883518601; Mon,
	24 Jan 2011 07:38:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.230.71 with HTTP; Mon, 24 Jan 2011 07:38:18 -0800 (PST)
In-Reply-To: <ihjhd3$n1e$1@dough.gmane.org>
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>
	<ihjf6u$c5u$1@dough.gmane.org>
	<AANLkTin6h0bLj=s=ngGQrJMEQx2PBfK3hbm54nsmXari@mail.gmail.com>
	<ihjhd3$n1e$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2011 07:38:18 -0800
Message-ID: <AANLkTimz3iOuZ_znFebxYU=6eeoeB8Czv3safbW=voNs@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21 and uclibc-git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jan 2011 15:39:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2011 at 1:39 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 24-01-11 10:15, Khem Raj wrote:
>> On Mon, Jan 24, 2011 at 1:02 AM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
>> On 24-01-11 03:03, Khem Raj wrote:
>>>>> * no need to pin older udev with uclibc/git either
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>> NAK! binutils 2.21 introduces way too many problem at this moment, those
>> need to get solved before switching to it.
>>
>>> hmmm. Too vague a statement. Do you have list of issues somewhere I can=
 look at
>>> it built the console-image x11-image images I tried and booted
>>> console-image too.
>
> Try building anything that uses linux-omap-psp 2.6.32. You will run into
> the secure mode problem. That one is relatively easy to solve, but it
> needs to get solved *before* the switch, not after.
>
> But besided that, so a change needs to get RFC'd, tested and signed off
> by the angstrom maintainers before it gets pushed. It's a toolchain
> change and we take toolchains seriously.
>
> Waking up and seeing it applied without all that is *extremely*
> insulting. So I reverted it.
Koen

bah it was not intentionally pushed. I wanted to push the other gcc
change and git push
pushed all branches. I should probably not track remote branches that
way git push wont
do this kind of mess. Sorry for the hassle. Thank you for reverting it
>
>>
>>
>>>>> ---
>>>>> =C2=A0conf/distro/angstrom-2010.x.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +++---
>>>>> =C2=A0.../include/angstrom-2010-preferred-versions.inc =C2=A0 | =C2=
=A0 =C2=A01 -
>>>>> =C2=A02 files changed, 3 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-=
2010.x.conf
>>>>> index c6fb07d..3ac3847 100644
>>>>> --- a/conf/distro/angstrom-2010.x.conf
>>>>> +++ b/conf/distro/angstrom-2010.x.conf
>>>>> @@ -71,8 +71,8 @@ PREFERRED_VERSION_linux-libc-headers-native =3D "${=
LINUX_LIBC_HEADERS_VERSION}"
>>>>> =C2=A0#Prefer glibc 2.6 and uclibc 0.9.30, these have had the most te=
sting.
>>>>> =C2=A0PREFERRED_VERSION_glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0?=3D "2.10.1"
>>>>> =C2=A0PREFERRED_VERSION_glibc-initial =C2=A0 =C2=A0 =C2=A0?=3D "2.10.=
1"
>>>>> -PREFERRED_VERSION_uclibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=
=3D "0.9.30.2"
>>>>> -PREFERRED_VERSION_uclibc-initial =C2=A0 =C2=A0 ?=3D "0.9.30.2"
>>>>> +PREFERRED_VERSION_uclibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=
=3D "git"
>>>>> +PREFERRED_VERSION_uclibc-initial =C2=A0 =C2=A0 ?=3D "git"
>>>>> =C2=A0PREFERRED_VERSION_eglibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ?=3D "2.12"
>>>>> =C2=A0PREFERRED_VERSION_eglibc-initial =C2=A0 =C2=A0 ?=3D "2.12"
>>>>>
>>>>> @@ -95,7 +95,7 @@ ANGSTROM_GCC_VERSION_avr32 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0?=3D "4.2.2"
>>>>> =C2=A0#Everybody else can just use this:
>>>>> =C2=A0ANGSTROM_GCC_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D "4.5"
>>>>>
>>>>> -ANGSTROM_BINUTILS_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D "2.20.1"
>>>>> +ANGSTROM_BINUTILS_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0?=3D "2.21"
>>>>>
>>>>> =C2=A0PREFERRED_VERSION_binutils =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ?=3D "${ANGSTROM_BINUTILS_VERSION}"
>>>>> =C2=A0PREFERRED_VERSION_binutils-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=
=3D "${ANGSTROM_BINUTILS_VERSION}"
>>>>> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc=
 b/conf/distro/include/angstrom-2010-preferred-versions.inc
>>>>> index 5532f29..66ee5ab 100644
>>>>> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
>>>>> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
>>>>> @@ -66,7 +66,6 @@ PREFERRED_VERSION_samba =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =3D "3.3.9"
>>>>> =C2=A0PREFERRED_VERSION_tiff =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D "3.9.4+4.0.0beta6"
>>>>>
>>>>> =C2=A0PREFERRED_VERSION_udev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D "165"
>>>>> -PREFERRED_VERSION_udev_libc-uclibc =3D "141"
>>>>> =C2=A0UDEV_GE_141 =3D "1"
>>>>>
>>>>> =C2=A0PREFERRED_VERSION_usbutils =3D "0.86"
>>
>>>
>>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNPUjjMkyGM64RGpERAhlFAJ0WQYEHLjLVp4uJAQ6N75/EYnCYegCfZdMK
> WxfAO9VF9GtRwgDa5cvFipA=3D
> =3DhJkJ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


