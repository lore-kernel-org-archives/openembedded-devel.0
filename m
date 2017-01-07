Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 679C471A5E
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jan 2017 02:35:21 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t79so53120916wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2017 18:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:content-transfer-encoding:mime-version:subject:date:references
	:to:in-reply-to:message-id;
	bh=14cNMA9vy86mRIwZz5Je4UQge16L9hFLfviWc34U5xo=;
	b=tpWEBiF0ETO17lyqAqnmqWkxLRhYV2ugDcpzZbpjsbqft2xYFQ0K7ioDUo7vp9qubO
	YY6YJ6xDjapTgvF7JQWEgkLho6z0/d5wwp0yhPkTuq3R7kK3x7xXdB92q1ixapUw+gvj
	QcFFnjZa/BpqPPFGNz7hzfKM0FcMir/88OlUyo9gre+j4HI1dBxEYpvYLH68ng+4jIE3
	yK5TqfYzxUkQ3eizAu3ozArwiKuUKHD1iYfHfwWIuJUMXSWRAGUdj8stqJjF+VODiOof
	7Rtt2w9mSYNpAVaDkXP0eRWq+JRtrIqmKtIJZ9nJoj5Z6Kn8NZ7gr3Wxh8yfUdX+J/Vo
	pCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:date:references:to:in-reply-to:message-id;
	bh=14cNMA9vy86mRIwZz5Je4UQge16L9hFLfviWc34U5xo=;
	b=cO3d2gO0l5YCEM/TbXz0HGUYSYV78cKfc4XpKrSbQrk1v5n0Oow52h3/R0xRDpelcX
	15/6vPttcNBncdxqJ8O8ySPEBg5++47k7Tsmkw3ivRzctmyfpLqvjYQK5PVCPVnP499M
	TOnrhwOItEn3W0M0KcC63urqw0PDKYiO3ix05TX+fokg2pg1jBc3QriMSUFLx41y+uOo
	7ggrfo6SCJlDfHSneDQ4pp4bzRygkkKkYjnPLASzHnmPDMoSAJnT7nvUhjM+GuPhOSrw
	WbMA7He89alc4N2DdD/P9g25VmVdfXeP9qhV6Yc8UGx8kiDNGHX1RdA4jEGSYbu3gOda
	G2gA==
X-Gm-Message-State: AIkVDXJparsesCRxPt5CkhRvaQKG3LUI8rfaBKnyys2Qh79+HgCLuRj1FcAE3cIYblik4Kiz
X-Received: by 10.223.154.85 with SMTP id z79mr3351944wrb.184.1483756521315;
	Fri, 06 Jan 2017 18:35:21 -0800 (PST)
Received: from [192.168.10.201]
	(c-37f7e155.018-216-6762674.cust.bredbandsbolaget.se.
	[85.225.247.55]) by smtp.gmail.com with ESMTPSA id
	b3sm111451118wjy.40.2017.01.06.18.35.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 18:35:20 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Date: Sat, 7 Jan 2017 03:35:19 +0100
References: <1483082223-18646-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<CA+chaQf9vRvzagN=OsKYHj4U7+ZvqZCfGJeQ8mXLL9f26QovkA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CA+chaQf9vRvzagN=OsKYHj4U7+ZvqZCfGJeQ8mXLL9f26QovkA@mail.gmail.com>
Message-Id: <947668E3-C518-42C9-A676-BE34668BC8ED@pelagicore.com>
X-Mailer: Apple Mail (2.3259)
Subject: Re: [meta-networking][PATCH] lftp: update to 4.7.4
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
X-List-Received-Date: Sat, 07 Jan 2017 02:35:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Martin -

Thanks for letting me know.

It appears that old packages are removed once new version comes out. I =
found another official source which keeps old packages and will update =
SRC_URI with the following patch.

> On 5 Jan 2017, at 19:11, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> Resolving fossies.org (fossies.org)... 138.201.17.217
> Connecting to fossies.org (fossies.org)|138.201.17.217|:80... =
connected.
> HTTP request sent, awaiting response... 301 Moved Permanently
> Location: https://fossies.org/linux/misc/lftp-4.7.4.tar.bz2 =
[following]
> --2017-01-05 11:21:20--  =
https://fossies.org/linux/misc/lftp-4.7.4.tar.bz2
> Connecting to fossies.org (fossies.org)|138.201.17.217|:443... =
connected.
> HTTP request sent, awaiting response... 410 Gone
> 2017-01-05 11:21:20 ERROR 410: Gone.
>=20
>=20
>=20
> On Fri, Dec 30, 2016 at 8:17 AM, Oleksandr Kravchuk <
> oleksandr.kravchuk@pelagicore.com> wrote:
>=20
>> Upgraded package to v4.7.4 and changed source code archive format =
from
>> tar.gz to tar.bz2 which is significantly smaller in size.
>>=20
>> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
>> ---
>> .../recipes-connectivity/lftp/{lftp_4.7.3.bb =3D> lftp_4.7.4.bb}      =
| 6
>> +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>> rename meta-networking/recipes-connectivity/lftp/{lftp_4.7.3.bb =3D>
>> lftp_4.7.4.bb} (85%)
>>=20
>> diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
>> b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
>> similarity index 85%
>> rename from meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
>> rename to meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
>> index b0cd399..36fee56 100644
>> --- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.3.bb
>> +++ b/meta-networking/recipes-connectivity/lftp/lftp_4.7.4.bb
>> @@ -6,11 +6,11 @@ SECTION =3D "console/network"
>> LICENSE =3D "GPLv3"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
>>=20
>> -SRC_URI =3D "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
>> +SRC_URI =3D "http://fossies.org/linux/misc/lftp-${PV}.tar.bz2 \
>>            file://fix-gcc-6-conflicts-signbit.patch \
>>           "
>> -SRC_URI[md5sum] =3D "8eb1fe5f113126b60f172643c7f6c2e6"
>> -SRC_URI[sha256sum] =3D "ce6519831603c19c2cf2e3c10b41d6
>> ddc87a16049b99383e7b9b77fbc7707214"
>> +SRC_URI[md5sum] =3D "7b54407ab24c1e78b45fe445d83eb5fd"
>> +SRC_URI[sha256sum] =3D "95e7acfd9d0a2addeded1f00794aee
>> ac43952ebc4924043965a5e1619df29128"
>>=20
>> inherit autotools gettext pkgconfig
>>=20
>> --
>> 2.7.4
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


