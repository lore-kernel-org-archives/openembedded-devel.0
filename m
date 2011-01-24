Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhIWw-0005L8-1h
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 10:16:10 +0100
Received: by gyh20 with SMTP id 20so1345997gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 01:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=9FCC3dGACAhtes96z1qRICeS4ukhrc8797WcYOppKQw=;
	b=tI8Y/IUCGzuwiCGv6RQyE8ogpKBALyfgbudy35FYPRJ59Di1E6zd+CzINySBILGHx2
	iaY0GrRIEoPBEn9SClLk6OTP6ZryhK1CwEj1eFIlUUHsHB8DkFB4jKxTiduY7CVKfwqg
	CcwGg9iYVQRG8bYu6slFwvr+UHxEUoJ+YRkVY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=p6WEChOXi0PavIJX3eYALGC7ctNOGTMQ2GXpcFjXkH6v1aC6yciod2tvxbI7afTbC8
	IGm1x3x4b4aSpXY9bxPsgcAQ8NnTgJ/roNN0pOsAPF/gE6rngSGSPRgzXULDep8jEq1W
	XYECYd2dCQaukx/osWB2t1oZYjDeu0hlcOy2w=
Received: by 10.90.10.31 with SMTP id 31mr4672273agj.85.1295860523985; Mon, 24
	Jan 2011 01:15:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Mon, 24 Jan 2011 01:15:03 -0800 (PST)
In-Reply-To: <ihjf6u$c5u$1@dough.gmane.org>
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>
	<ihjf6u$c5u$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2011 01:15:03 -0800
Message-ID: <AANLkTin6h0bLj=s=ngGQrJMEQx2PBfK3hbm54nsmXari@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Jan 2011 09:16:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 24, 2011 at 1:02 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 24-01-11 03:03, Khem Raj wrote:
>> * no need to pin older udev with uclibc/git either
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> NAK! binutils 2.21 introduces way too many problem at this moment, those
> need to get solved before switching to it.

hmmm. Too vague a statement. Do you have list of issues somewhere I can loo=
k at
it built the console-image x11-image images I tried and booted
console-image too.

>
>> ---
>> =C2=A0conf/distro/angstrom-2010.x.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +++---
>> =C2=A0.../include/angstrom-2010-preferred-versions.inc =C2=A0 | =C2=A0 =
=C2=A01 -
>> =C2=A02 files changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-201=
0.x.conf
>> index c6fb07d..3ac3847 100644
>> --- a/conf/distro/angstrom-2010.x.conf
>> +++ b/conf/distro/angstrom-2010.x.conf
>> @@ -71,8 +71,8 @@ PREFERRED_VERSION_linux-libc-headers-native =3D "${LIN=
UX_LIBC_HEADERS_VERSION}"
>> =C2=A0#Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testi=
ng.
>> =C2=A0PREFERRED_VERSION_glibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0?=3D "2.10.1"
>> =C2=A0PREFERRED_VERSION_glibc-initial =C2=A0 =C2=A0 =C2=A0?=3D "2.10.1"
>> -PREFERRED_VERSION_uclibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D=
 "0.9.30.2"
>> -PREFERRED_VERSION_uclibc-initial =C2=A0 =C2=A0 ?=3D "0.9.30.2"
>> +PREFERRED_VERSION_uclibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D=
 "git"
>> +PREFERRED_VERSION_uclibc-initial =C2=A0 =C2=A0 ?=3D "git"
>> =C2=A0PREFERRED_VERSION_eglibc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ?=3D "2.12"
>> =C2=A0PREFERRED_VERSION_eglibc-initial =C2=A0 =C2=A0 ?=3D "2.12"
>>
>> @@ -95,7 +95,7 @@ ANGSTROM_GCC_VERSION_avr32 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0?=3D "4.2.2"
>> =C2=A0#Everybody else can just use this:
>> =C2=A0ANGSTROM_GCC_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D "4.5"
>>
>> -ANGSTROM_BINUTILS_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0?=3D "2.20.1"
>> +ANGSTROM_BINUTILS_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0?=3D "2.21"
>>
>> =C2=A0PREFERRED_VERSION_binutils =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ?=3D "${ANGSTROM_BINUTILS_VERSION}"
>> =C2=A0PREFERRED_VERSION_binutils-cross =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D =
"${ANGSTROM_BINUTILS_VERSION}"
>> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/=
conf/distro/include/angstrom-2010-preferred-versions.inc
>> index 5532f29..66ee5ab 100644
>> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
>> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
>> @@ -66,7 +66,6 @@ PREFERRED_VERSION_samba =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D "3.3.9"
>> =C2=A0PREFERRED_VERSION_tiff =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D "3.9.4+4.0.0beta6"
>>
>> =C2=A0PREFERRED_VERSION_udev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D "165"
>> -PREFERRED_VERSION_udev_libc-uclibc =3D "141"
>> =C2=A0UDEV_GE_141 =3D "1"
>>
>> =C2=A0PREFERRED_VERSION_usbutils =3D "0.86"
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNPUAeMkyGM64RGpERAm6CAJsHFPAQdphhKT4liYnMNE57ubU32wCfeJim
> 6pPp+1le2CwVszFtrNlJ+Qk=3D
> =3Dihdt
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


