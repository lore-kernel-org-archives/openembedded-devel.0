Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF439D26289
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 18:39:48 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13638.1768934386032785567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 10:39:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j96cFbgw;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b608ffca7so8602820a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 10:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768934384; x=1769539184; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zn5aU74Bc6hmwM2qvgN2SfPCvz9W7+ZDhHz4vHIAHhw=;
        b=j96cFbgwLH52vlp9igF0oA41/tZjKfGIqHXtwSvs6IzbjWGAA2POP7QA+pq8viNv9Q
         LvbhHPJ3v++QC4PSyuEro0LVP/lf+8iSAO/BBdLm2I8FbwrINHzqgEY/VCHBLQGuIaCu
         V7Y7yOmwQ+wYrOq8WjLyBvQAlEa0x5+5DfCtU3MEpc2yMz5qeXiTZdBx7pTz5eUYGYHJ
         1Ht3fQrg76fE/L9EnYN1K6mY4/yi7Ke43uv8S3LKMlwJKqE18z+eYh5Nq8EuJZmBzseM
         GyGXT3iHPZQ1Sb4QGj0TzFcC4+7z/BUu6038yfYUoSIQ3Lp9WySWlWpwseI0N75ZM4rx
         UKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768934384; x=1769539184;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zn5aU74Bc6hmwM2qvgN2SfPCvz9W7+ZDhHz4vHIAHhw=;
        b=eT4Qe2s4dLx0GuFLuQkLowycq4MkxIx9dXSz6/hXHZIVI8HApZm7MuwoTuODdd9hdh
         9wex0/9W9BOOED4RHVoI1kUq7CB2yOwJjII9QIvhCVrcEmsAie7w6zqG+blu0J59PtVs
         T4AgWxa9Brvos857HmH6TMmwx16BW8GKDXRsFncgtSL2ghtuqEqmpziqjTciLvYK57Hi
         BSK7rypZ9AOYdPF1uOgsl2kpG6Bl2nJzlLb30FZN04E0F6tzTmmvRwqSLr6XAQTUz+FN
         zjxZqQkCbDGzm1QdzKqU98G/a1U6WiY1pTO7lxSA5HMOI6oBWvKJsTGDVu72npuH4eOM
         7JlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7HExOiEbw7QeDoQOkWvGq66Z8gO6RD0oUHheQxEe7bk2bnMQCSnEsPyFoUIJIg8wvLO9F8GGkh7joDBH8734ZokY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZLJmUHUD/wvxgKtUy5nrWMa+sHrqqIkDEWK6Dods5dZfWj7eS
	bXrbFDYXNIN2t+ePZyEEtNaXkNoI/GjM9yqqdO//nntrDC7XfyPt8LUayVQNnw==
X-Gm-Gg: AZuq6aIfSc0Rt3yagFUpRF+A7ERHpcI+D+fHzNPINuKYOD4ACEupt55x+jZJbPLABvl
	adLz/wKIzoi7EWjlIjoTlwJ6zSKZ3+txtOM/b3HjkefX/fh8G+Z+/4iZJ3HgBbDsBQvZ5HWrqvK
	rt5Fc4iOzc9L3O3WDQzkwJIBzm00NbRk11yot87aYbOMV8o8wDTXpgUABCQfnT/AHtEFxqRiZak
	V6ySZJriP3RlNnVaYvCqRbv3QNya3/V87P1MVSTbwJDGgjrqh5TLwASB5fTVTRrnCR+Rj4iu9BI
	YuXPERZKAZppJ6jk1kKnRHjFE7an/MGr3IC9EeHlOqWqlzz/iCxVQuedwkQ1PPjIos9xp6zOX9o
	o8cSyCg12FbDHLVekb9KckgVqZ8w6w1lM34Uizr+DpXcfXW/jSnOZ6FrGQxN8t6Np8b39jf56FE
	JIEn/n6Uwk2OaAKUZm6tcHJbrciy3MHhIY6WJU/iMTc6LSTs3vnRCmQQJIy/zzckT6abg=
