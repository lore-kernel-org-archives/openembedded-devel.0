Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id E8BD86E5FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 20:20:52 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id 77so69021993pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=PTwWtndwjNjL+NXMgBtZKJhur6tRtQsSuHyDvHPxmwo=;
	b=E7J6axucmGcDrDv5NE/Lhi3FNvu7iAhnzw/OAwygBdppV07UY9b8gOKN+CUqOH7rT0
	eRRbiKaH5/qguE0d7MUvcZtkgOPvTKY6dL8C4PHa+SF07YuZHjkJEFybR+1xkLfH5VVa
	lmCfrvPooH15t4nDJvV5mF08EjhPqrPM2FA78a9ga16ZPGSa94g4jroJTf2Ed6hPbs6i
	lKnleMzNR7NH1jZhT5qczGqR0Kglh0nhN8MAJm8aAgPZ9PSaCBoWbz3QA+p7U6khFmxw
	25WlvE+1iSIz+aC18hswtUhl/+mnnGGy28k7fONAALjFrV9Ynwp+gTAIBobMEjStpYfo
	kC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=PTwWtndwjNjL+NXMgBtZKJhur6tRtQsSuHyDvHPxmwo=;
	b=RRZyodwG6iUjyyUneIv5Xq0KYewdNFznkieEWrlag/hClZi8W6a/lACY9f5b3C83j2
	Vra57E3Ohsb9laTOGTp2fcDkoJZi5mExLYZGeUPE0rDDzLGmKj1amF7MjepyZlGmk6zh
	rYUNNnHlObc65XI/DUTaRgPIv6IiI3oAEbzSg9hv2CaTZcJyE31+jEPGDblaHGO2eI2O
	VqRB6TfdCvuH85AcRS1AO8nh6kZEIubETwAgUzCHxnWhKqHgRXT+6iPs1YkW9qY3nXLs
	iW/AGbIbIW/u/8a4Te1KS3xG1OBsqpjrs4/Eo0j9pFuyfCxfNiV5s9o2eDz15mgUU+80
	jUFg==
X-Gm-Message-State: AMke39n0rk17WvOI6AGYYqRA5b/SHMbnXTpqvef5WIMPm7OfaLVt+I1basKpTlCHjeRXdA==
X-Received: by 10.84.224.197 with SMTP id k5mr50093241pln.15.1489436453498;
	Mon, 13 Mar 2017 13:20:53 -0700 (PDT)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	t189sm34220038pfb.81.2017.03.13.13.20.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 13:20:50 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <20170313032921.8669-1-kai.kang@windriver.com>
	<CA+chaQc0uNJ=k8OYDPLapV9ekap2Yv9TFA_25_U3em5ZBQF8gg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <a257b10e-8961-95ba-b18c-80468f79c2c5@gmail.com>
Date: Mon, 13 Mar 2017 13:19:28 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQc0uNJ=k8OYDPLapV9ekap2Yv9TFA_25_U3em5ZBQF8gg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Update SRC_URIs
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
X-List-Received-Date: Mon, 13 Mar 2017 20:20:53 -0000
X-Groupsio-MsgNum: 65779
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="HuvfIjMPhpXO0KI4S1hLlrhVVDJV9sM5T"

--HuvfIjMPhpXO0KI4S1hLlrhVVDJV9sM5T
Content-Type: multipart/mixed; boundary="Benr08f679s0HVDLd7SG9x4qkvaUgAaIa";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <a257b10e-8961-95ba-b18c-80468f79c2c5@gmail.com>
Subject: Re: [oe] [PATCH 0/5] Update SRC_URIs
References: <20170313032921.8669-1-kai.kang@windriver.com>
 <CA+chaQc0uNJ=k8OYDPLapV9ekap2Yv9TFA_25_U3em5ZBQF8gg@mail.gmail.com>
In-Reply-To: <CA+chaQc0uNJ=k8OYDPLapV9ekap2Yv9TFA_25_U3em5ZBQF8gg@mail.gmail.com>

--Benr08f679s0HVDLd7SG9x4qkvaUgAaIa
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/13/17 12:25 AM, Martin Jansa wrote:
> Github archives can be regenerated from time to time with different
> checksums, please use git fetcher instead.
>=20

is this still the case ? We can probably file an issue about it

> On Mon, Mar 13, 2017 at 4:29 AM, <kai.kang@windriver.com> wrote:
>=20
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Update SRC_URIs which show qa warnings when do_fetch.
>>
>> Kai Kang (5):
>>   fuse: update HOMEPAGE and SRC_URI
>>   curlpp: update HOMEPAGE and SRC_URI
>>   libdnet: update SRC_URI
>>   cherokee: update SRC_URI
>>   lmsensors: update SRC_URI and S
>>
>>  meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb          | 6 +++-=
--
>>  meta-networking/recipes-connectivity/libdnet/libdnet_1.12.bb | 8 ++++=
+---
>>  meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb       | 8 ++++=
----
>>  meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb        | 6 +++-=
--
>>  meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb     | 2 +-
>>  5 files changed, 16 insertions(+), 14 deletions(-)
>>
>> --
>> 2.10.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>


--Benr08f679s0HVDLd7SG9x4qkvaUgAaIa--

--HuvfIjMPhpXO0KI4S1hLlrhVVDJV9sM5T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljG/tYACgkQuwUzVZGdMxShVQCcD7LDonO/VfxdyGJAMSu9jApq
wEQAn3jA7aZcdANhwZfMwJ7//dtADZiA
=Eniq
-----END PGP SIGNATURE-----

--HuvfIjMPhpXO0KI4S1hLlrhVVDJV9sM5T--
