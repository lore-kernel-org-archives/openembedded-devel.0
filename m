Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 187A877ABF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 20:47:28 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 79so23979506pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 13:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=l4Ut061SA4rbjxUgzgAtSrw9MXUZFYGldbpDFBqGqv0=;
	b=OBNT+YXuJbaZx65yMU0HCfCriYIfgjSI1Yv/X6AvojXtm24VdsK8RcJN5Min2YPA0M
	8Md1wgU9cdSerb5iXP4ydN6jRFXZ0AmfcdFKDlYf8pvlo7l/pXp7H8NQvX5rX6oqNM6N
	kx1ioa3YxTOqshICcc7UtE7nVEV31GsrkRQHS7rd86wyqoxKn+7VIZGu/f+xcLBcRJPx
	mvL8RId9d9rDH19Lrkl5RCseBtmlpIyTTiFvUrZXHKocIHcqnIJEUj+Gtx3K6edHo3OU
	DwgQdPHU9PhI4sPYkRXPkFQZ/LIsjM+S+ZfZzzGiJedPHyCytlcMq7t0nSaACfOpnXaP
	aqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=l4Ut061SA4rbjxUgzgAtSrw9MXUZFYGldbpDFBqGqv0=;
	b=PAeQ50L26RhtVD4hhjb8HZIadKSu4yQZgUlSagEcdS2Ufh7Jejmy49uW87sMSjS9r3
	sOdV/psoyXiN0WhLYilDH50BlPzpByl4ZSzUmVPjp8lC83KzDGOQNxcIHpfzuvWFcjV6
	mVEz4hWmprGTt4h5MBqyl4xShpoWVEBzEo8Xd0/6p3vERwqdYVk/qMp9JqP5X00vpDJ9
	FXMMci6wvUNtFE4w/yfZoy29wvQyxZAtK7y74kxcZt0FcSH68iQrLy2ZrCjtWlm3x4IX
	x2IHDtRVhLcLmCUHsV0g0wKSrup5cF1z0FxJp1fNiUteWMofUw+QPIlCu8AYu+MK2JBr
	kzHA==
X-Gm-Message-State: AFeK/H0WkquzGaW+Rtt8nYvnlvOkuF0AYJgjX9F1PRye27CNFiGnJ6Xo7XVmRuPqfoEIDA==
X-Received: by 10.84.225.18 with SMTP id t18mr24820566plj.14.1490734050029;
	Tue, 28 Mar 2017 13:47:30 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:647:4c00:23ec:1153:8bec:b665:1636])
	by smtp.gmail.com with ESMTPSA id
	y5sm9059529pgh.36.2017.03.28.13.47.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 13:47:28 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>, Martin Kelly <martin@xevo.com>
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
	<CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
Date: Tue, 28 Mar 2017 13:47:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gtest: add -fPIC
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
X-List-Received-Date: Tue, 28 Mar 2017 20:47:29 -0000
X-Groupsio-MsgNum: 65938
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="XVxRMjmELDbGUeKCveapjnpQQOxs6GpT9"

--XVxRMjmELDbGUeKCveapjnpQQOxs6GpT9
Content-Type: multipart/mixed; boundary="1JwSdWPiUuUDWjTMXA4rprojDbBeOg1LP";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>, Martin Kelly <martin@xevo.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <1649ceb2-fd84-33cd-d619-b9b4e64abb0f@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gtest: add -fPIC
References: <1490729609-25245-1-git-send-email-martin@xevo.com>
 <CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>
In-Reply-To: <CAJ86T=UiAqfpiHBo5hif2kd_=2Vag1KkaUJGsT=eXd3dTR22Cw@mail.gmail.com>

--1JwSdWPiUuUDWjTMXA4rprojDbBeOg1LP
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/28/17 1:37 PM, Andre McCurdy wrote:
> On Tue, Mar 28, 2017 at 12:33 PM, Martin Kelly <martin@xevo.com> wrote:=

>> From: Martin Kelly <mkelly@xevo.com>
>>
>> I tried turning on the Yocto security flags and hit a compilation
>> error due to gtest not compiling. Adding -fPIC fixes the issue.
>=20
> Since gtest only creates static libraries, compiling everything with
> -fPIC might not be the correct solution.

it still is going to be linked with a PIE binary then it should be PIC

>=20
> Does adding:
>=20
>   SECURITY_CFLAGS_pn-gtest =3D "${SECURITY_NO_PIE_CFLAGS}"
>=20
> to meta-oe/conf/distro/include/meta_oe_security_flags.inc help? If so,
> that might be the better approach.
>=20
>> Signed-off-by: Martin Kelly <mkelly@xevo.com>
>> ---
>>  meta-oe/recipes-test/gtest/gtest_1.8.0.bb | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb b/meta-oe/recip=
es-test/gtest/gtest_1.8.0.bb
>> index 483dc1f..9ba4ee4 100644
>> --- a/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
>> +++ b/meta-oe/recipes-test/gtest/gtest_1.8.0.bb
>> @@ -19,6 +19,15 @@ S =3D "${WORKDIR}/googletest-release-${PV}"
>>
>>  inherit cmake
>>
>> +# -fPIC is needed to prevent relocation errors when we compile with Y=
octo
>> +# security flags. See this issue for more details:
>> +#
>> +# https://github.com/google/googletest/issues/854
>> +#
>> +# If that issue is fixed, we can probably remove the manual -fPIC fla=
gs here.
>> +OECMAKE_C_FLAGS +=3D " -fPIC"
>> +OECMAKE_CXX_FLAGS +=3D " -fPIC"
>=20
> No leading space is required with +=3D
>=20
>> +
>>  ALLOW_EMPTY_${PN} =3D "1"
>>  ALLOW_EMPTY_${PN}-dbg =3D "1"
>>
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--1JwSdWPiUuUDWjTMXA4rprojDbBeOg1LP--

--XVxRMjmELDbGUeKCveapjnpQQOxs6GpT9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljay98ACgkQuwUzVZGdMxS9MACfb/4mrFZ4f0ZgqJpYcmujKSxe
+9gAn2ZQkmZ3sLMvw133DPFk1M9oHbr+
=aCdw
-----END PGP SIGNATURE-----

--XVxRMjmELDbGUeKCveapjnpQQOxs6GpT9--
