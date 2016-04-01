Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7F2376612C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 22:16:13 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id n5so99830355pfn.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 15:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=GYbXd4L5NqkhFkGkJnyTyD2ZsYmT+5bKxtpuLWFHI8w=;
	b=FTI+cn1JgVfK84k1dRdJOGMyf40PAp4nxTSneRinG5kLr9ogoc8fuHr5tHMznbYLIO
	UtY7M5wygY+ndpafbxqp+IBxTLX8Id8g+HvBFpQnX1VzI0yzLUN60DkAUdu/SK9mIjfO
	SUyrEf2oigqmD+iuE39JanP9JrzWJxjuHyl4tvbU5HSE6DhYHjRAz1CC2AReIWhQgubd
	bqil2Wcel/ZmZuTqL+IEmUhmce6ljJdgSDKZ//pz+0Zw5qyDukzbKUMkJ/i86oCb/gKg
	cp5PpMeZYNPAJJkOWcPzbR6V9invDu+k6zWJ7ge3X2gjFDgznuF4BMMDEjSnGxs9FKde
	hIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GYbXd4L5NqkhFkGkJnyTyD2ZsYmT+5bKxtpuLWFHI8w=;
	b=bO1kBxFBMAZvM/znxd+03yZSCvPl9iBE9goJio0hsytMVM2RPRDgJwU2XpCT27jVQI
	MkAqux9CK2SUt4L06l72BD/6hxGN3QQViRxJ2ohsBgKbO/K0TiuTHq3TEVakcLQVBueY
	AGk8pD1Q2F+9kVLczFuN2Mhu/O8FNNR8KIADJHGS4yJnk5ss9lOb+OqGvlEBCZ+WZj4R
	ooZtZrdpRaOFyXS41mu41P7tPpgyUexUyQSMxX6oP3IdMfSwFQVoJEtIm6ekd1OhBEpI
	A7a7Eo+DX2UcLSBQYMLHLwfoXnJKM7ieMzuzZ0Ovaif216FNOPKnydgVhX6ciHIK2x5S
	cUeQ==
X-Gm-Message-State: AD7BkJIzZ0pC8/jWqcmZctNudnr2xHp5pbB/k3UUTUCDdmRLrf5xYTAf8+z5KePy770PJA==
X-Received: by 10.98.79.205 with SMTP id f74mr1901551pfj.68.1459548974776;
	Fri, 01 Apr 2016 15:16:14 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:e8d9:786e:60e7:43d8?
	([2601:646:8800:5a9a:e8d9:786e:60e7:43d8])
	by smtp.gmail.com with ESMTPSA id
	tn5sm24274985pac.32.2016.04.01.15.16.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2016 15:16:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAPybu_3C2ryEc_heWYfH7f1KJjnZRnWxvQLF5LBAXMvhXmGJ5A@mail.gmail.com>
Date: Fri, 1 Apr 2016 15:16:13 -0700
Message-Id: <27CA54B3-9F6C-4407-A457-0EFC979C4065@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
	<1459546590-9513-7-git-send-email-ricardo.ribalda@gmail.com>
	<CAJ86T=Ve72OuEUAof1Tcogn5kqU=W7-_OY7TsTvJcYaVUDvrhA@mail.gmail.com>
	<CAPybu_3C2ryEc_heWYfH7f1KJjnZRnWxvQLF5LBAXMvhXmGJ5A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH v7 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Fri, 01 Apr 2016 22:16:14 -0000
X-Groupsio-MsgNum: 60797
Content-Type: multipart/signed;
	boundary="Apple-Mail=_92F6CB90-B41F-40EA-BDA8-E90F94B3DCFC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_92F6CB90-B41F-40EA-BDA8-E90F94B3DCFC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 1, 2016, at 2:57 PM, Ricardo Ribalda Delgado =
<ricardo.ribalda@gmail.com> wrote:
>=20
> Hi Andre
>=20
> +=3D does not add the leading space?
>=20
> =
http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manu=
al.html#appending-and-prepending-override-style-syntax
>=20
> I thought +=3D was preferred.

its not a designed behavior but a byproduct.

>=20
> I am confused. What shall I resend +=3D " foo" or =3D " foo=E2=80=9D

append/prepend without any override style syntax is much cleaner to =
understand

> ?
>=20

> Regards
>=20
> On Fri, Apr 1, 2016 at 11:46 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>> On Fri, Apr 1, 2016 at 2:36 PM, Ricardo Ribalda Delgado
>> <ricardo.ribalda@gmail.com> wrote:
>>> OpenCV wrongly assumes that the X86 variable would be set on Intel =
32
>>> bit architectures.
>>>=20
>>> This patch adds the missing definition on those cases.
>>>=20
>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>> ---
>>> meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb =
b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>>> index 63955a862d4a..b89fbbb214f6 100644
>>> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
>>> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>>> @@ -45,6 +45,7 @@ EXTRA_OECMAKE =3D =
"-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_LIBDIR}/${PYTHON_DI
>>>                  ${@base_conditional("libdir", "/usr/lib64", =
"-DLIB_SUFFIX=3D64", "", d)} \
>>>                  ${@base_conditional("libdir", "/usr/lib32", =
"-DLIB_SUFFIX=3D32", "", d)} \
>>> "
>>> +EXTRA_OECMAKE_append_x86 =3D "-DX86=3DON"
>>=20
>> That should be:
>>=20
>> EXTRA_OECMAKE_append_x86 =3D " -DX86=3DON"
>>=20
>> Note the leading space. See:
>>=20
>>  =
http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manu=
al.html#appending-and-prepending-override-style-syntax
>>=20
>>>=20
>>> PACKAGECONFIG ??=3D "eigen jpeg png tiff v4l libv4l gstreamer =
samples tbb \
>>>                    ${@bb.utils.contains("DISTRO_FEATURES", "x11", =
"gtk", "", d)} \
>>> --
>>> 2.8.0.rc3
>>>=20
>=20
>=20
>=20
> --
> Ricardo Ribalda
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_92F6CB90-B41F-40EA-BDA8-E90F94B3DCFC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb+8y0ACgkQuwUzVZGdMxR5qQCfRv+PpXgTPw4tEq0+Of7+YDkR
9soAn2P8vCh8OF1OoJnWINa6JN2NuSCS
=eDUW
-----END PGP SIGNATURE-----

--Apple-Mail=_92F6CB90-B41F-40EA-BDA8-E90F94B3DCFC--
