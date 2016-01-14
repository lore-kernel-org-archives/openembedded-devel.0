Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC006E666
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:14:18 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id yy13so287946829pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 10:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=1yF6FA6mGcfyBD7ASLsS5peUzCH/rfwdeDB3vrs/n/M=;
	b=R0f5t0/grxka3HqXZe3t4oXQXE9F9GT6r5+gFKrLehmqFP8rmkPPRV9yjwDFwtHrk9
	aag7i/K8T9QfXXqF9RT9KFC3CCb8C3Md1y+sQa1cZQPyNWfh/1yeUqboHL2VqSjGpzTF
	RpA+Zk2FCT7pfgwKNZlyL501m2sazWyfDNFXQ6gexbrjow5cRtY7DSXjIiKOGYOO3kDn
	V4vrJwra9QNdIc49R7af7O7OlQQOXocSypGHWqhgPdToCXgruQ+Jm3Fqi4GkeKrvC1c4
	Zv86AM9ttwBCccENC6pwsWtf6asSGtgEFSC+Ik5UtDeGUZTaNTKokK0u7L15CL8lL11V
	NIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=1yF6FA6mGcfyBD7ASLsS5peUzCH/rfwdeDB3vrs/n/M=;
	b=mgd18APreYS9sIxZVfrJUl3udsT4dbvkN/tSfNtyIBwDfPfRGWhuiWo5evu3GkGb9d
	zc92oAYXZG1KfCNJr423q6E/3n9pnGY5GQ3jlEtfPAxk3Sx8cHvtzyqQBkbUg8lT5zhN
	C6AYvh+m6CKfYBiC44XYHusrqrKp+j122t/WORIfnpNr11BqZctnOosNiasvAA5etPuu
	08lns/TqsGp4ASWtVJMgnYxC5EEJYjrz+Nwc62Av1ezzAIvByD0BIo0E9rR+dir0EZGK
	K5C63EQZMijCny2hbNDIt/To6Bp3sx+z2I+eG9CqFZ+20RAREy8nbDRLLdQ4QWkjVf3o
	3m1Q==
X-Gm-Message-State: ALoCoQkQL5d5W/hUiz+OQBdeS/lf9SVhwvOoXdzTAcMOh1mF5f/8nSSAXHUVgowNlW/bFCDYiaUh2498xDw7xR3FGvKIGG9y/Q==
X-Received: by 10.66.140.14 with SMTP id rc14mr8098811pab.65.1452795259106;
	Thu, 14 Jan 2016 10:14:19 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:4c4c:5f92:7d4d:1d28?
	([2601:646:8802:5d5c:4c4c:5f92:7d4d:1d28])
	by smtp.gmail.com with ESMTPSA id
	n27sm10767300pfb.53.2016.01.14.10.14.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 10:14:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADySD0E0zLEiyujLeXrQ226wPNMKVF4smGjG9U-zXRyVxqOL=A@mail.gmail.com>
Date: Thu, 14 Jan 2016 10:14:08 -0800
Message-Id: <553CB94E-A5FB-430B-B420-52147BD211BF@gmail.com>
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
	<CB59531F-3C61-4F1E-867E-CA969B1874EE@gmail.com>
	<CADySD0E0zLEiyujLeXrQ226wPNMKVF4smGjG9U-zXRyVxqOL=A@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Jan 2016 18:14:20 -0000
X-Groupsio-MsgNum: 59539
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BFFF112B-092E-46AD-8603-023D520285F3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BFFF112B-092E-46AD-8603-023D520285F3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 14, 2016, at 1:08 AM, Ankur Tyagi <ankur.tyagi85@gmail.com> =
wrote:
>=20
> that fixed the problem, thanks for the help.
>=20
> Any reason why this patch is not accepted ?

it=E2=80=99d s link to an upstreamed patch. If its missing in OE then =
propose it
to OE recipe

