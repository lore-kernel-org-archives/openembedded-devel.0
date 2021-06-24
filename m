Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.7411.1624540742346932659
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 06:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hcQ7krTU;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id hz1so9525380ejc.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DwZxf72bUsj3Re9M7EKrrzawU8Epaouc29w6f0Ndqjc=;
        b=hcQ7krTUcTq2bjc7XQHLTfPwbAZa3cK13lizxqmcxAFeRjtbLlriNH4s65dbbjfwTE
         t2QD8m0RRrKJ7uJOdsHzuca5FRpFeP1dWuCM0L/AWob0dU9BJiGdDbZI4gl2Q94y4PVL
         rSXsdx6gWfiG5jEkTFMRpL4JstiVLI9ZqWzHgc1J8V+wGXx3aF73x/qb+B0VTBlOqJ+n
         TBywxcjknzrH0JyhSf3AaIyFcA0QfYr8ClOuQggxlauuODDrPqAxl2JEuzAvqa6K1CmS
         pHhTHQXIrYwOIokwykT/kQhNSXEYVyrcBnGrSbbf8qLjU5txwC9Y2IYP3xQc6uRJDr+B
         nLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DwZxf72bUsj3Re9M7EKrrzawU8Epaouc29w6f0Ndqjc=;
        b=B7nOMCGbEHhCC+JDF9uUBdWospoeYbcGrFjqC+UVsaIE+7h80Ce5PMvaBNTdqDhzp8
         N4PHSXVKzvkfd3rQgZgxxEb9LGcsLHRYfHMCIBVB4mLGe0q52UgjLKtd3cF58h4XX62m
         klQX3bOpdQx7tIInsZnT9WsUIuZFZnG7AJz0yje9TwOVileNI6RjeHv2o2/Kj1crvxWE
         QkKEdtdZc4jV69xcanXg2qHhGkWe+HfEHyzmTQvvqJ++imu4d3Z1/l5a4X1HFoezWlHy
         B7JkO9jP4MlGz5gZPqm1YKz4uvOSR/isQSmJeIl+p0f0DeVn9JwSKkSCBP9M5x+Zo6RQ
         ML6A==
X-Gm-Message-State: AOAM533jLSaOHX8sUT86+AirCE3tdMgVotsr7FHnt5bnEVmsh+1hByMh
	im9+FbnvWsXEgQUIvPP23+/lKlMQdbmzQfjaVHs=
X-Google-Smtp-Source: ABdhPJx05063uk68dfYVRNZe4xAO/mwviunq30+ESqdb0pN3+BMTajDIKWw4Xu68f7NwWLrlk0kCFGXhhh5ZQlSwcLY=
X-Received: by 2002:a17:906:c2d9:: with SMTP id ch25mr5276945ejb.127.1624540740683;
 Thu, 24 Jun 2021 06:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210604014438.33958-1-kai.kang@windriver.com>
 <CA+chaQf3SGiUJSg57umnwTQ8gMtAmrFLTSsTw=xeB2GYzaRSpQ@mail.gmail.com>
 <b47a52f7-6946-9be0-a22c-8526047215a5@windriver.com> <CA+chaQcxyMhVhHrnfEJjp0iKcrT7EpLUdy0E3vM5xRDHiiqADg@mail.gmail.com>
In-Reply-To: <CA+chaQcxyMhVhHrnfEJjp0iKcrT7EpLUdy0E3vM5xRDHiiqADg@mail.gmail.com>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Thu, 24 Jun 2021 15:18:49 +0200
Message-ID: <CAAQYJAvmimK2nEvTJfMpLvepV7MuYgar42Fo4Fc8uoY+fM6qUQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] layers: set LAYERSERIES_COMPAT with honister
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Kai <kai.kang@windriver.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 7, 2021 at 10:21 AM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> Then I believe layer index should be fixed to support longer values, the=
re are layers which are compatible with multiple releases and it works fine=
 with bitbake/oe-core, layer index parsing shouldn't be more strict than th=
e mechanism which is using these variables.
>
Hi,
I agree with Martin, we have examples of compatibility since sumo, we
will surely split but this is an unreasonable limit.
A.A.


> On Fri, Jun 4, 2021 at 11:26 AM Kai <kai.kang@windriver.com> wrote:
>>
>> On 6/4/21 4:52 PM, Martin Jansa wrote:
>>
>> On Fri, Jun 4, 2021 at 3:44 AM kai <kai.kang@windriver.com> wrote:
>>>
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> Set LAYERSERIES_COMPAT with 'honister' which align with oe-core.
>>>
>>
>> I think it's bad practice to claim honister support this early in its d=
evelopment cycle. It won't happen with well-maintained layers like meta-oe,=
 but if some less frequently updated layer sets the compatibility with honi=
ster now and then doesn't get necessary updates to stay compatible with hon=
ister in next 4 months, then whole purpose of LAYERSERIES_COMPAT will get b=
roken just by claiming the compatibility too soon (without even knowing wha=
t final honister will contain).
>>
>> Changing it after release freeze in oe-core seems much better time to d=
o it.
>>
>> The same does apply on the meta-qt5 PR you've sent today https://github=
.com/meta-qt5/meta-qt5/pull/416/commits
>>
>> Cheers,
>>
>> Got it. Thanks very much.
>>
>> I've comment on the meta-qt5 PR that too long strings in LAYERSERIES_CO=
MPAT will cause layer index complains:
>>
>> WARNING: YPCompatibleVersion.name: dunfell gatesgarth hardknott: length=
 28 exceeds maximum (25), truncating
>>
>> So what is policy to keep old codenames in LAYERSERIES_COMPAT? Is  that=
 ok to keep latest 2(hardknott and honister), please?
>>
>> Regards,
>>
>> --
>> Kai Kang
>> Wind River Linux
>
>
>=20
>
