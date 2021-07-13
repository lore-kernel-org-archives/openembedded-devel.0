Received: from outbound.soverin.net (outbound.soverin.net [116.202.126.228])
 by mx.groups.io with SMTP id smtpd.web12.2643.1626173206480508297
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jul 2021 03:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@embed.me.uk header.s=soverin header.b=ip+tbiMk;
 spf=pass (domain: embed.me.uk, ip: 116.202.126.228, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 37138FD;
	Tue, 13 Jul 2021 10:46:34 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embed.me.uk;
	s=soverin; t=1626173193;
	bh=gyMFObRqSYqL2WWZmO9sYlh5g/cMGQhdh6jPpEsAp88=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=ip+tbiMk1+A/UeOmgz5SC9SacRI+oAq9yKlfEzZx59Ra+EnGg73gAMwJ9ODw+NKOl
	 SiceouaiUq94YerQ+WpfZO2A4N3Ze8dGn8+odXZ8hE15georR4t1ShfLX7Q/AQTeD+
	 CqbQGcTCo2yrrORglGrnEuLlTiNT/AMkP2nsDKXo/eLaRehjFEpWOdykxLiOtv3sxo
	 GVGpG5ytGlFCFJPm7tAX7piNROmrYLkMDIsDk59Cu/MN2kj62uYnUXMtgxhTioYh+X
	 +M8iF+uM0GpciczrnKxYfcEZNpNIlehrLhF606RpUu/a4gB82cCPE2QBRY92+nkGHn
	 PG8y2EbIEQ9kw==
Subject: Re: [oe] Upstream scipy recipe to meta-openembedded
To: zboszor@pr.hu, Khem Raj <raj.khem@gmail.com>,
 Gregory Anders <greg@gpanders.com>, openembedded-devel@lists.openembedded.org
References: <YOxdaI1jQgdxKTQn@gpanders.com>
 <59d33c0b-fbf0-593c-a259-be23aac0de6a@gmail.com>
 <be74a5ac-d9d9-8efa-434b-504bc7663c19@pr.hu>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <e025ca46-c030-978f-3ec0-499df2ba14a6@embed.me.uk>
Date: Tue, 13 Jul 2021 11:46:28 +0100
MIME-Version: 1.0
In-Reply-To: <be74a5ac-d9d9-8efa-434b-504bc7663c19@pr.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable

On 13/07/2021 11:20, Zoltan Boszormenyi via lists.openembedded.org wrote:
> 2021. 07. 12. 18:01 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
>>
>>
>> On 7/12/21 8:19 AM, Gregory Anders wrote:
>>> Hello all,
>>>
>>> I wrote and maintain a recipe to provide scipy in the OpenEmbedded
>>> build system [1]. I would like to upstream this recipe into
>>> meta-python so that it is more broadly available to those who need it
>>> as well as to reduce my own maintenance burden.
>>>
>>> Before sending a patch, however, I'd like to solicit feedback from
>>> the meta-oe community on how best to integrate this recipe into the
>>> meta-openembedded project. If you look at the source for the recipe
>>> at [1] you will see that there are a few steps/hacks that need to be
>>> done in order to get scipy to correctly cross-compile:
>>>
>>> 1. We have to add a CMake parameter to lapack ("-DCBLAS=3DON"). This
>>> causes LAPACK to build the C BLAS library instead of the Fortran BLAS
>>> library. This is necessary as scipy tries to link against `cblas_*`
>>> functions.
>=20
> FYI, there's another layer
> (https://github.com/tuxable-ltd/meta-scikit-learn that
> I had to fork and make hardknott-compatible) that uses python3-scipy as
> a build
> and runtime dependency for python3-scikit-learn so import
> sklearn.linear_model"
> is possible. That layer also extends python3-scipy with a native build
> variant
> which doesn't exist in your layer AND patches lapack further to use
> openblas.

Yes, that would be my layer. I had never intended to upstream the
scikit-learn portions as I don't believe it is maintainable in a generic
layer due to the niche use-cases and awkwardness of the build system
itself and it's dependencies, in addition to the very large build time
which would put strain on auto-builders.

What I had intended to do though, which I haven't got round to yet is
try to provide a virtual provider for blas/cblas in meta-oe which would
allow openblas to be properly upstreamed and then packageconfigs and
preferred versions used for selection as distro policy.

--=20
Jack Mitchell, Consultant
https://www.tuxable.co.uk

>=20
>>> 2. We have to patch numpy to force it not to include rpaths in the
>>> compiled shared object file. Otherwise the bitbake QA fails as it
>>> detects rpaths from the build system.
>>> 3. Two variables must be set in either the local.conf or distro.conf
>>> file to enable Fortran support. These can't be added in the scipy
>>> recipe directly (at least, last time I tried it they couldn't be) so
>>> users have to manually add these themselves.
>>>
>>> I am by no means an expert in bitbake or in the broader OE build
>>> environment. If you know of a better solution to any of the problems
>>> outlined above, please share them. I am also more than happy to
>>> provide more detail if anyone has any questions.
>>>
>>> Ultimately, the ideal goal is to have a single 'python3_scipy.bb'
>>> recipe file that I can send as a patch for inclusion in the
>>> meta-python layer rather than maintaining an entirely separate
>>> meta-scipy layer.
>>>
>>
>> I think meta-python is right layer for this.
>>
>>> Thanks!
>>>
>>> Greg
>>>
>>> [1]: https://github.com/gpanders/meta-scipy
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>=20
>=20
>=20
>=20
>=20
