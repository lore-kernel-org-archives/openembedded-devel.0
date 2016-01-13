Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id C335873176
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 01:50:52 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id e65so72368509pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 17:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=CuReLcQc98g5uBPalqeA+s5MGAh5/YVx4q/h+7FPjq8=;
	b=Qs50VuqU5emMfeCt+1GdeOm12+A0JauZfV9TV/gQH60OCaEcyrKSCLKrF37TxluD2v
	+6EuBJe1YJcV22Dn++By+lJSR//FThyyINhfn63CeUo9TYP0TyoLwwCiTO+Llwhm3RK0
	Bbu5s5fg1mnImOo24SJNHgSdcCcsDKUumEci3EanLvHq1bWVfaqo2vY8lnxLD6QQaZ/K
	S2Eu7yzfl8X5O6j0Eomi89kit5/P6MvQvIciMwEd01TSg0S6gd/AEhc/BEvL3WYBP7Xk
	8auFIkmCdMswklzwaJvHEoofT9q8ik9kM2aAgViG3eKpZdmrm6OxDlMx7vRfw1I4G+5o
	UygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=CuReLcQc98g5uBPalqeA+s5MGAh5/YVx4q/h+7FPjq8=;
	b=bru4XonJVrk551MtAb+N/HcxTm964tal0W6mXFnsKe/+vFj3aSr82xf1laREXS9mTl
	jBjDt/jg1NlR1ZytsAiFi9OEUx6AlnY0ibS1XE3mH6mxNXGYgzq1GlJUzUVzx25p0/ED
	OlenVVNTk56hJBs92vJA9+HfLs/FEEp+jJJHzpA/SDaO/VJs96jChECuyu9QHfA3bqwO
	+w/rT5VNi+lkxrtn+PCmyTqyelu/SfSJZ3J4DaIj+PdHfz4GhXeYhPnCSpyqnJvnrTcJ
	lAGc3Gxt8EWDtAWXMjtWqm9bilMI4VPggtyO/HZXfwh3POBX05qjrcHBIkrkP5AQZ349
	q6cg==
X-Gm-Message-State: ALoCoQnd43cKmhQ9ZMWQevajGgTFPqr9yTutNBTwiyC0pYCQlFeoZ05r+kmEiBasY7rcbXWBaKIpsG/zH69GSHfs0cPQG/FULw==
X-Received: by 10.98.15.66 with SMTP id x63mr29019887pfi.19.1452649853202;
	Tue, 12 Jan 2016 17:50:53 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:5819:3c63:1381:916a?
	([2601:646:8802:5d5c:5819:3c63:1381:916a])
	by smtp.gmail.com with ESMTPSA id 20sm11869538pfa.5.2016.01.12.17.50.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 17:50:52 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADySD0G_vmN=SwZsVRrg5Ko+P_jM6Nvs2UTt0paaqiPcfcM0-Q@mail.gmail.com>
Date: Tue, 12 Jan 2016 17:50:48 -0800
Message-Id: <41A6B023-03C6-48E4-B3EC-E1BA1F073B70@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
	<CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
	<BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
	<CADySD0GV+gsBBoU7vFVZwfNxiVUDawzrP5L3n=4ZXuUPhyr6yg@mail.gmail.com>
	<82CDD0BD-1D28-425B-9F1A-99AFFB42CFE5@gmail.com>
	<CADySD0G_vmN=SwZsVRrg5Ko+P_jM6Nvs2UTt0paaqiPcfcM0-Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 01:50:52 -0000
X-Groupsio-MsgNum: 59505
Content-Type: multipart/signed;
	boundary="Apple-Mail=_94FECFEE-FF5D-4163-AE10-D4CAE7C8E801";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_94FECFEE-FF5D-4163-AE10-D4CAE7C8E801
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

No. you need to use complete cmdline that is used while compiling it =
originally to produce the error

> On Jan 12, 2016, at 5:37 PM, Ankur Tyagi <ankur.tyagi85@gmail.com> =
wrote:
>=20
> I posted the complete log file.
>=20
> I tried with "arm-linux-gnueabihf-gcc -E -dD <filename>"
> Maybe it is not enough. I'll try with complete command having include =
paths
> and see if it improves anything.
>=20
> On Wed, Jan 13, 2016 at 2:29 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+0=
577ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48:26:
>> fatal error: qnetworkinfo.h: No such file or directory
>>=20
>>=20
>> Please post complete file
>>=20
>>> On Jan 12, 2016, at 5:22 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>> wrote:
>>>=20
>>> thanks
>>>=20
>>> here it is.. https://gist.github.com/anonymous/a03e9fb2203e45a4b033
>>>=20
>>> On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>=20
>>>>=20
>>>>> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>>>> wrote:
>>>>>=20
>>>>> sorry it took me a while to reply.
>>>>>=20
>>>>> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
>>>>>=20
>>>>> I have preprocess
>>>>> =E2=80=8B =E2=80=8B
>>>>> =E2=80=8B=E2=80=8B
>>>>> log but looks like pastebin is down. Ok to send the log as =
attachment ?
>>>>=20
>>>> http://alternativeto.net/software/pastebin/
>>>>=20
>>>>>=20
>>>>> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>>=20
>>>>>>=20
>>>>>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi =
<ankur.tyagi85@gmail.com>
>>>>>> wrote:
>>>>>>>=20
>>>>>>> included stdint.h in qnetworkinfo_linux.cpp but still getting =
the
>> same
>>>>>> error
>>>>>>=20
>>>>>> what version of gcc are you using and can you preprocess the file
>> under
>>>>>> error with -E -dD and pastebin it ?
>>>>>>=20
>>>>>>>=20
>>>>>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com>
>> wrote:
>>>>>>>=20
>>>>>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
>>>> ankur.tyagi85@gmail.com>
>>>>>>>> wrote:
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>=20
>>>>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
>>>>>>>>> error: expected identifier before '*' token
>>>>>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
>>>>>>>>=20
>>>>>>>> this means that stdint.h is missing from includes.
>>>>>>>> --
>>>>>>>> _______________________________________________
>>>>>>>> Openembedded-devel mailing list
>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>> =
http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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


--Apple-Mail=_94FECFEE-FF5D-4163-AE10-D4CAE7C8E801
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaVrXsACgkQuwUzVZGdMxR4/gCeJj3h9i72pZpvnPW1/RSpYkeU
KeQAn2kZgOkFZFLb+mXrznMi7sflqKn3
=0mE8
-----END PGP SIGNATURE-----

--Apple-Mail=_94FECFEE-FF5D-4163-AE10-D4CAE7C8E801--
