Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id B99E865CB6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 00:44:43 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id yy13so255619038pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 16:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=PBosv33CmzXDvlHZaoP6OmIRd+sXL1jfVEhEtFokPZ0=;
	b=aEAN32QoyfaJyiYD8UTxPSP6mk3JMvA7dksYzRtl8NYMwGexJllHD/c+kBW2lb7zXD
	Plqm65gRpc9lFy4HHkVjl/2kIboiPCUnPZJtSvqn7PfMPjMq60IHxORnT9hMmNlCvUAZ
	jDCyOyS25S5znC2IoT9xDFSHvIhwfKIvwZ++sKDfh7Re7vo0jglWIFWj1hTYZzti0eRA
	R+tVMs9bb41MX8jvny9LH8e+QxIauwgxxykc6KSxU9+JDmS5JROxdD+yKKj6WcwvSWeh
	WOsIoBtJRPewQb6DAZy5J8AiEVsSFvIDwLc5n9EeqLGsG511xz70GJyDNnv0l9HLHBQF
	mmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=PBosv33CmzXDvlHZaoP6OmIRd+sXL1jfVEhEtFokPZ0=;
	b=Kl2zhmiZkClf34WGzovREFaYiAO5NJTthF68UyLdbwX+GzyaPbCx2zpymm+PJ0vLKj
	mBeCiaZi4Pbx8JUC3qwYxJrXl89YuXAdDk1lXbw9TPSEbSeIcqyo00oJ94wvtPhZflNB
	FniExszygW3jpFdg9QN6oh+j0j1MNTaQ7C/0Ik39DQ+s3XX34ulX+SxqrenSHwAI3D1p
	L7z1RLG/wZbS4PSBZ/y66IHvD+fLVOjrxKxsDkLC0UDWS3sjFUwSVWLO6lSYkHPt6Bk8
	ZnMtbwydn9rPv5v2zSrf10Pm70McrlKMJ95Uk7icR1JMCAw0LTeuQdokoRIsE2D6ohBu
	TD5Q==
X-Gm-Message-State: ALoCoQnKSMfbqim77JIZz4Pr3tYOwU08NBOBUWnueZcIHlADO11NxVZCU8Wo2OwEnc7mynK4VMZJmmh48DzBvEXIU6qAiOQwZg==
X-Received: by 10.67.5.69 with SMTP id ck5mr192895293pad.125.1452645884383;
	Tue, 12 Jan 2016 16:44:44 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:5819:3c63:1381:916a?
	([2601:646:8802:5d5c:5819:3c63:1381:916a])
	by smtp.gmail.com with ESMTPSA id
	191sm32913615pfa.23.2016.01.12.16.44.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 16:44:43 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
Date: Tue, 12 Jan 2016 16:44:39 -0800
Message-Id: <BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
	<CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 00:44:45 -0000
X-Groupsio-MsgNum: 59501
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CDD0D36D-4733-4598-8E76-0DD5AD4197FF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CDD0D36D-4733-4598-8E76-0DD5AD4197FF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi <ankur.tyagi85@gmail.com> =
wrote:
>=20
> sorry it took me a while to reply.
>=20
> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
>=20
> I have preprocess
> =E2=80=8B =E2=80=8B
> =E2=80=8B=E2=80=8B
> log but looks like pastebin is down. Ok to send the log as attachment =
?

http://alternativeto.net/software/pastebin/

>=20
> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>>=20
>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>> wrote:
>>>=20
>>> included stdint.h in qnetworkinfo_linux.cpp but still getting the =
same
>> error
>>=20
>> what version of gcc are you using and can you preprocess the file =
under
>> error with -E -dD and pastebin it ?
>>=20
>>>=20
>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>=20
>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi =
<ankur.tyagi85@gmail.com>
>>>> wrote:
>>>>>=20
>>>>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
>>>>> error: expected identifier before '*' token
>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
>>>>=20
>>>> this means that stdint.h is missing from includes.
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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


--Apple-Mail=_CDD0D36D-4733-4598-8E76-0DD5AD4197FF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaVnfoACgkQuwUzVZGdMxTpPACgjvC9xqaRm5lSe8fxgZbTQC9s
G2AAn23z1LsB7BUcB91Ed3VIoNRizqGe
=WOBo
-----END PGP SIGNATURE-----

--Apple-Mail=_CDD0D36D-4733-4598-8E76-0DD5AD4197FF--
