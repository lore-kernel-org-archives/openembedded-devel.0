Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 843A96010D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:41:29 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id i32so20867288uai.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=hy5Jb9yj1zvMyySMuU4DfQVB/h2vKCb+8spIn5QMDQw=;
	b=bHKEG/5goGwjxnuolba8u7rW/MKg2X9LQK3IBRAGnqPPP6o4A/v9TEvdOnH5oWW0qU
	Mxedh8OHP+ejNokYHlKvdCk2G7zoaZnL0TSU6Jjh4zg/TsjxbjjoYgQ7v7gfhyu4uAcy
	4YGZ87VOBOushn3GNsYRKx+IQw60nUC3X7g1kji4skqjUgmEhMUWGeVBGTbXfl8pDb7u
	Mh2ZS8bKve6xYE1SZ7bO9iGqC/WW3oD82EAU75OnIR7B6z+WdAlInxPhwl26BSb7dxL3
	dnlzvv28h0AqO+gELqLDgOHQtebjJmgVYb8bsjbKF09H3gn4IXqBrXhT8kr3i5odHc7t
	k2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=hy5Jb9yj1zvMyySMuU4DfQVB/h2vKCb+8spIn5QMDQw=;
	b=VIFCYQN6yoejJpW46wiKWvAPyyGhU4i2jja6GzqpGjA/BfrwLeAyiQGPg2MaGH+JRD
	0tzLRE65wjvKCKJDtrBM1Dy3ouIRFy93Z7RACvBWCEYYr3UocsqeDv7a+NLm2Xd8W81F
	jb8UdfESOMjAsEvPMhb34kOxg6Z7Iuf1Dc5uPmN3LESXU211nKqRSgXrnS3qQr0Um+Gy
	HWSUvaEFQex73SUQRl9U4TJvhuEa5shgLecMNT9zlxLjw+iLQsHfxWSZoWwHt+5VQI5w
	bYSYOq1v8qO69tndMPglPTH0ATnj1PuEps1ZvmDqurNIRrDvdTFJwDxftiOgZ1/hOtva
	ZOkg==
X-Gm-Message-State: AE9vXwM9pFDKP1WdoaLXZNayEMA1VvZ58DWujZrvZbXCEW1PrdTb2V/8Nv8ORD8kHjfML7QaKjwsxFXzMOOxaQ==
X-Received: by 10.159.37.238 with SMTP id 101mr1442596uaf.57.1472546489678;
	Tue, 30 Aug 2016 01:41:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Tue, 30 Aug 2016 01:41:29 -0700 (PDT)
In-Reply-To: <1472546366.8449.19.camel@andred.net>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
	<1472546366.8449.19.camel@andred.net>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 30 Aug 2016 10:41:29 +0200
Message-ID: <CALbNGRSJx4MD=SekttxB7H1PjEUTgaQfCnBtXu+t-YGX9BKVLw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] geany-plugins: include GPLv3 in the main LICENSE
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
X-List-Received-Date: Tue, 30 Aug 2016 08:41:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2016 at 10:39 AM, Andr=C3=A9 Draszik <git@andred.net> wrote=
:
> On Mo, 2016-08-29 at 22:52 +0200, Martin Jansa wrote:
>> * since last changes in oe-core LICENSE variable needs to list all
>> licenses used
>>   by individual packages otherwise bitbake warning like this is shown:
>>   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-
>> plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses (GPLv=
3)
>> that are not listed in LICENSE
>>   as possible improvement you can set LICENSE to GPLv2 to all plugins
>>   which are GPLv2-only, because now they will "inherit" both GPLv2 &
>>   GPLv3 which sucks as described here:
>>   https://www.mail-archive.com/openembedded-core@lists.openembedded.org/=
ms
>> g81645.html
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/meta=
-
>> oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> index 9a39150..5e1e721 100644
>> --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> @@ -1,7 +1,7 @@
>>  DESCRIPTION =3D "A fast and lightweight IDE"
>>  HOMEPAGE =3D "http://plugins.geany.org/"
>>  # majority's default
>
>      ^^^^^^^^^^
> To avoid confusion, it'd be good to remove this comment as well as it's n=
ot
> only the majority of licenses anymore
>
> Cheers,
> Andre'
>
>
>> -LICENSE =3D "GPLv2"
>> +LICENSE =3D "GPLv2 & GPLv3"
>>
>>  DEPENDS =3D "geany lua libxml2 libsoup-2.4 vte enchant intltool-native
>> libassuan gpgme"
>>
>> --
>> 2.9.2
>>
And probably a note that 90% of license information is wrong...

Andreas

