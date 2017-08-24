Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6145F782EB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 13:48:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p14so4009837pgd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Moh54Vqr7apdZHI7FEInilriJ9LNhadPjU8uuBzb0zQ=;
	b=UcYSZV+5t0HJfsrZvKugsDiwD83NZ5jBJ8AjuLxRRDYbtBXNcBdvoWEyvWz2L7PLIZ
	nLdKUixJ/DEVJvnxW6ne54fFzKQfe07gI4ftGMAzw+z47kiQ6opFOVbuWkPa6qjUaQ62
	XyfAJvjxJKrbmmRUIRhjkBDpHrUvT0Yx4xI+XkkfP7Huc8VtKF9kuvP/R/94OSZlkpJe
	88yIj6wuVv5+926rNU4MiLcFPYoZECvBiUx1Y/+vmqnxuipG5l6vT7H+OFbXD5xrEeTp
	FuPko8m86PaH6vrv3ew3in2BgIs1iLnQO36Qwm8ZK3a3bhs10j9GEuhCdeyD7h0T4mD6
	Begg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Moh54Vqr7apdZHI7FEInilriJ9LNhadPjU8uuBzb0zQ=;
	b=ZOWXZfjrXt+SFEBm9nIq2cSn30GY1YrZKZWcA1evA/06LbT0w70MXfmHdoP4VcbMZv
	EyY75u+Le3x5GAoVcUKBdZJ7FedGi8sPgv1XD+C9P3pQWYN3oZsTDOgmig3J9/1g2/1d
	dWv9RuJrlBXEM+m4MCIfrCQxexKzZCDaBH14XPDfy/eivhFWzqwOrWGpoFqE78/NU6M5
	iGAxbGuvuWF8ifE+t2s2lst/nv1Kaa7JqSCVwDVF1K/Qy7GRFEvbg6BWvkHDGGPUqsYe
	Bt4uB+L7/1FvmyFWgkC6Fg3+h1JeMmJw0X7SPoJ/YimwTwUucSmSvgZ2Yd1QJGUSJ54N
	d5fA==
X-Gm-Message-State: AHYfb5gFLS9yT34wjoR5JvLIKJF6myc10MPhpx7YsFtUxhBH2SeXBJUw
	a2GSpLdscRShcHlGFS4acHLDlhMZhA==
X-Received: by 10.99.138.199 with SMTP id y190mr6343939pgd.287.1503582504645; 
	Thu, 24 Aug 2017 06:48:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Thu, 24 Aug 2017 06:47:54 -0700 (PDT)
In-Reply-To: <12285f58-5d0b-2e9e-542b-933339268f33@windriver.com>
References: <CAMKF1spON1L-HeobLHk+GaQqcqSbXtzvPQPnaVnjfy8jyqYEQQ@mail.gmail.com>
	<1503467852-161518-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1srzoJzqCW_iYXQDd+hGB0dt2TZcDVK-Wy2GgtYOXkqx5w@mail.gmail.com>
	<12285f58-5d0b-2e9e-542b-933339268f33@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Aug 2017 06:47:54 -0700
Message-ID: <CAMKF1spetwUqZ5OmK4tGbqpCXVC4bBivLmThfQZniUgKPpXmLQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2] netcf: upgrade to latest 0.2.8
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
X-List-Received-Date: Thu, 24 Aug 2017 13:48:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2017 at 10:34 PM, Hongxu Jia <hongxu.jia@windriver.com> wro=
te:
> On 2017=E5=B9=B408=E6=9C=8823=E6=97=A5 22:36, Khem Raj wrote:
>>
>> On Tue, Aug 22, 2017 at 10:57 PM, Hongxu Jia <hongxu.jia@windriver.com>
>> wrote:
>>>
>>> Fix compile failure while gnulib upgraded to 2017-08-20.18
>>> ...
>>> | In file included from ../../../git/gnulib/lib/printf-args.h:41:0,
>>> |                  from ../../../git/gnulib/lib/printf-parse.h:29,
>>> |                  from ../../../git/gnulib/lib/printf-parse.c:36:
>>> | ./wchar.h:571:6: error: #if with no expression
>>> |  # if
>>> ...
>>>
>>> Update HOMEPAGE, SRC_URI since the formers are obsolete.
>>>
>>> Update SRCREV, although version not change, but the former
>>> was two years ago.
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   .../recipes-support/netcf/{netcf_git.bb =3D> netcf_0.2.8.bb}     | 10
>>> ++++++----
>>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>>   rename meta-networking/recipes-support/netcf/{netcf_git.bb =3D>
>>> netcf_0.2.8.bb} (88%)
>>>
>>> diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb
>>> b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>>> similarity index 88%
>>> rename from meta-networking/recipes-support/netcf/netcf_git.bb
>>> rename to meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>>> index a7a5000..0b53add 100644
>>> --- a/meta-networking/recipes-support/netcf/netcf_git.bb
>>> +++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
>>> @@ -1,15 +1,15 @@
>>>   SUMMARY =3D "netcf"
>>>   DESCRIPTION =3D "netcf is a cross-platform network configuration
>>> library."
>>> -HOMEPAGE =3D "https://fedorahosted.org/netcf/"
>>> +HOMEPAGE =3D "https://pagure.io/netcf"
>>>   SECTION =3D "libs"
>>>   LICENSE =3D "LGPLv2.1"
>>>
>>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbbb461211a33b134d42ed5ee802=
b37ff"
>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfb919cc88dbe06ec0b0bd50e001=
ccf1f"
>>>
>>> -SRCREV =3D "9158278ad35b46ce9a49b2e887483c6d8c287994"
>>> +SRCREV =3D "2c5d4255857531bc09d91dcd02e86545f29004d4"
>>>   PV =3D "0.2.8+git${SRCPV}"
>>
>> you can change it to
>>
>> PV .=3D "+git${SRCPV}"
>
>
> Why? Since the PR Server used, will make version go backward?

since the recipe is not upgraded base PR should remains same for
upgradability reasons.

