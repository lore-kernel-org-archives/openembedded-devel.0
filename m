Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id B545B6D2E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 19:53:50 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id a14so16101611plm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dy/i2Jtll1KhSuwdqjdKg/HkVwWnSCosWBHy2szypns=;
	b=vI5/k59+6a2rcfjQOiL78ydaMTJZowRFQYOf7MMR7hQIk8Kwwemt8Q/TCtz0TkF0t1
	znyy7BbDUYUuz19p8FhkcmtkqMlc65pD1PshrsrO6CPrpBBFAAceOTNDl0co4fnuLyiG
	r0FkBLfS1HTlLqO9eHWi0lW32FVqxNVrqx6yRa9PkEKBm+Izv1lcqjBIv7jK2r9j+3NX
	OiKC/5JEKBlZwiwWm5hn2AxiyQNwBJ7kfGRD/2Ru3XwkIijji86hOtg8XS3QfF5dNnnl
	IlXH1bccbheoye6r8bMK/FqzcDKoBspaTU+U49+0qV96cR0GefdyRZz590ZhoaxlZkZz
	FdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=dy/i2Jtll1KhSuwdqjdKg/HkVwWnSCosWBHy2szypns=;
	b=WwmMzxpyK0mpz9S5Fy8S2mxH5i7j6ekiunkjRVlBFxAYFByNFRrxel/fgBJOimfihV
	PVD4Uwki0wlNDL7f1b1zWcrq9n0dnx3iKRFaDCti7Z8PexaXQaQ8LBr51OjzrKR4LFeJ
	Mx/HgZkwwL8/DYUsjPYfekayAaOG5OJmqDZNnvsq90R1S+5QhRPMahVT4TQtU3IC+6TT
	qWcDi7NDt37ITIvBxkys+kFPIHS/GVJK5lue84h8rOnenkf261XnfjgJG8Mg4j73jcyO
	ue3zhZqUgdbEzQmf5a2oKnEEuG3CwGsypLA8MIlpmS3unUorKkv1jsM7QAl6pciHO5JH
	u7Bw==
X-Gm-Message-State: AA+aEWbTuyjZasA488flHfzews0Pg2ftVnsbZHP0sVHD2GZX7bFpd70R
	OkwvLtRJvWMqSoTKjTQ4b5jf9Lu6
X-Google-Smtp-Source: AFSGD/UoDojvXH5D6UhEO/hha03UAyp41LR6YobiCDS3qXi1+RsB/Tg+ScwA2hiefThPUBnQ3e9ogg==
X-Received: by 2002:a17:902:1e9:: with SMTP id
	b96mr33985459plb.150.1543348431414; 
	Tue, 27 Nov 2018 11:53:51 -0800 (PST)
Received: from [192.168.0.33] (174-24-96-92.clsp.qwest.net. [174.24.96.92])
	by smtp.gmail.com with ESMTPSA id
	h7sm6552239pfa.105.2018.11.27.11.53.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 11:53:50 -0800 (PST)
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1542696483-278773-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQfK8BxE=7yh9CtbeOk5rO-Tg1siLePbfZ8C3Vh+_fk42Q@mail.gmail.com>
	<CAMKF1spT8MKNMMDy1L-t4WdkNYg3Ouvbk_bj+Um=0DKqNenK-Q@mail.gmail.com>
	<CA+chaQeD+MHPAnK646z0kbT6GzQ7-fBoG_4YPfx6Hp=VJg9WwA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
	Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
	mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
	aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
	mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
	C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
	Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
	7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
	dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
	FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
	IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
	FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
	vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
	ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
	IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
	g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
	rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
	FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
	wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
	t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
	aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
	oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
	Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
	37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
	0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
	IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
	0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
	0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
	ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
	UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
	Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
	AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
	mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
	ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
	vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
	JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
	EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
	dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
	/mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
	PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
	ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
	8CS2NxU=
Message-ID: <3c4b464d-b2f5-2f48-b48a-e84ad66f7940@gmail.com>
Date: Tue, 27 Nov 2018 12:53:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQeD+MHPAnK646z0kbT6GzQ7-fBoG_4YPfx6Hp=VJg9WwA@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] geoip: add downloadfilename for geoip database files
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
X-List-Received-Date: Tue, 27 Nov 2018 19:53:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I am seeing failures on some of the stable branches.

