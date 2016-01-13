Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id DBC57731E7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 01:29:38 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id 65so71832382pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2016 17:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=uQuoZ9xz1YB5lAWV+T6rfC0KEzy08WtBuabOrtd7ZwI=;
	b=NOMJ+8WoBZFJMGHJJ1YPlIFQySUs413AlHE2GFQfsm/B94n94y3XsFKy2kshYCZZ23
	UihPSTSTOer2zJbmSzOwFsh+DMZ/H5OTe7ZCeDJPQ2NYqrupYy/yb/umRdEbTb6BGTfn
	XXfXg5JK4HulgkbrzgVcbOobMGOfmyaiHlWy04f8A/1d3wNpCyEWDKGOrK5oKI42E2e2
	l6bU48D0XzJ/aaM1gg1dsF2UcFVyU3IQ5aoDkjOSZutAm6Vs7QVpWpKi0uWuLAvJ4Iv5
	eDyacBwfJxlC91jp1v0zlyxpL+3bkXjcv7pWm0vDW11xk/MG8ZAhsGGIGK2luxHob6sE
	nPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:message-id:references:to;
	bh=uQuoZ9xz1YB5lAWV+T6rfC0KEzy08WtBuabOrtd7ZwI=;
	b=gcdv00FDPeQgMTP+xyAdTQIpAVZxvozfd9Un6QVB8E+r+JP3VOMwbxy4N3TpdZ5a2H
	40CCwsG0K24R0rBAqUnVe+AJHRjosy1qyXxlB8EVJrEd4ZxQK/0Y8tTwNIPsFjWwjTaS
	uX6VSYLy6Od0Lsy7HvsZhy8nnLQvtiWBQNZeShOdik/xYYz7wVEaBC/z5hV+OKze3Q5l
	apThB/cSizUMDVIF6yloj1qOn6XW9Go1XpLpdbNtrOv0yGcx7Juq9DYfVGn7FgHYMaZo
	9CWtFo/40dpgEU6Lv9/e0bbg6kqclrDslVrs8j1VRApP/mYiD7D3o6Yv+bQQgSX6C6HK
	xOdw==
X-Gm-Message-State: ALoCoQkNATpjLT+C/keeQ38vN3fyBkpMnwlxHLAOA/RehAKaW/VFixbdY9ltckMljVIKaYTY92sAbdA7dcostaxNGD/H3xCbUQ==
X-Received: by 10.98.79.4 with SMTP id d4mr38206650pfb.46.1452648578981;
	Tue, 12 Jan 2016 17:29:38 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:5819:3c63:1381:916a?
	([2601:646:8802:5d5c:5819:3c63:1381:916a])
	by smtp.gmail.com with ESMTPSA id
	t67sm33039788pfa.14.2016.01.12.17.29.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 17:29:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADySD0GV+gsBBoU7vFVZwfNxiVUDawzrP5L3n=4ZXuUPhyr6yg@mail.gmail.com>
Date: Tue, 12 Jan 2016 17:29:33 -0800
Message-Id: <82CDD0BD-1D28-425B-9F1A-99AFFB42CFE5@gmail.com>
References: <CADySD0EiW1oO_wezsLtEFX8h2V-ByykrgfSvOvGLJJLWyrm4uw@mail.gmail.com>
	<CAMKF1sqmg8gOj3_jjJTGebJQj+msh5tquKnOOV8zwShJtoHaUA@mail.gmail.com>
	<CADySD0Fx+VpoaPNgFSwvne6D1ENxH=F-v4cpSJmjRtc2rpkS2A@mail.gmail.com>
	<90CBA3E6-A9A9-4485-ADAB-2D68D6E88E40@gmail.com>
	<CADySD0GQa+S1OY0R9KaQxJ_EFYB+TRJociEszuuFWW_7dO0JYA@mail.gmail.com>
	<BFC78264-0398-49A7-8C37-DA2958AA5BD7@gmail.com>
	<CADySD0GV+gsBBoU7vFVZwfNxiVUDawzrP5L3n=4ZXuUPhyr6yg@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jan 2016 01:29:39 -0000
X-Groupsio-MsgNum: 59503
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F75D2547-8352-4553-A905-EDC63F077665";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F75D2547-8352-4553-A905-EDC63F077665
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

/=
home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work/cortexa8hf-vfp-neon-linux-gnueabi/qtsystems/5.5.1+gitAUTOINC+05=
77ffca58-r0/git/src/systeminfo/linux/qnetworkinfo_linux_p.h:48:26: fatal =
error: qnetworkinfo.h: No such file or directory


Please post complete file

> On Jan 12, 2016, at 5:22 PM, Ankur Tyagi <ankur.tyagi85@gmail.com> =
wrote:
>=20
> thanks
>=20
> here it is.. https://gist.github.com/anonymous/a03e9fb2203e45a4b033
>=20
> On Wed, Jan 13, 2016 at 1:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>>=20
>>> On Jan 12, 2016, at 4:39 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
>> wrote:
>>>=20
>>> sorry it took me a while to reply.
>>>=20
>>> I am using gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.
>>>=20
>>> I have preprocess
>>> =E2=80=8B =E2=80=8B
>>> =E2=80=8B=E2=80=8B
>>> log but looks like pastebin is down. Ok to send the log as =
attachment ?
>>=20
>> http://alternativeto.net/software/pastebin/
>>=20
>>>=20
>>> On Tue, Jan 12, 2016 at 9:16 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>=20
>>>>=20
>>>>> On Jan 11, 2016, at 11:25 AM, Ankur Tyagi =
<ankur.tyagi85@gmail.com>
>>>> wrote:
>>>>>=20
>>>>> included stdint.h in qnetworkinfo_linux.cpp but still getting the =
same
>>>> error
>>>>=20
>>>> what version of gcc are you using and can you preprocess the file =
under
>>>> error with -E -dD and pastebin it ?
>>>>=20
>>>>>=20
>>>>> On Mon, Jan 11, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>>=20
>>>>>> On Mon, Jan 11, 2016 at 10:37 AM, Ankur Tyagi <
>> ankur.tyagi85@gmail.com>
>>>>>> wrote:
>>>>>>>=20
>>>>>>=20
>>>>=20
>> =
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-too=
lchain/sysroots/am335x-evm/usr/include/bluetooth/bluetooth.h:159:9:
>>>>>>> error: expected identifier before '*' token
>>>>>>> |   return bt_get_unaligned((const uint64_t *) ptr);
>>>>>>=20
>>>>>> this means that stdint.h is missing from includes.
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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


--Apple-Mail=_F75D2547-8352-4553-A905-EDC63F077665
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaVqIEACgkQuwUzVZGdMxRxuwCeP+vdX0/MBPUvE7zwjUkP452h
xj0AoI+RRwoaTSQpk5uLyh/GMwhZGkWE
=DLuF
-----END PGP SIGNATURE-----

--Apple-Mail=_F75D2547-8352-4553-A905-EDC63F077665--