>=20
> On Thu, Jan 14, 2016 at 8:02 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> issue seems to be typeof usage when using c99
>> especially this from bluetooth.h
>>=20
>> #define bt_put_unaligned(val,ptr) do { struct __attribute__((packed)) =
{
>> typeof(*(ptr)) __v; } *__p =3D (typeof(__p)) (ptr); __p->__v =3D =
(val); }
>> while(0)
>>=20
>> change typeof with __typeof__ in above macro.
>>=20
>> or back port
>>=20
>>=20
>> =
http://git.kernel.org/cgit/bluetooth/bluez.git/commit/?id=3Dcf52a40302d0d2=
0ccca22a7a1f53e46ef8abfca8
>>=20
>> into your version of bluez
>>=20
>>=20
>>=20
>>> On Jan 13, 2016, at 1:59 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>> wrote:
>>>=20
>>> here is the full log file
>>> https://gist.github.com/anonymous/d6db184bff49736e1121
>>>=20
>>> In case log file above is truncated:
>>>=20
>> =
https://gist.githubusercontent.com/anonymous/d6db184bff49736e1121/raw/b6dd=
87cf3745c91d958e253c3332cc22772a1f0a/qnetworkinfo_linux.cpp
>>>=20
>>>=20
>>> On Tue, Jan 12, 2016 at 5:50 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>=20
>>>> No. you need to use complete cmdline that is used while compiling =
it
>>>> originally to produce the error
>>>>=20
>>>>> On Jan 12, 2016, at 5:37 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>>>> wrote:
>>>>>=20
>>>>> I posted the complete log file.
>>>>>=20
>>>>> I tried with "arm-linux-gnueabihf-gcc -E -dD <filename>"
>>>>> Maybe it is not enough. I'll try with complete command having =
include
>>>> paths
>>>>> and see if it improves anything.
>>>>>=20
>>>>> On Wed, Jan 13, 2016 at 2:29 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>>=20
>>>>>>=20
>>>>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0=
577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48:26:
>>>>>> fatal error: qnetworkinfo.h: No such file or directory
>>>>>>=20
>>>>>>=20
>>>>>> Please post complete file
>>>>>>=20
>>>>>>> On Jan 12, 2016, at 5:22 PM, Ankur Tyagi =
<ankur.tyagi85@gmail.com>
>>>>>> wrote:
>>>>>>>=20
>>>>>>> thanks
>>>>>>>=20
>>>>>>> here it is.. =
https://gist.github.com/anonymous/a03e9fb2203e45a4b033
>>>>>>>=20
>>>>>>> On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com>
>> wrote:
>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi =
<ankur.tyagi85@gmail.com>
>>>>>>>> wrote:
>>>>>>>>>=20
>>>>>>>>> sorry it took me a while to reply.
>>>>>>>>>=20
>>>>>>>>> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
>>>>>>>>>=20
>>>>>>>>> I have preprocess
>>>>>>>>> =E2=80=8B =E2=80=8B
>>>>>>>>> =E2=80=8B=E2=80=8B
>>>>>>>>> log but looks like pastebin is down. Ok to send the log as
>>>> attachment ?
>>>>>>>>=20
>>>>>>>> http://alternativeto.net/software/pastebin/
>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com>
>>>> wrote:
>>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <
>> ankur.tyagi85@gmail.com
>>>>>=20
>>>>>>>>>> wrote:
>>>>>>>>>>>=20
>>>>>>>>>>> included stdint.h in qnetworkinfo_linux.cpp but still =
getting the
>>>>>> same
>>>>>>>>>> error
>>>>>>>>>>=20
>>>>>>>>>> what version of gcc are you using and can you preprocess the =
file
>>>>>> under
>>>>>>>>>> error with -E -dD and pastebin it ?
>>>>>>>>>>=20
>>>>>>>>>>>=20
>>>>>>>>>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj =
<raj.khem@gmail.com>
>>>>>> wrote:
>>>>>>>>>>>=20
>>>>>>>>>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
>>>>>>>> ankur.tyagi85@gmail.com>
>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>=20
>>>>>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>=20
>>>>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
>>>>>>>>>>>>> error: expected identifier before '*' token
>>>>>>>>>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
>>>>>>>>>>>>=20
>>>>>>>>>>>> this means that stdint.h is missing from includes.
>>>>>>>>>>>> --
>>>>>>>>>>>> _______________________________________________
>>>>>>>>>>>> Openembedded-devel mailing list
>>>>>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>>>>>=20
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>>>>>>>=20
>>>>>>>>>>> --
>>>>>>>>>>> _______________________________________________
>>>>>>>>>>> Openembedded-devel mailing list
>>>>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>>>>=20
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>>> --
>>>>>>>>>> _______________________________________________
>>>>>>>>>> Openembedded-devel mailing list
>>>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>>> =
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>>>>>>>=20
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


--Apple-Mail=_BFFF112B-092E-46AD-8603-023D520285F3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaX5XgACgkQuwUzVZGdMxRyKgCdErHudjsm36rBTVSPcyxybxK2
vawAnA7lzjDGERmB8Bo0N827fQGn07+/
=dAn0
-----END PGP SIGNATURE-----

--Apple-Mail=_BFFF112B-092E-46AD-8603-023D520285F3--