The sources change every Tuesday of the month so we will be chasing this
monthly on top of these other dl issues.

- armin


On 11/27/18 12:14 PM, Martin Jansa wrote:
> I'm seeing different checksum than both your builder and the recipe.
>
> $ wget http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.g=
z
> --2018-11-27 20:06:32--
> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz
> Resolving geolite.maxmind.com... 104.16.37.47, 104.16.38.47,
> 2606:4700::6810:252f, ...
> Connecting to geolite.maxmind.com|104.16.37.47|:80... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 1209046 (1.2M) [application/octet-stream]
> Saving to: =E2=80=98GeoIPv6.dat.gz=E2=80=99
>
> 2018-11-27 20:06:32 (10.3 MB/s) - =E2=80=98GeoIPv6.dat.gz=E2=80=99 save=
d [1209046/1209046]
>
> $ md5sum GeoIPv6.dat.gz
> d98a04eded0b08b945b5629106d58760  GeoIPv6.dat.gz
>
> Is this the legacy archive? Because
> https://dev.maxmind.com/geoip/legacy/geolite/ now shows following:
>
> Updated versions of the GeoLite Legacy databases are now only available=
 to
> redistribution license customers, although anyone can continue to downl=
oad
> the March 2018 GeoLite Legacy builds. Starting January 2, 2019, the las=
t
> build will be removed from our website. GeoLite Legacy database users w=
ill
> need to switch to the GeoLite2 or commercial GeoIP databases and update=

> their integrations by January 2, 2019.
>
> For more information, please visit our Support Center.
>
> Note: After careful consideration, taking into account customer feedbac=
k,
> we have decided against removing latitude and longitude coordinates fro=
m
> the GeoLite2 databases. We are in the process of reviewing coordinates =
used
> in all of our GeoLite2 and GeoIP databases to ensure there is no risk o=
f
> misuse.
>
> * GeoLite2 databases are free IP geolocation databases comparable to, b=
ut
> less accurate than, MaxMind=E2=80=99s GeoIP2 databases. Please remember=
 to use the
> accuracy radius if displaying coordinates on a map.
>
> New Database Format Available: This page is for our GeoLite Legacy
> databases. For our latest database format, please visit our GeoLite2
> Databases page. We offer redistribution licenses for our newer GeoLite2=

> databases that will allow you to package the databases with your commer=
cial
> products. For more information, please visit the GeoLite2 Commercial
> Redistribution page.
>
>
> On Tue, Nov 27, 2018 at 8:04 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> I am seeing errors on some builders
>>
>> http://errors.yoctoproject.org/Errors/Details/202341/
>> On Mon, Nov 19, 2018 at 11:29 PM Martin Jansa <martin.jansa@gmail.com>=

>> wrote:
>>> Looks, good.
>>>
>>> Adding variable for 20181120 might help with maintenance (if we need =
to
>>> change just checksums in future). And with good variable name (or a
>>> comment) it would also document in the recipe why we're using this in=

