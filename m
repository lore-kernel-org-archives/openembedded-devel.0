Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6B171C9A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 23:30:08 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id p25so376707uaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 16:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=kNItxMWVaeKGVaVMbnaF3eNKiyDRxbnViJAGdWECC6U=;
	b=GNaYHQh2aSDth70Xi7bTyhQHrYYtxu4xV/yrpnH6Ato7RXDU50+VxXvohd8dRuXzyZ
	obsFMAS2F5+PN6Ky3aHpeiKAJrrwt/nNLfVgX0JbdVBej2Q4VY88MfHzU+jF742W/IjK
	3K0rYGvy95gt9ENr3qqssSggi1ZCL8W2PyHdFjo147EvxebHoiva0hzgCtUlU/CXUjlI
	3WggWiaAX1+HEiGUu2Kt6Ea1XW6HeQyy6kFVFzHKn/bFiL0X2h3chqy3KEpobGJLlPdb
	0//cyWHZjJ4NM3ZU8qqvJ2UMQpwoKuBYclTQ8MvYb3HVtJndoivYFEW+QEcJlRWLXDck
	3ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=kNItxMWVaeKGVaVMbnaF3eNKiyDRxbnViJAGdWECC6U=;
	b=gWTsjcm9AR2boBICSGNo2D5TwIMLJHCHISxDJeLQn3jWVKiMUzIzRycLCL+azC/jHE
	5O8RcSEkqXOn+OhZXIxqIMTcz49cXnLhYZx9mS8k0e0tybzL3qQZJPwRxI7rJe87Q4fZ
	TqB/FIXxFeF/AyPO4ncBUO2zWGiRpNjKBz4XmL+aodhceQ1n2fDuxn4t+bVqxJ7Gy3FE
	POLTS+W+3lUKvbsK2CXK/9/Y+WriJQr7R0c3Y0rXl4Bycta9IVyYpLxUzcfRp4Og9FhL
	LCOJ5hM8yEtoaB+IjU490LI9kgEYwiYOz5KF0Yf7Wz+sYU+geDH9fKmRENNbBysO3H33
	HjcA==
X-Gm-Message-State: ABUngveGfBdcr/kBx3Ty6pkF5pXpH3G5SQS19P5tR3zN5/HCOmybyaT6qEcbMZO2cu6oZZyxfW4lWispfLW2+A==
X-Received: by 10.159.48.153 with SMTP id j25mr1592909uab.6.1477092608950;
	Fri, 21 Oct 2016 16:30:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Fri, 21 Oct 2016 16:29:38 -0700 (PDT)
In-Reply-To: <f831f9a9-d2e3-9fd3-41f9-d8479a933a1a@balister.org>
References: <1477052056-14472-1-git-send-email-philip@balister.org>
	<36CFFABF-F18A-405E-BA43-08713EC46478@gmail.com>
	<f831f9a9-d2e3-9fd3-41f9-d8479a933a1a@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Oct 2016 16:29:38 -0700
Message-ID: <CAMKF1sp8rcdobR6oOHELNckR1cAay-wpG2YYR_O1Mo_V+TTt_A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fftw: Allow an empty package for fftw.
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
X-List-Received-Date: Fri, 21 Oct 2016 23:30:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2016 at 4:05 PM, Philip Balister <philip@balister.org> wrot=
e:
> On 10/21/2016 01:08 PM, Khem Raj wrote:
>>
>>> On Oct 21, 2016, at 5:14 AM, Philip Balister <philip@balister.org> wrot=
e:
>>>
>>> The fftw-dev package RDEPENDS on the fftw package. Let the recipe creat=
e an
>>> empty one to satisfy this requirement.
>>>
>>> Signed-off-by: Philip Balister <philip@balister.org>
>>> ---
>>> meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recip=
es-support/fftw/fftw_3.3.4.bb
>>> index 0faaea1..0bb6cc2 100644
>>> --- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
>>> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
>>> @@ -69,4 +69,6 @@ FILES_fftwl-wisdom =3D "${bindir}/fftwl-wisdom"
>>> FILES_fftwf-wisdom =3D "${bindir}/fftwf-wisdom"
>>> FILES_fftw-wisdom-to-conf =3D "${bindir}/fftw-wisdom-to-conf"
>>>
>>> +ALLOW_EMPTY_${PN}=3D =E2=80=9C1"
>>
>> as Martin said
>>
>> RDEPENDS_${PN}-dev =3D =E2=80=9C=E2=80=9D
>>
>> should be done.
>
> It also RDEPENDS on libfftw libfftwf and libfftwl.
>
> Is there a way to remove just one entry in the RDEPENDS line? Need to
> think through exactly what is going on.
>

uncoupling it like this will be take care of that too.

