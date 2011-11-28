Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RV56W-0001Cg-Ez
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 18:34:56 +0100
Received: by faar15 with SMTP id r15so366702faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2011 09:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=RjP5eKdy3WNtWMSgBUieuTIrZ34YE2UBSloV7wY/Uzs=;
	b=SprRa6oDPoc0or3wSEPNiOvjiyZ1EiV9unbYG2ZWRlMxaf6eJG6Dqgf9tGEtxL/XwN
	b4+Kr8Jr1p9szgBhaC+EK/sQ10Bx29PmcDFFufcTr20D96NJnjMviAK7oDEPlKX1DbZb
	0J2m7BpeiP3qpcM6vfvi3N3r8SY+ELsrqLOjQ=
Received: by 10.152.106.38 with SMTP id gr6mr29833115lab.35.1322501298240;
	Mon, 28 Nov 2011 09:28:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 28 Nov 2011 09:27:13 -0800 (PST)
In-Reply-To: <652FFCE9-01FD-4E13-8ABA-4B7100803BE0@dominion.thruhere.net>
References: <1322395493-30396-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1sreJB3qkFnDZPxpxBv7bZBkfE6aJ0Jwbv55HvQepitj6g@mail.gmail.com>
	<652FFCE9-01FD-4E13-8ABA-4B7100803BE0@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Nov 2011 09:27:13 -0800
Message-ID: <CAMKF1sqdDTL5NshgoiGaN67GwynMZ+rWnwCRvo3+YAy4e3Tepw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] digitemp: fix QA issues:
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
X-List-Received-Date: Mon, 28 Nov 2011 17:34:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2011 at 12:26 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 28 nov. 2011, om 03:17 heeft Khem Raj het volgende geschreven:
>
>> On Sun, Nov 27, 2011 at 4:04 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>> -EXTRA_OEMAKE =3D "ds9097 ds9097u"
>>> +EXTRA_OEMAKE =3D "ds9097 ds9097u \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SYSTYPE=3D'Lin=
ux' \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>> +# Fix GNU_HASH QA errors
>>> +TARGET_CC_ARCH +=3D "${CFLAGS} ${LDFLAGS}"
>>>
>>>
>>
>> why CFLAGS ? I thought only LDFLAGS would have been sufficient
>
> For GNU_HASH yes, but the buildsystem was ignoring both CFLAGS and LDFLAG=
S.
>

bug in the build system I would say

> regards,
>
> Koen
>
>
> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7TRcgACgkQMkyGM64RGpGywgCgjzrNXHq8p6U9B0SxwnA185VM
> cFoAn2GqpleZxYeGQkSsr7oy/0lfrJn5
> =3DNbq+
> -----END PGP SIGNATURE-----
>
>


