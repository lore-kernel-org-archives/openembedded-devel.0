Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 12A6D744F9
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 20:39:56 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d50so7016679qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 13:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=XZ4NIziCK22LKhMjNuA44WaK9THw7OJSMl43Gkv+xFk=;
	b=uNqgNfM9d1BQsPQCwiBp2uga06dOIKhGKuJE+tQNVvD75j2WyufkQFx/2VuTpwBYyV
	I3t1KlaPRMqfgvGsDmFe68CxHMTkwhdiA0e8SnlQFlO9df+gtK+zcnCueSMvn0aY/huL
	2VetkmzcUY83kijC8hbBjXc27Tk/PnefjoAhm6xT9mRQ5DoVJjv+Hh3jLsLOiQd4Vw5/
	XXCgSprtTOJqNfTvhHhT334MRwDVC0T5yJAxSy5uaNf+9Wrombsf43SGTXR6AntuXhRZ
	e1/SsP5TSxqgGrTWGc59g+KONpkj53EPKkKrMDW3wlZQuHnEvE/MeSJR8UQJUclWxSiA
	AOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=XZ4NIziCK22LKhMjNuA44WaK9THw7OJSMl43Gkv+xFk=;
	b=qNr5EJx53jcHLWHwnQW4JaJwh6NhUQmWXQ8qzU24ETxWTfAp1oidRYdt+rOw6GZVPi
	P6fpirUe2Wsm86SViryQF/bsFtGKgHlHmU6kxcaCJHiwOYB8Xq+so87MEbGEELQShz/H
	qR86MjY5ZflZfIexGlfzRtfpDOF5Z2hIs1mHmoy7UO/1hNpx3HwesFrQRK8mOqRv01pY
	6pn/j4GkGMJJS3fVrgLfM6CpHU4js3SdqJd278jRCX+Z/KoTvhnBF2MLjsfwbwz6UCr9
	4NvfF9pg7Pzf8zyrj9kobaMa/LTZY77KnJkagX4zML2CTM2trbdQ1FqEpDxVIONn4rL/
	rsew==
X-Gm-Message-State: ALQs6tDn0LYrZHRaqBd8p76qLL0sHwnH7CHy4S4dpBFJE/cDXNjQGbs0
	0EvnOzMGlkS8Phwkd+plgRCSZQ==
X-Google-Smtp-Source: AIpwx4+qzLuOtjDITmDWGCaWZYeSeMxkbVNqfSQRXZRXXwqw8xbvHN9uDp3u91QKyiM0kyW19+Tn8Q==
X-Received: by 10.200.67.78 with SMTP id a14mr48687009qtn.18.1523219997483;
	Sun, 08 Apr 2018 13:39:57 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:6097:a43d:5d02:3a1c?
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	l126sm11225960qkb.85.2018.04.08.13.39.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Apr 2018 13:39:56 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
	<20180319155951.GW4418@bill-the-cat.ec.rr.com>
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
Message-ID: <7699bd0f-bcf3-ffb1-6973-f7cf5835d7ec@gmail.com>
Date: Sun, 8 Apr 2018 13:39:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180319155951.GW4418@bill-the-cat.ec.rr.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Sun, 08 Apr 2018 20:39:57 -0000
X-Groupsio-MsgNum: 71720
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="uFNdl09u5CNFG5qgCsS24aobDrHMhfwzY"

--uFNdl09u5CNFG5qgCsS24aobDrHMhfwzY
Content-Type: multipart/mixed; boundary="UusN2Y30xuJzIH5kr4J8wwxYIu9lAbijR";
 protected-headers="v1"
From: akuster808 <akuster808@gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-ID: <7699bd0f-bcf3-ffb1-6973-f7cf5835d7ec@gmail.com>
Subject: Re: [oe] meta-openembedded Layers
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
 <20180319155951.GW4418@bill-the-cat.ec.rr.com>
In-Reply-To: <20180319155951.GW4418@bill-the-cat.ec.rr.com>

--UusN2Y30xuJzIH5kr4J8wwxYIu9lAbijR
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 03/19/2018 08:59 AM, Tom Rini wrote:
> On Sun, Mar 18, 2018 at 02:32:15PM -0700, akuster808 wrote:
>> Hello all,
>>
>> I have been reviewing the meta-openembedded sub-layers and I plan on
>> taking the following actions:
>>
>> Please keep your comments focused on the 3 items below.
>>
>>
>> 1) I plan on resetting the sub-layer maintainers. Several maintainers
>> listed have been inactive.=A0
>>
>> If a currently listed maintainer is interested in continuing, please
>> send me an email.=A0 I plan on removing in-active maintainers in 12 da=
ys (
>> March 30th).
Patches going out today.

>>
>>
>> 2) I plan removing meta-filesystem and moving recipes to other layers.=

Based on Martin's response, I keep meta-filesystem around one more releas=
e.
>>
>>
>> 3)=A0 Meta-gnome, I have heard feed back regarding this layer. Does it=

>> make sense to remove it and push needed recipes out to=A0 other layers=
? =A0=A0
>>
>>
>> I want to get any restructuring done prior to sumo release to lessen
>> impact on the Sumo maintainer.
> I would suggest that for sumo, any layers that do get moved /
> re-distributed / whatever, a "dummy" version be kept in place that says=

> where it moved to (or where recipes were migrated to, or whatever is
> appropriate) and then they can be dropped in master.
>
For meta-gnome I decided to BLACKLIST all remaining recipes with planes
to remove them for Thud.=A0 This follows the current blacklist policy.

- Armin


--UusN2Y30xuJzIH5kr4J8wwxYIu9lAbijR--

--uFNdl09u5CNFG5qgCsS24aobDrHMhfwzY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJayn4bAAoJEO6LtJn0Vuf5qYoP+wSbwFvfRs05cf8wbn0cPv+K
Q+mmxOvC2FG/atgyv+tQmdleIIJ4inojCPuDRxPmHsDdAbcKm4dLLydaM+om7Oz1
cnT9AU+UQ9CFxz1nQSAbtIIIevogz5XV7d+ax2Sefj/0hEWeVL5RzvsQU4t2oDmg
mw6GYfstxjQgmkbjvMGsrN8TS4ICbWPo5bAQdglb1XaDn6W92F2WWyTYO+PjNnva
Z7RX3iV0SOfyu41bxfawEc43beTvfm+iljrivZzWMTlKHt2O6iL3VGeOV3JQT9/h
SQMqwesuABmiIWDh5Me+YNafS9KWjVnRpwoVWMKbhScXyJt3qN5znmQOwqDb28ar
pmYDo6JR6nudzqzIICsOK22gK16vUktGWAgI8zkwqc5iVWA7EUywL9FIJo/b3ZV8
6kibsx2VMkqzeiF16mpURdBVWU10DLvHoORaJe18L2v8bwD0/7mWKPlNOOac7ycu
ztzztj+PBnjoyzqfKq6sXnAzNigE/c75h6i1serMfEQkgUFiJ2/zO98oJ6el92ds
2by0t4Abc4m3E7QtCaR21+HGpKz4kqDOZ04UuYR7i2tieJVplZgLEN76+a7cKqVx
49SNmGB2Z8JtvVIxreaEEr7Cbb8zguFlphauFBj/bv4Fzdq2mBPCs0N9gTPl7ucI
iVCvNR2Bf955zGLF1u9j
=jWHD
-----END PGP SIGNATURE-----

--uFNdl09u5CNFG5qgCsS24aobDrHMhfwzY--
