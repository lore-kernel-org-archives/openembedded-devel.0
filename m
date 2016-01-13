Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id EBA01731DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 19:02:06 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id cy9so362797186pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 11:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=VZB4KdHzepTCeEWr8Pqyyqj55StqAR6HpitYwhWA/Ck=;
	b=bfhLJBGiaJq4dbmbBffCXiiT/xnkrY7f1nWe38VpJSSVRgBRAKBV1PryfGJ9vVqS2U
	LtfjC7oPmEE0y++DvUNilbFAx/WNRQfWbGG0po0wqPk0iBDOGwzYRUKlJcD24hsSncSL
	1UtBvFb+XEwf6VTdHnFWFUSEqlVT+wd7ci66Yurs0EFufnO+BbK1YWGlSz5P6JOHGNaZ
	NHO8prrcYkA3QSB97DFLS2BdzK1lFy2olj6Q/9GsufoOBlWFkTOjxzAMbYp20NwD2fEp
	koakF6UMTCowMc0XTKe0XVbRUQsQO9dK2hBV+I139mnia/zoP5WUNztAw+XfhihahQXW
	rVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=VZB4KdHzepTCeEWr8Pqyyqj55StqAR6HpitYwhWA/Ck=;
	b=mxRZaMpIhqp/j8BymnrGDeMJGD6yanVmsPZeDck7VaUNq5BE1F+vpzOU8x7bnkIciE
	nFdHJYy6FJPGOkf8VKKUPZ9pUXs4fECpDrDhQUE5PlIsOXWwntSWp3M5yNBFjG0eEmbn
	GmJa26HW2Z2FHlKHYEgVJruVahu7ogNGhDSgyRSNx9WGb21MnjBYDuIfR2w093uArijL
	5XxfhJliKHLagsy3Zt6ShvK6CNOLQ//TFsvy+z4paCe/Le0P2kPR5ClmUnFG0qG9V2D1
	rgMIcUwvmx9LDfM4EjcP0xe9ff4xBgBxcxN1+b3eFpAx9kO1qHv4yCgppH/lurY6FJRr
	qzjw==
X-Gm-Message-State: ALoCoQnIXqJWNfTOg6KpPSGk8OAuG/x+RfEMh39G13mA0rQu5L4yQayGIsiwkmtiCVetQ6b9Bk6Fh0xgk+GvsrKyuGPpuAsTRA==
X-Received: by 10.67.15.73 with SMTP id fm9mr168252954pad.130.1452711727057;
	Wed, 13 Jan 2016 11:02:07 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:e406:58c9:b337:c1d9?
	([2601:646:8802:5d5c:e406:58c9:b337:c1d9])
	by smtp.gmail.com with ESMTPSA id
	m75sm4297712pfj.38.2016.01.13.11.02.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jan 2016 11:02:05 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADySD0G13gzng3be=EH6ZBefENDYF8467F3ugj72=AtskY8_XA@mail.gmail.com>
Date: Wed, 13 Jan 2016 11:02:01 -0800
Message-Id: <CB59531F-3C61-4F1E-867E-CA969B1874EE@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
	<CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
	<BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
	<CADySD0GV+gsBBoU7vFVZwfNxiVUDawzrP5L3n=4ZXuUPhyr6yg@mail.gmail.com>
	<82CDD0BD-1D28-425B-9F1A-99AFFB42CFE5@gmail.com>
	<CADySD0G_vmN=SwZsVRrg5Ko+P_jM6Nvs2UTt0paaqiPcfcM0-Q@mail.gmail.com>
	<41A6B023-03C6-48E4-B3EC-E1BA1F073B70@gmail.com>
	<CADySD0G13gzng3be=EH6ZBefENDYF8467F3ugj72=AtskY8_XA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3112)
Subject: Re: bitbake meta-toolchain-qt5 error
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
X-List-Received-Date: Wed, 13 Jan 2016 19:02:07 -0000
X-Groupsio-MsgNum: 59519
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B922CD33-D77A-4CCD-8B30-C4921B4A90E8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B922CD33-D77A-4CCD-8B30-C4921B4A90E8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

issue seems to be typeof usage when using c99
especially this from bluetooth.h

#define bt_put_unaligned(val,ptr) do { struct __attribute__((packed)) { =
typeof(*(ptr)) __v; } *__p =3D (typeof(__p)) (ptr); __p->__v =3D (val); =
} while(0)

change typeof with __typeof__ in above macro.