X-Received: by 2002:a05:6402:3490:b0:641:8a92:9338 with SMTP id 4fb4d7f45d1cf-654bb32c6e7mr12370590a12.22.1768934383986;
        Tue, 20 Jan 2026 10:39:43 -0800 (PST)
Received: from localhost (x5ab8e2e2.customers.hiper-net.dk. [90.184.226.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65813383118sm199252a12.26.2026.01.20.10.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 10:39:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 19:39:42 +0100
Message-Id: <DFTMWKW1O2OQ.1JPJSQMDFL3KM@gmail.com>
From: "Frede Hoey Braendstrup" <frederikbraendstrup@gmail.com>
To: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>,
 "frederikbraendstrup@gmail.com" <frederikbraendstrup@gmail.com>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH v3] glaze: add recipe
X-Mailer: aerc 0.21.0
References: <20260119113844.289290-5-frederikbraendstrup@gmail.com>
 <20260119122944.1111081-2-frederikbraendstrup@gmail.com>
 <DB5PR02MB10213684AAECDAE76758A53A8EF89A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213684AAECDAE76758A53A8EF89A@DB5PR02MB10213.eurprd02.prod.outlook.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 18:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123677

Hi Peter

Thanks for your input!

Sorry for the noise in in sending multiple mails for the same inital recipe

On Tue Jan 20, 2026 at 2:57 PM CET, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@list=
s.openembedded.org> On Behalf Of Frederik Br=C3=A6ndstrup via lists.openemb=
edded.org
>> Sent: den 19 januari 2026 13:30
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
>> Subject: [oe] [PATCH v3] glaze: add recipe
>>=20
>> ---
>>  meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/glaze/glaze_7.0.1.bb
>>=20
>> diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/reci=
pes-support/glaze/glaze_7.0.1.bb
>> new file mode 100644
>> index 0000000000..6526b1d8a3
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION =3D "Extremely fast, in memory, JSON and reflection library=
 for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
>> +HOMEPAGE =3D "https://stephenberry.github.io/glaze/"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4d29875d83fbbf50485c846dbb=
bed8"
>> +
>> +SRC_URI =3D "git://github.com/stephenberry/glaze;protocol=3Dhttps;branc=
h=3Dmain;tag=3Dv${PV}"
>> +
>> +SRCREV =3D "a4af950700b8af2659f0d4a37a18a1b9c5300593"
>> +
>> +inherit cmake
>> +
>> +EXTRA_OECMAKE =3D "-Dglaze_BUILD_EXAMPLES=3DOFF -DBUILD_TESTING=3DOFF -=
Dglaze_ENABLE_FUZZING=3DOFF"
>> +
>> --
>
> We use the following recipe for glaze:
>
> SUMMARY =3D "Header-only C++23 JSON library with compile time reflection"
> HOMEPAGE =3D "https://github.com/stephenberry/glaze"
>
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea4d29875d83fbbf50485c846dbbbe=
d8"
>
> SRCREV =3D "a4af950700b8af2659f0d4a37a18a1b9c5300593"
>
> SRC_URI =3D "git://github.com/stephenberry/glaze;protocol=3Dhttps;branch=
=3Dmain"

Should we add the `;tag=3Dv${PV}` here?

>
> inherit cmake
>
> EXTRA_OECMAKE +=3D "-Dglaze_BUILD_EXAMPLES=3DOFF -Dglaze_DEVELOPER_MODE=
=3DOFF"
>
> do_install:append() {
>     install -d ${D}${datadir}/cmake/${BPN}
>     mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${BPN}
>     rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
> }
>
> # Glaze is a header-only C++ library, so the main package will be empty.
> ALLOW_EMPTY:${PN} =3D "1"
>
> BBCLASSEXTEND =3D "native"
>
> I believe there a some pieces that you may want to pick up.
>
> //Peter

/Frede

