Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 660CB7C446
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 12:15:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r7so4039640wrr.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=h0YbZJj65PiNut+XNzHfqZ2GvVGXAETvA06jEZq0LqI=;
	b=yVCodAVjEWHEG0U0YQAkoAVtQfx5gjC4CHlOZrAP7Ex7E8FyPjMBbMDALjai6jTcnE
	nxkS0UHE7bSy4ClxoH+vGEbWo82U899VIpWji51XTvqeBgU1ZwTc+usdf6m5jJupYj/J
	J0edK8lRvF64xfdwDhKJPRgB8hF9C+cfXzkS60FYIHzeaE0kOLUT/6xM9/PcC3Qa06Ul
	4eFm4RH10wGThJ78VRzrXp33o+QMoyvnNgb5hweQu19zCMDog+2D10tjQOLNquyq2xV+
	pNwCY3Zh5Vf+EK9i4P/o24vnfuw/9PLCnMV5vpJ2/Pp8Tbj37PK3EiFIIPVu6LJaEYNx
	Ki5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=h0YbZJj65PiNut+XNzHfqZ2GvVGXAETvA06jEZq0LqI=;
	b=e/T1teOTkufRo7Hq1nxOQX0ADASOCg4ZJXMkiaCobLJids4bgfadmIYTcTgskC6XdQ
	rGYL9VZInMkPidTC49s5vFAuw8S95M33wlUNPDcjpkfqpSZQPDjv2xpxYos9X8I9ctj2
	sph+zIxjcWdCF6siYJydIS05VzcMK49xK2B1duGEUV+bfhl3CBv/SktTQJ8nZScftgQ9
	nHKyQHMoDKc+SGA+Hi3YDZWFKHxX4yyMFZHQv6G1vUCmLJY9yV9+t1FqH2SraXHVrHz1
	AtgXO/FoRG4t8tcd1Jn1aJUYnaZV776cLrBRC+wyWoIrzk3z6+0HlphkHx6iQvb5Xta9
	Z7rw==
X-Gm-Message-State: APjAAAXsdbXjfHPsPbycPLvBv0DPBON441Z4jYbBivrarBwXrQT/D8TX
	9AbRUTwNrAeCAZV3rnOEJReOoA==
X-Google-Smtp-Source: APXvYqzc9ObghKmdobq8kDsloZJ1tCQ/9oT+GP04QTTYVGuOlOIlxqraZLelyDgN99J67x/zLh+8cA==
X-Received: by 2002:adf:e352:: with SMTP id n18mr2351338wrj.82.1559218524912; 
	Thu, 30 May 2019 05:15:24 -0700 (PDT)
Received: from [192.168.0.101] (84-33-71-35.dyn.eolo.it. [84.33.71.35])
	by smtp.gmail.com with ESMTPSA id
	l18sm1858654wrv.38.2019.05.30.05.15.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:15:23 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
Message-Id: <F1150B1F-B591-4579-A7BC-AA5ED008C07C@linaro.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Date: Thu, 30 May 2019 14:15:21 +0200
In-Reply-To: <20190530111457.GA20599@localhost>
To: Adrian Bunk <bunk@stusta.de>
References: <20190530102539.65935-1-paolo.valente@linaro.org>
	<20190530111457.GA20599@localhost>
X-Mailer: Apple Mail (2.3445.104.8)
Cc: ulf.hansson@linaro.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] s-suite: push SRCREV to version 3.4
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
X-List-Received-Date: Thu, 30 May 2019 12:15:24 -0000
X-Groupsio-MsgNum: 77872
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BF09478D-A406-4055-9B63-48ED52C5ED59";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_BF09478D-A406-4055-9B63-48ED52C5ED59
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Il giorno 30 mag 2019, alle ore 13:14, Adrian Bunk <bunk@stusta.de> ha =
scritto:
>=20
> On Thu, May 30, 2019 at 12:25:39PM +0200, Paolo Valente wrote:
>> Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
>> ---
>> meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb =
b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>> index 706a55e11..db1945dd0 100644
>> --- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>> +++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
>> @@ -2,8 +2,8 @@ SUMMARY =3D "Small collection of benchmarks for =
storage I/O"
>> LICENSE =3D "GPLv2"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Db529aaa6a0c50f15d29f89609b5c22f3"
>>=20
>> -SRCREV =3D "262227ec9de4be1ab41d9918d32ceb773089f1dd"
>> -PV =3D "3.2+git${SRCPV}"
>> +SRCREV =3D "8d22ab8a4cc1484622c47ac9c5944fb9a61a5c0f"
>> +PV =3D "3.4+git${SRCPV}"
>> SRC_URI =3D =
"git://github.com/Algodev-github/S.git;protocol=3Dhttps;branch=3Dmaster"
>> ...
>=20
> The problem was already there before, but the upgrade gives the
> opportunity to get rid of the +git${SRCPV}, which is incorrect
> when exactly the release is packaged.
>=20

Sorry,
you pointed this out already, but then I thought I had solved it.  Now
I also understand why the previous push-up to 3.3 was not it.

And now, I'm sorry, but I think I'd better to ask for your help
explicitly: how should I fix this exactly?

Thanks for your patience,
Paolo

> cu
> Adrian
>=20
> --
>=20
>       "Is there not promise of rain?" Ling Tan asked suddenly out
>        of the darkness. There had been need of rain for many days.
>       "Only a promise," Lao Er said.
>                                       Pearl S. Buck - Dragon Seed


--Apple-Mail=_BF09478D-A406-4055-9B63-48ED52C5ED59
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEpYoduex+OneZyvO8OAkCLQGo9oMFAlzvyVkACgkQOAkCLQGo
9oMOvBAAgu9Y4CWGiqm+rNcj629Mq9ChxH2uei+2s1tgi3kRCm38KpQmuztGIzeY
Z57Gqkc0IOyAa82LpOxKjpsiIk1PXOHkVlJ6X65zWSkY+mn2/0GxB7YJrfDwcbn5
tSvv8/u8zwp+QOM/McrM/e8uyjVkT2m1+4bgfbhnsJv6QNsC4zTA0TpkU2bd9hSP
4nt4lFjAOfl5kxYQyF9T5/oINAcPOa2cwGsHxU9PkEOfFXpExsXYq/HIaMFGdlqW
yTukCbFtJcgPN4UkojnzCVDepVkqfsYSf649Oiu4K7haBJMMNKUCW/3sqLWTP2Ur
gwJamLOPiV7YcYZqyVgh9IphGVHD9qBfmNw/TNHTvAuR0c/mF96pFjh5kz0fMuiY
ngla1uV3l6Bncxi75HSV2PiT1ITuNrSwGxyb0k0CTVaAhlyf5rIyrAIXRfHBczBB
IGx9teYJscUQA4CnBowcO+Iy2x7yTNYDoUWXRls8+tTJwwyWvJZ0Hm09+8Vopegq
0GJIuS23b2QikVNJKVIUOZCwu0LrobGP/CJ5Ohe1+ef7YqAiS1gievQ+USUW7Y6i
PhaXY+TeksS1C1WOhxhSHtPi+wIuWEZyxsObg1ABnyiCDNxZq2iHi/h28By1dHGO
D4esVZm78ciw6vAHZzS2VF78XLU/Y2NML35e2BKUeuq/Qx0jIwM=
=b9iI
-----END PGP SIGNATURE-----

--Apple-Mail=_BF09478D-A406-4055-9B63-48ED52C5ED59--