or back port

=
http://git.kernel.org/cgit/bluetooth/bluez.git/commit/?id=3Dcf52a40302d0d2=
0ccca22a7a1f53e46ef8abfca8

into your version of bluez



> On Jan 13, 2016, at 1:59 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> =
wrote:
>=20
> here is the full log file
> https://gist.github.com/anonymous/d6db184bff49736e1121
>=20
> In case log file above is truncated:
> =
https://gist.githubusercontent.com/anonymous/d6db184bff49736e1121/raw/b6dd=
87cf3745c91d958e253c3332cc22772a1f0a/qnetworkinfo_linux.cpp
>=20
>=20
> On Tue, Jan 12, 2016 at 5:50 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> No. you need to use complete cmdline that is used while compiling it
>> originally to produce the error
>>=20
>>> On Jan 12, 2016, at 5:37 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>> wrote:
>>>=20
>>> I posted the complete log file.
>>>=20
>>> I tried with "arm-linux-gnueabihf-gcc -E -dD <filename>"
>>> Maybe it is not enough. I'll try with complete command having =
include
>> paths
>>> and see if it improves anything.
>>>=20
>>> On Wed, Jan 13, 2016 at 2:29 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>=20
>>>>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0=
577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48:26:
>>>> fatal error: qnetworkinfo.h: No such file or directory
>>>>=20
>>>>=20
>>>> Please post complete file
>>>>=20
>>>>> On Jan 12, 2016, at 5:22 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>>>> wrote:
>>>>>=20
>>>>> thanks
>>>>>=20
>>>>> here it is.. =
https://gist.github.com/anonymous/a03e9fb2203e45a4b033
>>>>>=20
>>>>> On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>>=20
>>>>>>=20
>>>>>>> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi =
<ankur.tyagi85@gmail.com>
>>>>>> wrote:
>>>>>>>=20
>>>>>>> sorry it took me a while to reply.
>>>>>>>=20
>>>>>>> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
>>>>>>>=20
>>>>>>> I have preprocess
>>>>>>> =E2=80=8B =E2=80=8B
>>>>>>> =E2=80=8B=E2=80=8B
>>>>>>> log but looks like pastebin is down. Ok to send the log as
>> attachment ?
>>>>>>=20
>>>>>> http://alternativeto.net/software/pastebin/
>>>>>>=20
>>>>>>>=20
>>>>>>> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com>
>> wrote:
>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi =
<ankur.tyagi85@gmail.com
>>>=20
>>>>>>>> wrote:
>>>>>>>>>=20
>>>>>>>>> included stdint.h in qnetworkinfo_linux.cpp but still getting =
the
>>>> same
>>>>>>>> error
>>>>>>>>=20
>>>>>>>> what version of gcc are you using and can you preprocess the =
file
>>>> under
>>>>>>>> error with -E -dD and pastebin it ?
>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj =
<raj.khem@gmail.com>
>>>> wrote:
>>>>>>>>>=20
>>>>>>>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
>>>>>> ankur.tyagi85@gmail.com>
>>>>>>>>>> wrote:
>>>>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>=20
>>>>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
>>>>>>>>>>> error: expected identifier before '*' token
>>>>>>>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
>>>>>>>>>>=20
>>>>>>>>>> this means that stdint.h is missing from includes.
>>>>>>>>>> --
>>>>>>>>>> _______________________________________________
>>>>>>>>>> Openembedded-devel mailing list
>>>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>>> =
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>>>>>=20
>>>>>>>>> --
>>>>>>>>> _______________________________________________
>>>>>>>>> Openembedded-devel mailing list
>>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>> =
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> --
>>>>>>>> _______________________________________________
>>>>>>>> Openembedded-devel mailing list
>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>> =
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>>>=20
>>>>>>>>=20
>>>>>>> --
>>>>>>> _______________________________________________
>>>>>>> Openembedded-devel mailing list
>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>> =
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>=20
>>>>>>=20
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>=20
>>>>>>=20
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>=20
>>>>=20
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>=20
>>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_B922CD33-D77A-4CCD-8B30-C4921B4A90E8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaWny0ACgkQuwUzVZGdMxT6qwCfeQ0fsSc/2l95DjQOYDkzumJx
fqQAniOlFEbbHpMtsRiUyMQhrFEIqqZG
=PBTL
-----END PGP SIGNATURE-----

--Apple-Mail=_B922CD33-D77A-4CCD-8B30-C4921B4A90E8--