>>> downloadfilename.
>>>
>>> On Tue, Nov 20, 2018 at 7:48 AM <changqing.li@windriver.com> wrote:
>>>
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> previous change of checksum don't trigger archive to re-downloaded,
>>>> , which will cause checksum mismatch. add downloadfilename to
>>>> trigger re-download.
>>>>
>>>> 1. for user with PREMIRROR, another benefit is it can still compile
>>>> success event upstream checksum change frequently.
>>>> 2. but for user don't use PREMIRROR, if upstream checksum changed,
>>>> still might have checksum mismatch problem.
>>>>
>>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>>> ---
>>>>  .../recipes-support/geoip/geoip_1.6.12.bb          | 24
>>>> +++++++++++-----------
>>>>  1 file changed, 12 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>> b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>> index 1e1a7ff..57f0b67 100644
>>>> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>>>> @@ -9,10 +9,10 @@ HOMEPAGE =3D "http://dev.maxmind.com/geoip/"
>>>>  SECTION =3D "libdevel"
>>>>
>>>>  SRC_URI =3D "git://github.com/maxmind/geoip-api-c.git \
>>>> -
>>>>
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoI=
P.dat.gz;apply=3Dno;name=3DGeoIP-dat
>>>> \
>>>> -
>>>>
>> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;appl=
y=3Dno;name=3DGeoIPv6-dat
>>>> \
>>>> -
>>>>
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;=
apply=3Dno;name=3DGeoLiteCity-dat
>>>> \
>>>> -
>>>>
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/=
GeoLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat
>>>> \
>>>> +
>>>>
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoI=
P.dat.gz;apply=3Dno;name=3DGeoIP-dat;downloadfilename=3DGeoIP.dat.2018112=
0.gz
>>>> \
>>>> +
>>>>
>> http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;appl=
y=3Dno;name=3DGeoIPv6-dat;downloadfilename=3DGeoIPv6.dat.20181120.gz
>>>> \
>>>> +
>>>>
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz;=
apply=3Dno;name=3DGeoLiteCity-dat;downloadfilename=3DGeoLiteCity.dat.2018=
1120.gz
>>>> \
>>>> +
>>>>
>> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/=
GeoLiteCityv6.dat.gz;apply=3Dno;name=3DGeoLiteCityv6-dat;downloadfilename=
=3DGeoLiteCityv6.dat.20181120.gz
>>>> \
>>>>             file://run-ptest \
>>>>  "
>>>>  SRCREV =3D "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>>>> @@ -20,14 +20,14 @@ SRCREV =3D "4b526e7331ca1d692b74a0509ddcc725622e=
d31a"
>>>>  SRC_URI[GeoIP-dat.md5sum] =3D "d538e57ad9268fdc7955c6cf9a37c4a9"
>>>>  SRC_URI[GeoIP-dat.sha256sum] =3D
>>>> "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>>>>
>>>> -SRC_URI[GeoIPv6-dat.md5sum] =3D "00dc3b3f53eb5f7bf6915f939998f12c"
>>>> -SRC_URI[GeoIPv6-dat.sha256sum] =3D
>>>> "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
>>>> +SRC_URI[GeoIPv6-dat.md5sum] =3D "a908d7a51c3883eb8f693ca197c7a142"
>>>> +SRC_URI[GeoIPv6-dat.sha256sum] =3D
>>>> "1b06e34eed2c539606a9ab4d97b2140ac80bf9f528d16ad2e3831c75014c2710"
>>>>
>>>>  SRC_URI[GeoLiteCity-dat.md5sum] =3D "d700c137232f8e077ac8db8577f699=
d9"
>>>>  SRC_URI[GeoLiteCity-dat.sha256sum] =3D
>>>> "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>>>>
>>>> -SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "7f6333d433d8127181ea3c582828=
7c98"
>>>> -SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
>>>> "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
>>>> +SRC_URI[GeoLiteCityv6-dat.md5sum] =3D "8ac3506ccabaae7e9f7d6301c265=
4313"
>>>> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =3D
>>>> "1c5fced1657d09448b3ecc14b65c9536228a627d93ed4159d3438b2c6faa8506"
>>>>
>>>>  LICENSE =3D "LGPL-2.1"
>>>>
>>>> @@ -44,10 +44,10 @@ EXTRA_OECONF =3D "--disable-static              =
 \
>>>>  do_install() {
>>>>      make DESTDIR=3D${D} install
>>>>      install -d ${D}/${datadir}/GeoIP
>>>> -    install ${WORKDIR}/GeoIP.dat ${D}/${datadir}/GeoIP/
>>>> -    install ${WORKDIR}/GeoIPv6.dat ${D}/${datadir}/GeoIP/
>>>> -    install ${WORKDIR}/GeoLiteCity.dat ${D}/${datadir}/GeoIP/
>>>> -    install ${WORKDIR}/GeoLiteCityv6.dat ${D}/${datadir}/GeoIP/
>>>> +    install ${WORKDIR}/GeoIP.dat.20181120
>> ${D}/${datadir}/GeoIP/GeoIP.dat
>>>> +    install ${WORKDIR}/GeoIPv6.dat.20181120
>>>> ${D}/${datadir}/GeoIP/GeoIPv6.dat
>>>> +    install ${WORKDIR}/GeoLiteCity.dat.20181120
>>>> ${D}/${datadir}/GeoIP/GeoLiteCity.dat
>>>> +    install ${WORKDIR}/GeoLiteCityv6.dat.20181120
>>>> ${D}/${datadir}/GeoIP/GeoLiteCityv6.dat
>>>>      ln -s GeoLiteCity.dat ${D}${datadir}/GeoIP/GeoIPCity.dat
>>>>  }
>>>>
>>>> --
>>>> 2.7.4
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



